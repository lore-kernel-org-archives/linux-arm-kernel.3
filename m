Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9887AC98324
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJzd0LKEzHLehrBQJyeu7/EYASGXnEd4/UF72Q6oKr4=; b=JWzsc73eT/3ERh2q+3bi4WWQh8
	S7jvvCgnSq+YW6Q2ERkrEhuE3jYqJzN6VNPWDvKSnkQ2e2IwYezWI2UTuZ1scRZ+ld+TDP8P0tijx
	QQ2JTJBHN7l7jcY1mEIBqyIgTE4rOwup9ZKbGCWE/Rar+lqM41EHUq7sZy/K5W8s4fL6EucqEKXXu
	TvqCfP/PL6GKBJRosoWV5Li3UgCmm/fdzxydbh89oROi8Q8AMr8yhmPSCdTSixmjYiJNSXpYXd5TD
	itriTFM+z1TgeubdXTgt3gw0QY3rYD51eJ/DSUzvHq3FnGJuodLjwLBBRbLlIMA4GHUxUk5Zz+shC
	2/lU/uvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAjTP-0000000G6xe-3h4t;
	Sun, 27 Sep 2026 07:38:59 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAjTI-0000000G6vj-0JjL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 07:38:53 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so12097155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 00:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790494730; x=1791099530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJzd0LKEzHLehrBQJyeu7/EYASGXnEd4/UF72Q6oKr4=;
        b=Ax+gLUC04I1gpgtihbU/ElTWsusMvylXlQ+e031TwgBdcgcvSN+ozl5HvB13gdSgsy
         zaDU5Q0xYwu/vQhGmMdG5Wbp4F+NDXPLO008S0UKEnneMFTaG6IEnZuS+xuzkevjSIOh
         lARblZ6yt3Wfo3ZboURIPrz5NV0q3+5MrFGTypPRwU1+NKwVkTsubCjY/5I65bRgQuCE
         CJNYtXQL5gmPfxfVlmAgQHDNp+YRCAhiXKVWM3Bvx2v7cuz1MB9BNmxOdEb1lSm9Y/rl
         NGye2C5GVwGoe7MyjRGMgi0xhRCn7uMJTNlRsKtKV6aBd7AxGSyHNCOsa7X7Lcd0HB1J
         +VNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790494730; x=1791099530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJzd0LKEzHLehrBQJyeu7/EYASGXnEd4/UF72Q6oKr4=;
        b=K3LFKe9AsmV5r5faaLJxK/6kZMRAwWTO3Xr3NaDhLiDrgM9tz94AkHVpXWtU34BTYx
         rj2PPz93H1Ous1W0rVPygXc6sbH3sMtVpcA6VAO1LramX/nLsSSStUTww5eYhAstU9rY
         bL1EWp5SrW3rpZjBL4A+PnHypJOCBWkmGaM2zc/ab4oTBkc1Gg2IqyjX2V5aEooZolGs
         aj/SKOKeczM2n7a/n91pFrRUhZ1TrSLEXSKtLtYJVHd+CoT+QesFwx31EB9AWqwl8b1D
         Ps0Et64SmntAJOR/SQsbTpx+Iy/wY1fqXje/jwy5LPszhjLd9nBS6zafY1PgWo+wcjMw
         PRqw==
X-Forwarded-Encrypted: i=1; AKwUvBzXcy05ZYfWkyaMSr+1VdyOBapHYdAZ9Z5l7KQm8PYLV7luWdsj7qetNFXkm3ZhugQKmcf5qc+J09jE4Q2iXLou@lists.infradead.org
X-Gm-Message-State: AFuF++lvtShmdaBIH3bhvQ0xLmn20e07+EZIZ4jpzPFjVnyiVL5Ck+cF
	D70dMFfr8DZLFfA3RVbZDGzgFk0L67v5y1jm0UbIhz4jlSQEKv9/LOY/
