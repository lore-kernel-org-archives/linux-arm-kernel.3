Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EC0D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCqu8r0CbeFTNPLuen2UFB2zkwpTubmnQXzTm3hV0tY=; b=InMtQMISMsRcLy+mWZR3mdARuj
	J0oKpN5gb0wjyghHhjjEVvrxw2mP8+XLDTeXSi9kNZY+sk/2V3vxMRbDXtd0MG6wZkt+dBfZnp59q
	p6GB50CfFcaWyp/lWAO3etRlJ1/Qmd6NWCqQOss1DxW9nfpoKMSJ3yZbxk3EaTkNPRoxXXYjSzCt3
	4cj5J1KAYN4G7sl9xfMA7rzyB7xv5AHeC1SQOmkr2XnXh2oFyBmT7+alhSo2lBE21zFnaOAyUcQ2E
	2yZ17WrzTW5og9xNF2erOXpkNSMc751kZ5mBsALeUYwVqMAtRr07z6xaeHHs4YIPwr29HQU+ZblWi
	Pj3rqDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV52v-00000003Ntc-2qoU;
	Mon, 15 Dec 2025 09:39:13 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV52t-00000003NrG-18g8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:39:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-29f0f875bc5so42698745ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 01:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791550; x=1766396350; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCqu8r0CbeFTNPLuen2UFB2zkwpTubmnQXzTm3hV0tY=;
        b=baLCJlfdIVjkN9hL0MESpdZWrJ+HN0qEv5s9h7q/FER15e9Tuyp247K+mI7CCXU5Pr
         lPcq3t5xsTdvQxzF2QCF/W718j6+b13PqpfnlNIa3jiTLhCoSt0Pe7EjRaDjRzzvCbwH
         dhWbgvYPTenMYftEGlacvoPTlKK1E/Eoa86lj/1t+80wCbuTBGJz/zrgo20i6mlC4gF1
         ZJ5FwEvlpSF+irExx1yqwmWrXLbW03rg52QwHpKK2vwd2xh9f/+z3OUEAOShiG7A8J1P
         L562ikbMkqj31lKXEB8iBoo+ViW5kyIZwknWnM4lBXC+11jyEtdZtVCS3B9dMcoWTuKn
         6DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791550; x=1766396350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SCqu8r0CbeFTNPLuen2UFB2zkwpTubmnQXzTm3hV0tY=;
        b=n0aaBbmcsCEdFUtuUS+DbkRfKwIAzjKAsdNXA+xxZYZMY6xNNFQrIs36fdR3a1Ne2S
         V6lXQXvVwTdpRWvYWc/nQ2xw9GQZxbPPpsjDDofn2sGlBO5s+C7pMwg4nEI0NgWi+LQ5
         BlwYY6oFkLa3ScNzQl4svM36TKjrsRt/hqS3YwNYTSwVT0oqFMhlkvbWWbyK4F8JaHMZ
         dz8+ZnQ22LNG7Bb30CuWSZoVKOevj5r3JkgI6yE8bN9jiCsqhQkuYO0eO3aO+cMGMVsb
         AdZyuygoxg0Z6LVZ8OIsK7Vbjzf4w7tcc58aGytZYlH7epFTPFjW8ytqrxd8EtltSFkR
         xTxg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Oz9fjJkPbzYs5+GwjYze/85SirtZgBwZ2e3wUs2i3prsoxcVgIBrHGi1af9VWDzrDF4fwPxDWrSoUAL6/2Il@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+uqtVpL3deQ072IehI5uqLoJe1cYjhWGjF/MTR7kJcfeKTcT7
	mle7dXEOsoau7a4xFUsqePZfkacmShmQX4M/rzY/bs7CgVPUNCi4+I+E
X-Gm-Gg: AY/fxX4U0yeMikIShwuK+//HHRFOfIx+tzo9DMszRFSSkHc9orzJu3fzlrpyY1XY2HV
	j1my4GxwYFOtEVerTlRXkSXRLw06cFDxZxEms2RgSncCUkFXn9FG9FEqF1erhmiMZeQM9ccDT4d
	xsoYtbFbjR8t50ARPapqFn9ks39XUhXQx4kN6q+DcBpoGENVMI/lCbmddK9oC/uXQ7+By5MstJY
	UqKIxJhf/UFRzn/m9h841i/7YG9JrbIFukr7HNtnngWzpV8pMYMd1xZZ9luPl0vp70sJ4ttcYMX
	0I2mdx0NWVhwdY7S0jb6QUEdCOiQiKAVG70rCxo9xNzIb/Dxz03UcJpiSHiUHe8yb1cVl5QaPOb
	G4Uaqz0rAbDKZrFQyL+myQv2Ua1zBULmG5gfd91YthTIv10qN7gQ0aU8xXLsYOUzgEw9fKCdMC7
	SrfjQcXd0pzNURRsVnBrTr2fjn/0mPGzr8AS1Z0PhkEoUuhfFDjYbFAWwo+ZmutDvfLhRRgvQkr
	fqsJ8eFCPzkL9lZn+OASPWAQUfvmSR3uDLezc/2fuppDOKnVIPSUbmf5hRC1rYZd2q3jvVsbR0u
	bHE8ztSyzAw4Eg+uruAD5+Ie6L4KcGd72osNZBuwKmURuFv3fIOm5s5aeg/JvQ==
