Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC743F30924
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cGHaTDZ3QbyuBDsIPC7MSdJMXOGPnxDxsu9adO9KiQ=; b=hW1BZZsorzLTVSlAWHy5anMTbg
	KVGRUWfvjZ5u9qz8eSNnL7EgziVV873lw2R1pcTCtYrAx2TbMRC4MTjOCWWbUYTOvdTNw3f5feAA+
	oZjjWT5P712OkwqjnLsWwfRoFeppwoFoZfC5ewJpT+9R/y9y1hWMH9PEF5+l+xH2QWgTEhq0U41jw
	igL1E+Fj1SPaat4CdsAuHjGcJx8YCmm5+RIkLEahsNQzk26HhsOQJBme3+ZQpL9IUOWak/qfVYmiw
	uzKWpuf7uCem/1hL8VfXSfrS1G48VBhNbnPqzrJGdiZSzpjSRtGc9swduvxy9sEPSyLUNKa9J2g0n
	3n/vOgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5KQ-00000001Rr9-1qNf;
	Thu, 05 Mar 2026 09:49:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5KO-00000001Rp9-0ibU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:49:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253A61U864824
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4cGHaTDZ3QbyuBDsIPC7MSdJMXOGPnxDxsu9adO9KiQ=; b=o6yVVFM8h/8hdti5
	M6xulJ38RViodW6hOesY4oK81i2kzeEEPNwDu7mHEUIlqsfYNkrLRJgV70tpPuUc
	aeONl1OXgWobu3CDczQGLcQC5q+6OaMbiryKewQCDQF7Bl2uKg7+UujHc8PrJnH5
	/8aT1FORiaozVrpbx5y6HyINK2qhWBUrpcKrSUOF0a4BWwIeXE6qxYKqyNpXjN6o
	6jQvhBn1aEwe58/PmVTp7uw2+FqzHp9M9Z4uhKOuUnzEaweE81z3+lnu04NHzlgQ
	7koiqJWlSfabzcWqDa/ZRWOyf+2h02N1XM0+bRp25K61a0uJ59tk2wVLjAN9o7Rk
	cLD7Bg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk17ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:49:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-503342386c7so178368671cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704146; x=1773308946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cGHaTDZ3QbyuBDsIPC7MSdJMXOGPnxDxsu9adO9KiQ=;
        b=kADqcokfVcH0WXCvv83wS7PdTOgrbpDQ6LQQU1vuF+ChLWhYl7ikToCb+KFJgo5PMl
         kRhKVgSG1/dXSVzx4Xx+Tn/SlFStvCB/V/6efsmybsEYoiR1cqwRsWF9Eq9s8ZzbSGgM
         3e1yxHiS+iIlnsB3yJJvOlH6jy+KG4fEnNuFSOALwl/UzQqIEW9l2wKofdeAjM+28VQU
         mMViXR5F6PI+LmWS4l/6H2AQmTyog2TezX90V/GMFEgrwtPdxSbdQpyiBR27yE/BzgHE
         V9NYTihjNCEimcT9Uihkq9uvuDDwvU8RY6HvFN25rPqux7uVo4Q//tOEf/n49i9v+roX
         bTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704146; x=1773308946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4cGHaTDZ3QbyuBDsIPC7MSdJMXOGPnxDxsu9adO9KiQ=;
        b=gTVBa/oJUdTOgzdoSGoCVWgqTq6OhswZiXAfqoQZ1WXIc+H4a66/aP/UzQdkekNGWH
         kSQ/hlFlGJ06vYpoCE13Ww5Oq2rb4Cm0dDz861APxwd4Q3RAAeI0W7TfTryAp2sDdNBp
         K+CelFBVh20e7/ab+cYa5QF1oWoBwcaNt7NTgQYRhml4bsoP21pt672z4vtiyxl3sAA0
         2jTt+TF2GO7SFOBLOXe5kkGRLoLLDsz5F2guEePvHImHeN09X5bDrhjrZKwaIOqIx7Qu
         dCQmH2Vyf0NN+Wy/t8IeEmNb211pDosPwwRk2+bJRFrX4GHNMUUTkV+78GtiUI9aFIIK
         T8lA==
X-Forwarded-Encrypted: i=1; AJvYcCV1Z7Uaz6zm1BRGUuhWfkwdZmdGWDLopk97HRLi2QLuZO+sGMWBoj96NpI0qwzWjHCqZufkmJvtcu5qKNSd6NO9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9j4ivWYvIkH3KwX6Lxk7QHaffhmVbnQoP/IHpi9OwhW/onVrz
	oxpRM/z9aoiZ0nsfBiv+gZuXlijqREMGC5neJpSdFOIl4+LJxH4ue6hw7Ayi2eG/4kZEv4DX4xm
	8ZpJPM9qti9OVsmBoOp/tMq/gBNZMWm7rceHC58LL21l4wcnj4ZmqzuqjTEjA/oFss4if0yOyKG
	QEHg==
