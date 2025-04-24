Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3186C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwsccYOs8XpweMfP9XrYjw7+Hr76yPGkvSua0F/kNyA=; b=NEFWQJO1mfq91RFYxO5BKebUE/
	XQJgQ2BSeE5bwb6ZcXWaJD/EZ/HM1vCGV7UUgQrEage5/Kf/FFZHcMctJWpXgXj5SigutZdelQkaK
	vcBuf89KSene7o8Mk+9Xj+aS+0wMHekavK1IUMm29xfuVvyT5LmLnAKivdMzG/ERjBdU0GDUkJp+P
	oKdwg045QG5C2JPO0m+1mCs2ikL3aAOYjvJ7/tqWfgZj+89IBz3Y3v7/1GcxTPxvfnJ7DuVG6lDbP
	TRKk3D2qYwuu7dQfsZ/AHl5+i26ShyO5+Cqsf2AP+SFM/iLQEfQS23gCqZpZ58/jnbpTlfCVlRsBV
	OyK3wBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tik-0000000DepE-2cbF;
	Thu, 24 Apr 2025 10:22:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s8N-0000000DNNN-09Ki;
	Thu, 24 Apr 2025 08:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745484037;
	bh=ugQ0tZbuUVl+tPGqAtdti5tfLPe5fA3E0Vgs3DqrikU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fZYjIxnS47q+VH6NYF04apROnIEhJhkS9k0VgkbabkklKQ4ufvlZ45j1AEZf+gnlt
	 NYnN3Nhli3jPUuo50W41Nb+drlKFFC4phPEGvcmfDCwgq0k88a0Rt0V7OQaR90ENP4
	 HjsRJAPOuy1cgmFjd9qkZ26UieC8Q0y+O7E8N1dwx5NOPwEjQkkC4TfoKy3sWwTCLq
	 Ny17PXQT7Pd9tnuZnpe0os+RTiDi0IOlDFYWuuriPV1zIJD2hIr17eutNPy3f1JD1q
	 SoPAWY+j/Uh912f2twKS79PcW2vDA3ivUEFxnOVpzMiNrOWdiHdgkX6L2KxvAQ3suK
	 PH6Thld8ONPlg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1BE3317E3610;
	Thu, 24 Apr 2025 10:40:36 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 24 Apr 2025 10:38:49 +0200
Subject: [PATCH net v2 2/2] net: ethernet: mtk-star-emac: rearm interrupts
 in rx_poll only when advised
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-2-f3fde2e529d8@collabora.com>
References: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-0-f3fde2e529d8@collabora.com>
In-Reply-To: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-0-f3fde2e529d8@collabora.com>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Yinghua Pan <ot_yinghua.pan@mediatek.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745484033; l=1378;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=ugQ0tZbuUVl+tPGqAtdti5tfLPe5fA3E0Vgs3DqrikU=;
 b=2+hlGTGLX4IvBZ7LMo2FNCbo3oFL2H2kxu7qLhPFrDccvEuTJxAjMod/qdQ3c3A5HlMBD2F4u
 GHsPaXAAj0vCNg+4VSDcGo0Mk6xifVU44tFqSzxp3vXitubG5ipHv6p
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_014039_224438_50F55FC4 
X-CRM114-Status: GOOD (  11.72  )
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

Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 23115881d8e892a622b34b593cf38e2c8bed4082..b175119a6a7da517f20267fde7b2005d6c0bbadd 100644
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


