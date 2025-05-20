Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42187C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 20:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gxfsw6I6YYTP0VMGydqnNXEY5NLxoTpA+PjreYTGiOE=; b=mJ+w42dR4GK6qurEBDNRDwAfaZ
	r41kySqn0hQWmfxxDviZaQFwcLlEBgaRPAWAuYCVaconCwHcJw99n1xDHT1w3/mIpAjWCUOPK7KqT
	+TRmW2FDEZc0G1rzM3Y5tfASmKSWQ22+GkmUkdeKyCx7/pP3HbiYDPTdjFrBPye+v63rRBZ4KPuc8
	zIVpsvk+4WvXwJQ7Bj08wIMbGf4P6PfJnsBP/DXEfwYOssuUO4DfCsGDC5/qKIHMDJV3DwRoMfH92
	/xl0pI4iXn0hPypq5/oHYM03gp8OVjQOYWQ10rmM+/jG3bpSYK/n1XjaDl1v/u7+fyC6XTwLzbMwC
	PINMvfew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTEI-0000000E2r7-2Sd9;
	Tue, 20 May 2025 20:06:26 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTA7-0000000E1uF-1K28
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 20:02:08 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-742b614581dso4570154b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 13:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747771326; x=1748376126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gxfsw6I6YYTP0VMGydqnNXEY5NLxoTpA+PjreYTGiOE=;
        b=LisbMb8U9VHD1GPTDYrjXHOBNKGiZvWw8MX5YUALkwJhUDfBYAsaPI1bz44GimZuR4
         DHXpe7U2R+5goRNTCCKpuffiOThpmKy2qPhHXL1MlQ1J6kliivuOvkxYL0TxIIrLeiKk
         74nCyyntDOfJAD7GmkSNRjqMoz+mZStbowkWc0wvSC9sUufizj/+aKDj7lu2xc+JyDpm
         d4m42bclwmlhYEnE5UVzXRYVKn6FvNmX7i65md5rBcnvhlYxzRlqV/LG8osVFDtW2GUX
         YRzF5iyM0mkCjzT22RsFyagAN0KJhOx0UicwyNa1tYo+refPknM9ZTQ1+IdFlvz/2v7o
         X1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771326; x=1748376126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gxfsw6I6YYTP0VMGydqnNXEY5NLxoTpA+PjreYTGiOE=;
        b=s/JftlsP7FUTO1PWWUlRzvg49jvG3q2k/5v4SBvQ8k7DmsZBa0q3w7ucw49wzJGSl6
         39A2j3UCmbbpW8SO5Iyo0PPlP2N1Y1O+2k9gJyZd8nMHOqbVg9fY7hUBakEpL8/RbHKg
         SkBHWS4RTKtTgrt9IM9W7NEl2Unq2dtR/AKJpnZFbQbdrcFY+jlbDjC/aLI3UyvYGiv8
         wzfMXgPyJaHVEyko4ihaFK4Whb0x/VkbMrlcR4Ks98LmH+bkrI/ibt7oyNoNq24BjqbO
         aVEtf5tvvDs84go1GJ5nVSD/GgLSBIdLqh5/BMpa9Shuocu7+v4jz7/7FrpMwDvbLHMi
         g9/A==
X-Gm-Message-State: AOJu0YzEiXKC++1wP6LFiISYwSzMuSRqwlcyLc2yuUMNulw1a+djVB9e
	kGzz5dLksol/RiTaLk+PHzGp6+UavrjAThZihd57sGIqcSRnjhdvVaG3
X-Gm-Gg: ASbGncslIkuYqr6ZQG89aSD2+i5oxp7p1ihdEMmUwAibjo9aFbj5NX+SGVuUwZyKN24
	K2It51SGwF4XxpLyAcPnZc659I0mck37+xDy8ZdAqS4Mr0rYFYtPWbvtZOu3PltGWu9XDLf50jO
	PcNdtJdOe0xyEbiYPCtNdwWtvqzATJO8h6dctylChJwC/2XMGZhwh1BT7fB8MEZ8eDiZlEBlRUh
	KGQ2cwB5fyTj1A6fP7JmfCQgn4ESu5Y5PZcUEUKLF17eY7eI2OZeVu43+rloAm+tRt/VHkBDfb2
	FFQmE9JaxHC87ABE4yNPzK1qT1SFVAMeRYhTcWi8OZBhrOyqUksnmFqNvK0ESBE=
X-Google-Smtp-Source: AGHT+IGupbKGW386mhivPJAiIzzStBvVkq8NfXE2ktxMR1iGMRXrHF0+aT/Q9O1XVoEce0sp1CdPLw==
X-Received: by 2002:a05:6a20:a129:b0:1f5:8e54:9f10 with SMTP id adf61e73a8af0-2170cde51b5mr31255972637.34.1747771326368;
        Tue, 20 May 2025 13:02:06 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a0d0sm8412340a12.14.2025.05.20.13.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:02:06 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 00:01:41 +0400
Subject: [PATCH v4 1/4] dt-bindings: timer: via,vt8500-timer: Convert to
 YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-vt8500-timer-updates-v4-1-2d4306a16ae4@gmail.com>
References: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
In-Reply-To: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747771315; l=3775;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=qFsMhUVZOqzuNFYPlJDTF3BR26c7gUmeV5+bIDXnEJ4=;
 b=M5hJXbl/goJAem+GG1Z//IC/PZa2E1v3pqaTFzunJwsYFk02s0669dI6dFxu7ArHDcdsFQ+XZ
 c1xPI7+iLrABoRq+wo+hj6OWQt3O3XUvxk0xjpnZ8JzblWq7XtYOlJk
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_130207_368510_8FD2E70C 
X-CRM114-Status: GOOD (  19.28  )
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


