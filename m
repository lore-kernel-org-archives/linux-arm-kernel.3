Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94041C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9SnrP3NnfwuDtIo3bxA5uNn9yAXYdP3Skxl+K4FHxq8=; b=V9H91OdcV4hySZ6xQ+e+qs57Ry
	s18xu9jiVyvL2Jbg6PL7EWlSbKHzJjVO+QYKOMgvvdmmPKYdMJhyC39ItJ0lNT2mdfsYJwWyFipwj
	Mue0V48OLoHMDfF8X7KFAiB365xHk8q/lkk/kvbJwCWvnfMSxaD9Mz+Ki3FvrGWkRJmji5bh6HSda
	18LiC5PLYUGb+BgEJoVg96A+e6fV8+jmfLpli1gEcemT+P8y77+ME2Jd0ZcNqGsk4jH0yqvPLgRSF
	cCfgzxg4r7x6pvoj/GwzUJRnLikM+SdCsPfN/wNHpAN8jsWUePGP2FYRTYMryk5oI+2EfCGWSUz/o
	sklddKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWew8-00000006FXr-1FQb;
	Tue, 01 Jul 2025 17:38:28 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcR4-00000005nzF-38t7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:58:17 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso38382305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751381893; x=1751986693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9SnrP3NnfwuDtIo3bxA5uNn9yAXYdP3Skxl+K4FHxq8=;
        b=NgSKFNAMpbf+LpOXt/PW+5XRg87daFk4Tu/EcHuJnAPpHWPvw+Dezw7S+BNEl8hXiO
         r8y3PTqPIM/mKrA6mcp6YkF0XA42+V0yxvNshDPKMRbgzlNTi5bHkH69atyKZ7xhLZmk
         ObJ5y/SidS5EoQ/Py4I3EkLs1SeW0Ew6/TZIwaChOJcpbjbAge1tNXJ6F6tDcrnnZxat
         JGdRcgad6/1POgBJHM8KsJF9AFO97ktFLpzKc62vOBrUVyDQnh2II0LGkbVC5lMdr4CW
         URc0VxHzBtdT8hV1afdjx+fsqSNzrANR4IvZ8mI9vmg5Yk4iv8EYKsU/GoorwkUrHFPf
         pMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751381893; x=1751986693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9SnrP3NnfwuDtIo3bxA5uNn9yAXYdP3Skxl+K4FHxq8=;
        b=QHfk620RYuGUH/dr5fx06QYiySGq1f5LuzR63ooO/gIBJMOW0+urvK56uZJ8Anda7F
         2MTcy9GCDbfU+bdfTXfDPk4Kvo7x3qnum2o7mhPbnwZhPgStWl5eJUNAvCqB3C7DICm8
         9zRG/D5QO4oF+I6S9vdiCMDRgP26MC01X711+FMBGvyWVveLh6l1vmq5L8dZlMscKHVj
         K4GaJeHUqBVhYZzI25oBvHikeqSjVcEd+16Wf9axvCRxBoV4Uxs2AXXhi92QPZL2f9GJ
         p09P5idVucbS8WH9c768zYpWqrr45z9Hn0B/MQCmFUuFGNUPTh+rI54KihZzdSEtLo/m
         2GjA==
X-Forwarded-Encrypted: i=1; AJvYcCW1aggHw5Q4c0Ky2xtdyqeUNTZ4OfWlg+eeHYHd5rLBPkoVAzNOUZ8rh3/Do5hn1bnZkYgiTwTylTpbTUvGQvCZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzrgeQ/C3ngc5FSHVaDD+bHmeaLr31Iqkh6znH5r7gfuLpto5xm
	yuU0Dqszgm0OZxTXfOYTzM4tIzkhTQ6BN00tw78rU7A+r6RglZxSTVcG0Z1lSLjYVKM=
