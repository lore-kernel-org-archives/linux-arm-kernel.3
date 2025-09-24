Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C67CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 20:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PgAWQCFoo98/Z9ljCaTiQGL2NXe+X8U3ZUEI4e+iLi4=; b=A/buJx1mBSrxN4HJrAOg4gK6Mk
	GCb7nkC4JtM22yrMx5sTfEFpz7A2DWsXOiv0HMbArkZD5T3zMmkRCrHvWI1fXlKnCdAlWDNKCTUTY
	UqzoYsSt2k8TO3m1NoVGNYGeQV5EozE6BQepSsDPyUDLd+m/BvdOiq8ShbQUpualC5LdrTuUJ2MTj
	bzZ2aLfKt9OvDEqQz2w7+QGw0Ex7UIujsiZKMdRdyZYiGiupKBuL33Yth0G4fSJaZCFEtD4tqgkWC
	q0XheI8OS9IQRh2lM3TQrtMRF0iWMON0HIRraVh+qd/9CvSdQamJEofm7vOK9yllt72Nr00B+Ekmu
	mreec3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1WG2-00000003Zu6-03pC;
	Wed, 24 Sep 2025 20:38:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1WFy-00000003ZpN-3CUk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 20:38:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so1817215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 13:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758746308; x=1759351108; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PgAWQCFoo98/Z9ljCaTiQGL2NXe+X8U3ZUEI4e+iLi4=;
        b=Qx/2WcRM0FTThNhdGymIpEcLexLZ2XWTvQF0eX3sF/9KyeYI20v/IQ3poH7U13sY78
         1TeY6YELkc1vMyzT8DOBlNXFZzMNNyfDIY+wtn1kJYpiruL+p36FZMb89K6N0WCUq6KK
         36YsrLWDs+ji7NcaQot1lvERhoNjeOE/1kgYiAxplO9q6ZoYG3ow8o/yObgC7EQd3/Jq
         45cTMRtOs1gFRMEw1Tavdta3sGST+U7IsTONyIq+i/Uy8w55aaWGH6CDBvgvF2/44MVp
         VJlRihvvk5YJ/761joE9Tdupccavcf2rx1sph18KBwEpp8t5GajLHKujR/8e3HxM9WJ/
         igDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758746308; x=1759351108;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgAWQCFoo98/Z9ljCaTiQGL2NXe+X8U3ZUEI4e+iLi4=;
        b=YE9d91cqlcUX/JqwjtwxqIJ7J6Ve+CpNySnJ2fxGKBWvSWLuUGBcfDDO1sKOLUSVr8
         tT84ehiYi/kX9sClx6oziS+OL+BnZ4oHPwqvrZUNTom3tiwX5HnKTTlT5Y6TqMRHk9fG
         Xed1zD8pyOpd9kjmxS0dbwRAbBk6zlH36vR38/RBDs2+eSHPEbzH1o/oNgRV1VjJpxPi
         8uMrl9ubt057AtGqdZvVmTHC0IsJhp/DsrdMDwF63lrU/pYrgvYJ4CoFaTJaUyscAD7L
         LOppcTaxjIkEcZeelCo1oTuWU8FQ7kE73SYAAW4Jo8VsZrys/eDM74MvgxmmZq1hhsBu
         Xb1w==
X-Forwarded-Encrypted: i=1; AJvYcCUAXp2yChnuC4T88g9qPuWk8JqV1GFUK9oF25VWWzekrTuiz3vlpLQGCIodA5WvWlKNIALzJNQexiy9bF1MOWJs@lists.infradead.org
X-Gm-Message-State: AOJu0YzKYd1SJsA/fMGL2FlOZXo5YKWytw4vrt+zMAtmiljK/ydhmoh3
	7ppzDdP/xBvIeOjRugCfDEZeRIzqNHBrxiXS2j9lFgOmx9lbAXW2X+Uz
X-Gm-Gg: ASbGncvSA0vgb8HYBW50rDp5qij8YAAXv10GDWl4RW/1n8OpufhEpPVv7WHi8W9W5OT
	tZm7PZ8GDFmb+kDBJnjUWZuoWAGgKKvnL7/HFrpOuCsFRXUtec8epahp5aK5pXBe3snBqeNGyje
	LVxyagYRqFYY24Zb3S3NS3QfijIQyamoHmLQuyq00WdhI5R7rft9roLMAlQlNAl4pRxqdx8DDvq
	5gWF/rRA+mUGo5vtHrBBZtgSgqzxr9ruo8l23rm54ys6BDJr7WMSaSyMG5mQdO72MOhJ3ePT7Vl
	FOzP/qfv3Q3S2B3TiQMHezqIUvCsIeAvxrW1zHO892jrUAfyAQUJh2cfAbkrt0GAc9mpIStRplN
	lNbFRuI25pibgr4KSMB5zm+H+4ZONC+Z7oYcEzChG9t5gHQWi
X-Google-Smtp-Source: AGHT+IGDxHR9zD3T2Jojj5V63amKQHEZ4Y5ouX0SIG7pqFz8i6fnWZlg4urHE+jXQ/8JQVeDmH/9Kg==
X-Received: by 2002:a05:600c:1695:b0:45b:7e86:7378 with SMTP id 5b1f17b1804b1-46e32a1987cmr6748555e9.34.1758746308296;
        Wed, 24 Sep 2025 13:38:28 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.95.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33b9e8aesm2663465e9.4.2025.09.24.13.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 13:38:27 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 25 Sep 2025 00:38:13 +0400
