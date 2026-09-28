Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D38EC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 07:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVqZK+W1DXYcQ0YoEfl36Lg8eRThXM+jLhpeG8h+ECI=; b=Ggb+UUgYid4DNGoNirx9q4Tllg
	GWR1po89r2CmSKIOkxqocyQzDlC6EvSoBjv7kAdySwbqaQVzBQZD8J/Zknxxbc+RzcyTePus3zJ3z
	t8gQ4H9WNPNXzJ66XNXLlLUNU61F26uHgcuMZQExkkSyUjkt5Thmn3+2qpyVcxfA5GUP4QSzmgw5N
	UjGepzeHN45YwpEdKY5aNepivZdxwQchDWwsAxODKepc+WdjKU+C1ZMak+ueNMxRmb4EvV6YGgqsn
	WSFOK1YVswbgnRuon4ZfloYDtR68Hd4+A0eCcbucn1K3ue7/8T9YJkWMEmXGr6WuKPgUU0PFB+6Mi
	9+M+O4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB612-0000000HZR3-3YYB;
	Mon, 28 Sep 2026 07:43:12 +0000
Received: from mail-ej2-x0e.google.com ([2a00:1450:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB60u-0000000HZNq-2ObO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 07:43:05 +0000
Received: by mail-ej2-x0e.google.com with SMTP id a640c23a62f3a-c2bca99f463so116408166b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 00:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790581383; x=1791186183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVqZK+W1DXYcQ0YoEfl36Lg8eRThXM+jLhpeG8h+ECI=;
        b=X0MsaQjFPQpuBK3PCfG3NXLcd1uUyRDjI4+kYsMcUXNea7AcJ1O0r0W0PQMM7Flbce
         slok6lpyHALKbq/4XGQPTEYgHuOinG6ZU7dMOpU/a9w/wNmPSzZJ5d+jgZ64hpmI8qLk
         w0TRbU291xQNr5XG8Eq3dseF8ybAzA+hsZ3/Mm7yw87AHcp/ejLDnGE1qWDCVfdzCMwq
         iS4DJanQzs39pGOmtSjiYSWDHiunVMT2ynvjTAdK1wAmhX5hOrErT63uGZrtPeaQUNV3
         MHkZvRoz45DDnnr0OJSY0ZUYeC9Kkg1nvOZwIBar7ONy6En5pG0XmZQ+f6z2RGbJnOsH
         iiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790581383; x=1791186183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVqZK+W1DXYcQ0YoEfl36Lg8eRThXM+jLhpeG8h+ECI=;
        b=h/0WB98i0E+YXHdbHD4sVfOodhj29EIF2Cb/eXRQH/dw2d0G9w6TzgvCpkjO8dbmbl
         fds7lCRQ8qmNMgP4kwIGAiLHmgJJJdjAGNTItgUmFa9329jjcB7mhgrbb29LTNFc9IcY
         wJ+IT3oI2+S+a2gw1avn9MoRoIpJPlYEoMaJuCga4hqfLaIIHVSc+MtRfKDh8REi7+dY
         5Nq8J7qnNR+vwxZjYPMmK+u/7myH26vay4KRto5/x00DA5of9WoS9YY6LVBDCWlOkfSv
         T1jrJRYj9/eTQl+kgFCmrQiq/l6fxVUyYOtZl8DUP0x0G3Tx70fnoiYUjyu8VAsLbjoB
         b5+g==
X-Forwarded-Encrypted: i=1; AKwUvBzjimj+INxXoBdsAJvXDosyWmWVVJ6vjUt9qGGwxaNI5wt15wfGkY/xRY/RvywoivtO8mj72M3MgFSrH2jLkDNG@lists.infradead.org
X-Gm-Message-State: AFuF++k2/N8bOPY/dve+OKbKKSEIC3yoM042G66bWRN+e9bN7nCTvtNE
	er1NRdRLooLBx5eGv92j93hHVaXcuKNmObLERaaHNkhQuEdf/MZ6N6or
X-Gm-Gg: AYBFou1Relk0sFmUpH+XG0f7+IR8ZrA/Anx24sxIHEV52D4Apaw36RLiqcREux96aQE
	bONOgzZL9hmxD/ZMC3VaW6CyO+ypZoxUPj+8UUQu9L3RsjX+3CmIrQHG5Yovt6ug42V7WCv+NeE
	exp6GPISWkNI2CJkVRf115Cyev6aiUnf8FUqlzJfHHmHCUgHbXTIm07qF9PCLLqG+MyuEkR9NRu
	+Xa4WBvq1da8tW7BLsXGAXWJ43cyEPqKzyyI7lpei4DSEkDflTAbO4dcVUJA439QuQBORfUuHUc
	SKDzhYAhnWyfmsvbmqmxDvo6sJMNQ5lXEMwsj2OgSlLCTaOwat2F6/apOCP4Ka8eUYXDmUFR+K2
	5oEysVoJC9RR0mtzQKFbqWDMGhIjhSE/WkevvWCL5zZWfvR3gBJo8em7xL0Tu609+oi0f9yB3/U
	X6a2KD+AHHXSLaro/NK1UB0XamG695wq04cZk8Ghe8htxRgSYkDIAtIkxBVr9EWcT8rO6EYpOax
	FshH6xEJytus9//sh0LiVLP+gvAQcC2rVvIzqo9
X-Received: by 2002:a17:907:6c17:b0:c24:6382:2648 with SMTP id a640c23a62f3a-c2ac21f98famr1081946266b.5.1790581382548;
        Mon, 28 Sep 2026 00:43:02 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae76ac760sm419415166b.39.2026.09.28.00.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:43:02 -0700 (PDT)
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
	richardcochran@gmail.com,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next v2 1/2] net: axienet: use device_property and fwnode APIs for probe-time config
Date: Mon, 28 Sep 2026 10:42:55 +0300
Message-ID: <20260928074256.462345-2-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260928074256.462345-1-maimon.sagi@gmail.com>
References: <20260928074256.462345-1-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_004304_634642_302A4ECC 
X-CRM114-Status: GOOD (  21.02  )
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

Convert only the lookups such a caller needs: "xlnx,rxmem", which probe
requires; "phy-mode"; the MAC address; and the PHY connection, which is
where phylink finds a "fixed-link" child.  On a device tree this is a
no-op: device_property_read_u32() dispatches to the of_* implementation
when dev->fwnode is an OF node, phylink_of_phy_connect() is a wrapper
around phylink_fwnode_phy_connect(), and device_get_phy_mode() and
device_get_mac_address() are thin fwnode wrappers around the same
lookups.  device_get_mac_address() also keeps the "mac-address" nvmem
cell fallback that of_get_mac_address() has.

Note that device_get_phy_mode() returns the mode as a positive value
rather than through an out parameter, so the error test changes from
"if (ret)" to "if (ret < 0)".

Everything else stays on the OF API.  "xlnx,txcsum", "xlnx,rxcsum" and
"xlnx,switch-x-sgmii" are optional, and "xlnx,phy-type" is deprecated in
favour of "phy-mode".  Without an OF node each of those lookups finds
nothing, exactly as for a device tree node that leaves them out: no
checksum offload, no runtime SGMII/1000BASE-X switching and a
fall-through to "phy-mode".  The "dmas" test likewise selects the
built-in AXI DMA engine.  The "axistream-connected", "pcs-handle" and
"phy-handle" phandle lookups stay too: a caller without an OF node takes
neither branch, getting its DMA registers from its own platform
resources, and it cannot use the SGMII and 1000BASE-X modes, which need
a PCS.

No functional change intended.

Tested on the X2 with a local ptp_ocp change, with CONFIG_OF disabled
and enabled: the interface probes with its configuration read from the
software node and passes traffic.  No device tree board was available,
so the claim that this is a no-op for device tree users rests on the
dispatch described above.

Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 782f903d318f..0f2170af9b10 100644
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
@@ -2898,7 +2899,7 @@ static int axienet_probe(struct platform_device *pdev)
 	 * Here we check for memory allocated for Rx/Tx in the hardware from
 	 * the device-tree and accordingly set flags.
 	 */
-	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,rxmem", &lp->rxmem);
+	ret = device_property_read_u32(&pdev->dev, "xlnx,rxmem", &lp->rxmem);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "failed to read xlnx,rxmem property\n");
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


