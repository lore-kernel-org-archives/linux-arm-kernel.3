Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1D4CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+mlffvYXyJ+c6iEKRnEszoh15YkcAETzcHIsYc3aN0=; b=iHHLamS/XFgF/6UgCoFb26RihT
	/3Y/06TfsxqEQ/TjKhG11TofsFqmTpn0xMTQ/e0lVuwkpTWZklUf5TGfYl8/3Q8mksfsAuJXDHEKt
	KmAnP7Od+mYVa2uR4loVP36Xyfxmqy8q0kB32Gh5pOKjZm+n9Z7kzRSWAGPvGM2CbRFeLYuDoFY+Z
	/IK/esxFUzA/ZwHUcq5HYFwYAypTySZlCY6mXEFhRxuTd41vD+7d2BeVam+QqSwYpquW5URP0OBH4
	keg6UftsY81yDOfDZaCChhSLmtiFi5+dMTZhCq6CsGbAWnhsH+B9dRZL2TVW1glCem7AtLSXSU6nV
	IQVkYr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAR-00000003o8h-3QAJ;
	Mon, 08 Jun 2026 14:41:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAO-00000003o5H-2dAg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:41:29 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45eee266c6cso3630055f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929687; x=1781534487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+mlffvYXyJ+c6iEKRnEszoh15YkcAETzcHIsYc3aN0=;
        b=syiQyusJZzjOC4GxGb4eF7H2WKhoowTKvCUz6j5DZwhhTkUgr6wRXpNLf/4lKNkqYL
         i4f5zzKIeMRoYiz31FV+USahe5lUn8jNBObmP5mgLR1Vx+cTCsOP9vyEuDnef55XuDIK
         gLVf286thPLwrbiQyM3Z/SK8vQ72cIPpQtkCwrSJZGbFuZk2h2D6DLgr64kMr9Z8O+ny
         BKdKoloELSACL8NfQbMDSLvJhHHDumJqCLj/ihCtBz5tbMYD49yDdEfsMeqyOkGNArpD
         p7cNBx+Kt0sUuAQsfge1MbQ72K+jFMq2qB1nc7EvUiirQQK4+SrAGTp5fi9gc3CqsQl7
         iQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929687; x=1781534487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+mlffvYXyJ+c6iEKRnEszoh15YkcAETzcHIsYc3aN0=;
        b=B3nr+P8wQyoy/NmqBqH9vfR55dUyOydFl8h00CqoqITa009SGIBcrpk4jUN3Zc4DSS
         HCc0fDRt3XLXUrfgUKBAUaYaiIRkJbB4C6x53DOPc3REz05S5pvBJq9t4YUEo+Q+W5Zm
         8VTjQmfUo4hHdmGe2uovBgr8oGYKVKUsN9NGFNPXhU6H/ilp6bYQuIFZMo1QfStXXZug
         WNHDDX6NHrlfQXVLA7ZENn4rQ20OCasPIcKi9K545ARthkkMS2jXMXsavMFkvhxqS5rF
         ewljY44YXZJCjLqmHsJsovF1gts4rcHIajgTjoRPXSzQP7PCYMM8V5A3e3lOK/x5mYWE
         cIjg==
X-Forwarded-Encrypted: i=1; AFNElJ+d2wtoKibj0ODKm71M/MwKFK5qd5kvaiTFygPibgr1gyd/IAGq0kBelowOjx52ACNYtudID047ObQPITqv0QRg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7l2w+2xYdyaB0PZ7KqFrohhgKIFPBUZGsecLaUwxu7msd4BVj
	aKhkzmuU1YU1aIadW79Ybk1oAVcRw/g994qTWaxH1CgbXSwQ/7hhm3d+
X-Gm-Gg: Acq92OGtBmNeDYPaFy6VpP6L2ra27aCD3CbvmYGWBBUW36ro5nr36PU+sqeIxPNdBN7
	4kGYN+k/qtp1IKtJuIbL+Bv23LbIh1V+H5zPTH/ZMdFRR98VLpt0S4gq6iCpsX/secKTk2/DnrX
	pbRFawH1aCBpXORa+v1c9X4inUMU2Kd5xU/rHunOqa7/eL0g5WWb4A2+PSxZk8kJZthSVaQRYhu
	19W5KzR0csM6Ap1q41HfP5XW9B4r0ZMQDxJK97BebNx/j1MBh3yHH3zVxjtGNTTQxzK7M6u4YH+
	q5SB4A5NwGuxG9pjeLWaUecqkCL9jzgz7SND2MIm/9BX8F/htPeDFx3yrSdo7CZDJn9/0kvv2Xu
	mjsuiVqSLCRctkd+VjF1H0W4zvBU5YMn5BcSnQ+7GfwZPuIIoTu8Xrf6NGCNdocZhHn157Zj09U
	fknx+tWec/WBlAx3sF2EuJWAB4OUiljdtMP811upF+6j+ZZg1PAcxRM5CElMwlI6Pzzk/dmuADP
	GX039SS2L4yVTrker3VaAf60z5x/aqyLxbC5mFitbANefEm
X-Received: by 2002:a05:6000:1787:b0:460:3210:434a with SMTP id ffacd0b85a97d-460321043camr24884499f8f.43.1780929686745;
        Mon, 08 Jun 2026 07:41:26 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:26 -0700 (PDT)
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
Subject: [PATCH v5 03/14] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Mon,  8 Jun 2026 16:41:04 +0200
Message-ID: <967fe38da37fe50ba69f20f6286d4fc97a6cf523.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074128_695333_624292F5 
X-CRM114-Status: GOOD (  11.72  )
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
v4->v5:
 - Add the SION (Software Input On) bit for the I2C recovery pins

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index cb27853ba281..7cf58198ef14 100644
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
@@ -201,6 +226,20 @@ MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x400001c2
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
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20				0x400001c2
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21				0x400001c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-- 
2.47.3


