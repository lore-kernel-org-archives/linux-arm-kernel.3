Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE657E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZHMx5YaHfJGbP6S0hrzbEDKBNwu+eT3c7CFH3xemBA=; b=QT4Xc0RY6hv2sfBPkTjIOhB6JL
	MjW85yaz6COjwDtcmwbyBQkzqZlRbo+eVijfxd2AN86hM143W+IVgvsN28N6gOIOyjOxHf38XTcFq
	h5ztLp0zaN8BMN4oMyCVbzxKqHMXciTDlvsaExHUxonE9aEKKBvG4cxjcnwOvZDYA42wg+Fu29DR7
	Odpkqr8j3EVoN+YCDv1LQTWFIPbWXjif7EqysXmcA/7r2dh8nupSWaDpXquaVQ+uw+oFsb+TVBj+G
	IGjd7sTdNbWpKvwIKMO/NS1/fKtiPhnTQCLsp3h2rlnRXR9fBIupwc3JtAK/Rzhc1FOBYCPYDEi6B
	6Fd4uCDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRgH-0000000CWtF-2SY4;
	Tue, 17 Dec 2024 07:07:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNROW-0000000CTJv-38k6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Dec 2024 06:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SZHMx5YaHfJGbP6S0hrzbEDKBNwu+eT3c7CFH3xemBA=; b=VV+ZlUPQ9uNISdv9KObcxtqUGJ
	ewItDILQ40V4gBWdxnzILF1lV3wAY0KTMspsIUEOj4/nbabNjy3q+EmMHjaxw0VbSjnYG/AN9WoFJ
	PzPQMr+EBSb3iQqxw6T/5YrfGJaMgrhsVo0WaQ6j5nqUWqsT/VKuwMkIaizc3gpGkthSBI+8QVLE7
	vLlXLnFH838SmRILn4bxZEsdlQBJIUnSyC3qzC3btm6PYh0Z4UKuQM0/ctWxNpaYsdkmNZ1fYlPdo
	Rn2q9Ue4OIL6T+Tgd2KupU+WYiZDe+nkoAlNI9yF5toNbWTqlJ0j+xJM74UwClGYI8Qs4ogYT0N/c
	vEOIcz2A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNROR-000000050qf-2InI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 06:49:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6mRZP012103;
	Tue, 17 Dec 2024 06:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SZHMx5YaHfJ
	GbP6S0hrzbEDKBNwu+eT3c7CFH3xemBA=; b=mJIRpnGN671UNVY0n4FjlH23Fyq
	FMjLApkG5H2nEUG7lfENuvQvKGfPwKNvr01lyjVyTeQ/ro3IQFn+DZSO+wVZiXT4
	s2E5G88CQJJzSKqMeGHU9jjNMsSlb1GZRlxnu37vqFhXnuvtaDgP19iLW7l5ZDTZ
	na87fu7ZcUkXun4xDYXk+E8MumjIk7NntYmhzzvNQ3w3EteCicMoqfURKybIxaKa
	4oYSOeo9FOpExZB+gSBdLWHsnPZkuKGmAeVahLfPaR9Su0XEuSoPd6PVSrWFKiNa
	2d6t9gzIb1K5mrHXhDrlppWcc8Zb0WErVGDJe/6JTlU9TxnwArY6iG1I2hA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k4bx001x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:04 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6n0tv014924;
	Tue, 17 Dec 2024 06:49:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43h33kx8ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:01 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BH6n0bL014876;
	Tue, 17 Dec 2024 06:49:01 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BH6n1Q5014928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:01 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 0A3795AE; Tue, 17 Dec 2024 12:18:59 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@quicinc.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v4 5/7] arm64: dts: qcom: Add support for QCS9075 Ride & Ride-r3
Date: Tue, 17 Dec 2024 12:18:54 +0530
Message-ID: <20241217064856.2772305-6-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
References: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MeMfxgGqj3xJGo61ObBnNAYjBn6vtl8V
X-Proofpoint-ORIG-GUID: MeMfxgGqj3xJGo61ObBnNAYjBn6vtl8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412170054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_064919_986820_9E70A457 
X-CRM114-Status: GOOD (  15.63  )
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

Add device tree support for QCS9075 Ride & Ride-r3 boards.

QCS9075 lacks the safety monitoring features of Safety-Island (SAIL)
subsystem which is available in QCS9100, and it affects thermal
management.

Also, between ride and ride-r3 ethernet phy is different.
Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile            |  2 +
 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 46 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 46 ++++++++++++++++++++
 3 files changed, 94 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 78613a1bd34a..41cb2bbd3472 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -118,6 +118,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
new file mode 100644
index 000000000000..d9a8956d3a76
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+
+#include "sa8775p-ride.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
+	compatible = "qcom,qcs9075-ride-r3", "qcom,qcs9075", "qcom,sa8775p";
+};
+
+&ethernet0 {
+	phy-mode = "2500base-x";
+};
+
+&ethernet1 {
+	phy-mode = "2500base-x";
+};
+
+&mdio {
+	compatible = "snps,dwmac-mdio";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sgmii_phy0: phy@8 {
+		compatible = "ethernet-phy-id31c3.1c33";
+		reg = <0x8>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
+	};
+
+	sgmii_phy1: phy@0 {
+		compatible = "ethernet-phy-id31c3.1c33";
+		reg = <0x0>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
new file mode 100644
index 000000000000..3b524359a72d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+
+#include "sa8775p-ride.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
+	compatible = "qcom,qcs9075-ride", "qcom,qcs9075", "qcom,sa8775p";
+};
+
+&ethernet0 {
+	phy-mode = "sgmii";
+};
+
+&ethernet1 {
+	phy-mode = "sgmii";
+};
+
+&mdio {
+	compatible = "snps,dwmac-mdio";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sgmii_phy0: phy@8 {
+		compatible = "ethernet-phy-id0141.0dd4";
+		reg = <0x8>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
+	};
+
+	sgmii_phy1: phy@a {
+		compatible = "ethernet-phy-id0141.0dd4";
+		reg = <0xa>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
+	};
+};
--
2.47.0


