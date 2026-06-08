Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6AACD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOMpLGsu1GWWWZlLzdQ6mKdRcaKS3cPpX8tZ/ShuVaY=; b=LqDhJ7/iJRu+VFPnhPuPfamE7j
	gElw3cujB9BhgOXddiujVRulK7mgN+CEZO//Rr2wVa4hJNVDhYhIV6Gz8pICSVWA6hBCye2VjTrO/
	FtiQ8VP+4NelOafRZY19/uv5g/d78tM08bpusnH0zvkyrJxGiHML2huuxE+W/v/CjLmhfv1ypE0XC
	3le4XBdRX0jh6RWoZFVx+7w3hxt/PR7/3x1iBQ08JP4G+PqYXQG5Lc0w76RtfNLGK7BEEL/8OFpsI
	X55I4RKxIRzcFmZxoSagmIZbnBK3iJwTYm9GPwpY9izEM5pB7iu6YWqiQ5ALPkb0uYoJAd9BL/6mv
	loal9ZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvl-00000003I7X-2w8H;
	Mon, 08 Jun 2026 10:10:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvb-00000003Ho8-1FWy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:56 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490b7866869so47860695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913393; x=1781518193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOMpLGsu1GWWWZlLzdQ6mKdRcaKS3cPpX8tZ/ShuVaY=;
        b=SjSMI0rw8TVd1fnYJBGHf8nCDhU51d46GzWSFqVaNHeq+siOS9HsEpebEAitOkI/Xh
         QaP1sox2WveA3glon5bR7cv7qnCg07+mhv6lGyb+tvwu4aTCG0mGmnC+rTA3Phu00J18
         Smt1m645SKqhc6Lpk0a7ZixAJhsEodv/Dkec/P3shpxbaFpkxoyb2DaHXdIgTw4kSguF
         zglvYOks/DNFHCsqM0t19leaOCTXZMWa7kY6zlLTbQ1E4298FUTSSjYMCf2sJRiO0+Zf
         Xumaknps9HkwrKh9ISJ6QSW63U8cyCZ9GlBXBoqeZcyCvyl6uTRM3TvafO5nTnEs3DTW
         dXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913393; x=1781518193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LOMpLGsu1GWWWZlLzdQ6mKdRcaKS3cPpX8tZ/ShuVaY=;
        b=Oof8jpNbtDFxWuHLgxGR8Mwb0zQKO00tcZhD5PrQRqNgOaxyBy9NKCszojANrAzSNN
         MZKBi1mUabn2/4fQHCDka5kgTTbiskYoag1aw6BZbhTsiHN5pJ/M956ORGJeZwGtlV66
         EGxgrVAwHepovEG8667P8XBulfmgS1H1BbFY5Tq8prV0xU5xixnidy5fq+Oav1r4BlpU
         ABo7/h83ABxDOvahS7QP8oAIkUhx38SQFRCpTXp6kg1me+YMwWCLduPb1B4LU3zK1ONf
         BP7xbkBCWAtccmh4R0WNBHcFxgumUP90Q/YC6ce7aIUmwCp0rJ2vXupJDk1T3bV/AqAN
         RTdg==
X-Forwarded-Encrypted: i=1; AFNElJ/DrN/SkGKAJFGRNGn37NY3g53tZIwHGt5hmka+xYXJJn50ObbNF2h8cIJCf+j+W/2YXF8HRrRkct3W1TnimKRU@lists.infradead.org
X-Gm-Message-State: AOJu0YzxUuGaO53DZ5pNzjqX68d8vR0JKIzKFOod89kJHiEeQY9J6Hg4
	lhFZvqZ7nGXcy0MSogyT2vg7SGiDNQ5GOspr8QJUo9zi/CZM0wZYs7s4
X-Gm-Gg: Acq92OGihtyEn+eHVJzeqXadJn9KOniCq4Y+JddqX/tKvHb9FTJvqSUmi+XNXP8vEMd
	+TSmgLCXue8OIMrg5Llyd8hBTzeuisifobZoWq/iQ9KsKBeAy0qY+OqomPVKV4rlU0spXypzDIW
	bp43cCoAMFnMiQZ3XpN6tIhznsjHoei5dL0H5LC6uASS2voR76ZFnqQ3gvh20XHncKXtbLFM4rE
	I07EL144Hyzt/DgmKhZJ+YwpHh0QSWTmpJphGUGn7Ix5cerB+JP0aGQO18gXHnHjRcRmpD0VQQL
	+dOO+mKvnhPZNTeHcXEHs3pAxj6SuBpy8GRfEzw928wKN/N+Gz2cNS1wwJMHjE0ef1Gvs6BGWFa
	N11LGLlC5IuLYyiZlpWXNpxMln9lTAES7wCILjixkFJW9OwjGlCGJ1lA/lyxqlMoPrKU9AIRhN7
	k9+n0bCWTwOwK61GUbCcyzR64275QeGK0kp9F052V05EOmo6oEkH+YrwHcvm7JDAG7R776y9gEG
	S8/O/SXxu4pA7NyiAoCON9+WQ0EoFqljzg623QIhVe4Iso9
X-Received: by 2002:a05:600c:34c9:b0:490:688b:f10d with SMTP id 5b1f17b1804b1-490c25b3549mr258294425e9.7.1780913393254;
        Mon, 08 Jun 2026 03:09:53 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:52 -0700 (PDT)
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
Subject: [PATCH v4 14/14] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
Date: Mon,  8 Jun 2026 12:09:32 +0200
Message-ID: <cc46f3773655b49d5e2875b00557a8f81196732b.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030955_360825_C0E53D41 
X-CRM114-Status: GOOD (  11.90  )
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


