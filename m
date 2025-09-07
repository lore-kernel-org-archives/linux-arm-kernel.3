Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41BFCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+9OHcP5c2ud1BeajMFK7r7Obvjia35QvFbBwFXTQrlk=; b=2WX5X/aLKdA403jdqfA/Ton5B8
	iQaoeDT2WrFBiuzauewIKtAeSnw19fIRiixKBX4+H3+p1qRSWZXtj/vNPiP0zd2dI8CEhj7Pv0oGz
	iJYlUo5UJSxB3fNMHquuWelCR9BbK922jA1hOVfuAyyP6FjR+euzzEeMRzkeiSjjd6h2+0LEGF/ET
	QNk5E59iyU/bdCUNRWfOXRHvhfdoYgmN7d/CWku40WObQtd6kZ1XwAq2b0tZIk3GNqmCSBfdSum/x
	gFG6Pq13IpDxKChSHFUq16f10yB0Bqb6ukTTtktd/adMTudUgTL2N6bPcxPZO3HEOR4HZjWAnq/wF
	j/REkhCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvI3k-0000000Bqqe-3BOA;
	Sun, 07 Sep 2025 16:16:08 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvHzk-0000000BptY-2iWn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 16:12:01 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cKZpZ51cCz9sX2;
	Sun,  7 Sep 2025 18:11:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757261510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+9OHcP5c2ud1BeajMFK7r7Obvjia35QvFbBwFXTQrlk=;
	b=kkuqygMYNmgjVN3haqWIDStKEDbVU5aPPL9P8nukAztbQGBg9YOC9zSrBZaic7Zp8B8IkD
	auh9YiDbt9aPnZ46qWQ0T2LW728xVYs+Ns9ta2gKRkmKF4e84vVlBj+d5RNV+CydC5cvwk
	HE5WPIjMmjmsttP8KiNSLtId9Jlyz0TX1HaKoWX0lJ7UWNIPOtqT3nDGuECWIZes9QLIrQ
	oseAkEMk/F4eMkhHNUV+JA61MEEv4TExXBAow1AZtI/ekfwxOd20dMumWvb+z7iR+5XRWz
	TLb1lGX5+FfHbXangXo3udS7R7RaUfOhf4E0EoNjZpByxG8barH38Fqu9XfNIA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757261508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+9OHcP5c2ud1BeajMFK7r7Obvjia35QvFbBwFXTQrlk=;
	b=BB2erMoTH59jc62MvowZ6mQTqTLMw0w3u+Taqv4zobDAIW2jI3SAzyE1VAisQQwlRiHDtv
	10bb6L0QXdqYsOXLOxhn1uWhX3GWuoSiqqUZyyozQ9ehaVKnJm8389ARATSv70P6y4H3Q4
	J3wnWTXLAgTTPMlRY4ybsEElAh8Ls+FoEa9LwfjW4EbC1yHMA5Rb7+/WDnucIb4Dl8qi4N
	vVxfOdelD7+/B4lqGrqn68TvgvHIbpPiDE+fX6hoFaR3MYMqEDtCQwiF/2S7wJi3cK3zPr
	KaMmyxsSoyLp3sapd7UANqnWiuU1z1LV8K40CAwcXcSo7/F2UQ8yfsnhDaFnFA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT DTO to Retronix R-Car V4H Sparrow Hawk
Date: Sun,  7 Sep 2025 18:10:53 +0200
Message-ID: <20250907161130.218470-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a95489918b13fec006e
X-MBO-RS-META: aaxc9spkhtcm8t4pighj8ftjy8sri8if
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_091200_828719_1CCA12D0 
X-CRM114-Status: GOOD (  13.04  )
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

Add DT overlay to bind Argon40 fan HAT, on Retronix R-Car V4H
Sparrow Hawk board. Fan RPM control and full RPM on reboot has
been tested.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
NOTE: Depends on series:
      https://lore.kernel.org/linux-hwmon/20250904202157.170600-1-marek.vasut+renesas@mailbox.org/
---
V2: - Rename the pwm-fan node to pwm-fan-ext to avoid colission
      with existing pwm-fan node in r8a779g3-sparrow-hawk.dts .
      There can be two independent blower fans.
V3: - Add TB from Wolfram
    - Rework the list of hwmon devices in example
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 ++
 .../r8a779g3-sparrow-hawk-fan-argon40.dtso    | 51 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index bef624636d58b..b2325d1ddf9d3 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -96,6 +96,9 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
 
 DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-argon40.dtbo
+r8a779g3-sparrow-hawk-fan-argon40-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-argon40.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-argon40.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
 r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
new file mode 100644
index 0000000000000..c32bd665e50c4
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for the Argon40 HAT blower fan in connector CN7
+ * on R-Car V4H ES3.0 Sparrow Hawk board
+ *
+ * Copyright (C) 2025 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ *
+ * Example usage:
+ *
+ * # Localize hwmon sysfs directory that matches the PWM fan,
+ * # enable the PWM fan, and configure the fan speed manually.
+ * r8a779g3-sparrow-hawk$ ls -1 /sys/devices/platform/pwm-fan-ext/hwmon/hwmon?/pwm?_enable
+ * /sys/devices/platform/pwm-fan-ext/hwmon/hwmon0/pwm1_enable
+ *
+ * # Select mode 2 , enable fan PWM and regulator and keep them enabled.
+ * # For details, see Linux Documentation/hwmon/pwm-fan.rst
+ * r8a779g3-sparrow-hawk$ echo 2 > /sys/devices/platform/pwm-fan-ext/hwmon/hwmon0/pwm1_enable
+ *
+ * # Configure PWM fan speed in range 0..255 , 0 is stopped , 255 is full speed .
+ * # Fan speed 101 is about 2/5 of the PWM fan speed:
+ * r8a779g3-sparrow-hawk$ echo 101 > /sys/devices/platform/pwm-fan-ext/hwmon/hwmon0/pwm1
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	pwm-fan-ext {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		/* PWM period: 33us ~= 30 kHz */
+		pwms = <&pwmhat 0 33334 0>;
+		/* Available cooling levels */
+		cooling-levels = <0 50 100 150 200 255>;
+		fan-shutdown-percent = <100>;
+	};
+};
+
+/* Page 31 / IO_CN */
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	pwmhat: pwm@1a {
+		compatible = "argon40,fan-hat";
+		reg = <0x1a>;
+		#pwm-cells = <3>;
+	};
+};
-- 
2.51.0