X-Google-Smtp-Source: AGHT+IENGKA6ttYiVSzTZiZopnM0MK0vu/VuTSeOYgYDQUJXX/Vi9BRGghQaxgAgfIzyI5XkyRK2GQ==
X-Received: by 2002:a17:902:d4cb:b0:2a0:b467:a7cf with SMTP id d9443c01a7336-2a0b467ac9amr53044365ad.0.1765791550341;
        Mon, 15 Dec 2025 01:39:10 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:39:10 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:51 +1000
Subject: [PATCH v6 7/7] arm64: dts: apple: t8103, t8112, t60xx: Add hwmon
 SMC subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-7-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12033;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=I/L7r59w5k2aU/ZQyuS0zNrmK3O5J0tVycY6kgw6r9E=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn211nKFkfLL7/7Yp7X/pMLu9OjDaYLOExbFq4RsLjAc
 X3d6kn6HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNQx1jFi4OIUgKl2rGD4H+mU6Mf3tIDvzIx0j7U6ayyUzdju7Mne9IGB//mhMwsaDRkZdoa/3iz
 u+lP3I39d/AE5gWLj+ujJXgmr7f2LCxYyt9/jAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_013911_333550_716E0B0A 
X-CRM114-Status: GOOD (  15.37  )
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

Apple's System Management Controller integrates numerous sensors
that can be exposed via hwmon. Add the subdevice, compatible,
and some common sensors that are exposed on every currently
supported device as a starting point.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../boot/dts/apple/hwmon-common.dtsi     | 33 +++++++++++++++++++++++++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   | 22 +++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi | 17 +++++++++++++
 .../boot/dts/apple/hwmon-laptop.dtsi     | 33 +++++++++++++++++++++++++
 .../boot/dts/apple/hwmon-mac-mini.dtsi   | 15 +++++++++++
 .../arm64/boot/dts/apple/t6001-j375c.dts |  2 ++
 arch/arm64/boot/dts/apple/t6001.dtsi     |  2 ++
 .../arm64/boot/dts/apple/t6002-j375d.dts |  2 ++
 .../arm64/boot/dts/apple/t600x-die0.dtsi |  4 +++
 .../boot/dts/apple/t600x-j314-j316.dtsi  |  3 +++
 .../arm64/boot/dts/apple/t602x-die0.dtsi |  4 +++
 arch/arm64/boot/dts/apple/t8103-j274.dts |  2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts |  3 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts |  2 ++
 arch/arm64/boot/dts/apple/t8103-j456.dts |  2 ++
 arch/arm64/boot/dts/apple/t8103-j457.dts |  2 ++
 arch/arm64/boot/dts/apple/t8103.dtsi     |  5 ++++
 arch/arm64/boot/dts/apple/t8112-j413.dts |  2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts |  2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts |  3 +++
 arch/arm64/boot/dts/apple/t8112.dtsi     |  5 ++++
 21 files changed, 165 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
