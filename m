Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C333DC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 19:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfvGa2EDVDelSmhnP0283dUZyM9fnNxCHCR9wjNeA94=; b=VYrR+o5tB5N5EoyLytBKaewJg0
	bUOgGp7sboqUOxJhnZStgHul+THMawOtYUWMHAwap3uyqA/m773gnWdIOeZ9o8Gh2ECbdnLHY4SYb
	tYLL2gyQk7Y06JjOXlMXgqhZdaQ6gOqYw5uDF9cvTreYXDki22JocUMU/NJHm9w3xW+D7YWTVC0si
	wja00Ogdd7KRjWi/h/RFpWowgbgtnGX7iVkBNyTp/Qfb7rKZS5ZLI6bmUsucPvZ4nPuO+W3Hf5QuZ
	3+/oaTa6oDzYbch85LcMXt5frkoOaOJcRTPtD2YH6tmRRFUGyMChrJ1d2E/W+yG5HuraoDu9s1lfP
	Tdee0Gpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdp8-00000001d64-2TwH;
	Thu, 15 May 2025 19:00:54 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdjw-00000001c85-2BnP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 18:55:33 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54d98aa5981so1865901e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 11:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335331; x=1747940131; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfvGa2EDVDelSmhnP0283dUZyM9fnNxCHCR9wjNeA94=;
        b=BdodVw6y5FuUw4ZbT6mTu9E4/3wTXbkOwxIf2FvQ4sBHmWkaB78yWn1y4SDO5pnoA7
         Qtvlg0IjBas2lM6kSYgz2XTecsUG68Xeha0M2rUEfbzmmIewR+T03YMP4uHfLor4Idf2
         wWBkrzh3OlzcoNYaWeaDcsIUmpjCIv4IrdtFVmUrdq4Wzc9h8RO5XyNlsXAx41WLIw54
         ERcQ3kUGbNFcTXT9iHwKDqWCdJuCcLZCfrBokpw5NYBxdNMR2135eJUqWHCOnzi33+Tl
         OSckp4thfqz+A6Z1Az2SisoF5QpKup/SsE2/zCjMUjYa/kXUFTGVuxPngTIkh5BqJGyc
         E/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335331; x=1747940131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfvGa2EDVDelSmhnP0283dUZyM9fnNxCHCR9wjNeA94=;
        b=oQTkqUOJ9aug0kbsFU7L6OXnMg6drHHTXeTjeO8siNDXJ5OLwa1ECyxWwPUQVn6kY+
         izKajJqaA/Ig1ByVwsBxGPH4zRZ7GP8PVqzp+QwIpIRDkyOC0XuRZ2KlNKLgqRsjfo7F
         5rq5+hyNSfnJ5nsOWuCSOeFkyLeTqx0x2NklX/JJXKfOlesbvQpmXbULrdic4U4FEH9/
         9CxHxOyW/ggCsnuiZym4DqUnpglUyUNam4zwBFbQtiL4O4mUZXDQG0bdH1JR7wKOjLVE
         ULyZRW8adzbPPgu2WVHIWMnX/8TH7MndOS5uKtsmDyiktfq2b1RpejxQLZjLPpnXc51y
         d6wg==
X-Gm-Message-State: AOJu0YwLx3MCIN+x+TthdkyQgHkj9Yhp/ssz/D8i0HEl+naHHrEIbKT8
	isa7mnqFgOXFNHJA9ZXQdcdFqkJgpcg3dT879wI4rrxu8sUhOOTEZhjw
X-Gm-Gg: ASbGncsAFZnmA7VHIM3ub7Q/NsA2Kx3Qs341P+7sXREDsgz0peqhIZhEBfI71/o4tJB
	Z0prbvfRkNR+8Xx1c2PuOsClKqld4ZgNhgEW/VAkkYVylPjJHXrIy4dZumGf+YDqWykykcBwlnO
	mkZxPw+753tnfxDYvQe1aulJPzTcpCBo8S7AazsKg1ApiZwxkAOuo7iMth4kq4qIKtFRbj0NZ7d
	QUFVh3q0sLe20J735cdOoMBbmuPQ6/fd+EFl3YJBsltrOpGSnG7gts1ziiT1thZhu3LuFqyf5hH
	Ed+WpRH5Eyug4IipIgOq4aTY4XYDoD4T3I9sjYWFHRT3t1Do6Cy0XDGznjGSfZx9
X-Google-Smtp-Source: AGHT+IGwGxrvOSfW01fCcygvtE81OaRuc1eoF2HsrgiOy6ljMEknHiCgS823LFFyZKoREeRhf+Vzsg==
X-Received: by 2002:a05:6512:6301:b0:545:2a7f:8f79 with SMTP id 2adb3069b0e04-550e71b4a93mr192311e87.16.1747335330530;
        Thu, 15 May 2025 11:55:30 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dd8asm60389e87.196.2025.05.15.11.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:55:29 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 21:55:26 +0300
Subject: [PATCH v3 1/4] dt-bindings: timer: via,vt8500-timer: Convert to
 YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-vt8500-timer-updates-v3-1-2197a1b062bd@gmail.com>
References: <20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com>
In-Reply-To: <20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747335328; l=3775;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=yNxDhm/uuiO8dmzR5EBORWvZsJNFwbuRqrNhv+/q4vw=;
 b=NRQGss8+va4KZKjCJRO11/7j3cq4lJKPSHXgToJoCXBCupR0aSzlOR8ZJakm75pow+quIu++K
 Y+rqzvZ5vE9DICWK24cfXrlUVIy5I/LI9KL+WoZ+G4jBnJYxG9yiyjH
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_115532_566715_D1815DF5 
X-CRM114-Status: GOOD (  18.84  )
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

Rewrite the textual description for the VIA/WonderMedia timer
as YAML schema.

The IP can generate up to four interrupts from four respective match
registers, so reflect that in the schema.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 -------
 .../bindings/timer/via,vt8500-timer.yaml           | 51 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 52 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt b/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
deleted file mode 100644
index 901c73f0d8ef05fb54d517b807d04f80eef2e736..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-VIA/Wondermedia VT8500 Timer
------------------------------------------------------
-
-Required properties:
-- compatible : "via,vt8500-timer"
-- reg : Should contain 1 register ranges(address and length)
-- interrupts : interrupt for the timer
-
-Example:
-
-	timer@d8130100 {
-		compatible = "via,vt8500-timer";
-		reg = <0xd8130100 0x28>;
-		interrupts = <36>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e748149948f3140d4a158f800b91e70bf9c4f042
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/via,vt8500-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Timer
+
+description:
+  This is the timer block that is a standalone part of the system power
+  management controller on VIA/WonderMedia SoCs (VIA VT8500 and alike).
+  The hardware has a single 32-bit counter running at 3 MHz and four match
+  registers, each of which is associated with a dedicated match interrupt,
+  and the first of which can also serve as the system watchdog (if the
+  watchdog function is enabled, it will reset the system upon match instead
+  of triggering its respective interrupt)
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+properties:
+  compatible:
+    const: via,vt8500-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: Channel 0 match. Note that if the watchdog function
+          is enabled, this interrupt will not fire and the system will
+          reboot instead once the counter reaches match register 0 value
+      - description: Channel 1 match
+      - description: Channel 2 match
+      - description: Channel 3 match
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@d8130100 {
+        compatible = "via,vt8500-timer";
+        reg = <0xd8130100 0x28>;
+        interrupts = <36>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 69511c3b2b76fb7090a2a550f4c59a7daf188493..b8b2843491c47182a4fc6c76f5c29b6c411830a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3434,6 +3434,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


