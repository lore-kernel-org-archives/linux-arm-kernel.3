Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DA8CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WT7vuW0qUznHG/v/TvOsEbv5pheChsn5Mb8ce2CH7oc=; b=06e504lbIBA+QNlrpBLUZI1m4h
	PwJz+xgzG+x9aBRr/7zZhlOs6Oz4lCmiU84Y+uK/HPwCvHHPSjn2wEQl3WYsC4bLPvSMptn+VzAPQ
	a5gY6Oenf7wnZCWJSkcCNPfHoHlf/iL637N6SkOgeR9cOxWHf2rmIFavT4yXs2kDbfPij3c7hEMBy
	WmUYT1XS3jq3qwxfoZ/7WTVhUV2sltkW2h0uc8I1yWVcdv8Yr17SCrHdhxqkfI0MgeUJ7NH3o0Zed
	YcMA708bxUkLmfS8VYStZv7C8bA2xXxXQBlKw4bhxfHbPlhrDe3rRV03McgtpfylkcVlwXVRwjIs3
	sQ93eESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIOY-0000000Fy53-17DD;
	Wed, 27 Aug 2025 15:49:06 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEG0-0000000FFf4-19Wk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 11:24:01 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77057c4d88bso3027589b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293839; x=1756898639; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WT7vuW0qUznHG/v/TvOsEbv5pheChsn5Mb8ce2CH7oc=;
        b=VzC9ru9Cp0D5u9SXJLg+1TD21ohOGfbnXCmbr0fXxBMV1NXVec6hWb3SYL9HhU5NoN
         QpmIl7EjHP3SSU8Q0i0JP0JZqLbvzdfw9LBFodFnqTz+/MRESewafwBKJgKG50QT4DTn
         9KFR+qh4OKoTrY6lSZVCiFB+Se4X7DS2+H2KrDha6Oa60CfKffrODKn9UtZSDANLPpH1
         4cdD/2MOHANOILqn7/WZgbzhVL1pdWShgt7wQjHsEbGszXRSsU68erHfXKLMRgLKzP0g
         8yL03HXBcUa191+6qK2/srx+FLwhvoR+3EWCyZ/M4r6a+SDomQxLLnQG3djigbBwB+KB
         vHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293839; x=1756898639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WT7vuW0qUznHG/v/TvOsEbv5pheChsn5Mb8ce2CH7oc=;
        b=sB3tBzL9WPpNZkgHl3zjdASy1YZGBc5hYIIrDaQFbBMOHHaZw6T5ymCMWnGQHPc6V4
         fS3sPyY4y8gaUYlJdlEfuNUWIfAAM99FHDyEfkVIBr2r+tuX974Ex0AVfl4K6nwkM2jK
         t9LFq/JxSr0atYLBIhMKMPD146JQVRxt3WArNQU6cWaRWHPXQL4P8IgpPW8oyMFtsWwP
         3FU/Xoo1AFatrx+0B92m3W6rkD6XUGYJT8g/CR6RmsluvZPWHYDlQcKp8j7vUBpdC0c1
         SWhLJ3Hm4c6o8L0QuGc9eG5BaJPlq+7BL/98qdQ3wp6UvBlqkSKzrkhfIPtPpSX62CZt
         X5KQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1rpPHSWBttImzREV/bOwwyY4HUprMqxJKnVi3SUMC5LmpJmcA9nnN1lvxiW7GVyV5+FmkzIR3RFyRwpijcd0u@lists.infradead.org
X-Gm-Message-State: AOJu0YxuqqRCjphz6EGAE4DHtVBC0n4U6NQ6AXn9mGUF4JsY/qDAlOYp
	1JPVOHfvCAQOpPzGrAqQm7w739imw7xu9/282LBWv8Avnq3pCWo25zK1
X-Gm-Gg: ASbGncvKfBfOTvLzXjyMK2P70LtTqdyPTigEv9woXftQmuwf0XzsZtsGDhmrRDb3OfM
	FtR4e9+aDlbRqbEP3CcMgUtslzBRMO/2QYJkw2q1SWOpjSNjoGsEll3f2QWn71eFp6dEYRQtc5o
	dMAbgfyL8+JDVaLhPTFpIQCefOli3LmH89VVKj6H+K/bRlivUtrCdki2Oe59BN2XkVel4uQVy/1
	vp/qvwmVg9XZsB25mR/Km+iA0IsFZIHQY0KsRpMxPHsfTcIGAcqgFF/261E4eNzNXiZZxlorH8x
	Dy4KiMNcFKZExJ7CDOHH6/U5lBPJ5dROeD8rXv3SlfPXi7jYWQXbsA7AhRJTKWirhOe1QgCrZkU
	sH4CF5amRvw7bwpIVXMNe8bcdbd2FtQyQ3TwaRYPSnDJJmr/24SzG82jQ5U8YGG1CprEXClWk1n
	hG3ZwZ6iXxGGS3SxMX
