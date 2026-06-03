Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA54CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ek2z2hCKg51eeqqNP9O236wR5gFYHNYlKZaWXk0NZ1A=; b=D/qnKgGgwG7tf6jSYrA6BWqZOm
	HXVKIdAn4pGFzHnWP6ude1qxDK7sXysafEMLx7BLjwoDp1W/9ZRbw+51LAy2wwlZV0iski3Ox5LsY
	rhHJT3/fQv3fRwWiZZs+/ouk7EF7Rv/GopVncmCqKRJEKP9/USBCiKpSV/F8r/I1OKcy+BVwHIhem
	A55TO4lvdfv7g0jDJ5ecBpBkkzROStOgzhpxBU37huVlseIRSg/5N0RXShbdA9Vf6Yrrf8CWVVH4S
	NFZsOctqTmsNfuP0z8180blpMfog3r8cJGyTg9XUCKv4fONmzgI3lRoorZUIU1QbH94PpakE62GrW
	47gN9Rzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmj1-0000000FH0j-3edY;
	Wed, 03 Jun 2026 14:37:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmit-0000000FGpR-3GDz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:37:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490b3e03939so7469385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497454; x=1781102254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ek2z2hCKg51eeqqNP9O236wR5gFYHNYlKZaWXk0NZ1A=;
        b=Uafd7CXV8xgcaDXez0JlC0GTOA9esmAzyxCAYjU+Nh9F9inLuj30Ai7ZTnR7HoC92P
         9Dv0dwfTWv+7MKMSkNBW2z4LDgZG6mY3o22ELYizTOB5zrQMuXZaLjrJVu0WcA17fu+P
         zyeyJoBrrD24DP+DU4WVrYP1UEVhJ4OkNIR/Lkfggn9+toRAPAFYJBtPmsuGVbohBFsv
         xspk5tru3qY/RjtY+d1ygI8AFl5SCWUDDgrwLIZ3vDN97ufPcoKVZ8wCHHSPaL2Ntou+
         Taz5HLDrvAJ4Wwde4wu2Sc7fQlD2yoQb9rXBNypHZECZkDsFjNRh8l2jhp0GisqV7Hwj
         S6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497454; x=1781102254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ek2z2hCKg51eeqqNP9O236wR5gFYHNYlKZaWXk0NZ1A=;
        b=dSG9VaQrHIqNZ5aMCTGdo2+hVr8W3qyu/aPNcluOfojtdwiahGS5gdvZ3zKSII57lo
         iFtjgMZPO2vn4epqzdaBa+XE9aLepHQrPRANfpOUNJqzKfrHqGMD6Q54/aw004DJXzId
         5D2TKmRZ7GZ7DPhL0sgcUXxEKfzGoLNdexoeQutFKWMCDurw9zMOATL+b7RmaOcLIJ6e
         I6XqBRrOgXC86r03pM7h5/+oUqyoagTD2hKi43PibNRdnE+uY/t9CZRALibccijURoTA
         Loh3PvYZMo92EtF1F0nUncnPrev183sE31ippVeHwNh7Pi8bAXmLb3wk2VDnhksMS/nB
         lMYQ==
X-Forwarded-Encrypted: i=1; AFNElJ99uYKzNa/DuncsrN7cDvbAjp9vZ48Qsq57I7QA5zYPHYQIwQ2n7ONiVNGJ39R5TtGF9J3IYg0210NztSKhLXSQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwQs524P+vVUoLjgOjquOZfll/TRMy17mZBuTcxkqTr5h8y1Vtf
	0fpW1CW0T3xEuXWrjUpK7TjGvE5YKw7qyyo63fNyHV9z/9H388SocgDy
X-Gm-Gg: Acq92OF1zaD+L+CnsD5Ie+1ZHiwqUfdVbixBEUlQ1tTSAO1VqDbIGyhlKWj1O/KY4Wp
	wCQlfAZu+QKwNKfDfbf295ZGhR5Fdz0FoISDBL9t+LRKVtrFuhpA/x/V3zXPbyza1xWx/kDUskt
	HQDp9wZhTtXkT4ZFRLus9SlWuuWD7fdVRSF4DxsBjbdyQY1/GwHFc7FYI3Lpq3Z3AE8+DMIEZD6
	K+7mWg/EA76TR+/EiMgGG72GV8t68Q+dzHmN4dABZyjgyQ192cb1WvwcSdJlPxZNoSnj4gj2qvm
	3DlYpJwnKE1LTEB4S+kq5peoloxcf38pZPrg+1Heqr5QU/yLRjakS4P4SSayJfnKNNmyoQzFh5n
	WG0fPyibxYoV3nfXLej4/8zfV3bJCGxF1J6P1NETe0zjOTdr3Wvk7IvpA7uzYSd9+cpB1YA/wJq
	vf4ht3ed/s0BvqK4B/pKpRzdz0X9xcBy1Cxf6q/rQNN4wFFBnNeRelVb04TNx5iLJOEa1hqf9Ja
	QBahgi650MxYAkTb5II7FrPfur5Ewm0RGIHpCyXI11q0HWX
X-Received: by 2002:a05:600c:3510:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-490b6151755mr47163205e9.14.1780497453687;
        Wed, 03 Jun 2026 07:37:33 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:33 -0700 (PDT)
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
Subject: [PATCH v3 07/14] arm64: dts: imx8mp-var-som-symphony: add HDMI support
Date: Wed,  3 Jun 2026 16:37:14 +0200
Message-ID: <24154af5fc04cf4b355dbebc33566f83d85b222e.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073735_841684_FC484FD8 
X-CRM114-Status: GOOD (  12.30  )
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

Enable the HDMI display pipeline and HDMI audio support on the Symphony
carrier board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline

 .../dts/freescale/imx8mp-var-som-symphony.dts | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index db0ae706f648..f7eebf265fab 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,18 @@ led-0 {
 		};
 	};
 
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -74,6 +86,43 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 		states = <3300000 0x0 1800000 0x1>;
 		vin-supply = <&ldo5>;
 	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
 };
 
 &i2c3 {
@@ -152,6 +201,10 @@ rtc@68 {
 	};
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &pcie {
 	reset-gpio = <&pcal6408 1 GPIO_ACTIVE_LOW>;
 	status = "okay";
@@ -253,6 +306,14 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c2
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x10
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3


