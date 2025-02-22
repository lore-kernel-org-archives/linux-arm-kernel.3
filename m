Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E729C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 19:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cmCEr2QyJdNLJyiq0r9W5cRfJfYLIBpOGRkkQooY70=; b=hR/SqwAjG4iv2IyvXwV0jz0G6x
	AucvuCt7/hR7KCUOWsJ4C35wCwRi3NkDNC7oEfTmBIDy/tDiUE1TUtznl117YfJOJ4seqF7QV/JQl
	GYiKh06p+j7bf6kIMkVV6XQ3EigB7X/VBZO/xJTrczgLZXvm+ZVI2IBN2btwV+S7H4uLb7BT5+XN8
	LHNRRTj4TWgKBHkaAF35u8C7eauE3yUxUx5imJwFN5nIWstpHS+eEvMn0dmphDHcXKUdKg6epdPXX
	yPLkbp4eeOhSLwJd5G7zAtWo9ZeZrrUu1XdWaKoZgjPyH7fqXyYk9JQV+qpLLErL8tAH4O77B3NSt
	ncn2kP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlvJH-00000008cke-2zbK;
	Sat, 22 Feb 2025 19:37:11 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlvGO-00000008cUv-458C;
	Sat, 22 Feb 2025 19:34:14 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5fce03395d4so2583018eaf.2;
        Sat, 22 Feb 2025 11:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740252852; x=1740857652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cmCEr2QyJdNLJyiq0r9W5cRfJfYLIBpOGRkkQooY70=;
        b=OoCM4QbHGvqEBmNDIU2xsOtvH/yWP8ybTHfEsN0gWYf15UdE9P7EspjOkRU6n6nbOu
         QekEOmsun+A9GpWZasjr3Ktpkx7JAUH425UubXJn/wO4MaHLB58oG7OnI4DV5dtEXFRL
         o86RQceEGUaRvJhpbLhmYMUOkjJqMOiNTIbDnCpU28pM15dN++pDjA9e6SOIV/yg/uiw
         GS4REW1psl8eSzTrv74rrqN17cu2HlWZISVertxB6SMaHCBF2dwcnKTKrfKCMZbZOeUk
         wpbDWVEpuv2noMc5oWF0xXomt9U84bAa29reycKlSr3dkz2RUQyA9c/1O8qZ1jwwY/ZX
         xuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740252852; x=1740857652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cmCEr2QyJdNLJyiq0r9W5cRfJfYLIBpOGRkkQooY70=;
        b=QFubY6vLLXC9pZxRDFXWC+La7lgkJBYpS3xuuRRsBvPRAu4mI3lBwGCGduGx1tVfJM
         JvHKlysWpj6wi8eGXqmiGO0SIwXMvvkkpIOqZ22CWM4/YPJqALYlNpWN4nSUpwT4nUjl
         +EHXaaujMS9TKeXq623UbMW+esVqEVQCcelBdRXK31DSFp0zyWn8zItZ6G00Iu/SLEZx
         cdFnp30xwYJbRr47ti6DTJ+Okj64p+Q3bSNGyTCkaL/ltNS7KgzP24WpcdK5ZxEb6knN
         L5VAzjMAZroWCZnU3b0itfzFMvVeixD0GqUVr5Z5iazthjNSMwdpJHgek1YFeVvQEx5y
         nhEw==
X-Forwarded-Encrypted: i=1; AJvYcCVJD0RgnsBb5qF8f7oDmF5ad3pvnsrVHjK3TPyW9QlAxrm6wt782f0a1QbPGCRPGVxBWygwNuW4weKnw2nTXKWy@lists.infradead.org, AJvYcCX7ttOkonQnD7bsnCUv/4282PM7x3fwzRA/RkER1pMHPxsTRBvxZvm40z1yhEC2vBCb6KjB2TgMw3ANThsNXTY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw3/FvvbnTeQ29nNCkVWs7cA7OhoO4CMH2KkLwcCg+HlVkTV5Z
	uQJsgw6h2U3JXeHdTmfzwM0e50EnKdNcNTa6vbmbnJcPv+qtj8tA
X-Gm-Gg: ASbGncuf0/Vi9EKtuyGFHmLWBFU3MIatHxV2Su4Q5BMPW9zDYBzh1S27z6ZG+X18DBY
	BiOTCrT98sA028SiyWqrI2puhdTx1fnGftrbtpdk/lhkFwDCrU/3qaxuRqC5DYVuYYe9tpnS4DR
	C9E9z8HOwF8ikf1DICbfrxevi84a/1j2LxrVNkW7551jVYNtOnej6m0kiA/DTSZNlpWJWdeen5F
	vH2pZjcc4i8qVACbilxaPA90N8xDpWIeh5ZlELh3P3jLqr+rBU2wdHa1RhXicG8rW6upaJ4Sz+y
	XN5uQR7uoAdkUE/fD2/fUdMYa3Vt+C5QTw==
X-Google-Smtp-Source: AGHT+IF1m1xi+ESe2qVPwSI5zRUCJCtATZEZshHH+DixnMthAQSmiun7ZP6eieG56zLhw1dwoKwgdA==
X-Received: by 2002:a05:6820:611:b0:5fc:babd:8648 with SMTP id 006d021491bc7-5fd1960c9c6mr5181578eaf.3.1740252851887;
        Sat, 22 Feb 2025 11:34:11 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:b69:ffa3:9d4e:2cd7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fce7afabd8sm2724012eaf.34.2025.02.22.11.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 11:34:10 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Johannes Erdfelt <johannes@erdfelt.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v7 1/5] arm64: dts: rockchip: Differences in Orange Pi 5 Max
Date: Sat, 22 Feb 2025 13:33:28 -0600
Message-ID: <20250222193332.1761-2-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222193332.1761-1-honyuenkwun@gmail.com>
References: <20250222193332.1761-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_113413_023782_648EB8E2 
X-CRM114-Status: GOOD (  11.68  )
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

...than the Orange Pi 5 Ultra

The Orange Pi 5 Plus and Orange Pi 5 Max have 2SK3018s attached to the
PWM LEDs. The Orange Pi 5 Ultra does not, and thus needs the PWM
polarity inverted.

Also remove the model/compatible from the dtsi. It should be at the
board level only.

Fixes: c600d252dc52 ("arm64: dts: rockchip: Add Orange Pi 5 Max board")
Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 .../boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi     | 9 ---------
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts   | 8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
index 87090cb98020..6e4dcd8fff26 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
@@ -7,9 +7,6 @@
 #include "rk3588-orangepi-5.dtsi"
 
 / {
-	model = "Xunlong Orange Pi 5 Max";
-	compatible = "xunlong,orangepi-5-max", "rockchip,rk3588";
-
 	vcc5v0_usb30_otg: vcc5v0-usb30-otg-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -62,15 +59,9 @@ &hym8563 {
 
 &led_blue_pwm {
 	/* PWM_LED1 */
-	pwms = <&pwm4 0 25000 0>;
 	status = "okay";
 };
 
-&led_green_pwm {
-	/* PWM_LED2 */
-	pwms = <&pwm5 0 25000 0>;
-};
-
 /* phy2 */
 &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PD4 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
index 26421ca7843b..be8cc96b5308 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
@@ -77,6 +77,14 @@ &hdptxphy1 {
 	status = "okay";
 };
 
+&led_blue_pwm {
+	pwms = <&pwm4 0 25000 0>;
+};
+
+&led_green_pwm {
+	pwms = <&pwm5 0 25000 0>;
+};
+
 &pinctrl {
 
 	usb {
-- 
2.48.1


