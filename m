Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D9EC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 22:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4tDEWmcrI3cttYgef9jFAuJ7VDRpJ9tPVO1HUepdXY=; b=K8pBAKOMQ01iVT8qHMvQD9ioOE
	Za+7vxIlB6ary13ela+7GbuhDeT0Ji4qRtBf6EcLo+Sgr9DzQRAXXxRo27AgF+kOhpcGUTvxwtnP3
	ScU6HbpytNaZM2esWmEMKN7Vwlc97gFq5GvcT2U/0khIFgqHz8ELFuBVaqKSSyhHcEK6zCr+CLEyL
	NqZYsj+VWFhPgzmStunrhs1Ga7sI59qR8/7X2HAtlO3Plf2u7H9v1fRnBwcCbJxqGmpLtyG9ZvCw2
	YG86E9hz7mImkHY9pLXh82x7CSD8bIr8O5m+alm3YEnhHMSJLPpQGXTZYu7b2+g7SZTldPqv2/374
	zRlkvvlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30mq-0000000BzyV-11gc;
	Thu, 10 Apr 2025 22:54:20 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30jE-0000000BzJs-3H5c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 22:50:38 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.10.206])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9CA892114DAD;
	Thu, 10 Apr 2025 15:50:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9CA892114DAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744325435;
	bh=f4tDEWmcrI3cttYgef9jFAuJ7VDRpJ9tPVO1HUepdXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kwuSM8mR5JE4ONOWRVD4F+0ZI8CKWi0X9AIXlxQavBUj+CMQu61nL5G4hCRbJTQLU
	 lLOQDPgLc2pgplhXcklE+vRd9iKNQ1lXAAl/Qj0zzBNLnUczOOf5mbvV0fhNqXpgRK
	 C396TsxzLDab0H9tEE7N8LxPqbrtxoqBf6EGQvPM=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: jgg@ziepe.ca,
	will@kernel.org,
	jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com,
	code@tyhicks.com,
	eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com
Subject: [PATCH v2 2/3] dt-bindings: iommu: add "arm,smmu-faulty-msi-iova" property
Date: Thu, 10 Apr 2025 15:50:29 -0700
Message-Id: <20250410225030.2528385-3-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
References: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_155036_867440_AF554450 
X-CRM114-Status: GOOD (  12.99  )
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
"arm,smmu-faulty-msi-iova" which can be used to hold faulty MSI IOVA
address. This property can be passed to ARM SMMU drivers via device
tree so that the drivers can select appropriate MSI IOVA base address
which doesn't intersect with the faulty MSI IOVA address.

Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 8 ++++++++
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml    | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
index 75fcf4cb52d9..13b615ca38e1 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
@@ -56,6 +56,13 @@ properties:
       NOTE: this only applies to the SMMU itself, not masters connected
       upstream of the SMMU.
 
+  arm,smmu-faulty-msi-iova:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Specifies a faulty PCI MSI base I/O Virtual Address. If this is passed
+      via dts then arm SMMU driver appropriately select suitable MSI_IOVA base
+      which does not intersect with faulty MSI IOVA passed in this dts property.
+
   msi-parent: true
 
   hisilicon,broken-prefetch-cmd:
@@ -92,4 +99,5 @@ examples:
             dma-coherent;
             #iommu-cells = <1>;
             msi-parent = <&its 0xff0000>;
+            arm,smmu-faulty-msi-iova = <0x8000000>;
     };
diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 7b9d5507d6cc..1aba9d59d495 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -208,6 +208,13 @@ properties:
       NOTE: this only applies to the SMMU itself, not masters connected
       upstream of the SMMU.
 
+  arm,smmu-faulty-msi-iova:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Specifies a faulty PCI MSI base I/O Virtual Address. If this is passed
+      via dts then ARM SMMU driver appropriately select suitable MSI_IOVA base
+      which does not intersect with faulty MSI IOVA passed in this dts property.
+
   calxeda,smmu-secure-config-access:
     type: boolean
     description:
@@ -680,6 +687,7 @@ examples:
             #iommu-cells = <1>;
             /* always ignore appended 5-bit TBU number */
             stream-match-mask = <0x7c00>;
+            arm,smmu-faulty-msi-iova = <0x8000000>;
     };
 
     bus {
-- 
2.34.1


