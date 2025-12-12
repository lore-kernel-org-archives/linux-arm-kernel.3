Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD57D43371
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9ATSBSJrLX8nV2+0kSB8PwCrrIZNBcN7n8C9TFO+74=; b=uOoWGAIWAzcpKBZ7LNK0YgOKfm
	flh77Maj2n7QrRzYvt+IYmkCGyCIOoN3q2zGTMrT1vApDa1ppYjcV4DBWbaRAds2ahQ+x9VcQ431v
	gzYODEfJoRYLaoHX373kEQoNH93zqnJG+7JwoY7/LM67OagB3TEU8YgWQ9A/p2whQX2+/tWNlg8VS
	IDH0bzY4mryE8SEueJHyGzidjCcDLETS72eSFqLWZzV/II1bdp6CpvI1sTYfPdvmQDkuSQP3uh48L
	TNAoDRdKVVW8OThE+nLLsPOu97wfYYr+x+z3Bi3EMaW+eNIpPpfIjaF46lK1vWel9lAoSgg5xN/xF
	joAJaG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxmZ-00000000DIu-1Mj8;
	Fri, 12 Dec 2025 07:41:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxmT-00000000DFV-3Voq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 07:41:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 21506C1935F;
	Fri, 12 Dec 2025 07:41:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34F83606DF;
	Fri, 12 Dec 2025 07:41:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96E3A103C8DFE;
	Fri, 12 Dec 2025 08:41:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=f9ATSBSJrLX8nV2+0kSB8PwCrrIZNBcN7n8C9TFO+74=;
	b=N1SpqbfJqH9rsWcVwaflVJSleFEYs6Xym6KfGgEHgHrQ5GxUR184FTUwe+3/cxlB6/VtsK
	wDBPZXEsXubevWDRWECkNOiuCKpDBv3lmpSwBYt11koSNec6RGZhnoZKEPSftpDt9q8Ktm
	OrkeSrvIJzQFD8UJgwK/sH3foLbVytFELFWOfH8q2WncWG0K3nW5LuYV7Nni1/o+HE3nJ7
	VzdBu5faN4O+hXYtfm1xiZppO2vdhzWheSVOmCyw4dz7xFnSdO7CMHusugmnQyrjqA5wuM
	um6T61ZXy/X72NC/h7t0QVHl5+VN7JNCRO7xIPDiCo+Pi2qX9y66+OXkafoh+A==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 12 Dec 2025 08:41:07 +0100
Subject: [PATCH 4/8] dt-bindings: mfd: Add AAEON embedded controller
 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251212-dev-b4-aaeon-mcu-driver-v1-4-6bd65bc8ef12@bootlin.com>
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
X-CRM114-CacheID: sfid-20251211_234138_455746_414358EC 
X-CRM114-Status: GOOD (  11.74  )
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

Add device tree binding documentation for the AAEON embedded controller
(MCU). This microcontroller is found on AAEON embedded boards and provides
system features such as GPIO control, watchdog timer, and LED management.

The MCU is connected via I2C and acts as a multi-function device with
GPIO and watchdog as child nodes.

Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 .../bindings/mfd/aaeon,srg-imx8pl-mcu.yaml         | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..680d06a7e7cb3754bdfc67a1b8c484811eba55d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/aaeon,srg-imx8pl-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AAEON Embedded Controller
+
+maintainers:
+  - Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+  - Thomas Perrot <thomas.perrot@bootlin.com>
+
+description: |
+  AAEON embeds a microcontroller on their embedded boards providing system
+  features such as GPIO control, watchdog timer, and LED management.
+  The MCU is connected via I2C bus.
+
+properties:
+  compatible:
+    const: aaeon,srg-imx8pl-mcu
+
+  reg:
+    maxItems: 1
+
+  gpio:
+    $ref: /schemas/gpio/aaeon,srg-imx8pl-gpio.yaml
+
+  watchdog:
+    $ref: /schemas/watchdog/aaeon,srg-imx8pl-wdt.yaml
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      aaeon_mcu: embedded-controller@62 {
+        compatible = "aaeon,srg-imx8pl-mcu";
+        reg = <0x62>;
+
+        gpio {
+          compatible = "aaeon,srg-imx8pl-gpio";
+          gpio-controller;
+          #gpio-cells = <2>;
+          ngpios = <19>;
+        };
+
+        watchdog {
+          compatible = "aaeon,srg-imx8pl-wdt";
+        };
+      };
+    };

-- 
2.52.0


