Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5230ACD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tX6JkDWmit7Ac/IJ9FKAS/zdI+alWCBDeK1QiGdkxGY=; b=d1qqarq7uZPw2mfRlYRVO270U8
	ZiSs5kX+H/si0xl4uAnHOEBCxKi3C7MrTIwTOgFpyV4DZaWoIMTdEO6OzSkQI2lyrqAcBYC8jKF2w
	tX4/BILSGDVb8epBtLBOxWffGBCOkQuM76F2H7V3ovjP12kSu/8366C3XNbzIe9grTwrGMcuLstja
	wh36SZJ70uFOZ48nA0eOY8+iPjuZH7yL5zj0iqMurnrcozT2yiV/pJG7PAy18j7Kvv7ELLsf+rFNB
	0T+ZYHGAD+h9zeJi9zgbHVKdRSQiyXWiVsN2qDBl1G/sOwWtKKFpjaqdAT9F/D7cMo4RhQg1KwLag
	HMIqOnrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJaj-00000006NDW-0qYL;
	Fri, 08 May 2026 11:42:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJaZ-00000006N7l-39YN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 11:42:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487KZT1317490
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 May 2026 11:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tX6JkDWmit7Ac/IJ9FKAS/zdI+alWCBDeK1QiGdkxGY=; b=DfXUIhTlvOjxe8Y+
	5kJ8S1H4F38EI19gMMZTsfOEYWOHxuMGyzCK4u7S4lVytDG4K7UFzjs2sToNZTAH
	4tzc9XCP7g3uv19LpgL8NH7CYihGJaWeeALzVHkTZbR2f25wGnCW38PLgKX5Hh6o
	tDhkqZjEjZOjqR9gmBcmfI53WSf4WdquyJreFxk+KfILQZJIyztluPkuWcZQ1Qin
	v1hbnTAT/nZIBD4Zzkjf6ol/9ObMxRJ+uwTu7dIq5HB2XBw7zDtPneeNIOeHiUF2
	So8T/hnfKBLrztGdl7jI/lWiGyhAjhgYMgt8AOE3vqdDvNIM0FluhinPPdzFK+gn
	p46ZkA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1bc010w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 11:41:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8f461b583acso133763685a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 04:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240510; x=1778845310; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tX6JkDWmit7Ac/IJ9FKAS/zdI+alWCBDeK1QiGdkxGY=;
        b=gklZH09bXDtoKG40TtLIm2C15gXn1SKdYnd5gdiGgPwdCvhpcnJYuZqgFPlI1w2bcR
         lkUSkfkjfhPIxVBNmU1N5ZcxuoXGc7LhoMWL4Vo4Uc94A+tQP+iuZB/W3A9CAvtC4Rl1
         ZvVEGv5VXLjbPxUUbHcgLhXi4w5iSLbRHdhaZsS/hjwpHwem6Oi97SgKkieeNHYj5LWM
         rbBoDNx8XjdxhtKIC1BuZ/rQmV4tttPwqJOtGQrGh+2zpcoJPUdz85ONK/9Oto8HwRXe
         xVed9eMgpG/sRkKfFMtLmNyXVvSecudzOaLzl/TPmuopdpt2FRu/MOQrEqRiVEHiRmD4
         MsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240510; x=1778845310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tX6JkDWmit7Ac/IJ9FKAS/zdI+alWCBDeK1QiGdkxGY=;
        b=kGeqW7jTIY8lqh24BzIxiXXzrT5AlJ+kACdmLsVcskjRHcDtBdhX0xpFM2EPLfkH6a
         efaFQSMQEwc9ApJBpysP7oLX94RWFWmyUwBuHi2mEqUrpOWMSdDQBrZrzR/HSOcniyca
         yw9aMhLo8YcGcVgy81Wq2f8z8p6LjRIQDBoCFMmdyrHGPmFVl8pseac+rdaJL8gzuaVw
         a2vrkmrReEZmfvA9LncONzyBn/0oCtYGJdhSFL1uHkGa+XECSijpvnAqET6vMliiWD9b
         fQbDiPb0MBCGE3X8swdl4hCg0lIhsc3QSDMkPMO5znb5MSiQP0h5uYgyhuFXamDdrllS
         1nVA==
X-Forwarded-Encrypted: i=1; AFNElJ/aMHfvH93ANiT1N7HhdUdUWnZ4Dd4cUXzCjY3O4NUZQJeulQyuu/FhBWMUHPawQnGhCF0uCU7fDY5o8cUY0zvZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyRwOyIkJcAvrlJmxP/GKySSdvfDImTLzcVEgftgRIDTNluiUAY
	1jl7YzoT8esOH05OHZuGan1b8P0IcmKkpQnrcYV66xTt2JYTXTieF/Wc/0B5WbJi3eC8Ee32sp5
	VT9UJu2Czzrpi6hbxgE+JhWtCGqTJ3iDGBb9i/9+JqF5yahouszUOWJ+dgNSTYneGdWvz2fl7Vc
	tWQQ==
