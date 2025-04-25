Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408D9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NqGpeCgEQAUcPs6hxmWuzzpxKmr/yNO0w1y1ZqO3+o=; b=yXtZ2Mhq8o++3M1sGcGms3HWc0
	lN5hBYPDMak2M7Y+b+1ETl88DZz+G8jn8mGms4GX3cVwTiS1zSLWGm4mWNm2fhvjxS3E6/MTnH/9r
	HilUZWZyXakribKbHmbomLYZ0NG6oCiMyaUviZnnvAIZptZKC9zf4LwF8XzoXJPXHi5q/Qrv302mO
	LHu1qC0EmJoGVC2DdziHdYgtmUkUiqqDUJdWGPcIFubMplrsCe+3bsHiirRfkvTpU3cF+OWZ1bycv
	hLtxkp6JJcegnlEhWF3i0KnqC9eAbtncJUqjcyiWO97TTShZC08D+Og14Bjs1S8XHwl0wMKLzs2xx
	Yd2W9F5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N6q-00000000RIW-1b2l;
	Fri, 25 Apr 2025 17:45:08 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KpG-0000000015P-0cQb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:18:51 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso517408866b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 08:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1745594328; x=1746199128; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NqGpeCgEQAUcPs6hxmWuzzpxKmr/yNO0w1y1ZqO3+o=;
        b=rcYUU6DZkJ/GgXtaPt4Xh12QIHl6vzYo75AWDoybQTBTFcmTvbXPP6W/nv2etA93gY
         TTQvCZJJV0qsuEDAYIFzqfIPipMVQjCeluUvPESkgAufQXReLH47TJ+NvKdGDqWikS/a
         zIoiNG3Y47Wk7EwrRwR9wekaZbJY/F/1qf0Ioe/yKfeO7C59RpiC2WWjcWCl2XczdaHL
         gw6yTJyUrm1M11Tau4Yg7W2NoJf3J5Qf3BgWuYitwCSCy3IElVnL9ymRwsLTn1zpMehb
         6jRZMaGs25Xyg9JstFRLtdomtOFTP6TTUmKcLrj/GY1jesC7UeF8OiWCCP8OWOxnFloz
         K/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594328; x=1746199128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NqGpeCgEQAUcPs6hxmWuzzpxKmr/yNO0w1y1ZqO3+o=;
        b=i+Ons55+/489+KsCsuQWRJHQPGWet/oL6l6nuJytJjrvbI2xPBSfQ0jDbwiZHZ8ksE
         SI0pKjhKrZ2hwX+2CaiL48b85aeGKi/Pzl1ScGguqfZVIW9l71Xt+4CMpyZ2NhP88nXP
         owkvxYW41OZVsljV4K9AinpJq75Th5BKoC5hexBpIDA54hWSgeAmIFXxY9IIWob6W7k7
         iT7qMTCOdAC4/eeKn055n6y0UNx1LDcM+gySFoUnbC2Jek+/rFlq82H0tqYyXFx63vXl
         r+GomDPfM8OwyATszVFmcMN7kgBbx7WByEmR4pGVHV7ACp868FijFO6mZduLvGvAso0a
         PYrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAjpRGX784Y07evMzFPEPiNHgu6izpb063Vlfx1IrkiJJibL/hgn9rlQ4oP9f3kmdLuyJ0qM1+boRoPN0fffN2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1lHO4G7tNN5iIXsK9tu617JcTSatKW+DG/ejNfhuhELlFdhDj
	aEDaEFL8f0vLgrr5d1uDGwjQ+0MicNsOj03IcCrkLfbkN+64OxxyhMbQAkiRhho=
X-Gm-Gg: ASbGncvhG0R5cY5yhcG76ZYvvOrXdFsH29u1sl/tofyWa22n7HMfNg6f+oD3qZ17j7s
	3K2wkjFvDzLxu7cC5hoFAmVJ3ai4q+Qd3dou46KhP57+IUKlMirLV6s4wKllNZiHxa2/tEpwr5/
	fsM9bsUnwVvY1n9CqxueFbs3fgADsdRd9lVeo34suDtRBIC1uxTM4iwJOTmE6Wn2fc/UxQ2Da37
	yeEfH+99nu0fcLFFSoLFtFHIzfIHD+GeNxUMCtxf1lFSPtq/BsAQWpUDJhm2nvahiHW95siPXxy
	z3wxpTqU4ZB3prEiKFiHZXZlMjnrBzdY3RKspAKFzKyprSenzRDER9eWuA==
