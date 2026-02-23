Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C52CE98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOWokYlxysxFm3xjnehGiJbf7ylIL1Rh5bi686HkNhY=; b=P9LklZIwIuC/LEupA4AvINDuDN
	AK5bJssSu1OBYvMzIkdDpI4H1LtvBPpXXfjDfvFatoDA/6Z8lh+CEOlQeYID/nulXRkh23LA42U6y
	dXukOIOWsxL52Yodj+KUi3LYawD+9RyFUzy7RLPFdpCrjsy0xs5I47NFgxutuqsgh/SuUsahDNDzi
	beMZ+Bc+JxnbTDUaREiCbiIYAtoUEPNKQPXq9x2c400tzE6MmtgznVPAIieaRYLvUW077xmfDqBcL
	DGre2WEgzGQlu6FEcltAXq0Z8KvK2g21zGMgth3/FcvXb55E70rIYQd0b/DlxNoDXwLBmNQ191Feh
	k3r5vj9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSKg-0000000HXki-0MUV;
	Mon, 23 Feb 2026 09:34:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSKe-0000000HXjz-0oxh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yOWokYlxysxFm3xjnehGiJbf7ylIL1Rh5bi686HkNhY=; b=WvyYcdiSy78/oBFRO8hlTCWVDc
	r94yfUhYyXyiw/cGyxhUSRAqeVTiEBfszWKQ3PBwcIT4tgiu/JeZ5oi5gqX+98L9IvjDcDyCINtic
	u2gcJO/bk5eiKBhn00/o1k/PML5+Aq0j9wTw/cedQvGb4p2uQ2VkYmexySiPmu85fgF4QKKGxPGyx
	05zEme9d2b/hZ0WVijjf2XBxfCgJJfkhCin4iBFsxxF3tbAs5aoo2jZzCZClV3JtbsvVNx5YzFW/x
	1H+X03ByhQCe36AfUWT49zLE1+X9C6q+qahz6f4tdSzHm4F+Ql5IE/iST2cBwc9+i1egLTKFsz9jZ
	HUB+1kUA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39730 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuSKW-000000003m2-2TY9;
	Mon, 23 Feb 2026 09:34:16 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuSKV-0000000ASbg-28JK;
	Mon, 23 Feb 2026 09:34:15 +0000
In-Reply-To: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 01/10] net: stmmac: qcom-ethqos: rename "por" members
 to "rgmii_por"
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuSKV-0000000ASbg-28JK@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Feb 2026 09:34:15 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_013424_238983_4CED005D 
X-CRM114-Status: GOOD (  13.80  )
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

Rename the "por" and "num_por" members to indicate that they are for
RGMII mode only as ethqos_configure_rgmii() is the only place that the
values are programmed into the registers.

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index af8204c0e188..690bd5c7e1a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -87,8 +87,8 @@ struct ethqos_emac_por {
 };
 
 struct ethqos_emac_driver_data {
-	const struct ethqos_emac_por *por;
-	unsigned int num_por;
+	const struct ethqos_emac_por *rgmii_por;
+	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	const char *link_clk_name;
@@ -108,8 +108,8 @@ struct qcom_ethqos {
 	int serdes_speed;
 	phy_interface_t phy_mode;
 
-	const struct ethqos_emac_por *por;
-	unsigned int num_por;
+	const struct ethqos_emac_por *rgmii_por;
+	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	bool needs_sgmii_loopback;
@@ -218,8 +218,8 @@ static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 };
 
 static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
-	.por = emac_v2_3_0_por,
-	.num_por = ARRAY_SIZE(emac_v2_3_0_por),
+	.rgmii_por = emac_v2_3_0_por,
+	.num_rgmii_por = ARRAY_SIZE(emac_v2_3_0_por),
 	.rgmii_config_loopback_en = true,
 	.has_emac_ge_3 = false,
 };
@@ -234,8 +234,8 @@ static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 };
 
 static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
-	.por = emac_v2_1_0_por,
-	.num_por = ARRAY_SIZE(emac_v2_1_0_por),
+	.rgmii_por = emac_v2_1_0_por,
+	.num_rgmii_por = ARRAY_SIZE(emac_v2_1_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = false,
 };
@@ -250,8 +250,8 @@ static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 };
 
 static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
-	.por = emac_v3_0_0_por,
-	.num_por = ARRAY_SIZE(emac_v3_0_0_por),
+	.rgmii_por = emac_v3_0_0_por,
+	.num_rgmii_por = ARRAY_SIZE(emac_v3_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
 	.dwmac4_addrs = {
@@ -282,8 +282,8 @@ static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 };
 
 static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
-	.por = emac_v4_0_0_por,
-	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
+	.rgmii_por = emac_v4_0_0_por,
+	.num_rgmii_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
 	.link_clk_name = "phyaux",
@@ -522,9 +522,9 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	u32 val;
 
 	/* Reset to POR values and enable clk */
-	for (i = 0; i < ethqos->num_por; i++)
-		rgmii_writel(ethqos, ethqos->por[i].value,
-			     ethqos->por[i].offset);
+	for (i = 0; i < ethqos->num_rgmii_por; i++)
+		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
+			     ethqos->rgmii_por[i].offset);
 	ethqos_set_func_clk_en(ethqos);
 
 	/* Initialize the DLL first */
@@ -780,8 +780,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = of_device_get_match_data(dev);
-	ethqos->por = data->por;
-	ethqos->num_por = data->num_por;
+	ethqos->rgmii_por = data->rgmii_por;
+	ethqos->num_rgmii_por = data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
 	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
-- 
2.47.3


