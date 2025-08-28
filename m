Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0394ACA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QD2A9FXdBy8jgphnzP4Dp1Qnf+lFGk8RL2fW6YxOKeo=; b=VPVlFvePJ5XmyXy/pQuXMMdHVz
	klv3kp0ZHZACK+yT5a9532hbsJMJYChgfZVAdTZl9BUqLt0l6l4GouHfqX47TLnFeQCP9nR9ukjPi
	FW9yh+Uf1F9tpEQeFHMUKwdiHOyXQJEbwylbfGWd3rU4OrYUy9PqKpWGj+m3dgVO6lyXHZG3QuzY6
	cdcAJCMrwfP2I+87tRPjPxW6A67HZVEMG6DV/+61Ypj1+O7b9rDzZ/ahsqQwc7bchZu/aRj3DX1St
	dTa3z4+HerWxYd9fhrCNkFHpLqjw4ruFZJ5F+MuUf7I7BG6nILmcbnXi/AZsccbrZsIdtKYeig+r/
	8E6BvbnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgLs-00000002QHb-16rd;
	Thu, 28 Aug 2025 17:23:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbSM-00000001SwI-1p6h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:10:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S618Dg027272
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QD2A9FXdBy8jgphnzP4Dp1Qnf+lFGk8RL2fW6YxOKeo=; b=AwrcEOBWI3psTFQH
	N34qF8P4UKb0GSAtBTOkzzoXlCkmIrfFRLCJ5+C5lOv6SLFRYkDZt0xy0E0lB7Xn
	fFRCZGO3/8B/509YpwWTesZTO3bE5Srt1Qc/jU+AZfJS8mYSLf+PQlE98/nLXfKA
	38fUi3AtnRXg14ZfGaY0dUyvjCvNNACRqYeK9jcg9x9MBoIdS6BTGtM8AgVsKasl
	rZyXrxFG9NKZNxJy+zalmDo11nJgHBenWLUrG90QJFXfXoByc6vlDJKtPdJ4j+Ok
	2ELVj972r3nzB+42H4BtLcgMjuyJdOFKpdaiq0nMoX8YjP+iEX+f3gwrh9OWV4dt
	1Jo0TQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16y564-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-327b289e88dso672696a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383017; x=1756987817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QD2A9FXdBy8jgphnzP4Dp1Qnf+lFGk8RL2fW6YxOKeo=;
        b=sLvK1IgKC//30VPHER6elneWRTYOZhWCwczmYKr2QxpSu8kzwIpd70KcTu+HA0wn1W
         gEsXpcSizpx6jYu7mJpubTvO75BRs5X/CemdbWnSBxfN52PhVplGnSXfyEz/LIsLviVt
         00aYSQveGJIZs3wiQznn3D6AHDFuK7fYV+C1MJG9PIFJmxboFAMy4MsGOtA+n+M5hgbk
         5W2bkcjyT6p20yAn39uq1zPJNTAtaXK5C/anU20OZCQvqxDSx/XJc9/xMNJd0ouqCcwv
         3GgAmelSYTUiVUVd43dzLlJMWRtSkEHTJwpr3H/CDQL5OguhuEceTJV2dIiUX6ELHzF6
         QdSw==
X-Forwarded-Encrypted: i=1; AJvYcCVgFSbetGBxVqhPKMit6cwR2TzgpDpNWKo6Ui/op6co5jzlKXW+YScRbsaJmkPt9ZQMOfC6H7z3lAacjgr3f2TG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3LKWJUV2VyMdy4T2CKDHHTabFOlpko/OLyfkGKGqjye3+g34D
	Y9mDpTNOCI+yOKsOsDCYy0efY7fZm1w9LjzjfW15BlcglXToQOneg+muastUyJ/T5VE9K64hjCU
	kgh1kvv1McuV/nXBGB4792bfJ5YyM7MTEd3Q10G7j31FnuGQK4q7IYTexfzbAYejpPl+BRwSvV4
	vPhQ==
X-Gm-Gg: ASbGncuAqIM70hVG4oXAcNP+zKFLGwxDJPLE6lexel2zFiMYzeyHSaYDWRigSNkoDlY
	rO64FTkia3gQLHIV/jDXZ41Ow1WcxAWmmX9Gvbs4xxxiDlqWWnIHGlKocEstLTA9AzCsRP/yiJm
	wd0Q0mY+d+ERU4/XLieDd64zK8SPI46WcKm7UoxqW8kHT6CFB6p0ZqAcZxCGCuUBI29Z293qFBq
	NI3mEjvQNr3rkBXgevoWwhoVxSGzycXY7z5COTEBpBnoteR+Q0ZmxBwqlvMide8PYAQ6WTgECdA
	+0kOAk7GTAREAAUP4+7x6/qQHDWio7i7ne66V5a1Nc2EN7hyur+u1wnKNXCi3xbSRCvfRh8V0Kw
	=
X-Received: by 2002:a17:90b:2ec7:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-32517b2f78dmr28934724a91.26.1756383016790;
        Thu, 28 Aug 2025 05:10:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMU0B8A5NXSc4XW6YWiuMgcNVOratxHDn2mKFqdBmgUSXAIgy8tSO3FCpdWkWDpp9LMEmetw==
