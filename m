Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8980FD44C5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 14:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cl/D6Y5XRR/X0rVkaamOrKMkHf4HUkXbmNOec8DxBHw=; b=UzXjyR3P2p2SEjTf7Hk0pipuzg
	Kplo3EVD6gwIkY4IdEdVJbY/H8e71tAHJRvlYkmeKPPi0xDvwNH+mXmcZBXLtafTcH36yYqS2oenD
	6COftokoqI5xfiwTVtBmxZss3eKYhLpXF0H8cPngErj7gyGKhAdDN5/kWKjT2Z1w94TqjxtEG+DRY
	G5ki5zBeXKmffnhkbeLM0qPXMSROaL0I+EKVvKj7lYkyrRxczA90iMuh8jWb1k7ASgjby2ur0N748
	gVV0r5JSNKEB+dMxrCVMCrPZvzFitc3VULXzBQpYMcN/DYVUkMRh+g9VZD93ygsYz9P3OuBcvZmOm
	Y2u2PsTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOkp-0000000CXy6-1o4m;
	Thu, 15 Jan 2026 14:55:19 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOkn-0000000CXOB-09el
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 14:55:19 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768488745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cl/D6Y5XRR/X0rVkaamOrKMkHf4HUkXbmNOec8DxBHw=;
	b=xrENCad4vW3ND5AXKrKq00Hm/S2mXOTqE3I5/NOiiGCGlsmgflNe55U+hMK51pjBwGf/gT
	v1ZTeg4J6zWWOIf+ZDeO8fV8R2vMNWtn7VaBd9Y89Y90FFibiglAttnkl79Aa1Nv4dhtjv
	ABZjA8gRuKfqnOQx4nXtRZbiwCGINQE=
From: Sean Anderson <sean.anderson@linux.dev>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Neal Frager <neal.frager@amd.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2] usb: dwc3: Always deassert xilinx resets
Date: Thu, 15 Jan 2026 09:51:53 -0500
Message-Id: <20260115145153.3332570-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_065517_438217_A12009F6 
X-CRM114-Status: GOOD (  20.98  )
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

I am working on moving serdes initialization to the phy (and consumer)
drivers to improve flexibility and boot times (depending on configuration).
Currently, core resets are released in the bootloader by init_serdes() in
psu_init_gpl.c. In order to remove init_serdes, we need to handle the case
where the bootloader never released the core resets. If we don't have a
usb3 phy we don't need to assert the core resets, but deassert them anyway
to handle this case.

We could assert all resets every boot, but I believe the existing procedure
is an optimization to reduce boot time when the bootloader has already
initialized USB. So this patch preserves the separate code paths.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---

Changes in v2:
- Update commit message

 drivers/usb/dwc3/dwc3-xilinx.c | 67 ++++++++++++++++------------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 0a8c47876ff9..f41b0da5e89d 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -132,21 +132,6 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 		goto err;
 	}
 
-	/*
-	 * The following core resets are not required unless a USB3 PHY
-	 * is used, and the subsequent register settings are not required
-	 * unless a core reset is performed (they should be set properly
-	 * by the first-stage boot loader, but may be reverted by a core
-	 * reset). They may also break the configuration if USB3 is actually
-	 * in use but the usb3-phy entry is missing from the device tree.
-	 * Therefore, skip these operations in this case.
-	 */
-	if (!priv_data->usb3_phy) {
-		/* Deselect the PIPE Clock Select bit in FPD PIPE Clock register */
-		writel(PIPE_CLK_DESELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
-		goto skip_usb3_phy;
-	}
-
 	crst = devm_reset_control_get_exclusive(dev, "usb_crst");
 	if (IS_ERR(crst)) {
 		ret = PTR_ERR(crst);
@@ -171,22 +156,31 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 		goto err;
 	}
 
-	ret = reset_control_assert(crst);
-	if (ret < 0) {
-		dev_err(dev, "Failed to assert core reset\n");
-		goto err;
-	}
+	/*
+	 * Asserting the core resets is not required unless a USB3 PHY is used.
+	 * They may also break the configuration if USB3 is actually in use but
+	 * the usb3-phy entry is missing from the device tree. Therefore, skip
+	 * a full reset cycle and just deassert the resets if the phy is
+	 * absent.
+	 */
+	if (priv_data->usb3_phy) {
+		ret = reset_control_assert(crst);
+		if (ret < 0) {
+			dev_err(dev, "Failed to assert core reset\n");
+			goto err;
+		}
 
-	ret = reset_control_assert(hibrst);
-	if (ret < 0) {
-		dev_err(dev, "Failed to assert hibernation reset\n");
-		goto err;
-	}
+		ret = reset_control_assert(hibrst);
+		if (ret < 0) {
+			dev_err(dev, "Failed to assert hibernation reset\n");
+			goto err;
+		}
 
-	ret = reset_control_assert(apbrst);
-	if (ret < 0) {
-		dev_err(dev, "Failed to assert APB reset\n");
-		goto err;
+		ret = reset_control_assert(apbrst);
+		if (ret < 0) {
+			dev_err(dev, "Failed to assert APB reset\n");
+			goto err;
+		}
 	}
 
 	ret = phy_init(priv_data->usb3_phy);
@@ -201,11 +195,15 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 		goto err;
 	}
 
-	/* Set PIPE Power Present signal in FPD Power Present Register*/
-	writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
-
-	/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
-	writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
+	if (priv_data->usb3_phy) {
+		/* Set PIPE Power Present signal in FPD Power Present Register*/
+		writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
+		/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
+		writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
+	} else {
+		/* Deselect the PIPE Clock Select bit in FPD PIPE Clock register */
+		writel(PIPE_CLK_DESELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
+	}
 
 	ret = reset_control_deassert(crst);
 	if (ret < 0) {
@@ -225,7 +223,6 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 		goto err;
 	}
 
-skip_usb3_phy:
 	/* ulpi reset via gpio-modepin or gpio-framework driver */
 	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(reset_gpio)) {
-- 
2.35.1.1320.gc452695387.dirty


