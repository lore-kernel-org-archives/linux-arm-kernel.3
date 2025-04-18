Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02623C369D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81MJsMNbogkYe+Rx2MtdDb/7nc44T96h+II7KVTEBl0=; b=p053B3R6b2a1+lnCos/0LAkrLI
	ipvFU2Sl01pERfGD34nnGCsFTcg1ed6+roejXBia8WMXWKaoAYepPo06DIS9EboLIbR7Vsvh8Ty48
	GqZXtFgFsvxTwqDVrCOzpBtGbbNteNtGEh4Ny+rzI4bd4ImsW5nN/taNG5oZQsscvQBmcyIve/sbZ
	GaC1ooMRsdExN982AjpdyVE2EFEPZCEuQUUDDs3YLdNe5u6jknoVhFV533Pr6BmOdZ14pAbIKIB8X
	snbEICGOY/ZZvmV8XaTZ4eKjfxwXtUj3eaYyuDNZJZB6AXhXN+tnBxWJiqAwaUpPLeBcfIoeTLMJz
	8kjCBRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gdR-0000000FXn3-3ugy;
	Fri, 18 Apr 2025 07:59:41 +0000
Received: from mta-65-226.siemens.flowmailer.net ([185.136.65.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gBn-0000000FTdJ-3lHz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:31:09 +0000
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202504180731033ab4ef576fbac4016c
        for <linux-arm-kernel@lists.infradead.org>;
        Fri, 18 Apr 2025 09:31:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=81MJsMNbogkYe+Rx2MtdDb/7nc44T96h+II7KVTEBl0=;
 b=IsWipH/wzFhscWMIqwaXxolbV74wP/+NY7hss/R3C8wsYGt41Hiphe3S7tzd1EJ/pwe9jG
 GsTEZz5Mtv5Iv9mtDwJoxrj3OXcHZK7qq8eLaBaD0rXMOxS3PyberjS4K1ag2nG5uwkL3JhG
 1VJGW/XUT3L/K+PFrZYvYxWbVMrGJypFBwO8z2Q3TIXm6c4y0vXxDGybeiqAlbmFBY3Yi4b2
 ChcqgcTmdNbqqyWVOhoq7uG/ajQr95j8kHJzxg6q43ePGEp1Ndhk4I3vsdg1KdsfPOYe6PF2
 DVzbZo0lapcKtHfs/OMQ5yQa8hpqz+fgrm/D9SDJPpGttz+6+c7yNLug==;
From: huaqian.li@siemens.com
To: helgaas@kernel.org,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Cc: baocheng.su@siemens.com,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diogo.ivo@siemens.com,
	huaqian.li@siemens.com,
	jan.kiszka@siemens.com,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	nm@ti.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	ssantosh@kernel.org,
	vigneshr@ti.com,
	iommu@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 2/8] dt-bindings: PCI: ti,am65: Extend for use with PVU
Date: Fri, 18 Apr 2025 15:30:20 +0800
Message-Id: <20250418073026.2418728-3-huaqian.li@siemens.com>
In-Reply-To: <20250418073026.2418728-1-huaqian.li@siemens.com>
References: <20241030205703.GA1219329@bhelgaas>
 <20250418073026.2418728-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_003108_071869_9BBD04B2 
X-CRM114-Status: GOOD (  12.46  )
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

From: Jan Kiszka <jan.kiszka@siemens.com>

The PVU on the AM65 SoC is capable of restricting DMA from PCIe devices
to specific regions of host memory. Add the optional property
"memory-regions" to point to such regions of memory when PVU is used.

Since the PVU deals with system physical addresses, utilizing the PVU
with PCIe devices also requires setting up the VMAP registers to map the
Requester ID of the PCIe device to the CBA Virtual ID, which in turn is
mapped to the system physical address. Hence, describe the VMAP
registers which are optional unless the PVU shall be used for PCIe.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
---
 .../bindings/pci/ti,am65-pci-host.yaml        | 34 +++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml b/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
index 0a9d10532cc8..7916325e0b39 100644
--- a/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
@@ -20,14 +20,18 @@ properties:
       - ti,keystone-pcie
 
   reg:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   reg-names:
+    minItems: 4
     items:
       - const: app
       - const: dbics
       - const: config
       - const: atu
+      - const: vmap_lp
+      - const: vmap_hp
 
   interrupts:
     maxItems: 1
@@ -69,6 +73,15 @@ properties:
     items:
       pattern: '^pcie-phy[0-1]$'
 
+  memory-region:
+    maxItems: 1
+    description: |
+      phandle to a restricted DMA pool to be used for all devices behind
+      this controller. The regions should be defined according to
+      reserved-memory/shared-dma-pool.yaml.
+      Note that enforcement via the PVU will only be available to
+      ti,am654-pcie-rc devices.
+
 required:
   - compatible
   - reg
@@ -89,6 +102,19 @@ then:
     - power-domains
     - msi-map
     - num-viewport
+    - memory-region
+  properties:
+    reg:
+      minItems: 6
+    reg-names:
+      minItems: 6
+else:
+  properties:
+    reg:
+      maxItems: 4
+
+    reg-names:
+      maxItems: 4
 
 unevaluatedProperties: false
 
@@ -104,8 +130,10 @@ examples:
         reg =  <0x5500000 0x1000>,
                <0x5501000 0x1000>,
                <0x10000000 0x2000>,
-               <0x5506000 0x1000>;
-        reg-names = "app", "dbics", "config", "atu";
+               <0x5506000 0x1000>,
+               <0x2900000 0x1000>,
+               <0x2908000 0x1000>;
+        reg-names = "app", "dbics", "config", "atu", "vmap_lp", "vmap_hp";
         power-domains = <&k3_pds 120 TI_SCI_PD_EXCLUSIVE>;
         #address-cells = <3>;
         #size-cells = <2>;
-- 
2.34.1


