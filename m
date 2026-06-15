Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9385CD98E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJgy3DNUy2GB+MmvGxEQQo/FlAt4h4kNu4Jgs7rdybA=; b=XES8uhBXqihijxWGxKf6SbwQ3u
	Un7iuLSqOPzNxnkOuGIH5iQkTP/ebxMlF7dvKuorWtCugL04m5EKTGNeSwoY3vax/XPnZ4JA3pkJj
	xScymZ/paoIk/Tx31QCjYn8oGwL2XppZYRi0Iqe/q+Pq4oMw3UPtDi03nDBXRm8iPNs7LkuDxqnGp
	lqgazt796tC4iyGtx6i5CigBZpXKkHwzXqOyxeSll4feBvXzOQUpATWwVTo3E+ywPyzqYR0gg9dlO
	MwL6fMPZz3/nACwaJo4UJAU+yXS+xstqNeP9M52J0WmIJIPY6InmWmqeo19krKjDQFZTIS3PvK0gz
	IreQTfsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2mW-0000000Dszn-1Rti;
	Mon, 15 Jun 2026 08:34:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2mT-0000000Dsxq-3vuU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 08:34:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6L17H3888523
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJgy3DNUy2GB+MmvGxEQQo/FlAt4h4kNu4Jgs7rdybA=; b=ItH0BGHkBKyR+U5m
	x3wQnYg0Z0NMz//fDUahmabf1yJfN9UNQHd+Uqi1Ob5MD7+OxcBP7pJ9ab17wwsN
	sgHuUPt7tmzX3Q1TYNBwHPPIBtUkxjSgFVfqFYhd9wsd8vSv4TfnPZSZdSzk98tS
	/WYub2QPRIoKjZF9W9o+Nnu4nF/px1yHSDhTkW0CprlKESgZQH7fvS6F3MFDxmPU
	AO72m3BfbGOnMADgsPWgTpIqKxY9Ac5kioHnC+2oAnZLAL5XZMecRsJSH/NxRiqj
	FuZi2h2BXvMkY15+yglgc747bgmvJT9rW0d6vQwguu1p6Q9yPKl23OdRnWGtf0KZ
	BamU/Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wxen5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:34:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b828c8so5062459a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 01:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512492; x=1782117292; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJgy3DNUy2GB+MmvGxEQQo/FlAt4h4kNu4Jgs7rdybA=;
        b=bCFRfW1xNzN9GAoIQ4aVxN2G3yRyboVulktUZ7nlybI9YqWDhTL4NmdkNqZYZ+aKjT
         JsHoG06+GD9wROgW3hEGNCEeHYRx+zgHBBQS3I3I1L/VZxay4Afm1Qevyv1iO7pcufCM
         vcJeOw9QeV8M4kZbvQGo1Jl0UIVrhICPCPKVSD1byG+zZoTXFLSptFM/IWId9o5UorqV
         f/eEChwpaQNAE9XldjNaQDaG6RTVGrwE6lBuBrgzOznZeCO88zPV0/vidjKJ4ys0A49n
         ZYMM9+RQT97dd/E7tLGqkANsTMR6rbfAF9HI7Vgc4t6NzCWwCrUdk47JtFDV4WTWq+7d
         9iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512492; x=1782117292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oJgy3DNUy2GB+MmvGxEQQo/FlAt4h4kNu4Jgs7rdybA=;
        b=MlReh9cyCO5iGrtRF8k0qvti4wEr3WAT0gPTBs6h8LbsrHqsPKei3fjY7Ed9tUFIm0
         nB6Wk896TjU0mYsjfaeZ9Tvui+Xbh+xQ5FlUeiBvQ9imvVZZWBOYVBfYus+hu/ZZcJiD
         vB1gFvLm0pslhLC/IHmAHg/FQrIXSg2zV+3klBCK1zDn7qfEpDKAjc6/ZomCD1f4Xar3
         iWW3HEtM87C7Fl7R6nOrtbGkuUrIGnL4GBOIECX9yJ6t1597CZjPKLyl8vEZOsNUbZvM
         K/I8i307Q0ag5+1NXS3ne3ct2M3OrE7G+iuC30hbWHeM7U3znLo6xg62aelB9Ibb0d++
         MqGg==
X-Forwarded-Encrypted: i=1; AFNElJ/YurfvPvk82YRYEWCRHz6iYg38h1eexM2fsFRBPx8gyHO7wW0m1fHMh3EFKZkocV5kfqbhWB0VIJPIV9YCsG66@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9nZhBMgA/h4hd9kiWasayLF51f6CTOWAToreYbYomFvZgqxEq
	Rcp5xf7/TH85Gb0A4Vfm7oIZ2U2Lh6HZACGolqGsRyFVPU7PDEtfj+yHHK1XuWNT2iYbiMR0It8
	O7icyOieGR8rCPcUAxJw6ijW8HN9qEihINTTcC2wtOr/kU4riZjWchxbx428hFQHFRJ6ZEY5+TA
	qtVA==
