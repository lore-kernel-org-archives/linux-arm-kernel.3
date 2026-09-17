Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00487C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMkgBdb6Add+uH48UOWcPcDDnexiIDFVK5Cum+qocr8=; b=KdEiShdXqaumLYPlAlp0zxJ7XV
	/eSNxWPgrDNifqW/MS4aUFdKf4+v6dzvxF5F+hyrt4WkDjNSWPA/rVb8Litq5rSn13tGaAnr9/+Gx
	/hnIfD8RGDIJsdNr11g59bckd9p0zZHVLXVpPHHFQ5SxW33W+E2LZVZY59a02Nx7Z+SfmpPzy1wN7
	LaVfyUpGUs8h53rB/Am0f26O8oDLU8q2He46npF5T4EFrtXZtPcLbEcOiwc18GUmaHQloCi3JZAqf
	nlWmOenja75mRgY7qghIxgYWC9y0bYvtKJ78jyW6/7NdmZCpbZmZpMebIRHN9Ly/1H+SuvAWs8ljE
	Ncu3MWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77SO-0000000Ate2-2N53;
	Thu, 17 Sep 2026 08:27:00 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77SJ-0000000Atbl-1ujU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:26:57 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485b1d2874fso176678f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 01:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789633614; x=1790238414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMkgBdb6Add+uH48UOWcPcDDnexiIDFVK5Cum+qocr8=;
        b=LUi93/iBtT1vIBthaeCjAS5Qk1zGwhZKt2TE55AP3pvAqf/lDctIk1PYn1hmeEtvwQ
         s6zOPX51Qntg4HPBFFDQnTdJ2W285NxfUcaFxjNR7dATWZNNDRrcFXmAZnZMKtlFTNFX
         5gVwOOQdHJmBD4sIi7iMgsxUroHJ6vLrfzl3Pj1wmd9GJD+wvwqJsUpQIGwkC2Yt5b6I
         1ZgjG2WP6rPN3YinXM7eu08mXqDW9EjkOR0ju9M8E5O/Pb1506nZYfwWPVNgY64aVfHX
         LsTgDYtV02Njm9zvnPU1926GCcYT//8SZKDvru4rQ/tYw2ZM9QBih4n4+cNAO9gAdz6b
         19gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633614; x=1790238414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kMkgBdb6Add+uH48UOWcPcDDnexiIDFVK5Cum+qocr8=;
        b=BS+f8RNlHDsdylzg1abx3V3BKKvvJYFsUM6lC3lnQKuvjwKwt4kNbLKMRypjHYn75m
         LPwg9HL/9qYNCOWrpglSi3BHoIFI7Kr1LT4C137VBQqM3qYf+bxiMrpl7GoABS6M37cJ
         KzLpu6+8amI/i0Hvr4YqMq6QTCLOPDZcKY4Hf7nQYjMJsOZvsJrEHy3Tv9ibcaqkclCK
         XulJ8yrP6CO3uBML2PXZTWPhXIc2exwd6Yy7V5g+KQbT3J71jxSz5CjjjhH+PbNG31kv
         48gtMKpmomSOfKvMLSwO0sm5/JkkLcOA2IIjN0AMBi8zSy1VISnmV5hxsFcTjnubwVaa
         ObZQ==
X-Gm-Message-State: AFuF++mmsc+KKmMyuPi3GDu0dtP8XYhlGc4s1FebFveJKV9L+2S+YtJq
	oXCDXijM1+znjSTzIg1N4FdOO/7cf7+hJF7Xm76YLZNNOMX8hE4K5U9NDH4WrF3683Bha+QMaWc
	D2ZumRYI=
X-Gm-Gg: AYBFou0chGEYPuJnl9jnz2Ag+WkNL9eRwB37LcfUyC8jw/f7th+4N8bZEgyBKGykneZ
	mIAR+zd6zpPfQn4M3Un//LpoAr61jU7RAuqng3Z9VVWB18niXIL/GnEWK+4VCydYGRJ9yO9rjyL
	lqbp6au9WymQrrIGn3pNqLDDaRPvbNnqsBQfmM3DkYjkKJxokn5Mbdt0MppovC9jaB+SvPDM7yN
	eGJ0OLe4P2s7TUo0mZyTrsjkKeKbqAN89TtW5ZABuXHOKlNppsC6FDdrYdIjXAqQo+PxdURFhi+
	dc/GrWJMIt7+A5NzeDg7qmd+cpMVuQUYp1hmYO7yJq2u9MQd9wwyp8E2q0/6FpEFXHGUWanQDrH
	dv1q8Uj/rZfScB+U/dAnHc3UpPlGyTMFeWerehFPEhn1M8UaEeg/SNmSvyfhU7vWhAI+Bkn7y0p
	Mv5Z1jKuis2FBJONJQMEShkr42VEDOVvlg8AAHWfY3jRpEZZzKO99sDXIYiVsbJUMEfMmt52bBD
	yzwKJGyF37l8SjKVIp82Z8YfA/E0kfFV6oO
X-Received: by 2002:a05:6000:2084:b0:484:3147:49c9 with SMTP id ffacd0b85a97d-48713ae5112mr4241921f8f.2.1789633613879;
        Thu, 17 Sep 2026 01:26:53 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm13420395f8f.24.2026.09.17.01.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:26:53 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH 2/4] arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
Date: Thu, 17 Sep 2026 10:26:30 +0200
Message-ID: <20260917082632.626614-3-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917082632.626614-1-ag@ffroot.co.za>
References: <20260917082632.626614-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_012655_506016_FBE15E60 
X-CRM114-Status: GOOD (  10.86  )
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

Add device nodes for the peripherals that have upstream drivers:
- PWM controller
- Watchdog controller
- eMMC controller

Also add a label to the gpio-leds node so board DTS files can override it.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi | 37 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
index ae9bbe0320b8..40dc92a05f0e 100644
--- a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
@@ -291,9 +291,44 @@ uart4: serial@8780 {
 			pinctrl-0 = <&uart4_pins>;
 			status = "disabled";
 		};
+
+		pwm: pwm@7a00 {
+			#pwm-cells = <2>;
+			compatible = "sunplus,sp7021-pwm";
+			reg = <0x7a00 0x80>;
+			clocks = <&clkc CLK_DISP_PWM>;
+			status = "disabled";
+		};
+
+		wdt: watchdog@630 {
+			compatible = "sunplus,sp7021-wdt";
+			reg = <0x630 0x08>, <0x274 0x04>;
+			clocks = <&clkc CLK_STC0>;
+			resets = <&rstc RST_STC0>;
+			status = "disabled";
+		};
+
+		mmc0: mmc@3b00 {
+			compatible = "sunplus,sp7021-mmc";
+			reg = <0x3b00 0x180>;
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkc CLK_CARD_CTL0>;
+			resets = <&rstc RST_CARD_CTL0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&emmc_pins>;
+			bus-width = <8>;
+			max-frequency = <52000000>;
+			non-removable;
+			disable-wp;
+			cap-mmc-highspeed;
+			mmc-ddr-3_3v;
+			no-sdio;
+			no-sd;
+			status = "disabled";
+		};
 	};
 
-	leds {
+	leds: leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&leds_pins>;
-- 
2.53.0


