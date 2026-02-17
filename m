Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC7EE9A039
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYsU7UyOcFO6rtK6/iQ1Qf2xKJGmW7ahDM2xNeH4+nA=; b=Gl9dUeQxx6KYVjPM1HLgknDyXF
	wbkXNNT+j0D/pFQyBAn49s5GNJnohGvwYh967FwZgGB9tAFzD6ssxFGehjdxXVXDVpPTraL0DR37z
	x2zbIoyRlIqCFkt31DBwNHF5RfyMgFKKYh6m1tUUVB4BFXO+ZLGee5a7346XQ5PYcglpVKJz39SxQ
	7WMOTgDbeAdchpoBK8/kNo12TgTnzr3M0JivCmGXAGD+Cu/uGcf5+qh6C9SsGGzY4vddbcjI3Ml7S
	1zvWMr96IZoQpQeWE3r+Vu2rzvONpJ92mZkW0mh4qO1ZMPKC7TRnJSY/03y9Qzavm8KXvh4KidAuv
	ntoVkfQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ33-00000008kVH-263j;
	Tue, 17 Feb 2026 18:43:49 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2r-00000008kJ7-0spj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:43:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso39333365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353815; x=1771958615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYsU7UyOcFO6rtK6/iQ1Qf2xKJGmW7ahDM2xNeH4+nA=;
        b=lU0Y2euehRMLC1pKcx+m8awYuB3V+fMi0OQNcMSatqQOs3wYeq0KeehdhxsavGNu/G
         09QJ3iWzRYSM0gMlnhtiSrUyHDKFZmYFRwNoxaCLcHN2HixOshJCq62qjSYIHXUtrsql
         SeduONgMp194bUKmJiN7MVew88JCXgXXa9HPhVoHqUYYx299u/UiWgSY/2iIF3NBYSXp
         hWO7J3WDBLplnKlaHwko8mUhIvv2IQKSLUa7jxixpzT5uoQ4+oXKTIWeAWWct64hRCXZ
         QkFeNEUwLasGP5hptHJbXvHZMln9nnNtwFRrxNLs2g2ouR2HYnLmzmBRDFBswwMSSQkp
         j8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353815; x=1771958615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vYsU7UyOcFO6rtK6/iQ1Qf2xKJGmW7ahDM2xNeH4+nA=;
        b=vOMbl9ScfCZS3XmN+4HX6xvbJ+FYkaiC2aJMzjxu3UdWaxP7FGAO9Szw5cG0fryzBp
         NZ9h5yZkYYCRHUzb3ZX/o+hoDHpQ9DoJ8qLz63mmSbAesquFKbaEPP7dl2o1foiIp0Q7
         r0iQxobZLo8ZtYEIzIg7FSF3CLqiLtZDHdQkO72ae/7WsgRu+Yis0pbzbzFN50wzqHv3
         sERyptmOWwSueJ+cf9nj8vBGRQ6ldynMyOrWpDx5MS4dIxzXunY8zLIkHE2hi9Coh5j9
         jwyRQ5lRia/az6+PW0zO6KMXnY4Wzhkctwo72hO1nOl8FbLprHTE5AVPj5u2FCGCNEBs
         EJiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE17WaEouKgSaQHPPLOBs6sTI16WS5vcFgF+1qiaPB/6YEZYbXRK86oNOTQ1PWD1gpYVRmrPo7P0EeGSZN3d4T@lists.infradead.org
X-Gm-Message-State: AOJu0YxtS58TzFeu5VH9hHSZy/r20qWcfbq1X85zG3LoJ3LOlp0Q3k4Q
	/F6Bs0cItWGy+VHT+ZLHY1x8I69onxVzkSJGGpri8aBub8O8KAm350p8
X-Gm-Gg: AZuq6aKogTwxL+oKxI6gCLn69cFArT79v/X/yl9bCfZMrNqkGplytVaVc/QWuauPoMp
	if7bx7Ws/KhG3MaQ2l2JI04TTbvyFdsa+BWnqe0t2gD4szuhb966GRm0Wv2/EOD1mvid1lfI0AU
	SUOb2dqDfFvqeWyDFZr56hC7Gzh2TeAmF+63MfuPQHDpgiUgbk3JGnVmATQ8gqg3o1Jm9cP4FZ4
	UrjGBa3CjQ9hra9gILWJZvr1574+XJEnDpwLQyQ3Wjqu+377AJJ8rnZ8JmVHvImBdotr1zv/vLl
	ysO4wsEgjlfeKw94wDUrhiaoKPajockNkyb7KGC1fQnJ8X7VBjzI4C6Hi17t5IcjGVNh+Bb9TFf
	zs/mrht2NOUYZgnKiEdaQK2mRJYndi0Rhmm6zhQ9Av78KFISKar0GfrOF2+xZAhpUVnOpVH6iZH
	hrK1P2EQFxeMWjZoq4UIlUj8Z0mED1syjfsj8YKLyQtYeoRmMc4SXa3IPGhC45zvgnVH+uH3FRN
	q/jmRMT2V4pwSfR9cITdy9eOvAq9cewSYKQX+V6
X-Received: by 2002:a05:600c:1c07:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-48379bac86bmr242020185e9.5.1771353815118;
        Tue, 17 Feb 2026 10:43:35 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:34 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 08/11] arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
Date: Tue, 17 Feb 2026 19:42:42 +0100
Message-ID: <4b23da4592f50a49009fa59e45fbdc12d277eef9.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_104341_459649_8F547866 
X-CRM114-Status: GOOD (  12.35  )
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

Enable the microSD slot on the VAR-SOM Symphony carrier board.

Configure USDHC2 with card-detect GPIO, pinctrl states for the supported
bus speeds and the required VMMC supply.

Update the VMMC regulator to match the latest carrier revision by moving
the enable GPIO to GPIO4_IO22 and adding the required off-on delay.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mm-var-som-symphony.dts | 59 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 3242a0b739f6..40ffa1f36b2f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -22,7 +22,8 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		regulator-name = "VSD_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio4 22 GPIO_ACTIVE_HIGH>;
+		off-on-delay-us = <20000>;
 		enable-active-high;
 	};
 
@@ -204,6 +205,18 @@ &usbotg2 {
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
@@ -264,7 +277,7 @@ MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x120
 
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22	0x41
 		>;
 	};
 
@@ -288,4 +301,46 @@ MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
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


