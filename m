Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0DEC98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zzuA/Ik+y7+qX0NRsKipWQayPJsMUVHYeOuiUEpvWM=; b=u85NRKOVlqPiSOS9qcpcX0Wecw
	sptMe2/YvyzWYxwmmF1ZRwrnRFqAiiYAikNQNPIyxhD3MNlxObCVwhYzgM+wKpbzFGUy/nfn6xD5K
	wb2eFRADG1PHLJCO1Xqzif0PA2pNjqfSd//w+q+zFRIlyqYHD7gao4d7JTaspe92EJjk+wvP7U2+Q
	2fVRVpOWo96cWRh0tr21F6+9ZayRwtsSz9E2kndR3J6+K9sET0tOUjJVUYubxPgMtTccAloAhl5Sl
	U0m1pIigjvk5pMTql24RQTySOUaFGedTBM7NAOJvMaEIIIpm8aidC2BbV8gj/NPfbJfrYULeuMOe2
	6p6Re15A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9doo-0000000AH8i-0QXP;
	Thu, 24 Sep 2026 07:24:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9doY-0000000AGxw-1iHD;
	Thu, 24 Sep 2026 07:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790234656;
	bh=N/TxoDWtrODdxPgFFO47Jk5UcUQTz+ySRsrSGsPKRlI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VnxABTFVlA4YnGIvqUjd8q90x1FzyXRC+mHbu2Ttzw1HpteuipzybenpwggZIzKg1
	 ArFJvS1ecXr9lF27cJcnmTXvLuTqr/eYH9dTmZ+RD4OyTyRUA/oFBDL8xmsga7NKG4
	 PP0Hb3uXY0pQxRm+97dVk6d2LaMuChES+P7+kWx3LC6nbGKlkK5XLwXwniji3pB4Ed
	 sVdD1VvATZ4bdjSXyd4z4m7SfFoYhP6dfIAkgUXWtVHh4OpNyFirc7Jz446RkUb2MH
	 WNlBs78OF5eQdtFYbEm3ztBfvqB9vkOvF+PWAVbucxjFEwbZ25mcBZESljpV3IzKTT
	 d4VhQA6XyYktQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA02817E0A68;
	Thu, 24 Sep 2026 09:24:15 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 24 Sep 2026 09:23:26 +0200
Subject: [PATCH net-next v2 3/7] net: stmmac: mediatek: add RX/TX delay
 stage divider in platform data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dwmac-mediatek-mt8189-v2-3-430bd74d5ef9@collabora.com>
References: <20260924-dwmac-mediatek-mt8189-v2-0-430bd74d5ef9@collabora.com>
In-Reply-To: <20260924-dwmac-mediatek-mt8189-v2-0-430bd74d5ef9@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790234653; l=2318;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=N/TxoDWtrODdxPgFFO47Jk5UcUQTz+ySRsrSGsPKRlI=;
 b=Uvn2opnW8bviX5JUagsn1W0mPrjlD74fIq07puFeIxjKwReWoTQEAA40ESXR4RpPa79eRNf96
 YZhmbj6lcH4ATPcVdYDF6JjO2+olezj4P5nsxH5cRYiIizvl8WFynHH
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_002418_601629_1D2756E8 
X-CRM114-Status: GOOD (  13.74  )
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

In preparation of newer SoC support, that have like MT8189 SoC
different RX and TX internal delay stage steps than MT8188/MT8195, add
the RX and TX delay stage divider values in the variant platform data
and replace the hardcoded value use in mt8195_set_delay.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index f7eb85110df0..1c532cc3a975 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -100,6 +100,8 @@ struct mediatek_dwmac_variant {
 
 	u32 rx_delay_max;
 	u32 tx_delay_max;
+	u16 rx_delay_stage_div;
+	u16 tx_delay_stage_div;
 	u8 dma_bit_mask;
 };
 
@@ -300,13 +302,25 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 
 static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 {
+	u16 rx_delay_stage_div = plat->variant->rx_delay_stage_div;
+	u16 tx_delay_stage_div = plat->variant->tx_delay_stage_div;
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
-	u32 rx_delay_stage_val = mac_delay->rx_delay / MT8195_DLY_RXC_STAGE_DIV;
-	u32 tx_delay_stage_val = mac_delay->tx_delay / MT8195_DLY_TXC_STAGE_DIV;
+	u32 rx_delay_stage_val;
+	u32 tx_delay_stage_val;
 	u32 gtxc_delay_val = 0;
 	u32 rmii_delay_val = 0;
 	u32 delay_val = 0;
 
+	if (rx_delay_stage_div)
+		rx_delay_stage_val = mac_delay->rx_delay / rx_delay_stage_div;
+	else
+		rx_delay_stage_val = 0;
+
+	if (tx_delay_stage_div)
+		tx_delay_stage_val = mac_delay->tx_delay / tx_delay_stage_div;
+	else
+		tx_delay_stage_val = 0;
+
 	switch (plat->phy_mode) {
 	case PHY_INTERFACE_MODE_MII:
 		delay_val |= FIELD_PREP(MT8195_DLY_TXC_ENABLE,
@@ -415,6 +429,8 @@ static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.num_clks = ARRAY_SIZE(mt8195_dwmac_clk_l),
 	.rx_delay_max = MT8195_DLY_RXC_MAX,
 	.tx_delay_max = MT8195_DLY_TXC_MAX,
+	.rx_delay_stage_div = MT8195_DLY_RXC_STAGE_DIV,
+	.tx_delay_stage_div = MT8195_DLY_TXC_STAGE_DIV,
 	.dma_bit_mask = 35,
 };
 

-- 
2.55.0


