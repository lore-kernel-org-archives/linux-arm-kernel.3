Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A85CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BqZ1XmFUt/xzyYk/wX7NCuk9uo6ckDaycK0e8faI0Ss=; b=STvOhajnUf60tPB9vgIh0AVLfX
	xO0LSN3Y0hTwRTkZGwxqbT4yR9D1HjH6TdlUxjBpTTWb77VwHsLuuglkc1p8fnltCx4aEu1vByU8A
	kK4z9MyBzRqT2BzZywtLEvwl4w5DP9w1CUxsaxLmClKFe7eopJbs4yJpAB487jtxoEQBr0T3X1XdG
	MXXDGYBR3p2ThgV9Yc4Fa1uhZQnYKAg6I/t6CoZf4OnZK8buQnNBjXYAxQYBHxNYnUHAwGhJZp9fR
	1kqpoASqdEa4V8mz2lJ1PRrZnV1RJkL7MuMx7b99QGvc4ydBNUK/Hp2Ul8t5MmdKQCamE61iibhg0
	jbkTtAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM2c-0000000G0zb-2zYD;
	Fri, 05 Sep 2025 02:19:06 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG8f-0000000E7iB-27cC;
	Thu, 04 Sep 2025 20:00:58 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cHr2F4cDhz9spZ;
	Thu,  4 Sep 2025 22:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BqZ1XmFUt/xzyYk/wX7NCuk9uo6ckDaycK0e8faI0Ss=;
	b=dqZDuI2S8GZkr3bl0/3ab2Kpccyr+8/YTndb2WHtDWdw6XoKyYKS4rn9svcCiPLG94edzP
	6wyWs/tl+a3CLwDOKtfsJHPXPtlQSiL6IYPkdwWTbKdaEc3WJBrp3vg6r4CxUfwXbtZTp2
	SxxZ8Twl4lfgIWfTBEX6E40vvp50u+9e44qrO4rJasw+T5xi6/4HYtffa0vVVUWW99CGiV
	aRz5tUXO0tZVnKYJKZtEZk/pc7f01nS78cqoQwR7FKnrOOfwcbFQ4kKd/wATPwQMIU3eS7
	N5OzmR0kR6VJWD2OSKMi/KQ0H7Avg4Xo5sYgmebvR2QFMC15gyLffBEhIa0TUQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BqZ1XmFUt/xzyYk/wX7NCuk9uo6ckDaycK0e8faI0Ss=;
	b=LmBfcudHz5D8daXdqVkUFpNyG+KArCs6QvjYLZE77lezOiTjHTs1oDxnur56NuQPKml3wv
	9upjjbVr7nXqJnSBROSGF28wb4K44XQ8ADiqZGvu90u4mn26hK/DG6BVldr3IRUhTTSp7O
	MjtnhEZ/1oyAsvVWp8ZKcd/H7YBBtuGDLhX/WLYjbHa7nVYH3FrYGvRwUy7sBrBFbRg7FT
	bPvCYElwdJzfOJqrEJEgTS8NvVhlZ8YlsgeuBXYLlxzOIfSkQ65BVkrX4fDI9lJwvETnMa
	CxbgI0uLFGPt/tjUwVCRKSLM3s4Gdw1zmxbA3SszZlJ0D8xWiBC2KWMCtqMutw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi 720x1280 v2 binding
Date: Thu,  4 Sep 2025 21:58:26 +0200
Message-ID: <20250904200036.168222-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2d87d269ba95a788730
X-MBO-RS-META: y5mfi1zxmpkaxpaxjbs8gahu5c69ye1i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_130057_691002_99450904 
X-CRM114-Status: GOOD (  16.54  )
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

The 5" and 7" Raspberry Pi 720x1280 Display 2 MCU is a bit more
complex than the original Display 1 ATTINY88 and the binding is
also a bit more demanding. Split the binding into separate file
and fill in required gpio-controller, #gpio-cells and #pwm-cells
which must be present for the V2 MCU. Include mention of the 5"
panel in the description of Display 2, as the 5" panel uses the
same MCU.

Fixes: 6d09c6e474bd ("regulator: dt-bindings: rpi-panel: Add regulator for 7" Raspberry Pi 720x1280")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 ...,7inch-touchscreen-panel-regulator-v2.yaml | 61 +++++++++++++++++++
 ...ypi,7inch-touchscreen-panel-regulator.yaml |  7 +--
 2 files changed, 63 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml

diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
new file mode 100644
index 0000000000000..efc7815a136b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi 5" and 7" display V2 MCU-based regulator/backlight controller
+
+maintainers:
+  - Marek Vasut <marek.vasut+renesas@mailbox.org>
+
+description: |
+  The RaspberryPi 5" and 7" display 2 has an MCU-based regulator, PWM
+  backlight and GPIO controller on the PCB, which is used to turn the
+  display unit on/off and control the backlight.
+
+allOf:
+  - $ref: regulator.yaml#
+
+properties:
+  compatible:
+    const: raspberrypi,touchscreen-panel-regulator-v2
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+  "#gpio-cells":
+    const: 2
+    description:
+      The first cell is the pin number, and the second cell is used to
+      specify the gpio polarity (GPIO_ACTIVE_HIGH or GPIO_ACTIVE_LOW).
+
+  "#pwm-cells":
+    const: 3
+    description: See ../../pwm/pwm.yaml for description of the cell formats.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - "#pwm-cells"
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      gpio@45 {
+        compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+        reg = <0x45>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        #pwm-cells = <3>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
index 18944d39d08fc..41678400e63fa 100644
--- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
@@ -12,17 +12,14 @@ maintainers:
 description: |
   The RaspberryPi 7" display has an ATTINY88-based regulator/backlight
   controller on the PCB, which is used to turn the display unit on/off
-  and control the backlight. The V2 supports 5" and 7" panels and also
-  offers PWM backlight control.
+  and control the backlight.
 
 allOf:
   - $ref: regulator.yaml#
 
 properties:
   compatible:
-    enum:
-      - raspberrypi,7inch-touchscreen-panel-regulator
-      - raspberrypi,touchscreen-panel-regulator-v2
+    const: raspberrypi,7inch-touchscreen-panel-regulator
 
   reg:
     maxItems: 1
-- 
2.50.1


