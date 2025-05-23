Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C554C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bn7IN4QntrmEpPgFtV7vdjI6LpAFx6kSGQ/zOJ8UKgQ=; b=L2+FSu87ZTDU4bkBpwGrhUu2w9
	cptH+l7eFZtpJFucfMsp1XVSiu6+ab7x3MlFW9EifnNaJ2ltU32Oa2eBNDn+TQaANXlHVmGoXDnW5
	tRwK1Qdj9C5nlAmSYoe+yMe7prycHGgZ/9eMDQPxKkWI/PjrrR7RTTn11JzxoUCbk525yaauF82e0
	ROC2jvK29rTdzbP8XShbMhPwsxkiF1TiPV7r8oPK2sZZcaiVXggUQNKBA99nDhB5Q72bqzlf2gZ8i
	N2KzljGHaLu0P2k8KbeXOb2IKzxp1fuTbqh8DMZF+M+B3wc1lIs37C2/xaL1RkHJ19sZKHP8U696Q
	OtIc7quw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIOZ6-00000003QPE-0udy;
	Fri, 23 May 2025 09:19:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIORZ-00000003POW-0E52
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 09:11:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N67nfS029249;
	Fri, 23 May 2025 09:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bn7IN4QntrmEpPgFtV7vdjI6LpAFx6kSGQ/zOJ8UKgQ=; b=T0TyHCm1w0FVX4pd
	f5DjU/Va2xUQKHBFsAsJu0tcqw3sPLv1aCxBJfoSrNZaLe+9yPz4AnEkHldl99Mj
	0YXuCKO+i3HorEkNrJhiKTSzlIMfY/DU2BgoArKwBwFApN/WAfSR6v3JGuodQNub
	Tgt1F2Jv0vo3pIjcb4fWrWVUatx3AyhG+n31DQesMsw4jXa8S7jO3eM+Mb3xoy9Z
	7mJwK5R0ptL5FiJ5cHPgtdCbR1eC0dlcLa8r/aQP7nmwCEzk3ftNyT0v0h2pErZN
	oQkcfpMh4UnQ/oCuQ+q4a9SaFCFN89axI6NpUprbl+8IaN54NqmCt3KqN7kHpAsF
	0aCdqw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb9bmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 09:11:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54N9Blj0002718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 09:11:47 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 May 2025 02:11:43 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Fri, 23 May 2025 17:10:59 +0800
Subject: [PATCH v7 1/2] dt-bindings: arm: Add device Trace Network On Chip
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250523-trace-noc-v7-1-d65edbab2997@quicinc.com>
References: <20250523-trace-noc-v7-0-d65edbab2997@quicinc.com>
In-Reply-To: <20250523-trace-noc-v7-0-d65edbab2997@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747991500; l=3625;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=hiSScpjEHjYXsHewL93gr04mirii3oB/kuXOXOyEQ7w=;
 b=i6Q0cTq2KKyp3o9NJIcDepUNHL+Lw63vfdDdMVAOaUVkqoh2m7V6ftYF600zx3PDjpSHWiCfQ
 Gg9qe7QZHBLBNwHyg5MEBln1Ruov47zmxhatvjomEYUWAnSaT/Ryf0Y
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2lMZhyY0t6L4nJG-FZmh8GqEXy11hKZj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA4MCBTYWx0ZWRfX7aZEChS5nr+G
 VBhjnt+DgKDk1Sh41cXSu044Ji6Q/idYmIIdEXo/XLTVj6NSnhVjUiSvWY8Nby9QKqEcYbhUxbX
 4YhM6+KYSGLLE/UL6r8zUhvZNuo05NM/x0da9kgVKTov/4HQfMFzSV9OQ+uoZwKqNQ5gF0RnoCk
 zuPBc3h0b08RDIxL7Z6vzoixX1BDN08Nx/cguodF+tBF6JsHDJjoXsQX91UxSDY3q2em+nIWqgb
 9MjI+fek4V6tpIAQwAPqHnUpGP0IkPpFQbXJS6sdFTbpk+DRIpQQl3fyT2u+qNgdRZ6vESBfeiK
 xzsYfOq1kxWtQ1Vdh+SujHCEOF8FbZ8CyE7VsVU8LOtvUaYOBoqp77FQyDfSKYt9OWLG7VcfQs/
 rDquknDwwZu7u38KZQZmyjldffgx21X5il9+c+VflrRQU5XUabhg97OVQB8GBUxRPdyu1k+r
X-Proofpoint-GUID: 2lMZhyY0t6L4nJG-FZmh8GqEXy11hKZj
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=68303bd4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=APcPAnuBUoPLjZ3N-PUA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_021157_228989_EBEA7E2C 
X-CRM114-Status: GOOD (  14.16  )
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


