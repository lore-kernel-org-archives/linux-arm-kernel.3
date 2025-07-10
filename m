Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A4CC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 14:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvCsgchda9byItwHd0Q00f1zu9v2QNVYUTowzD+42dI=; b=j0hRnwdwkPDHo5kQ7HJqtprOYu
	aEGmxqdafaMKAUPMTI3EHFqMGgRY0t5E/ulcuB4kcL8+3M3C684suJR1+eJZpx7d8NzwzbZ9EIC5s
	LByi17LGZifDLITBTUjzAOjlgU0BvSqOBLZTkHsDe/QtO4LVX8iJZiw/BPbD4YsFoxZrGtXShIwVu
	uAbMccooSy76LEepCrgkYl1BFE3J7lzLvnMXq1LWIS0p7izOnYZK02j+jQqRreflSwsgBYXj+jgYY
	8fJl7/OERtgn160/xrBXpVGrE3vT6KLwztTg1gJ9IH9BoRAmNacqKhIPZllN/qz074bG2PPMLdSwK
	czvwnLNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZryF-0000000C4TT-2aOh;
	Thu, 10 Jul 2025 14:09:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqPF-0000000Blsd-11t7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 12:29:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9RGMN016195;
	Thu, 10 Jul 2025 12:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xvCsgchda9byItwHd0Q00f1zu9v2QNVYUTowzD+42dI=; b=cbbMB68P7bPlIYq3
	EoZqViAVbY3za4p2e5i1uChjEuSj+aQGz9CcQ6W7Qt+2ft//55PbnYtWdDZ3sqgs
	2LKmTn3n5r2wr8EGPbuQYeTV+n0yEwSSshJRqYjfGsGKbHAn78ZjBi9dKLXvpvsw
	BrO5fQxQGwh4e/hzcW+nFVK3ZDSIrR3VYwKT0XpjHX/FMHS2ORabmpyIeSb4liTI
	t8FNAf1YA2Y/+eWojZPhbRp0PzCxrUM843zDoik9hJ3k2fqreG65ZZ6ADrqtR8ob
	bETA8EDyD4ZtY67S29T3iR3T80Qs68jhXFdeNWcgmdNh3l9SXkDNLlKvoVcuQ3Gl
	3cPYVg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefrcwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 12:29:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56ACTWOp020478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 12:29:32 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 05:29:27 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 10 Jul 2025 20:28:15 +0800
Subject: [PATCH v3 07/10] dt-bindings: clock: qcom: Add NSS clock
 controller for IPQ5424 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250710-qcom_ipq5424_nsscc-v3-7-f149dc461212@quicinc.com>
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
In-Reply-To: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Anusha Rao
	<quic_anusha@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_suruchia@quicinc.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752150528; l=8187;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=daU6jBSBudSQCsmZyxCnK0RavsFVhemG2ZiN8saivzM=;
 b=4SlTfd0tKGB48BF5MWZAMdZfHsEoohIJdlw8/arWMBXrPydDPKkbXR57Lw8R+quHiR5GIMcKx
 zgMbV2pmIpLA3nX+foIM45XkilsahI55hDzd/TLyGRRuCpxBVjjkmTz
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNiBTYWx0ZWRfXwqn7UvidWY4S
 02ramXdNjBLiiRmtOrosWJUW8GqIUnZPDodWf41ROwo3g8D9ThNIinQK5nzd6A37JN/djgJLFgj
 3bxBMq0FlrxBXTvlOhQ6cqETf9i0McPCUFpO7Y53uq3YjSGYwzngHbnOrQFDJvah7Yn06Lge/RQ
 pGr0n4BHI+bXvRO1w0j12m7FD+/OxPo2KaukcqnhAFlzqJgDgCWFEGviPYg01lpbwltcIBPfFEG
 0nUge75PKc5XiQoYFP6aOor4WgsjLDGGZGrlxQe9I8G6hu6wQCgMsFrwKdfH0x32Nh639trwCRa
 u8e/Pr5n5MwyaV+Z8Psc7wJ3y+JgBVggu5fVyw7MoZhgGAsLp81hGjQDwWSthJ3RtzUNBHT3oaA
 /2ErU+YSHh48h00YR4yWOK05Ygtun6hd3rjGFvI9pM9liZOW9Yy1FQ84rVJN0ldv8Tj2rNfN
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686fb22d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=oTyRCnguye-vrReHPpcA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tDrgmU83aYBUuWm5R0IQzIWw8kl_7tGN
X-Proofpoint-ORIG-GUID: tDrgmU83aYBUuWm5R0IQzIWw8kl_7tGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_052941_409920_433D77EE 
X-CRM114-Status: GOOD (  18.56  )
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