X-Gm-Gg: AeBDies/FN/2bXxEG0tQiiEBFSxc+WBspUVq5sHdvCF2gI4qxwplLAqSjc9hbthWz3O
	GeXcwdjiqOqmxa1tjZi9IX0UsidawiclPXbvo+vj80Fnd7zqYJ4G2DF5VMhbVLkoGHi9yrvSrqQ
	xG/oawkoY31lwSwEjhCIhpU4GQl6gDJ6/SDbOzasLdIjaDDjjYj6dZy3C4YSWkaMvxT0T7vCVCe
	ZJqcSBtTGdsjF/3ChWCCAk0celsuPCe6uwxtuHZt0zjbm5tQn79yf9LVng4DHQFo+Yjbywe6sFM
	N7avH3u40PvuFI1Q/C9szi74sEIMWrWVckjFzZNX1LwzwZezK8E7DUGIZcNiqrOg6f/e5UgOhfi
	yMPpjCr4W3PH/jnsD/Lgao4nsjnmuPaYtTmf1RBdMHUm2Sm+EjfvTJlYVJ9bgkhv16kyyTM7eP1
	ZiW1H+tQn7p0Ou
X-Received: by 2002:a05:620a:1a0f:b0:8ee:e011:a77a with SMTP id af79cd13be357-904d43924eemr1787927585a.13.1778240510131;
        Fri, 08 May 2026 04:41:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0f:b0:8ee:e011:a77a with SMTP id af79cd13be357-904d43924eemr1787923085a.13.1778240509717;
        Fri, 08 May 2026 04:41:49 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:49 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:03 +0800
Subject: [PATCH v2 7/7] arm64: dts: qcom: hamoa-iot-evk-camera-imx577: Add
 DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-7-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=3823;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=C+fdaZxLrumZmrqKOPIPxKcscjjl4PkjK9Fk9tnFUzI=;
 b=9XYbJL6WMlwsC7APPQEr/KM3rpDbA1ZBSBoisHSl12i+aDVSSutd/eLI4oZcb23vOxSu2GI5R
 nQvVmkw1noWAs+1OJ3bfyT6apViMjUM9kvQLXtDao8r4x6pUxoqAUuP
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX5l8wEu5DsAJD
 zkSVQgCjGrot8tcg547CbZ3MTJtjP8DdKS3qqx476nVYxtWTYPUF0/GvHDyulL+EIaylZ5Xwlvg
 ohz8pxrDQN/F2NItGaXzcPdtbjQjry/meHVTghcfwGDMLAjbPi8CRw1YvEepQYxmnP5UQt8hiDP
 /cKcLyOHlIxO4fAchBUuWhwor1lbrRG3TV7tkW02c2+uPcDDKqYecJg/zEanD2vGk6XkN7hd066
 jNjwoW/zXYQAqDOh2Zrk+ARNRns5Q7wAav5pDHypPlPuh8/axC5Pfc6NELOwMY9pFSpao6bQymM
 IOEyk7d0993OyyAUZ9PII55HMkT7OB8r8rdSX1dWEk3t+6Bhi4DXq1zyYXEKCbIQTBXXapLGPoB
 S1T1fSXpftuZurxAaEqgF1oYOBsORQHIUI6ArgCnR3eKN9Fj4h5ovj+3u6oFM0+RDdqcds+gVvJ
 mvm/2xnXo6U23i7AbOg==
X-Proofpoint-GUID: o-HU8uvm3Nh--nfYOlhhuCSGoh4tSbOy
X-Authority-Analysis: v=2.4 cv=JJQLdcKb c=1 sm=1 tr=0 ts=69fdcbff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uiy82_YRydbR65prXQIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: o-HU8uvm3Nh--nfYOlhhuCSGoh4tSbOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_044151_803228_44B25816 
X-CRM114-Status: GOOD (  15.85  )
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
 .../boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso | 74 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  7 ++
 3 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e73064194926096b98b9556a3207e8f24d72..48536765058a4244a2b895bccc21567d186605bd 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -22,6 +22,11 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-camera-imx577.dtbo
+
+hamoa-iot-evk-camera-imx577-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-camera-imx577.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..4a20656f16799d7a9c8fd4ad63ac0989cdc37de4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso
@@ -0,0 +1,74 @@
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
+	vdd-csiphy-0p8-supply = <&vreg_l2c_0p8>;
+	vdd-csiphy-1p2-supply = <&vreg_l1c_1p2>;
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
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
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
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f694c22ab2670d26753ee096ab3682..8cfcf48ee0099d4b505acc3e5662553e77704d5c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1320,6 +1320,13 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	cam1_reset_default: cam1-reset-defult-state {
+		pins = "gpio110";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1


