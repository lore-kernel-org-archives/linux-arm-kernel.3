Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50555C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7xWBrhMoZbugc1pyBrVITkVru2bavizkyHIBfAy50sk=; b=fqni4z64bGWJRzqsr8FAsqDmvL
	6/tPPqycoLamNXR2HpYXCViYnflajcp6TolNHfd8tAQL4jJ9D/I0z2NJ1oGR+qzoxe53D4Se8V+MQ
	G3BdTuZbeUWhb1STEWXcLkhWKtmeFC43ExrqzdfEwiQuRLEQlvpAjhcP+Ryk/Mkn8aG/ZWeXilOnX
	YTjjKlB5Wl0bR/skY0LcAIgaQAekuQrNXHpgLdfEszZM/zkGbhEc6JIInrcj1xEwV8y+a+z+sdt2G
	KCPkqats/OuCZrdc4c9tNNzAHfMs1HPVhNiulSn4OkQGtVm9ZxzNCbumtHrc5wmUN6Vem7aAUaThT
	yYw2D2XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5mvq-0000000GTvN-3qzp;
	Fri, 18 Apr 2025 14:43:06 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5mmm-0000000GS1k-2yFC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 14:33:46 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so2915167a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744986823; x=1745591623; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xWBrhMoZbugc1pyBrVITkVru2bavizkyHIBfAy50sk=;
        b=UpWbYd4pYRyJVCcODUcevGHfuhcy2uNWnxquJI0UvD990LTWXDlalJdFdMt3iUOEc8
         hpcdq1Fq4Rco0CcMlfxFaEgm2S7BPzxVTE4s4/wT4Jetd3hUJkGtiJxLb2Mz0wXQi4g5
         /n86oZ7oDUQhhgaR2Q/qeMN0q5YkanoAEaDOj/3NWlMuklBzY5C1gT/jn4S8gFFAx/2/
         neH4kLxbKgOrq51gfyGWet+T2LyAgs/nelLPALqzoLBFMVMD1pZcDFpISoj0giTSuf6k
         tOS59oPEQWj7Wh0IEvwD5k1vRpJl4jlHInWVgxGnVczSiyHkbi6hbAFwT2vvkOByYut7
         pSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744986823; x=1745591623;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xWBrhMoZbugc1pyBrVITkVru2bavizkyHIBfAy50sk=;
        b=v0bBCeWxY7ExWZL22XXON1P8UtW4/t41fEumF4P3cTwEGMtsHwMuO3uGaJWCYLCw5t
         GDFL7Mi5lOMTAeMx0NaFI8bpGTpIVl8HCSgRE3zwXba5vZc2XEpNEy6pw5q61UjOuXpJ
         MJ9W9BzRSL+RCHZKUlbgb2GXIbTmLuCSKq2kb3u4imAPcP/4zaoWYUEbeDQIXGbUviWu
         eyAzchInwx8zFdKg/4CBVb0B4W+DnEhMyvk9wTBlfPBp/Cv3t40uvtyvhHkGO9+nrcYq
         Q7xMSuKv4+kTMWNMny9rDD7+lnXk2mBOk5Pr1V7NvzUjQSSQoCimkTu6uXs0xJ/3R/9O
         kn+g==
X-Forwarded-Encrypted: i=1; AJvYcCUb7JesX3bVFLRaG2sXYSJRJVltwPMlFQ1964pbRR91/n3kVtg2VhNfy1v24SPDAxDiBT/wvRFx/ISJQkYBwzpj@lists.infradead.org
X-Gm-Message-State: AOJu0YweWBk0PwwUyBh+OKjbJg+CnzF+j04WFVa4HV2+neEoKCNRg1Mr
	g+N/HtLSKndgOs2Y5PK2WDQQ1uD4tgvMqWS7vmq6vaS2+CQmLm37
X-Gm-Gg: ASbGnctkEPHHtHikd0291v6wpGCFwDG56f5i16CmsX8R2/RsggT/43kPJgBjDJ5kyvD
	ue06z8tlpmD5b1zI8AfEMCAFMt/QLFr4VEbx74taKaVKqFDNhXgMS2junAWFMiMdQCtVjxb8oy/
	SEXYrbfvkUXgVXvsShchsn1uL5pI5Dtp5oBQzOycihZS5xjRNo3ZC1mteTkkXISXmiTZ2LfKd3n
	pMgMbLsJ9AgZjbxV3jLsoc9d7KhQE7Ei0aOAA22znzX248hAqIk0sBvxiIciNVNRz4sskGKasFj
	nimxHYeDhV5uVm0sPl+tpykDk1ONWjpMVoGcGDAsdC7B4ZJWdIUn
X-Google-Smtp-Source: AGHT+IEcnxUHY3/54G2wHOQst0KE+WrBA6XR3tiAQlrpS/18wB0AktIZqdCpGIWVrwq8J9kwLSsU2A==
X-Received: by 2002:a17:907:2da4:b0:aca:cad6:458e with SMTP id a640c23a62f3a-acb74dd6021mr281005866b.43.1744986822447;
        Fri, 18 Apr 2025 07:33:42 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0b1e4sm127453666b.34.2025.04.18.07.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:33:42 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 18 Apr 2025 18:33:45 +0400
Subject: [PATCH v2] dt-bindings: timer: via,vt8500-timer: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-via_vt8500_timer_binding-v2-1-3c125568f028@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMhiAmgC/02O0YrCMBBFf6XMs4VkbNNpf0WkZJKpOw+NmmbLg
 vjvBoXFx3Ph3nsesElW2WBqHpBl102vqQIeGgg/Pl2k1VgZ0GBvOkvtrn7eC/XGzEVXyTNripo
 u7WjQchyoFzJQ67csi/69p0/nD2e5/9aH8gmB/SZtuK6rlqkxfsHFsVjukOyRenaWApPzceycR
 ImGRh8Ivs2q6LeXphL+fQYZmZEcdoOddoTz8/kCohaAFO4AAAA=
X-Change-ID: 20250418-via_vt8500_timer_binding-9021bd785e80
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744986827; l=4470;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=8hvzQpevJpd8opdibOVe4+Ri5sQRV3J/5rabA+wMngg=;
 b=WUeT1BUiZFwvLtY9348IfWL78Tc2LE+rMnaK205tuNUhTEf/IqweRGtmSetty1wwIDgqp9Nbc
 7AdZc/B/wnbAHr9/QUM2L6JrLq8215rVwD6vRpJu6XMuYG+ckRyVsge
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_073344_756242_E60CB141 
X-CRM114-Status: GOOD (  19.72  )
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

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Split the series from v1 into separate bindings patches so as not to
spam all the subsystems with unrelated changes, per Rob's suggestion

Changes in v2:
- added description for the four possible interrupts (thanks Rob)
- added overall description of the IC block

Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com/
---
 .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 -------
 .../bindings/timer/via,vt8500-timer.yaml           | 51 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +
 3 files changed, 53 insertions(+), 15 deletions(-)

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
index 96b82704950184bd71623ff41fc4df31e4c7fe87..ed5d6ea34959d11624732ea7601e4d51ad19eac2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3428,6 +3428,8 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
+F:	Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-via_vt8500_timer_binding-9021bd785e80
prerequisite-change-id: 20250418-via_intc_binding-7e9bb2862471:v2
prerequisite-patch-id: c53a4f3be5edb497bb9ff8fcad6cdba382d07fc6

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


