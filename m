Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE03CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogg4+x3ABUq0tZ1UsQhDlNpMjMUYFLtgDBX0fb8zT00=; b=IAZUZyJdpnpCUSLB1ajQ6WbbGy
	Sl4r77VbX+u9yXkNvzCB8/A0tQXecnVlVPvzQv6Xd2P2ZKBuXI6IDyKGpGJ5leR0lHfqNdI13iQ9Y
	xgTFk8T9v9llHgekjQ5wlOIwEDLD9n0W59y1DYh0eDkP3mQn0eSQ7qq5ww2WrsSrkGKB87NBMvHY0
	Gbd/20FVWQaCrwhB2aJosEvLWzbu88Q4DSTBj13LZDL4dMQ9MwHOdqbHem3owrWroRNhcJpmVTIwp
	PHZjdfafGgIRAj4faPfyETVJG44VQWTeeOE0OD3/Tns/sOHpwgk1I7vRKWxHtkGNCMDksVV/PeSNw
	BbtR3XkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2mO-0000000Dstv-0SDy;
	Mon, 15 Jun 2026 08:34:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2mL-0000000DssQ-3o0J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 08:34:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J1Xb3327575
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ogg4+x3ABUq0tZ1UsQhDlNpMjMUYFLtgDBX0fb8zT00=; b=eFT1Hah9jS0fxap1
	ii3Npy85ddvflo+0FlYx9VL+jciwm3Ipl8rmTG6lxVtZuJ5c4SHpDQBGLIZPGZKe
	NzYyzuxdTZFMWF5dqaU9u+/IjAyfh3OCwtkr/Dy4/RO7KTTe9qsiq/ekjtQkBPoI
	te+Qbs7cwjQFhxzAabgVzK6LSwEGXaHVDjd9y3hXxMnG+tm9uR9NjvaB45nH+Pdu
	JFn5dgO99t6zilMJpriwTYInaMmMIyUX+h1Nq/rrAqJbPmm/ZszUoRwM75ax6Dzn
	G8IYFhp+kUMw/Ul/2mvtv7Zo2G1/psThhLc8YJGvHiq/YkITXXdMOXmLKnumnodA
	AdEueg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cgp9sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:34:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c272e532so33227405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 01:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512485; x=1782117285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogg4+x3ABUq0tZ1UsQhDlNpMjMUYFLtgDBX0fb8zT00=;
        b=ikPSHuDQPktFPKKzufDd6iY7zewgvqbD7FHCSHacrrDyEXQ8kPoymW0Bv3Vr2N3ZL9
         c/bwv03j+6VDzdMP7Dyrjg0H0xE1OKHvODWLifBqlAL0EaC4us3MwL0Ao3iRtwvrvJg2
         ZcP8d88I/R1TVYJks6ycxiKl6l88SMljH84cBoC5NnwzjS4zRY+SXkzadCRG+hlcNX57
         XTgYX9WX6/Z4Rczur47XOzWwW1Aalf+Z9beKKUMW+A4ojrWOPef5cAhGGdKajirCbotY
         0stlgiXAD6RfgKkVYz6kjviDbxvvfx3uxeuR3TYCC5a+DbfrA/xW7mq7k1mKCjQvkSCq
         DNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512485; x=1782117285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ogg4+x3ABUq0tZ1UsQhDlNpMjMUYFLtgDBX0fb8zT00=;
        b=bk2nIa3G6YVSjZoYZpfdwEgJx0yjSaatsIor6tQkrVTrTcEINbHamCc9QAWV7NGeIw
         786SrdELqzhZ5jkogJ1l/ytyh52wO7ScQ7YVMFvSrjWlXTGTB5wHrsk1exe5yGeN3Slz
         Ybpz+LGSv+QQkqKFe6px2lED6QNE+Lh3NJEfNOhTYCSNSlWUY+dxzRn0sd1Wjj9Np2/S
         6+4FYEWkbmmnye6Ox5gh+DzX+5aJiRoFyzjdU7yJ7gaFwhqgBgb7yvVmx6H8Ee8F5HQo
         waonlDOXh2D5Pj/ps8Qvhmfq/Ha6W3dNQfn2VbtPIhLFB/v7FO5lAlSIhJJqGYBsdEe6
         Yv1w==
