Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF94BC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 13:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0AxWTtHAl5qkJ2pTsdEn68dPe4XsoapBpxQmFo5neA=; b=O54hJCcCcsMoRkY8PyDqd9hbtG
	2MP/8DEIi1TQ9aGOcAOzIbzE3omedGPgJBCuS3Dz03H+Myybzk0laaFZiFR5lc7xsIshiGyX2TwCB
	GyERCIYVDr1WIXBm4pDKKKHwpfnjDzembg+gxuUr2fEH4I985k1jsMxdJPwF+opINhEOPMcG9kz26
	uWic17zROLjTv0HGB+Td7OuL8Oa2qdkYF3SOQEtjOsljnH3WBG+4Dm5Z2vgLuNrwWxlv270lzDXmL
	PVejN7N/u0QGWgDD87cXqavmmSVP+ArmPMrvsuFxYMx0TbUuKxdJHMlSinON1afMMnFWzvVRIES+e
	Yk+/2vFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrc3x-000000041fv-2bDV;
	Wed, 05 Aug 2026 13:53:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrc3t-000000041dF-24QG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 13:53:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675DHEjj2986628
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Aug 2026 13:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0AxWTtHAl5qkJ2pTsdEn68dPe4XsoapBpxQmFo5neA=; b=HLsfoYmK5hMDuRsi
	JTnIUGf948/TrDp/4m31BjvXBmFr9AzFJUmZ4N0RD6agwv0QtGpiave/SFfo/WCg
	G/rD8dinA5PIxzFmYTKgUESL7MjNu/+UDpPjG5qvmV81SS7O/SgFFt3HKEKW3ECD
	ylMXV7hop2iUz+yQJFW5AxX95rCSr5hcMROjnTkO2nPDcxQMNhO497384atpIsHC
	fSnsL4RyTfs8wTrGOL2xirSvWMq/6GxjDkS6gW+bFXwVKy3x2/r5UwPoNikQCf0g
	nQrhHLNfAgULF0080fKNPh6G4xlKkGBJ7M9e2FUA3GLlWdSeWsw/Qj4cFfZFi9gQ
	AyUfnA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5r5qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 13:53:36 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81df8abfa7eso26055887b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 06:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785938016; x=1786542816; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0AxWTtHAl5qkJ2pTsdEn68dPe4XsoapBpxQmFo5neA=;
        b=jKLkNB9D+CEre8XWvQ83fndmsdi3WtcMn9DgF1216/GBRGnLgGG5fDLWhjnoQDTcUm
         Ryce2aeiDKgKH6CKKln7OTSjVxklyfVhxBEwQdTeWDnWsiSc0cfg5/2AvBI6ImHMiSWJ
         W8Mv8tCM/HcjcSkNHz3q3UDePPaaykkVybMJZlZVpCgScqo+vYa1NxV/wVYgqUSFNiRV
         z4w9eUeXpWynevBSo3aJwD3DU3sETDqrHbH5ekLC16wVhB5OhYbkXUR/MmduDtLZFdY4
         8sH5ZbuguwOpVzyEvNwJMx0ijdH7dkxl/i4mCiqk0auFVO4MSzXTnYjKKZr/2WhOHq1n
         MTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938016; x=1786542816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0AxWTtHAl5qkJ2pTsdEn68dPe4XsoapBpxQmFo5neA=;
        b=D56Ra9+oiRrN/8u1npBYH8HaFoxItztAA4JmzAVDREZn1Trfh+kcmvDeM5D3O4mkcR
         uZ7Nfrj48pHNpU/F7g/jq2eUHovYlkaEwGvjFG+wM2eRYZffQ2f96zsUIKIguLkPwPoB
         nWiN3c9Il9updFVYhRo/lWFiH7upLlyJOwQIUHdc2ABYeLrgDeV8M31IHqHa7GVnbm/h
         p5X3YMolSxT6WzL9mmOMMKnwubPGvdC2sjdmZ5tWnPZR6lOL43/d1hCTqcXmaYzT2w/L
         C+TVX+nWyaUVZu8MIeqGSPp7kjb9MUGp2rcx8I0gwDKkjz/6ijnufSVmPhgf9sIdyRYV
         2zUA==
X-Forwarded-Encrypted: i=1; AHgh+RoZZ6x9gUJWyEm2bffwnYMFSDIXOFpcxUKDV5IcfHpt/W7Ei6wCuPbh1dEqY6ekVwmWUdAvUzqBZEWbqx6SfIIt@lists.infradead.org
X-Gm-Message-State: AOJu0YzunSfM5Zqr4tv3KAMnNFBzL6VPFOTW1+qgef/USEiewDmKC2N4
	v7U0FO3FePot/DD+HDz6CR3fno2IgHY//vmZ6J/HVdeIU9/hDOAw8hqLj19mTsB2NDBJofbkJEB
	FRtM8395wHIUjJXd+CH+2xA+Hf2VCc6oVPjU+n3q1UklIWPWOLVCP5Wr5QdN75wDToPvh9lbeYX
	kTSw==
