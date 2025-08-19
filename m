Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AFCCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SqCsknXMXu1IeldEwXpjLyAV6gKojmOFXR8VvOqIes=; b=F+175Am3daTG35Uoiz5W0WtZVC
	3L8NVQ8rGMPwyOAAPCZ6QruMUtYmdI61Y+4cGLTkuF+Q9cgPFYm+BcHSIS4td90mwq9EJmmZTbCGP
	tql89vpsD/dvGEKi8IwKnkxidaBTeFrqPS6HqNXT1QHmsw1nhtiaVqQpU0quIJUVxchKii8Ft0Cmy
	xqkuOnX7HKuZEH0DDWxDkQ1DbOh5Uv9PECDGTHdPuYIsHAeO/1rVxihKZr7GFQl2fXpvQPH5NHxyD
	XArFUqcBnt//HU/wCvXFj3s6GQOMfCIyGDTOvAulnZ6ciT0tPBPjbwE9Bp4UewUWwU26o1BfKRMCH
	4oR175Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNQO-0000000Alhg-0g7k;
	Tue, 19 Aug 2025 14:34:56 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKpl-0000000AKtx-2hX1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:48:58 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-76e2eb3726cso3237933b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604137; x=1756208937; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SqCsknXMXu1IeldEwXpjLyAV6gKojmOFXR8VvOqIes=;
        b=N637TIHbZ3xFuUN/FeDTfr3gSV0MtxfnPINEcY4MZ3Wrt1dfdlQy0kaRDO+/kRW39D
         DkLQd0NbOEqe1O6Jp6e9eiY4iVsvHSpy4fd6a1lNA/nAXd4/L23cLmL4lDjcuj9aKjNA
         lpq+VD1vMo8QrRvAHBmPwqdoh+l+KiH0ZR+impC+lQENhpkmkbPwGDWIfG4J4bT6ZtkX
         La6bP9W6rO8TpNpnFi4IuESnTGR6GgYsMIDxAd92R3dTrCijZpt+UtHUxnwWFhmHMrIx
         JF7UaiHMGXDfXeT1XUyGmNUiynRxQ+DYIg93IhCn84wal3gd76+PesKWIlHKLfPiHw0m
         7uFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604137; x=1756208937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SqCsknXMXu1IeldEwXpjLyAV6gKojmOFXR8VvOqIes=;
        b=B3ofgNHWpBHpPVragCK05Gq8uQt3v9x11htObLIL0nJ2mGi4yuR8fwRFZK3ZmN9egJ
         iF6qpaIagB0Ej7h855D7pqkriU1GnoPRHN+cwJ94lcpMw0WVxFQomc3LKS9HZs41sAni
         7NG2hQRsXwhoEAipQzA7qXxWyPxkcD5Nk186QMLhICvwHB9OfXMF+UCMc8Rgoig5NDvV
         tpnUHn69trDK8XdVdVmW/nHN1OVRujhW1qGHvzVunYUebm4y7XhVranXZVj0dqDfKuIG
         I07jD6ffqe7HmYODTB4gdFrLe/XZT0I6eAbd4+tsaSZ1SK+XjNYdxqQh1OJyA2JzmUSJ
         XViw==
X-Forwarded-Encrypted: i=1; AJvYcCUaksdadQ4y25ZJRGnUHtsTARk8kepEKUBr6DdxebOAXEk9ygRcmdm1QMWcfWUZ7bYtgVImddzGKnulsx3d44PA@lists.infradead.org
X-Gm-Message-State: AOJu0YxD4KW7MIr8ukXt8rdaoABr1WDRoRCySYnzhJkVcKcZoyGFNNSD
	63d2CBuatyGj92quLmyr0c6HXlIz/8BXha60ptZweIgTqI34zhqyeDlU
X-Gm-Gg: ASbGncuu1F3f1R+EvlwrFIggaNV7c9GH9JdvyrSgRdu9OyXp3B7HKJOzQELX1DE1v6X
	KzF6G3ed8PGerrkv0OsU3EM7Ca4kXUgFNXk1IGvSIWK4Xwrubp+ACGwyxX/cZ76fVbxbD0Bboqt
	lQEvbYOTgakPe8GpkXe9HbgxPfA0zNssj9u+5CEGWC6Zdlk1AvCg1sAbLjOG8yHajeql5CMQ4Ir
	xaoI/cV3rd5CjBd3czP3zzpm1PNBduLS0qzSST0Wl5J8325r02v8Z6wH6D22lLQnGQ+ZaIFT51O
	WYuWsvsJZIdh3KBV06059lgAGcO5xIwni1J/DenyTpO5UyjNY42ZX6sap6BF1aibaNWSn7KBuUH
	qoaqS2FrdQFgRaT++EGjYq9HvCMfUueRxKo5W5LNjfESciVqJ4f1pjuCXRQ7huLjI4/BA+jXR5u
	B+5tkFQ2LwodT8RYU=