NSS clock controller provides the clocks and resets to the networking
blocks such as PPE (Packet Process Engine) and UNIPHY (PCS) on IPQ5424
devices.

Add the compatible "qcom,ipq5424-nsscc" support based on the current
IPQ9574 NSS clock controller DT binding file. ICC clocks are always
provided by the NSS clock controller of IPQ9574 and IPQ5424, so add
interconnect-cells as required DT property.

Also add master/slave ids for IPQ5424 networking interfaces, which is
used by nss-ipq5424 driver for providing interconnect services using
icc-clk framework.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 .../bindings/clock/qcom,ipq9574-nsscc.yaml         | 14 +++--
 include/dt-bindings/clock/qcom,ipq5424-nsscc.h     | 65 ++++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,ipq5424.h    | 13 +++++
 include/dt-bindings/reset/qcom,ipq5424-nsscc.h     | 46 +++++++++++++++
 4 files changed, 134 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
index b9ca69172adc..86ee9ffb2eda 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/qcom,ipq9574-nsscc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574
+title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574 and IPQ5424
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
@@ -12,15 +12,19 @@ maintainers:
 
 description: |
   Qualcomm networking sub system clock control module provides the clocks,
-  resets on IPQ9574
+  resets on IPQ9574 and IPQ5424
 
-  See also::
+  See also:
+    include/dt-bindings/clock/qcom,ipq5424-nsscc.h
     include/dt-bindings/clock/qcom,ipq9574-nsscc.h
+    include/dt-bindings/reset/qcom,ipq5424-nsscc.h
     include/dt-bindings/reset/qcom,ipq9574-nsscc.h
 
 properties:
   compatible:
-    const: qcom,ipq9574-nsscc
+    enum:
+      - qcom,ipq5424-nsscc
+      - qcom,ipq9574-nsscc
 
   clocks:
     items:
@@ -57,6 +61,7 @@ required:
   - compatible
   - clocks
   - clock-names
+  - '#interconnect-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -94,5 +99,6 @@ examples:
                     "bus";
       #clock-cells = <1>;
       #reset-cells = <1>;
+      #interconnect-cells = <1>;
     };
 ...
