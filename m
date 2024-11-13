Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B179D12D66
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q5b/v6hP49ousuu3y0QjqsGXEOrcXaZ0nuJKp5PUfg=; b=HjJaRY+RhI3kPQXa/p8ZE+k7X4
	erRG/BqMVZepVuBPGRs63HZXbTY2gDd2Ma36Upu/VZcw64CcFKmeldvFro9OO6tPVjx9GXIt0Z6U7
	dhsP3PXF/VeyjSCg3d3sA4+Xr6nEvEY15UyD3gYUwMCOu05fsQs3RJ8ceAzfQLi9478qBhewFj267
	o4VR+8rgsnP0WR9AO5i8+w8eiAXpx0VDIuJeCKOWqAS6Zv720h9SDj782M5x3yigk7nN9P4iRUkHE
	r5KgpVPzbhIpTwUR71FWY7j6yj+xRKI3OND/kgyD3Q2KjxKPn/m8eVtsZ/pIzASWVzpXM/+YQxT+r
	ggtqazmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDEO-00000006tDv-0TFM;
	Wed, 13 Nov 2024 13:16:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBwW-00000006eLj-2z2g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 11:53:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD9Qt26014572;
	Wed, 13 Nov 2024 11:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Q5b/v6hP49ousuu3y0QjqsGXEOrcXaZ0nuJKp5PUfg=; b=NNOuIzn68KNshNRB
	eyGkfFt9MILGzW0I2vvygtpRyk8c0RjLggUpcKvnihKMi2/voELO9bH0JMntgyih
	Z+4upGz/nZIqbvh+dkTTMDLDssBKDV6AbCTwG/z+RAH+7w2Jql2uFmaB/HTwz/Ny
	Uh4Iu5fU3BP0cFQ8jFmGWEaDQkGAsRsuJq8Eo/uNQgnbjsBZ+knvK1twmYw8/U58
	gLOq1WijfBj2Yrtv7Bp5oAhJOExWrAAAMAoO4YbD5FW4tI3IomYiW2zTvbC/g+M1
	QY+XqUfqkOwCkqQ/HCDBBEzIYsGC3P7tKDSgWiU0uD1w3pQlpepp+TRAqQ9EkRtG
	dk8wrg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vsg50bwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 11:53:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADBrf6H024860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 11:53:41 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 03:53:34 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Date: Wed, 13 Nov 2024 19:51:50 +0800
Subject: [PATCH v2 8/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241113-add-display-support-for-qcs615-platform-v2-8-2873eb6fb869@quicinc.com>
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Li
 Liu" <quic_lliu6@quicinc.com>,
        Fange Zhang <quic_fangez@quicinc.com>,
        "Xiangxu Yin" <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731498759; l=2941;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=Q8LiZhb/Ep/nJO5Y1DyMDYqgsfi76f6BBkbAUE5K5UM=;
 b=9pdLoyJ16hbwESroVM8oIGkXSblxtKo2DyQGcCymOT5Bk2gR62TqfAKpGig0w0pFH78s420qg
 7fPfblIlKNqBfNqaPIONgiNmplUXoA607/Ny6kZ81/HhOB6jnWEO3t3
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: a8yQUXGi8b9-YeX12m6xZxLfLitS-NF_
X-Proofpoint-ORIG-GUID: a8yQUXGi8b9-YeX12m6xZxLfLitS-NF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_035352_803316_0C82109C 
X-CRM114-Status: GOOD (  12.68  )
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

From: Li Liu <quic_lliu6@quicinc.com>

Add display MDSS and DSI configuration for QCS615.
QCS615 has a DP port, and DP support will be added in a later patch.

Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 109 +++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index ee6cab3924a6d71f29934a8debba3a832882abdd..8b9029e96b07cbef950b074a7412180d6c27d39a 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -202,6 +202,115 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&qup_i2c2_data_clk &ioexp_intr_active &ioexp_reset_active>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ioexp: gpio@3e {
+		compatible = "semtech,sx1509q";
+		reg = <0x3e>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <58 0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		semtech,probe-reset;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dsi_dp_hpd_cfg_pins &dsi_dp_cdet_cfg_pins>;
+
+		// HPD configuration for DSI to DP port
+		dsi_dp_hpd_cfg_pins: gpio0-cfg {
+			pins = "gpio0";
+			bias-pull-up;
+		};
+
+		// Connection detect configuration for DSI to DP port
+		dsi_dp_cdet_cfg_pins: gpio1-cfg {
+			pins = "gpio1";
+			bias-pull-down;
+		};
+	};
+
+	i2c-mux@77 {
+		compatible = "nxp,pca9542";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			anx7625@58 {
+				compatible = "analogix,anx7625";
+				reg = <0x58>;
+				interrupt-parent = <&ioexp>;
+				interrupts = <0 0>;
+				enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
+				reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+				wakeup-source;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						anx_7625_in: endpoint {
+							remote-endpoint = <&mdss_dsi0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						anx_7625_out: endpoint {
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l11a>;
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&anx_7625_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
+&tlmm {
+	ioexp_intr_active: ioexp_intr_active {
+		pins = "gpio58";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	ioexp_reset_active: ioexp_reset_active {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


