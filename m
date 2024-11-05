Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCE5D2B944
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8MK1YmMNs1hdmI79eE3tV5JmoW7c58L5kQGDhzJT8o=; b=RSgm/AuiBiLGUkBS6QPHbu4PbE
	IXXg4rYI4yvGA4wX92xjf8+bWiABU/rdtkLeGWSO+jRflicJhbu16KeWo0C5GsSA4DFZT9diP+65w
	YuMZ5PvG0kgwOvHPa6UdR6s0pM/ctOf+ro9uUdTOC4CBqAeolso8907O73k7HHWTiPCk13+mn3dqB
	eKmSgOT7hJwF370CKuITC9HdJi4wBNVR9vnPOphMQKnQq4FlcvjJExFM68PicyCiJSrLtocm15llW
	Eq4+Ul3SPwq0KmzsKyygV/9J0fa2TzZEFlQiL+wfJA7mLHeAscZArYlDGYfbB7SffQuvPS/Rp9R39
	XKXN852g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8M2i-0000000HYoz-33eB;
	Tue, 05 Nov 2024 16:04:32 +0000
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxE-0000000HWul-377p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:58:55 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5EF3v2003827;
	Tue, 5 Nov 2024 15:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=m
	8MK1YmMNs1hdmI79eE3tV5JmoW7c58L5kQGDhzJT8o=; b=sGfvAXTBnHssZO2GP
	M3UgXbFzSq3kajMLVoI+lsrTF/oSxZOstban6QQIUaGfPEgKhhE0WJ7stP9/TyEJ
	VF1HBIVUwK6n9lTcMzlYP+ygxqKXZ2YWJnknM/GtBL2cGFd0V3q5CIClRfJBWS34
	YLa8AJR//q48d0CXgyseG1OL8f87QW+u3LCINewXIUubitX5VlExh9/HV0gVTalX
	ELtNYLXEyA6w6bzhJuXcunws66zRg9Szyv7tmvYe4l57o1vKN4SK8lbW9WKJjLh2
	9P2deoChaGtvad95gWhlssbF/stWemW/k37H0CZxockWzjTPW7WQie0vvZiHD9HT
	81e5Q==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 42nb7wta0s-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 05 Nov 2024 15:58:27 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 5 Nov 2024 15:58:25 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 5 Nov 2024 15:58:09 +0000
Subject: [PATCH 03/21] dt-bindings: gpu: img: Power domain details
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-sets-bxs-4-64-patch-v1-v1-3-4ed30e865892@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=xpvmkOGoJ8kLva6fvxTjzOM3lj7B471NHdnui9EiYKg=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRrOcwJDtW9YnZ1UiZfOp+M491JKk5F3ALme6ZkzLazO
 nZ8zwG7jlIWBjEOBlkxRZYdKyxXqP1R05K48asYZg4rE8gQBi5OAZjI7icM/8MK+9uT+5vOJJ5Y
 qNq/SMr7tYXfv7rrJ/qOFO20LjA+6c7w30dXe9e77VnVTdPKSlTO6D3kkWY1em2pFdFxo6+aNWg
 aJwA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=ddzS3mXe c=1 sm=1 tr=0 ts=672a40a3 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=r_1tXGB3AAAA:8 a=aNuRvPZPtIV8pc9XrW8A:9 a=QEXdDO2ut3YA:10
 a=aimXnJ6PnzgsTu0FwM6W:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: G43ywWuRVUE1PLqMd0PHqt08M6XrxAwv
X-Proofpoint-ORIG-GUID: G43ywWuRVUE1PLqMd0PHqt08M6XrxAwv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_075853_337724_694DE3C9 
X-CRM114-Status: GOOD (  11.67  )
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

The single existing GPU (AXE-1-16M) only requires a single power domain.
Subsequent patches will add support for BXS-4-64 MC1, which has two power
domains. Add infrastructure now to allow for this.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 29 +++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 6924831d3e9dd9b2b052ca8f9d7228ff25526532..55f422be1bc5b7564e3e81f24c4b93857f3e12fe 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -49,7 +49,16 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  power-domain-names:
+    oneOf:
+      - items:
+          - const: a
+      - items:
+          - const: a
+          - const: b
 
 required:
   - compatible
@@ -57,10 +66,27 @@ required:
   - clocks
   - clock-names
   - interrupts
+  - power-domains
+  - power-domain-names
 
 additionalProperties: false
 
 allOf:
+  # Cores with a single power domain
+  - if:
+      properties:
+        compatible:
+          contains:
+            anyOf:
+              - const: img,img-axe-1-16m
+    then:
+      properties:
+        power-domains:
+          minItems: 1
+          maxItems: 1
+        power-domain-names:
+          items:
+            - const: a
   # Vendor integrations using a single clock domain
   - if:
       properties:
@@ -90,4 +116,5 @@ examples:
         clock-names = "core";
         interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
         power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
+        power-domain-names = "a";
     };

-- 
2.47.0