X-Gm-Gg: AYBFou38jxYEUveByTlCpdlRBqiZkUZmaslloomi+RDVCSzWEWUOHiVFvKx9Opt0kte
	cRr1QHfeVnfXUnRmHCk1Clqu8mI/IzZ+TvbEwyYYHJ0RyROR95mZmZQW0HZU+MW5IlRl3ESMQEw
	tvPCxNu7jNceuhqB94tc3ZdSdH0M/JZ3kz2O69anc2BmFFsuqLQhHyr0Cro1UEQyaicjOX9H+xp
	u1UbNeJ4WrCixJZALPWYP9RnbKfBIXue0SLLz7w6M82C6chwFZaJzLugeKkPbjjDn/FDKqVaZR1
	59grin8WGmLJAAEVwl7CNr3Eo9NKtzpqhZA4Af02F3hbvt5/RxJo4dLCL96vrdZs2J/mldT8H0X
	Ymab9mC/ZldDB9fPpUzqDHsahxQgLGeIzUeH2KDUXcM7Oo+qo308pH6n45sPmwFctI2+sHB4IzA
	7Vev8zmVx10b24Fft4oeZlkymIfH1vAToHovTFQtnaZSxYWMUeFxfMjuwoT7Ef2b54TrAiVqqSZ
	XTImH4cXhi8tEht1/G1gI+mpyLdwdq0lhUNz0OW8Q==
X-Received: by 2002:a05:600c:3b12:b0:49f:ce73:5e95 with SMTP id 5b1f17b1804b1-49fe670cacdmr176623005e9.35.1790494730079;
        Sun, 27 Sep 2026 00:38:50 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35607bsm17210652f8f.16.2026.09.27.00.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:38:49 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next 1/2] net: axienet: use device_property and fwnode APIs for probe-time config
Date: Sun, 27 Sep 2026 10:38:42 +0300
Message-ID: <20260927073843.346910-2-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260927073843.346910-1-maimon.sagi@gmail.com>
References: <20260927073843.346910-1-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_003852_174051_0D0A40FD 
X-CRM114-Status: GOOD (  24.39  )
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

axienet_probe() reads its configuration exclusively through the of_*
API, so the driver can only be instantiated from a device tree node.

The ADVA TimeCard X2 is a PCIe timing card, driven by ptp_ocp, whose
FPGA contains an AXI Ethernet MAC with an AXI DMA engine.  ptp_ocp is
going to register the MAC as a child platform device described by a
software node, so that this driver runs it rather than a copy in
ptp_ocp.  That needs the probe-time configuration to be readable from a
software node.

The of_property_read_*(), of_get_phy_mode(), of_get_mac_address() and
phylink_of_phy_connect() calls used here all have fwnode-based
equivalents that resolve identically for a DT-backed device, and
additionally work for a device described by a software node.

Convert them.  On a device tree this is a no-op: device_property_*()
dispatches to the of_* implementation when dev->fwnode is an OF node,
and device_get_phy_mode()/device_get_mac_address() are thin fwnode
wrappers around the same lookups.  device_get_mac_address() also keeps
the "mac-address" nvmem cell fallback that of_get_mac_address() has.

Note that device_get_phy_mode() returns the mode as a positive value
rather than through an out parameter, so the error test changes from
"if (ret)" to "if (ret < 0)".

Not everything is converted.  The "axistream-connected" lookup stays on
the OF API because its result is passed to of_address_to_resource(),
which has no fwnode counterpart.  The "pcs-handle" and "phy-handle"
lookups could use fwnode_find_reference() and fwnode_mdio_find_device(),
but they refer to MDIO devices that only a device tree describes - the
bus axienet_mdio_setup() registers goes through of_mdiobus_register() -
so converting them would not let a caller without a device tree use
them.  Such a caller takes neither branch: it gets its DMA registers
from its own platform resources, and it cannot use the SGMII and
1000BASE-X modes, which need a PCS.

No functional change intended.

