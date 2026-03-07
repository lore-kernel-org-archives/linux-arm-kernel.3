Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6270CFC9EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqOZqsxLjH0KcEVHYX5tZr7X5AxIS8B6ZxX6dP1JQCw=; b=AHnF5iX0L98z2MS4gn6m2x6BM+
	E117jQbarawqe+KRbUxcuNow/scc7/AG++edufoiigkTlPW1ORZvUJNMVTzABdSzTblxkZ4UjjOnY
	B7ScLmbKRhU3jkgVX9G4mMrVivzZw3deVgxMSvjcnPPTfHQzkg5wCn4j1UanDEAxgsVOR2dMNczZP
	tQHjKblN06Wzwgyp2MO9oOb+u14X3d+smGUbQ6Acx7cGa+EpGBgeVdPgEzSxtK2sWlwDfCUDmFapi
	nRmJ0Tl+731o2vQ3rQeYOwWikG5bA6WZN9IsWcT9j8x4Ln4y3mbZ+H7Gcah+Rk84GsEbg5sAGCYrk
	6oDq26fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypRf-000000058jx-080H;
	Sat, 07 Mar 2026 11:03:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypRZ-000000058fj-26IL;
	Sat, 07 Mar 2026 11:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BqOZqsxLjH0KcEVHYX5tZr7X5AxIS8B6ZxX6dP1JQCw=; b=Pzfudn6a7l/b8b55HtmX9pEEih
	Mm0EokPAzs21rn5GpwfEqyg+bkcaM0srV1B051bJvN22YLKwMZM8OpOf1bXvUq26Gp0cIVgM+8oCv
	IseY7/JPYNXrQGSCckcwRf8RoT5F1ExAdR6eA2pKeWJPjg76QPv7FYtbWc9WBBjWMtGE9Ec6WLJbG
	PXOzTfi6mWwbB8T5mgiWUPDxklQMpZQsbqeHxfNsJai1rKH4KFBmrpy7tG3RlfNbE9rft+YnxNJH/
	cTAHyRyv03tPJZDELId1i5UpKPAl8NcYIllDgg70rcCuiwQIeeVld+97qXwulgsiPu8VPDJh6fjiu
	wdxHY1uw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48778 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vypR4-0000000028j-08id;
	Sat, 07 Mar 2026 11:03:08 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vypQy-0000000CSwP-28Y9;
	Sat, 07 Mar 2026 11:03:00 +0000
In-Reply-To: <aawFuXTVAgVOrw4k@shell.armlinux.org.uk>
References: <aawFuXTVAgVOrw4k@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Yao Zi <me@ziyao.cc>
Subject: [PATCH net-next 5/7] net: stmmac: use u8 for host_dma_width and
 similar struct members
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vypQy-0000000CSwP-28Y9@rmk-PC.armlinux.org.uk>
Date: Sat, 07 Mar 2026 11:03:00 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_030337_541158_A88D5541 
X-CRM114-Status: GOOD (  12.40  )
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

We aren't going to see >= 256-bit address busses soon, so reduce
host_dma_width and associated other struct members that initialise
this from u8 to u32.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 include/linux/stmmac.h                                  | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 9f5a15b81f8a..9d1bd72ffb73 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -42,8 +42,8 @@
 struct imx_priv_data;
 
 struct imx_dwmac_ops {
-	u32 addr_width;
 	u32 flags;
+	u8 addr_width;
 	bool mac_rgmii_txclk_auto_adj;
 
 	int (*fix_soc_reset)(struct stmmac_priv *priv);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index a139db6a8cbb..30ae0dba7fff 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -93,9 +93,9 @@ struct mediatek_dwmac_variant {
 	const char * const *clk_list;
 	int num_clks;
 
-	u32 dma_bit_mask;
 	u32 rx_delay_max;
 	u32 tx_delay_max;
+	u8 dma_bit_mask;
 };
 
 /* list of clocks required for mac */
@@ -268,9 +268,9 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
 		.dwmac_set_delay = mt2712_set_delay,
 		.clk_list = mt2712_dwmac_clk_l,
 		.num_clks = ARRAY_SIZE(mt2712_dwmac_clk_l),
-		.dma_bit_mask = 33,
 		.rx_delay_max = 17600,
 		.tx_delay_max = 17600,
+		.dma_bit_mask = 33,
 };
 
 static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
@@ -418,9 +418,9 @@ static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.dwmac_set_delay = mt8195_set_delay,
 	.clk_list = mt8195_dwmac_clk_l,
 	.num_clks = ARRAY_SIZE(mt8195_dwmac_clk_l),
-	.dma_bit_mask = 35,
 	.rx_delay_max = 9280,
 	.tx_delay_max = 9280,
+	.dma_bit_mask = 35,
 };
 
 static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 388e9fdeb86c..3ccf20fdf52a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,8 +91,8 @@ struct ethqos_emac_driver_data {
 	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
+	u8 dma_addr_width;
 	const char *link_clk_name;
-	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 03fd85060a73..11886189bf51 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -243,7 +243,7 @@ struct plat_stmmacenet_data {
 	int unicast_filter_entries;
 	int tx_fifo_size;
 	int rx_fifo_size;
-	u32 host_dma_width;
+	u8 host_dma_width;
 	u8 rx_queues_to_use;
 	u8 tx_queues_to_use;
 	u8 rx_sched_algorithm;
-- 
2.47.3


