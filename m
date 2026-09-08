Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD07C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=; b=FDtdVvTQZXa8pIEzWkMT/uumNe
	LK86YHgSywMoacy+wPqyvhwMxxw8S59FjmisplZgy5A6gOg3oThgc3/N8IQLsMwJEntLKi4v0qjTC
	h3ygrmhQx/1ALolg/QGGVdGF3aR2goVIZg299YKmP1w97mou0bZAVtFXbneowYTg2vaSZTRoSs3SC
	+FZcxvJ7eHKnXcfrDKduZuhR+Y8sMdci+Y855SZC9bFCobelIqW6Yhq0fePZ76U0uoeyLckZpfFjh
	lRv6vnY3rva6iKG+bUr/09Tk5axxoXK7qvgwwsgf1GkafBdgmK2aKryMkyHm8emu7DdlF/v86o/GG
	Si3Dj8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vWi-000000096Bf-3ZNd;
	Tue, 08 Sep 2026 13:06:17 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vWJ-0000000961R-0kvf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:05:53 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so6647285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788872749; x=1789477549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=VU+8GGTsBDBXXQXGLfQQ/thjKLbT4U953wCTYFsudgdN+fEn5KdvHHOlGJOSazRFyD
         LJHh45Kao/9NC4PHVa4mXf61tAVqO9vJM0iBTqMIrVYZ3N1H6NdZpB1vhTjjGPEQVINz
         8t0RKX7rxTNKqevFxzBo7clSK3zatmxz6WQ9QnYDGqU8shrsDiQ2Q56X73nUNkjubjDd
         99kazh0TuKi3HcAPnTG4LENUo6F/wUlGjrS9zWGQPWKnpNtkMOu+Zlazofb+P75goQmC
         kEHOMpdpNyOmtP54HukUOUN2PGgvb/uGo+CIHzpu1gczcR7q1BduPFG931EoA1h0zDa6
         tc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872749; x=1789477549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=ekJm4r8xRq39lhaVCI1tdSm1oLwJEGSOwJO8yd+sxOpI6oXXaArXAki0/Ym381nYBV
         o9u15Vr15N5gnxvKsLdhKN0brz4KsC0fEwXCfCD7Xn5IhVC3r9ln2JIqjd2KzSvRLQ1g
         Y12OWPqubk/G0OgEsNyGAAehr58YUPpBtN9zExLrbUWQrw7tKckOjWjtY2BsCQ8KgPgu
         f0j7GcGEFBA4ebX7rzUUAErSqJxH7rzwytGsxTxH0Eru6cCE7H+6tZcPa6gAqMZeJaZE
         id+3UpjCO2W1325CUCM+pcahjVcYgo/KwKz75utigEhYi+llwANweStRPioOSejy4KuM
         dmMQ==
X-Forwarded-Encrypted: i=1; AKwUvBze5HWaoz+x03y0nNlfEZJxKc0Z5hfgddd1tyRkbWTvNs7lGnp8HJcpuk/9sS0Ja0jJWml9BYviCM2LVcnq3Cyt@lists.infradead.org
X-Gm-Message-State: AFuF++n0OZD+HCCfTNfbtuHIogBLzhIoBKgtkY3dwyXb+WYGuPZ2aHL5
	WiJf1Ko5u4dsGBUPfuuZRsttTrWTDzmBtFY8IqNYCloL4nQx1PproGw2W/Q+gtDjXfE=
X-Gm-Gg: AYBFou04IlDB5/eGDJI5g9o5moM7WN98yzjISwx0AkJRvbTSK5DP6slxJkoz0ZZ4Nz5
	aK6AJrEJZNp40YsudiQrf1K5DblxLBc2PgBohW73t8I1t7yVtxtIozA9lLg2tt4W9YiIl8XLLQu
	WWhyMPkFgG7EglPjBnCVz8r2Ecaqk7BZA5BshkPkhOJw2hSEAgWwpz0zsFOkXLr+3/rERsafP+u
	dGGolRZAijJv1NSAq1fus/jPjUEN12KO2d/nlQ/fAgghjcJSZKvqjQMOfUPDy/COEWHfHc6S/VW
	FdC/5YF/AcALlUh54KxmAXZTyOVmXRLGLObCtuCYTJiudOpN8cxEWp0ExN9ONcbJ3icB7ozLPzt
	Pvu8LirPZuhCWRhmJL0B17uS4TNgO6jsvZW0QcRIQ+5F3djSsdCFvHKkzb9+ifZDr5EKWIWYd/a
	QrTDEb2xItCLpzm4PHCd/0VfvDa9xWpTMTZh8BSd+S8H8Jq36uPTCnSegtTw==
X-Received: by 2002:a05:600c:c4b8:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49d17543be5mr74495775e9.3.1788872749175;
        Tue, 08 Sep 2026 06:05:49 -0700 (PDT)
Received: from localhost ([82.145.119.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1e5c58a6sm2552135e9.2.2026.09.08.06.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:05:48 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v8 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Tue,  8 Sep 2026 15:09:14 +0200
Message-ID: <946df411f5d2a127800298fba856face5cc5e8b0.1788872294.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1788872294.git.andrea.porta@suse.com>
References: <cover.1788872294.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_060552_298315_4D48B3D2 
X-CRM114-Status: GOOD (  12.29  )
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

From: Stanimir Varbanov <svarbanov@suse.de>

The RP1 chipset used on the Raspberry Pi 5 features an integrated
PWM controller to drive the cooling fan.

Add the corresponding DT node for this PWM controller.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 12 ++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi     |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 0fc57e72632ed..748be8f1ee9e2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -64,6 +64,12 @@ phy1: ethernet-phy@1 {
 };
 
 &rp1_gpio {
+	fan_pwm_default_state: fan-pwm-default-state {
+		function = "pwm1";
+		pins = "gpio45";
+		bias-pull-down;
+	};
+
 	usb_vbus_default_state: usb-vbus-default-state {
 		function = "vbus1";
 		groups = "vbus1";
@@ -94,6 +100,12 @@ &rp1_i2c6 {
 	pinctrl-names = "default";
 };
 
+&rp1_pwm1 {
+	pinctrl-0 = <&fan_pwm_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 16f5359395835..df4c2d09c8d34 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -99,7 +99,16 @@ rp1_i2c6: i2c@40088000 {
 		clocks = <&rp1_clocks RP1_CLK_SYS>;
 		i2c-scl-rising-time-ns = <65>;
 		i2c-scl-falling-time-ns = <100>;
+		status = "disabled";
+	};
 
+	rp1_pwm1: pwm@4009c000 {
+		compatible = "raspberrypi,rp1-pwm";
+		reg = <0x00 0x4009c000  0x0 0x100>;
+		clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clock-rates = <50000000>;
+		#pwm-cells = <3>;
 		status = "disabled";
 	};
 
-- 
2.35.3