X-Google-Smtp-Source: AGHT+IEUamcP+7odYOOdpoBpwq4Ga4sU/sBxRb/GHkSRX9M2Uw0bvZNoH1NBuPxH9S4vCQHnw3MNhg==
X-Received: by 2002:a17:907:72cf:b0:ac7:150e:8013 with SMTP id a640c23a62f3a-ace710a20a1mr291795166b.15.1745594328214;
        Fri, 25 Apr 2025 08:18:48 -0700 (PDT)
Received: from [127.0.1.1] ([185.164.142.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e59649fsm151099766b.85.2025.04.25.08.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:18:48 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Date: Fri, 25 Apr 2025 17:18:08 +0200
Subject: [PATCH v2 3/5] arm64: dts: rockchip: fix internal USB hub
 instability on RK3399 Puma
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250425-onboard_usb_dev-v2-3-4a76a474a010@thaumatec.com>
References: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
In-Reply-To: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
To: Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_081850_184605_DF68B4E8 
X-CRM114-Status: GOOD (  18.25  )
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

Currently, the onboard Cypress CYUSB3304 USB hub is not defined in
the device tree, and hub reset pin is provided as vcc5v0_host
regulator to usb phy. This causes instability issues, as a result
of improper reset duration.

The fixed regulator device requests the GPIO during probe in its
inactive state (except if regulator-boot-on property is set, in
which case it is requested in the active state). Considering gpio
is GPIO_ACTIVE_LOW for Puma, it means it’s driving it high. Then
the regulator gets enabled (because regulator-always-on property),
which drives it to its active state, meaning driving it low.

The Cypress CYUSB3304 USB hub actually requires the reset to be
asserted for at least 5 ms, which we cannot guarantee right now
since there's no delay in the current config, meaning the hub may
sometimes work or not. We could add delay as offered by
fixed-regulator but let's rather fix this by using the proper way
to model onboard USB hubs.

Define hub_2_0 and hub_3_0 nodes, as the onboard Cypress hub
consist of two 'logical' hubs, for USB2.0 and USB3.0.
Use the 'reset-gpios' property of hub to assign reset pin instead
of using regulator. Rename the vcc5v0_host regulator to
cy3304_reset to be more meaningful. Pin is configured to
output-high by default, which sets the hub in reset state
during pin controller initialization. This allows to avoid double
enumeration of devices in case the bootloader has setup the USB
hub before the kernel.
The vdd-supply and vdd2-supply properties in hub nodes are
added to provide correct dt-bindings, although power supplies are
always enabled based on HW design.

Fixes: 2c66fc34e945 ("arm64: dts: rockchip: add RK3399-Q7 (Puma) SoM")
Cc: stable@vger.kernel.org # 6.6
Cc: stable@vger.kernel.org # Backport of the patch in this series fixing product ID in onboard_dev_id_table in drivers/usb/misc/onboard_usb_dev.c driver
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 40 +++++++++++++++++----------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index 995b30a7aae01a0326e9f80d6be930f227968539..dd5a9bca26d1d221607e73071685d5774330d760 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -60,16 +60,6 @@ vcc3v3_sys: regulator-vcc3v3-sys {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
-	vcc5v0_host: regulator-vcc5v0-host {
-		compatible = "regulator-fixed";
-		gpio = <&gpio4 RK_PA3 GPIO_ACTIVE_LOW>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&vcc5v0_host_en>;
-		regulator-name = "vcc5v0_host";
-		regulator-always-on;
-		vin-supply = <&vcc5v0_sys>;
-	};
-
 	vcc5v0_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_sys";
@@ -521,10 +511,10 @@ pmic_int_l: pmic-int-l {
 		};
 	};
 
-	usb2 {
-		vcc5v0_host_en: vcc5v0-host-en {
+	usb {
+		cy3304_reset: cy3304-reset {
 			rockchip,pins =
-			  <4 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
+			  <4 RK_PA3 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 
@@ -591,7 +581,6 @@ u2phy1_otg: otg-port {
 	};
 
 	u2phy1_host: host-port {
-		phy-supply = <&vcc5v0_host>;
 		status = "okay";
 	};
 };
@@ -603,6 +592,29 @@ &usbdrd3_1 {
 &usbdrd_dwc3_1 {
 	status = "okay";
 	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&cy3304_reset>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
+		vdd-supply = <&vcc1v2_phy>;
+		vdd2-supply = <&vcc3v3_sys>;
+
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
+		vdd-supply = <&vcc1v2_phy>;
+		vdd2-supply = <&vcc3v3_sys>;
+	};
 };
 
 &usb_host1_ehci {

-- 
2.43.0


