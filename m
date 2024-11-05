Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73999D31761
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdcimgP6TdRefkK6ZXHyBiKyLfJbpiMR1HIyssxuJK8=; b=OMHqTq6LmpHbQVy59+yKWmKTiZ
	xJninemD00Xo+ilCn1TYFGjsJE5coPyY5vksIKd/J9l503ou/RtMoT84UDNXi5Ok2/jne4tA/AruO
	mjmVd+BFKyCWWpIrneuNdsEvQcZd3MNDP9gO1MVBI4BwaNCZqZ/I8H28XFbO3jdIss0WdqLlztp30
	x70nauKEMxeFD7per6HcQRDIoi/0gtKEF9pV7ROSazABec0IqHfuROuwdI9ZeAeDVm6+1Vo95LAAH
	r+EBkWwX3CSvlbswdJdWfkYZ6ytgnHSOTyJdx2mmwIC6hm6cU/nJ/9JTjwLtd+nNyTe1L7GwcxfDt
	xyxB4XoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MLe-000000001vC-2k9w;
	Tue, 05 Nov 2024 16:24:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxJ-0000000HX35-30zQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 Nov 2024 15:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AdcimgP6TdRefkK6ZXHyBiKyLfJbpiMR1HIyssxuJK8=; b=JKMD8cFtVvgBExOSrL/rKwp9WV
	/Qm9zIy6itKIuCD3k0vNGUA1mBPS3u6+bAE494Tv5bzCQWS2rnj1dw4eT5LqTcUgg1waZeejIfrto
	C2HE9c03coXnjDicuWGSOFtXEdlUufgQpRJZ40zYUyttWfyVQ8WIz8LIRJn4Q86j1fyL/qWBPLrJA
	R9ufl+1g+HEbeTc9cVoEp7IApcdqQ3Fk51wUmRlYS+5qqeDMAHh07O/eVCusvKMGAL6VCEa9hTLoE
	ILhR7mjf47bChd3i/Y85yTmed6OkYG9EMbG3MxWlxfUS9fqHOq/y7ciOUOaxrKijEaEMcLKIXnVHo
	oa6HVPng==;
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxF-0000000Bme5-2kXQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:58:56 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5DjjHX028612;
	Tue, 5 Nov 2024 15:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=A
	dcimgP6TdRefkK6ZXHyBiKyLfJbpiMR1HIyssxuJK8=; b=CtPQKZRh/rm6+lmI+
	QOzTIVzI/yKoQA8GbiDVsOXOFOXICBaD/+txb3tPwcSBRXnniGe9qB1+BdGD3ue2
	J+dFiN2glIGHa6vjvLXPU3VMo03zpDkIoSa9uKGIvN+6dQ/MTU4MqMUIf5DZHRPw
	C4ffIiaGDY3Yty4s5Du0d8UiKIKJg7hxbA2emrzrdtkkiNSk2yXAdj3/zMVBCTyH
	TDkdyiqKaiu+kjMN9yUjc0fvX/y0KAaEZExZJl39yXRltwYcIne2MAOgOf1xypzR
	h5XYZ3eVwuVRhhPSWI6jEHeiYtUydPeTzKyDEGlUny4GYemaHhoRcz8fjpCGD9Tg
	HNeWw==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42nd212jtx-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 05 Nov 2024 15:58:30 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 5 Nov 2024 15:58:29 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 5 Nov 2024 15:58:14 +0000
Subject: [PATCH 08/21] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
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
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2886;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=KmZHQpu6U9dqLtldHbo5s6lUvD4SI5/Z7CglFP7B090=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRrOcwta1w6bWFniZyN/471ddGl7H7xJsWvbmnZP7zT/
 UBD58PljlIWBjEOBlkxRZYdKyxXqP1R05K48asYZg4rE8gQBi5OAZjI9niG/6mzF09SFyjYtVe5
 ZOYF98RCjpUNoUohDa+lHQy/m10pr2JkeG5Qz6094eje35HOT63mRc2wOG7hPqueOSotv2Lefn8
 BZgA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=Q9aA4J2a c=1 sm=1 tr=0 ts=672a40a6 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=r_1tXGB3AAAA:8 a=fBGHU3NjAIazuI7ybSQA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: fFSOzA_pDUezOPUZAJmOYLhlSiHupNJv
X-Proofpoint-ORIG-GUID: fFSOzA_pDUezOPUZAJmOYLhlSiHupNJv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_155854_086119_B9F01A0C 
X-CRM114-Status: GOOD (  10.50  )
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

Like the existing AXE-1-16M integration, BXS-4-64 uses the single clock
integration in the TI k3-j721s2.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 8a1861ca960c48853b2ceef414f588cc343b49b2..d3a28d758ae78a69afbf26b7317a1c55c6b0a517 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -18,6 +18,11 @@ properties:
               - ti,am62-gpu
           - const: img,img-axe-1-16m
           - const: img,img-rogue
+      - items:
+          - enum:
+              - ti,j721s2-gpu
+          - const: img,img-bxs-4-64
+          - const: img,img-rogue
 
       # This legacy combination of compatible strings was introduced early on before the more
       # specific GPU identifiers were used. Keep it around here for compatibility, but never use
@@ -89,6 +94,22 @@ allOf:
         power-domain-names:
           items:
             - const: a
+  # Cores with two power domains
+  - if:
+      properties:
+        compatible:
+          contains:
+            anyOf:
+              - const: img,img-bxs-4-64
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+          maxItems: 2
+        power-domain-names:
+          items:
+            - const: a
+            - const: b
   # Vendor integrations using a single clock domain
   - if:
       properties:
@@ -96,6 +117,7 @@ allOf:
           contains:
             anyOf:
               - const: ti,am62-gpu
+              - const: ti,j721s2-gpu
     then:
       properties:
         clocks:
@@ -120,3 +142,26 @@ examples:
         power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
         power-domain-names = "a";
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    / {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+
+        gpu@4e20000000 {
+            compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
+            reg = /bits/ 64 <0x4e20000000 0x80000>;
+            clocks = <&k3_clks 130 1>;
+            clock-names = "core";
+            interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+            power-domains = <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
+                            <&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
+            power-domain-names = "a", "b";
+            dma-coherent;
+        };
+    };

-- 
2.47.0


