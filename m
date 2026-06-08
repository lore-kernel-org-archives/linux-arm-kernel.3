Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EC0CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptJ4K9XngG1h9g+wzv3R0d5a26qxjwl67BJuxrxeWOk=; b=DTF51cvu0qMETrrbBfF0UMF8/M
	tTi4l3YwpALxS8NNHJj4v6NjlECZ9INit45DOUr0CjN4aW95bvtc6sIDFVKAXRF00GFsoN14e1E6B
	5whtC6O8/lQcT0GhIKhA16JAO4HgMwgCqqZyHg/nyl14fIhKE3jLowxZ2uF2W9ZAm5ixDhfNEA5eM
	R/yA2a4vw6gW9vXPt/gOnc35YnTc6yQEpgdDxanJ0ERTvOJe9lwHkAZWB/uYdUqYo1gtPrUYlKchD
	sGZ3AkIsGBfgBjoFfYTjt5ggw+EpsGTL66FOT/fDGj3xccNYBi/jcCyT0jeWfRQFCZTRWBdGvOvXj
	890cZl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWadk-00000003hK7-1VsJ;
	Mon, 08 Jun 2026 14:07:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWadh-00000003hIm-2ssY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:07:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRB443789441
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 14:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ptJ4K9XngG1h9g+wzv3R0d5a26qxjwl67BJuxrxeWOk=; b=HbOfu769D6HkdEVu
	TkNMjrgly8wEo1YPnLxmZOOIyBlOqGpLmqh7j9ojuWQeXdVUMCmSVSxw5M+pFF1w
	PS+PMW2u4aZgjNDpOZ+/mzwybopcc4oIyUOyIIyUwwYQ85e8WbY2h+uWIPb+qh1t
	UaWahRyfUeY6CGamWweiSzlgNRz2P9luIwh+bD+HMP9zyvif87ipGLS/OhwPGsFC
	iPrqulvo0Ff/2h1x9C7zPwF7+5Ir54zhzmW0f0zM2uA0LYmuBkFgnQPYOs7p/MAO
	jjMjl74MGTq+J9ll1o9iG6AJHNx5G3ebVFdG9baUyIp4PlJATyhaNPP+oaT5HqZs
	kRA0aA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv8g5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:07:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0b1bb53a8so34014845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927660; x=1781532460; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptJ4K9XngG1h9g+wzv3R0d5a26qxjwl67BJuxrxeWOk=;
        b=Ic3ebjIdYictsuMnYnGN0h3SFgUqPLMWy7D1bsk/cBiNPMweozhego0mRX23pGE/jU
         w1bB2+9wNxPY8N5kHUJRivcbQABLxrNs0sOpuh4hlsH/7qf0u58mA3NsJ8rXoxaWfQII
         B5NB3AshdMwv4VWCi7gAm7RCCTLUz2LkCXIOcN+OWhHG/WfxPQqOz8C4gIAgoP2C/gFF
         8SW8Y1ozaXY/HODRICcW+yMvPefiF2FVReb6HWZ2ozUcXgNcOIK8t09D9HfxvvjGAaRw
         S2KD+/gBFMHwxgzzTVVV4wXc+EEV6B0xwDArMmWFi+pYXaBw733vmZkPF73g51rdqTrO
         6/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927660; x=1781532460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ptJ4K9XngG1h9g+wzv3R0d5a26qxjwl67BJuxrxeWOk=;
        b=nenWMEePDWpr1qQga8qTf5YHz4VhLfMkfdGotjEKpN5A0cgKrCBTM6DTjgXRqr0xgH
         5mMHZDLNFhIhB42BeCnU9Hv3jFOb+/A7vOEkMH3ORhYSNkL+sakCSXwczJUtrgxmrkdx
         xWfqkp540zGUdqxNbWoTuOXPUzWx3Rx9p5Z3ijR3Zc9vD9lhWBdIO+a5b7cpWqcG1Dm2
         FtlhTeQakeRKCtB/zls3GMNwtWW2+2zaZvFLOSYOQSLn+wmaALao23kUAveBumSy62Kt
         2wu6iPbPfBwNzKjuOSXZqkiUMuNy4IdEIU1yDGZI0IIsltyZ8bZFlln1dAyFD7WYv9u+
         BpOA==
X-Forwarded-Encrypted: i=1; AFNElJ9oXqqd0OSGpE+doIW/j3Nxpa4XbJFu3BH9jAxerIRC9HJS5J0hgJxC8cFiLqerQJc5z02UmzmOU37lwvXehwaN@lists.infradead.org
X-Gm-Message-State: AOJu0YxBkAq8fqWPvmW8cAVnofkX2Uwi03OKNyjYqX7y4OnYOdPrKMFz
	sJve7P/H0/YXmKgATH2R7sjzLetXHvrUClPlDGLYErN9IFSHfvq9jxiq9fRTsnkuEppRcBqQTZw
	EuFWNh68H3++QbZvEFIHp65FR5tM2tBLr0EP1LNmVkAGLKKhTstKk6CPAr6DMTeqAJm4+D3ltJo
	ZULeZGa63w9urM