diff --git a/include/dt-bindings/clock/qcom,ipq5424-nsscc.h b/include/dt-bindings/clock/qcom,ipq5424-nsscc.h
new file mode 100644
index 000000000000..59ce056ead93
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq5424-nsscc.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_QCOM_IPQ5424_NSSCC_H
+#define _DT_BINDINGS_CLOCK_QCOM_IPQ5424_NSSCC_H
+
+/* NSS_CC clocks */
+#define NSS_CC_CE_APB_CLK					0
+#define NSS_CC_CE_AXI_CLK					1
+#define NSS_CC_CE_CLK_SRC					2
+#define NSS_CC_CFG_CLK_SRC					3
+#define NSS_CC_DEBUG_CLK					4
+#define NSS_CC_EIP_BFDCD_CLK_SRC				5
+#define NSS_CC_EIP_CLK						6
+#define NSS_CC_NSS_CSR_CLK					7
+#define NSS_CC_NSSNOC_CE_APB_CLK				8
+#define NSS_CC_NSSNOC_CE_AXI_CLK				9
+#define NSS_CC_NSSNOC_EIP_CLK					10
+#define NSS_CC_NSSNOC_NSS_CSR_CLK				11
+#define NSS_CC_NSSNOC_PPE_CFG_CLK				12
+#define NSS_CC_NSSNOC_PPE_CLK					13
+#define NSS_CC_PORT1_MAC_CLK					14
+#define NSS_CC_PORT1_RX_CLK					15
+#define NSS_CC_PORT1_RX_CLK_SRC					16
+#define NSS_CC_PORT1_RX_DIV_CLK_SRC				17
+#define NSS_CC_PORT1_TX_CLK					18
+#define NSS_CC_PORT1_TX_CLK_SRC					19
+#define NSS_CC_PORT1_TX_DIV_CLK_SRC				20
+#define NSS_CC_PORT2_MAC_CLK					21
+#define NSS_CC_PORT2_RX_CLK					22
+#define NSS_CC_PORT2_RX_CLK_SRC					23
+#define NSS_CC_PORT2_RX_DIV_CLK_SRC				24
+#define NSS_CC_PORT2_TX_CLK					25
+#define NSS_CC_PORT2_TX_CLK_SRC					26
+#define NSS_CC_PORT2_TX_DIV_CLK_SRC				27
+#define NSS_CC_PORT3_MAC_CLK					28
+#define NSS_CC_PORT3_RX_CLK					29
+#define NSS_CC_PORT3_RX_CLK_SRC					30
+#define NSS_CC_PORT3_RX_DIV_CLK_SRC				31
+#define NSS_CC_PORT3_TX_CLK					32
+#define NSS_CC_PORT3_TX_CLK_SRC					33
+#define NSS_CC_PORT3_TX_DIV_CLK_SRC				34
+#define NSS_CC_PPE_CLK_SRC					35
+#define NSS_CC_PPE_EDMA_CFG_CLK					36
+#define NSS_CC_PPE_EDMA_CLK					37
+#define NSS_CC_PPE_SWITCH_BTQ_CLK				38
+#define NSS_CC_PPE_SWITCH_CFG_CLK				39
+#define NSS_CC_PPE_SWITCH_CLK					40
+#define NSS_CC_PPE_SWITCH_IPE_CLK				41
+#define NSS_CC_UNIPHY_PORT1_RX_CLK				42
+#define NSS_CC_UNIPHY_PORT1_TX_CLK				43
+#define NSS_CC_UNIPHY_PORT2_RX_CLK				44
+#define NSS_CC_UNIPHY_PORT2_TX_CLK				45
+#define NSS_CC_UNIPHY_PORT3_RX_CLK				46
+#define NSS_CC_UNIPHY_PORT3_TX_CLK				47
+#define NSS_CC_XGMAC0_PTP_REF_CLK				48
+#define NSS_CC_XGMAC0_PTP_REF_DIV_CLK_SRC			49
+#define NSS_CC_XGMAC1_PTP_REF_CLK				50
+#define NSS_CC_XGMAC1_PTP_REF_DIV_CLK_SRC			51
+#define NSS_CC_XGMAC2_PTP_REF_CLK				52
+#define NSS_CC_XGMAC2_PTP_REF_DIV_CLK_SRC			53
+
+#endif
diff --git a/include/dt-bindings/interconnect/qcom,ipq5424.h b/include/dt-bindings/interconnect/qcom,ipq5424.h
index 66cd9a9ece03..a78604beff99 100644
--- a/include/dt-bindings/interconnect/qcom,ipq5424.h
+++ b/include/dt-bindings/interconnect/qcom,ipq5424.h
@@ -27,4 +27,17 @@
 #define MASTER_NSSNOC_SNOC_1		22
 #define SLAVE_NSSNOC_SNOC_1		23
 