Tested on the X2 with a local ptp_ocp change, with CONFIG_OF disabled
and enabled: the interface probes with its configuration read from the
software node and passes traffic.  No device tree board was available,
so the claim that this is a no-op for device tree users rests on the
dispatch described above.

Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 782f903d318f..cfef8ad75909 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -33,6 +33,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/skbuff.h>
 #include <linux/math64.h>
 #include <linux/phy.h>
@@ -1671,7 +1672,7 @@ static int axienet_open(struct net_device *ndev)
 	ret = axienet_device_reset(ndev);
 	axienet_unlock_mii(lp);
 
-	ret = phylink_of_phy_connect(lp->phylink, lp->dev->of_node, 0);
+	ret = phylink_fwnode_phy_connect(lp->phylink, dev_fwnode(lp->dev), 0);
 	if (ret) {
 		dev_err(lp->dev, "phylink_of_phy_connect() failed: %d\n", ret);
 		return ret;
@@ -2864,7 +2865,7 @@ static int axienet_probe(struct platform_device *pdev)
 	if (axienet_ior(lp, XAE_ABILITY_OFFSET) & XAE_ABILITY_STATS)
 		lp->features |= XAE_FEATURE_STATS;
 
-	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,txcsum", &value);
+	ret = device_property_read_u32(&pdev->dev, "xlnx,txcsum", &value);
 	if (!ret) {
 		switch (value) {
 		case 1:
@@ -2879,7 +2880,7 @@ static int axienet_probe(struct platform_device *pdev)
 			break;
 		}
 	}
-	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,rxcsum", &value);
+	ret = device_property_read_u32(&pdev->dev, "xlnx,rxcsum", &value);
 	if (!ret) {
 		switch (value) {
 		case 1:
@@ -2898,16 +2899,16 @@ static int axienet_probe(struct platform_device *pdev)
 	 * Here we check for memory allocated for Rx/Tx in the hardware from
 	 * the device-tree and accordingly set flags.
 	 */
-	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,rxmem", &lp->rxmem);
+	ret = device_property_read_u32(&pdev->dev, "xlnx,rxmem", &lp->rxmem);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "failed to read xlnx,rxmem property\n");
 
-	lp->switch_x_sgmii = of_property_read_bool(pdev->dev.of_node,
-						   "xlnx,switch-x-sgmii");
+	lp->switch_x_sgmii = device_property_read_bool(&pdev->dev,
+						       "xlnx,switch-x-sgmii");
 
 	/* Start with the proprietary, and broken phy_type */
-	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,phy-type", &value);
+	ret = device_property_read_u32(&pdev->dev, "xlnx,phy-type", &value);
 	if (!ret) {
 		netdev_warn(ndev, "Please upgrade your device tree binary blob to use phy-mode");
 		switch (value) {
@@ -2930,9 +2931,10 @@ static int axienet_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 	} else {
-		ret = of_get_phy_mode(pdev->dev.of_node, &lp->phy_mode);
-		if (ret)
+		ret = device_get_phy_mode(&pdev->dev);
+		if (ret < 0)
 			return ret;
+		lp->phy_mode = ret;
 	}
 	if (lp->switch_x_sgmii && lp->phy_mode != PHY_INTERFACE_MODE_SGMII &&
 	    lp->phy_mode != PHY_INTERFACE_MODE_1000BASEX) {
@@ -2940,7 +2942,7 @@ static int axienet_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	if (!of_property_present(pdev->dev.of_node, "dmas")) {
+	if (!device_property_present(&pdev->dev, "dmas")) {
 		/* Find the DMA node, map the DMA registers, and decode the DMA IRQs */
 		np = of_parse_phandle(pdev->dev.of_node, "axistream-connected", 0);
 
@@ -3060,7 +3062,7 @@ static int axienet_probe(struct platform_device *pdev)
 		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
 
 	/* Retrieve the MAC address */
-	ret = of_get_mac_address(pdev->dev.of_node, mac_addr);
+	ret = device_get_mac_address(&pdev->dev, mac_addr);
 	if (!ret) {
 		axienet_set_mac_address(ndev, mac_addr);
 	} else {
-- 
2.47.0