X-Gm-Gg: Acq92OEcT34cSvfSVRvUij63ORwvztOhqFJLtRRbxiq3KboChjvO0d+D3NGHv6gDgzT
	A2FhlDB13bh8M96kMoy0uXDnA1YcISrse8gyCml5q5wvtTP7sfYK3L2xnGwvJqYJEARfVpMpT7Q
	w1h04yzwrQL9h5H0P5sst09VCpcD9b7qztfY2zljcPqPehZuBTSCdaSyUDCF1qVc4Q02wgEIvmh
	Zy+7e3ycvYHj5kH4rAJquGNJO6wodUokcLNbdk338ob+TkFeDCBOx4Sk0fPVQKg0gYoqVIS7qjr
	4a1qfsif37YZWIgTjz/fcpyEvRx1TzvxS25LgWKjl0AJjdPZd3/y/VKwshRUjfjMoNe1aOCiHsj
	wFMOqeUWm1Sn0Q65g7CDHnRDkNsQ4YGmcDe8pV/uSTubzueTEUdLS
X-Received: by 2002:a17:903:2f0b:b0:2c6:9448:363a with SMTP id d9443c01a7336-2c694483867mr7693475ad.20.1781512491807;
        Mon, 15 Jun 2026 01:34:51 -0700 (PDT)
X-Received: by 2002:a17:903:2f0b:b0:2c6:9448:363a with SMTP id d9443c01a7336-2c694483867mr7693085ad.20.1781512491308;
        Mon, 15 Jun 2026 01:34:51 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:51 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:59 +0530
Subject: [PATCH v4 6/6] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-6-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=86sXsUvCK/NB9tywTPkpmKSS/j4crBI4S0ZLvrfM82s=;
 b=AFevhZYVm8Sy6eMT0e5zugn9wRNuGPmB4Eb2NMT60RbAak8HDv5GHGmoVsN1fBNKodTiSyOya
 O3sH+ge32u1B7ZJY91uPTVO9Dt5/+Yx/hEqBlRJY7ICzkR+Jcbv/pGb
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: tgLdZCS46AJzlq-Hd0Zd_p8cGoO3vXxb
X-Proofpoint-GUID: tgLdZCS46AJzlq-Hd0Zd_p8cGoO3vXxb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXxK0ZNMxOHusv
 4VXZ2ktYigspKS3S5jRYhXypyiQLs0122/0XkAjI0HM+wDf87wa++wHwlzVSQmU5pWurIuPt4hU
 YxtPTU7SXXz9HjRlzfpaBSv+GjyMX9c=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2fb92c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXxdbHFTzhe391
 2DhOO5C5FosFSE2UqTJNa7Wk2aYJzz11XM9pxcjlKyZqbsNwVTXqhJbOzcxeWOAKXjsGk0A3NBJ
 /gEFEbU+ZMjjvwRm1SSrMnO1P1m2OkOTs61SVV1sHy4BuZNTLlfFRav6SOt8q/0O7awnwuLKmeE
 7oiK6H3K84nN7s1vmapUjojd1NgGjDdpXRZh5XH9Sh/Sh0jVg5OJh+6PWa81C2ojX5P9PGk2WaS
 QYTZWHnlYVA+aY5U5XGE5q3m8pmBsBVofdHhLHcWeN398n6LLDalg0a5OnCZAZqVsCBYsWwqQDV
 hHo5QdQUTbB+QdETyib7XjpumOVRKfx3QUeEoODbYfJgNKNJzZWOu4sxdFRVxrS92CQuCJFjNOv
 yrxLOxVucqEK6CoTKZZbbRv5DiUkhBVlZ75AzUNh7xK64NXqTgoXMa72ToDSrEKqRub8xSDniN0
 yqTL8UjH5Iz8ILPHYXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_013454_100699_E25DCFD7 
X-CRM114-Status: GOOD (  17.66  )
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

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 79 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 76b8f144983827f4905a72935e8d5291a227dc97..09f2318d1c12c4239a6a7bac4ecbca38eb65ffa2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..d8c968a918c67cdebc0e7c6fc14ef820c97ecb75
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm8150_l11>;
+	vdd-csiphy-1p8-supply = <&pm8150_l12>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		/*
+		 * avdd and dvdd are supplied by on-board regulators on the
+		 * IMX577 module from the connector's 3.3 V rail; they are
+		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
+		 * level-shifter that translates CCI I2C and reset lines
+		 * between the SoC and the connector.
+		 */
+		dovdd-supply = <&pm8150_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1