new file mode 100644
index 000000000000..b87021855fdf
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardware monitoring sensors expected to be found on all Apple Silicon devices
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	current-ID0R {
+		apple,key-id = "ID0R";
+		label = "AC Input Current";
+	};
+	power-PSTR {
+		apple,key-id = "PSTR";
+		label = "Total System Power";
+	};
+	power-PDTR {
+		apple,key-id = "PDTR";
+		label = "AC Input Power";
+	};
+	power-PMVR {
+		apple,key-id = "PMVR";
+		label = "3.8 V Rail Power";
+	};
+	temperature-TH0x {
+		apple,key-id = "TH0x";
+		label = "NAND Flash Temperature";
+	};
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "AC Input Voltage";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
new file mode 100644
index 000000000000..3eef0721bcca
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * SMC hwmon fan keys for Apple Silicon desktops/laptops with two fans
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	fan-F0Ac {
+		label = "Fan 1";
+	};
+	fan-F1Ac {
+		apple,key-id = "F1Ac";
+		label = "Fan 2";
+		apple,fan-minimum = "F1Mn";
+		apple,fan-maximum = "F1Mx";
+		apple,fan-target = "F1Tg";
+		apple,fan-mode = "F1Md";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
new file mode 100644
index 000000000000..fba9faf38f4b
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon fan keys for Apple Silicon desktops/laptops with a single fan.
+ *
+ *  Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	fan-F0Ac {
+		apple,key-id = "F0Ac";
+		label = "Fan";
+		apple,fan-minimum = "F0Mn";
+		apple,fan-maximum = "F0Mx";
+		apple,fan-target = "F0Tg";
+		apple,fan-mode = "F0Md";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
new file mode 100644
index 000000000000..0c4666282a5c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardware monitoring sensors expected on all Apple Silicon laptops
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	power-PHPC {
+		apple,key-id = "PHPC";
+		label = "Heatpipe Power";
+	};
+	temperature-TB0T {
+		apple,key-id = "TB0T";
+		label = "Battery Hotspot Temperature";
+	};
+	temperature-TCHP {
+		apple,key-id = "TCHP";
+		label = "Charge Regulator Temperature";
+	};
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temperature";
+	};
+	voltage-SBAV {
+		apple,key-id = "SBAV";
+		label = "Battery Voltage";
+	};
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "Charger Input Voltage";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
new file mode 100644
index 000000000000..f32627336ae7
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon sensors expected on all Mac mini models
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temperature";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 2e7c23714d4d..08276114c1d8 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -24,3 +24,5 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index ffbe823b71bc..264df90f07d8 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -66,3 +66,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g13c", "apple,agx-g13s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index 2b7f80119618..d12c0ae418f7 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -56,3 +56,5 @@ &bluetooth0 {
 
 /delete-node/ &ps_disp0_cpu0_die1;
 /delete-node/ &ps_disp0_fe_die1;
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index f715b19efd16..e6647c1a9173 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -37,6 +37,10 @@ smc_gpio: gpio {
 			#gpio-cells = <2>;
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		smc_reboot: reboot {
 			compatible = "apple,smc-reboot";
 			nvmem-cells = <&shutdown_flag>, <&boot_stage>,
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index c0aac59a6fae..127814a9dfa4 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -131,3 +131,6 @@ &fpwm0 {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 8622ddea7b44..680c103c1c0f 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -114,6 +114,10 @@ smc_gpio: gpio {
 			#gpio-cells = <2>;
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		smc_reboot: reboot {
 			compatible = "apple,smc-reboot";
 			nvmem-cells = <&shutdown_flag>, <&boot_stage>,
diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1c3e37f86d46..f5b8cc087882 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -61,3 +61,5 @@ &pcie0_dart_2 {
 &i2c2 {
 	status = "okay";
 };
+
+#include "hwmon-mac-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 5b3c42e9f0e6..abb88391635f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -119,3 +119,6 @@ dfr_panel_in: endpoint {
 &displaydfr_dart {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index 97a4344d8dca..491ead016b21 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -41,3 +41,5 @@ &wifi0 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 58c8e43789b4..c2ec6fbb633c 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -75,3 +75,5 @@ &pcie0_dart_1 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index 7089ccf3ce55..aeaab2482d54 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -56,3 +56,5 @@ ethernet0: ethernet@0,0 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 59f2678639cf..f1820bdc0910 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -909,6 +909,10 @@ smc_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			smc_reboot: reboot {
 				compatible = "apple,smc-reboot";
 				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
@@ -1141,3 +1145,4 @@ port02: pci@2,0 {
 };
 
 #include "t8103-pmgr.dtsi"
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 6f69658623bf..500dcdf2d4b5 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -78,3 +78,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 06fe257f08be..11db6a92493f 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -52,3 +52,5 @@ &pcie1_dart {
 &pcie2_dart {
 	status = "okay";
 };
+
+#include "hwmon-mac-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index fb8ad7d4c65a..a0da02c00f15 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -133,3 +133,6 @@ touchbar0: touchbar@0 {
 		touchscreen-inverted-y;
 	};
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 6bc3f58b06f7..c4d1e5ffaee9 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -912,6 +912,10 @@ smc_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			smc_reboot: reboot {
 				compatible = "apple,smc-reboot";
 				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
@@ -1180,3 +1184,4 @@ port03: pci@3,0 {
 };
 
 #include "t8112-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.52.0


