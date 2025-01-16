Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05758C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bH78J9VP5ficnGV2dvBvEUQV0y++qVoeHqjErfV0eHE=; b=DeBVqP3U2pQTVRWJlJvTZYMk5G
	YrjDNHCO+ZRJGP4Yd7t/9IR7DfcOZi/aItFfQ3tUg0hPyrvn2juycy9+bu6Jz5TKA5jLyJCXG0teX
	tyWhmnQsPwSi8lsszjbCM5bPmRwRl56Y3Sn7Z6ptq3iw2dvTlsSynPdT/1rCifHE6ViRDuskGvaLU
	1TArVKBltBaogDKwwB8hQFSEhB3K6E0K65pm2Lm652oKQV3n5l8Hr0XBbFw6RJPDq2fPdCS9d1JJ+
	iPk5yFWCksSb8AvKv+mxAMX6Ih2JyGmv0LqJNA2Pf66KMwOn8P5CF93DJ0mXYGQUc1jJfrvWnhljq
	P0jOrfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZMK-0000000GUpu-0W7h;
	Thu, 16 Jan 2025 23:33:08 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZCm-0000000GPiZ-1gwB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:23:17 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.10.66])
	by linux.microsoft.com (Postfix) with ESMTPSA id 00E9220591AB;
	Thu, 16 Jan 2025 15:23:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 00E9220591AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1737069795;
	bh=bH78J9VP5ficnGV2dvBvEUQV0y++qVoeHqjErfV0eHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fsY2vTPsopRlT2ivKJccsz24SyonfDNFDTJtw8mQp86qab/2OYgIJv4cfi6g957io
	 6kNe61Orz/E2fYfbuTokuulXEEB39uGSRqYBGsvA/UiNVIwp3P2tRgIAEJzFSyfSsk
	 sV7wfkaIeEvMZybLUmt51QezKGMG0Gg4b5gfh++w=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: will@kernel.org,
	jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com,
	code@tyhicks.com,
	eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com
Subject: [PATCH 1/3] dt-bindings: iommu: add "arm,smmu-pci-msi-iova-data" property
Date: Thu, 16 Jan 2025 15:23:07 -0800
Message-Id: <20250116232307.1436693-4-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116232307.1436693-1-shyamsaini@linux.microsoft.com>
References: <20250116232307.1436693-1-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_152316_485869_9F70589A 
X-CRM114-Status: GOOD (  12.91  )
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

By default ARM SMMU drivers use MSI_IOVA_BASE macro to reserve
PCI MSI IOVA memory range, this assumes that all the platforms have
MSI_IOVA_BASE address available for MSI reservation. However, this
is not always the case, as some platforms may have the default
address reserved for some other purposes and as a consequence ARM SMMU
drivers can't reserve MSI memory for those platforms.

To address this issue, add a new dts property
"arm,smmu-pci-msi-iova-data" which can be used to hold custom
PCI MSI IOVA address and its address length. This property can be passed
to ARM SMMU drivers via device tree to reserve specified memory range
for MSI.

Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
---
 .../devicetree/bindings/iommu/arm,smmu-v3.yaml       | 12 ++++++++++++
 .../devicetree/bindings/iommu/arm,smmu.yaml          | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
index 75fcf4cb52d9f..dbad612886604 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
@@ -56,6 +56,17 @@ properties:
       NOTE: this only applies to the SMMU itself, not masters connected
       upstream of the SMMU.
 
+  arm,smmu-pci-msi-iova-data:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Specifies a custom PCI MSI base I/O Virtual Address and its memory range
+      size for ARM SMMU drivers. This allows setting a custom address and
+      memory size pair if the default MSI_IOVA_BASE_DEFAULT address and
+      MSI_IOVA_LENGTH_DEFAULT size are not suitable for the intended platform.
+    items:
+      - description: MSI IOVA base address
+      - description: MSI IOVA address length
+
   msi-parent: true
 
   hisilicon,broken-prefetch-cmd:
@@ -92,4 +103,5 @@ examples:
             dma-coherent;
             #iommu-cells = <1>;
             msi-parent = <&its 0xff0000>;
+            arm,smmu-pci-msi-iova-data = <0xa0000000 0x100000>;
     };
diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 032fdc27127bf..d080b13765d1f 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -207,6 +207,17 @@ properties:
       NOTE: this only applies to the SMMU itself, not masters connected
       upstream of the SMMU.
 
+  arm,smmu-pci-msi-iova-data:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Specifies a custom PCI MSI base I/O Virtual Address and its memory range
+      size for ARM SMMU drivers. This allows setting a custom address and
+      memory size pair if the default MSI_IOVA_BASE_DEFAULT address and
+      MSI_IOVA_LENGTH_DEFAULT size are not suitable for the intended platform.
+    items:
+      - description: MSI IOVA base address
+      - description: MSI IOVA address length
+
   calxeda,smmu-secure-config-access:
     type: boolean
     description:
@@ -679,6 +690,7 @@ examples:
             #iommu-cells = <1>;
             /* always ignore appended 5-bit TBU number */
             stream-match-mask = <0x7c00>;
+            arm,smmu-pci-msi-iova-data = <0xa0000000 0x100000>;
     };
 
     bus {
-- 
2.34.1


