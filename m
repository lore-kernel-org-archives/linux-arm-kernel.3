Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF08C98326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U46+/TQQC41hUZlX1Jqyf2quyZyNvdapr8jATlMb4/s=; b=bYYSmvg6OQAJlht+h60T4W7ilx
	GKImr1TBCvBs77o1ZzE4SjiAtpzpBiOKajAN97XSWpWfV+Gg2y0q8V6VGWP634uqJOTUDzZzMpFx+
	QcDEWPsz5zUd6hY7TjGGNkXTuHIQVq3nM7O1GDP5Ah35ju887E1zrqrDfFhiqsHjC94ahiZvIAYmC
	AiCGLiKqWghQ6ZBdh5NIcfc+U9EukF8AZaTwZQpQvCEzvzMnSW7ccOsnMaNFkcK1S6HmyRdVuQw4i
	AZ3KDI9StebD/cxRTo55hrWiRMaMEsUz0zQDsargeorKRnNv1ULYd71p3sNmxRDEsxlJSxvYgCG77
	0n8Pjs6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0tp-0000000CseI-3yhY;
	Fri, 25 Sep 2026 08:03:17 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0tf-0000000CsaG-3Wfb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:03:09 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f9f7dbfso68861766b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 01:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790323386; x=1790928186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U46+/TQQC41hUZlX1Jqyf2quyZyNvdapr8jATlMb4/s=;
        b=uLK5dmeEnhBlDvqohCPl/YT5ajsqYLIAzHdHFzvPsvgHwS1kljnsnYUA5gQbKoZtGK
         UsMHIcZu/VNxz3VqfP5VL61BKQKPuQXSsQK4weknfV5SNUv2yh9iMmaXPpw1fy1JTW2a
         3xkkvQPCeDQDlWiKJmle30TjmB1HScgHLv0HygNyeS6n9OJHO1ipnwDTGRzfhF03eWvw
         wE53KlGY/rosP79cp3+DNda5zJQFshGK4cBzQK9MtwPNLAIb37K3PgmJSyY6hSdn7pUk
         cVL2JkjJs2jU9bnoXGbu7rIrVPVUSo4kEWLS1IXvbRycSgTNNZoJraq4jMpxU/mb7ona
         nIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323386; x=1790928186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U46+/TQQC41hUZlX1Jqyf2quyZyNvdapr8jATlMb4/s=;
        b=1dTXTlFtFNg2HgEo0EsgCkyHGNuHAmxWqy2VHJhNX3k2LJBp1+xhmv5FeA+TC3dA0r
         /seTp+CoLKydivmKRRNGMVQOvINnPOPpzOMdKp+XPbs4nGDv54sbp7zg7luq0wTRd9u5
         tS1/VHBZ0AUPXqtG/jXF2HKAaTrVAMLDPc8H9itINi9c1b+6CGbD7Y4LqVpzNJ64xq4F
         vTRsQwVKSH1Y+psVhs/x/Ec0WSF8igeTVXcr/J/98QLBiKT703fIip0EJDVXbWQwuUqF
         MQw6FPkoR70x5E2BqR/N1QY27Z6tcwxivfbneErXbT4+HQV/D8Kunpw5v6zmYfvIyYPo
         l7kw==
X-Forwarded-Encrypted: i=1; AKwUvBwyLclIfAyPB7Hb/fY4NH++s6+XFrR/QM/4+6JoA96oEJYiFjDYcxK0jnok+gMxVpa/t+W0eBc0FHypa6fwyMrd@lists.infradead.org
X-Gm-Message-State: AFuF++mOO1kZnlfHtL74XuIXs0xV07ZPI3dLZ89iNg08PL0xJgq7coXO
	uXp96I/eQwdlO375ASlwruba/AoxWPjZIsy3zJOiTZRb2iMWxzSK2+uZJmk+sGmSSww=
