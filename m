Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB28ACA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=; b=gC3L3UgRTbdyRzTQ/1POjwcfQr
	4Bd7rx2kKS2xMSkPeRu6hygVvtmBl3s9/1ELWSXlaaVPWvbmj6NzPozZhiu6PYKqniF42nbq6HowX
	P/ZCY8D63sF6f0HtKyiT8Qa/zuzsmM1JKi/i4z4aTg3Qul7x32aVqPtYuZCEjIhXA20FdUVmXfBM6
	VeJlhoHka5jbaVzcXE1Fhfmr1y1hsO/OO4rLqgQ1M9K5b4Adpm1BTXupb5HcYsXScbQp8E/eciE2z
	QDedIEgJ2tlGWNYV/dbB3+NKxQ/R0gMc3mjj8hADRvqC7o7ilfs4xexHd2OSgB1rAJUCoFCD/n7xO
	/mXJXo/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCVY-00000000nF4-3cpT;
	Mon, 28 Sep 2026 14:39:08 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCVW-00000000nCR-0wPV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 14:39:07 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e8185e037so17173965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 07:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790606344; x=1791211144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=QeX+JW2i/AMsNlHIxvro7HJohp8iTCcJeIqaKPKFXN6agYthV6SdX27Ea08Z4iXHKU
         0ABICjHt8JzNjH3Y6AwfrAoXn1cdqRhptjCKYupSYDYWa6kHzR7fiTeprn1iUqJQw62K
         RU1xkk1hVP3uhktdUTB8qjWiWqRtNqVh5XkiNtgjsqGqqslzhOvogzrFlRng5kGYtlPr
         IM/9gBfCN/cz1xK8ut/1LRGnqMYuozxMwTxRQDjxwT+bOSLxq/nNz74DH8D5ci8DuP5p
         wDLO/lcpyYoLy3Rod5Sw/rs9F20TPnMGueMZ9CRXu5l/ewUE/Q3WxdiZg/+KwQ+QsTZq
         XRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606344; x=1791211144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=C9nXqL44KL50C6+o3vDt6hI3701G6h/cJ8dBNBMSQHwj3euAcpCm78TU1NNJ0DQRFg
         HMzIae1ITlsaXyoLoY3J37sA012RrxmDuJKtwj28VNgvGQzBnfKdgdq9tlFRE9hDyR1t
         Rip/0rnm7cYegcn1VvxMEauNOAwkLBfJlTyaNLGR/oKasNayolVB/7Twv2YOW5mo8IUy
         HXjqKTlBAzGV+MlLF3T4IrtRrW9ofFqtwNPtYlc1ecg34F0yQjmF3rF5K9UMqidvr6+2
         0hbh36sZnVpRoH+acQ5VNBmAvpXmCby0vvGRo+ILLgqu/Fg7trthjmyE/0wb3YWorlfL
         n/IQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbqAxEwOw5gHg32KwY6uw3U4vsLqHY7w8hdNGvR7+dJ+U0iDGfM3tslgvikAZZPxPuB3L3CY5zTkD1Hfi+9aLz@lists.infradead.org
X-Gm-Message-State: AFuF++lzKEkykttye+EKhCFAbcXTt4tCeVvpi2sVcxjvaYtge9P3BaBV
	Gm0ka5wL+T8UbI3Bm19XyRObT4toYWqlslq46WLiNgd+2yApHD0+Akr7xcDRpRRMP2g=
X-Gm-Gg: AYBFou0CYz016+FESA/Dwb+5ES+rMoQDhUrD8WwtdyFdD+8VIMlLlhlJ2Ke3iCB1ywy
	a3pRpA0WQ/x/zKcEVgBDmrg7Jswm+FD3fd3wRVA59B1QW9fmfJ/UCIHSZnCe5K/+5PUQyq+QJ+F
	c823fgPYoczDUe9JzTzNjMrusEqXTu4WLmSbkuneJ7R1+TzaMM1mUTWtsLmMF/grNq4cyBUWIhL
	5EzDefwqtKsMfEdKqXBc6c1WSPUfriRkZ8PSDlK+Jk9gaM7pkouCNbBhKO5YdtTFASYuMmL/g4p
	XtWiUd6QIK49aMl7ib4A/B7Yk1uoy/fwjc4L8fLl1wFjfHe5hCGLtK1YzQ6Eolailc7ToRF+pC5
	KZbEhxGKRFMqaSpZwYj8S9wXMEtRDle2hG+M+EikDg4/kZqYkeBzNPtIcKy1kTiveAYWtGEotob
	gHeyFOGP853tcl64OAM7+zN9sV81xf4kwASICoMRFaPLg/v7GF+T9BOA+/jlOnwVgye/X9Jg==
X-Received: by 2002:a05:600c:8718:b0:49c:fc6c:be08 with SMTP id 5b1f17b1804b1-49ff06f8316mr163210765e9.31.1790606344550;
        Mon, 28 Sep 2026 07:39:04 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018f0e79sm233409295e9.7.2026.09.28.07.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:39:04 -0700 (PDT)
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
Subject: [PATCH v10 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Mon, 28 Sep 2026 16:42:42 +0200
Message-ID: <ad9bc35d7c30f7925fed4c6621ed0f67c39c3f09.1790606188.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1790606188.git.andrea.porta@suse.com>
References: <cover.1790606188.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073906_277669_14AAAA09 
X-CRM114-Status: GOOD (  12.50  )
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


