Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C8ACA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 17:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuvwZFkQA9C7qsU3a5Mf07+vt99ZB7O1MdQDYloQZeU=; b=r/KrHpfAebcgmUk4uHOlfWLqsN
	I5pt4Nf8aFQ38hTGs5idwZqQgKEW7DaV7l7aGp5qIa3Uinb34dhiCu17JR2kR41cDRLJCYSKBsN2e
	B8ZvbRbOIkKYVrjaXABHrCpgQ7dk5Zpjo8T7UJOG/F3jmJz7QSrNAspqDCJ1OM4bGJMKnqJ97oLg9
	1RgNIvuMRBGV3YLDd2NblmR56pr4ZGvvgybSdZ2YfiB5dlZuEYaBsCm0pex5peiys/1xixPHi+qCn
	LkSut0WMfJrzozxVbuZarOzaDAv8mtD+m6Qe2ZXjkufiMO2Ol8kr8KB8cswDMHTHg4rLEjZHiBToJ
	+6KfMj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWny-00000008cIc-12Wk;
	Mon, 11 Aug 2025 17:59:30 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUHq-00000008AQm-2fsI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 15:18:11 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6182b3218aeso1942106a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 08:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754925489; x=1755530289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuvwZFkQA9C7qsU3a5Mf07+vt99ZB7O1MdQDYloQZeU=;
        b=aRGYO6s6r+XDboMxjOmVrfYuZNlK386kL7oNrtjYKOj3wKXff4AMvs3o1r/SHHZumv
         NptGtlBTOVRjxZs27P65WAQ7nqXzhPIOMIJF2fT63FierACRJfQZ6iBc5apG0x9SHu+Y
         BaJMCxv6gAzjMT7IyYwdsBngWfLT2Zqr5S/IGPBqMUspTcPzPGiJRShstfrfJHlJj9zt
         aiPPaO24zHiNaWqsk8+pemMXDH1wwio/ZDzhc2JGaVtB5pl2MqIzcvoMIncvKJGBKHZF
         hmta9lXeRXLWH3UmD09Qvt+ySZOHVl+XOF43tH8EufOsoGIvqEOvOEMhZ5UpzbJv+2yW
         7+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925489; x=1755530289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuvwZFkQA9C7qsU3a5Mf07+vt99ZB7O1MdQDYloQZeU=;
        b=p6l7FB2NHPxqftmG4L8SbYyD+QwLY+NP6QnPuTEWt2TqCuaLLpltWxzoUnA09jn0Hc
         +2+k14sgLNfykQu/1SzXAPL0wBQkaOTErGnKSxcSrMWEGE0C+DEvAGoQybBxNGK8JSQO
         NwzHsCVfLXtf9hSkhq5vKcnoGUX2fSu1J/W2rDas7sfTWM1ktNThcey4KW3nGNzkPXP0
         YQas90NPg+zWmnXDAhockUMTpwvX/6Rl1DNTPdlgWEtgm1I9OzNNgGLLD8MZz9/H/rjx
         gK1YxerYF17TMbcvUs8nX92++/r3dTT5MjO9439GmrYtJegsqcTcZ3cVtAGAAPITu7JZ
         PcSA==
X-Forwarded-Encrypted: i=1; AJvYcCW2KcuZk23P5gXQpsvBCaQFBOUzV1gtsBXf82ddWRtolazzqx4yk8Xegh/V9dcmA5HdpAzPjnJVhV78/7O7BkQG@lists.infradead.org
X-Gm-Message-State: AOJu0YwCpGagT0BAxpM60KT38dyR3HhcWyg+9ff4uGd1EJSgDZu1Lz+k
	7q1bSqjVjukJZWSsZtLvqMuaXX73PMMA1wXDXYNV9oVrunHMRyBHXhc/jl8lFvnOMsM=
