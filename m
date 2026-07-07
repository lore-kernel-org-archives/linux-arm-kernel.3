Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CD7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQp87igVa4M0MUxA2BB6aKIbyWzFWiUeWysnPZhlWK0=; b=EFuVKvoO+obJREyO9bEc0OF9S4
	zoMduqeTt67A9TPbChRUd2aIZLugdC0C77zuVo9LEYq1P8jMiC0LQTlwL7qYUTN4fkRa1iY3H497n
	VaHgsEehgJIjUdVFyRuQMJ4nqFnL1yYQvtV5Qqfp99e507bsXvv+Ega6Smnb7ASINF8LjW8r6rOca
	yXdNSdgsOkY+AP9UNWqAzMizC/8q/GXK+PxMBQ+g0NNzZReNtQW5yUV6//0Wbx9nbDzpdo7C5+k8p
	+8Nk5/ssx8vVa9g7tvwlrKZevNvCKHuEqs/PGsiY2KYXmT4bw/SiHsLw+FVRCvmuJ21Zzxmr78Oh9
	KWCDNJQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh13y-0000000ESAe-3fG5;
	Tue, 07 Jul 2026 08:21:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh13p-0000000ERzy-2rjO;
	Tue, 07 Jul 2026 08:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783412502;
	bh=yRFtRc/8CY6QhoblVADW6T5FZ96+tHK2oCTcPJgNl7s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l8E70hUK27HaAhWyDDUGq83eZrgrzShx19lG+2vENSxAYCqCzqalr5R50+rhvrUnT
	 8sEOutSuePjJdK3n2QAgmawSYWY/kSrAt0gLBgMbwdZLs7jU+t3sWz6ol45KuC6mHr
	 3YfFNO+mNUI95qPth6mISBRA8nt6spOOhqGp12ekoBFVHM2ii6At1qc02EmessXJxu
	 lJKvVqcX9c0/oKSxsB9m1ZXww5cWQME8H8JISMNTpE4q85p04VT1uq6E9bUyFAo7c7
	 XsAIqEYDRwI5ZmCSKShhAtF05HOLWCZ5ldHfKr2wJBiUhFYhLI6zseL4x09SIrmooS
	 XXcsLgPdubBoQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD8D217E1078;
	Tue, 07 Jul 2026 10:21:41 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 07 Jul 2026 10:21:24 +0200
Subject: [PATCH net-next 6/6] net: stmmac: mediatek: add support for MT8189
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dwmac-mediatek-mt8189-v1-6-17f345eaaca3@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783412493; l=2415;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=yRFtRc/8CY6QhoblVADW6T5FZ96+tHK2oCTcPJgNl7s=;
 b=rjmFjCSXIVFAAiwlRsbFDumpnHH5IheY8Gf75lMU0wWH1m9chQHK5CCQ/0CP5zbOLJj/U4I7k
 Vvhz8WTFGu+CtMHY+W5Pz6L89CX8GNvO/mhR0/hOwZiXpIg9gfTve7B
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_012145_880747_33CE33B8 
X-CRM114-Status: GOOD (  13.69  )
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

Like MT8195 SoC, MT8189 SoC uses the Ethernet control registers from
the peripheral configuration (pericfg) but at a different
offset. It also needs additional features.

Thus, add compatible, clock definitions and specific platform data to
support the MT8189 SoC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 6b0a42b5839f..e7e336b1f114 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -37,6 +37,8 @@
 #define ETH_FINE_DLY_RXC	BIT(0)
 
 /* Peri Configuration register for mt8189 */
+#define MT8189_PERI_ETH_CTRL_BASE		0x270
+
 #define MT8189_CTRL0_TXC_OUT_OP			BIT(20)
 #define MT8189_CTRL0_DLY_GTXC_STAGE_FINE	GENMASK(11, 6)
 
@@ -116,6 +118,10 @@ static const char * const mt8195_dwmac_clk_l[] = {
 	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
 };
 
+static const char * const mt8189_dwmac_clk_l[] = {
+	"mac_main", "ptp_ref"
+};
+
 static int set_phy_interface_v1(struct mediatek_dwmac_plat_data *plat,
 				u8 phy_intf_sel)
 {
@@ -444,6 +450,19 @@ static int set_delay_v2(struct mediatek_dwmac_plat_data *plat)
 	return 0;
 }
 
+static const struct mediatek_dwmac_variant mt8189_gmac_variant = {
+	.dwmac_set_phy_interface = set_phy_interface_v2,
+	.dwmac_set_delay = set_delay_v2,
+	.clk_list = mt8189_dwmac_clk_l,
+	.num_clks = ARRAY_SIZE(mt8189_dwmac_clk_l),
+	.dma_bit_mask = 35,
+	.rx_delay_max = 9280,
+	.tx_delay_max = 9280,
+	.peri_eth_ctrl_offset = MT8189_PERI_ETH_CTRL_BASE,
+	.use_out_op = true,
+	.use_stage_fine = true,
+};
+
 static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.dwmac_set_phy_interface = set_phy_interface_v2,
 	.dwmac_set_delay = set_delay_v2,
@@ -694,6 +713,8 @@ static void mediatek_dwmac_remove(struct platform_device *pdev)
 static const struct of_device_id mediatek_dwmac_match[] = {
 	{ .compatible = "mediatek,mt2712-gmac",
 	  .data = &mt2712_gmac_variant },
+	{ .compatible = "mediatek,mt8189-gmac",
+	  .data = &mt8189_gmac_variant },
 	{ .compatible = "mediatek,mt8195-gmac",
 	  .data = &mt8195_gmac_variant },
 	{ }

-- 
2.55.0


