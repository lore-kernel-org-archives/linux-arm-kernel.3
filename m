Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747E4D4115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OntX6xVS5P0RG4FVCEOIReiWGNNrhfdEBD7/dZTRu6Y=; b=gEvDCoCvVAaGf8uRXmXh5hieKB
	PYTTWbBwWw/8THn9/WUxXOXYrYmoOzsj7WEKY0vgP6j/FoxfFnum/DygFsSpbz5LLzIQ4T+yTVd3Z
	Z7r8Njen7OE7Ws30Q5yEYlNPOIumQMka0a11sajLD0kc91GnA/y+xjsPKMM9a/G94GIyqfMNJPSB0
	mfP54iGqiB0sztUhJ5I75oZzOGr203VyGy0fVYUHprSkgLxkV5eAYN3nUHq7/Bv5S/rUE2AwEo/Gs
	JBNVc7WkzcUtBt54Cz47qwH9zMCGqxGKVcgITfCXQOnDX5QvPDRzr0Xpza8+7SdtWJgtqXd8jyiXn
	WH/7UTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKMP-0000000C8Mu-2JaT;
	Thu, 15 Jan 2026 10:13:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKML-0000000C8Jj-0Wbg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 10:13:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fs7J1851017
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OntX6xVS5P0RG4FVCEOIReiWGNNrhfdEBD7/dZTRu6Y=; b=pcr/IgYkpOmqDp2C
	PXcFWpPvaOwlINQQha5P1I3nSFBeNmyLXm9N2+apOkJIIMUfnJJ4HyaXVxeU2mCh
	zNcTHK6JsE2VClegD5gtqM9uafeiCQEleEsgvULHT4VmAb9YGxhTqMBnj2p7xaBZ
	2kWCdWXqA5rIwRdwk3ijVu/58xeVBd1KFK/2ST2zHFypaoAyKpgR/+g6ag5sFXEw
	GmSa4RywY4J5okgFrkKEvpufEXS23AtZqPr1BRQ4DnDc4VYDAvCJCtfXeI358kjd
	7rEVtg0VUMvvTjvEQBQt5YowcMuM30Z3JbZXZlhenY3ZzuBAHpkmWWLdfwkqjdw4
	wh6nCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej12jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:13:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ffb4222a4eso18374031cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 02:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472023; x=1769076823; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OntX6xVS5P0RG4FVCEOIReiWGNNrhfdEBD7/dZTRu6Y=;
        b=Btt2mKFZSJ4zEXioYbCskZGiIe1dNbNjrDchBL/hvJ40GTCNkkV21hzaD0KqjCDBjt
         xuJhySmxf/U7Hm7veTrAop2uxLN//zirjAFTK1Q0ecgN4kD+AajlFU5Rk90VeJAjBMEB
         UgzMiHgq5iIYe1QltllYUnkvTFCann8pw1t6As7aaUC87L+563XiMEJrfnGtAOWn1xY6
         JiLSBEqOrsuAxk5UKxfD0qQGULyRPFvFxLIP5FGNErA+PIS76fZW3GECEW5S6W6OgkMH
         A0xeVLx0WWeRlD7SxbcYUV50ly8SlFnIdoGd3gyiEvkUqpYizc6I2gvX6PkSIMx5pR0L
         TqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472023; x=1769076823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OntX6xVS5P0RG4FVCEOIReiWGNNrhfdEBD7/dZTRu6Y=;
        b=htjIe2+lmdWL97rK8LpxoiqC/G2SxS0vwclNJdMqW+63ujXhmBqHzxE7xSc7TirC29
         M3KsBL23ahTjgtgB3qIQAVJ68vPh7co0AmIf2SI08OQEiXlKa8xcPWkbdBs9Gr6Po3lX
         u7kW884D1El1dxKwGumk8veB4t2wiBpmfSveOAjjmbW1a2cYun4JLX9PHl3ID87A+s7C
         Y6n+kff267komHyK5MQ6G56KokL+91BeVMKjhfws8VpdoF4H+BP8PT//bAOlAqfDxfdi
         refSpORC2ArD/uZKsWArwu7oruwuoZjaK+8VBNvIHuXXZ5Qc4oqeuVI+QtvsASWAwwr1
         7GTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo8bUGZT/ieg+jQV6RMkMmDBtADd5wxq3BvYidvZ6dzMnBx/ErjWeiCUuu/gcAWNVbby54Uc889Dbo0vDjcsJI@lists.infradead.org
