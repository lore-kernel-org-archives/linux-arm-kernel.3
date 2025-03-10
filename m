Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9934FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMD6jkgSLwhFko7H7wltiRVWaa8cNC5nrtuJvn0He8Q=; b=DUVuC2hCEpwp7gEnTuPQS3y5eP
	3laW1K7Qg9uUE41rsIPJnp4EIwyzXFr2/FNVDv1w6RX+zs5CmRJFBbj/zFtVl3ySFRUNiVymBoSpv
	BopUl4fsxje79wUR92NXXqz/3FEZSk4ogXA0iuWM7HveiCu9lpKQzpu/WV9eiwlpaWH4zJ5Q85iAz
	XZDctgTs7kXqyEJRvFh3T491tq93OoV0EPDfUpGBOGw5TXyBI9ipr+owZvhjGI+j/T395SJtd6Eq0
	V+fKOgV5/hTW1jTtJJzBRaFNRzPETH4yLunWHNXtSFofhCE0x9rqOuE904HEvZqxcIEWGnruaUysj
	vDm122og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treO5-00000002yOA-2aml;
	Mon, 10 Mar 2025 14:45:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcut-00000002k4Y-3NUu
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 13:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZMD6jkgSLwhFko7H7wltiRVWaa8cNC5nrtuJvn0He8Q=; b=Yk+W8eOPm5Tm1w6D/Mv+IMETJJ
	bhX0e+47jBVqH47TebgHJP2+N8AXYy9G1C0E+qy3blBcpA+FLeVL+5hqWJpUo1GktZEbOMelDwEmS
	7o77aJTxEj0rDNDc8oE1ckO+Wekk2Mhb58AUKA/D42WE/lKmqKrGD9GLb6JGRse6YdTUHvtdy+QiT
	rLKxttMybtfAfoofRq3ee2YL7pKpRhDownrAzOHaw2z6DcovwtKh08MMwYfEEbvgTR9hm8evuQM9j
	MEUOo38lC7Rdapu6u5yq7mPnViuzfgJW8MmE/8+1ycRgn40bx2Vf94z2iP8v9/my+GtmE6QCTQt0c
	m8I9zMzg==;
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcue-00000001ra9-1utf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:11:25 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A7GhJo014277;
	Mon, 10 Mar 2025 13:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=Z
	MD6jkgSLwhFko7H7wltiRVWaa8cNC5nrtuJvn0He8Q=; b=mltiXOwqJ7goX+ZVK
	TEVpLg8HQSepapGXGRSH0QZ3/Jn2gpJb9JVPw78WeJvavNtXtNC8nvGTq1F07t+P
	b0z2s82wl0suvdpET7jlpWn4qHjjv0jeF2zApT/d6yZzJHwmMVPXTfJ5zQLXs88G
	uZhytBZ0lhlEHOfew36mqPT6Sg84hyhZV5Vs/qhJp1bqxvAXbsStwjsBoKN0aG42
	IUDy4CueF74jEGIbErauKbz2IxPPNsZggtciFdzlkW8R8zetStIoJM7gWRhFPxNL
	4T+cPHfpo9gmVoDubwCOayiQa9SUZa8/ZwoYzk/5ZVlgKN4n9xekF/BDUxfjtKBj
	n8OHQ==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 458ev09ert-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 10 Mar 2025 13:10:45 +0000 (GMT)
Received: from Matts-MacBook-Pro.local (172.25.0.133) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 13:10:43 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 10 Mar 2025 13:10:25 +0000
Subject: [PATCH v3 01/18] dt-bindings: gpu: img: Future-proofing
 enhancements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250310-sets-bxs-4-64-patch-v1-v3-1-143b3dbef02f@imgtec.com>
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
In-Reply-To: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
        "Alessio
 Belle" <alessio.belle@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5308;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=9ccPKSMezR78NMQ+/yx9D1/u2jdBiyKTKkx56WFAGUU=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaSfe3JerDHCekv8zs1rvx475hYw+WOLWuGUC43dfZdyJ
 v7K3WSr2VHKwiDGwSArpsiyY4XlCrU/aloSN34Vw8xhZQIZwsDFKQATedLIyDDFSjD6zlSVgLsy
 Tvmzj63Octz4PHYPb4mSe21Ujs+DtBOMDHsT91d+y/v7iU1Lw+/rmrBr1kffc/6/afjdLFSe8xj
 Hak4A
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=67cee4d5 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=w15EKZF3e2A1P0N44N0A:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: onNBhZLeNRTdFLvoW9PEjjSQhAVpBr28
X-Proofpoint-ORIG-GUID: onNBhZLeNRTdFLvoW9PEjjSQhAVpBr28
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_131120_913472_627FF3B6 
X-CRM114-Status: GOOD (  20.42  )
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

