Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18509C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LszQRn/ay/FhXAzTM7WwW7Q1riyQTVUsLgvVZqo3HzU=; b=B2Lf61EnbOb9I3Pj5L3NIwZjyb
	xJn0Grq5amE+UpK4FoRML/+jI4HafkISLOfjGXrcvebt4PAjcYENvH63/JizJwyJM3Tu+aNdXc6B6
	SkphPgG5rmGGC+pBGxB4dJNzFE4R5TvxTelrl9lPGBuiKUr708U+UAI86cCSPO09l6bcQWSvZdcTt
	IA+jmxo5hI+Y/DuzNRpEkbG8gP36naj0A+uORh/DxzAUuhNfAo63IOIlBgNsM4tB2t0PkJBYKiICk
	KmrUbEYoJUhlvOFrAzKzBepqV99p3q28ooP7h/LLc6Stpp+l5AYYQ9IpmrNQRA8hv/HxN7cpuOQyA
	kT/KxQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHRM-00000003sdx-2Gfu;
	Wed, 26 Feb 2025 13:27:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGOR-00000003eVz-0v7z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 12:20:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9Ur01025442;
	Wed, 26 Feb 2025 12:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LszQRn/ay/FhXAzTM7WwW7Q1riyQTVUsLgvVZqo3HzU=; b=bAm2bLKqeMRvtMze
	pPil7rojJA22zyfpcFiljF2p0bKNa39gt3vW5v24xSjbWuC01vthPF8bS7z8sL+y
	CSrqmhE+OJlBa/jj3GHheA4j3Evfx1xFIxbX9l9AO6dVYmdHSpVvC5Gn8F958Gbp
	gG06DrHq7GFz4lNWEBrvbaUcueOEkIoOjK9g0W6XzySSoYy/YOReG1XYyXJ7mNmu
	Uy+mAufptVdExjsKoxBwojpt//iy0xzU8qiDg4Eby9romxkMPkkhx2Sfo8M+GZux
	zI8ONThKOA0Fkhobg9QbMY+3qMjq8Xt/+KrZEp/tooqq1berRrtQBKQZSDe5tX0C
	+zvSXA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmhxcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 12:19:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QCJt6P017408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 12:19:55 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 04:19:55 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/2] dt-bindings: arm: Add label in the coresight  components
Date: Wed, 26 Feb 2025 04:19:25 -0800
Message-ID: <20250226121926.2687497-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226121926.2687497-1-quic_jinlmao@quicinc.com>
References: <20250226121926.2687497-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OYkSxgb0VYPnny7XURLPDzEsOmzvEhFY
X-Proofpoint-ORIG-GUID: OYkSxgb0VYPnny7XURLPDzEsOmzvEhFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502260098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_042003_397601_07973AFB 
X-CRM114-Status: GOOD (  13.13  )
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

Current name of coresight component's folder consists of prefix of
the device and the id in the device list. When run 'ls' command,
we can get the register address of the device. Take CTI for example,
if we want to set the config for modem CTI, but we can't know which
CTI is modem CTI from all current information.

cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1

Add label to show hardware context information of each coresight
device. There will be a sysfs node label in each device folder.

cat /sys/bus/coresight/devices/cti_sys0/label

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 .../devicetree/bindings/arm/arm,coresight-cti.yaml          | 6 ++++++
 .../devicetree/bindings/arm/arm,coresight-dummy-sink.yaml   | 6 ++++++
 .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
 .../bindings/arm/arm,coresight-dynamic-funnel.yaml          | 6 ++++++
 .../bindings/arm/arm,coresight-dynamic-replicator.yaml      | 6 ++++++
 .../bindings/arm/arm,coresight-static-funnel.yaml           | 6 ++++++
 .../bindings/arm/arm,coresight-static-replicator.yaml       | 6 ++++++
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml          | 6 ++++++
 .../devicetree/bindings/arm/qcom,coresight-tpda.yaml        | 6 ++++++
 .../devicetree/bindings/arm/qcom,coresight-tpdm.yaml        | 6 ++++++
 10 files changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 2d5545a2b49c..5ca6d3d313a3 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -98,6 +98,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   arm,cti-ctm-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
index 08b89b62c505..bc82cd1f3595 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
@@ -39,6 +39,12 @@ properties:
     enum:
       - arm,coresight-dummy-sink
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
index 742dc4e25d3b..3010055d5ad6 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
@@ -38,6 +38,12 @@ properties:
     enum:
       - arm,coresight-dummy-source
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   arm,static-trace-id:
     description: If dummy source needs static id support, use this to set trace id.
     $ref: /schemas/types.yaml#/definitions/uint32
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index 44a1041cb0fc..30776610d4b4 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -57,6 +57,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
index 03792e9bd97a..178a3861ee29 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
@@ -54,6 +54,12 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   power-domains:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
index cc8c3baa79b4..39b291909cc4 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
@@ -30,6 +30,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index a6f793ea03b6..022a1097af3c 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -30,6 +30,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index 4787d7c6bac2..6a37ebaf474b 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -55,6 +55,12 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   iommus:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
index 76163abed655..986b9b4f360d 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
@@ -65,6 +65,12 @@ properties:
     items:
       - const: apb_pclk
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   in-ports:
     description: |
       Input connections from TPDM to TPDA
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 8eec07d9d454..59e533720bdd 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -77,6 +77,12 @@ properties:
     minimum: 0
     maximum: 32
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   clocks:
     maxItems: 1
 
-- 
2.25.1