+#define MASTER_NSSNOC_PPE		0
+#define SLAVE_NSSNOC_PPE		1
+#define MASTER_NSSNOC_PPE_CFG		2
+#define SLAVE_NSSNOC_PPE_CFG		3
+#define MASTER_NSSNOC_NSS_CSR		4
+#define SLAVE_NSSNOC_NSS_CSR		5
+#define MASTER_NSSNOC_CE_AXI		6
+#define SLAVE_NSSNOC_CE_AXI		7
+#define MASTER_NSSNOC_CE_APB		8
+#define SLAVE_NSSNOC_CE_APB		9
+#define MASTER_NSSNOC_EIP		10
+#define SLAVE_NSSNOC_EIP		11
+
 #endif /* INTERCONNECT_QCOM_IPQ5424_H */
diff --git a/include/dt-bindings/reset/qcom,ipq5424-nsscc.h b/include/dt-bindings/reset/qcom,ipq5424-nsscc.h
new file mode 100644
index 000000000000..f2f7eaa28b21
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,ipq5424-nsscc.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_RESET_QCOM_IPQ5424_NSSCC_H
+#define _DT_BINDINGS_RESET_QCOM_IPQ5424_NSSCC_H
+
+#define NSS_CC_CE_APB_CLK_ARES					0
+#define NSS_CC_CE_AXI_CLK_ARES					1
+#define NSS_CC_DEBUG_CLK_ARES					2
+#define NSS_CC_EIP_CLK_ARES					3
+#define NSS_CC_NSS_CSR_CLK_ARES					4
+#define NSS_CC_NSSNOC_CE_APB_CLK_ARES				5
+#define NSS_CC_NSSNOC_CE_AXI_CLK_ARES				6
+#define NSS_CC_NSSNOC_EIP_CLK_ARES				7
+#define NSS_CC_NSSNOC_NSS_CSR_CLK_ARES				8
+#define NSS_CC_NSSNOC_PPE_CLK_ARES				9
+#define NSS_CC_NSSNOC_PPE_CFG_CLK_ARES				10
+#define NSS_CC_PORT1_MAC_CLK_ARES				11
+#define NSS_CC_PORT1_RX_CLK_ARES				12
+#define NSS_CC_PORT1_TX_CLK_ARES				13
+#define NSS_CC_PORT2_MAC_CLK_ARES				14
+#define NSS_CC_PORT2_RX_CLK_ARES				15
+#define NSS_CC_PORT2_TX_CLK_ARES				16
+#define NSS_CC_PORT3_MAC_CLK_ARES				17
+#define NSS_CC_PORT3_RX_CLK_ARES				18
+#define NSS_CC_PORT3_TX_CLK_ARES				19
+#define NSS_CC_PPE_BCR						20
+#define NSS_CC_PPE_EDMA_CLK_ARES				21
+#define NSS_CC_PPE_EDMA_CFG_CLK_ARES				22
+#define NSS_CC_PPE_SWITCH_BTQ_CLK_ARES				23
+#define NSS_CC_PPE_SWITCH_CLK_ARES				24
+#define NSS_CC_PPE_SWITCH_CFG_CLK_ARES				25
+#define NSS_CC_PPE_SWITCH_IPE_CLK_ARES				26
+#define NSS_CC_UNIPHY_PORT1_RX_CLK_ARES				27
+#define NSS_CC_UNIPHY_PORT1_TX_CLK_ARES				28
+#define NSS_CC_UNIPHY_PORT2_RX_CLK_ARES				29
+#define NSS_CC_UNIPHY_PORT2_TX_CLK_ARES				30
+#define NSS_CC_UNIPHY_PORT3_RX_CLK_ARES				31
+#define NSS_CC_UNIPHY_PORT3_TX_CLK_ARES				32
+#define NSS_CC_XGMAC0_PTP_REF_CLK_ARES				33
+#define NSS_CC_XGMAC1_PTP_REF_CLK_ARES				34
+#define NSS_CC_XGMAC2_PTP_REF_CLK_ARES				35
+
+#endif

-- 
2.34.1


