Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D3BCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 08:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TnsZ6L300ZKgc1COVNFcUJ5H1mGue0Pdof2dEQV2XRs=; b=qHnNDB5OlXgyP0Je+F917HOb7j
	7szWHmc3Uvb3NlCAnCQ8aTLYCxjBuO7tgaC3nK0RiLnKiMf/krJWBLTVdHfqCcrneVxzMJpNgwzK5
	6C1Uc+mRhMU8KHC2nGkwLtd2DMVJcocgvF51SzghZLgECvcM+kPIhZQ4PeTWNMrX391eHuGglCFbf
	/jQgO9zSy6NGVqVOpkmKBMJUymqXIw+UW6T2idoOp5XkbkGFlGBxM3Dc3v7FfDqnb5TvnB2jF2NhG
	8WOtqseMzMfXRGnkvwHuyk9Aikks50lk5lLAItOw5k3YgVSArAhWx/SOhfgi/1U6ZbSMZ8USATvHb
	AlldOALg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSmd-00000007MVe-3Kda;
	Mon, 25 Aug 2025 08:42:31 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSJE-00000007GX4-42X8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 08:12:10 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-61c46cde065so54062a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 01:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756109527; x=1756714327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TnsZ6L300ZKgc1COVNFcUJ5H1mGue0Pdof2dEQV2XRs=;
        b=Evoor17zti4D4yH8vl55dy5WzTY1AZZ4Kwxg0I4Ld7sCueVgM17ZZVsuLrxtcq4zlS
         hHrpQwvT6O63Xh8wsobs9pNc+RZMf1qazpWiH1CZbV2zvCuF39ctjqxZklBubLCjuUoE
         eSb9n1kNrgMzwxlqBH0TYItHYF8wF2oQkfAfZ7yTgjG9GWNkWy2TxK9IPqHB1R5ziqec
         Gmqsz8N0+O9/hucqdOX43chZZS4sN7rR1le0SDCRy4iu9OdvQCMKaoizEWhQUDVxJh6k
         W6M0woseUKUCZ6k/oS5gvl9FV4UJ5bs2KdgffgfCVLx+wGoFbMs7XhRjSx8Y6NZYf/+W
         OgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756109527; x=1756714327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TnsZ6L300ZKgc1COVNFcUJ5H1mGue0Pdof2dEQV2XRs=;
        b=T6DiV9tzBQw6GKRDXalvXI6YGu/9NzTVtntjL7hYsLc9X6c2ZQ8todDe/sypIozuqG
         H+r2UMq9pAIgeuikcNYY2z47GOXTfo4m9IOQ58y9tiPGnKzi8XtVVrWdN7NfWbp6hJtc
         oTnk+GmnZ5P/yO2K/9pfRaERWrKSgyv86T7b2cANFcxxcZfWe5HqNfcNMHBv74h63Lpc
         SLTJpBek/7SZfZjElOlR84lWcC2Ja0df2IezPZUyEgLcx2QB2krQEwlopVEJHOFbz7eM
         PsfWjx2m8X4m8Xi/yCwZ6xXLW4bDVmQ4ytRmmFYjmx8mz67l3NKMbMx49agFlmPt3DEt
         5TaA==
X-Forwarded-Encrypted: i=1; AJvYcCUmZorUZu0szGlfRxqlFDZpD+gmCKkDLKXl07zyWlTxxv9vtKCKgWQReadDadA27p10hPXazgbaKJ+AhLeqGc/2@lists.infradead.org
X-Gm-Message-State: AOJu0YytwzZeWBnfGaX3qhdI/q/6DxhvHfzGmS9lHHl+nocIaretL/nc
	GyNl8y5kxyjmoCB8yrfG+smby6KKEysH9SLYMxfSAdqNXPrTmJwsfogsijAiydDCq10=
X-Gm-Gg: ASbGnctTw8QPoOWzOu5HqyzxIkr6Yn9M0665Z1WVCadQ5AQoHcwQzGMzKRC4bV0aSUl
	Il+kch4/OTQgt9SO2rt6NMmNaVA2brzzEHghijQ4ZZMjjnTbdfyycy/XI/gEPo0KwW6C5vZyTl8
	bcCy2d7GSLD7E/Fs/7M0Iyua6hZ9VzDr/vzcG95Om3JiPe7uiSIDZNbCyGpCbCx8/0p5RY5MMAR
	6KqmJ6wylwu2JrQQSgH1iOuttDnqSsH/I9P0ixsR8MUlY9wp87sJWZm+pPAf1aC1h170POEoRx+
	j27UI/50gMfeX+vDz9//UuQnBYDoztWuUS36aJIBDVUY0m3km2DIO8ZdLYc3V0c4ON5O8m5Ng0E
	jpx+Q3IDqIORuvkPC2lvyPrMxJa+hNbaYmg==
