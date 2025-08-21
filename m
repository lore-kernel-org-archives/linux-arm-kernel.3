Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D12CA0FE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWTOJF1epI28bBhF8vVR/yYBW1JjsQwkoHcGU7JgvMc=; b=E+K0MyWkb+ob5/utYp6/9wrjXP
	OphYtaH9c5OvuiDnUpC7rBOQ/QE33RrGf6lH23x5uvHC51w6hH2bzggR3KAqGqDlxOXo5KSQNSUxy
	V7rj408rrHIFkVae06UUyHHIKkLBfSNjRLMeSHtxrxUQdRNcaztrwMa5rULA1WtXaVrFw5ay4XwjZ
	bwDYSNyFOO6rXPjOXfXNqajTUI/73ezFT3T9QfgZsKfDLz6oLOGYCzn5Xd2bAKWSEht4UwzuS3/Up
	POSqwJJu8P/qZQk9qOEL1ysAIyYOYBC/UJCPy5UtIcDHEQ25/TiLSY1zF47ScF6hRKX8NIUxTZ9Gr
	3dlRgw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Ek-0000000HM4b-3xhZ;
	Thu, 21 Aug 2025 15:29:58 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3DT-0000000GiHb-43KW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:12:25 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LA6FfA023466;
	Thu, 21 Aug 2025 13:12:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	nWTOJF1epI28bBhF8vVR/yYBW1JjsQwkoHcGU7JgvMc=; b=oWOs78l33V52ahlW
	exprUK97LoEhZjbz3sXWes58CrZwwui/tBN6TXyXqE+mNyoqugpeJpCSAhN3FaKK
	6UqUM1E49XgTKVuICKQMRXMEEYsmn0SHAb7qZlxQxGk9ZdqiKFdAaM6SurKuxLWn
	89U5yxuEzZqQQ1Z/PruhbQxsNFFE6RJJEcARO0Ryoh+CYgrQv8+RNnYQnFBtrhMu
	o+LKNoAeZDtGEyDDUgLV+Xgk2ebgac/tu0jM6W2mHRH4HfnpQpOMgDMeffzn88zW
	ZPsNx+uW+BV07IOSxCgi47y+VuFVWsaQOB7m8DtD81vd7xSH1sEAppqMdqPx2VtB
	XLvl5w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48nj3v3n7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 13:12:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E047A4004A;
	Thu, 21 Aug 2025 13:10:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CBA7738B22;
	Thu, 21 Aug 2025 13:09:51 +0200 (CEST)
Received: from localhost (10.252.7.99) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 13:09:51 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 21 Aug 2025 13:08:51 +0200
Subject: [PATCH v4 01/13] dt-bindings: display: st: add two new compatibles
 to LTDC device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250821-drm-misc-next-v4-1-7060500f8fd3@foss.st.com>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
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
X-Originating-IP: [10.252.7.99]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_041224_302489_C59C86F3 
X-CRM114-Status: GOOD (  11.39  )
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
 .../devicetree/bindings/display/st,stm32-ltdc.yaml | 50 +++++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
index d6ea4d62a2cfae26353c9f20a326a4329fed3a2f..bcedcfef5427f5725a0473c09628e70d172c8f58 100644
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
@@ -51,6 +59,44 @@ required:
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
+          maxItems: 2
+        clock-names:
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


