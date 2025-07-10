Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F085AC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 05:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evrkd87jfn0W/wAyuRRT/tRWfSuU3fmS4lf2bubqfAc=; b=rXwTHTMBmOs1/wu6qxKNEec/QM
	pmBmIZQNBh7saNV8+XzAF6IzZrUmq8DVpNC7SswHekni6z1xYMnSGuBqdjqM5rfe4XK4I7OMWAuH8
	i536ECyr/JVj9qhgoK7ou85pMCEcadyt0PP57qvrboAh0SP9AClpxiZHUqlgxMIOEHVvzbvHQRpM8
	IFKShvuUtLo/OsKvFj2qeSD/C77mIBqvWvSDaGK64s2R2ZB4B9ZE5mmbFwEBUkSC3Izm0z56K429Z
	pygab1a3tfVi4rqgCbmh+wFjb+r2YtU6PkrlsiFt4CYsL/E1wwI6LVAFIpGvPITfv/UEsNrUNA3wY
	Tip1MEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjrh-0000000Aj7h-3Hw8;
	Thu, 10 Jul 2025 05:30:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjpG-0000000AikW-1phO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 05:28:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A13Z5d010019;
	Thu, 10 Jul 2025 05:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	evrkd87jfn0W/wAyuRRT/tRWfSuU3fmS4lf2bubqfAc=; b=Qhs1kRHFabDAgWa1
	blferBnNAmZv9WCz6SWy8OU4cpQOrGHQ1q8gqSaiI7UGAws00e8xJQKMGWTDnk2X
	+Z+OoSoXQSbY2CJFOH/a8rNKsy1xbvwW2ntDaQMeDb4DB9BQ/aRkE73SQTZ6nRQ3
	ezUXOxESHyadeRQHwmWg6znF7RfXNBn15DIwEY2w0dFQ4+ocXB3VuIfgPqtAJR6W
	TGD/xvBrXj/I8DIpPEy5F0iNxtCGqSoflVu2pq64u7Gs/U9ESYTRj9+aOypTpnoZ
	p/2jTEYWX5FrU+9FKNotFHVZ5Pqr70DxH1P/W0pRIbdbMzI5Wfhhr9zYyiNwf6+f
	SYNEkg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9q3k5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 05:27:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A5RvHt018797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 05:27:57 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 9 Jul 2025 22:27:53 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Thu, 10 Jul 2025 13:27:20 +0800
Subject: [PATCH v11 1/2] dt-bindings: arm: Add device Trace Network On Chip
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250710-trace-noc-v11-1-f849075c40b8@quicinc.com>
References: <20250710-trace-noc-v11-0-f849075c40b8@quicinc.com>
In-Reply-To: <20250710-trace-noc-v11-0-f849075c40b8@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752125269; l=3706;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=AFlPDAfvpFRs502y4BiSUg4V6YbG9yCR4NGBIEHaSpc=;
 b=dKOnm4HE88ZaWjXM0ONxdFXG/Ti04aUjIB36QfcG/BT+zI+FqxcBMRxN1qslw50OXVo8CG5C7
 eAJ+n9qznYvBE9UoWoTPPqGQRnuKmVwrX11bW1zutm2TU47vElbzttZ
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZdN9SMo4_USxUpJmswpWDBNw9OsBPsFJ
X-Proofpoint-ORIG-GUID: ZdN9SMo4_USxUpJmswpWDBNw9OsBPsFJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA0NCBTYWx0ZWRfXy0yOO4f5qmJ0
 N81+ziQb02UVbup2jx6lxgZnWL0FKjS7wSCbgx/C844XaaQrrJzbAEyuUjmTOWfiG6qZYiQf2HW
 n2GlYn5C4VOyoBgxcHyzFuYXDJ1MCm4mIYOGTQPE7Yj7YFZ17kxfzl70hLZxUGQLxwRT71RHEjj
 HrpdJVUCagN0mGjr93k4hBAHaD9rjW5IhHew9LpgfGi0DSnGxfWLZbMX0xWLxKWcxlJpD9tzBT6
 yUQPCODdGAq+IqqtwZQAhWIoToUrrVQ+YagwWwi6zpksTZKJOK8tO14wPQG+eiPtZ6gDFygRFak
 wRbNWXS3kuk2Y5lBDwMvNrvb647Ai49PzxDVV6bD/IMvQQzWlgneH+FPH/yRd8l3IMrcpu4d3lm
 1Pa2ASS4hKi/LT5MP/4GW5WUSyxKETB2pEEvZZeGOf40pFyFXsovuOSpEqUtU1fI5ljcDJIo
X-Authority-Analysis: v=2.4 cv=BM+zrEQG c=1 sm=1 tr=0 ts=686f4f5e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=APcPAnuBUoPLjZ3N-PUA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 adultscore=2 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_222806_501958_82B0E2CC 
X-CRM114-Status: GOOD (  14.44  )
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
 .../bindings/arm/qcom,coresight-tnoc.yaml          | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9d1c93a9ade3ff14ede4a8d1481782776cf47be9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -0,0 +1,113 @@
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
+  Note this binding is specifically intended for Aggregator TNOC instances.
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