X-Gm-Gg: AR+sD13dwJWSLXBuavWoPFK0wrdNteYW6pbManX0aINpbpB/mJnMf5jEirKVd0Jf3pd
	jbXWiGRLTDcf0BPEBz/OOJA2ZFLgavFsf1irWC8R0a0T/bTaSiij17t3Pf3h8aS43HZFbcycA5L
	GC2V4HrNES7eCkiibnULuh5N2IsKl0pAiB/54JciIfModn6XIkywfg3nS9K3nehSCyGd6eeGPoE
	SICTV51cztIJfwP1QdzTnUbRE0GypZO+ck2wfDMK4PmpOm17cJkGRa+EKS+RFffqQ2uM7Bm4BnU
	M/dYolflCSl+kiHRDBB9TfI9dBpf1xmPn7w9gW7hihagUFOwEh6E4MzoD5/PgNeU7Ww5JxDPgn7
	k7bKODirlG3FQ+NxYgIJN1unIzCtar3A=
X-Received: by 2002:a05:690c:6aca:b0:80c:2874:67b8 with SMTP id 00721157ae682-8202b0832b8mr40762277b3.32.1785938015852;
        Wed, 05 Aug 2026 06:53:35 -0700 (PDT)
X-Received: by 2002:a05:690c:6aca:b0:80c:2874:67b8 with SMTP id 00721157ae682-8202b0832b8mr40761777b3.32.1785938015288;
        Wed, 05 Aug 2026 06:53:35 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201320ec71sm20892517b3.12.2026.08.05.06.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:53:34 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 19:22:49 +0530
Subject: [PATCH RESEND v6 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-shikra-camss-review-v6-4-a8dbc66f0d87@oss.qualcomm.com>
References: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
In-Reply-To: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785937970; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=flYHAsWqMe1Nmyeu2IpHX/mwqnQXdwl3hGTsXJ2UJ48=;
 b=PDMw2aOWYrYOCZFdzruf6zNH7k5l6AoNAcwe9ZZBFFBOXv16kpouXh6hdvnEhSyvNTOC6GX2N
 XzVzwFuc728DLzuZ3r7NkQqRtxWQx8CZ6NCsP+Tb5L01ZEVnFzKkWeH
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: RqPBoCTYeFdrw_Ec0b7xUC8Cbq7vgJRD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfXy+ghb2ELnAee
 j+Bui1KdpPsKjiaw4bUXHJs9TjpBRaY5AaLjcvXacRVsILiAwQackoLDQRzqldpn9eVHd2ZlhDc
 RLJQyqwaRTfyBeMwjM09oHb2+zftrzyKT0r53Z+h0DarTvvNhq0bR727WkMMQqCv02hljnzSTPw
 RysRNsOlS3raZP4VLjF3H91Ezxg6HTBMEZseqB8vqLARzbLdCp+y6VpvVECSG6tzh500iqoLyFp
 xLodPVWBc/7N9QaR92piTWmyqL7G6xpackwO+3Rkn/9k5pu0RIZ/P8xcKjDyCFvH8wcJgNoLuaq
 uxa7VJimkq9yCSEiG0+IZSqvlkGQyrcrDfA5+bV4lYzQ2+687D691yd9uODmkOyE+IvnJ5OyYho
 P5RxnDJspfohR9E0jtCl1dI9o1zViVDzDpR58vqU9URD4QMC+L8xATz+tV+KlTTJZS95kBe9BFs
 tMKNIcYEkSoiN0Yx/2Q==
X-Proofpoint-ORIG-GUID: RqPBoCTYeFdrw_Ec0b7xUC8Cbq7vgJRD
X-Authority-Analysis: v=2.4 cv=RcygzVtv c=1 sm=1 tr=0 ts=6a734060 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX1vwqACY4+u10
 wigLRAH8t7ryKt+mgVxR4vlqsAstDcPnzduS2nskCQDLPBWPQJgSQGgX0Y7QqTn9ltmnsqfWAZB
 /azXwdfonVe50S0zTodAo1in7TDHhGk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_065337_665816_421EBC9D 
X-CRM114-Status: GOOD (  18.82  )
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso | 79 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55d539f5292816ce06c9a46bd4904c..03ed24afad5795b49848a2548c0facdc9f3e7115 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -339,6 +339,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
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
index 0000000000000000000000000000000000000000..3a481d972cd27a2a324d96d8f47c161e11ea54f3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
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


