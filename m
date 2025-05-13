Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4575CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 04:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Drc/Re4Tx82hmlCIEK6uQx9Q4CHxaqRoQh1t/dl3kYM=; b=aTuUXeNjCcz6r1pZt+rJ3tlfyN
	Jfd5jGiCInZ6Uu8is32ZOCh6436iVE8NjkjStSQTHuZAae452t0SqX6EauTY7Fe7i3rL5GL1Ij05S
	wpOxlT6iWZc2bilnIAE26C2mpKjln9pCI2dOCWVYb2FCUVH70VDyYKjNNT5155VwVC9oZjC7u17/k
	I9xNfA8efFfxaEPekFfAEgHzkqycGch0ZZkDhQvYDF3843XA81CBrGHmOYr2Z67/jr6uumJmmwwey
	uREtsQO19zlT6Osmf0Hu8LuZZVit8yU9Dj37NUHXOT40l8BQ/P2qBWGWTuhkITPca4QjqrAscaISN
	/a3nGA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEhHG-0000000BJno-3njd;
	Tue, 13 May 2025 04:30:02 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEhFG-0000000BJOJ-2NHr;
	Tue, 13 May 2025 04:27:59 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uEh99-000000002Bx-1IoE;
	Tue, 13 May 2025 04:27:34 +0000
Date: Tue, 13 May 2025 05:27:30 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: ethernet: mtk_eth_soc: fix typo for declaration
 MT7988 ESW capability
Message-ID: <b8b37f409d1280fad9c4d32521e6207f63cd3213.1747110258.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_212758_604409_F0097638 
X-CRM114-Status: GOOD (  11.73  )
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

From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>

Since MTK_ESW_BIT is a bit number rather than a bitmap, it causes
MTK_HAS_CAPS to produce incorrect results. This leads to the ETH
driver not declaring MAC capabilities correctly for the MT7988 ESW.

Fixes: 445eb6448ed3 ("net: ethernet: mtk_eth_soc: add basic support for MT7988 SoC")
Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 22a532695fb0..6c92072b4c28 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4748,7 +4748,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	}
 
 	if (mtk_is_netsys_v3_or_greater(mac->hw) &&
-	    MTK_HAS_CAPS(mac->hw->soc->caps, MTK_ESW_BIT) &&
+	    MTK_HAS_CAPS(mac->hw->soc->caps, MTK_ESW) &&
 	    id == MTK_GMAC1_ID) {
 		mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE |
 						       MAC_SYM_PAUSE |
-- 
2.49.0

