Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59B4C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 11:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bn7IN4QntrmEpPgFtV7vdjI6LpAFx6kSGQ/zOJ8UKgQ=; b=40RROBxQIHsTFhs6cUC5t3QtkM
	db2neOH9TnlRM7PibBEDPi5vjTFQOoDxIP0yUoO6QjGv339nXvWQe9VKUhzC/SOqdyK8m0INWPKqd
	6Jp24qHCFkTMixYhySGaa/I0Ir3p/1x5szL8p1PZxMFLqBKGJCrX4zCwFvfy/QZXHa3po/gtRZLdd
	023HQb+aq4XH5mcqDubQjFH3K9/3z9pjgip8G5M/xwWfo/hzkS4goQXuycun9kkk58mnf87OvbipX
	PwoU7kMglSmsGSrqKamLSHMnSzO5t6aR8b1jpN41ue5ilCSO7mok2fxowbF5V6j/9DXSF7U8+Tpuc
	r/m9U/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERLf-00000009FoB-3t8g;
	Mon, 12 May 2025 11:29:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uER4M-00000009DJS-3zV6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 11:11:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CAKZJI015473;
	Mon, 12 May 2025 11:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bn7IN4QntrmEpPgFtV7vdjI6LpAFx6kSGQ/zOJ8UKgQ=; b=UAN1IaYRGNpavVTT
	Adv/CGwSCrPSPJK+BL+DXL3pbyNhH5wXKVxZ2JrmqTbyKqAMBZ3LFgN2ifddeXfm
	GULAdAT1tX9PwRGa+XFIitXYt6n+tpwJBmPvbZfBi+bbuOB1yJB4hBhM9BErWz+Z
	Mm1Ygngpwn0nZj/63fOQDpftquGhFlPy8n2h7mWE5x/fXTCHL8kQFWpIan/aLhnB
	hBER1hch5gPliCteLHbx8zbhvJw0K3qAja81BsEmDvgB0rI34bi1SNjp3IV+AIag
	OdixG1YobHmkJkEZlIbIXOJecP7v1tsTZy6VbXOGZ/7Ftlp4pcwlJG5MnK+SeVCE
	Y5OXOQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyjjm1yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:11:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54CBBOvv025047
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:11:24 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 12 May 2025 04:11:21 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Mon, 12 May 2025 19:10:37 +0800
Subject: [PATCH v5 1/2] dt-bindings: arm: Add device Trace Network On Chip
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250512-trace-noc-v5-1-f2ef070baee5@quicinc.com>
References: <20250512-trace-noc-v5-0-f2ef070baee5@quicinc.com>
In-Reply-To: <20250512-trace-noc-v5-0-f2ef070baee5@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747048277; l=3625;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=hiSScpjEHjYXsHewL93gr04mirii3oB/kuXOXOyEQ7w=;
 b=jGDIQuTW5smbeVFNFXci4BSNteEp1Pb/Y236vhqJWGMRGM2RrbryiWNX8lvQpDvJ/Y5QW5rFn
 wGh51PBQdUrDwhN2BRP8LEq2uED3ORgJIEYedBqeIn/EpGZJh3kri4Q
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDExNyBTYWx0ZWRfXyko/d2gWLsIM
 Pm0lv800vndLx9U/P3RA6siI7sHyw5ISzNVICKfbMEULRAtk/230WfOAxmA2F6F2bPVUiuOzC11
 ZKld1WjFOI297oXInEkqxo6j8B6B0E3iAH1urx2+zjcFMGRfR7ckI5DKhHUvfL/odosI1GDueqE
 veMhi4TO5p75MuqIB9sYpuLakLBoI/w1XJ669Wh5oJjAzd0h5tw9DPraSfc5w4BX9arC22xI0g7
 Vw1UvE4oY9RXmlqc9e9zyvvTXXc71SfXjujr+IC6TzwWcACEfdgmB5kEXxl5QlSRGVu4kB4RDJa
 drB5TDHDcY4sEOY/PSBvivLYIb220+PM5qIoQPeWJZB0YHrh5Y/qPTUO792UeJzjvks+BSHunvt
 q6HboO5HzLXw9gkKmD/MMKYxqUc5iEPOYR/Vgd4BnDB/GcoiIwCCsalckAWyzlq/EcU1sH24
X-Proofpoint-GUID: 50ZfsTofrsx1nochlwOe4_uyEq4yBizd
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=6821d75d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=APcPAnuBUoPLjZ3N-PUA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 50ZfsTofrsx1nochlwOe4_uyEq4yBizd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 spamscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_041139_063487_D920B5F6 
X-CRM114-Status: GOOD (  14.33  )
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

Add a new coresight-tnoc.yaml file to describe the bindings required to
define Trace Network On Chip (TNOC) in device trees. TNOC is an
integration hierarchy which is a hardware component that integrates the
functionalities of TPDA and funnels. It collects trace form subsystems
and transfers to coresight sink.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 .../bindings/arm/qcom,coresight-tnoc.yaml          | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d07c6f2d7b949f69f9d8dd8de8664382eb39fac1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-tnoc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Trace Network On Chip - TNOC
+
+maintainers:
+  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
+
+description: >
+  The Trace Network On Chip (TNOC) is an integration hierarchy hardware
+  component that integrates the functionalities of TPDA and funnels.
+
+  It sits in the different subsystem of SOC and aggregates the trace and
+  transports it to Aggregation TNOC or to coresight trace sink eventually.
+  TNOC embeds bridges for all the interfaces APB, ATB, TPDA and NTS (Narrow
+  Time Stamp).
+
+  TNOC can take inputs from different trace sources i.e. ATB, TPDM.
+
+# Need a custom select here or 'arm,primecell' will match on lots of nodes
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,coresight-tnoc
+  required:
+    - compatible
+
+properties:
+  $nodename:
+    pattern: "^tn(@[0-9a-f]+)$"
+
+  compatible:
+    items:
+      - const: qcom,coresight-tnoc
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+  clocks:
+    items:
+      - description: APB register access clock
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port(@[0-9a-f]{1,2})?$':
+        description: Input connections from CoreSight Trace Bus
+        $ref: /schemas/graph.yaml#/properties/port
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description:
+          Output connection to CoreSight Trace Bus
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - in-ports
+  - out-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    tn@109ab000  {
+      compatible = "qcom,coresight-tnoc", "arm,primecell";
+      reg = <0x109ab000 0x4200>;
+
+      clocks = <&aoss_qmp>;
+      clock-names = "apb_pclk";
+
+      in-ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+
+          tn_ag_in_tpdm_gcc: endpoint {
+            remote-endpoint = <&tpdm_gcc_out_tn_ag>;
+          };
+        };
+      };
+
+      out-ports {
+        port {
+          tn_ag_out_funnel_in1: endpoint {
+            remote-endpoint = <&funnel_in1_in_tn_ag>;
+          };
+        };
+      };
+    };
+...

-- 
2.34.1


