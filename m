Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DCCD72369
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQsPBKPunW2HAhagUIukzpmsZpN0tQ18iuvsF7KTtx8=; b=nAJp5h/g3qx5GlGLhMh1gzp1uc
	GUXB6X09DVkBGs+bzFHFlo5opYCQzr65UL9xP7se5hGKO19l9uxry+33Hysy8jZICmV2qpv3f7Yk9
	Y6KY54729vk528sMBwrj/bJBUezxGVkrhhxP4a6Pl89zvfx1VeGLO6rWsfmNhEyf0K612KONkLyVk
	X0H9X+1gm8FSLTSmsWuGGxY8fQOZc3CUwljmjLdwKDP8Tpah4X33gboq2PB+dPUaBz+XCG5LVqPU0
	6q3pWRAmgs8xW2TW3UbNlkrY2iKp2pyv+Wx0wAge8+uRlV/vmKJqh+uK100758TnXHwYPecaHy6XZ
	W/bEH+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDsi-00000008dwW-2QaJ;
	Fri, 23 Jan 2026 09:55:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDsV-00000008diW-2LAQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:55:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 36CAFC21ABC;
	Fri, 23 Jan 2026 09:54:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 083466070A;
	Fri, 23 Jan 2026 09:54:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4BFE119A87A4;
	Fri, 23 Jan 2026 10:54:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769162092; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iQsPBKPunW2HAhagUIukzpmsZpN0tQ18iuvsF7KTtx8=;
	b=yEuuZRr39/8EWTov4sVs8lOn0NUO/Reqlv/1PGRpEc47bOWY4VYLEEh8i1yvuuQBIa2HFV
	tVLZp++x/PJMXgnfw7zLq7qch3Z5dQUL56S4tzCFNUJQRXrU3gn/mTSZjFk0zRSjjxCpTF
	UKdjvNm/AfSCu0HxPR2qXJjLEW0o8Og21gowc1H6DVy1zFWMl6tUM+DREW7k6EsML7hhRd
	7rgjnfoPW5c2qHWRNq9B1SfymAA08l6I1MWQDtWyfCQjArcIIWhvaFrzqqtDbElAtv5MSQ
	qWgvATi01qFI+vrRrRybPmxp405YxLgy7zxpUKg8Y0Qn+rbZi/mjJgNWDhJtZw==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 23 Jan 2026 10:54:31 +0100
Subject: [PATCH v2 2/5] dt-bindings: mfd: Add AAEON embedded controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260123-dev-b4-aaeon-mcu-driver-v2-2-9f4c00bfb5cb@bootlin.com>
References: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com>
In-Reply-To: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3095;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=bu/rGz3MhaajWznLgOEciCHSKUCgeTXMKmrL1OPdgkM=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpc0Vjlnpb1Zj8yHgaB44y8Q4HE8ao3GhllBMVd
 88O+M5Lbl+JAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCaXNFYwAKCRCfwAsFcf4K
 7azDC/9O03mPqnCCNglsW3Cm342CIzwwud7A2DLA2beGLvhCH4Mr4oT70Lb5OxRHBEHtoV8o5oU
 ToHutcb5gkXjcX4eRHnhcVaO5+CmqGfr1ZR6k4ZgYDANmOwzde4pA0PgeJBNoncZaz1O/pG6n+J
 0FLmbfF6u0TAxE5CUgs6F0ugYRS6Cc1g/VIKcdszyKx9KQgYp0jc3UpgllLjfODxq/C1vCUq3UO
 63I7wXO9L3scytojLvx+H6kNsiJjM3qMnWDNZ8YxRcgEYpbyIORAgCPkAEliwvSFcQzqt514g+h
 ypSxh3FCZ2T0EyOfIer0zFzsVQNq9YJYHBSUW4zTxObwzOLPuueKNZ5TQ9zSMsPfyPEBaD5QGUt
 D6mD7JMmbZ1PfZAjCZLaC5pnQc3kCz8UEgBjEloi1VqZkJwMhb8wTGCcX6vgnReGLLaa6cs1vJc
 U/14k//mM/pJAaxxh9nCyX++YUKHlinQmx8SZEE3okssc31UoqWIAd40DaoGyaLMqLGUc=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_015455_747050_88615E45 
X-CRM114-Status: GOOD (  13.97  )
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
(MCU). This microcontroller is found on AAEON embedded boards, it is
connected via I2C and  and provides a GPIO control and watchdog timer.

Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 .../bindings/mfd/aaeon,srg-imx8pl-mcu.yaml         | 56 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b8eb5bf88853b6eb3d31841e1f6d6acd4b776bd4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
@@ -0,0 +1,56 @@
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
+description:
+  AAEON embeds a microcontroller on Standard RISC Gateway with ARM i.MX8M Plus
+  Quad-Core boards providing GPIO control and watchdog timer.
+
+  This MCU is connected via I2C bus.
+
+  Its GPIO controller provides 7 GPOs and 12 GPIOs.
+
+  Its watchdog has a fixed maximum hardware heartbeat of 25 seconds and supports
+  a timeout of 240 seconds through automatic pinging.
+  The timeout is not programmable and cannot be changed via device tree properties.
+
+properties:
+  compatible:
+    const: aaeon,srg-imx8pl-mcu
+
+  reg:
+    maxItems: 1
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
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-line-names = "gpo-1", "gpo-2", "gpo-3", "gpo-4",
+                  "gpo-5", "gpo-6", "gpo-7",
+                  "gpio-1", "gpio-2", "gpio-3", "gpio-4",
+                  "gpio-5", "gpio-6", "gpio-7", "gpio-8",
+                  "gpio-9", "gpio-10", "gpio-11", "gpio-12";
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c9e416ba74c64e90629c0b7d7941f879c9ac589e..10f7d5b183795376b3fcdedc9c3835eecb9d0a3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -186,6 +186,12 @@ W:	http://www.adaptec.com/
 F:	Documentation/scsi/aacraid.rst
 F:	drivers/scsi/aacraid/
 
+AAEON SRG-IMX8PL CONTROLLER MFD DRIVER
+M:	Thomas Perrot <thomas.perrot@bootlin.com>
+R:	Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.yaml
+
 AAEON UPBOARD FPGA MFD DRIVER
 M:	Thomas Richard <thomas.richard@bootlin.com>
 S:	Maintained

-- 
2.52.0


