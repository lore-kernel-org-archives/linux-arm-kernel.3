Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6805D49223
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CA9mLyN7QIrUDL6u8u0tTlS47U1mfv8GbnJkKf4gDkY=; b=W4CYUs1BIq8S8eTm5FFOKXqcI+
	K9R1od9Pd36ADBfplnfAMkZvp1xF5hGdbssvm7FvMUbGhpgxToxviThZsd47LthoGvE0y9yUNzJ1U
	9WEq2QZWvBw+5pLcA2VsxhPKql+RP/2HiAUGk+JO2fDONfZeMvC2q8glmv2QYdU92LLimBzL/aLIO
	SvsXKelv7h1X6ncX8i5vahk8WhoxR/l5NOeJvXl5yaHaDLoxCQQn5uIqF2QLqFDd/OLBTZHKLO+QY
	oBT9Fh0IMpSA+FAPUSIH5JJNZ4GlgvcxQc0VZWWCOb8gqK1ZYtScANXXUk1hoC7Y8l6qTScO/9fxr
	TynXb9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD2EF-00000009gBR-0sWk;
	Mon, 18 Nov 2024 13:55:47 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1zC-00000009cyb-3Ofr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:40:16 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AID4PQs027884;
	Mon, 18 Nov 2024 14:40:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	CA9mLyN7QIrUDL6u8u0tTlS47U1mfv8GbnJkKf4gDkY=; b=byk/hIN//Z6cQnEq
	cXiYBfHP0AwT0GuR8ewTds/hbu3xcKzZRw83i1AVb5I8i3wV6vQwu7JX80zKm0r/
	9YF7/nkQR0ZL/4PtQCqxDULwPGYSyOCN1raWInE6sNkRegKGEuAzAxk48jTrv3kz
	rM3qJ6eQR2AZ4ULn8VoYNSh3rZG6S0EJd89Syf/mJ1dvlEdIacn7bmmWq9Jdd1AM
	DrJl2Aq7Tbb9vFEjb7RIKYAm3pOrcY1oOHluwLiZiCEiaV4CYeCHbLvprTge8Fmk
	IUszVlzWWPHJ1vi14VNgE/AIOCWc7OF4oeVdvAlRWwAy7zOJhL2/Lm699Otrcjsn
	/fWK1g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xknvyh9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 14:40:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8DB1340049;
	Mon, 18 Nov 2024 14:38:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 925BD276BB9;
	Mon, 18 Nov 2024 14:35:33 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 18 Nov
 2024 14:35:33 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 18 Nov 2024 14:35:35 +0100
Subject: [PATCH v3 12/15] dt-bindings: media: add the stm32mp25 compatible
 of DCMIPP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-csi_dcmipp_mp25-v3-12-c1914afb0a0f@foss.st.com>
References: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
In-Reply-To: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_054015_143849_DE74405D 
X-CRM114-Status: GOOD (  10.48  )
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

Add the stm32mp25 compatible for the DCMIPP.
The stm32mp25 distinguish with the stm32mp13 by the fact that:
 - supports also csi inputs in addition to parallel inputs
 - requires an addition csi clock to be present

Add also access-controllers, an optional property that
allows a peripheral to refer to one or more domain access controller(s).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
v2:
  - move allOf after required
  - reword commit message
---
 .../devicetree/bindings/media/st,stm32-dcmipp.yaml | 53 +++++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
index 87731f3ce7bd528840d5fa85a863dbdfcabfad3f..7b03a77adbce8512f622fc992ef9913d52880f74 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
@@ -12,7 +12,9 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32mp13-dcmipp
+    enum:
+      - st,stm32mp13-dcmipp
+      - st,stm32mp25-dcmipp
 
   reg:
     maxItems: 1
@@ -21,11 +23,24 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    items:
+      - description: bus clock
+      - description: csi clock
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: kclk
+      - const: mclk
+    minItems: 1
 
   resets:
     maxItems: 1
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     unevaluatedProperties: false
@@ -39,7 +54,7 @@ properties:
 
         properties:
           bus-type:
-            enum: [5, 6]
+            enum: [4, 5, 6]
             default: 5
 
           bus-width:
@@ -50,9 +65,6 @@ properties:
           hsync-active: true
           vsync-active: true
 
-        required:
-          - pclk-sample
-
 required:
   - compatible
   - reg
@@ -61,6 +73,35 @@ required:
   - resets
   - port
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp13-dcmipp
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          maxItems: 1
+
+        port:
+          properties:
+            endpoint:
+              properties:
+                bus-type:
+                  enum: [5, 6]
+    else:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          minItems: 2
+
 additionalProperties: false
 
 examples:

-- 
2.25.1