X-Gm-Gg: AYBFou3uz/tcgB8xP9sp5JfAJFfrWAWsKolGzLoppISVlNGMMWdU6HDise/W/q5w9Fd
	xXrk7keu70eubkP9CJKb4SJat7bSWeXj6dmwKJdYmBBkwaGiSH46FB61X6nde2Zy6XgxkqOBvcb
	r5mkb4CGIZ5eDLpCPrjyh4vQYrdbkfG6A2tcGaZUvkw7RYmOa02d85oEd3DUwv0RfTNYKBRnnID
	gSOYFz3nfepIUFza57SFgsg8skGDrpD22RTf9slbYkTEG7GU2Eeyg4LlieoROLLZpm8htVzouM3
	yRlEqD1DMZWBicbQ/dos1oDHScnbQ/kOOU64XSxs3E42/kZBdRNSmqAID3dowvFPaA18/Dmrsp0
	PWVoCQift3yqb5Jn9bls/SFdXzhl4Oq/Ys7yJu0mv8uNAYMGeHJQ+VH7jfGlzfK7lXuqroZlcOo
	gJHhDAnTEIsUbAu+EoJNIEMWpz7v+JfdWGUZJCY1CckBzsICuz81ull3ICMvOu19S43jxBYcPLZ
	XsdQX2bkvywYd5SU1FX+Ulm7F4jfRYpis82jGOjL65HU9c=
X-Received: by 2002:a17:907:c08c:b0:c29:3aef:f2e2 with SMTP id a640c23a62f3a-c2ac25f2abemr418331766b.40.1790323386232;
        Fri, 25 Sep 2026 01:03:06 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm76976966b.33.2026.09.25.01.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:03:05 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Add WWAN overlay for Radxa ROCK 3B
Date: Fri, 25 Sep 2026 10:02:58 +0200
Message-ID: <20260925080258.46489-3-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925080258.46489-1-adam@wermuth.pl>
References: <20260925080258.46489-1-adam@wermuth.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_010307_940325_7208375F 
X-CRM114-Status: GOOD (  17.43  )
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

The M.2 B-key slot on the ROCK 3B is intended for 4G/5G modules and
is not always populated. Add a device tree overlay which enables the
slot when a module is fitted:

 - The USB 2.0 data lines of the slot are routed to USB2_HOST3, served
   by usb_host1_ehci/ohci through the host port of usb2phy1. The slot
   has no VBUS, so no supply is attached to the PHY port.
 - GPIO0_C6 (4G_PWREN_H) enables the 3.3V supply of the slot, which is
   generated from vcc5v0_sys by a dedicated buck converter.
 - GPIO0_D6 (4G_RESET) drives RESET# and GPIO1_B0 (4G_DISABLE) drives
   W_DISABLE1# of the slot. Both are hogged in their inactive state.

Tested with a SIMCom SIM7600G-H module.

Signed-off-by: Adam Wermuth <adam@wermuth.pl>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  5 ++
 .../dts/rockchip/rk3568-rock-3b-wwan.dtso     | 65 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-rock-3b-wwan.dtso

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index b677914cd3f1..8a1f24ccaa32 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -165,6 +165,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-radxa-e25.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-roc-pc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3a.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3b.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3b-wwan.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
@@ -300,6 +301,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts433-pcb-12-10.dtb
 rk3568-qnap-ts433-pcb-12-10-dtbs := rk3568-qnap-ts433.dtb \
 	rk3568-qnap-ts433-pcb-12-10.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3b-wwan.dtb
+rk3568-rock-3b-wwan-dtbs := rk3568-rock-3b.dtb \
+	rk3568-rock-3b-wwan.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
 rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b-wwan.dtso b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b-wwan.dtso
new file mode 100644
index 000000000000..73a19408d61c
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b-wwan.dtso
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device tree overlay for a WWAN module in the M.2 B-key slot
+ * of the Radxa ROCK 3B.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	vcc3v3_wwan: regulator-3v3-vcc-wwan {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wwan_pwren_h>;
+		regulator-name = "vcc3v3_wwan";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&gpio0 {
+	wwan-reset-hog {
+		gpio-hog;
+		gpios = <RK_PD6 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "wwan-reset";
+	};
+};
+
+&gpio1 {
+	wwan-disable-hog {
+		gpio-hog;
+		gpios = <RK_PB0 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "wwan-w-disable";
+	};
+};
+
+&pinctrl {
+	wwan {
+		wwan_pwren_h: wwan-pwren-h {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&usb2phy1_host {
+	status = "okay";
+};
-- 
2.43.0


