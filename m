Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894C2CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 07:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QngSi6IgxVQWcg/KGDjR996y18lURYimWiNLBoBgBw=; b=fNXZzkyBZgOlgp5580qWBLv7Mz
	qVvnwoyM+aibw2gLjwWUO3bB6g1aC2oGy+hEghC7raNf06BIXLXkPIicLXA6MsxNL2/dqCcgX5LgY
	0DxzAgWKgmJpe+DtWpOxomkNwP3qKT2s9TgUSj6aLMBqIZqFB49eQ5mDLMgiccJ2BPf9XlKSr99Tx
	eu9jzoMc+iLnG3qZU63IgDvwE3foVBP+w+GzVdAaWgbuY0vYi2zflOcFmTbFBQF3OE42i0QIsMo5h
	8EZ5ftVPq+bVHdqzE7XCO/UPG37pISL9tI2yRqz72zbXOxfQKduJdgg6q4VkCr9EA+XR3OI54brdA
	xCtK2FVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBNo-00000004DXx-3Ynu;
	Sat, 16 Aug 2025 07:31:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBIi-00000004Csw-3gtt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 07:26:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3Yqvv004368;
	Sat, 16 Aug 2025 07:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8QngSi6IgxVQWcg/KGDjR996y18lURYimWiNLBoBgBw=; b=QUQ0CxfkRHTJp9Xt
	zX6SF2Ri0MF0wr/CZpJeBfO8AWVuzg3TNc+TZ+sSHF8l20eeKxme/zsnsOR6nZbG
	cNbVuDlRGTj/a8cDSt3H4kq3gS42HghuP4ha6MHD1GDpu4upEJCG6u9yTJKVpdc/
	m8G10EDt+otXm5LEwpahVevTQA7wD/kBBuUIwI5GV2Y4izrt9tBeOx6p7EyjxPxz
	QfSxMylg3ojsKw6EILtu59PodkeK3rrsvCS4uKgQ1gX0J05RvaDgaSbqvqjIU5bV
	BKez5tbPDVjWtyCTTSxFBuY6n4azA7DDkDxKwf+I6JWoGlz9/+BE/cbzI4d9F0tz
	sV7ddQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj7408hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Aug 2025 07:25:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57G7Pnq3029211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Aug 2025 07:25:49 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sat, 16 Aug 2025 00:25:49 -0700
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
Subject: [PATCH v11 1/2] dt-bindings: arm: Add label in the coresight components
Date: Sat, 16 Aug 2025 00:25:28 -0700
Message-ID: <20250816072529.3716968-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250816072529.3716968-1-quic_jinlmao@quicinc.com>
References: <20250816072529.3716968-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IKKjlS_-cDSFDWRDI9AvOJbbfyhMqo9B
X-Proofpoint-ORIG-GUID: IKKjlS_-cDSFDWRDI9AvOJbbfyhMqo9B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX4zAyIV7kGMI2
 0jk4Jt8nvSH47uvf3A38laBq5Urrk/JVCGxu9ZROt4T/zjYwswVeaAkTHVqGe0NQDc4KUoUCo/r
 gOScvnsNFv5BH6zeStOKoW7hjHRJy6eK03FhtAeKOvWlrW1x99TtEaL0r5PMYIAoJMM/zyxafGN
 P9FzCgspyYK22PE0PwslxFzBCO6xq2iVFgFo1WDa8yCveEq1l1/pGLLrw+K3MyuwcXF5IfNrBcH
 p/OcGZWRmwfV9h5wne7+sXME+yP2dlCjok8s3bLqF+ZY+fyvl7WwtjhbBU5yW1DW5NREQa02hco
 gVmi+tKknzIeHZkgo8xjDCq6L3ZbosDbxv+Y6qfkXSNx8DGMI1GBzOJAq5Yh+yVZCj+k6aRneYo
 3xVkGxJy
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a0327e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=lttKXCBnEA6mHFaSAm4A:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_002604_927308_FC2C54F6 
X-CRM114-Status: GOOD (  11.91  )
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
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml  | 4 ++++
 .../devicetree/bindings/arm/arm,coresight-dummy-sink.yaml     | 4 ++++
 .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml   | 4 ++++
 .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml | 4 ++++
 .../bindings/arm/arm,coresight-dynamic-replicator.yaml        | 4 ++++
 .../devicetree/bindings/arm/arm,coresight-etb10.yaml          | 4 ++++
 Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml  | 4 ++++
 .../devicetree/bindings/arm/arm,coresight-static-funnel.yaml  | 4 ++++
 .../bindings/arm/arm,coresight-static-replicator.yaml         | 4 ++++
 Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml  | 4 ++++
 Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml | 4 ++++
 .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml          | 4 ++++
 .../devicetree/bindings/arm/qcom,coresight-remote-etm.yaml    | 4 ++++
 .../devicetree/bindings/arm/qcom,coresight-tpda.yaml          | 4 ++++
 .../devicetree/bindings/arm/qcom,coresight-tpdm.yaml          | 4 ++++
 15 files changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 2d5545a2b49c..2a91670ccb8c 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -98,6 +98,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  label:
+    description:
+      Description of a coresight device.
+
   arm,cti-ctm-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
index 08b89b62c505..ed091dc0c10a 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
@@ -39,6 +39,10 @@ properties:
     enum:
       - arm,coresight-dummy-sink
 
+  label:
+    description:
+      Description of a coresight device.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
index 742dc4e25d3b..78337be42b55 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
@@ -38,6 +38,10 @@ properties:
     enum:
       - arm,coresight-dummy-source
 
+  label:
+    description:
+      Description of a coresight device.
+
   arm,static-trace-id:
     description: If dummy source needs static id support, use this to set trace id.
     $ref: /schemas/types.yaml#/definitions/uint32
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index 44a1041cb0fc..b74db15e5f8a 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -57,6 +57,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  label:
+    description:
+      Description of a coresight device.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
index 03792e9bd97a..17ea936b796f 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
@@ -54,6 +54,10 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  label:
+    description:
+      Description of a coresight device.
+
   power-domains:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml
index 90679788e0bf..892df7aca1ac 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml
@@ -54,6 +54,10 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  label:
+    description:
+      Description of a coresight device.
+
   power-domains:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
index 01200f67504a..71f2e1ed27e5 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
@@ -85,6 +85,10 @@ properties:
       CPU powers down the coresight component also powers down and loses its
       context.
 
+  label:
+    description:
+      Description of a coresight device.
+
   arm,cp14:
     type: boolean
     description:
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
index cc8c3baa79b4..9598a3d0a95b 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
@@ -30,6 +30,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  label:
+    description:
+      Description of a coresight device.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index 0c1017affbad..b81851b26c74 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -43,6 +43,10 @@ properties:
           - const: dbg_trc
           - const: dbg_apb
 
+  label:
+    description:
+      Description of a coresight device.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index 4787d7c6bac2..96dd5b5f771a 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -55,6 +55,10 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  label:
+    description:
+      Description of a coresight device.
+
   iommus:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
index 61a0cdc27745..a207f6899e67 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
@@ -54,6 +54,10 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  label:
+    description:
+      Description of a coresight device.
+
   power-domains:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..c969c16c21ef 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,10 @@ properties:
     items:
       - const: apb
 
+  label:
+    description:
+      Description of a coresight device.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
index 4fd5752978cd..ffe613efeabe 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
@@ -20,6 +20,10 @@ properties:
   compatible:
     const: qcom,coresight-remote-etm
 
+  label:
+    description:
+      Description of a coresight device.
+
   out-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
index 5ed40f21b8eb..a48c9ac3eaa9 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
@@ -64,6 +64,10 @@ properties:
     items:
       - const: apb_pclk
 
+  label:
+    description:
+      Description of a coresight device.
+
   in-ports:
     description: |
       Input connections from TPDM to TPDA
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 07d21a3617f5..4edc47483851 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -76,6 +76,10 @@ properties:
     minimum: 0
     maximum: 32
 
+  label:
+    description:
+      Description of a coresight device.
+
   clocks:
     maxItems: 1
 
-- 
2.34.1