X-Google-Smtp-Source: AGHT+IGMFHVCfgzqOUh+pGDLejurh3U7hp17R5KFUc6Wa/vTUBiH/N42R6EI9BDD6UgsghTGJU7GvA==
X-Received: by 2002:a05:6402:2748:b0:61c:6855:d917 with SMTP id 4fb4d7f45d1cf-61c6855df51mr1226404a12.6.1756109526816;
        Mon, 25 Aug 2025 01:12:06 -0700 (PDT)
Received: from kuoka.. ([213.244.170.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c312a57e6sm4553003a12.14.2025.08.25.01.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 01:12:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tim Harvey <tharvey@gateworks.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jean Delvare <jdelvare@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Lee Jones <lee@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Nikita Travkin <nikita@trvn.ru>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v3] dt-bindings: mfd: Move embedded controllers to own directory
Date: Mon, 25 Aug 2025 10:12:02 +0200
Message-ID: <20250825081201.9775-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_011209_019419_5F912330 
X-CRM114-Status: GOOD (  15.50  )
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

Move several embedded controller bindings (like ChromeOS EC, Gateworks
System Controller and Kontron sl28cpld Board Management) to new
subdirectory "embedded-controller" matching their purpose.

An embedded controller (EC) is a discrete component that contains a
microcontroller (i.e. a small CPU running a small firmware without
operating system) mounted into a larger computer system running
a fully fledged operating system that needs to utilize the embedded
controller as part of its operation.

So far the EC bindings were split between "mfd" and "platform"
directory.  MFD name comes from Linux, not hardware, and "platform" is a
bit too generic.

Rename Gateworks GSC and Huawei Gaokun filenames to match compatible, as
preferred for bindings.

Acked-by: Michael Walle <mwalle@kernel.org> # for sl28cpld
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Lee,
Can you take it via MFD?
There is a patch on the lists touching kontron,sl28cpld.

Changes in v3:
1. Move more files from "platform" directory.
2. Grow commit msg, based on feedback from Linus.
3. Add Rb (patch changed, though).

Changes in v2:
1. Correct remaining paths in other schemas ($ref and descriptions).
2. Add Ack.

Cc: Mathew McBride <matt@traverse.com.au>
---
 .../{platform => embedded-controller}/acer,aspire1-ec.yaml  | 2 +-
 .../{mfd => embedded-controller}/google,cros-ec.yaml        | 2 +-
 .../gateworks-gsc.yaml => embedded-controller/gw,gsc.yaml}  | 2 +-
 .../huawei,gaokun3-ec.yaml}                                 | 2 +-
 .../{mfd => embedded-controller}/kontron,sl28cpld.yaml      | 2 +-
 .../lenovo,yoga-c630-ec.yaml                                | 2 +-
 .../microsoft,surface-sam.yaml                              | 2 +-
 .../devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml     | 2 +-
 .../devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml   | 2 +-
 .../interrupt-controller/kontron,sl28cpld-intc.yaml         | 2 +-
 .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml         | 2 +-
 .../devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml       | 2 +-
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml   | 4 ++--
 .../devicetree/bindings/sound/google,cros-ec-codec.yaml     | 2 +-
 .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml  | 2 +-
 MAINTAINERS                                                 | 6 +++---
 16 files changed, 19 insertions(+), 19 deletions(-)
 rename Documentation/devicetree/bindings/{platform => embedded-controller}/acer,aspire1-ec.yaml (94%)
 rename Documentation/devicetree/bindings/{mfd => embedded-controller}/google,cros-ec.yaml (99%)
 rename Documentation/devicetree/bindings/{mfd/gateworks-gsc.yaml => embedded-controller/gw,gsc.yaml} (98%)
 rename Documentation/devicetree/bindings/{platform/huawei,gaokun-ec.yaml => embedded-controller/huawei,gaokun3-ec.yaml} (97%)
 rename Documentation/devicetree/bindings/{mfd => embedded-controller}/kontron,sl28cpld.yaml (97%)
 rename Documentation/devicetree/bindings/{platform => embedded-controller}/lenovo,yoga-c630-ec.yaml (95%)
 rename Documentation/devicetree/bindings/{platform => embedded-controller}/microsoft,surface-sam.yaml (92%)

