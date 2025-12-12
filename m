Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8687AD43375
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 07:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KTFJp4GBF6e0UyvSTrCDMZ0n3vB42aRXVc/F+Pp15I=; b=GDE7Gm6+jKk4IDBBnUnm9lkkB+
	Es3UixgJaqX2678nFV/Up3slCXNeOBDVQxIhJ5ix/ras33TUPC7QW3cWwzLTCd+N2MeRjZfH4HPzI
	Vg6BBKaXPnXcnSQ7jcIWbetLvMlo1X9a1JB7WyiChWmZQBG11lXaC+bTxYNP3I9NLKjP4Pm5iQOVj
	X3kcfcTTP1tUKUG/Y5dOsVHeYOx/M+SGbaL8PmL5P8H2fvXuqfVORXEih8PVO7xfJkXy4YDHBErJ2
	5srWwNsVGc0ITgPk8RJJD6IllS33qnD5WOJeNgvn4TsmwFG5US8vu26Alj55slOqJGAnsP1Vn3E5U
	Qqg/naAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxmY-00000000DIQ-3mNe;
	Fri, 12 Dec 2025 07:41:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxmR-00000000DEq-0dYx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 07:41:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 31FB5C1935D;
	Fri, 12 Dec 2025 07:41:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32DF3606DF;
	Fri, 12 Dec 2025 07:41:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 459DE103C8DF7;
	Fri, 12 Dec 2025 08:41:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3KTFJp4GBF6e0UyvSTrCDMZ0n3vB42aRXVc/F+Pp15I=;
	b=s9BvrZnmkucinAOhUQlG3YtEU1bPxzm06ijVoRb8g/UHd5hkEttd7aK8ZtN7CzGm/EflFs
	zDVXsGoL0EhKNJfRqoXaxgsmilZMKgM7k94ohDxneVy/XGPxZZrcAm17e0XUNv8SDK9rUF
	PbmBn79blgND/mf8eLtfNnbB6QJDMDe5VI9lxEJRqDkq+UgiVkLtoIj3llj1cv3HhajH0B
	7u26nTxrrfxtdNYVzWYnWey+88h1tHpqBMIzeK5aGHH1GGijrpWiegQNJMv2pSIWgrNOkz
	sN9QlklFkjMnxFV4SD3w00vLG8DcnWqfdimINjsAC7IIbCD3aK7jpEfwHNCltA==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 12 Dec 2025 08:41:06 +0100
Subject: [PATCH 3/8] dt-bindings: watchdog: Add AAEON embedded controller
 watchdog binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251212-dev-b4-aaeon-mcu-driver-v1-3-6bd65bc8ef12@bootlin.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_234136_117606_1926E5C6 
X-CRM114-Status: GOOD (  11.84  )
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

Add device tree binding documentation for the watchdog timer functionality
provided by the AAEON embedded controller. The watchdog has a maximum
hardware heartbeat of 25 seconds and supports a timeout of up to 240
seconds through automatic pinging.

The watchdog is defined as a child node of the AAEON MCU device.

Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 .../bindings/watchdog/aaeon,srg-imx8pl-wdt.yaml    | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/aaeon,srg-imx8pl-wdt.yaml b/Documentation/devicetree/bindings/watchdog/aaeon,srg-imx8pl-wdt.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d19a2f4fd38826ff4d1ce6b0b7f12e8b6879445f
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/aaeon,srg-imx8pl-wdt.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/aaeon,srg-imx8pl-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AAEON Embedded Controller Watchdog Timer
+
+maintainers:
+  - Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+  - Thomas Perrot <thomas.perrot@bootlin.com>
+
+description: |
+  Watchdog timer functionality provided by the AAEON embedded controller.
+  The watchdog has a fixed maximum hardware heartbeat of 25 seconds and supports
+  a timeout of 240 seconds through automatic pinging. The timeout is not
+  programmable and cannot be changed via device tree properties.
+
+  The watchdog is a sub-device of the AAEON MCU and must be defined as a
+  child node of the MCU device.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    const: aaeon,srg-imx8pl-wdt
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    watchdog {
+      compatible = "aaeon,srg-imx8pl-wdt";
+    };

-- 
2.52.0


