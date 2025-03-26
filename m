Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA13C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDeO2nIfMOICmbdN4iB492bLj9a77KMSQWKqvg2E0aY=; b=fsHhBjWnWSkJaWoAOGDfArEovN
	yjMbEfbjDuMgzr8tA400SIwYSpLgYCjkIsaR5O5MQr53fecc2XkxcZT7D5VgLkA20n8KmvVeNVEkj
	TGkUmdjyV3vU+TL8MGtnVN81QHNsMdZwCv+1O7TQLr8L1t4Xvjoq8/UTR8qPGy2bTXhmAeD3GC09q
	Oj6wDo9OGjsoaq3O+cEWknGF8v5j97cdJLv4PQx0KrZI9WueQptky1U8A+HdMmPATZPKp1qLpI6q1
	CSDvHuePrp3S+rJuQyiQHgd4zv9J2/Ea9fVkmDZMQixoROsSEZloj3R+LFRC+GUhF32N6ewyHszcQ
	zjsRm72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTed-000000091gc-0r6q;
	Wed, 26 Mar 2025 16:30:59 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTXm-000000090Lq-06WF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 16:23:55 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so10678882a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 09:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1743006232; x=1743611032; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDeO2nIfMOICmbdN4iB492bLj9a77KMSQWKqvg2E0aY=;
        b=sButZP//yVhaU93N/FM2Q7yOZltx9tFWZ/rnt1q1VhUBzvISFweID8PbbglB/OgJhX
         dvjzXSku0WGD76rNaaXnDbLyujkhtsjRlFdewxFOGKpquBJT2C0bHGsQOCtCMEYGKmNi
         is/31tTiC2psJsM+nnC0Q/DVah+advDDhKFnzS5/LNYWrtibSIIuCHXbf+vBV6fptDyu
         9VkMopHkZlVA+y1ia1Bl8TlRrwbb3JyswRLkxzqh9vRf/1iYbs3ZIs4MuM1tdHgqTe2+
         q/4E8n7VltsXgaIfArGawJx1l+WJl5+XYtc78bCZgBZSLxrPnVAw3jYX2E3duf3nmiCI
         J8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743006232; x=1743611032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDeO2nIfMOICmbdN4iB492bLj9a77KMSQWKqvg2E0aY=;
        b=XdgGdlplhOSLnnhWDll23g3diNrvP1mge4kXA9yBlIcYDgKuDeJ7K3JxTJkxpHordT
         4WRFQe4B2EcA9zDJ9+2FTF858tNsYhv4Y5xdKf0n3niAtBVdXQtFpb5GUyacVff4gase
         OUJbnUkHnC5C+maIm3GHnt4b3B04GBin2HMCdois0/53WT6Wd7wc78oqqKIPnBga5k4J
         DlP+XO02ZTqe0jfILnL8YcTVN0hWIq1GPh7LoIQkm+5rgCKZ/PY4h2QBrbwUhC0F+HNi
         AnSRALBqhKCu4XIB4SRgrgD9mHCfF/wIKHNH4CuS9plyFd0GCLkZSabks8/+P3YR6AyX
         qfJw==
X-Forwarded-Encrypted: i=1; AJvYcCUx++1b0Bh4smicUGlSPiRyzSED9MTWG4J8ICNLkK54M+exvCFa6WdRMhwRUfqZhRWMQyWPK7lZgJrsSsUCgfoh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq+sXkwsHridiJOBB6rj21kI8M+VaMcAvztBja6+rI6ON2dux7
	8erCBoldX3J+J4+fZe5+lWo/YaUIZ5gVxtL9CY0xtiUBhkSA+dNWcaLlOcBo2pw=
X-Gm-Gg: ASbGnctEFwQRWGPwcuKUHuuSDym63i8rSj3gtxcWC7Yr1ZW8q4E2gm9JPTbKo98R/Cn
	H0nKt7G1WgNRVh1TU+cFTXGrtm+J8+IiIdmKpUnUO7O95CVcG4vNh7owqQZDLR3qgJaLxKfOCKp
	li8A4xhOR5mq4JNk/kndpK9THhB+vMpgoi9yGwNWjQqHapuGXgAupuANc/5IrQKeLwblnLI9q43
	0fGB7vFb/apUdWR+A/9qHa7+sNRsOWF/9FPXlJfIJv/Fcmm2L6/MKhDxB7UIt37T7VQ925X8KBi
	j0WNPiJ2tU6CGbf+l20/3Jn6CmKz9kpvMS8RHv+UPsG/q3XV3ZWt1n9xjQ==
X-Google-Smtp-Source: AGHT+IEc7BN+I9AuEBYkJp/jaWFUpD0J6wfKpFX9npNAzocR2TXh01hPKMJxC/w2Hwxq2f61h0F3IQ==
X-Received: by 2002:a17:906:6a04:b0:ac0:6e7d:cd0b with SMTP id a640c23a62f3a-ac6faf0b809mr4040966b.34.1743006232177;
        Wed, 26 Mar 2025 09:23:52 -0700 (PDT)
Received: from [127.0.1.1] ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac6f0f498ecsm76678866b.135.2025.03.26.09.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 09:23:51 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Date: Wed, 26 Mar 2025 17:22:58 +0100
Subject: [PATCH 3/5] arm64: dts: rockchip: fix internal USB hub instability
 on RK3399 Puma
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250326-onboard_usb_dev-v1-3-a4b0a5d1b32c@thaumatec.com>
References: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
In-Reply-To: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
To: Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 quentin.schulz@cherry.de, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_092354_057162_E49C8FD3 
X-CRM114-Status: GOOD (  16.12  )
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
cy3304_reset to be more meaningful.
The vdd-supply and vdd2-supply properties in hub nodes were
skipped, because hub power supplies are always enabled based
on HW design.

Fixes: 2c66fc34e945 ("arm64: dts: rockchip: add RK3399-Q7 (Puma) SoM")
Cc: stable@vger.kernel.org # 6.6
Cc: stable@vger.kernel.org # Backport of the patch in this series fixing product ID in onboard_dev_id_table and onboard_dev_match in drivers/usb/misc/onboard_usb_dev.{c,h} driver
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 33 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index 995b30a7aae0..3a9049372e12 100644
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
@@ -521,8 +511,8 @@ pmic_int_l: pmic-int-l {
 		};
 	};
 
-	usb2 {
-		vcc5v0_host_en: vcc5v0-host-en {
+	usb {
+		cy3304_reset: cy3304-reset {
 			rockchip,pins =
 			  <4 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
@@ -591,7 +581,6 @@ u2phy1_otg: otg-port {
 	};
 
 	u2phy1_host: host-port {
-		phy-supply = <&vcc5v0_host>;
 		status = "okay";
 	};
 };
@@ -603,6 +592,24 @@ &usbdrd3_1 {
 &usbdrd_dwc3_1 {
 	status = "okay";
 	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&cy3304_reset>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &usb_host1_ehci {

-- 
2.43.0