diff --git a/Documentation/devicetree/bindings/platform/acer,aspire1-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/acer,aspire1-ec.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/platform/acer,aspire1-ec.yaml
rename to Documentation/devicetree/bindings/embedded-controller/acer,aspire1-ec.yaml
index 7cb0134134ff..01ee61768527 100644
--- a/Documentation/devicetree/bindings/platform/acer,aspire1-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/acer,aspire1-ec.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/platform/acer,aspire1-ec.yaml#
+$id: http://devicetree.org/schemas/embedded-controller/acer,aspire1-ec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Acer Aspire 1 Embedded Controller
diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/google,cros-ec.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
rename to Documentation/devicetree/bindings/embedded-controller/google,cros-ec.yaml
index 50f457090066..3ab5737c9a8f 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/google,cros-ec.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
+$id: http://devicetree.org/schemas/embedded-controller/google,cros-ec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: ChromeOS Embedded Controller
diff --git a/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml b/Documentation/devicetree/bindings/embedded-controller/gw,gsc.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
rename to Documentation/devicetree/bindings/embedded-controller/gw,gsc.yaml
index dc379f3ebf24..82d4b2dadbae 100644
--- a/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/gw,gsc.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
+$id: http://devicetree.org/schemas/embedded-controller/gw,gsc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Gateworks System Controller
diff --git a/Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/huawei,gaokun3-ec.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
rename to Documentation/devicetree/bindings/embedded-controller/huawei,gaokun3-ec.yaml
index 4a03b0ee3149..cd9e65b6c2ea 100644
--- a/Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/huawei,gaokun3-ec.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/platform/huawei,gaokun-ec.yaml#
+$id: http://devicetree.org/schemas/embedded-controller/huawei,gaokun3-ec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Huawei Matebook E Go Embedded Controller
diff --git a/Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml b/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
rename to Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
index 37207a97e06c..0b752f3baaa9 100644
--- a/Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mfd/kontron,sl28cpld.yaml#
+$id: http://devicetree.org/schemas/embedded-controller/kontron,sl28cpld.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Kontron's sl28cpld board management controller
diff --git a/Documentation/devicetree/bindings/platform/lenovo,yoga-c630-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/platform/lenovo,yoga-c630-ec.yaml
rename to Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml
index 3180ce1a22d4..a029b38e8dc0 100644
--- a/Documentation/devicetree/bindings/platform/lenovo,yoga-c630-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/platform/lenovo,yoga-c630-ec.yaml#
+$id: http://devicetree.org/schemas/embedded-controller/lenovo,yoga-c630-ec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Lenovo Yoga C630 Embedded Controller.
diff --git a/Documentation/devicetree/bindings/platform/microsoft,surface-sam.yaml b/Documentation/devicetree/bindings/embedded-controller/microsoft,surface-sam.yaml
similarity index 92%
rename from Documentation/devicetree/bindings/platform/microsoft,surface-sam.yaml
rename to Documentation/devicetree/bindings/embedded-controller/microsoft,surface-sam.yaml
index b33d26f15b2a..9202cfca0b35 100644
--- a/Documentation/devicetree/bindings/platform/microsoft,surface-sam.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/microsoft,surface-sam.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/platform/microsoft,surface-sam.yaml#
+$id: http://devicetree.org/schemas/embedded-controller/microsoft,surface-sam.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Surface System Aggregator Module (SAM, SSAM)
diff --git a/Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml b/Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
index b032471831e7..02663d67eac7 100644
--- a/Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
@@ -11,7 +11,7 @@ maintainers:
 
 description: |
   This module is part of the sl28cpld multi-function device. For more
-  details see ../mfd/kontron,sl28cpld.yaml.
+  details see ../embedded-controller/kontron,sl28cpld.yaml.
 
   There are three flavors of the GPIO controller, one full featured
   input/output with interrupt support (kontron,sl28cpld-gpio), one
diff --git a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
index 010333cb25c0..5803a1770cad 100644
--- a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
+++ b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
@@ -11,7 +11,7 @@ maintainers:
 
 description: |
   This module is part of the sl28cpld multi-function device. For more
-  details see ../mfd/kontron,sl28cpld.yaml.
+  details see ../embedded-controller/kontron,sl28cpld.yaml.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
index e8dfa6507f64..87df07beda59 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
@@ -11,7 +11,7 @@ maintainers:
 
 description: |
   This module is part of the sl28cpld multi-function device. For more
