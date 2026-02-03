Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E01DE7FDFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 00:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuOWsCVIuR/WP5JRTGWbVJdWhDaeD5ZnnFP7ct7wKpA=; b=K5aAXCgZ2QVOXIEJeeAOma6DVu
	+vkb1B6eIcqKFYSFEnkrJLZu2YRJ8XeEml7+tDNT6aVOci3Pk8xq0vdL97GOfPKBBSoNyXYThVKln
	xcnDoZEGo+vt029rTsqY8zE1eeqApPbN5EFCt2k4cQmZ27ZSC+6xb1dR7jXxtQVEoO+W3c1HufE9j
	NKGrj0ga0KTfPbjdSZGD8Q5OLfwLTz1WvVujemFX2r9aB1w2yvKkrlNeHRIHdynIGe3We3TVF0BYl
	moEUrmg6Rei4og6q3wO20p2VgZNCIBlE1mpGm+JPL39E/nl8iG8PjL0XYrVITcUlVDDTwn6PHIcWw
	k+hCuTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4Az-00000005mhH-4Are;
	Tue, 03 Feb 2026 00:21:53 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4Ax-00000005mex-08jm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 00:21:52 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770078107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cuOWsCVIuR/WP5JRTGWbVJdWhDaeD5ZnnFP7ct7wKpA=;
	b=W7r5iL5hkTeQqW8Tiz4WLikSlkj4xcLTE/siInq6WUpr63vnkN3X7yN6abAqkxH0s5s6Ax
	oGrpdEON//phRH0Qy8HTJ5YB7JGd95fAeoarSq3vpBpn/QjbLoxjZderDJpwRRB5z0nPZH
	m+9cFfB2Ofzw3aDCUV7etEuM9laF1T8=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-phy@lists.infradead.org
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-kernel@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: pci: xilinx-nwl: Add resets
Date: Mon,  2 Feb 2026 19:21:21 -0500
Message-Id: <20260203002128.935842-2-sean.anderson@linux.dev>
In-Reply-To: <20260203002128.935842-1-sean.anderson@linux.dev>
References: <20260203002128.935842-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_162151_350232_D2F865AE 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
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

Add resets so we can hold the bridge in reset while we perform phy
calibration.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 .../devicetree/bindings/pci/xlnx,nwl-pcie.yaml  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml b/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml
index 9de3c09efb6e..7efb3dd9955f 100644
--- a/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml
@@ -69,6 +69,18 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 3
+
+  reset-names:
+    items:
+      - description: APB register block reset
+        const: cfg
+      - description: AXI-PCIe bridge reset
+        const: bridge
+      - description: PCIe MAC reset
+        const: ctrl
+
   iommus:
     maxItems: 1
 
@@ -117,6 +129,7 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/phy/phy.h>
     #include <dt-bindings/power/xlnx-zynqmp-power.h>
+    #include <dt-bindings/reset/xlnx-zynqmp-resets.h>
     soc {
         #address-cells = <2>;
         #size-cells = <2>;
@@ -146,6 +159,10 @@ examples:
             msi-parent = <&nwl_pcie>;
             phys = <&psgtr 0 PHY_TYPE_PCIE 0 0>;
             power-domains = <&zynqmp_firmware PD_PCIE>;
+            resets = <&zynqmp_reset ZYNQMP_RESET_PCIE_CFG>,
+                     <&zynqmp_reset ZYNQMP_RESET_PCIE_BRIDGE>,
+                     <&zynqmp_reset ZYNQMP_RESET_PCIE_CTRL>;
+            reset-names = "cfg", "bridge", "ctrl";
             iommus = <&smmu 0x4d0>;
             pcie_intc: legacy-interrupt-controller {
                 interrupt-controller;
-- 
2.35.1.1320.gc452695387.dirty


