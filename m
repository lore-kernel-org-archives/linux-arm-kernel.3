Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6861CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=; b=AqnVemRQoW2OpNGnlz+qedfaTx
	2XL+iHzr8/ybtA9SUNOPd75cZBGJz/ioSk6DPi5yxK9Vs96bSm0jlfk4rY8MZ4rWKhBiPT6clvSvN
	prImbu8WgYrRFqzHLZGeQttDI8hM0WVmjIfeBCE5JZhYnQ9a+TEsP1meLw067aSeNcPUz7QqbKk3N
	1m49JbkJ91bh8Y+AEzSYEk2fz4RvWW3WZgR7Ke1j9T6dAbIkzXrXW4A1k/MsEnlnxIeQDuoZZL/j+
	SP5ap0MULVkhioBBMgExg3rC/NRNJUdaAGknSaLvFBP5D6tB0MgN40FB5ZU68mTB2PIylnUWP//WI
	lV7fmFdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdN9-0000000BfdB-1Gp1;
	Fri, 02 Oct 2026 13:32:23 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdN5-0000000Bfbh-1ox3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:32:21 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48b017a3be3so2529324f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 06:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947938; x=1791552738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
        b=a3pH0NbF8InU5VnPJB9UWAJe0IxaUI+IcxEfd+W/dyi5SX8uGHXsedFVIB/4T++C7t
         ltOXEmD6MXBae7QuCIWRr7YZpMODzJtRM0CRr9Ql+u5LoDRjSU8saEjyWaBUQbd9qdhW
         XLP89cav3lbr8bNNtA3GgIgNsME/H/nbUYcb2mUBxmoudqO58LnNn4FZ+m31QxRSeT2Z
         Nq9jKolnDuFtu/8fJEYPO+KmJ4ExRCMCloRXAsg0csQvWT+Pm5tYltXgpeXcARvPfEjo
         0Ll8Bgb/G0QqKBzEmtGXTQDZb+S3wXc+T4fnWStSSA9rpprXRwyUuySVp14KnkG7T6Xy
         g3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947938; x=1791552738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
        b=MId93236jRxR8f4BmWMoF0aDey7lmRxjZPUb2EIkOLMOrGac4RhzPn+4mcsYMnxESm
         8HmRzIvzO0QqxquTEt0Zd64MVwPoD03U4VKia1qECPKujjnLIHNbDDzXGGcgIOTxCf79
         gOn28rMx60nxLceBVcBz/hh6LQHmSFXd8euRpcQzGTRXpLVCasYKFYxx1XCxDcDrttuS
         +z/JYL9DvkwsPgdueFlSet0kmtelvmoCF0hw7vxkT6OHEIx0Am5MqojxNrFp8tpUkoJq
         OPBGMvhsQn1R8Z2ru84rQ8ZiYCOxu7aEOeKXxjTEP0PcCiTW2edpZbAgWNaV/nIgF0h4
         uNZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+V5zpIqQXE36RRZSpKA+ATt+k1Zsj3FfGx5Y1/v5i78FVWq86IRu0euX/plnTbsFu5ZFXk07rr/HQruTvm9eU@lists.infradead.org
X-Gm-Message-State: AFuF++nYMR4nIDBfMz47SwoWReRzIO3dPkeTwrb0DL7LyQO4USMbFPrR
	LlsII14luQ22qxIfoJotKCBaemNkVXMhdwFZXSiLjzinneF5NtVyD5V+
