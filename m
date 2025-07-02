Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9694C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 09:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnOzQi08jAEiwY9awZL79NKkRrHw27xmzgDmDid1kBE=; b=O21mP5SImbuwq2fHxDmrY68jhj
	fRsi5X9XzjXfJhTRshoiTVDPC7rurzenRQUhyQo6nCbGTk0wtkHbf5bA2yrd0zzD08QChjGKKdABb
	/3+W7jHBcrSAfRuP5eR4yT+wLlb3MTCXfvHvOEc767r11mrWMZf2pVofdAnFJr+jxbzFlGaO4w4xd
	sjGF2V2HT0xsTbMdr749l0ywb2JZQ0mQXCi04W2nPIDigpeYY40kpBYdNhFSj5QUzB3j4GaU/tGPI
	o7vwLpWXDcwDzWoLWUA/jWOxRA8iJm/58tgeeqV9rQz9FLEssS6xhp/U7jmc+1Gtm0/M7YaAh8HK/
	0iUe5Wtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWthP-00000007l1l-2MlI;
	Wed, 02 Jul 2025 09:24:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtPV-00000007gqs-2tG2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 09:05:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XnOzQi08jAEiwY9awZL79NKkRrHw27xmzgDmDid1kBE=; b=iuiBhv+HVCDGmxfPE3z5yF4vLK
	XdnE7QIADXGQAsqNbFVWR8+4O+nSEdaslqeBMOPPNgwPqo9Fh7C7er1amFV9t+jZ1Xmfl1qlubXzY
	VmiOh+5vTpYRPOM9Eu6zy/uqlRm27Vs2xTFGgy94hre3qEv4XMl1nylLKokV67gx9z/4pKSFBDnF2
	8TU4DtmPwwJnw5nW6ZFvPc4u46y2QMRb0pQPn/J4B2ZoIGqB+dQXqBF5V95/tgyCRpYwSCPoZGxBZ
	Goj/q2fqLNFWalZLDlGZ/SoV6EAlBnORHE61IJJjYtr3ocHNHOoUKo/T6sAzO868dnNX8jgfBXtZh
	/QBcgF0g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtPR-00000007KCt-3lc6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:05:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56260Lch018912;
	Wed, 2 Jul 2025 09:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnOzQi08jAEiwY9awZL79NKkRrHw27xmzgDmDid1kBE=; b=JUBQ4ZLP7/9LzmIZ
	EQjqgWXt455DySj9Ndu3dqlk3ozlzYlu6Cpk8XLfBUer19CBCTraiGZSj3HaZKZB
	qN9dfhWcnaD4CXpxemQ4Lb/AiNH72CTt1aFY3YYo3vMcCJ92hbsezd1NrwxCYVGQ
	K/e+EOtK0KDp7K4/QiX5CYbd1bdWkBbSg42j28308mrxSXyie20ib116wtwNF9a9
	ZbbjPSdnIqQtdGTQk2Rb0c1dz6eiE7Nj3k7lGo/RJYoagsUegQr12gmWTJb5mAIY
	6lPwW+xl15+WEQbQUuw0KDQBaQuMbdxjRxb+/4BBPN7qSK7LylO1R2P0rS8m5lLj
	3mWKgg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxm0rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 09:05:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56295U9C027414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 09:05:30 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 02:05:24 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 2 Jul 2025 14:34:26 +0530
Subject: [PATCH v11 06/10] dt-bindings: clock: Add Qualcomm QCS615 Graphics
 clock controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250702-qcs615-mm-v10-clock-controllers-v11-6-9c216e1615ab@quicinc.com>
References: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
In-Reply-To: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MyBTYWx0ZWRfXwtn3x2GNUiU6
 VgFpcgNUC/TlpLbXPwTe2BSXTc1ePFBV6y1MablF9VSUs/Xkn4JJJJtjgOW51aF15QxLic2aCpC
 8ScAPxteKmPTsPu5cqVE5CEAxfrZMJ8vaTw1nTo5mOgCXjyKxiCLvAkfcyuXtBDcUSdpjDG80WU
 6qRP92g4EMSg6Y/7ZanBU7bi0Q0r9xsFrVnVcLgnbD9UTX7iR6/FecF32DmcgF3Cx+Q49luX2ml
 xonemHMtpdwjLszHZAzv8aYbPPFLcefOyFeQH3JxwRID9hS7xtoTGrqCLocvUK0wAkmcs1mIz4w
 Kl5hmqYsnW47p6+ex5yc3gMf+4jspr3ldpunC8T6bl0blhGlDBFEOCHP4DF/ts3vh+1ZJeePnn2
 f2qdQ3XiDDRLAbetMwtVNVRIPpSkBzmDShJZaAHBan9uwlHKL12VjZTm4rbxGDFybsJ5rLGI
X-Proofpoint-GUID: HA-WiLiVMtb9Tlpokdcmv8zaysyGRmni
X-Proofpoint-ORIG-GUID: HA-WiLiVMtb9Tlpokdcmv8zaysyGRmni
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6864f65b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=Fd_aqQ4HFp4EpFgKmb0A:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_100542_270164_79D042A1 
X-CRM114-Status: GOOD (  15.24  )
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

Add DT bindings for the Graphics clock on QCS615 platforms. Add the
relevant DT include definitions as well.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,qcs615-gpucc.yaml          | 49 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs615-gpucc.h      | 39 +++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5f7d83d1a7be301dd38709f69167d7cb9319f076
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcs615-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller on QCS615
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm graphics clock control module provides clocks, resets and power
+  domains on QCS615 Qualcomm SoCs.
+
+  See also: include/dt-bindings/clock/qcom,qcs615-gpucc.h
+
+properties:
+  compatible:
+    const: qcom,qcs615-gpucc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source
+      - description: GPLL0 GPUCC div branch source
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
+
+    clock-controller@5090000 {
+      compatible = "qcom,qcs615-gpucc";
+      reg = <0x5090000 0x9000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&gcc GPLL0>,
+               <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,qcs615-gpucc.h b/include/dt-bindings/clock/qcom,qcs615-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..6d8394b90d59074b93a26a9c027407a14b050b27
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcs615-gpucc.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_QCS615_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_QCS615_H
+
+/* GPU_CC clocks */
+#define CRC_DIV_PLL0						0
+#define CRC_DIV_PLL1						1
+#define GPU_CC_PLL0						2
+#define GPU_CC_PLL1						3
+#define GPU_CC_CRC_AHB_CLK					4
+#define GPU_CC_CX_GFX3D_CLK					5
+#define GPU_CC_CX_GFX3D_SLV_CLK					6
+#define GPU_CC_CX_GMU_CLK					7
+#define GPU_CC_CX_SNOC_DVM_CLK					8
+#define GPU_CC_CXO_AON_CLK					9
+#define GPU_CC_CXO_CLK						10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_GX_GFX3D_CLK					12
+#define GPU_CC_GX_GFX3D_CLK_SRC					13
+#define GPU_CC_GX_GMU_CLK					14
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				15
+#define GPU_CC_SLEEP_CLK					16
+
+/* GPU_CC power domains */
+#define CX_GDSC							0
+#define GX_GDSC							1
+
+/* GPU_CC resets */
+#define GPU_CC_CX_BCR						0
+#define GPU_CC_GFX3D_AON_BCR					1
+#define GPU_CC_GMU_BCR						2
+#define GPU_CC_GX_BCR						3
+#define GPU_CC_XO_BCR						4
+
+#endif

-- 
2.34.1