X-Google-Smtp-Source: AGHT+IHcxdwpHkhgx4bx6bhCCrhmDPbhWf5p9x/BFk1Qsu0LkH89VOH4xmT8ZfSWgNKLsJylxiDZxw==
X-Received: by 2002:a17:903:1ac6:b0:248:614c:b8ca with SMTP id d9443c01a7336-248614cbc2emr74240555ad.48.1756293839333;
        Wed, 27 Aug 2025 04:23:59 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:59 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:44 +1000
Subject: [PATCH v2 10/11] arm64: dts: apple: Add common hwmon sensors and
 fans
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-10-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5045;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Z3EXP1oVeh319IixHdWS8udDApNWGWy/kj1Vo/lfXn8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjW772R/fPBE58YpzUVnanXkNGvM6h+v9QhJrJoX0
 erR9DWgo5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIksl2D473I3yzi8O72BMZbd
 7MfEY2c85P5Gqk7UTp2zUVGptp9lDyPD/Tjt3Y/zf5r0HU2Q6bvscmfhNFe/7jNlfRk8nuu3npV
 hBgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_042400_335696_56E8BCA3 
X-CRM114-Status: GOOD (  12.11  )
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
 .../boot/dts/apple/hwmon-common.dtsi     | 37 +++++++++++++++++++++++++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   | 24 ++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi | 19 +++++++++++++
 .../boot/dts/apple/hwmon-laptop.dtsi     | 35 +++++++++++++++++++++++
 .../boot/dts/apple/hwmon-mac-mini.dtsi   | 17 ++++++++++++
 5 files changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..bac4e44d3f9892fe8ad04125e47dcccb2bcf57a0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardawre monitoring sensors expected to be found on all Apple Silicon devices
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		compatible = "apple,smc-hwmon";
+
+		current-ID0R {
+			apple,key-id = "ID0R";
+			label = "AC Input Current";
+		};
+		power-PSTR {
+			apple,key-id = "PSTR";
+			label = "Total System Power";
+		};
+		power-PDTR {
+			apple,key-id = "PDTR";
+			label = "AC Input Power";
+		};
+		power-PMVR {
+			apple,key-id = "PMVR";
+			label = "3.8 V Rail Power";
+		};
+		temperature-TH0x {
+			apple,key-id = "TH0x";
+			label = "NAND Flash Temperature";
+		};
+		voltage-VD0R {
+			apple,key-id = "VD0R";
+			label = "AC Input Voltage";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..f81047725de473b85d8f337af63fa10d3aa827a0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -0,0 +1,24 @@
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
+		fan-F0Ac {
+			label = "Fan 1";
+		};
+		fan-F1Ac {
+			apple,key-id = "F1Ac";
+			label = "Fan 2";
+			apple,fan-minimum = "F1Mn";
+			apple,fan-maximum = "F1Mx";
+			apple,fan-target = "F1Tg";
+			apple,fan-mode = "F1Md";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..ae5e1a54b6b780ff880ca0a39bc2712d8cbafbe4
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon fan keys for Apple Silicon desktops/laptops with a single fan.
+ *
+ *  Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		fan-F0Ac {
+			apple,key-id = "F0Ac";
+			label = "Fan";
+			apple,fan-minimum = "F0Mn";
+			apple,fan-maximum = "F0Mx";
+			apple,fan-target = "F0Tg";
+			apple,fan-mode = "F0Md";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..227dc5065bb2b74d9699019b71eed90501e1b4b1
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardware monitoring sensors expected on all Apple Silicon laptops
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		power-PHPC {
+			apple,key-id = "PHPC";
+			label = "Heatpipe Power";
+		};
+		temperature-TB0T {
+			apple,key-id = "TB0T";
+			label = "Battery Hotspot Temperature";
+		};
+		temperature-TCHP {
+			apple,key-id = "TCHP";
+			label = "Charge Regulator Temperature";
+		};
+		temperature-TW0P {
+			apple,key-id = "TW0P";
+			label = "WiFi/BT Module Temperature";
+		};
+		voltage-SBAV {
+			apple,key-id = "SBAV";
+			label = "Battery Voltage";
+		};
+		voltage-VD0R {
+			apple,key-id = "VD0R";
+			label = "Charger Input Voltage";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..6344deff06ebb9c1b0fbbf6b986db879eb5f19cc
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
@@ -0,0 +1,17 @@
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
+		temperature-TW0P {
+			apple,key-id = "TW0P";
+			label = "WiFi/BT Module Temperature";
+		};
+	};
+};

-- 
2.51.0