X-Forwarded-Encrypted: i=1; AFNElJ9WPXDsxu4jxCyeCXheTOdN5+JmvZYl2IiULyzcsbV2ewhhGHIyR198l2disDYNMPIe/X7+9KkTbfLdWpHzqq8O@lists.infradead.org
X-Gm-Message-State: AOJu0YyhLQo0HJrsNPSpGArTIBks2mibR/UyW7FSBISsMi239zocYbDh
	Pnpj0mU9jpEXgHJlfvoSrgyg7wKASLd8rK6TXMEpVnn2IqzgsEIXLyTD2lN+mzATMB/oMYMtbPW
	hlxSlxla+ANep9uyeZReL6yC39kBNYFc3gWH6qrvK6MhobYgOYm6A8yuTli5XuL+9fQUUy0ANSF
	/LVA==
X-Gm-Gg: Acq92OGhHYY43iMeJYd4RVOJK+fDlI/KzR6mjNnEX8AcHHWDZxHgRcrpCSuqwxlG0s7
	kxrR01aARx6pB+ZiAdXvrVMV58Uz99LIBBwyjVnrNB7igoNkhMVl3UzStpn5NZ8Q/8l2d2X2zs9
	osBj0JSueKlcfRecbvFAR7Elu2kHR24SQLU3/h6jOeAz/+S3a6YCnKv0GfVRJEo82/SEAcs3i8o
	V51z6IQkvOZqx7h1KEsgiLu6FTZGAL9FDlXq73eE1Cs/giUgcR7QLz4Qjc2J38ChjKfQq1LmJWW
	96hjwIf6ET6ZSRize6pu53z3QaMMRuzpfyRN4b3pm3cgH5TLeF3ijBEVJq3XCVR/Y4MDrTjivc2
	1OsZWUjgQawVKwo8QzS+en6Kt0TC0HzyawVameKcURDy3Ldhe+E4z
X-Received: by 2002:a17:903:1207:b0:2ae:450c:951e with SMTP id d9443c01a7336-2c6641e180cmr104881305ad.17.1781512484589;
        Mon, 15 Jun 2026 01:34:44 -0700 (PDT)
X-Received: by 2002:a17:903:1207:b0:2ae:450c:951e with SMTP id d9443c01a7336-2c6641e180cmr104880975ad.17.1781512484003;
        Mon, 15 Jun 2026 01:34:44 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:43 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:58 +0530
Subject: [PATCH v4 5/6] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-5-bcb51081735b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=X503i/Mth0eTflp/hBfEJ8uVr06pRZPumlIjapac8+M=;
 b=HSVeJrzwoJPjIg0lth7jjpJ+yu4+T0MG7EJiH0F6k4OQXUeBwaFIwd8XaW3Cnbau3JrX0ZOPL
 Ht73cPtScrRDrVj0aPkrpIAiYqSkDJ/yT3aq2UJ47aF55jxuO/1Mha3
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: NXD9xZ7hE6zpcVccKacTrrpW_efQ_YO8
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2fb925 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NXD9xZ7hE6zpcVccKacTrrpW_efQ_YO8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX/MunIdCHZSwL
 vvZy+il2rvC/fKEjNjZpp5SRFDlu3WsUCovl/iQmocy9i9tksa3IdcVxs0TaAW+37vYfBtnPU4x
 8J72NhQDWIeDfllZo3PQQbPaFRtmPDw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX8Yp2zihN3jnb
 5LHuliEo53FmclkCHe+4WFTXscO5s1cRDR3xLydihk5UlyNviqxITln6R1wWaMaqBr+6MJXt9v9
 6iG3J7+7m8WSZRPfz0mSzdiUPdW6mooaTRjG9KjWr+0Y/nhMJSEAnCsy/j6pxwxGw59Mpapcl/G
 ESnl7PWqaza2FjQWbSdTR5GHUNHwJOdI6QTPv86K1b3hPs9HBmwHajAhKYQ8wqN6lKkoebLKV0/
 HTMXmJNrDA3iertCxTlPFKvvrYMp/YBwnoryDfwgp8vNC5SSxOhMnx0EAC9pt0vUQsafPoD5e8d
 7wFRzQsxFlCx33Ag2g+7B22HRqrI8XXUNA6CuLtNul6CXIapf82Kz7iQ3RsB0YhLLuvjKRSjH36
 1a/mdFJD2Wei9wBmCO5sb7ZaO17+H6pGMqnsfyC5C4yywzZdh37JMs+Pll0TvC6NGpaF9JywerI
 xQ/rh1MI4ZWUzAKevmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_013445_954821_05B19928 
X-CRM114-Status: GOOD (  18.45  )
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


