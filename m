Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31757E9A021
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48uzX4AC3kmorumjWvelh24/92P7g/49N7P//38GtHE=; b=WEAegNo9D9xejCmDzMBdmIiXgK
	RXc6thwxNKeCGZH3ciso0idVnagaBdAORSStPa8zH9JrevbdlzUZ4wxHbG3mF8r+X83Uu40Wy9Xpz
	KFeTLRTpS+jGdltwRnOFC2Kf9qyokAHZJknSxjYDTo2QyxGkczDUJYBQuCHzrQ4wp46wRfc0jy3tu
	NJLjTNOJwObU95HPaURydliOMWrQn33YOBM5DiMSOiZvPM0aH5+tj1G/rzlE67vgPzrlZExr7p4W0
	dgxD7DZhHu8tEVwyk1JL1bBunHLxPsq3lfku/smwaGRZJ/hBJjCt7GL2beg/3KXIGvAJTfB2PU/cl
	zFmCv26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOoU-00000008eSM-1Z3u;
	Tue, 17 Feb 2026 17:24:43 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOoQ-00000008eRP-3K2Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 17:24:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2aad1dc8856so30238875ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771349078; x=1771953878; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48uzX4AC3kmorumjWvelh24/92P7g/49N7P//38GtHE=;
        b=IyX7fkc2Y1Sl1OD8xcL1oYI5P9m4WjQw0lCD9FGdY0oE+aFkF0RwXUeAcWNwLQq6d0
         tExoLiyudRKIWgVhUv9OShzbdJfEWctsSARZKum2c78Ovw7xVTlDA/ey4sh80aVrcD1D
         11uhd+ZFClN3n8J8xxLsGJrv12dYvJOJ0Xuoa898w+8QAZWZISfPDSfqg/dClCQDYWhE
         Zq5bqXCWQEXouNFPL0l01VVhZTL+1p4new1MI7jrRpyImtq1p0yiFPWdc0ZxsdfOiDhZ
         lXYOZKJp6fmcy/rhy64en1uDNZpwI1gIf/84gJ8D1+LYm7TK3mmUKAvaQqxx28nR09E4
         3osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771349078; x=1771953878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=48uzX4AC3kmorumjWvelh24/92P7g/49N7P//38GtHE=;
        b=JhxCd8zBnkka0bGPbG4QsFVRsBke6+MmPGt99mfm26e6D0bKtgtKfcvoPfM70HbKSg
         8NRksik4jqzvHbmNqrXxpYeqMju+6kXSRQz/FJtsQQ141gV1A2TupWAEKSxatklFyIl2
         QoEn/OgO4jgaQ4DtbtipB4oTkc3fg3eFqNehRaSvb/gkxtKJvxRjt5K6xOWcZVDd4XRJ
         +jUfEqtHs6DAViguHcV56K8bFx8uvVHHjPMtJ36i6znfdMp7cqAXJCskMdy9kh+64Liu
         Yw2Q+qhDb1ljZW8dbFKwoXLfU7arsq+XXZhQeskflxheXHfzb3fDsbRKhfaFnXBo7LlY
         ncRw==
X-Forwarded-Encrypted: i=1; AJvYcCV5i8/BMKQiSIMvoO4SGWh0g5+e42gtWif3Va6GvdVRBowz/L2xRClZ1rXSY5yBRJNRREG7mnOIjSbAWLULb492@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ8yqi0BogjaDdn8xXoI90XJBxtW+VW7RoTeAINIlWZZf1qwm9
	5LuG0f34G5hr8q+/AgRqKOaJLXtPXE2k2EeYNT7Tvf4PxETQJr33/zk2
X-Gm-Gg: AZuq6aKbzWnPMax200IlEeaxemXSXVRPzMYKHazw1fSPaXNq8t4osIfK1iyMdN5iDg4
	kL4/R+BgPqsfQm2JIelnvriAmlceaAXSqSRPyooS3CAHDV3RvSlEhw6j5krQqbd0+uwGRKcNXSg
	Cu+o0sjTO8/wLvofvZMZ529XrfJTVPzvKDtEk/ehohOPR+6H+ZlGb3san9TGL/edg7IF+u7I1Uc
	jHZK2PYwIH+suYgNGIzJCzY1Jyov2depaCZyizDH3w1cKf9BB+UuE0VslV/hxA+uYwxIqRCIBqY
	DjPJHI7VhY1Amr3a7fT6SE9xIXliTKuqPR3pSwD10l1L4Rt8YdevuW5GWatA23pjH3Cx3KZ+AyZ
	Jn4zGhkAGc08W31xRZpWi64uY/DlVBxGFOwpIKdmTJsLfTQuXjsCTAvCChkXlqOQokw/cyMDUWI
	6dtZaCpP0H2HnnXFQnBWEkDRD7Si/n3CHfxARe5OyWa6T4osg1
X-Received: by 2002:a17:903:2b0c:b0:2aa:3ec2:376a with SMTP id d9443c01a7336-2ad175be049mr120134365ad.60.1771349077878;
        Tue, 17 Feb 2026 09:24:37 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([223.181.109.65])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ad1a7145cbsm146880305ad.30.2026.02.17.09.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 09:24:37 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Tue, 17 Feb 2026 17:24:20 +0000
Subject: [PATCH 2/5] dt-bindings: arm: atmel,at91sam9260-pit: convert to DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-arm-microchip-v1-2-ae5d907e10e3@gmail.com>
References: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
In-Reply-To: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_092439_529553_3912B84B 
X-CRM114-Status: GOOD (  13.21  )
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

Convert Atmel Periodic interval timer (PIT) binding to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../bindings/arm/atmel,at91sam9260-pit.yaml        | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel,at91sam9260-pit.yaml b/Documentation/devicetree/bindings/arm/atmel,at91sam9260-pit.yaml
new file mode 100644
index 000000000000..954cd14ac1c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/atmel,at91sam9260-pit.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/atmel,at91sam9260-pit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AT91SAM9260 Periodic Interval Timer (PIT)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Claudiu Beznea <claudiu.beznea@microchip.com>
+
+description:
+  The Periodic Interval Timer (PIT) is part of the System Controller of
+  various Microchip 32-bit ARM-based SoCs (formerly Atmel AT91 series).
+  It is a simple down-counter timer used mainly as the kernel tick source.
+  The PIT is clocked from the slow clock and shares a single IRQ line with
+  other System Controller peripherals.
+
+properties:
+  compatible:
+    const: atmel,at91sam9260-pit
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    timer@fffffd30 {
+        compatible = "atmel,at91sam9260-pit";
+        reg = <0xfffffd30 0x10>;
+        interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk32k>;
+    };
+...

-- 
2.43.0


