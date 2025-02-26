Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36EFC021BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BJ9m+OcrsVe6qRr2/JNSjlpV/qrhWLozW8aVA5xbWc=; b=Ff2DkowjnskuOv/3YSUMHYGgBX
	X9I+8wRsbJaqjyhK9H3hqiL3t87B0uKXsvuQN7R4pTM1KZuUxGZJd04p8G/pvfLMkgVRFS8ySQf+C
	Oi+0sonZJaKdGwJ9Pf/Oiq20kR2lmkLW5ggic3q/0/q49E38p5Ubbz6IoG+deqPsf6S/LUHJTsWPD
	dSW/18HpxBY3iMuAJqCt9cCzE4Mys6D/1zKlxik5IIb6GsWFHyG35DzO+i0j60hbecQFg+iCleL18
	PewyUTqoA0oL6eBo2j+oGJgG8oLDD1HebNRjsnDcFS7c3V3aySMQDDbduVH/46D20eymFHSRX9Yr4
	E+qstygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHP8-00000003pXm-1OUZ;
	Wed, 26 Feb 2025 13:24:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFFH-00000003Q8w-2Kno
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 11:06:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QA3eHt017726;
	Wed, 26 Feb 2025 11:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BJ9m+OcrsVe6qRr2/JNSjlpV/qrhWLozW8aVA5xbWc=; b=bHP03lp/RDv7qHnz
	uc13NGG+JRZJDEmOZETNRskUchNTu3Ygi29i9yMoFlKuwEqHu7CCDFd5Y7+42HeJ
	aMKp/8k0F8y2zKCI+8GIEJj8xD9JtabwdJykn/MiVoYYIGicJ1Y1c4D67/UWC5AY
	xVCvF17aeiD79A5x5CPjM942mvH4JjqeG70wmDnf3j9C3MyZeL/aS02E7bMMzJrV
	LWVS26pgRlezeN5iNQYkEFP4JeN/vGcr0+uEk0kmk05J56HbWx8RxdEfuB7th5dd
	Hv2LbyvwBA9dIi3hAYW4e9YyEv7mJ6WApau2eWHvFvnoZKyoFNFrQAnzlrfsrBT/
	0OpHrA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn1r1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:06:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QB6NTk020852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:06:23 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 03:06:16 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Wed, 26 Feb 2025 19:05:50 +0800
Subject: [PATCH v2 1/5] dt-bindings: arm: Add Coresight device Trace NOC
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250226-trace-noc-driver-v2-1-8afc6584afc5@quicinc.com>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
In-Reply-To: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740567972; l=3550;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=mQRaiDx0oUaGa2qOav58eJ/XL1EVd3She1ceBivGTsg=;
 b=53Q8EtJ+ug1LmIZPATpN89Fz6KvKemB3Mvay9lk7ZmqD1NRBJvY9TVP4Tn6KBVQyUemY3UdV1
 dZPFop6NSb9AnjEo2ZM8Wg9SjsA5W/1gymRiRxyCjHH8NlA/yigzpep
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yX6WLZAC9Lc5Lry8p8-r-vn1bR7Qlm8P
X-Proofpoint-GUID: yX6WLZAC9Lc5Lry8p8-r-vn1bR7Qlm8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=2 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_030631_717896_0914B34D 
X-CRM114-Status: GOOD (  15.49  )
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

Adds new coresight-tnoc.yaml file describing the bindings required
to define Trace NOC in the device trees.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 .../bindings/arm/qcom,coresight-tnoc.yaml          | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2d806cc34c381d27b47dcce126ce5bcf468826a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-tnoc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Ttrace NOC(Network On Chip)
+
+maintainers:
+  - yuanfang Zhang <quic_yuanfang@quicinc.com>
+
+description:
+  The Trace NoC is an integration hierarchy which is a replacement of Dragonlink
+  tile configuration. It brings together debug component like TPDA, funnel and
+  interconnect Trace Noc which collects trace from subsystems and transfers to
+  QDSS sink.
+
+  It sits in the different subsystem of SOC and aggregates the trace and
+  transports it to Aggregation TNoC or to QDSS trace sink eventually. Trace NoC
+  embeds bridges for all the interfaces(APB, ATB, QPMDA & NTS).
+
+  Trace NoC can take inputs from different trace sources i.e. ATB, QPMDA.
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
+    minItems: 1
+    maxItems: 2
+    description:
+      Physical address space of the device.
+
+  clocks:
+    maxItems: 1
+    description:
+      Clock sources used by the device.
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port(@[0-9a-f]+)?$':
+        description: Input connections from CoreSight Trace bus
+        $ref: /schemas/graph.yaml#/properties/port
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description:
+          Output connection to CoreSight Trace bus
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
+      reg = <0x0 0x109ab000  0x0 0x4200>;
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