X-Gm-Gg: AYBFou3vM6aNTHJFyn8R5tW9/jnEwT1HTbWbtZL5RqZs5JUowwTpvFxNyZk2y33wxg4
	RwgmkCQ+LvwHEFFtwVw60TdHVXJi3rTndYhay9IMi5Y0eBcokzr0GbXpNGai36T3oAH3ENTvBEV
	4MK6mCJetSmxVB58HgvtXi8JPLkS+sAClQ+5wf9O5oRM6t6Sc02xz9WOlTR9Pxcv0vvyT+zvUih
	0MoB0di7HEbjVt4pZMNOBpGo9NTosNCd9cG84CDX0pSM2wnnFnmd+GFGOBRkrV2AAz8ePpl4LHu
	Ucj8H0LgH5rikRoRUFVuLfIx9A59E7b6xZsCFAWBnfaR8UEQHL/AWq4G6u4TnYFLfjZwhhhGGFm
	SJcOOOVAawQyAM8CzEdfzHuuvoZVNcH7l3OyMIYmp0Jm8rCSO2GEsmAae1MQkwDOUaZ3I43q0/s
	vx3xF7B3xa1Z14aleTqsqkwrwaaBh1Fd9GePYSt88CPUh4pak7+vJqSl0qjCFxKCVZKiT5Eq/TO
	UIRbzG2hrz4gf5T0VADikRq8Qe5ncfOgas3y+isstLhGafgrPEINj2flftMkAaCSLl9XcdKpcvS
	hazbSI7y
X-Received: by 2002:a05:600c:154c:b0:49f:fe88:e7d1 with SMTP id 5b1f17b1804b1-4a02769c438mr56562015e9.15.1790947937422;
        Fri, 02 Oct 2026 06:32:17 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9bc0sm5809855f8f.41.2026.10.02.06.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:32:17 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 15:31:30 +0200
Subject: [PATCH 1/2] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 camera connector nexus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-v1-smarc-imx8mp-cameras-v1-1-a0e89182c625@toradex.com>
References: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
In-Reply-To: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_063219_505369_D50A26F7 
X-CRM114-Status: GOOD (  12.63  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The SMARC Development Board exposes two 24-pin camera connectors with
reset and power-control signals routed through the SoM GPIO expander.

Describe the connectors as GPIO nexuses and add stable labels for the
camera buses and CSI receivers, so accessory overlays can use the
carrier's interfaces without embedding its GPIO routing.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     | 26 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   | 10 +++++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index c28d63293149..e0096388fbfe 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -13,6 +13,32 @@ / {
 		     "toradex,smarc-imx8mp",
 		     "fsl,imx8mp";
 
+	smarc_csi0: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_0_CON_RST     (pin 11) - SMARC GPIO2 (P110)
+		 * CAM_0_CON_PWRCTRL (pin 24) - SMARC GPIO0 (P108)
+		 */
+		gpio-map = <0 0 &som_gpio_expander 2 GPIO_ACTIVE_HIGH>,
+			   <3 0 &som_gpio_expander 0 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
+	smarc_csi1: camera-connector-1 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST     (pin 11) - SMARC GPIO3 (P111)
+		 * CAM_1_CON_PWRCTRL (pin 24) - SMARC GPIO1 (P109)
+		 */
+		gpio-map = <0 0 &som_gpio_expander 3 GPIO_ACTIVE_HIGH>,
+			   <3 0 &som_gpio_expander 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "J64";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index eb8b9db7e3cd..e8e718ef7822 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -587,7 +587,7 @@ &i2c2 {
 };
 
 /* SMARC I2C_CAM0 */
-&i2c3 {
+smarc_csi0_i2c: &i2c3 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
@@ -616,7 +616,7 @@ eeprom@50 {
 };
 
 /* SMARC I2C_CAM1 */
-&i2c5 {
+smarc_csi1_i2c: &i2c5 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c5>;
 	pinctrl-1 = <&pinctrl_i2c5_gpio>;
@@ -655,6 +655,12 @@ fec_phy: ethernet-phy@2 {
 	};
 };
 
+/* SMARC CSI1 */
+smarc_csi1_rx: &mipi_csi_0 {};
+
+/* SMARC CSI0 */
+smarc_csi0_rx: &mipi_csi_1 {};
+
 /* SMARC PCIE_A */
 &pcie {
 	pinctrl-names = "default";

-- 
2.43.0


