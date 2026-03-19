Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6CD109190D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DI1p11Y3NFQSHggE4wU2LNnBCXfD26cQdpGZhKmz8bo=; b=jxY6MC5Kt5PDXu4idccZy29PN7
	00DT7lv252h/C9KEa4I4MUbtCww7wkCLu8l2w5Yby+/XVNlYoPxD5FD2v2hwS9RjvYQYTCZQjPILI
	0+AjMxwzQt50pfWOyJ3EwYV1mTFRe2W66JyzuvuVT56MiMx8fZGjgonY6q5DiDGNo8xBI5MpsZnaS
	MOKgJP6mx4X5TGPODYL/8AzpDYcU5pm0HBRJbljsTMcKLykDzPOcSY1YhccxN1+xGQjcYebxPUv3A
	lmq8lcOK6V3b/MntYENHQJV8ItriEWML2ApVHcx5jtE7n3doPdVoED4nh6YCr9Dlqa2oeKvVFv8Kc
	N/RkLz7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJw-0000000BNXf-1oyw;
	Thu, 19 Mar 2026 18:42:12 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJk-0000000BNM7-033G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:42:01 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso14048035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945718; x=1774550518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DI1p11Y3NFQSHggE4wU2LNnBCXfD26cQdpGZhKmz8bo=;
        b=LJMOyO4mY/tooVchkkVZ0ZkvulYZu74fYOwCiznDeSJX30sdvaizpCzPxLFb4QpQo7
         L2GIwccpM1rrXBMmInDlybmPjm9coLBSQNgOT/7bWJT1oJaT8p0mDh5GAP9FQpfI8pL6
         M43tE4cQpAdwWbWZF3wOMrYwMEmsyHWrvs9gEukNvqa3Vo7zKmyRhV6rwnG7nURgll04
         61yWsYHgkQV5YDcNc4DBvTrHZQwAfpVKnVVYLiXtrS9BuzzAxfMh3g6OHsN01hFPTMIJ
         2jJPNoruiyRVegEKk9UsfsDipJYG5k3z5lPNIiiH4ys3RVoazWtat/ZYHXAOgkI9/xub
         v6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945718; x=1774550518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DI1p11Y3NFQSHggE4wU2LNnBCXfD26cQdpGZhKmz8bo=;
        b=GyeqfT+ynj468qtcTIqST8kCMrTdHm2uhNfhRD6M5eIh05l592vul08oDiCrsZMYZ4
         SRoTChopZ4N9HAnO5WQRFhKE+PoRmwwNbU2iZIPuDpmUUJ1H2VmGwfJARK+Pnbq5+beN
         ueuUZ/jVMZRgk2Km2NrXfdSKk5Rh4nNYlbhqeQeMX4sMpPk1vEb7C9IqqDNlowZ84i2E
         M9Sc3ELqsDfHCFSQZwoEb/X/K9THuQ+mdF9vcjkZZD/r9JCXTVAuELP/024ndzr0MKbt
         lDs/7BOwc2HxWs4dh3cvx6u72I0LUHW/5ckzCGUcz+D+3ezyhOgaVxU49h0aGIhWJNpe
         NPtg==
X-Forwarded-Encrypted: i=1; AJvYcCXl6dPS6XYpjSaz+67P3zllmuYicve7cbSVIZoMM/sLvHicCnNkE9wR2/cYOfVNeUS/83rhttzqnEBkbgF2wysg@lists.infradead.org
X-Gm-Message-State: AOJu0YyQtvH6ttrbqvczPX2helEfIkn3Ke9GeJew6r9BurTcbp07zD/E
	/jmN2j9BHPDXgPIHkdPyAtIyF5cxZYbBc16sAlrzEQb9ARgk8T5OuQxJ
X-Gm-Gg: ATEYQzyfnXvTRZhS0aLy0121wK7bFlj+5Mo9LzYz5b69srO8OUBy1M67NVBJ0h+HGaT
	co7SYVuP1QdN7I2w0fN5Q0qH6tkUWyzYWLuLsUBxYNRCTSwJOMU2taMH83Qp86CoM6OoeanZ4Sb
	eCgzQtL8D5HMS1JOgj+T8Cq8rUnFLFmF2/0GqXrXvh2crhAfdvjhtsTcq3aKkmkeEpHkaYhPFSC
	df/MzE5YuvARXErsFt5dnLxuz8MNhK45uTFOUrIjzuACON43WptXgTwcUNc8aMh18kARO26bx0k
	9E9fTXlfUpJqf3i/oYf/Pu6aqmWH4aErYhAM2tKsxnjssP9lmN+t+PnByBMxPIZBIl3/bomxdLE
	vp815DKK7S10lHxm4P3NJgA4NhbhTSXFx8cvRGuVb9WE6rR6oeLpj2hv/57v78RrFKJOoDblYRT
	Qbj/5Ght1XgqQJiNWGhrjjCs2ch8WveYRm2Db6fe3wflyJjwyOnrxzyd4933Ey9Nql/EFDZI1pQ
	wsN0aDcEU6rYWZQ73MHN3DxuRi9AJRTG3/s/Gk=
X-Received: by 2002:a05:600c:c083:b0:485:3f72:324d with SMTP id 5b1f17b1804b1-486fee0481amr1849725e9.14.1773945718217;
        Thu, 19 Mar 2026 11:41:58 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:57 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 08/11] arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
Date: Thu, 19 Mar 2026 19:40:28 +0100
Message-ID: <2181c11d9b15d7a048e5f881a867ee1f7fa82ca1.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_114200_083332_DB9F88C0 
X-CRM114-Status: GOOD (  12.25  )
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
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 59 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index a425ee0ed8a9..6da29845985f 100644
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
 
@@ -220,6 +221,18 @@ &usbotg2 {
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
@@ -280,7 +293,7 @@ MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x120
 
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22	0x41
 		>;
 	};
 
@@ -304,4 +317,46 @@ MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
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


