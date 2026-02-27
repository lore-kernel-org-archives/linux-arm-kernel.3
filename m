Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF1CFD9E3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvSftihsd1SbZhKDJ4Cnab43xZlVq5+abJE9Otkr5lI=; b=NaZrj7jP97fQFRKg19L28TekNW
	X2lUS8nhKjVRQb9zphxJKVLaldU7RrxpdkgRrTQ/my4ReDXTk1qMgzGthZmZw1MlUin9i0CozbRg9
	UzlJ31heV0WRhQi5l5GFSQWAESF2CzvWKp7YQGumj0wsNyXloXoeL44/TDaIyAay4KbQP7RF+Ques
	iuwvITIJzoyEOoIKoaml9LqIbTcUh0AONhsAlcqNO2edRkDVSDDL38FRV2DswFm91paIlMT9rpXli
	ma+OenY4iPSHt2Gy1zjqMeIhXNiUrSE2Ww4qRnuWggQirUfqf7bSyaYo2Vde6LWNi0FvAXC2Bx4hA
	FMkDbV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqQu-00000007iL1-3SU4;
	Fri, 27 Feb 2026 05:30:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqQp-00000007iJu-40bd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:30:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2JvdZ2438565
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 05:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvSftihsd1SbZhKDJ4Cnab43xZlVq5+abJE9Otkr5lI=; b=f8Xr2FzNaUUpYxVe
	x8oPWd6fiRV5Uf0Z1BCQ7oKyv4u2/Or3U3QBUyzmYzk85UnjU9tPl+JDBFFuMaj0
	Y+JJT6U1tnoDM5+YJakDV1scKkFOMCf6T9wWYgxsVY++L5gaPGCbDfK1oF9BxMFh
	Kwe8ZlLRYeQT8CgxI+AI19UeKiJwhaJNrXYHWmyn84A4Lso2VbOH/nOjwtRGkQkc
	00NQSOIGNXB6yjy1OVE3eLZlgLzHUFYl94cvhoXXfly0qJwJut3h/NOZ8T8Eo2xB
	MO5VnHdVBT03fKlJ96ItM0PoCnUbL3DnkksR+E49gGPE0LbR2Rv+gnexbHCRA3xX
	hiXYqA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cju4r227v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 05:30:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-896f96458f3so58533996d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772170230; x=1772775030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvSftihsd1SbZhKDJ4Cnab43xZlVq5+abJE9Otkr5lI=;
        b=StmnvaJkazEq5uLtnAGXqt8VfJS1SuwBTgFMf4cmC3Og7kDJrnENcicSYM89hggN2R
         BE3c2Ywn9BLHk2v/9wYLU6d2ttQ2nql3pLFR4AmyIbDbfCA8tCKEs84Vp9kBvYi0eh1g
         1AF8Rqmwj74p3wRK1HK5jYH/IPm08okbUdzEtT+bLbpCUnvirkNxwO/1lGyMr08RTr8p
         wzC+y7fZKgL6qob1CtazdpT+tJ8ob2UVe5DdobWyyJup/rZPJntC90YXiRS038bmFPO2
         lkEdLIK4Cfp0QKfl2pyc3Cvbh80yUsbCHSLh5BrffpNkObBZz08tPKFOzxsooMBQCIAz
         XCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170230; x=1772775030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mvSftihsd1SbZhKDJ4Cnab43xZlVq5+abJE9Otkr5lI=;
        b=XNQ3JhWhWlHuF2jnDJrZLR0sy08Y5SjqJ+LEnCGWK9MWaP6cBQUvvZnGAOYAphSsYu
         HGgubH3TI/2TD3r6CsPKm0ocLcRvBGJhiTZySEED/wEYdAs0m1umbXJhYi2huBooiViR
         wg6M3OrscaykVwqk1lGWVbh3hRvIJ+OV6JIil6riQKnJF4ohW9Sm+v4GViw4aZIfDLPE
         2UC0nWy/gsvjUtqgjOIHKpSx7bkZNbeKt5/YImcofrsf+qGn2oUvrNJHwMiH1UltRENS
         OOvQglu9/oFJWUC4Pl9YBMbuM9yzHwRKMRWaLbCESPsLkbN/LDmtPRECzGmfBdpy7GwN
         JzCg==
X-Forwarded-Encrypted: i=1; AJvYcCVZsUXPSIg1sNU2XHHPMLS0Q4+qgQnCqj7TugklXmitE2qjEYd777yqcuGuwdZu2hfxIIDunroefT8x50JRg7ls@lists.infradead.org
X-Gm-Message-State: AOJu0YwQxQeI9WuXkSlkur8dw9BksGO7pXmJ4ejcCGUdJtgnnpYB4VVr
	ynzohf6MkqmhM+zXgyu7esZw489T6Y2S+6Lwq/rsFUj0+UhIWJ6j1lqntan1FOvKR0F6kGef1PC
	j9vsX6TiSFfccN5XEajGksgYFdv2RxxqrT8BXWwevBtVDyKLcFOvZ/Hrbc7EAbZelYcMh2Bl/ny
	56Ug==
