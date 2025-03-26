Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D39C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BM6mxkt5RXZ0dVM3HYeP6JKYSOJqhtaepH3LCVRXD5k=; b=buS96D2xYUfogPvvEwW3rrwDNW
	4KuozK+40jlOtXTDo5gdBjAUkvAuzFNK9F9cOpAuJyPARIJSNfU4YIg620xjSvYOKowo5dcwmAyg+
	pJ9iViqxvD3rMFKb4ILca1Uie6vyzMDOwqBzK0oRGTL6O8+vWGu8fvN7YO8EkoDwoCcppVkE8XHlY
	nHXlMxc3JMM9jzxsM/IF8DP4GIsbyg07wYQKiHQum1gdcADiJ/tISVkjorRrTQ1AtiBDebF92q7R4
	h35mrqzTJfwOA9cZA/A9xJIz5lx+0z2c146puqMIu3NzT2btPvKRLLAuMb9hGmxdlPIYatQcgBbLz
	8YJmsblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txU0u-000000094uU-0oKc;
	Wed, 26 Mar 2025 16:54:00 +0000
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTw6-000000093Vi-168y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 16:49:04 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QBt2SZ012691;
	Wed, 26 Mar 2025 16:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=B
	M6mxkt5RXZ0dVM3HYeP6JKYSOJqhtaepH3LCVRXD5k=; b=u4Q7SItw+ojx8Tdbh
	snCXiFomil8yGCMlwIwqSHC0NBPISJ/s7UnVciObVTijbzeSOSsQAaFiim3zsJmT
	Eg4TDrSSH4SVuUkwAmk/S+YSQhtpmh/i74e2n1e614ML+LmBArvTEN/7Hl4/LX4H
	3VIGSUsgtrbFE2d8THwwBASVOADCdnizqdKYbvm/G8wH+9ZGNN0IbpGwsJI3Jh2j
	MBTmFHau+O9cvi95FdPho3KJ8MbF8fBLN7LmmMe8jEGIzEKyygpL7aN1dcbwB/AW
	qgsiESVl6qp9hsAqMpuCZ3XackRWnNyY1SBeJsz3I9D8mDhBAqc9mTBk1OzQZkHM
	x3K2A==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45kbmy9d6d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 26 Mar 2025 16:48:41 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.0.133) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 16:48:39 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Wed, 26 Mar 2025 16:48:21 +0000
Subject: [PATCH v5 01/18] dt-bindings: gpu: img: Future-proofing
 enhancements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250326-sets-bxs-4-64-patch-v1-v5-1-e4c46e8280a9@imgtec.com>
References: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
In-Reply-To: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
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
        "Michal
 Wilczynski" <m.wilczynski@samsung.com>,
        Alessio Belle
	<alessio.belle@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5876;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=F6M6u49TIWEWPYLBXmNE8AVpcI0CS0E+9FifzE1erDY=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaQ/0X88JTxtwvMFucUq//xkYtmLOZ4+KDzFfKHzQFJCT
 Wef5ptLHaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjCRSj1GhqUi/+JWvL1hZHPn
 U5zMWXPjyZ0zHW8/Ll2QeVBiztHr1pcZGU4L8kxMOHRI+7bjFM0CvZtn8zY/7Ay4F3OjarH1VGn
 RHXwA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 6P8IOYq5LJ88P_sm-itGxjaG972g1prR
X-Authority-Analysis: v=2.4 cv=L+sdQ/T8 c=1 sm=1 tr=0 ts=67e42fe9 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=w15EKZF3e2A1P0N44N0A:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 6P8IOYq5LJ88P_sm-itGxjaG972g1prR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_094902_597888_C961D012 
X-CRM114-Status: GOOD (  21.35  )
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
Changes in v5:
- Remove extraneous (and error-causing) power-domains minItems constraint
- Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1-v4-1-d987cf4ca439@imgtec.com
Changes in v4:
- Add img,img-rogue back to ti,am62-gpu compatible strings to allow
  compatibility with older kernels
- Revert change to power-domains property and add proper constraint
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-1-143b3dbef02f@imgtec.com
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
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 43 +++++++++++++++++++---
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 256e252f8087fa0d6081f771a01601d34b66fe19..e1056bf2af84c3eb43733bdc91124a66aaf51d35 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -12,10 +12,23 @@ maintainers:
 
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
+          # This deprecated element must be kept around to allow old kernels to
+          # work with newer dts.
+          - const: img,img-axe
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
@@ -37,6 +50,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  power-domain-names:
+    items:
+      - const: a
+
+  dma-coherent: true
+
 required:
   - compatible
   - reg
@@ -47,6 +66,18 @@ required:
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
   - if:
       properties:
         compatible:
@@ -64,10 +95,12 @@ examples:
     #include <dt-bindings/soc/ti,sci_pm_domain.h>
 
     gpu@fd00000 {
-        compatible = "ti,am62-gpu", "img,img-axe";
+        compatible = "ti,am62-gpu", "img,img-axe-1-16m", "img,img-axe",
+                     "img,img-rogue";
         reg = <0x0fd00000 0x20000>;
         clocks = <&k3_clks 187 0>;
         clock-names = "core";
         interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
         power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
+        power-domain-names = "a";
     };

-- 
2.49.0


