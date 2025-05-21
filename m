Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19448C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gxfsw6I6YYTP0VMGydqnNXEY5NLxoTpA+PjreYTGiOE=; b=fwmYSnuaNMl5BjXfZXkgipMJYf
	utQunKBhOz2PF0B4/RtKXMc7BjUcMJ0ws0MNrZt83c8GG31zfoARyI9lMq7cDoa+0AgAkLOqRLhqc
	MxX+KB9OS9FScZIC1+RxF0oY0mQjMgVamOrXcmSmJLAM0bTyYTKD/XkLM/twcM1+vuKHf6vPI9idP
	ASZMKIihC6ekBdEKclbavMby6cVaEcwkU5SjqC7bZB7PMtEVMNixvQfmSL13rVawtDjKVqo33OhSy
	z3zcpNB09CsKup1FQ419kdgJOz7BIaldqSVITG41axlXPmToXMoqQzkUd6gxM10/ODNnd3YbG7Tkc
	xERqMVDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjeI-0000000Fxhx-3jV6;
	Wed, 21 May 2025 13:38:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHj3x-0000000FrTP-2ERm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 13:00:50 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-231e011edfaso57651625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747832449; x=1748437249; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gxfsw6I6YYTP0VMGydqnNXEY5NLxoTpA+PjreYTGiOE=;
        b=jEPeQw8ajBdTV3WxLIXZ6rGsesSj0xyUeUUOMBm4Nged0hHKfkgRSr6YH6MUaryviB
         LyusYAj4y2o+Ashz5yC4AInsjN6VKw+V1lzFScEErTDr/B6mKId9NP1ryMOBwXc9uyoE
         DhrMFz5c9t9q9tArbNGJfOdKc7rOpjzq718XYw+EkzvMdN0VxVe40EEE5+oc6ZM2kdwn
         TRuzKiMR+MMDCjR6auU3cNBZGxG9vFojFksltDO3zJmdJThr9g8h5Vefp1z+6ArxLUdU
         ebmjnx++zY3X9CGuxY6f+jypUOfN2s2udjWPA2/fE4rwm+lZCF/Khg+cHn8NKFVCnAcm
         WK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832449; x=1748437249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gxfsw6I6YYTP0VMGydqnNXEY5NLxoTpA+PjreYTGiOE=;
        b=JOLj3khQgr/2bzssmo2HnidiFOj4FSK6I5fdk2jWGJuPjNvkQD4S0ORl3Wfrb6Y9pF
         Z8VmM3OdwVMBj9kxqbd01ezX4dWfV2ItOhNYmNEAy+5QdDMLPB2kEcWGI/yjLjspU26n
         f77Bfv7nAWZs2CRB6/zOymRZXMFqTgx+ucT9M1h9qVBavCaB5Bk5auX0S0364mBijej6
         rTLDX/W6iJM5lf+Iv9soFWDlGkgPW5cXPmgH5A4M3HSEqylh4PJEaUpYkx8ON1yIHInY
         7kPcqDJvKCX9ezmwuW4NlEqisnmg31LxN9V6IIAJgdPGWH2ea8ZlqBYlkP9AxOh+7kaA
         WLpw==
X-Gm-Message-State: AOJu0YwRwh5eeyxN9za6LAznY7zDZ2cPjaeW4ocggrUHMiFZnDs6N7Py
	YANA/h2bHrwf6zOmqsrEpZuEnsZALQqC+DM3YJ2gYjeSxdoRJHoqZ2P3wkgokg0e0dI=
X-Gm-Gg: ASbGnctiFAGPtB0ONq7q0WoJSTYdvGvurZV54DVYxSPQ1Nj5Z7YVghTOaMhf74t+TQV
	Fc9Oynh2BC59dQuRQVmWv5Eh8MkrKA4a5ommty9YAknZh8TtvAsG4mp5VYI54lGQ673Tb+EWHe3
	Uoigj70Ndza/8KcTCO04ljNW5ns8VZ9cj0kvQaW4oPW1ZIlbAgffp8Azui7FV1ycedLo465eqMk
	cDqKEiTMKhn0+7ti8cSb6BYC8XinpinICmay7AszN4l+ZBTCQ/S0mDfOgxtYak7q/9nciaJtnOO
	AIqXzDCFFSjBuFLueILXx/N2sHK62J4G+OiZ945aXetoaeS68ISvucNTWgyqoB3/9nDEmrVsCg=
	=
X-Google-Smtp-Source: AGHT+IHOqZ0UZs4gEw+AX4EUEYHG80dDDTjCVGnktljkyCk/ragLh7hzOTShEwQSeYLdiStnlVCAxg==
X-Received: by 2002:a17:902:e78c:b0:231:d156:b26b with SMTP id d9443c01a7336-231d4598d28mr339129975ad.38.1747832437863;
        Wed, 21 May 2025 06:00:37 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm92691165ad.53.2025.05.21.06.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:00:37 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 17:00:09 +0400
Subject: [PATCH v5 1/4] dt-bindings: timer: via,vt8500-timer: Convert to
 YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-vt8500-timer-updates-v5-1-7e4bd11df72e@gmail.com>
References: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
In-Reply-To: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747832426; l=3775;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=qFsMhUVZOqzuNFYPlJDTF3BR26c7gUmeV5+bIDXnEJ4=;
 b=LhCAByhFqlGUo6Nq77ilp47z/ScPwXJfgpi7qviGjTbF01bA30izGRkuZjaCmMafFFps7xtPd
 BJMqCf7+vO5C5xw71nbhC56FqYtATYEvdaA93wcmEe89lZs9XL8yFOq
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_060049_563187_0A70BD31 
X-CRM114-Status: GOOD (  18.91  )
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
index 3563492e4eba48b9e9389687fc9ac2a881c47ddf..783e5ee6854b69cca87b6f0763844d28b4b2213f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3435,6 +3435,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


