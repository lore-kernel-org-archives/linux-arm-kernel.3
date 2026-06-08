Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D551CCD8CAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaEH5o94OCHyzbwIH4HUGdDm5Drm/31IJdPh56FPBdI=; b=s22Wxx4HSOwgGUnjFWN7U5ynRP
	4awgg0TqLJUy1GcDE/VnNx1Vbc5kPKAs67etHbUG8P2cAs5DW3+IJBDlRqahZCQ1vb4mhOVfhZVEa
	ojJTuG6n5wSOUG6ba4JQTKthAznZsvBiAxkUcIgt0hUthvEorsTbYfxgwMnx57L413g7MuVMSc86b
	D+qX/FIrSkQarTjJnkfRcnEL9e3wtPfAZG+bniRpHrCKDTAoDzfAd4eTLX2trx7Ca+c+U7ChLuRQ4
	Z1LVCeBOg5uWxegjuerO10NnjiufKFxec6shwHW2KLiaQc1MyL8Xfp4BO95/kJoMWo2aQaBjD0sZ/
	Rp3wdcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAg-00000003oSi-1nvW;
	Mon, 08 Jun 2026 14:41:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAa-00000003oIa-0ZLR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:41:41 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-45ef4223be7so2326562f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929698; x=1781534498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaEH5o94OCHyzbwIH4HUGdDm5Drm/31IJdPh56FPBdI=;
        b=oT0aws4L5JtO+7Our+FeltVNDtqSfhxzo2AW09eh6JsHXYevoBjsyyZ3VsEKWmsy5r
         plX6zrP7uxwFWLc/jvc9Ad1sPdMyqxnvr16maveq9azm8S3qmQjiRxXsHCy/fzy9QjE+
         911ZUpH64dv/993tN4jcPJv5dbLeMsAPD54WsV9PMBG3gcRE4HU8r+afRhgdhx5VA25S
         l07FGGkC2Igk9rsVf0B0tk0qEV7H7Rx4wy+vFaxX/k1SbYzVpPaK20+h3QE26WCNMp1x
         K78Skg5ZKACM0p5kq/zrjS4Rslp8JM01RVKkkkIy4cNxGpZGdeaTXy9sfNraWn0xdoSV
         waag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929698; x=1781534498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NaEH5o94OCHyzbwIH4HUGdDm5Drm/31IJdPh56FPBdI=;
        b=knN1kDawI/re/BU8awC869vyc0D/WO1MNmBrt2KPaym6FQy7fGAddGpAY9oIaxdTsm
         WI/L+jyzj1Omngj4ArhdTOfNXz2CVI0CHLZzC8984j8aKoxGgxVXqLIJjWz8KqKeKj5A
         MqzxKEWtldN1f3rVyOsDT2iEP+zv+iJaFaCu3qM9+9faQNvRusOD7NO35bZB4p2xqgFS
         WTCo7FJPdkQT/OhcWmkT5SYYOttqdRjtVPqYhCTXPmohaU5+ktry+oldy8V4fQl/kTQr
         Wqd4DFrYPTHicby7ZrulE8LguxNzjTmvAiLG5frf50OjzMB3QmwF4Q8on0eszP+ClqzK
         Ldlg==
X-Forwarded-Encrypted: i=1; AFNElJ/pydRQ4dTY/+uOl75INv0CIDbzMUQ6lEAbk6IBZTRGx6+pWvclzljj9mrBz3DJuQ4dfrA6ax7dKtN6jKp5g3im@lists.infradead.org
X-Gm-Message-State: AOJu0Yx89NyUMTCyczv/QZFWOWyV1G10FJeWZKKEMAsP1zOEmQCvkudN
	VEHnouz4lxkByQpjpSowvA3txiT8Ckz+woSD/4QXJIpt03Ivf5JzaicB
X-Gm-Gg: Acq92OFhYL67FlmrTXasW3YmGvmKF7YQkDvt3TOIQzTXVP8dyQhYF7ySRjwO3civvDr
	pLb5omZKo5nmR2B+4v2o0RRC9oYAOzyCfuripYQqQUR80x+bUxH0RdPPJzFhCmKbIyrJ3wBJ2yg
	SW4Su/eKWsDyoCy7syxj8dNmdpyHm8sPsXcCyje1PaXnF9LU7qg7dp5kLHmwBkC1/dOA/LMayDx
	f3DOacOFwxh8kGtUf1Pf/1tCwZHwtz7viTH3Hd7kaVU2v1EOMqeUrpvHfOtj7ancx8oSlYCJEqR
	8g7QYamamtRU3YY4o9QXLYucXLxR5U5saGpF3sk88EmXrboC+KXAyizAMtfSsp9u+6carviYsTo
	7qyko6tPibEeKEqaOe7pGlIZPyvQ5KVZVBMp2a+SblWy2gOfCjcUPiD6+mWDKe0BJpYXPCOLcYs
	e7OZuPXQyGnwBREhNyIGoa7ZQXaqsxLNUzL2eNoFFkffXTF3ikWSN+u1sF5FlFKlfRhUd4NCku1
	njTKEe20MpFzdA5j8aUaK5Aeaskhj/KwIDNXc9kGNDq2y0W6HNhC0ma3oM=
X-Received: by 2002:a5d:5049:0:b0:45e:f765:ff9 with SMTP id ffacd0b85a97d-4603063d61bmr18372379f8f.24.1780929698123;
        Mon, 08 Jun 2026 07:41:38 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
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
Subject: [PATCH v5 14/14] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
Date: Mon,  8 Jun 2026 16:41:15 +0200
Message-ID: <06fd759e57a5ee35c46a51947ec0ee24c7eec66f.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074140_207646_A6FACE03 
X-CRM114-Status: GOOD (  11.81  )
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

Add the GPIO pinctrl state and GPIO descriptors required for I2C1 bus
recovery on the VAR-SOM-MX8M-PLUS.

This allows the I2C controller to recover the bus if SDA or SCL are held
low by a device.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 49467b48d0b0..61786eee0e82 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -180,8 +180,11 @@ led@1 {
 
 &i2c1 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
@@ -415,6 +418,13 @@ MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA				0x400001c2
 		>;
 	};
 
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06				0x1c2
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07				0x1c2
+		>;
+	};
+
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
-- 
2.47.3