X-Gm-Gg: Acq92OHLwJ/uoadExCghCoOw/RB5dD2mKkje1wBdRVOdS52nnwMSlzTpnXOxoFlMtgJ
	lMAs2mn740yix5LAo2/g8u6FYRC2JHvE3nUFGFJRKYeaao2dAHlXbKSXnFGPItHvCzJXcsJiaal
	KYKvLmT19nXTAQRg2ul57Vsew8xlKRgg5GNUBtiUKoUaDkmJA8i9piHNsVDh9ipdZFikVXmuaFE
	kLMa4imp52AeCS502OQvxa5LDah3nd0hpQxw5cC8KOdqxgkwok4dC/J7TcXQMaqoosFbMRp246y
	0yf+VM+J6mYWel2DYdgRvL6n6rrVCN7Y3xS1LKNlQLdHCJa++20poFaipwXQ5JBIYdYIw/uwDWs
	pr2bFp0XXtSjT98J/q/5W/wwNDu131zpIQ9mNSXH6rsbMX/MzKnXu3rKExSAY6Ac=
X-Received: by 2002:a17:902:fc8f:b0:2c0:d29b:34ff with SMTP id d9443c01a7336-2c1ec514e77mr128961675ad.10.1780927659687;
        Mon, 08 Jun 2026 07:07:39 -0700 (PDT)
X-Received: by 2002:a17:902:fc8f:b0:2c0:d29b:34ff with SMTP id d9443c01a7336-2c1ec514e77mr128961025ad.10.1780927658999;
        Mon, 08 Jun 2026 07:07:38 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:38 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:43 +0530
Subject: [PATCH v2 6/7] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-6-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=4611;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=R5wAzXzZufa2JNL7Pu+bFDchV+HH1sdlIkcQCFcUAKw=;
 b=NshZi54WeV9a8D97jiR1sB/dyTfMfPfOSFbl4swH1UfFSw1K6lBZdCKTV5R1848lCk9Nm7UxV
 8f5FJ1Q1u61DhgMy9lnbAukPV9ZrbtW5qzd2BJOA5ZlOsZZUZ+Wxxu6
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: C0A9YKgEOFMIRBM08Y-nrgfFNgXYYYeA
X-Proofpoint-ORIG-GUID: C0A9YKgEOFMIRBM08Y-nrgfFNgXYYYeA
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a26ccac cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5a0XiBUjDn2U0RQTkwkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX1hUezsNBe5tx
 jlUYJSPoUtWSo1bGDKvYufBsscbjPWIUNXTMCufXljO8SXFCKQNW2nw/wv8kbnIL9TcUTd7Hc/I
 lOTgwzQrBZK9OsXQzFCsAE+u32d1Oz35ux7zWekgsftbiv2t5N3BSvbhqXVst2XHKmG21vZ9nx8
 yyzjL3VKaI6dcLzMDMo01ZV+yIkhs7EcdEIQ8/ZcElG8ryzjmbIIY7RUb3KWfWH9YmcxTppLmd2
 x8nXlD5Qj2ML+Bxwk0gJ9BTKthDwG9HtQF4zFx8XiIgFvEWJNY2sgq0j/PVebtgEyVtk7Xn32kg
 j9/swZJEi1BAr83REYJYiVUD1I7frIvbzMRmsx3m9baAuqxHXBQPAnBHZhfV45hmVK2k2mloD8Q
 YieoNlEwZlbGWfDJv0eTbHeKfJMWbL0UXu+ZoQ4QpK4zSO/reBF9H2fUKLJ4oBvy+Jh7XB09fXA
 MUxEfQ+IsAlsMl2n3NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_070741_852026_E9EEB702 
X-CRM114-Status: GOOD (  19.24  )
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

Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
and identical camera supply rails. The only difference between them
is the integrated modem on CQM, which does not affect camera hardware.

Add a shared overlay for optional IMX577 integration via CSIPHY1,
used by both CQM and CQS EVK boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso | 70 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |  9 +++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |  9 +++
 4 files changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a9e9d829fb962386b3975f345ec006504607130a..76b8f144983827f4905a72935e8d5291a227dc97 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -337,6 +337,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+
+shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..e3dad7c81e5e8aeb1061c784b5b893965f914a6f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
@@ -0,0 +1,70 @@
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
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
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
+		dovdd-supply = <&pm4125_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0d5c3e31b1f613157d4d2ec6947c630f1031b73b 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -38,3 +38,12 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7aed3121ef092df684b19a4de39b497..515af370ca014a668dc035ff944fb82b6e09ceeb 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -38,3 +38,12 @@ &sdhc_1 {
 
 	status = "okay";
 };
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