X-Google-Smtp-Source: AGHT+IGv8XYNQhdMisvhcNFC2QCyy2wLByb+FNRg29NG9SM7abSIzlHCw3nXf5ewYBYJpL+eRz80rw==
X-Received: by 2002:a05:6a20:72a5:b0:232:4a42:dfd1 with SMTP id adf61e73a8af0-2430d420584mr3645255637.36.1755604136875;
        Tue, 19 Aug 2025 04:48:56 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:59 +1000
Subject: [PATCH 7/8] arm64: dts: apple: add common hwmon sensors and fans
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-7-57df6c3e5f19@gmail.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
In-Reply-To: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5299;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=x2fSqlD1a+GhrYf08R4xKoVp1GNK3211Ryioe6NRPdw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvKP7rrxVWf2KXfjsxf5rPefiTo9+UGJ3P+zueWND
 5xe21pd6ChlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAi9+cwMvyZuprz3e4pLMd3
 Ri1pin3ukTOlW/HfRu4/652XOF294tDF8M/oqWp7nJV4iv79g03erLOW/3z1xS5R+oHa9ZB/rZ3
 idYwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_044857_700844_B2BDBF89 
X-CRM114-Status: GOOD (  12.84  )
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

Each Apple Silicon device exposes a unique set of sensors and fans,
however some have been found to be reliably common across devices.

Add these as .dtsi files so that they can be combined with any
device-specific sensors without excessive repetition.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../boot/dts/apple/hwmon-common.dtsi     | 46 +++++++++++++++++++++++++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   | 27 +++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi | 21 +++++++++++
 .../boot/dts/apple/hwmon-laptop.dtsi     | 43 +++++++++++++++++++++++
 .../boot/dts/apple/hwmon-mac-mini.dtsi   | 19 ++++++++++
 5 files changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..b8da8951194d1bce6e55f3558a2f4af8b3bbb45c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardawre monitoring sensors expected to be found on all Apple Silicon devices
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		current {
+			current-ID0R {
+				apple,key-id = "ID0R";
+				label = "AC Input Current";
+			};
+		};
+
+		power {
+			power-PSTR {
+				apple,key-id = "PSTR";
+				label = "Total System Power";
+			};
+			power-PDTR {
+				apple,key-id = "PDTR";
+				label = "AC Input Power";
+			};
+			power-PMVR {
+				apple,key-id = "PMVR";
+				label = "3.8 V Rail Power";
+			};
+		};
+
+		temperature {
+			temperature-TH0x {
+				apple,key-id = "TH0x";
+				label = "NAND Flash Temperature";
+			};
+		};
+		voltage {
+			voltage-VD0R {
+				apple,key-id = "VD0R";
+				label = "AC Input Voltage";
+			};
+		};
+
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..2897f3b7a6a32ad3d31566816a1b237f27dc281d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * SMC hwmon fan keys for Apple Silicon desktops/laptops with two fans
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc {
+	hwmon {
+		fan{
+			fan-F0Ac {
+				label = "Fan 1";
+			};
+
+			fan-F1Ac {
+				apple,key-id = "F1Ac";
+				label = "Fan 2";
+				apple,fan-minimum = "F1Mn";
+				apple,fan-maximum = "F1Mx";
+				apple,fan-target = "F1Tg";
+				apple,fan-mode = "F1Md";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..6d307abd64adef9dda1a64351070968167cc9f3a
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon fan keys for Apple Silicon desktops/laptops with a single fan.
+ *
+ *  Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		fan {
+			fan-F0Ac {
+				apple,key-id = "F0Ac";
+				label = "Fan";
+				apple,fan-minimum = "F0Mn";
+				apple,fan-maximum = "F0Mx";
+				apple,fan-target = "F0Tg";
+				apple,fan-mode = "F0Md";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..f2d473c26526cff89d497b4702323996764973de
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardware monitoring sensors expected on all Apple Silicon laptops
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		power {
+			power-PHPC {
+				apple,key-id = "PHPC";
+				label = "Heatpipe Power";
+			};
+		};
+
+		temperature {
+			temperature-TB0T {
+				apple,key-id = "TB0T";
+				label = "Battery Hotspot Temperature";
+			};
+			temperature-TCHP {
+				apple,key-id = "TCHP";
+				label = "Charge Regulator Temperature";
+			};
+			temperature-TW0P {
+				apple,key-id = "TW0P";
+				label = "WiFi/BT Module Temperature";
+			};
+		};
+
+		voltage {
+			voltage-SBAV {
+				apple,key-id = "SBAV";
+				label = "Battery Voltage";
+			};
+			voltage-VD0R {
+				apple,key-id = "VD0R";
+				label = "Charger Input Voltage";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..f65a3011372bd2bc37f84fad3abcd6ca59e88549
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon sensors expected on all Mac mini models
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc {
+	hwmon {
+		temperature {
+			temperature-TW0P {
+				apple,key-id = "TW0P";
+				label = "WiFi/BT Module Temperature";
+			};
+		};
+	};
+};

-- 
2.50.1