X-Gm-Gg: ATEYQzyq0/iC+k2ELDhQ0sklGM+Gu7lachSugnutxBBPKeYz2py6jStTg+OKhEywDCg
	+86XK+okqoHTS8cy9R7V4JUywKpMS6HYJanyVbEO0JtqxBnXBeIzxoPLqzehJP9y+TsHssRQF8L
	1ABiddf9DURrhAb4/QcTbSxc+NzOSf5P3dr1myJlUIrvosm69KhwHTy0horTqtFApYhk92uuYPl
	1c6WpRKRze45JAVX4xChe3ha4ua3aOwSqlO8kibZexZ2pBqux6+Hfr6q69T35Msl49G5H7l20AA
	PVyDeVZmP6Q2ZU4PMJCRkaRcLhRBcwrw3aid4MrrH3wheNJxVxRunkFnufSj6Qs1GcWtxirHh80
	b2uwqsaGlg5DK4hqMn0clvZFGFlzVA4qck8+oFRIMTIvtp/FHmRDC7DItyKYStm57vxYmn/ERnY
	h0sog2FkbSOePp
X-Received: by 2002:ad4:5cc7:0:b0:899:a58a:9039 with SMTP id 6a1803df08f44-899d1e54365mr27172476d6.49.1772170230440;
        Thu, 26 Feb 2026 21:30:30 -0800 (PST)
X-Received: by 2002:ad4:5cc7:0:b0:899:a58a:9039 with SMTP id 6a1803df08f44-899d1e54365mr27172096d6.49.1772170229863;
        Thu, 26 Feb 2026 21:30:29 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744afa7d7sm36590121cf.32.2026.02.26.21.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:30:29 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 13:29:40 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: hamoa-iot-evk-camera-imx577: Add DT
 overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-hamoa_evk-v1-2-36f895a24d8f@oss.qualcomm.com>
References: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
In-Reply-To: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772170211; l=4071;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=L+GHPQAqqBvSWQjUMi4LyDjW1xWjQwZbzVzgQjYpoZQ=;
 b=R1BoEM2l+QRSFpo9pTovfM5KoiIDRXx2uUsgGfdRgEUDSF8H8uiABvrCgwwc/W423s/QelVym
 64Up7FeDSNLDmbaDkBMueu6bT7p5OQq3N7O1TftR3fkweIMJ88WlTYf
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0MyBTYWx0ZWRfX2s4Sh0ektl0/
 0QM+3PmrxFaVHV52Lkh+ftVfIhen+dfPu5T+WqAQq1PLpnj2nCyZkHE1Brkk0AwMkUAMF8C3BRz
 VVMxFyMoR3ddI0ElSgMElfRPWIDE1IaXHd94RCLEpnz4WPbappNmb8EgWmzMBAC2cl1GoTZ24p2
 AlfAy5R/ysL/snQsPKGHqZWzxhIpNsW5Ny/C9YTdl6qKNhRazsSSK26PQRp7cZZchLH9v1Fsbs8
 av9bnR6gtF8lCYi/lrQ9IRvFrpP0IK4dCDt5moXk0Woq29ypWhito8r0WXRa12+eGWuWt9Le9ND
 bR9IgPvvisvYJnPPxY9v0ANv2hvR55i/Abyoow864866PGBrzEeRJscPEXn2oYcpIN/TmszVYQm
 mAOivHYxaiydJC29z3XcT2eZf4zl2hYhuMzHEiNLvEAED6FH/i4DXfYGPppTweQ/hZiiWPHyyQF
 /75rX3cCoJMZXucaw8A==
X-Proofpoint-GUID: EGzEC8Qi-7TVO2fZ6_Fu5mFmUG4gkcSg
X-Authority-Analysis: v=2.4 cv=KZzfcAYD c=1 sm=1 tr=0 ts=69a12bf7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GnqVPrpTqDTv7ixMMmsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: EGzEC8Qi-7TVO2fZ6_Fu5mFmUG4gkcSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_213032_008235_71EDC735 
X-CRM114-Status: GOOD (  15.99  )
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

Enable IMX577 via CCI on Hamoa EVK Core Kit.

The Hamoa EVK board does not include a camera sensor
by default, this DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         | 16 +++++
 3 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 317af937d038f5d8bb5292db66c48625fd904793..724e3c4524e9fecb0719f5297ea19a1fc7f5797d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-camera-imx577.dtbo
+
+hamoa-iot-evk-camera-imx577-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-camera-imx577.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..f45a7fbd14b1f6eea994de5d15402106ca1b5e79
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy.h>
+
+&{/} {
+	vreg_cam1_1p8: regulator-cam1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1";
+		startup-delay-us = <1000>;
+		enable-active-high;
+		gpio = <&tlmm 19 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&camss {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csiphy1_ep: endpoint@0 {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep>;
+			};
+		};
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 110 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam1_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dvdd-supply = <&vreg_cam1_1p8>;
+		dovdd-supply = <&vreg_l4m_1p8>;
+
+		port {
+			imx577_ep: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&csiphy1 {
+	vdda-0p8-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index fccf1d1bdc6067b33e264262af3c4bb64346cf1c..f44f314b2192a131dfcbb0358d5b85a9e91fd739 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1274,6 +1274,22 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	cam1_default: cam1-default-state {
+		mclk-pins {
+			pins = "gpio97";
+			function = "cam_mclk";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rst-pins {
+			pins = "gpio110";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1


