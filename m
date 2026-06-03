Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35F9CD6E6A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mk1r/Chz5tySwG2DZgKv8FwEIvhKShhxz5WRxEuPP38=; b=wI4JN7BBpQUX3JvX3GPPDERLhj
	TVtXs4ZymkOv36RxKBpcHTNy7cIHlhUvO8+jca5tahB9U5is+pZYP8MIV4igjfaunH/KzYV6RktGC
	3O8vwuX8drvvdv6eZPuNSb+8DETgpT8jvVCok4F/DGXBEJ6f1lTh9tu1lTJr9t+aKZbihHtHx9cBw
	N/7SOlXcaGkmjSIzCMBvv0nIkONqUqjgYDl5fSd9CRmQfeqv1WwV5Ik2b+lCNc83NfVw5A2TmbopV
	QMB6sSAQ6fJuythnlyja3OhnAWs+Ck46rk5FzilRkVi+QsGdoyZWt1LPcFmYneUhWHaFJsJbMdttn
	PFoQdxBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGU-0000000F0Jy-3joR;
	Wed, 03 Jun 2026 12:00:06 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGT-0000000F0ID-0fHy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:00:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so3663148f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488003; x=1781092803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mk1r/Chz5tySwG2DZgKv8FwEIvhKShhxz5WRxEuPP38=;
        b=RFWjrLzdLM2HCU4ZkQYfMfzaII7gLB6xyCa+qkeOmuJ/j06vTWOPN9ZtOXt8AAABdL
         Q+u1F8wrVNMCFIkGmdfV9MWgxHgZWtuLUzE4plR085dVo4OtNhD3zbKuaKKNBtghM/01
         CE/4QIBjNN6jAQxgGtD24r8Qetx3TarIGkj8kCBvPvO3oy/Vqk3jJYfPFQTKsvFwg5Ip
         Al3Iv9OqOycCno28IZTZte/29u6JYu6H9eOLwsMHBg4f54pm7F4SzTuwB2Rv451MOgAF
         D4+fl+FCxYdrNzCfQTeogfiB3cQmj0Kid/xSDt47DoUySQMgrzODp0mF/MYvbw+Z1u/J
         7CgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488003; x=1781092803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mk1r/Chz5tySwG2DZgKv8FwEIvhKShhxz5WRxEuPP38=;
        b=JdcxYEEjvZHQl3ptfsbzqWMqtE0MWgcPp0wi1ux5TCrSWMr7a0yMEvZVK81OILL1/a
         Zf3pe3aaL20DfSgFpyB2iorsWr11EbN+RRjtNx5LNzTiX7Nl452QIFE5znZAw0KnpzeL
         f972Gwmn94fkREgOO4FRylteyfmn064sVAzYbE4jmvinbi6eG+DY7S+c8KjtUQfyHYm3
         Y9INIAII7LrdD6QjfeVtbRrq8tlZHv2XCZyLAhUj/nejyKL+Cw8UIz0nhHrUceU8/xnu
         joI+GpkHys3iYRbcjMwa+H6suQA/F7AbHRVGaVKftW5RLU+qLsus8AC6k6Yv8yUg3ob/
         ouaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/90DNqkFFQxUNSBpbObvoyb5OG6iZT+QhR1rEp2rhZJ7gc1iPl2jj1gkd/qnjBSZSo95/IeydkgJ5v+FUGbTH/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn+2Xrcb4M0ygSEuuEVIyLwj5i9As7Ngcklsk3J0QGVKp8dpDq
	ZqqiOZCZDADUVI2DL4Kemk3PQhuyGJxYlMdYm4rtUBf5iS8ld7AnGep1
X-Gm-Gg: Acq92OFVjaWBiz6pZSUGy92JVqAtbM2m3vtaNTWz08N8M4P4SIdJ7/Yxyzml5A15oxU
	6lNNcHaVLYHKe+0+Y0JGSlX33Cbpu56aRmq92LKm1VXuuhG6TlVnBjX/xYc2/d/Pan55EvuBk1a
	i4Ca7FjW7mfhnoK93gA7qbGUfCH38ZgbMSlaSd/cLDSgogenYZUKkpBNU5UsEhJqZZ6wOWEaXj6
	oerlX/CJorpDm0v8skdgJMsrimorHUdrCEsoUv2H2HDZ2KCQUokP1kbKfBodI4l1MbdY5X/75Cr
	Fev5FQFvt8NoG3wnjCGaO/BRh6s9na9j0Hwk1Z0cPW9GJpTcZnqyjK4kLLKZ7nKGmgogBgLmxPW
	J5v90VzLAWBiH7flOAtIwfKi79Ek5GQgEN1sU6918eC15mNkLfnDJP6S7fjMWGn72HFszYo+bgg
	AhwsiiuMVEBPVZD25P9aXLwPrQhBPjjnQlx1yxk1XM71Z7yuFTB2VZVdu+O4UKSSamYTia8d5x2
	2HvOtOl5y8mhxuyzYNDZC+WQkz3KMBaLeAAbCtimhToOxbsTmpJZd+XDY4=
X-Received: by 2002:adf:e014:0:20b0:452:11f9:bc40 with SMTP id ffacd0b85a97d-460218abd41mr3075579f8f.2.1780488003205;
        Wed, 03 Jun 2026 05:00:03 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:02 -0700 (PDT)
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
Subject: [PATCH v1 03/12] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Wed,  3 Jun 2026 13:55:41 +0200
Message-ID: <4bc5e9bb6c7e136113dd59afc6ae44be2c8c30d8.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050005_211551_83F715A8 
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

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

Enable the I2C4 bus, add the PCAL6408 GPIO expander used by the TPM and
describe the TPM reset line.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index de1b8b842848..935bc71b6ee1 100644
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


