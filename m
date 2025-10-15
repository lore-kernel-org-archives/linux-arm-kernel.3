Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7076BCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqVyCHwNxVuNM2kdqvatbWowOCeSLrfZXdQwABGj4n8=; b=B1w8WMUNwP0Rnkb5AKFoxLHqPc
	JFDxN/bcdMQ+56wS7hjatD6Fp7nxF3vYiP7anCOikrTFBm/1wud/F9ZwjB/jefWhWzZqIW5MLzdUJ
	qy9WYtJ0/Gs8FT2vdeEPLCWHIuGS4j/EnnTsRDZjkJK4kp9ffmapJqET/t/EaUAa80yvBGCbb2vPe
	JHQxlqHS2qpKlF/QNrO5h4fVVKIBiXEjfaG9wiTkZEqiDOEZEP9ZddN07wGm4VX5iHbwiHPngRYTP
	4KDH76w50q33fYBSCD24ksgiKAkdSLYFkpZHwvUcnO7HpDW1/ZjIi9mF+K/x9pSbfOsZE05PXbi9z
	M3/89RYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93cq-0000000288S-1AA3;
	Wed, 15 Oct 2025 15:41:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93ck-0000000283j-1FYM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 15:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B698C4A3A3;
	Wed, 15 Oct 2025 15:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97B6AC19423;
	Wed, 15 Oct 2025 15:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760542869;
	bh=FhJohleAF66JXf154AOmPBA84Xh/YtcCnfugNuoKdV0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cEsBohtV0Yl7ZXOgo27FHVFeC/Dfn0Qyc1Lup9Lf0g5Ssn2ai8/ZeA2EQYvFpSRvS
	 jBHF5a7AvDQdnSttubU0AGfWA8BPNs16swhQKhIhh6nkTPVWDnUGreEO/IH2XreHLa
	 dvEpHIOkLwkPS7G/546UZMFNNOkAP6xOsIHgWOYXVc4eF0FkeIa7uSZInZVQtpjR7+
	 Ty8njjq7XAnFQvo5WbEcbc189vmlwjsiXdEYx3X+RecUl1roogH/VUySSlaNYA13R6
	 i+CKpyeie94U8VGStiDznGlg9PVNQyf7vp5LZFCmrZaKGey6nSaI88uHDUUPuH5K2Q
	 ArMcbrrVArs8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90528CCD194;
	Wed, 15 Oct 2025 15:41:09 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Wed, 15 Oct 2025 15:40:44 +0000
Subject: [PATCH usb-next v2 4/5] usb: dwc3: glue: Allow more fine grained
 control over mode switches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-b4-aplpe-dwc3-v2-4-cbd65a2d511a@kernel.org>
References: <20251015-b4-aplpe-dwc3-v2-0-cbd65a2d511a@kernel.org>
In-Reply-To: <20251015-b4-aplpe-dwc3-v2-0-cbd65a2d511a@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9776; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=FhJohleAF66JXf154AOmPBA84Xh/YtcCnfugNuoKdV0=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8b7AxMNnbVmyE/5/VzOcE1C9JW/fWemNS1KO9SRbVeVd
 XrzsW3nOkpZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATua7L8IfjqGCljbMMf8ln
 RlVjjc5vwY+yHLj4V4XOKLXYct8tupbhn0pJpyTfW52Gd7XumvteLrNwZhX7ceWhkY7X4Q9eUR/
 mcgAA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_084110_387130_7C7FD753 
X-CRM114-Status: GOOD (  23.07  )
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

We need fine grained control over mode switched on the DWC3 controller
present on Apple Silicon. Export core, host and gadget init and exit,
ptrcap and susphy control functions. Also introduce an additional
parameter to probe_data that allows to skip the final initialization
step that would bring up host or gadget mode.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/dwc3/core.c   |  16 +++++--
 drivers/usb/dwc3/gadget.c |   2 +
 drivers/usb/dwc3/glue.h   | 116 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/host.c   |   2 +
 4 files changed, 131 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c5076580616e81c79b2da65a271f5b75e76c90e8..96f85eada047949e752776c671b030a1f32da1a2 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -132,6 +132,7 @@ void dwc3_enable_susphy(struct dwc3 *dwc, bool enable)
 		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(i), reg);
 	}
 }
+EXPORT_SYMBOL_GPL(dwc3_enable_susphy);
 
 void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 {
@@ -158,6 +159,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 	dwc->current_dr_role = mode;
 	trace_dwc3_set_prtcap(mode);
 }
+EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
 
 static void __dwc3_set_mode(struct work_struct *work)
 {
@@ -975,7 +977,7 @@ static void dwc3_clk_disable(struct dwc3 *dwc)
 	clk_disable_unprepare(dwc->bus_clk);
 }
 
-static void dwc3_core_exit(struct dwc3 *dwc)
+void dwc3_core_exit(struct dwc3 *dwc)
 {
 	dwc3_event_buffers_cleanup(dwc);
 	dwc3_phy_power_off(dwc);
@@ -983,6 +985,7 @@ static void dwc3_core_exit(struct dwc3 *dwc)
 	dwc3_clk_disable(dwc);
 	reset_control_assert(dwc->reset);
 }
+EXPORT_SYMBOL_GPL(dwc3_core_exit);
 
 static bool dwc3_core_is_valid(struct dwc3 *dwc)
 {
@@ -1328,7 +1331,7 @@ static void dwc3_config_threshold(struct dwc3 *dwc)
  *
  * Returns 0 on success otherwise negative errno.
  */
-static int dwc3_core_init(struct dwc3 *dwc)
+int dwc3_core_init(struct dwc3 *dwc)
 {
 	unsigned int		hw_mode;
 	u32			reg;
@@ -1528,6 +1531,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_core_init);
 
 static int dwc3_core_get_phy(struct dwc3 *dwc)
 {
@@ -2306,9 +2310,11 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 	dwc3_check_params(dwc);
 	dwc3_debugfs_init(dwc);
 
-	ret = dwc3_core_init_mode(dwc);
-	if (ret)
-		goto err_exit_debugfs;
+	if (!data->skip_core_init_mode) {
+		ret = dwc3_core_init_mode(dwc);
+		if (ret)
+			goto err_exit_debugfs;
+	}
 
 	pm_runtime_put(dev);
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 6f18b4840a25d176abb4134581ad0ce68ba19ffc..1f67fb6aead5725c2e7b553c635eab985c9e1d48 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4810,6 +4810,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 err0:
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_gadget_init);
 
 /* -------------------------------------------------------------------------- */
 
@@ -4828,6 +4829,7 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
 	dma_free_coherent(dwc->sysdev, sizeof(*dwc->ep0_trb) * 2,
 			  dwc->ep0_trb, dwc->ep0_trb_addr);
 }