X-Gm-Gg: ASbGncuAAduqbVilse7He9LYaucJQtdnlqypJphXE2nRvqY+URN9cK3+12tEbUqxxFs
	AxAMHAf+0iwoeK4b+78UYjVeb7edsYFG/dAxALt18medlCWP/RB4hIkP5crxEDVehfqIUUIQF41
	SVXBRtGWijB34OdWLYqb5bZX2Cq4bdiWQAiAZ2Vi3oWRCMufkGniaaa0AunNTTAommNgwcdon23
	QKar6EW7GFPKp32b+4+Hni/1eq0LA+FLXp73BFkboK8s8PSElQ24kcMlnQJDqbvsJZ4GaQf3tSK
	uPd6yjSNMh/Pm7dhSzJmxb6LiDEhiKNoQdlhk67BQPHCftYsyRxspRWa2RVGULkrgYRYu8QeJj5
	b+Ka9q5AFpueGY2yXuNd3cvemdhUM0kyy5KSRnbWMVklvE4Od+YqYTPy/kIGFOd4wow==
X-Google-Smtp-Source: AGHT+IEIVBs9d0xdJDBl+mpTiXaCmyfbfIFlGuElvhGMrwN5kIk4NUp0IcTo3IUJQ+HnGSN/veCQVw==
X-Received: by 2002:a05:6402:3510:b0:618:87:bb02 with SMTP id 4fb4d7f45d1cf-6180087bf86mr8011371a12.14.1754925488901;
        Mon, 11 Aug 2025 08:18:08 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f152easm18386370a12.15.2025.08.11.08.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:18:08 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 4/6] arm64: dts: broadcom: bcm2712: Add one more GPIO node
Date: Mon, 11 Aug 2025 17:19:48 +0200
Message-ID: <a86e12a27f4e89f4a95fafcd659d32e7049456b6.1754924348.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754924348.git.andrea.porta@suse.com>
References: <cover.1754924348.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081810_677472_CD0E4E2D 
X-CRM114-Status: GOOD (  11.86  )
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

From: "Ivan T. Ivanov" <iivanov@suse.de>

Add GPIO and related interrupt controller nodes and wire one
of the lines to power button.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 21 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 12 +++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 6091a1ff365c..f0883c903527 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -2,6 +2,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "bcm2712.dtsi"
 
 / {
@@ -29,6 +30,20 @@ memory@0 {
 		reg = <0 0 0 0x28000000>;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwr_button_default>;
+		status = "okay";
+
+		power_button: power-button {
+			label = "pwr_button";
+			linux,code = <KEY_POWER>;
+			gpios = <&gio 20 GPIO_ACTIVE_LOW>;
+			debounce-interval = <50>;
+		};
+	};
+
 	sd_io_1v8_reg: sd-io-1v8-reg {
 		compatible = "regulator-gpio";
 		regulator-name = "vdd-sd-io";
@@ -58,6 +73,12 @@ emmc_sd_default: emmc-sd-default-state {
 		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
 		bias-pull-up;
 	};
+
+	pwr_button_default: pwr-button-default-state {
+		function = "gpio";
+		pins = "gpio20";
+		bias-pull-up;
+	};
 };
 
 &pinctrl_aon {
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 8a517261841d..f70ec8d3dc4d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -248,6 +248,18 @@ pinctrl: pinctrl@7d504100 {
 			reg = <0x7d504100 0x30>;
 		};
 
+		gio: gpio@7d508500 {
+			compatible = "brcm,bcm7445-gpio", "brcm,brcmstb-gpio";
+			reg = <0x7d508500 0x40>;
+			interrupt-parent = <&main_irq>;
+			interrupts = <0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			brcm,gpio-bank-widths = <32 22>;
+		};
+
 		pinctrl_aon: pinctrl@7d510700 {
 			compatible = "brcm,bcm2712c0-aon-pinctrl";
 			reg = <0x7d510700 0x20>;
-- 
2.35.3


