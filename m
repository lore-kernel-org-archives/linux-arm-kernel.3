Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A02C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 13:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qwm+UjEPRIZ0qNK/Yj6Iuy4ylM15S97DIRgqe5a+wRc=; b=LKNXlfe4Gh8rAWOiQmvyTHOBjs
	RXG2Oir2n0V/VaesgHQnUro7WpuSlsRCKFYP1fXPwuBqKMCiZQ0GUyPd57ZxScwtnPPIruDrUmbfB
	M9zJBwWFmxTjBB6hGh4+0i6Z0WfPtNPckjhTsW5FIjUyBgmi/X9ZUysnlw3/YKSwZ8+Sl4/r4/T+m
	XUq70SFR9TA+fh08gK1OkkINDQqosDUDdaSd9SDkebH54JNPIyXwTbLdmgP5oWT6nXWFcFnLHSRsm
	Y3nNc+AbqMO6UFP+6ZE8BQA+JEK7Zjpw55LP2dOoGAjvZaxhvsyY99ogIHTphWjOBprYbZeP/CKaK
	BtjOcwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucP1t-0000000AIdm-4C4S;
	Thu, 17 Jul 2025 13:52:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucO7e-0000000AAid-3T8V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 12:54:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCmLDU007216;
	Thu, 17 Jul 2025 12:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qwm+UjEPRIZ0qNK/Yj6Iuy4ylM15S97DIRgqe5a+wRc=; b=Lu092PU/HgrBEOGI
	NcYmp1MISuyRsVh6Ub1XrNGjk7pd2FwQsSBaGe607BpGRI2PzwI3YZmaVGiMO1jH
	WS5Dy2NKE+Pywgy6fAOikEQXn6BdugzpC5kcHvWNxeBKbwRnarWN2gbXOhkUl18R
	QAa+tx2M27ipdLxgUlZwdwNYskQfw00qTnTuOSmfd03mh2sWImbEatjioGO5XFIh
	66hBW10RPqbIarzxSOWEyoHvPzMyeBp/E2CwxBk6t0Hc/uEnRjM1+7YmV42Ouzj5
	vPAPi/h5VBZWJclLAkOQK660wgigLqYptRtqY7qZG9utRIw1ynLEx/UdWJTbkuE/
	XiOGKg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca8vfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 12:53:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56HCrsCR006184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 12:53:55 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 17 Jul 2025 05:53:54 -0700
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
Subject: [PATCH v9 1/2] dt-bindings: arm: Add label in the coresight components
Date: Thu, 17 Jul 2025 05:53:41 -0700
Message-ID: <20250717125343.3820505-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250717125343.3820505-1-quic_jinlmao@quicinc.com>
References: <20250717125343.3820505-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMyBTYWx0ZWRfX2CpWvInkgATU
 b4t/Hqwr7pC8m8jrwHxFz3TriRRjb8hkuc8BtDyEb4q+FFTzVRT2d08A+D81Rsgh3A+VDpHRnCu
 I1JQ5fgduxbdbepIjGT0pYQFui8tRRkRdyKg4/l6bKrJD/QNRCF3d7tuHaqsmeor+rKzQ6FkcoT
 PUI9mkTSpSSmAHl2wXxb8xHQqEz13IxCIBdGgXUuk1AbhbT/b80d3P6zyTrmqrDr+s8TPCFD+dn
 SEqa8VSCCubmuRha6CqZGa8wbgpUhCOex7T6fGYYryZZ8I+TS84s2RYAcpyw9Fzr+pt511ljARk
 c6QSF5duxNvc7/f7jLGoZdkrOoN4Prvc0/hz03pflJojW1vOQdGUmi4YF+X2Gmkbm8GDHblHP+e
 bdldX+NDrrAscjBCn58lEworIQKx5kVUGfjDJDCtC1EG3dm8cxx/vjdjyXxPWV+A27/ud0Ey
X-Proofpoint-GUID: BeaxjknQUA-nxA7S-ub8fbVt3zHsrC_D
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=6878f264 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=lttKXCBnEA6mHFaSAm4A:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BeaxjknQUA-nxA7S-ub8fbVt3zHsrC_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_055402_984760_9367A355 
X-CRM114-Status: GOOD (  12.36  )
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
2.25.1


