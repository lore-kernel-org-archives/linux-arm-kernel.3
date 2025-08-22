Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998C1CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/DWalJdpRTzR41GI/7nr5IgJdjyXkVRYmOi2yrQ+OU=; b=Jw56nkGkTJTigAsklNNZrvuHen
	aW+TpZqmEFOj2ALpOFtSc9oOifQTJfn+h6gGQXKUJ8Rodc9s95R68aYNwLjOQNV+mSm0Lg6zk/aol
	fcypGUKRjrdn0GxfTKLta0ieSeFRvcpQYjSbm//LY7NlhEkYAh6tSVffrtFEBZlFfx2W6ua2n4rWv
	unCWnbapTtl2XbgdDdciOhod2REx8DvYk/3AkOvhAfjidiW8DgaWDirGOefmHAlLE5t+UyiO+TJxc
	gzfRy+B1GOLf333l8ZkHgR0GZijot5fONmVqf6mEhN19sgAAEUqgl4kbl8MBACMbHR/Ciie+0mTDM
	b3Fj1LnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphr8-000000046AP-2Vpj;
	Sat, 23 Aug 2025 06:36:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSuI-00000002rBW-3hgQ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 14:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0/DWalJdpRTzR41GI/7nr5IgJdjyXkVRYmOi2yrQ+OU=; b=nHXUCrda3LphDn98ji6oEv+OKd
	LKyFcNqCGH2G9JD2gm9EexbB1zEtpf9esTuOe+V22ZVh/kjbrcM/vo9fal53tv5GAOg32bPt4AsZZ
	dO9KH9ydsCySFxvmhslu73m/VLXTmouTQt/UkgB+gB7CwHCEmpQH8qIQHQeHG8f80xfamDpLpzmxY
	XSSZNfnP7oegV1UN6dHpmhFUpUT9lkp081x88hPS7+xjA2s3zDE3qFDryMNMS0I5B2fOpQfhw9tYe
	upuPquLlYyirNDvWw8YJeEJjJsneB4Th9ohc/dwatBm2YvlwsM0z0Xvu7ermfBvrihc47LPir9sx8
	FbqY8Edw==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSuE-00000000x5I-2L21
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:38:17 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MEUQMT026394;
	Fri, 22 Aug 2025 16:38:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	0/DWalJdpRTzR41GI/7nr5IgJdjyXkVRYmOi2yrQ+OU=; b=rYljASOn2oBk5+sC
	T4oMYk1DxLu7f/HUgIgi1M1Z5TlJvH3MDSkM7JmI0Y+p/5rB/jPVrG0cU/YEoFkh
	gN9dy45R1g4IAMlmpRwnAPY9qp/cCZUoU1UAf41dQI2R7sW7xkQ+lapYyTjoLECZ
	i4NNVr6RIiKLr/EdxpO65Wj5YsERo0E2XE51bdEI/nXyFXaY4rTyvpYztLLVuUYE
	gq4MkYVhcbVyg8miTYiXMlE9pN5FczI6Zij6nN72B//ptRjESsGbsa9QYCAvRaZq
	L2RSeJsPSP7kQwuZLeZZIUOBK7KJQPMKi9HqkYQpRKAzo/v/5ZaRwZG/FRp91f9U
	ax9Jfg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48np7n7hna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 16:38:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9AC204002D;
	Fri, 22 Aug 2025 16:36:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2C26726C8B;
	Fri, 22 Aug 2025 16:35:49 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:35:49 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 22 Aug 2025 16:34:10 +0200
Subject: [PATCH v5 01/13] dt-bindings: display: st: add two new compatibles
 to LTDC device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250822-drm-misc-next-v5-1-9c825e28f733@foss.st.com>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
In-Reply-To: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_153814_787779_99C3B92D 
X-CRM114-Status: GOOD (  11.46  )
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

The new STMicroelectronics SoC features a display controller similar to
the one used in previous SoCs.  Because there is additional registers,
and different mandatory clocks it is incompatible with existing IPs.  On
STM32MP251, the device only needs two clocks while on STM32MP255 it
needs four.

Add the new names to the list of compatible string and handle each
quirks accordingly.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 .../devicetree/bindings/display/st,stm32-ltdc.yaml | 52 +++++++++++++++++++++-
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
index d6ea4d62a2cfae26353c9f20a326a4329fed3a2f..1233345a16307532ea08d3686d194b486f897ea9 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
@@ -12,7 +12,10 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32-ltdc
+    enum:
+      - st,stm32-ltdc
+      - st,stm32mp251-ltdc
+      - st,stm32mp255-ltdc
 
   reg:
     maxItems: 1
@@ -24,11 +27,16 @@ properties:
     minItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
 
   clock-names:
     items:
       - const: lcd
+      - const: bus
+      - const: ref
+      - const: lvds
+    minItems: 1
 
   resets:
     maxItems: 1
@@ -51,6 +59,46 @@ required:
   - resets
   - port
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32-ltdc
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp251-ltdc
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          minItems: 2
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp255-ltdc
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+
 additionalProperties: false
 
 examples:

-- 
2.25.1


