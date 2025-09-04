Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D76CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gu9QfSR06q9gQse2ZBICxJa2UFCZpC56QqcslqucwuE=; b=H6XH40wG4XqL3eTcMV7eFiUEGl
	PXPqPQ3STyE96OSc6EXZzGKYf9oMHh8aEPHZcLhGq4ro8o78846ltACQQXYEZsNprAQoXkrafA6Dq
	gX2Ssma/Q0GsVHKI1FHBJ/ancnX9yKE+W/QyHrPY34cxgkyx9Tg1zEI3vHvu+h2r32CEpXITRe3fd
	tUTnEQivp36GwiTGr3R1I5fZpzyZe1Xm+Vo49P2o27ilmbx6rOthOQjL5yU9YEZwqPYk1p8jVNh8P
	R8rQyan8Wltr9tp4Q7QGVQv2z7jcKU58Drf1MYL4IxOPWFpiA1eOJyE5uxc6yKogA3FXprEBZwWiL
	CTYvUlZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM36-0000000G1ko-27TU;
	Fri, 05 Sep 2025 02:19:36 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGq4-0000000EMgV-0izf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 20:45:49 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cHs223M9sz9t9t;
	Thu,  4 Sep 2025 22:45:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757018746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gu9QfSR06q9gQse2ZBICxJa2UFCZpC56QqcslqucwuE=;
	b=jIfxdcwKB+041GOrNihkdrUbdB6SkGFw3SbztFhDhSLSJUuAML7CYPCYUit2HJ8hOiWIGU
	4/kRY5JDoKnljd4oG66MWWiCWVdTiBSBX2kZDdg1JUDNgpF+AXskBlyUeg04/YerW1uErK
	lyPgNd3mgNayTVD/nMEmnD3FFanTzrGzHmWNfHqZS5mX294TW5bl+CrLGjYBNwF4iSb85S
	b8joR/ojgf0Dz+VUJdj7FSBRgiqdXkf1oqQz/ciHFIJ7oVYjtxJX8yy7zKUPEWBt6U7FR0
	2DFTrK1bXeIOqhli5vzI5+BkWBcpSQ94FrxnP3GrrknvnRnfvnwF05ySBq45Sg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=kFZ6fULo;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757018744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gu9QfSR06q9gQse2ZBICxJa2UFCZpC56QqcslqucwuE=;
	b=kFZ6fULolcuNmXOd+8DAb3Rgtphasmqs2mkaZM+AN+iSWWizXzRwC4GLRflBDq2JQtNmKm
	I02AYhkyfG+DAs6ue/62esVrXWkVUB3gLbtyyO8Ag2jn3M4aHc/iIqsGe0ehFYpW+V1+iD
	E7OR24FDKcX2sB5yK0U49FVAc7RO3Yb/qU79MoZTgAt2hvk3u/xrQo8mT7GJJEJPB091AU
	hUqq++vzjudawhGxNO9nyl0Rpi/z1G8o7L2gn6ZwR3LW5x675Ksq3s5ixf+GVZcsLonBOa
	BpTHI0zefb+l7iJfJ/QLI7qY2zWhB4Zk6UAqWOw+/tTr7d1s8gqCB3VnF4tMWA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT DTO to Retronix R-Car V4H Sparrow Hawk
Date: Thu,  4 Sep 2025 22:44:56 +0200
Message-ID: <20250904204522.180439-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c5fb2a05ee80b534582
X-MBO-RS-META: w3o1ifttorfcjdp54tt1zupytisdirwx
X-Rspamd-Queue-Id: 4cHs223M9sz9t9t
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_134548_362007_0DE9BAA6 
X-CRM114-Status: GOOD (  12.59  )
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
 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 .../r8a779g3-sparrow-hawk-fan-argon40.dtso    | 56 +++++++++++++++++++
 2 files changed, 59 insertions(+)
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
index 0000000000000..e63fd3e18b2a1
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
@@ -0,0 +1,56 @@
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
+ * r8a779g3-sparrow-hawk$ grep -H . /sys/class/hwmon/hwmon?/name
+ * /sys/class/hwmon/hwmon0/name:sensor1_thermal
+ * /sys/class/hwmon/hwmon1/name:sensor2_thermal
+ * /sys/class/hwmon/hwmon2/name:sensor3_thermal
+ * /sys/class/hwmon/hwmon3/name:sensor4_thermal
+ * /sys/class/hwmon/hwmon4/name:pwmfan
+ *                       ^      ^^^^^^
+ *
+ * # Select mode 2 , enable fan PWM and regulator and keep them enabled.
+ * # For details, see Linux Documentation/hwmon/pwm-fan.rst
+ * r8a779g3-sparrow-hawk$ echo 2 > /sys/class/hwmon/hwmon4/pwm1_enable
+ *
+ * # Configure PWM fan speed in range 0..255 , 0 is stopped , 255 is full speed .
+ * # Fan speed 101 is about 2/5 of the PWM fan speed:
+ * r8a779g3-sparrow-hawk$ echo 101 > /sys/class/hwmon/hwmon4/pwm1
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	pwm-fan {
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
2.50.1


