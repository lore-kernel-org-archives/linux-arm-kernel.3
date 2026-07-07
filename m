Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E251CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QD+ujfezD4Dleh3rKBX84tKYNRj7YlzwVIdQMC0INHo=; b=eogF04rT6wi+vrbbIPtJVWvj6q
	WwDxRFHZr1DLF7HKATO7PgFzxaKiJcSjUS/deg5JhOGdiJJMRtnDFi7DVksAR0HVMfh4ZVH8ksNse
	rfkZ3qjwcHG2use5hvWdDsHT1pdr2eKof6UpH7XydBO3Y4sN+LYU10TCaBEA9DhUXg83sClWNXYdz
	TcPRsxGy6xnEeDkhHW28EsZL5dLe4NN0ejbzp9CyDohmdnPYz22FwFapxtbriTI5umhl05/1q3wFi
	KVgMLUJvEHUpyzo5dU/1V3Brf5PpWAcLz1FlvjNi8w9/xanEr/clay3V+4ExLJ6uYKKfU2A9BWOZo
	mg6KZeiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh13v-0000000ES66-0yW4;
	Tue, 07 Jul 2026 08:21:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh13n-0000000ERxf-1skR;
	Tue, 07 Jul 2026 08:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783412501;
	bh=KLoyhladejZwag7Oc8NASnTdTZWyep443gM8lpfjMck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZihbO5xuWnROe/iFMijiFg5AjBA6+EHIH98vWSA/uGkwwcBxz+ewy2BZDHac9uAMs
	 9LT0BUKmMU+2554CstLQnCo9B7g9VPk/JN6YSwA5BVC8D9wLWEPvZruLGOmsRRorxH
	 DlMunPqiuHl7OdWU9s/I9NiSV0CNRYTQRqRp4QQ+SHNY2VF9Y/cnTJRY3XfGTsa2FD
	 8FhZNg0mjmQ0etpb9A8uAz/IsJV96Fu9kY+baUo2wT8GCO6isDOSOe9KT6Rpg8L7io
	 x3ivOZ67/M2ErE0ot3s73aIX5Lc3rPdNJxmj4NgZqGWBR/Jjte7PRItjXpKgVEAhJz
	 gBOMV97e0lafw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A4B317E0FD0;
	Tue, 07 Jul 2026 10:21:40 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 07 Jul 2026 10:21:23 +0200
Subject: [PATCH net-next 5/6] net: stmmac: mediatek: add support for TX
 deallocation adjustment feature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dwmac-mediatek-mt8189-v1-5-17f345eaaca3@collabora.com>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
In-Reply-To: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: maxime.chevallier@bootlin.com, rmk+kernel@armlinux.org.uk, 
 kernel@collabora.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783412493; l=3068;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=KLoyhladejZwag7Oc8NASnTdTZWyep443gM8lpfjMck=;
 b=rYDH1k4qqZavWOEuPdvowUc/+WZvhIhsF7JkDbjG/He606di+QhEkFX8U4MRI7ZTScJ3JTE1m
 TvJs9RvLmHUBfzahx6b4AyEUmD4/uTI3RRcUyL6RNmbW1pWOovvYZiq
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_012144_107553_02E413F3 
X-CRM114-Status: GOOD (  15.00  )
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

The MT8189 SoC has in the Ethernet control 0 register from the
peripheral configuration (pericfg) additional bits to adjust the TX
deallocation.

In preparation of MT8189 SoC support, add its definition, use in the
set_delay_v2 callback, and a support flag in the platform data.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index bcc0baef3f71..6b0a42b5839f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -37,7 +37,8 @@
 #define ETH_FINE_DLY_RXC	BIT(0)
 
 /* Peri Configuration register for mt8189 */
-#define MT8189_CTRL0_TXC_OUT_OP		BIT(20)
+#define MT8189_CTRL0_TXC_OUT_OP			BIT(20)
+#define MT8189_CTRL0_DLY_GTXC_STAGE_FINE	GENMASK(11, 6)
 
 /* Peri Configuration register for mt8195 */
 #define MT8195_PERI_ETH_CTRL_BASE	0xFD0
@@ -103,6 +104,7 @@ struct mediatek_dwmac_variant {
 	u32 peri_eth_ctrl_offset;
 	u8 dma_bit_mask;
 	bool use_out_op;
+	bool use_stage_fine;
 };
 
 /* list of clocks required for mac */
@@ -326,9 +328,12 @@ static void delay_stage2ps_v2(struct mediatek_dwmac_plat_data *plat)
 
 static int set_delay_v2(struct mediatek_dwmac_plat_data *plat)
 {
-	u32 gtxc_delay_val = 0, delay_val = 0, rmii_delay_val = 0;
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
 	u32 reg_offset = plat->variant->peri_eth_ctrl_offset;
+	u32 gtxc_delay_mask = 0;
+	u32 gtxc_delay_val = 0;
+	u32 rmii_delay_val = 0;
+	u32 delay_val = 0;
 
 	delay_ps2stage_v2(plat);
 
@@ -402,6 +407,9 @@ static int set_delay_v2(struct mediatek_dwmac_plat_data *plat)
 		gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_STAGES, mac_delay->tx_delay);
 		gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_INV, mac_delay->tx_inv);
 
+		if (plat->variant->use_stage_fine)
+			gtxc_delay_val |= MT8189_CTRL0_DLY_GTXC_STAGE_FINE;
+
 		delay_val |= FIELD_PREP(MT8195_DLY_RXC_ENABLE, !!mac_delay->rx_delay);
 		delay_val |= FIELD_PREP(MT8195_DLY_RXC_STAGES, mac_delay->rx_delay);
 		delay_val |= FIELD_PREP(MT8195_DLY_RXC_INV, mac_delay->rx_inv);
@@ -412,12 +420,17 @@ static int set_delay_v2(struct mediatek_dwmac_plat_data *plat)
 		return -EINVAL;
 	}
 
+	gtxc_delay_mask = MT8195_RGMII_TXC_PHASE_CTRL |
+			  MT8195_DLY_GTXC_INV |
+			  MT8195_DLY_GTXC_ENABLE |
+			  MT8195_DLY_GTXC_STAGES;
+
+	if (plat->variant->use_stage_fine)
+		gtxc_delay_mask |= MT8189_CTRL0_DLY_GTXC_STAGE_FINE;
+
 	regmap_update_bits(plat->peri_regmap,
 			   reg_offset + MT8195_PERI_ETH_CTRL0,
-			   MT8195_RGMII_TXC_PHASE_CTRL |
-			   MT8195_DLY_GTXC_INV |
-			   MT8195_DLY_GTXC_ENABLE |
-			   MT8195_DLY_GTXC_STAGES,
+			   gtxc_delay_mask,
 			   gtxc_delay_val);
 	regmap_write(plat->peri_regmap,
 		     reg_offset + MT8195_PERI_ETH_CTRL1,

-- 
2.55.0