-  details see ../mfd/kontron,sl28cpld.yaml.
+  details see ../embedded-controller/kontron,sl28cpld.yaml.
 
   The following interrupts are available. All types and levels are fixed
   and handled by the board management controller.
diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
index f7bc84b05a87..8f5a468cfb91 100644
--- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
@@ -14,7 +14,7 @@ description: |
   Google's ChromeOS EC PWM is a simple PWM attached to the Embedded Controller
   (EC) and controlled via a host-command interface.
   An EC PWM node should be only found as a sub-node of the EC node (see
-  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml).
+  Documentation/devicetree/bindings/embedded-controller/google,cros-ec.yaml).
 
 allOf:
   - $ref: pwm.yaml#
diff --git a/Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml b/Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
index 981cfec53f37..19a9d2e15a96 100644
--- a/Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
@@ -11,7 +11,7 @@ maintainers:
 
 description: |
   This module is part of the sl28cpld multi-function device. For more
-  details see ../mfd/kontron,sl28cpld.yaml.
+  details see ../embedded-controller/kontron,sl28cpld.yaml.
 
   The controller supports one PWM channel and supports only four distinct
   frequencies (250Hz, 500Hz, 1kHz, 2kHz).
diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index adc6b3f36fde..179c98b33b4d 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -58,7 +58,7 @@ properties:
     maxItems: 1
 
   cros-ec-rpmsg:
-    $ref: /schemas/mfd/google,cros-ec.yaml
+    $ref: /schemas/embedded-controller/google,cros-ec.yaml
     description:
       This subnode represents the rpmsg device. The properties
       of this node are defined by the individual bindings for
@@ -126,7 +126,7 @@ patternProperties:
         maxItems: 1
 
       cros-ec-rpmsg:
-        $ref: /schemas/mfd/google,cros-ec.yaml
+        $ref: /schemas/embedded-controller/google,cros-ec.yaml
         description:
           This subnode represents the rpmsg device. The properties
           of this node are defined by the individual bindings for
diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
index 1434f4433738..dd51e8c5b8c2 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
@@ -15,7 +15,7 @@ description: |
   Embedded Controller (EC) and is controlled via a host-command
   interface.  An EC codec node should only be found inside the "codecs"
   subnode of a cros-ec node.
-  (see Documentation/devicetree/bindings/mfd/google,cros-ec.yaml).
+  (see Documentation/devicetree/bindings/embedded-controller/google,cros-ec.yaml).
 
 allOf:
   - $ref: dai-common.yaml#
diff --git a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
index 179272f74de5..872a8471ef65 100644
--- a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
@@ -11,7 +11,7 @@ maintainers:
 
 description: |
   This module is part of the sl28cpld multi-function device. For more
-  details see ../mfd/kontron,sl28cpld.yaml.
+  details see ../embedded-controller/kontron,sl28cpld.yaml.
 
 allOf:
   - $ref: watchdog.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 7969d09dff17..ef41ae022a36 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10129,7 +10129,7 @@ F:	drivers/media/i2c/gc2145.c
 GATEWORKS SYSTEM CONTROLLER (GSC) DRIVER
 M:	Tim Harvey <tharvey@gateworks.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
+F:	Documentation/devicetree/bindings/embedded-controller/gw,gsc.yaml
 F:	Documentation/hwmon/gsc-hwmon.rst
 F:	drivers/hwmon/gsc-hwmon.c
 F:	drivers/mfd/gateworks-gsc.c
@@ -11300,7 +11300,7 @@ F:	drivers/net/ethernet/huawei/hinic3/
 HUAWEI MATEBOOK E GO EMBEDDED CONTROLLER DRIVER
 M:	Pengyu Luo <mitltlatltl@gmail.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
+F:	Documentation/devicetree/bindings/embedded-controller/huawei,gaokun3-ec.yaml
 F:	drivers/platform/arm64/huawei-gaokun-ec.c
 F:	drivers/power/supply/huawei-gaokun-battery.c
 F:	drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -23177,10 +23177,10 @@ F:	drivers/usb/misc/sisusbvga/
 SL28 CPLD MFD DRIVER
 M:	Michael Walle <mwalle@kernel.org>
 S:	Maintained
+F:	Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
 F:	Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
 F:	Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
-F:	Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
 F:	Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
 F:	Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
 F:	drivers/gpio/gpio-sl28cpld.c
-- 
2.48.1


