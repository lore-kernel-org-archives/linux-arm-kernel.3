Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B06D31765
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgFYRKSLCsydHCPYVKboQ9O5kz+xG+4NN+Hl+uD6ovg=; b=axWih6BgNTUmB8R2RRzsSUWM+Q
	3LcskU8zEGteY8SygPrRakxntOpzzsKhfCVXxrdeH0MClBvEOlRnXnBOnCCO4fslcgFwF0o6qAVoH
	scPpLnb6Cei+2Qy4OHBlue4kOFR9tXh6u5YJQH6lruqAieA9NU3MBBO0oZHZsx9GVuLyrCJMthXBK
	WyQaRptn/3K/4KF3gNtRlfJ65xmb/qVswNPsf2xqxmuC0DZPvxyFuYm5NAhTlIUDjnDWQ76kzN4VA
	Mjc42E2mOok1ZjSW3myupr1yL1QIAyiY9DoqPygcv3tb0+DYi1thhhjHXPGIvl9V/790hWGfAkcps
	jBwRG+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MIH-000000001RI-1GR7;
	Tue, 05 Nov 2024 16:20:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxJ-0000000HX32-2hkx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 Nov 2024 15:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dgFYRKSLCsydHCPYVKboQ9O5kz+xG+4NN+Hl+uD6ovg=; b=IEGdIZdWfCl9UJgWXQ+j+nRoBc
	kYAY+qb7In1nHWqvo9ld+yY9O5e/0U7zcLzh4rISZ5+PFDpze9qU/pAm4twwiTIvrXLNVrP+sPJ2O
	gpeP4gxDUU5iJaHdWXMnsa1WRIYF/3u5KyxqzRDJdpybq8Q50GCT0tgNBGOVEeqdU7olJkOWVHLGu
	8k1c9nxDtmN7P71JWtGoxZQZkhbcKFqlaYjM+sQf7aauoKH0d5UhOSmq80q0MZTwPQCW1+dtNbrgQ
	rHg49dUj4XLpw2NiyV/YL0+tTsV6G7a9pkkcghguDB2LP9yT/gy/rrquRbN0KCOSpSjPpgIl2CVMf
	MNeEXGJQ==;
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxF-0000000Bmdz-1oly
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:58:56 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5EF3v1003827;
	Tue, 5 Nov 2024 15:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=d
	gFYRKSLCsydHCPYVKboQ9O5kz+xG+4NN+Hl+uD6ovg=; b=TtgvvesQ9wUY75Bu4
	1y5UiEGmfZgNzZP2oykAywYujXkEbRRhcPipvylfEdwwrInW93RHLi0iYi5UT8nW
	fi6e3oUpOdzzsNCW/yjQbjRMJMqYT9cIUTUyPx8p1OcMaajbck78JomlypveixWZ
	Y9Kbp5D3cj5NAEfICTr+0nerSsImjszuxQrCrT9sp7n+TWTZKWfxdBnaRBbJrxow
	CINfwauj8+82cf1APKxukvRaTNX/7lgg1hv1XXV19bphlQCgreWie4yLq1t61/h/
	RUuHrPCtdZv94WMO/owUP0qCTv/pz5f6DbPM2wotD0xkKbR7yrXaAXYQio2gD/Vs
	4pI1Q==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 42nb7wta0s-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 05 Nov 2024 15:58:26 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 5 Nov 2024 15:58:25 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 5 Nov 2024 15:58:08 +0000
Subject: [PATCH 02/21] dt-bindings: gpu: img: Further constrain clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-sets-bxs-4-64-patch-v1-v1-2-4ed30e865892@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=gmq1//uzSkip2I9hQnYT5ExcwUyJTx/G8+lls9+QmpE=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRrOcyxXRAdu/B5jsbPjkeBrJdc/33s5OBLKFqc9OzdP
 K5YnuA7HaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjCR6GZGhgWy0VNV93UxL++O
 CImrXiYsJTD31vdPQhrlZ5avb4rdkszIMFflqP6eOd+0vS5JFUX9mvrwnUTx2S3yjscVU7lmGRw
 6wAMA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=ddzS3mXe c=1 sm=1 tr=0 ts=672a40a2 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=r_1tXGB3AAAA:8 a=cDXhS4k7GDcpIX9mfQgA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 8l3_6SoqTe74P9tpv2dJ-Exgb2ItxLQy
X-Proofpoint-ORIG-GUID: 8l3_6SoqTe74P9tpv2dJ-Exgb2ItxLQy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_155853_737518_7B27C7CA 
X-CRM114-Status: GOOD (  10.60  )
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

All Imagination GPUs use three clocks: core, mem and sys. All reasonably
modern Imagination GPUs also support a single-clock mode where the SoC
only hooks up core and the other two are derived internally. On GPUs which
support this mode, it is the default and most commonly used integration.

Codify this "1 or 3" constraint in our bindings and hang the specifics off
the vendor compatible string to mirror the integration-time choice.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 27 +++++++++++++++-------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index ef7070daf213277d0190fe319e202fdc597337d4..6924831d3e9dd9b2b052ca8f9d7228ff25526532 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -30,15 +30,20 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 1
-    maxItems: 3
+    oneOf:
+      - minItems: 1
+        maxItems: 1
+      - minItems: 3
+        maxItems: 3
 
   clock-names:
-    items:
-      - const: core
-      - const: mem
-      - const: sys
-    minItems: 1
+    oneOf:
+      - items:
+          - const: core
+      - items:
+          - const: core
+          - const: mem
+          - const: sys
 
   interrupts:
     maxItems: 1
@@ -56,15 +61,21 @@ required:
 additionalProperties: false
 
 allOf:
+  # Vendor integrations using a single clock domain
   - if:
       properties:
         compatible:
           contains:
-            const: ti,am62-gpu
+            anyOf:
+              - const: ti,am62-gpu
     then:
       properties:
         clocks:
+          minItems: 1
           maxItems: 1
+        clock-names:
+          items:
+            - const: core
 
 examples:
   - |

-- 
2.47.0