X-Gm-Message-State: AOJu0YwftHzS0YWiRArFAXaohoDn+q+HPFCCMVGKyNOOKyII5dNuOIdr
	oTrkYwzLDHdp2KqCQ9bKFUyX3bUhgQBI797JdigpEisAi5OuLVM3NfYhX+KQHtdVAyPgECvpbYb
	a8erhgSOLnuH5NGzG+BEsWWcv7gkZGWX8gl9Y4FfiUxfdyZwDYKfWfC98Oc3s0JohPfFTWc/234
	f7Mg==
X-Gm-Gg: AY/fxX4OhCi1+ca21y0IhcL8VvkdZWgquX4hzlQA+L2AdWSKIJmqX2Jq/cHmvam96Qm
	5llLlbt/B4t5k9e1nvwIji+mLjv2q7v6kdyikdf+LROOCR6CX+C/5gf0/BZjJRjxBnDaWXg3Y4p
	OXJl6ezkBdgcZ0piVWslGOuTxOBGwG65G0RzmOi6JWTBNcHa5TfoQKvpVtqLTeWMb+kdAU3H2Tf
	MEzGbxOK5depkeFZKCQuk4d4wAzR0+V3/+OdLE+202obCnwd8MgqCSfiZ2RShjRB9524a6J3wmX
	1o6eFSILnVcgeadD2wLLYSyZWwcrcTN8rQUfkt05oXefKX8roxgJbSbW3cA5dF6oxyXv6h5uRka
	a+BbT/DqcxhosccDh8WRafO9LQGisVFndZKkYtFE1Tb3WaV0L8vci2SHZ9g/JEofFQs2YeyOPMG
	t8
X-Received: by 2002:a05:622a:8c6:b0:4e7:2210:295f with SMTP id d75a77b69052e-501481e483dmr70948611cf.13.1768472023568;
        Thu, 15 Jan 2026 02:13:43 -0800 (PST)
X-Received: by 2002:a05:622a:8c6:b0:4e7:2210:295f with SMTP id d75a77b69052e-501481e483dmr70948331cf.13.1768472023101;
        Thu, 15 Jan 2026 02:13:43 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:42 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:41 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=2955;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ee7juG52A66Kq9G11MxdDsIfF4O//tB5Jvajm3XXffo=;
 b=ZH0SefqJdvjdAesIqr2NusUAYGk9tF2xZ+ky8RoKmgxqsxDaO/y+G2869byWdWgt0OjMxqqMr
 TzpfAs8J96KA0YXTMhM3zrhkPItDDOIxZ7MqFj1QmjhFOsiSeX+QYaZ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX0J0VMLDFZkb4
 6gG74PJz/yHkBUL/b2DOZsoDMufJo254QAMyDoVGSYgCJWiW8mskXiUX3htqYl9Mny7Mgrn/Vbr
 oEhKOVxTmJDeaiu2EpNTror/K8jk5JQlQPjy+H19MUOJo1FLubccW9ahe86tk58iWYj71n1Tnla
 ujHbc1/z1kpn6fNFxqDc+EEW1ZDg9rumguMYAqn9qyvm2k/i/oRH8YGNQy2dkrSr8pEDuSbWhnk
 TZSGtUPn5M2OoaT/XNmBDGtILQyGsNK8I1SW+b2dAu4zNtYhUpipV3oxc2Rz/Q1pqnia2vQiFz7
 p4RDlM1FDLzVphNj1v292BgMjPeXatNNNNcepAdNwmuqXhLoTPyYYGtIyJd5StKhld4rMbma6Td
 1t4ZjfcT4ASAJU2xczM8VGO88C+pQombuNRZxp2Tgoqvtg2ilmpQGkBQzAdGzSXqvqXXTVQ7P+i
 6X2T9K59NEpl1dOm7NQ==
X-Proofpoint-ORIG-GUID: MuAwbDeG-D8mWvReqqDs6s_jNENuL0Dx
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=6968bdd8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bL963-9QzuwlG1m339oA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: MuAwbDeG-D8mWvReqqDs6s_jNENuL0Dx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_021345_174974_49BFEB47 
X-CRM114-Status: GOOD (  15.58  )
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

Enable IMX577 via CCI on Taloss EVK Core Kit.

The Talos EVK board does not include a camera sensor
by default, this DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+dtbo-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
+talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
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
+		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_s4a>;
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

-- 
2.34.1