X-Received: by 2002:a17:90b:2ec7:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-32517b2f78dmr28934664a91.26.1756383016208;
        Thu, 28 Aug 2025 05:10:16 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32741503367sm4019070a91.0.2025.08.28.05.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:10:15 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 17:38:59 +0530
Subject: [PATCH v6 2/9] arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe
 switch node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-qps615_v4_1-v6-2-985f90a7dd03@oss.qualcomm.com>
References: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
In-Reply-To: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756382994; l=4925;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=n8CibSDGW6LOAsbVMBvzXuiN9JBP2yv07nnGPm97ghY=;
 b=U2c9vFnZy5/c1yfkChdy65ugAsH2zjxUx3I6kV/ChW2PovrY+W+IZJuZ4D10SvAyAPCjD5a60
 SELE5P96AiVB+6sziwPSWmlXNVny9jm3ltfp0jjoGFqBdZMPfU/eMzx
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: xE-svJc-pfI2A87QHslbG2GjZhRCE3-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX8hP8ESfu9yyB
 VopEA7BzP5cGaVxqK5J2gLrVcXVqvsmAvxGUUslxpLQqRPcxyJmFmLxLpVCS2OoZBtpLaaju/iC
 xMcJsCs72VWJCShIYk+odHQD1IaIiUtbqoYR4YLU45qpDWxcacSWGXmTkfupOdBy0kH47MuywZv
 z5DcG2wAL/ZKdSzi7aTU2kjKi41ZCZGzVOZck1nw/w3NyRm0XO9Dt2nHESQDqRanroj8cDm/181
 7VsC7oPQW1ampz6nnngkI6/2L+5H7Oa2po4Lbnm0OEtV3tgNPjkJwrTUtNVw7AxMWC1Zk8IQzxh
 yRr4Fm0ZFqynqdJtg/4UFtpLuWb+OFaWJTI9e//Dd4GiC3aBpZBKyHlJVUCTqh90wwOvgobpV5N
 S9xybUaA
X-Proofpoint-ORIG-GUID: xE-svJc-pfI2A87QHslbG2GjZhRCE3-1
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68b0472a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=UN7QK-OhvXrGNVVRcS8A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_051018_484400_CD2CF9DF 
X-CRM114-Status: GOOD (  15.81  )
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

Add a node for the TC9563 PCIe switch, which has three downstream ports.
Two embedded Ethernet devices are present on one of the downstream ports.
As all these ports are present in the node represent the downstream
ports and embedded endpoints.

Power to the TC9563 is supplied through two LDO regulators, controlled by
two GPIOs, which are added as fixed regulators. Configure the TC9563
through I2C.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 128 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi         |   2 +-
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 5fbcd48f2e2d839835fa464a8d5682f00557f82e..1dc4b498d39565398f83f9bfecbde19e68a61030 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -261,6 +261,30 @@ vph_pwr: vph-pwr-regulator {
 		regulator-max-microvolt = <3700000>;
 	};
 
+	vdd_ntn_0p9: regulator-vdd-ntn-0p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_NTN_0P9";
+		gpio = <&pm8350c_gpios 2 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <899400>;
+		regulator-max-microvolt = <899400>;
+		enable-active-high;
+		pinctrl-0 = <&ntn_0p9_en>;
+		pinctrl-names = "default";
+		regulator-enable-ramp-delay = <4300>;
+	};
+
+	vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_NTN_1P8";
+		gpio = <&pm8350c_gpios 3 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		pinctrl-0 = <&ntn_1p8_en>;
+		pinctrl-names = "default";
+		regulator-enable-ramp-delay = <10000>;
+	};
+
 	wcn6750-pmu {
 		compatible = "qcom,wcn6750-pmu";
 		pinctrl-0 = <&bt_en>;
@@ -834,6 +858,78 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vdd_ntn_0p9>;
+		vdd18-supply = <&vdd_ntn_1p8>;
+		vdd09-supply = <&vdd_ntn_0p9>;
+		vddio1-supply = <&vdd_ntn_1p8>;
+		vddio2-supply = <&vdd_ntn_1p8>;
+		vddio18-supply = <&vdd_ntn_1p8>;
+
+		i2c-parent = <&i2c0 0x77>;
+
+		reset-gpios = <&pm8350c_gpios 1 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&tc9563_rsex_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pci@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pci@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
 &pm7325_gpios {
 	kypd_vol_up_n: kypd-vol-up-n-state {
 		pins = "gpio6";
@@ -1039,6 +1135,38 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&pm8350c_gpios {
+	ntn_0p9_en: ntn-0p9-en-state {
+		pins = "gpio2";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+
+	ntn_1p8_en: ntn-1p8-en-state {
+		pins = "gpio3";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+
+	tc9563_rsex_n: tc9563-resx-state {
+		pins = "gpio1";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <32 2>, /* ADSP */
 			       <48 4>; /* NFC */
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64a2abd3010018e94eb50c534a509d6b4cf2473b..7a840c90505e83b3c233ab13c53be818824c9b8d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2294,7 +2294,7 @@ pcie1: pcie@1c08000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1


