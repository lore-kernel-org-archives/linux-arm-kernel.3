Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5011F109190D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ym91XLgRLRXjLiChYg+mfli7NOG6LGBLaybiV2T541s=; b=PfeX5xoIeZGiIO9UipmXe9pyzc
	/4aolGTcZpGO/4Vt2wHj+XMxBuLWYmi4Xrxb6xZRWG3XwmLIhpvG9eQVLbFG7e7Wl8tzfVYA3WOvn
	EOyavn+kp0kihJxuHyiytcZmFx8qe5v9McKIOTLcj2GifS1fM6TatdRKw5b8f4mTEnM2/IrFS1sNf
	XD5+kzt68fQTrg3yj3ew3xLJQCtNt7lS0k/iMqaTfqKo5wAEMAuezQtamr//D6t+Og5UW+g1kW8tI
	NI8gsXJkh3VnDG4BOpRnALbYWfaK9LepTIBOeE/vahD1n1ePaMAapiRvB7X7A69ThhDeZoIcY+QOK
	4R2aKMVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJv-0000000BNWD-15LK;
	Thu, 19 Mar 2026 18:42:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJh-0000000BNIv-160u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:41:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48538c5956bso11376225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945715; x=1774550515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ym91XLgRLRXjLiChYg+mfli7NOG6LGBLaybiV2T541s=;
        b=c/hf/9QLP8AmRQpUngb2Sn3QoL/4CLtJQtRwR/K5h5bR9kfVghnZdH2uO7jPpny5At
         4VkDQozYNantGLOrCL0SaaW4zSxzx9NagcV7HlG8vrvIIoTeC5tCd9nFBNCcAUaElrVJ
         m9fshexXLxHEiOcE2cI8KZtTKg8xSMSGkD34wDY7iMI7JrIuVwPMeuzbqmX7i8NqJXN1
         0lFboTKcCbqGOwp4fb7aKpcr/31H5V8mheecVBMw6dVQRwFsMlRAJgQndIG6xVIN7tOV
         OqKVBBbrmMko+NSKi6fvJgbnEQJ8sO/HTjMg3J6n0a0GxHxs2jwNUEHgaItcJe/Zox9c
         o7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945715; x=1774550515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ym91XLgRLRXjLiChYg+mfli7NOG6LGBLaybiV2T541s=;
        b=bODMRCpSZSvNRhTUS/tMTD6z1e5vc622pxFl/WYf0fi6Pohr7YJQzj7K8s7T7fqxXq
         iSWQK+oAzc9Il2dydgVdeNGJtLXHhHPyEnVyENDdszLV/zNSoSQlfKI7U9B2PoT5HS1V
         PubMBr/2DuLahvLxltu6fdBzMTqkBZ6w/LWY/QNyDmCNN++xY2BRNQgbk0yUn+GTyVIC
         rzlcGDts+Rm4bxXiy6+fsXXbGZ66EU2wC6RSH57bcnsZ0jYN9w9RsKLwkuGfUvZQMh0L
         FlC7lkJEF6F+MpxDeIEmhFT/ly4+SFFHjLzstssNyGpBjrvAHeU4fEOZDc7bTyidOXvj
         ydrw==
X-Forwarded-Encrypted: i=1; AJvYcCWto9lh6bK7yy3I2gtAxTzq8CsOzOU+n2jPAujVO3mD6BSQeUyYoZWGlEzEYOY8aEzFgry82eFTDKUiPm3nonVz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5zALLFl++n+tWw08g8HabnbjqKlvmKQB58WFxfZlZjlLE0OFG
	O181eSrJn7bwidWH8+A2M5iVNK8qHVNOmR7vZVGZKe+bbAD9NLCm67kqaYTBcA==
X-Gm-Gg: ATEYQzz29yura3lXtd8ed56X4YeCWvwJAVXHDfH+cG+e41ySBsEYAcby0xw6ntP2aqZ
	TUIcJ61vE4HviLlIcXovMJIs6E1L0JukkH/K8f1lv51hKnqLE4DLnBdsZxNAvUbc+GtUnIMRaNx
	7SAVHqaWJQ+y6vJAwueoFB+KFI00iFeQqI1VIn2LZyIzT5lveY0PPNq1MEjRsEY6WB878SdMkL5
	iIXP3UqlDmQjIwHruNH/Q1aZPJKuVVQ62JDBYGhTMxi6yOR0HEhnTTgxLEaLlfUmAC/fJfGgD3N
	B6xHlagHm9mZZO6T+04cPwfPjei7MbVAMsCMiIJjM76OK5xfzqXsISZzYhSeW5/f9+SzvozMonJ
	qmT12VX24DreJGvfYC2EkhGDHaqWs8cXwHvRTicFgyPvzbF6ckRiYkYEHj8ZnaLwYfhAy53AJ46
	UAerADPE4eEZBDs24m2SVf8NidYT45sDOaT4WZlJgpPzI8aLHTSBhV18n99iCMkJljNxCRLmTFA
	BZQbS+l0e6v1tnbLOEgReADzP93t9kcti/Tive/f3bf/BcWjA==
X-Received: by 2002:a05:600c:1e0d:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-486fe8efb0amr6997545e9.13.1773945715151;
        Thu, 19 Mar 2026 11:41:55 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:54 -0700 (PDT)
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
Subject: [PATCH v4 05/11] arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
Date: Thu, 19 Mar 2026 19:40:25 +0100
Message-ID: <bdc61f427a129f36c12dc270895e5d202bafa450.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_114157_345146_AE8E784B 
X-CRM114-Status: GOOD (  12.51  )
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

Add support for the Microchip MCP251xFD CAN-FD controller connected
to the SPI bus on the i.MX8MM VAR-SOM.

The controller uses a 40 MHz external oscillator and requires an
interrupt line and a dedicated RX interrupt GPIO.

Add the fixed clock, the MCP251xFD device node with the required
properties, and the corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Remove "This patch" from commit messages

v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 7cedef8add32..21a4d87c0e26 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -14,6 +14,13 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0x80000000>;
 	};
 
+	clk40m: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+		clock-output-names = "can_osc";
+	};
+
 	reg_audio_supply: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "wm8904-supply";
@@ -139,6 +146,19 @@ touchscreen@0 {
 		ti,keep-vref-on;
 		wakeup-source;
 	};
+
+	/* CAN controller */
+	can0: can@1 {
+		compatible = "microchip,mcp251xfd";
+		reg = <1>;
+		clocks = <&clk40m>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		microchip,rx-int-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <20000000>;
+	};
 };
 
 &fec1 {
@@ -424,6 +444,13 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x16
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x16
+		>;
+	};
+
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x13
-- 
2.47.3


