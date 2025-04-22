Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9964EC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDkLAWQRNpsJfzFfKZyPr4d1GbMEnucSMGS/IOzfTCU=; b=InyRU/qTE6nu0ARH3h7AG0BraC
	ZAtRMZ+6nMyEUQ3axx3/3cgORLDFbVM10avUvZ1MCeHSft1HhKtsy47VJR+HStKVxPZh4eJmoIPc+
	GZaElb85IiW9PkDyJiA81DSsB9D3q1bq5a8PBrUJsuXDbRzuiOTRd2o7kKzU4zD4J+kJy8EVM32EA
	TCzwe1GhdjIQJdoJT1me5X6EFQ0UbQMDB0CalBCcNLZJfgpCxBMK6/QfB7vyzOzFvmVDfVDdm7nVD
	powMo+o+Xg47SGDb8pweH34yYe1fPHCXeHNulaI7Hkxn4L1YpiVDXlsLd0SIvMqJziNyyaXtKPNVx
	8ZscHiUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EWE-00000007TNK-0G0p;
	Tue, 22 Apr 2025 14:22:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DIp-00000007EBm-3qAJ;
	Tue, 22 Apr 2025 13:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745327082;
	bh=VicifB7VK+9MAEZJZiYpDrTf/SXS78yQinhMpvll6nE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eLIK4u4fy9xYuK2GLzl0Xy+K9/gX1SpsRVVlDTSJYRg0MWkwAV0LKDaPATkupHB40
	 R2ZHe9J5EhbfTeshuJrqqYa6Br052zAwP1qWG4ktMUahvzGAYNOdbCTg8xjPJYDsbv
	 lWnzPdKO9/MZxHyL3vpPzrZ0pgybMvyg2OwSB4cVAFUxTEGmimr5fbeIdc1YDGYhr+
	 j6S00hVbZCfgexsd1BFiRBFimnUpbi7NzqUg3Zz6+v92I+wcV6wvbA1ZX692XjQ08Q
	 YPeOfbHw2jDGR9wZ+rHmszhRyXGZ248Npw97uMD5flnTo5vht9qDFToVxTtD7ZXKHz
	 vuO3b8klEqdSA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 445C717E35E8;
	Tue, 22 Apr 2025 15:04:41 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 22 Apr 2025 15:03:39 +0200
Subject: [PATCH 2/2] net: ethernet: mtk-star-emac: rearm interrupts in
 rx_poll only when advised
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-mtk_star_emac-fix-spinlock-recursion-issue-v1-2-1e94ea430360@collabora.com>
References: <20250422-mtk_star_emac-fix-spinlock-recursion-issue-v1-0-1e94ea430360@collabora.com>
In-Reply-To: <20250422-mtk_star_emac-fix-spinlock-recursion-issue-v1-0-1e94ea430360@collabora.com>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Yinghua Pan <ot_yinghua.pan@mediatek.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745327078; l=1312;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=VicifB7VK+9MAEZJZiYpDrTf/SXS78yQinhMpvll6nE=;
 b=h+C8WOIsNCCwo9YNFF/mpsmLgIGPv9dYOw9qMsKPfUUl7/JCKwmHtEcr/3tBvI+PgqUYsYk/W
 ucvmmuAEK3HCs2K/PKTAdMxINxC4OYISaELdqnXTRFhUv87KCtqQF8P
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_060444_108550_AB6E125F 
X-CRM114-Status: GOOD (  12.07  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

In mtk_star_rx_poll function, on event processing completion, the
mtk_star_emac driver calls napi_complete_done but ignores its return
code and enable RX DMA interrupts inconditionally. This return code
gives the info if a device should avoid rearming its interrupts or not,
so fix this behaviour by taking it into account.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 41d6af31027f4d827dbfdfecdb7de44326bb3de1..b0ffe9b926c3d8dfaea3e11accae6d01e3ea2c4a 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1348,8 +1348,7 @@ static int mtk_star_rx_poll(struct napi_struct *napi, int budget)
 	priv = container_of(napi, struct mtk_star_priv, rx_napi);
 
 	work_done = mtk_star_rx(priv, budget);
-	if (work_done < budget) {
-		napi_complete_done(napi, work_done);
+	if (work_done < budget && napi_complete_done(napi, work_done)) {
 		spin_lock_irqsave(&priv->lock, flags);
 		mtk_star_enable_dma_irq(priv, true, false);
 		spin_unlock_irqrestore(&priv->lock, flags);

-- 
2.49.0


