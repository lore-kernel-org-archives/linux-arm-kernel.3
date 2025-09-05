Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC6FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VyVXJQZw/VxE1DIAGqJZQM99zmZvXcM4HzMm4Zo+WyQ=; b=etVHvhYW8etnP/obp3sTOYsZqg
	0WhH/pNu2mWtgWB5rOFxe5x2xEszi3cfkcYK+opUPFzBo8rZIDYUi2+GsHbm15I47YcnevAO0jYOo
	4t5AbXVXfGdR0h9PnFbhgP6/AwecXVEyutuAv5wW/Wb532eh5gdnxCCQfc79g9t1vHYq8FkmtzdPZ
	nLGWCs6/tSv9kkU92n93EdrZhaZefoM+xtZureErBHvba1muK6D2xABzALBnQ6j/VD6KFV2ip6xaP
	Hv7ByYzMPioTcIdaid89PDF8eyoqEYpgtp5t/QkSgz6HZue1u7gA1+MIhP/mifCGXCxaI2HpwRoYp
	9NtvCk3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugXn-00000005VsY-3PTB;
	Sat, 06 Sep 2025 00:12:39 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubvc-000000043pK-0x5X;
	Fri, 05 Sep 2025 19:16:57 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cJR1154x6z9tDm;
	Fri,  5 Sep 2025 21:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757099813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VyVXJQZw/VxE1DIAGqJZQM99zmZvXcM4HzMm4Zo+WyQ=;
	b=kVEnAGCPCqb1Tf5Scjil0a+3APbhpksBBCVZB7hhSqaE55OMqOjdx/bw2GG9A9K9NSpeID
	vzqbMU78fIZLxbm12z2XfpYcbTMPaEikUcX05i47Qwlmd5/t6u+LzryYmEAv3p/BpyiOES
	Jeiq5JgxBWA3SwJtyPKLRj5IWxFsZPm+H0Zwz4J3w5BdNjjNz1fkMqz4tLswmxuE5/Ho/1
	36Vw0BtNFCJTTOzJNldXOOSATiasC3K0F2Lsg1dVeROEMyP5WL5rQ6ntvAR/sCJEJQs3RY
	RV4t2/pN1zQ1wvXPeqyVu/sFzfHvQLHy/sJFbcxAS1Q2/wboblGSSvADSSKyYw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=aQ8uQS4j;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757099811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VyVXJQZw/VxE1DIAGqJZQM99zmZvXcM4HzMm4Zo+WyQ=;
	b=aQ8uQS4j7CavxwEqoLXsRi9fGqOLE34OjJuqE/msGflAXd2yJnYsdW/i4yxMJN8kKiQStc
	YmCFWL9Thgel3VwjYXiQR4J9Ah1wWYZaQ1pCS4J1QFO3alm1s6y1tUC6JP5Yk5UWP5UmDy
	ooOf0CEPbpjrrR59lO6d9kHblab0iI1Z1AceOfgvaHzlu0L9gZYk9lHLggCOzjK/vz4TDA
	FnhhOW8HJhHgjbR1uNxrNF4LW1vQ0+NenDbp6/r1gElC6VBoqmow4budlFeGZZeDNFOdiZ
	WmV/D4+TZgqvegMrloQNXILDv5g5TrglN/k2nILjCg8vnUo9V+pptjZBBxufGA==
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
Subject: [PATCH v2] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi 720x1280 v2 binding
Date: Fri,  5 Sep 2025 21:16:30 +0200
Message-ID: <20250905191637.147141-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a809f2fb26ffded5227
X-MBO-RS-META: chqjqj55drgqf9pmb1exbtomucpuoc3w
X-Rspamd-Queue-Id: 4cJR1154x6z9tDm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_121656_413188_0E1E0645 
X-CRM114-Status: GOOD (  16.38  )
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
V2: Replace node name from gpio@ to regulator@
---
 ...,7inch-touchscreen-panel-regulator-v2.yaml | 61 +++++++++++++++++++
 ...ypi,7inch-touchscreen-panel-regulator.yaml |  7 +--
 2 files changed, 63 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml

diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
new file mode 100644
index 0000000000000..37b9ed371b67d
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
+      regulator@45 {
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