X-Gm-Gg: ASbGncsiY08enwAMuE6IJ9RzvsSBWKjJw5M+iEjd4UfA3DAwuYjnW/t5rxdPBDqKU3X
	ur22DVFT4lj4LszidtLEGPyq9MmyDONgl6OOMYYhje7S/Y3+/dBhQ9xBAXIW2qwfiuPp2rhAU9m
	R/cCp5We8gF2A8Ttid9T0xPVw+YcKOaejXV1fb8HkeIptQG53Wimh6r37BUg/6CXN5R0nSqh+k+
	KQNMcnISGgXKUFhlUSi6YJWyEVbUgJSC0Gll99Bd7kbH8Num/nZQRfJo1O6NC6YWOdtk4aVyE5x
	gsuk66fLSizvZN9028eqfnOgP2I4Uqh1JutpnPAwOzJHmmJPM8EiyUCmkPTYqhHN7SsGvCkG+tA
	JszYYNu1Sy8ze3NZntZ3PRUVplylHVC5g90byOi4=
X-Google-Smtp-Source: AGHT+IHUmoDZ1xCqHU/YoX1VGjQsqIcwCI4NeUvfcRvvMvB3GVl/xxbnk7JsJ/Hkt3zYQQizDFlazQ==
X-Received: by 2002:a05:600c:358d:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-4538ee5d5f8mr208971115e9.16.1751381893014;
        Tue, 01 Jul 2025 07:58:13 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5972bsm13611051f8f.68.2025.07.01.07.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:58:12 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Purva Yeshi <purvayeshi550@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH v2] ARM: dts: lpc32xx: Add #pwm-cells property to the two SoC PWMs
Date: Tue,  1 Jul 2025 16:58:03 +0200
Message-ID: <20250701145803.140004-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1890; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=V3/1Jhz+8jf7kFbZFnPBPOCuvUVUSIhpyy7UQB/kU4E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoY/d8toMLlz9lxSI2Llq56+YvDEDL4asEd5CrC RI5bWIYEqeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGP3fAAKCRCPgPtYfRL+ TktAB/4soWg74PxIEoMJ0HCcBne4dGY+GAy12UbwZonUtaMNIbvMcY+uICUI5B0u1OWZl4yv+VP 6SfkyOG7IK0m4xe2NQdRrvpsoqRmAd/G7pPUziwN2ofDvpNCX1BFZzgaTEufOWjDmCHa1DbbiKf baPqXHW8A7MdPSigqhloWsBqwBlb7rXdL4DruYiINyvGdgbArsjyWVp/UQPptAzln1vrUtu1bN6 vc4Yk2hFGT/YWCRmQqf1sO1BiJLTtZ7tn+jrnlhqwfI9oNZ3LK09QMzYU1jeMKNCuLZqgR+kpGu Y+opYi8G0asrxrSO3LpY3t2rH4Xxj8WqY/RXFk58Py9/d9c2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_075815_011668_BE62EE6F 
X-CRM114-Status: GOOD (  15.71  )
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

If these PWMs are to be used, a #pwm-cells property is necessary. The
right location for that is in the SoC's dtsi file to not make
machine.dts files repeat the value for each usage. Currently the
machines based on nxp/lpc/lpc32xx.dtsi don't make use of the PWMs, so
there are no properties to drop there.

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this patch was send to linux-arm-kernel@lists.infradead.org and a few
other lists but not soc@lists.linux.dev[1]. So Vladimir's appeal to Arnd to
apply it was lost.

The changes compared to (implicit) v1 are:

 - rebase to todays next
 - add Vladimir R-b tag
 - add Arnd and soc@lists.linux.dev to recipents

Thanks for considering
Uwe

[1] https://lore.kernel.org/linux-arm-kernel/20250403104915.251303-2-u.kleine-koenig@baylibre.com/

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 41f41a786f9d..6cf405e9b082 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -481,6 +481,7 @@ pwm1: pwm@4005c000 {
 				compatible = "nxp,lpc3220-pwm";
 				reg = <0x4005c000 0x4>;
 				clocks = <&clk LPC32XX_CLK_PWM1>;
+				#pwm-cells = <3>;
 				assigned-clocks = <&clk LPC32XX_CLK_PWM1>;
 				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
 				status = "disabled";
@@ -490,6 +491,7 @@ pwm2: pwm@4005c004 {
 				compatible = "nxp,lpc3220-pwm";
 				reg = <0x4005c004 0x4>;
 				clocks = <&clk LPC32XX_CLK_PWM2>;
+				#pwm-cells = <3>;
 				assigned-clocks = <&clk LPC32XX_CLK_PWM2>;
 				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
 				status = "disabled";

base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
-- 
2.49.0


