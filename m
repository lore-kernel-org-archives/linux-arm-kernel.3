Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3D8FCC074
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAEe+cuuDHuRMfbZjHa6/1YpDdum6v0UhYvwnCVfMAE=; b=AMt1xp7Byoinnfflh2/ATau2dW
	b+IV3j3lQzIF62AQ/vRcuGirty3x696x05d65VUIH1pa5iMQm1vpX5dRtCu7ljLowZEu5knxg/FQU
	c0t6+WFoWvQCW2zY8bc6s/QCVkb0K47oDexChQP+5bCx0HdSjYkWJw6VG9ptEkWZBzjxlagAasZY9
	yiuA2UekJ7JjGmCDUFS188Q5GixgcV1KdCJF/h1q8GCMgweQv72iaujBGSZSB7lL2UW0X9y4Iaq/Y
	4Byocmun/IXonvCc0ife4Q+oumr7SVI7qfQgbUGV4sCQQj8Ho88e6tSf7Trvykcc8HgTiZnU9mf1o
	sZDwwh8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyu00-00000005K7S-1RO3;
	Sat, 07 Mar 2026 15:55:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzt-00000005K1Z-36Gd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:55:23 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48534237460so1047635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 07:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898920; x=1773503720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAEe+cuuDHuRMfbZjHa6/1YpDdum6v0UhYvwnCVfMAE=;
        b=EckC6fzksACr6czuaW0pz4xSKgLiU2U4rQAT5Aeys7DFARdGwvym33N5F9ON/QAHay
         /Zljl+Eo3U7pbpftTI8LYUoNt6wlapa2dkneEgv4BsIBTZgt5/6zVkqSySPd8qoiaV3p
         NoLsVPm/EuTvrqPM87WQHmfs2+Efk1Jp1cZlnXezWTb+qMjq/c46voo9Re8OrQt1Kr3U
         mAsxqByeICfCvStg6dMbWrAv+gzzzK/zHoVSsidQt6f6JEriVLEkDMXeYFpfZmBhLgAl
         X3BLhaUY5NMAwgYbSa8oaFE6eGmA8v0iFjpBO31u+n5UUZEataLEW5vOVyrCGpuY+oJ6
         8Lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898920; x=1773503720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tAEe+cuuDHuRMfbZjHa6/1YpDdum6v0UhYvwnCVfMAE=;
        b=EJog/NhgxOcfZZ/Qu/soEm/9dqmeBEGtP+jp/ofOKLgW817gdfaUwnisORL3oeWFLn
         Ji5SFyO3tJUek5Ca92wpVh66krOeC+2OS67FCa19zsR78zfGVo8PQKVTfUG+ZToCDmGB
         J+vmANBY46hpJzh8wgWsD80zist4FFUVTtDy+CFIjXO72MThfXp3lH5nKwajgfPSN/kq
         IOlJxlUEAmGFQDdIkaNTYB5OnYWP8VpDHhg0PpwKF8jcWwLzn9bUoxuj21vTjgtVYEDA
         Lz4Rx+3uQiMga2wI5Ln539GrH9Q7Dr/l+jLdfiz0bQnJLnw+8xU0fq00RMBhnjVGW7zG
         bg0g==
X-Forwarded-Encrypted: i=1; AJvYcCXYGOI+bBx+OewHX6++tg3avragMWKnB/fzSskVX+vWRPbMvU9o89ZsSYo0TGHACN6Tex45hPkFS6IqAdAWK06R@lists.infradead.org
X-Gm-Message-State: AOJu0YwGGDYRJLM4et/8R1qOxKqM+pB3bt4J2xvSDbthT51QkTUe2R71
	cbis6vRvGALZhefw4qM1oJPvNQ6rwBFYxO7fnrkNWLkDp9XAz/+qqzaa
X-Gm-Gg: ATEYQzxDRIloDSonOeEvaekwEtbfpY+pM7sNwOmeXIKEX7wDynmtly6TLyL7Dj6yDts
	Ye4+5gwGgq3wAPFPVcrCdohI/Q7GooRpit5LIUOLWd8yVkRZSXSHY+lFZSgvOXn11hfsOB+V25z
	WqI3lQ+oiX4oSEl+HpQ7wVwc3pLAwG68sIRSWviSoJkZyE1BBqq3e9nkrrVrxktPw6GlVCK0xcj
	lGE8ZCdaRWjlqpXBQKDuy2/IadKhDQVmzSp14BluzPtenEI4nKmnIyc8QkaJGCv+3yAMcomg4bf
	DtMo6ReMhEvysS0jbBEZeOcil/RuT0R8Xr+bzBeoPW/unjwOdnEYJLXdrZkfuYP9VFVF7qWGWpR
	Lf4AdC88za6ApoF6kGdG11Zl0iN+IdGtq6hV/0RyjFgcjVGbr+wCgGcQL4WnHZPHG4nv64f/h/s
	PNJrMeVV2CUAjQLJZUfqfKHyWOBVYwzzDIpx306BM5vr7Zu8b9z8YzJgX7cxLnUHQDU5Q+UcOze
	+uO0ehupdarHIxcbD5wjRnwAA==
X-Received: by 2002:a05:600c:8b01:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-485269198bdmr97014915e9.5.1772898920009;
        Sat, 07 Mar 2026 07:55:20 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:19 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 08/11] arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
Date: Sat,  7 Mar 2026 16:54:44 +0100
Message-ID: <852dfa2a90430b3f43dca70d3fae18c6df953250.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_075521_798614_3049B8CB 
X-CRM114-Status: GOOD (  11.75  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the microSD slot on the VAR-SOM Symphony carrier board.

Configure USDHC2 with card-detect GPIO, pinctrl states for the supported
bus speeds and the required VMMC supply.

Update the VMMC regulator to match the latest carrier revision by moving
the enable GPIO to GPIO4_IO22 and adding the required off-on delay.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 59 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 86246de8f36f..66c306f755af 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -24,7 +24,8 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		regulator-name = "VSD_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio4 22 GPIO_ACTIVE_HIGH>;
+		off-on-delay-us = <20000>;
 		enable-active-high;
 	};
 
@@ -227,6 +228,18 @@ &usbotg2 {
 	status = "okay";
 };
 
+/* SD */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
+
 &pinctrl_fec1 {
 	fsl,pins = <
 		MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
@@ -287,7 +300,7 @@ MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x120
 
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22	0x41
 		>;
 	};
 
@@ -311,4 +324,46 @@ MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
 			MX8MM_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10	0xc1
+		>;
+	};
 };
-- 
2.47.3


