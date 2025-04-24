Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE071C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nE4nDEjaGNTfZ3wkRGfHXnp9ttKR3/U5djq7HsbbKo=; b=0KPl+z0lR82QtS4eMnrIAkBuCe
	Ja5D048g2U/PNAbX9GhAC+9N6TD+TfH27h4OgxWL0F1n75Q78Pa0bdLriEm1Ql4/dPU4eceCa7gy1
	qxP8e6UCsXySO5D9RINwYYEF8SnlRcU15I2wn94MR+mjDRl6M1rQv4Pw2UkwxfRrIPt4ZjhJdxYzS
	ai8R8XprwwVm9iyD1Agm128E2DTEytLCUBi53rywb18GVWTtEmCwqip//S0c1oDa7KoO3N5A5WhZD
	c67bHjopxNj/y/ir7lekrYMwC9/5LFA4T4LSgGhtyxD5QQoVuxqZ5kPRV5yM1E+MOLSm9oZCui6Qa
	itxpkcEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uep-0000000Dq1s-1s6x;
	Thu, 24 Apr 2025 11:22:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sxs-0000000DW2G-3s6n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:33:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FbvK003788;
	Thu, 24 Apr 2025 09:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nE4nDEjaGNTfZ3wkRGfHXnp9ttKR3/U5djq7HsbbKo=; b=X80hbnbNWJw2hZyq
	EAW+x9n4yI1P58DMhzLduiwQeCv4Vm7vOhfLXMKuxD+4YSeMNeTc6OoXo4l7HIPg
	0Jayfq21wP3QLqM1QUZE0YHs64d1pJQ9rsAxIV7GMvVvgqfEau+mAomaHfYVg+EG
	v1hCr1lMnIheOu2GGKtHhT8yciTRWX0yTubuA+vjnS+29i4oL/dh/nSD9NAv1FMh
	83v9oxiBhzjWESYEFsSh+ySuZ/ae4U/UetQ1Ws4lZPN2CBk9Yx1z1q7f2vCA1Q71
	yUX+rabi9eno90ChCDFdrFV3owOW31ac11V6mURfEMAedNj8vAwNJWl9XnuAZsAU
	WRVOLw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0mynx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:33:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O9XlbV028096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:33:47 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 02:33:42 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 24 Apr 2025 15:02:59 +0530
Subject: [PATCH v8 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250424-qcs615-mm-v7-clock-controllers-v8-4-bacad5b3659a@quicinc.com>
References: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
In-Reply-To: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tIYfYV5s7hVCBZlowoNXc7MNoUte9GoN
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680a057c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=vHYOu0EEr4IEsFCh_qoA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tIYfYV5s7hVCBZlowoNXc7MNoUte9GoN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX1fx32KptSrNN pFBMv10op7NBJn8Ty/uxSM5DkPOwkgCfMyF+6NCmvAY+V10vGs3tIbvQGnmTEt7K8MDDEzK+AD0 C0uubOC45+KCLF6r/3D1aKuEK/X1DWUAwhOUg46EjYfejN0BhjDyGmPmEvXKIJR+cheOq16aGO0
 8MITsPZW5fsXDoo0yO5FEHElkgQYDw2xxVCyx0FhoTvOmGpdq0PQvWBeF6xphv8E+KxDo9M/g7O s1R3Qh8AhajI5yj9qV4TjxQgnfwleKG935qrVpQmJ4uV4THEg/qcTrO3rXKSjrg4tC4dQY4a8lY weOJQPOznC1+1FnBgVJcgUXcppQik6N1dcKEia2ub8GOK3XEdaIANEvOlG1APhdji/xYDYdRG9A
 jdYi9MXD1/Omrvd1llAoO16Udi1iVJ7fRiLUnjxrAq+30X1r+24LwLF+4RdfV45f0K1DLAuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_023353_097567_989123ED 
X-CRM114-Status: GOOD (  14.13  )
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

Add DT bindings for the Display clock on QCS615 platforms. Add the
relevant DT include definitions as well.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,qcs615-dispcc.yaml         | 55 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs615-dispcc.h     | 52 ++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d566f19beb0d76369ebfa8272224d01e7ecee63c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcs615-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller on QCS615
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm display clock control module provides the clocks, resets and power
+  domains on QCS615.
+
+  See also: include/dt-bindings/clock/qcom,qcs615-dispcc.h
+
+properties:
+  compatible:
+    const: qcom,qcs615-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 clock source from GCC
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Pixel clock from DSI PHY1
+      - description: Display port PLL link clock
+      - description: Display port PLL VCO DIV clock
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    clock-controller@af00000 {
+      compatible = "qcom,qcs615-dispcc";
+      reg = <0x0af00000 0x20000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+               <&mdss_dsi0_phy 0>,
+               <&mdss_dsi0_phy 1>,
+               <&mdss_dsi1_phy 0>,
+               <&mdss_dp_phy 0>,
+               <&mdss_dp_vco 0>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,qcs615-dispcc.h b/include/dt-bindings/clock/qcom,qcs615-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..9a29945c5762ce06285a2f4e6a55c13bfaadc5c2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcs615-dispcc.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_QCS615_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_QCS615_H
+
+/* DISP_CC clocks */
+#define DISP_CC_MDSS_AHB_CLK					0
+#define DISP_CC_MDSS_AHB_CLK_SRC				1
+#define DISP_CC_MDSS_BYTE0_CLK					2
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				3
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				4
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				5
+#define DISP_CC_MDSS_DP_AUX_CLK					6
+#define DISP_CC_MDSS_DP_AUX_CLK_SRC				7
+#define DISP_CC_MDSS_DP_CRYPTO_CLK				8
+#define DISP_CC_MDSS_DP_CRYPTO_CLK_SRC				9
+#define DISP_CC_MDSS_DP_LINK_CLK				10
+#define DISP_CC_MDSS_DP_LINK_CLK_SRC				11
+#define DISP_CC_MDSS_DP_LINK_DIV_CLK_SRC			12
+#define DISP_CC_MDSS_DP_LINK_INTF_CLK				13
+#define DISP_CC_MDSS_DP_PIXEL1_CLK				14
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC				15
+#define DISP_CC_MDSS_DP_PIXEL_CLK				16
+#define DISP_CC_MDSS_DP_PIXEL_CLK_SRC				17
+#define DISP_CC_MDSS_ESC0_CLK					18
+#define DISP_CC_MDSS_ESC0_CLK_SRC				19
+#define DISP_CC_MDSS_MDP_CLK					20
+#define DISP_CC_MDSS_MDP_CLK_SRC				21
+#define DISP_CC_MDSS_MDP_LUT_CLK				22
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				23
+#define DISP_CC_MDSS_PCLK0_CLK					24
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				25
+#define DISP_CC_MDSS_ROT_CLK					26
+#define DISP_CC_MDSS_ROT_CLK_SRC				27
+#define DISP_CC_MDSS_RSCC_AHB_CLK				28
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				29
+#define DISP_CC_MDSS_VSYNC_CLK					30
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				31
+#define DISP_CC_PLL0						32
+#define DISP_CC_XO_CLK						33
+
+/* DISP_CC power domains */
+#define MDSS_CORE_GDSC						0
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_RSCC_BCR					1
+
+#endif

-- 
2.34.1


