Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0403BC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZddEGrogZHEGNQ7pcvcEYKUf9gM+B46KqH5Pfb6SAvs=; b=MuI3SSlScDbqGssi2tH83tb4T5
	qIany8a10QNkEsvOLJilJ0dxn29tuGl13cSpPa1CLcaGCvgPFmQnHgB0GfAbvThild2X0shH5Yxll
	eh1BHvXmew7mmp5IQdDOGWSYFJXWGv/Y6+IDH5X0QXTW0/3U4WVle7H18Qk9LuzMifsRlqibLrqVL
	UjTybRc2QrSJbPe3FFyZf9yZKEJcqDkhIimYESNu7ftsyM4UCJsNgZszvrc1rhldvIM4iRCA5APvn
	tUJ+EXh0vjs9LOy1ucW/cMLHBZ8HyFloMxEawK5iDvoEEtQTfjvbLcCOY6fTKxKk/bvqTrZlEhKWE
	sEqv0LFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCK0M-0000000CSZL-3m6X;
	Tue, 06 May 2025 15:14:46 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHED-0000000BsHg-2ykg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:16:55 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2255003f4c6so57137185ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746533812; x=1747138612; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZddEGrogZHEGNQ7pcvcEYKUf9gM+B46KqH5Pfb6SAvs=;
        b=WPUrt8errjlphbfRW6RhcpwT7sMHPTi1OeIoCyM0Onj9Ngdvplo5YT2MrUKx9R07zV
         LGQ3O5KuIhhkHB1Wo6FleLi6yXSNVj1TiwX4sRFr5Vx6LAn6jx4gu6uM/4Zm8qzk6QJd
         VH3azoFCQAWqpqezZ+p7f6UJqRGVMTNE59vMk+0aUwvxgSjojnDK/QGaDfVgRNaL5Ydb
         l1tNE2zM+dwd+n+ulDcOxGZeJ4od6bpYmzfRSC+7DbUzT1P/dMW4xbV2CZW3zVuh3sfg
         xHw/zvlhdLIDIDrL0qYFyxvI0+c2HOKpGa/NixDfTlhzxTM38oJG7s8PJOQOUWExS6qk
         MHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746533812; x=1747138612;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZddEGrogZHEGNQ7pcvcEYKUf9gM+B46KqH5Pfb6SAvs=;
        b=EOPDTbHMwq/teEuW7wzvnt2mpMSa6KyfIRnKYXuBLFTZTmLhzgdLS9sE+Q+ADBNPZ/
         N4VaHO6trxvarIbjDGI30aUfK0YIP2MDIsDoG5Qb+YfqLGgN33Au9YZc3cD/9kHqvYHT
         e7UhsnKbyE5tR/RTJK5vdlmNdUwB31LRkvzLNh07qLf0mT2AelnfvUMh50R3PJWFsAyh
         lnUj/eAv2f919lzE65DsMVH57FNyGmBgZ6ey2jyNcJfqRUMN2RfZBe89DW+PWdqhW5Z/
         ilMZ0v/4nrEn7QhDyVCFnAzzQllNjHQx05Qqer4y2dXxwUmxvIlecCMYTfD3Do1RND+I
         bF0g==
X-Forwarded-Encrypted: i=1; AJvYcCUXl2SBCSuHU0TX82S2fuXVFMvBoZlgyX44ZnV0tFhh/NJp4U8C9ShSXxVmE9WOuWhEVcdeJzfNcfH86kWQNwU/@lists.infradead.org
X-Gm-Message-State: AOJu0Yza1/yB4krZwCj1ffK2hZZ/FYlGXJu9SksoQYvANVhty98KIzsT
	KGZr63GiouW8q38j1idFPpt2/rgqmApl8zGRtHpMePUJFX0x5ovcvNT1tpxkwCE=
X-Gm-Gg: ASbGnctiw/mF6B67qKQbrJ3PZRFWsq+wUdKk2xz5dpjwtRpTbMKq0E9CuuDH8AeeZIY
	V6uBkSuNDRkdLGwVPIP8Eu+DZezXlWQHUSTt3tUo+Jk5zGN8NLdl/kpW+Eb76z8FmZ6x45Fpp0b
	wpH2rsULdHkAVfiyMH0x5xOw+Gk5O6t3ftHbvQB3AYGnlmJRayw0dXfB1rEDs6VcpuWnotLe0SW
	sYoyEGFyKFZ/qIwfQNglQI7qe3o0LV50CELutg2Nun0FS348xw74rJ7ebY/s+zwLhaIEa2IeLsw
	n4J/2SAkIYFsRal88lxJiE+oY82oAv7JJ73ENinHw0kKBnE7F5k1
X-Google-Smtp-Source: AGHT+IHs+N0P22tjESMxWzTw9WBCdtsKHjx3p4pCRUDRfRHmJozPUqCA7yfh3OLcbsU9gVjS2h5X4A==
X-Received: by 2002:a17:902:ccc5:b0:223:5124:a16e with SMTP id d9443c01a7336-22e102b8549mr257960995ad.5.1746533812345;
        Tue, 06 May 2025 05:16:52 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e2356741asm45354235ad.35.2025.05.06.05.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:16:51 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 06 May 2025 16:16:32 +0400
Subject: [PATCH v3] dt-bindings: timer: via,vt8500-timer: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJ/9GWgC/42Nyw6CMBBFf4V0bc10sFpd+R+GEB4DTCJF29poC
 P9uxYVbl+ck955ZeHJMXpyyWTiK7HmyCfJNJpqhsj1JbhMLBNSwU0ZGrsoYjAYoA4/kyppty7a
 XR0BVtwejyYBI85ujjp/r9aX4sqP7IxXCTw7sw+Reaz7ix/5RiiiVzBuFWu9NB2jO/VjxddtMo
 yiWZXkDgJ5u09UAAAA=
X-Change-ID: 20250418-via_vt8500_timer_binding-9021bd785e80
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746533807; l=4585;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=uR+b9SUDz3kDfrZfVAV0AjkzWD/ARG9NGY/tJWaZ00k=;
 b=aSHwcym8c/ttItjanuxGpA+6h1oLBP/EYSQzDhjHPEU4SLfpu6MgvCnubLuKEuUcXIKz2tYV+
 27X78Tr+pTZB8dUZOdijpnZGauJ7xfHmqx7MnENiD0RYY7nNQwdTY7E
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_051653_754273_BA7BB133 
X-CRM114-Status: GOOD (  20.21  )
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
Changes in v3:
- Added Rob's review tag (thanks Rob)
- Rebased on top of next-20250506 to pull in MAINTAINERS updates
- Link to v2: https://lore.kernel.org/r/20250418-via_vt8500_timer_binding-v2-1-3c125568f028@gmail.com

Changes in v2:
- split out this binding change from the big series affecting multiple
  subsystems unnecessarily (thanks Rob)
- added description for the four possible interrupts (thanks Rob)
- added overall description of the IC block

Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com/
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
index 16037aaa770fc35efb45fc26555afaa5102e2640..5c38a60eb3bddc47106509d6cc6450ae93e50191 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3467,6 +3467,7 @@ F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
+F:	Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

---
base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
change-id: 20250418-via_vt8500_timer_binding-9021bd785e80

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