Subject: [PATCH] arm64: dts: rockchip: Add DSI LCD display on rk3576-evb1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-rk3576-evb1-dsi-v1-1-c76fc3740abc@gmail.com>
X-B4-Tracking: v=1; b=H4sIALRW1GgC/x3MSQqAMAxA0atI1gZsU8eriAuHVIOg0kIRSu9uc
 fkW/0fw7IQ9DEUEx0G83FeGKgtYj/naGWXLBl3puuq1QXdS3TbIYVG4eUGm3pLpiBbbQK4ex1b
 e/zhOKX3yEkZhYQAAAA==
X-Change-ID: 20250924-rk3576-evb1-dsi-e39f34833bf6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3993; i=alchark@gmail.com;
 h=from:subject:message-id; bh=/7E6ceDbDhZ4pxug1DrrfRHk0oYerFsLd6y+cKd/Fmc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRcCTss8+Uow9wVd7om3ggIPPxuqbaVReHufeeOKO8ui
 DqxLvCgXUcpC4MYF4OsmCLL3G9LbKca8c3a5eHxFWYOKxPIEAYuTgGYiNxbRoafxwXXszilzNvD
 v3ou95Mb/R6Ju83fpOisd/+6dteaZbd2MPwPfxPzSlRMSOXbG8XWJufMCcLu6zfOeeo/SUhQjlt
 YYSsDAA==
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_133830_834261_87ACC082 
X-CRM114-Status: GOOD (  13.85  )
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

Add support for the Rockchip W552793DBA-V10 LCD+touchscreen assembly which
comes physically attached to Rockchip RK3576 EVB1 boards.

The display part is driven by the on-chip MIPI DSI controller, and the
touchscreen is connected over I2C.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Note that backlight support is left out for now, as it depends on PWM
support [0] which has not yet been merged.

A workaround is simply `gpioset -c 0 13=1` to set the respective GPIO
pin high and thus to light up the display unconditionally.

[0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com/
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 89 ++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index db8fef7a4f1b9570cb517ccc9a857d1c93c9d2db..f20cd6f2c079e0a5bd79acc9ebcd56b499e0f72f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -125,6 +125,8 @@ vcc3v3_lcd_n: regulator-vcc3v3-lcd0-n {
 		regulator-boot-on;
 		enable-active-high;
 		gpio = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc3v3_lcd_s0_en>;
 		vin-supply = <&vcc_3v3_s0>;
 	};
 
@@ -264,6 +266,43 @@ &combphy1_psu {
 	status = "okay";
 };
 
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-0 = <&mipim1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	panel@0 {
+		compatible = "wanchanglong,w552793baa", "raydium,rm67200";
+		reg = <0>;
+
+		iovcc-supply = <&vcc3v3_lcd_n>;
+		reset-gpios = <&gpio3 RK_PB5 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vcc3v3_lcd_n>;
+		vsn-supply = <&vcc5v0_device>;
+		vsp-supply = <&vcc5v0_device>;
+
+		port {
+			mipi_panel_in: endpoint {
+				remote-endpoint = <&dsi_out_panel>;
+			};
+		};
+	};
+};
+
+&dsi_in {
+	dsi_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dsi>;
+	};
+};
+
+&dsi_out {
+	dsi_out_panel: endpoint {
+		remote-endpoint = <&mipi_panel_in>;
+	};
+};
+
 &gmac0 {
 	clock_in_out = "output";
 	phy-mode = "rgmii-rxid";
@@ -319,6 +358,28 @@ &hdptxphy {
 	status = "okay";
 };
 
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0m1_xfer>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	touchscreen@14 {
+		compatible = "goodix,gt1158";
+		reg = <0x14>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC5 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tp_int>, <&tp_rst>;
+		reset-gpios = <&gpio0 RK_PD0 GPIO_ACTIVE_HIGH>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+		VDDIO-supply = <&vcc3v3_lcd_n>;
+	};
+};
+
 &i2c1 {
 	status = "okay";
 
@@ -738,6 +799,10 @@ rgmii_phy1: ethernet-phy@1 {
 	};
 };
 
+&mipidcphy {
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_rst>;
@@ -788,6 +853,20 @@ host_wake_bt: host-wake-bt {
 		};
 	};
 
+	display {
+		vcc3v3_lcd_s0_en: vcc3v3-lcd-s0-en {
+			rockchip,pins = <0 RK_PC6 0 &pcfg_pull_none>;
+		};
+
+		tp_int: tp-int {
+			rockchip,pins = <0 RK_PC5 0 &pcfg_pull_none>;
+		};
+
+		tp_rst: tp-rst {
+			rockchip,pins = <0 RK_PD0 0 &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		rtc_int: rtc-int {
 			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -941,3 +1020,13 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&vp1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	vp1_out_dsi: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
+		reg = <ROCKCHIP_VOP2_EP_MIPI0>;
+		remote-endpoint = <&dsi_in_vp1>;
+	};
+};

---
base-commit: ce7f1a983b074f6cf8609068088ca3182c569ee4
change-id: 20250924-rk3576-evb1-dsi-e39f34833bf6

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


