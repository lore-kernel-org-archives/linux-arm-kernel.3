Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71E2CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6HeY09Hs/yA1VsCb12QfnOsD8A+OUTuSPAKRpX1XwI=; b=AIDGVq8o4MpVrJGtUoxnW8xW/f
	3O9fwulqi2nwtUXaK3U0PPh3OK+pZflCIeomeZUT/WtZ5orfP4g5Pi6LgXUB9/TN+Ir4rmdUYJyFl
	agXc9wwS8X5iaMTDH6UabcOG2B8yqQgHR1SYW1lvCZV96fACezcMEsV223xyXSAbszXlqhyFRlUUa
	Yy/NEx25bjt7Bto/A9mYX6MERnntV1TBpAbSdb9SGBhbA47j49TOrtecbv8ZDaE+oIjJuD1ZY704p
	jjXM4j0AQ8QjgyAu6arnmd9gG3nZCTScJgqsZudWFuPSTO74ZJMZZVV1nWO5pOiWDKJc9UmQmqODd
	phf/A1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmis-0000000FGpo-3TcH;
	Wed, 03 Jun 2026 14:37:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmip-0000000FGlV-396d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:37:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso11275065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497450; x=1781102250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6HeY09Hs/yA1VsCb12QfnOsD8A+OUTuSPAKRpX1XwI=;
        b=DmhN8W2JMfjpmiviRAK9+HFfXHYxCW+cRjFqw02Uh5xANDSgh8CJGGjpUTqVYUVW7X
         518wbpgQxfpcdTzFdmaBZI9S51wvm/ZimTndge/zy7Xlc2LsBSzSgXz19pNw/ShV0Ozo
         MzYuEsG/NWqRGHsofJRlxrPV4sHMNpP6hTtmtz4yWCK/01bWpetareiEBTk1hdNbh9+J
         fHdeV2mMGmaPZ8zjr/NHolDxOAj/Ol4Soh7rnsr9vEdDiBK2fYrnQb+huuhgSIcK24Ir
         g66K/WkIC8ckWOO4D6ILfqE6KdMOooDr5Jbg2ZHSzgJWJM5V7h9CNtVE2NBw5iT2ceA4
         OmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497450; x=1781102250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I6HeY09Hs/yA1VsCb12QfnOsD8A+OUTuSPAKRpX1XwI=;
        b=KYrAymmhTT/+4+IwRkOeXxtOQtD8NwIF9F7kJ0rohSxd7ZQXsdiQHaeEt+qVeQ/c9W
         30iFN36zi8qI9x/UjoPJTNSMq1ghLdNgo1zttSTdAQkZOotU61qPzM2mHyYT6uaIu4xz
         geye3YkYbeJ7rUGE69FqNz4u3Xo3ZhaAa7IxAljPxyk9eH0NVg0au4NHamVGQFUPHUkL
         oiMSihECR8cRwv9cG/aLiXkxIT7SRylCHW0TZ/fGbfFiOmNDVHULX0qq5etDytAjyX0I
         83GRN1ohAcK9rWAVgUVZsjjJA4tLiTWGCYTij7D8i65isvsV3qad1o2vstEgSblV1kFp
         qqmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Xu5KGAwc92nXU9ySs/XGDlz4fgnI+/mzTr+A2tJ83Ty43EZBTTRXuKq9EooMk6iIDK7BvkYUpnNF1uOBZ9SOD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5sXnnU4HVPPO1fmsSWSMRZDuZ0koqBDIl1tiymdax4z0mbQ4i
	NkWcGNOXLHV1Ud99cbweGFTaVW4OPT1j3S464ZjoSxPAZk40xM/WaUJr
X-Gm-Gg: Acq92OEhE4CdH4TrnCgHhK4+45uAvd26qZ0r+ZrsRoUG+gchGa3cAUYOPRbVqE6Dh4c
	CNbGBevHqhgImnWjYmZWN98rVLtAzKs+SxWTeS95IrMHQChLTNKycwuIJ/Z/jWbYhNoDLh/Rbj6
	FOBf+dbEvvMzX2M7y9xntCX/Xk+t3ldz49ep4RBOH4FeFQB6x3XCnNmmh9C44+vBAxruJPhEqnH
	0qv2NYtN6fcUaTv0uSVlbR9fCqPEHm2R70KDJM5xGOVkjDE10raLU2RLo/PFF2F6tP2/xIbPSWQ
	aANS9DparX3Rsd9nN1yLl9VOlnTn25wFciZcdxI3WmyOUAQTmMCIMt8WgWHc6Nq9MFvytVPCkvg
	uqtsTY3x5nlvt3t4uv+NU5Z+1R1y9ABT8r2PlymlwSB+CazXcj6AamAG49m2hP05Ry/XymUI3Rf
	RITL9nDiRjCYRJA1r7N197tiH3cC99Pia3mE1Hgbm3ffNVYIXX4fI6NWqEQr6JWqdvVgYdp16vC
	lAyF4IhjmITOHm4PcBVj/8fmlIXZNypZJotBl9ZknjrCKwMSSmIhMbJDJg=
X-Received: by 2002:a05:600d:4452:20b0:490:b58a:dcbf with SMTP id 5b1f17b1804b1-490b5e763a4mr43825555e9.27.1780497449675;
        Wed, 03 Jun 2026 07:37:29 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:29 -0700 (PDT)
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
Subject: [PATCH v3 03/14] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Wed,  3 Jun 2026 16:37:10 +0200
Message-ID: <2e7ff00b61aaa855aaa2c6d9ad6e98eb673bacf5.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073731_809082_CEB02D66 
X-CRM114-Status: GOOD (  12.04  )
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

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

Enable the I2C4 bus, add the PCAL6408 GPIO expander used by the TPM and
describe the TPM reset line.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 76928b005826..6c19a63ce405 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -116,6 +116,31 @@ typec_dr_sw: endpoint {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio", "sleep";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	pinctrl-2 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -201,6 +226,20 @@ MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2
 		>;
 	};
 
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL					0x400001c2
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA					0x400001c2
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20				0x1c2
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21				0x1c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-- 
2.47.3


