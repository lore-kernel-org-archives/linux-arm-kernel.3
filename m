Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D36CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=; b=hcHoToA6WjrBQBW2XxawAenSJR
	elJOvwwl9mMgqCMvsQQr3fIJAqua4uO+HhooQUboO6cN619oLBGvRRZbpiq0CcZ74MRKO+K2oVNEF
	FWHhKWC4BXswnTq3OJvT2/J8Rm6E5SfuVXwui3OvTNhO7kFMXf66QBddJ3SH0jdDsFVAdBXuy8uBr
	XZq84/f2EDuOZ1YIB3bas2Ifrcr53MQ99pMOYpIiBuhxss7O8VQjeyPbD5S6A3FWQCnZjq+nwabyf
	H8qZNW+Yab0s7AgmyOdnzmmuWu4JitHqt+eFx6b2SuasIOM1LqiqL/ZeItT8C6WgTWWl/oXvU97a6
	P1w0STeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2Ow-0000000B1VP-32T0;
	Fri, 12 Jun 2026 13:58:26 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2Oq-0000000B1QM-0FEt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:58:21 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so759014f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781272698; x=1781877498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=Kj1L2k9juY1ht1UX9pvLESe+h39dr/cNmNxjFwrvVfBwFHginPKokxtCteC3gg0V6H
         ey5oZf8QENhigB9cdDzP7CKLWMDsYVdT3xV727tQQJ4Uiz9nR0JrWrTwk3zgZ2OKV2nh
         h2RkL2WdmuOeklcsCwRwz7QQW3qbw0PCxQCQ/+JFA9fJgknbUFnPzE8bc75S3TWb7ED4
         f+g4oJLH/pp/ebDaiU0InRJ27hxmPjwJjQTJM460nXK2dk3yHJhlkgA/NSeEFLrcauTh
         c6aH0XK4gAjYBOLXMG6oI+kijWi7VM4p5UJP8sYh67QbfmB+boIKw56bak9GsZ+0Xcyf
         JrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781272698; x=1781877498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=cBVRJ7eQy3OQD3Rw8XVvr1TZ7vqGd+B3wabLQv/T90W/ECq3NdJfBi3SiJJqVt4n5X
         N3zZsOw04S9k9ljoxp5ZQHHK4hF+Cei4Fi6OYelpbOrrfW3lb/YvLW1dFZ/qx9p5EfRO
         ivQh95ttPVxf28IMtMevYCrcA+w64EJjrUu3oq/LN5Gyq0DPbSXfderjKw6OAUrHDP5C
         qZvRNjwoKR16Sgt0alCIOsH5Wg9iRGbo7oCnVuSKLVdU52apteNTN74yRrybm6KmEK6l
         x+aQlCYXtW4O/5/VQDR5g/UHMKOBL56vzi1jwv8yNP31xeMdJIln+51iv1RtNGuOc+To
         4sBA==
X-Forwarded-Encrypted: i=1; AFNElJ9qZJT5IPbVBLrHeiimXanH6EGtMmg/eLyvEwhuNV1UGDt3IbkCAZ2yrWAKiLZzoMjBxwJ7Q5UO14K78eH0V39C@lists.infradead.org
X-Gm-Message-State: AOJu0YyrxxRGYDy/FP2EE4E7X+YdUuVo8fMsdeSEFLdP5aRztllObKB1
	dlj+N0E9w/LIy89v2qGhEeUSFbI8b1v7LTUPpoA4uROQ0P9XYLJufjN3w6ouaOTibA8=
X-Gm-Gg: Acq92OE4WuD9M5h7rd/Oh1zorm1ZXMXd86Mdixbr7hCtROReUJQ/xOgCrgIFQ/xhBRN
	KKeWB1aFwyyJgwdB8t5jqOO8nqzZK0+M+JkjHMDirt+gY5MOZUzKM8Y/VygCh5KYFKjEY47SQEa
	nxD59jbWPW7+VO7xMa46zwSJw0JYIwgAYnWF1NGh0NdD/P9s6RSvsNd99w4sMOsQWNpNrUniLb+
	9ToloXOnGPRafn71eq6KpovQpn8/wbFLgbTtkTjX7AyKyL4syKTBlOIAjsSN/d2wDQOMssSL9/l
	o6+1HoOp67C36br+zDxdLA63NubA8EmiyNop8fhJzuswpCDxyxN/cuq6kROMVkvL+6mMc+lWEhl
	OlZ/plKz79u2sqO6DIQOEEp0+sOyzc77IJPdiFm/jStSSitEC3sef6EPZPHErdDT3QrJhg4iM/I
	0+kpMywlBcaMo6zTTbJzLH
X-Received: by 2002:a05:6000:1886:b0:460:1a52:8a13 with SMTP id ffacd0b85a97d-4606da0f65emr4345439f8f.0.1781272698170;
        Fri, 12 Jun 2026 06:58:18 -0700 (PDT)
Received: from localhost ([195.94.146.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c5266sm6363550f8f.29.2026.06.12.06.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:58:17 -0700 (PDT)
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
	mbrugger@suse.com
Subject: [PATCH v5 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Fri, 12 Jun 2026 16:01:28 +0200
Message-ID: <b08d1a25e6f3cd81162805adca878865ad112858.1780670224.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1780670224.git.andrea.porta@suse.com>
References: <cover.1780670224.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_065820_117760_947FE3E7 
X-CRM114-Status: GOOD (  11.74  )
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


