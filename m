Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F83C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 06:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9T6vDCQgh1gIYQoLsdnmEUZ+H4oulTkXaYpu8/f4F1Q=; b=EI0i5R3kxz9XvFFafzJsF8/uKu
	1/zW8MNwb1H4xgHKHAVpSQGpCoZYN6nKtnrGLpLZxCLhs/2VViNsqdO7iUoKEfqSWwfBRgIgpCPCV
	As18/gxJdmiDhFObwvJGd40Q22mUXSG+VMiPMMKp34WDcRhk3Ft4jZukQtnEsin/Q/JAzKy5VJeTP
	TQgQZA9/MRKlpc4SDn2dqomdveJL6ps7IpHwRuvzhXlx5miAfVDc9P/d4xMYxKDM5jVHIdAAuAlNK
	JqFeVeUicRlfkKPZlpfsF67mSmy2O5EOr4I+Poh02e4oXjunOpWwlX0ia6XwpuOMekg/uhC9Yq/0S
	ZR31/MDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMJi-00000004LZR-2UVQ;
	Fri, 21 Feb 2025 06:15:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMBS-00000004JvM-32lh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 06:06:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L49NNg023203;
	Fri, 21 Feb 2025 06:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9T6vDCQgh1gIYQoLsdnmEUZ+H4oulTkXaYpu8/f4F1Q=; b=bFgKgyJ1HHM6fr8I
	vhgVjMmGKlFD7MgOVT1pcVirc25R2wSy7pPb6LHBNwkddOlTE+skuCyLDRPcEj/Z
	vaw6S8/933jFmbrZoLqmP28z2SDSoLJeVfeKUiWtBnqpY571YVeaocSm3lgEujrU
	cpdT35NoCg/3bldyRj3XHwfi9H8NWVa/Br5zFCk1vVqnZ33Kf7YywsZQ5M13SgNe
	P6loHcI71N8yf/B/quH4SePbZP13wJKZnRnCEegD2e6jbNXp3sx3ZnVPLVEBM5od
	vy9w+2JGj98lv3I4taI8RKXk437EZxGvQZ00v9+AhHSx22TmebvgwOlZanrZGMxF
	k7sWrA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3rt4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 06:06:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L66ZEd005348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 06:06:35 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 22:06:30 -0800
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v13 5/7] dt-bindings: arm: Add Coresight TMC Control Unit hardware
Date: Fri, 21 Feb 2025 14:05:41 +0800
Message-ID: <20250221060543.2898845-6-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221060543.2898845-1-quic_jiegan@quicinc.com>
References: <20250221060543.2898845-1-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5BfywQgXvOFt9uaBTR_4EnJpqkKMj3Bd
X-Proofpoint-ORIG-GUID: 5BfywQgXvOFt9uaBTR_4EnJpqkKMj3Bd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=2 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_220646_878724_EB915D37 
X-CRM114-Status: GOOD (  16.56  )
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

Add binding file to specify how to define a Coresight TMC
Control Unit device in device tree.

It is responsible for controlling the data filter function
based on the source device's Trace ID for TMC ETR device.
The trace data with that Trace id can get into ETR's buffer
while other trace data gets ignored.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 .../bindings/arm/qcom,coresight-ctcu.yaml     | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
new file mode 100644
index 000000000000..843b52eaf872
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-ctcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CoreSight TMC Control Unit
+
+maintainers:
+  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
+  - Mao Jinlong <quic_jinlmao@quicinc.com>
+  - Jie Gan <quic_jiegan@quicinc.com>
+
+description: |
+  The Trace Memory Controller(TMC) is used for Embedded Trace Buffer(ETB),
+  Embedded Trace FIFO(ETF) and Embedded Trace Router(ETR) configurations.
+  The configuration mode (ETB, ETF, ETR) is discovered at boot time when
+  the device is probed.
+
+  The Coresight TMC Control unit controls various Coresight behaviors.
+  It works as a helper device when connected to TMC ETR device.
+  It is responsible for controlling the data filter function based on
+  the source device's Trace ID for TMC ETR device. The trace data with
+  that Trace id can get into ETR's buffer while other trace data gets
+  ignored.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sa8775p-ctcu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port(@[0-1])?$':
+        description: Input connections from CoreSight Trace bus
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - in-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    ctcu@1001000 {
+        compatible = "qcom,sa8775p-ctcu";
+        reg = <0x1001000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb";
+
+        in-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                ctcu_in_port0: endpoint {
+                    remote-endpoint = <&etr0_out_port>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                ctcu_in_port1: endpoint {
+                    remote-endpoint = <&etr1_out_port>;
+                };
+            };
+        };
+    };
-- 
2.34.1