The first compatible strings added for the AXE-1-16M are not sufficient to
accurately describe all the IMG Rogue GPUs. The current "img,img-axe"
string refers to the entire family of Series AXE GPUs, but this is
primarily a marketing term and does not denote a level of hardware
similarity any greater than just "Rogue".

The more specific "img,img-axe-1-16m" string refers to individual AXE-1-16M
GPU. For example, unlike the rest of the Series AXE GPUs, the AXE-1-16M
only uses a single power domain.

The situation is actually slightly worse than described in the first
paragraph, since many "series" (such as Series BXS found in the TI AM68
among others and added later in this series) contain cores with both Rogue
and Volcanic architectures.

Besides attempting to move away from vague groupings defined only
by marketing terms, we want to draw a line between properties inherent to
the IP core and choices made by the silicon vendor at integration time.
For instance, the number of power domains is a property of the IP core,
whereas the decision to use one or multiple clocks is a vendor one.

In the original compatible strings, we must use "ti,am62-gpu" to constrain
both of these properties since the number of power domains cannot be fixed
for "img,img-axe".

Work is currently underway to add support for volcanic-based Imagination
GPUs, for which bindings will be added in "img,powervr-volcanic.yaml".
As alluded to previously, the split between rogue and volcanic cores is
non-obvious at times, so add a generic top-level "img,img-rogue" compatible
string here to allow for simpler differentiation in devicetrees without
referring back to the bindings.

The currently supported GPU (AXE-1-16M) only requires a single power
domain. Subsequent patches will add support for BXS-4-64 MC1, which has
two power domains. Add infrastructure now to allow for this.

Also allow the dma-coherent property to be added to IMG Rogue GPUs, which
are DMA devices. The decision for coherency is made at integration time and
this property should be applied wherever it accurately describes the
vendor integration.

Note that the new required properties for power domains are conditional on
the new base compatible string to avoid an ABI break.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v3:
- Remove unnecessary example
- Remove second power domain details, add these where they're used instead
- Avoid ABI breaks by limiting new required properties to new compatible
  strings and making all binding changes in a single patch.
- Links to v2:
  https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-1-3fd45d9fb0cf@imgtec.com
  https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-3-3fd45d9fb0cf@imgtec.com
  https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-4-3fd45d9fb0cf@imgtec.com
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 43 ++++++++++++++++++----
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 256e252f8087fa0d6081f771a01601d34b66fe19..5c16b2881447c9cda78e5bb46569e2f675d740c4 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -12,10 +12,20 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - ti,am62-gpu
-      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
+    oneOf:
+      - items:
+          - enum:
+              - ti,am62-gpu
+          - const: img,img-axe-1-16m
+          - const: img,img-rogue
+
+      # This legacy combination of compatible strings was introduced early on
+      # before the more specific GPU identifiers were used.
+      - items:
+          - enum:
+              - ti,am62-gpu
+          - const: img,img-axe
+        deprecated: true
 
   reg:
     maxItems: 1
@@ -34,8 +44,13 @@ properties:
   interrupts:
     maxItems: 1
 
-  power-domains:
-    maxItems: 1
+  power-domains: true
+
+  power-domain-names:
+    items:
+      - const: a
+
+  dma-coherent: true
 
 required:
   - compatible
@@ -47,6 +62,19 @@ required:
 additionalProperties: false
 
 allOf:
+  # Constraints added alongside the new compatible strings that would otherwise
+  # create an ABI break.
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: img,img-rogue
+    then:
+      required:
+        - power-domains
+        - power-domain-names
+
+  # Vendor integrations using a single clock domain
   - if:
       properties:
         compatible:
@@ -64,10 +92,11 @@ examples:
     #include <dt-bindings/soc/ti,sci_pm_domain.h>
 
     gpu@fd00000 {
-        compatible = "ti,am62-gpu", "img,img-axe";
+        compatible = "ti,am62-gpu", "img,img-axe-1-16m", "img,img-rogue";
         reg = <0x0fd00000 0x20000>;
         clocks = <&k3_clks 187 0>;
         clock-names = "core";
         interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
         power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
+        power-domain-names = "a";
     };

-- 
2.48.1


