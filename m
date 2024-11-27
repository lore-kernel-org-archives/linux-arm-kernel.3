Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2FFD609CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0HzRmOKuxsDsObnHNtYOmXokfAPxgB5azaw2lQocr0=; b=3A9p76WTP5z1bM+T2nZNbE+kmH
	cTuNJAAA5JcPGmoBfKs1o8ziT4mT4KiD4I3ID0XCfVUB1gbV4cjNWv3V9IuX1DkqJtmB0cO8jkw0R
	su9a0rJejp47Frnklcv966qNgUqW1Gzpgf0HoShzUnCJK4luwBsuqkAciH4UaZjTLjyRLMcYpDePy
	5lUTSWi5ByGSN0cqEmkhetM9zUXvfMyuVrLP042Lr9zIKyStJASr792b9vb2wDcyOMO0VmsOXOSQ+
	OEtSeE5ZNlbQeswtEbTLU/rSgTVVG3FOu8rTpca68obk15EQmk5JkprreXQ3I2SBtaCBd8vU1nXEI
	feT1X3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGF5s-0000000CoRN-06dD;
	Wed, 27 Nov 2024 10:16:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEvP-0000000CmV8-21cE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:05:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR8WgIZ009380;
	Wed, 27 Nov 2024 10:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0HzRmOKuxsDsObnHNtYOmXokfAPxgB5azaw2lQocr0=; b=aaIY2P1dfSOWRF/L
	nF9k9W76Yqxjn8fd6WFenUvQaDLTWxzqM6t6yCU7tPNLbkAWmPQM93M0dgl4Dv+v
	NmlL7Cvp5GHvlyJ8xHREzMunmrtPVVqpy91IieV0diFTWqRQAmGU9C0uHJWVmAjg
	GB8Q0HoiY+w39/u5w84vLcqieki7ha025kmOejWb8pQUf0mMuHvdzA1H8svU6yxS
	/LTYNKhWChK9y6H4LpClbE1L+uxvzhE92bLgxLp1CrD0wARZJ/+Q0+N/5BxLhCfb
	8kqop39ySd0PuDVZcwTWwhizMm0hf09KzeuxppEfYqEP6iqCx//Fa9HSGHhIlDO1
	o3o3nQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435ffytxkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 10:05:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARA5KS1013725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 10:05:20 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 27 Nov 2024 02:05:11 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v6 5/5] arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Date: Wed, 27 Nov 2024 15:34:21 +0530
Message-ID: <20241127100421.3447601-6-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127100421.3447601-1-quic_vikramsa@quicinc.com>
References: <20241127100421.3447601-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M9kdjfNpGVSiiUBbDoCuOQr95-M-fEGj
X-Proofpoint-ORIG-GUID: M9kdjfNpGVSiiUBbDoCuOQr95-M-fEGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_020535_629593_9F30528B 
X-CRM114-Status: GOOD (  15.96  )
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

The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
Enable the IMX577 on the vision mezzanine.

An example media-ctl pipeline for the imx577 is:

media-ctl --reset
media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 108 ++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 9bb8b191aeb5..4ee57b3871dd 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -114,6 +114,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
+
+qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
new file mode 100644
index 000000000000..6e2fccca8f11
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/*
+ * Camera Sensor overlay on top of rb3gen2 core kit.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/qcom,camcc-sc7280.h>
+
+/dts-v1/;
+/plugin/;
+
+&camcc {
+	status = "okay";
+};
+
+&camss {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* The port index denotes CSIPHY id i.e. csiphy3 */
+		port@3 {
+			reg = <3>;
+			csiphy3_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default", "suspend";
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-1 = <&cam2_suspend>;
+
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dovdd-supply  = <&vreg_l18b_1p8>;
+
+		port {
+			imx577_ep: endpoint {
+				clock-lanes = <7>;
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam2_default: cam2-default-state {
+		rst-pins {
+			pins = "gpio78";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		mclk-pins {
+			pins = "gpio67";
+			function = "cam_mclk";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	cam2_suspend: cam2-suspend-state {
+		rst-pins {
+			pins = "gpio78";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+			output-low;
+		};
+
+		mclk-pins {
+			pins = "gpio67";
+			function = "cam_mclk";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+};
-- 
2.25.1