X-Gm-Gg: ATEYQzzLpKFsl6Ed+Cldke16YUTloWMn7T6BNAAC+r4jkf+cE5mnVTyUG+5E1T5Y/4y
	33UFMvTWmgeBB7xs52CZI5Pt5MiQZsGLSRelOFckHiPRSvJlUTT65cgjchACnDnwlyTbplC5q49
	XulyE/qOCT5zm0x/73jaQn2F0v5Doju4QSwT26Qw1MTwKFDQgz+SHZ7sreQHwBL7We6n06Vr+Aw
	U9e1gmsMpisFSS7hhKpM4zquYp3IxNJNwvQy/YpYlpq5aWq+Nv8p1Q3C8lFGsdZ4ovdHpXEouvW
	IKnL/TNtatKsPUB1sYbitmgBKiA4QC1KmS3vRMuxwR7iG+OIKCx0FRD9++J95HYRYMZQzfnCXVI
	XjwHen+8dKmVX8kBn0E1beUIW/APpMt0kgCZOzW3lmqc0x1Tj4ySDOj34lL1EDRJBqlC1Ej61er
	UpJ96Bxwfv2xwT
X-Received: by 2002:ac8:59d3:0:b0:4f4:c0b3:f50d with SMTP id d75a77b69052e-508db23d4ffmr63775911cf.2.1772704146335;
        Thu, 05 Mar 2026 01:49:06 -0800 (PST)
X-Received: by 2002:ac8:59d3:0:b0:4f4:c0b3:f50d with SMTP id d75a77b69052e-508db23d4ffmr63775601cf.2.1772704145831;
        Thu, 05 Mar 2026 01:49:05 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:49:05 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:16 +0800
Subject: [PATCH v6 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-5-38ce4360d5e0@oss.qualcomm.com>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=3694;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=PbP5HbZOT54hjcl4u46HR+7I6IyXggysw7XDymarv6E=;
 b=xPjuR1/IXLW6OcuyjZzHZvvlAfZjFPgkhBUumCm5uy+lLpB6F1tFgB9R9QSnD1D9ATPpDavj+
 2EWETJBbdnFCbfji+wPN8nVvPK6tZEYFBwcjp2ER7wqe2htnK25bEnu
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: DwgzaBQlw7heh_s9w528-lFEoNx3NaME
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a95192 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nxASbDduW_9Jqosb7dAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DwgzaBQlw7heh_s9w528-lFEoNx3NaME
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfX1MrlPDgO2Tfa
 SeHrQw4ID8TGZDrH06/XKIdQs0GN5HJQ75jRhuPLmpVgQE6OsSOTALj/cDNCebIw6VnLsE5167f
 iUMbjwJY5bIlucVRFG09XsgjBcP9FAsPo+joOhN4hDFoUyPwYCQKdX050tZvFz8cDqWu5v7UAav
 wBMIVtrWWJpNutqtjIa0cuW/Xg+qMz6wBA7tgWhi90sp69S0mwvkkq3qLM5CLEMv2sjnBz6FD6n
 a7DG004VZFiaYFS1aKNgr+/cFN9N9NvATgCpqe1lFvrnqd58hPbu2CKccUn1phB9Mi+mfcUiMWt
 +jvmJiY50kS1fYHRTIZygV+jaNwqqs9C5oQlYrTmrKI62IwY+UesIvsc9inQMPcuQc/mOjybEml
 yTmOpy1a9w01/up5rhmu/sz0mW2L+CeX6oq06GdOCsGDX6hyGfzFJoWMxS5f6bT9vC4WEbbZHby
 RzkfU0PtV+kdxi5SEgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_014908_340266_04CDF957 
X-CRM114-Status: GOOD (  17.06  )
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

Enable IMX577 via CCI on Talos EVK Core Kit.

The Talos EVK board does not include a camera sensor
by default. This DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.
CSI-1 interface using mclk2 as the MCLK source on this board.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |  7 +++
 3 files changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index defd40ab69e5c419b9d394c2ba557923de9225f2..5301e9dce4cb2b874715f8bf16a648d33339b578 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -353,6 +353,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
 talos-evk-usb1-peripheral-dtbs := talos-evk.dtb talos-evk-usb1-peripheral.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += talos-evk-usb1-peripheral.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
+talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..e0c385ec53b18e88b08166d391a638c42e42a5c5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&vreg_l11a>;
+	vdd-csiphy-1p8-supply = <&vreg_l12a>;
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
+		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk2_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_s4a>;
+
+		port {
+			imx577_ep: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index f877a3e5d0b000e9c9c5ee59dbbccc8cdfa05937..1b17d49bcbea4e3e2b42c70c5eb2ae8120841b8f 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -463,6 +463,13 @@ bt_en_state: bt-en-state {
 		bias-pull-down;
 	};
 
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	pcie_default_state: pcie-default-state {
 		clkreq-pins {
 			pins = "gpio90";

-- 
2.34.1


