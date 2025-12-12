Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D5FD43377
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 07:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezHaG49ifLrG8L8qfzPELOpOD4DZDpPJpVprvXJHmRw=; b=NC99XgobRzFC8Ljl7/0MuuDAJD
	FrlxHdjDDfO7YqT5LZq3OAPmr4MGQfpnDqoHznboU5WMBioQXlHCdjLO+Bnr4h/ikGaPgklbmvKjP
	THO5yb9oj+Q8NvQkADiXOw7Uz0mLnbuvTbR+OFghb7MgZcYxkBMrd82TIuLwHLV+iba8Z7xlIq0be
	tCTyu4HsF0uQyU2TAtXOu6plf8MeCKr522tPf8IJBgHhQkVCsdvHAbLgJUMKpCQuw3/DxyRl50i/p
	7pB1p/NyS/duPixU4nLFwyVWtBWFWO3Iqs7DX995jHEageKnSB7rwaR1cvx/9nby9cHzOiHpxFTDx
	JNHbsepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxmY-00000000DI4-2E3J;
	Fri, 12 Dec 2025 07:41:42 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxmN-00000000DE8-1pxu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 07:41:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 090544E41BA8;
	Fri, 12 Dec 2025 07:41:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D305A606DF;
	Fri, 12 Dec 2025 07:41:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDBD6103C8DFF;
	Fri, 12 Dec 2025 08:41:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ezHaG49ifLrG8L8qfzPELOpOD4DZDpPJpVprvXJHmRw=;
	b=uAi5XxefYNgnNq+TWibxsdUF2UesQTOsVqW2gubwawMkbAuuPScMMEVLXiQmW7RXhFx9AX
	2MRPyqxSEFQUMJSwH+lSqCn3S7cnM0uy2VpCcwXZoK2ncLVK8QKbQcKYts+ktJjLfsYRO8
	//OXcZraR9+5QRKSLbhEAZmQzcTeejGykxI5e1ZCOEzNx7Xz7v9mJZ2rGvo6znQcAwLiFH
	Zr1q9x0xhigRth1yEqs1HRFujjFgdLOMU/HBTk2Utr+SqIJoRan8y/5UtD5Fh0DMCMrM5i
	FmzJUN9stiwRnt23jBuq47ySPfcaG8AVYV0HtPFkTOuSfdGMvykZiAPBnAUoIQ==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 12 Dec 2025 08:41:05 +0100
Subject: [PATCH 2/8] dt-bindings: gpio: Add AAEON embedded controller GPIO
 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251212-dev-b4-aaeon-mcu-driver-v1-2-6bd65bc8ef12@bootlin.com>
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
X-CRM114-CacheID: sfid-20251211_234131_609105_DB2714A7 
X-CRM114-Status: GOOD (  12.23  )
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

Add device tree binding documentation for the GPIO controller functionality
provided by the AAEON embedded controller. This controller provides 7 GPOs
and 12 GPIOs for a total of 19 GPIO lines.

The GPIO controller is defined as a child node of the AAEON MCU device.

Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 .../bindings/gpio/aaeon,srg-imx8pl-gpio.yaml       | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/aaeon,srg-imx8pl-gpio.yaml b/Documentation/devicetree/bindings/gpio/aaeon,srg-imx8pl-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8040dc0a36ee5650488520c2218f09fd08cdf64a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/aaeon,srg-imx8pl-gpio.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/aaeon,srg-imx8pl-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AAEON Embedded Controller GPIO
+
+maintainers:
+  - Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+  - Thomas Perrot <thomas.perrot@bootlin.com>
+
+description: |
+  GPIO controller functionality provided by the AAEON embedded controller.
+  This controller provides 7 GPOs and 12 GPIOs.
+
+  The GPIO controller is a sub-device of the AAEON MCU and must be defined
+  as a child node of the MCU device.
+
+properties:
+  compatible:
+    const: aaeon,srg-imx8pl-gpio
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      The first cell is the GPIO number (0-6 for GPOs, 7-18 for
+      general-purpose GPIOs).
+      The second cell is the GPIO flags as defined in
+      <dt-bindings/gpio/gpio.h>.
+
+  ngpios:
+    description: |
+      Total number of GPIOs available (GPOs + GPIOs).
+      This should be 19 (7 GPOs + 12 GPIOs).
+    const: 19
+
+required:
+  - compatible
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio {
+      compatible = "aaeon,srg-imx8pl-gpio";
+      gpio-controller;
+      #gpio-cells = <2>;
+      ngpios = <19>;
+    };

-- 
2.52.0