+EXPORT_SYMBOL_GPL(dwc3_gadget_exit);
 
 int dwc3_gadget_suspend(struct dwc3 *dwc)
 {
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index bef4d9d68558f130f36a9088d7bb3b1220e4c048..df86e14cb706ca509206677f644da2a7225b1b26 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -27,12 +27,15 @@ struct dwc3_properties {
  * @res: resource for the DWC3 core mmio region
  * @ignore_clocks_and_resets: clocks and resets defined for the device should
  *		be ignored by the DWC3 core, as they are managed by the glue
+ * @skip_core_init_mode: Skip the finial initialization of the target mode, as
+ *		it must be managed by the glue
  * @properties: dwc3 software manage properties
  */
 struct dwc3_probe_data {
 	struct dwc3 *dwc;
 	struct resource *res;
 	bool ignore_clocks_and_resets;
+	bool skip_core_init_mode;
 	struct dwc3_properties properties;
 };
 
@@ -74,4 +77,117 @@ int dwc3_pm_resume(struct dwc3 *dwc);
 void dwc3_pm_complete(struct dwc3 *dwc);
 int dwc3_pm_prepare(struct dwc3 *dwc);
 
+
+/* All of the following functions must only be used with skip_core_init_mode */
+
+/**
+ * dwc3_core_init - Initialize DWC3 core hardware
+ * @dwc: Pointer to DWC3 controller context
+ *
+ * Configures and initializes the core hardware, usually done by dwc3_core_probe.
+ * This function is provided for platforms that use skip_core_init_mode and need
+ * to finalize the core initialization after some platform-specific setup.
+ * It must only be called when using skip_core_init_mode and before
+ * dwc3_host_init or dwc3_gadget_init.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int dwc3_core_init(struct dwc3 *dwc);
+
+/**
+ * dwc3_core_exit - Shut down DWC3 core hardware
+ * @dwc: Pointer to DWC3 controller context
+ *
+ * Disables and cleans up the core hardware state. This is usually handled
+ * internally by dwc3 and must only be called when using skip_core_init_mode
+ * and only after dwc3_core_init. Afterwards, dwc3_core_init may be called
+ * again.
+ */
+void dwc3_core_exit(struct dwc3 *dwc);
+
+/**
+ * dwc3_host_init - Initialize host mode operation
+ * @dwc: Pointer to DWC3 controller context
+ *
+ * Initializes the controller for USB host mode operation, usually done by
+ * dwc3_core_probe or from within the dwc3 USB role switch callback.
+ * This function is provided for platforms that use skip_core_init_mode and need
+ * to finalize the host initialization after some platform-specific setup.
+ * It must not be called before dwc3_core_init or when skip_core_init_mode is
+ * not used. It must also not be called when gadget or host mode has already
+ * been initialized.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int dwc3_host_init(struct dwc3 *dwc);
+
+/**
+ * dwc3_host_exit - Shut down host mode operation
+ * @dwc: Pointer to DWC3 controller context
+ *
+ * Disables and cleans up host mode resources, usually done by
+ * the dwc3 USB role switch callback before switching controller mode.
+ * It must only be called when skip_core_init_mode is used and only after
+ * dwc3_host_init.
+ */
+void dwc3_host_exit(struct dwc3 *dwc);
+
+/**
+ * dwc3_gadget_init - Initialize gadget mode operation
+ * @dwc: Pointer to DWC3 controller context
+ *
+ * Initializes the controller for USB gadget mode operation, usually done by
+ * dwc3_core_probe or from within the dwc3 USB role switch callback. This
+ * function is provided for platforms that use skip_core_init_mode and need to
+ * finalize the gadget initialization after some platform-specific setup.
+ * It must not be called before dwc3_core_init or when skip_core_init_mode is
+ * not used. It must also not be called when gadget or host mode has already
+ * been initialized.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int dwc3_gadget_init(struct dwc3 *dwc);
+
+/**
+ * dwc3_gadget_exit - Shut down gadget mode operation
+ * @dwc: Pointer to DWC3 controller context
+ *
+ * Disables and cleans up gadget mode resources, usually done by
+ * the dwc3 USB role switch callback before switching controller mode.
+ * It must only be called when skip_core_init_mode is used and only after
+ * dwc3_gadget_init.
+ */
+void dwc3_gadget_exit(struct dwc3 *dwc);
+
+/**
+ * dwc3_enable_susphy - Control SUSPHY status for all USB ports
+ * @dwc: Pointer to DWC3 controller context
+ * @enable: True to enable SUSPHY, false to disable
+ *
+ * Enables or disables the USB3 PHY SUSPEND and USB2 PHY SUSPHY feature for
+ * all available ports.
+ * This is usually handled by the dwc3 core code and should only be used
+ * when skip_core_init_mode is used and the glue layer needs to manage SUSPHY
+ * settings itself, e.g., due to platform-specific requirements during mode
+ * switches.
+ */
+void dwc3_enable_susphy(struct dwc3 *dwc, bool enable);
+
+/**
+ * dwc3_set_prtcap - Set the USB controller PRTCAP mode
+ * @dwc: Pointer to DWC3 controller context
+ * @mode: Target mode, must be one of DWC3_GCTL_PRTCAP_{HOST,DEVICE,OTG}
+ * @ignore_susphy: If true, skip disabling the SUSPHY and keep the current state
+ *
+ * Updates PRTCAP of the controller and current_dr_role inside the dwc3
+ * structure. For DRD controllers, this also disables SUSPHY unless explicitly
+ * told to skip via the ignore_susphy parameter.
+ *
+ * This is usually handled by the dwc3 core code and should only be used
+ * when skip_core_init_mode is used and the glue layer needs to manage mode
+ * transitions itself due to platform-specific requirements. It must be called
+ * with the correct mode before calling dwc3_host_init or dwc3_gadget_init.
+ */
+void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy);
+
 #endif
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index e77fd86d09cf0a36161c20ad3c83f10e67099775..cf6512ed17a69134e6ca1b884f76c1439693fab1 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -220,6 +220,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 	platform_device_put(xhci);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc3_host_init);
 
 void dwc3_host_exit(struct dwc3 *dwc)
 {
@@ -230,3 +231,4 @@ void dwc3_host_exit(struct dwc3 *dwc)
 	platform_device_unregister(dwc->xhci);
 	dwc->xhci = NULL;
 }
+EXPORT_SYMBOL_GPL(dwc3_host_exit);

-- 
2.34.1



