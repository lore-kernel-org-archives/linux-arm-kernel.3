Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CF8E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 13:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7F2VCMRHnmOEG742CkT68y3WT49ozhiasZGpsHZSJ4=; b=2MCasn7X8wZs22ipEfd0arw/O5
	l96LfNDkFzfYEpUuYDMEcwxj3HYXWFYJ+sGbHkuHEoyxabN7uDSMYQbf8nOtWz3qvSHKLsEAVNL2l
	QyV4c3eMWBdspi/B0N46E51zhn0ZvsiuEdAPqH0kylQ2+bUnFQmD6RFpHdbRolzxr70Tnf/apLHIm
	sMbWJDDGQ3heEDwErc1DpTASW1m2Gk6u3fO2YG0azwgJlETpAxZ5tWoMqIAxzcoKcK3AewX6+wXAA
	9OZZIhzCSoLnBrNgYyHHjrP8wljOBPtn4Of/6n8eXUSqaEKsiUAHWSkljEKxVvIqX8TZLrRdDxHqy
	aklJtF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM5yP-00000003rwS-11Gw;
	Fri, 13 Dec 2024 13:44:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM5vB-00000003qnn-27bg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 13:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734097293; x=1765633293;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=VRCtzcr5fMCZAnL9+Vx67vqsVUiy1gw/HSDw3ftdpBA=;
  b=VyW6RCXXRgST8oW7DilbnhIEsezwD1A64Xn0PSUVmT55nG9M4dxA9NXF
   BJwC3naYvcfSRKmejZIWdfAE9CYzrE4sU48+IvnOlpCbVpMaBz8uVSflq
   EvKVaV4V1D62d89GLjvJhtzcrVqOCD5VZwn4O197+bgfydNFXnKth2Hsr
   FPtBVgs0Da+ez30dzshpfycm2EKZPUs7l54UW+5rMN++DU5LI1KqhYK2j
   QAZWUtvtt+V6hHsDQjIp76QNkpQFZyAaQPQ2Ri0RNsqzKW9F7SiNZAcVa
   UmZknvsri4xte7VJ2sZspM7dAQ+6Qt4bh+M75zoSvwJ49HOgVrWBhKWmd
   Q==;
X-CSE-ConnectionGUID: +Dz6lc3EQgqK8+CPf2Bkrw==
X-CSE-MsgGUID: wOtDlEUfS0WJh2h1cEmbuw==
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="202965472"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Dec 2024 06:41:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 13 Dec 2024 06:41:26 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 13 Dec 2024 06:41:23 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 13 Dec 2024 14:41:02 +0100
Subject: [PATCH net-next v4 3/9] net: sparx5: use is_port_rgmii()
 throughout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241213-sparx5-lan969x-switch-driver-4-v4-3-d1a72c9c4714@microchip.com>
References: <20241213-sparx5-lan969x-switch-driver-4-v4-0-d1a72c9c4714@microchip.com>
In-Reply-To: <20241213-sparx5-lan969x-switch-driver-4-v4-0-d1a72c9c4714@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<robert.marko@sartura.hr>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_054133_617106_64B34F20 
X-CRM114-Status: GOOD (  18.26  )
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

Now that we can check if a given port is an RGMII port, use it in the
following cases:

 - To set RGMII PHY modes for RGMII port devices.

 - To avoid checking for a SerDes node in the devicetree, when the port
   is an RGMII port.

 - To bail out of sparx5_port_init() when the common configuration is
   done.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_main.c    | 28 +++++++++++++++-------
 .../net/ethernet/microchip/sparx5/sparx5_port.c    |  3 +++
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 4be717ba7d37..e68277c38adc 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -313,10 +313,13 @@ static int sparx5_create_port(struct sparx5 *sparx5,
 			      struct initial_port_config *config)
 {
 	struct sparx5_port *spx5_port;
+	const struct sparx5_ops *ops;
 	struct net_device *ndev;
 	struct phylink *phylink;
 	int err;
 
+	ops = sparx5->data->ops;
+
 	ndev = sparx5_create_netdev(sparx5, config->portno);
 	if (IS_ERR(ndev)) {
 		dev_err(sparx5->dev, "Could not create net device: %02u\n",
@@ -357,6 +360,9 @@ static int sparx5_create_port(struct sparx5 *sparx5,
 		MAC_SYM_PAUSE | MAC_10 | MAC_100 | MAC_1000FD |
 		MAC_2500FD | MAC_5000FD | MAC_10000FD | MAC_25000FD;
 
+	if (ops->is_port_rgmii(spx5_port->portno))
+		phy_interface_set_rgmii(spx5_port->phylink_config.supported_interfaces);
+
 	__set_bit(PHY_INTERFACE_MODE_SGMII,
 		  spx5_port->phylink_config.supported_interfaces);
 	__set_bit(PHY_INTERFACE_MODE_QSGMII,
@@ -830,6 +836,7 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 	struct initial_port_config *configs, *config;
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *ports, *portnp;
+	const struct sparx5_ops *ops;
 	struct reset_control *reset;
 	struct sparx5 *sparx5;
 	int idx = 0, err = 0;
@@ -851,6 +858,7 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	regs = sparx5->data->regs;
+	ops = sparx5->data->ops;
 
 	/* Do switch core reset if available */
 	reset = devm_reset_control_get_optional_shared(&pdev->dev, "switch");
@@ -880,7 +888,7 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 
 	for_each_available_child_of_node(ports, portnp) {
 		struct sparx5_port_config *conf;
-		struct phy *serdes;
+		struct phy *serdes = NULL;
 		u32 portno;
 
 		err = of_property_read_u32(portnp, "reg", &portno);
@@ -910,13 +918,17 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 			conf->sd_sgpio = ~0;
 		else
 			sparx5->sd_sgpio_remapping = true;
-		serdes = devm_of_phy_get(sparx5->dev, portnp, NULL);
-		if (IS_ERR(serdes)) {
-			err = dev_err_probe(sparx5->dev, PTR_ERR(serdes),
-					    "port %u: missing serdes\n",
-					    portno);
-			of_node_put(portnp);
-			goto cleanup_config;
+		/* There is no SerDes node for RGMII ports. */
+		if (!ops->is_port_rgmii(portno)) {
+			serdes = devm_of_phy_get(sparx5->dev, portnp, NULL);
+			if (IS_ERR(serdes)) {
+				err = dev_err_probe(sparx5->dev,
+						    PTR_ERR(serdes),
+						    "port %u: missing serdes\n",
+						    portno);
+				of_node_put(portnp);
+				goto cleanup_config;
+			}
 		}
 		config->portno = portno;
 		config->node = portnp;
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
index f39bf4878e11..996dc4343019 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
@@ -1090,6 +1090,9 @@ int sparx5_port_init(struct sparx5 *sparx5,
 		 ANA_CL_FILTER_CTRL_FILTER_SMAC_MC_DIS,
 		 sparx5, ANA_CL_FILTER_CTRL(port->portno));
 
+	if (ops->is_port_rgmii(port->portno))
+		return 0; /* RGMII device - nothing more to configure */
+
 	/* Configure MAC vlan awareness */
 	err = sparx5_port_max_tags_set(sparx5, port);
 	if (err)

-- 
2.34.1


