Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922AEC369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTk8dSc3+rRa4E8pHZeAjgILOJTnN61ZfwytEWQJJy0=; b=UMNu+LxdH9wn6lUqoMK9GBa7ve
	GHoSyxyFN+WnZ3lwZSC8Uhx7Vizz4p5rGNI5PhSzr9dJc9Zyw/qfQi09gVIGN7mhDs8obV/PcQxVZ
	/f5z70Y/kQMAd7QMuqehJgozLUQKCMnL+LJmLVHM1FtaOXqI0VjGGvt+RITs8jnOv6mxqnR4Q/Pmo
	CRHr/w44QZ9KynXffVqJzDenRbgh72QOkktZ33bIUpYNRzS/qsdbKmaH3Ezqrk6Fms7SekNccukYo
	60WKdChqzPxdTD1XWJRTWfE9nyNVSVyKnHCnipVCwFzkoDTMWvUHYOS+f1RvsZbFXMX6EPMdPEQWc
	LqvYJ8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502R-0000000985e-11xP;
	Wed, 16 Apr 2025 10:30:39 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y2F-00000008nZs-0k2V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:22:25 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so56898831fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791737; x=1745396537; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTk8dSc3+rRa4E8pHZeAjgILOJTnN61ZfwytEWQJJy0=;
        b=VPq1fI9cmzcybjXD+emlsiXGnQv631+NzDAgDllyUAzpdSWXeHwyqcSTYZPk8DaA+h
         /u3zDLSAFnBLzBClLC8HyogNAHcx+DeVI0o6AM7FBNRz/HgMNvZMblslTg+PK9OqkzBl
         yFE0h6kCOvhNfpJDCXypWQrcLAOWQExjCMEDjG5/+jeA/7nve57530iREclK74yvYjge
         sIbkQ1sUEr1zG6aTJSKbHS6A2KOhpi2kBA6L1lmGHpecAHCXDM1PJ9tA4Yc0ZzacGTI8
         HMkzSQD+J2kyfhtT7hA7bVjOPOOIZW+6BSLjH58nE9J0n6n7TqgdscdzIKW0dFEn1DX3
         zvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791737; x=1745396537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTk8dSc3+rRa4E8pHZeAjgILOJTnN61ZfwytEWQJJy0=;
        b=dvZA2s1Oh57tvSSkGMZokQu08edaL5RdID3pyo4Slvk/+m4RMt1QMFx7L1v/+wM/pm
         SQSOP/X3xRoUW53l4F5RVvrTeGT3Vbem/Q19f59SW6okCJ5hiAb20qhuVlOvnwo1G6EO
         5JRp3HAFggGL/oNjZqr5Cd1/h6RCmGAZQkL3p609Bdd9PdoXOEfxa9Fl+29Qf5SZLMVb
         K7wtbPeEJXuCd3HoROcwHRtVFoB9tlPnuWyYVh0GsIgH4zjx6etkHtp97ySwh8N269Mq
         mM63ilH25MIRbgockMGrilfYGKnqP+p17Vs8CEePLIgQApDNlzHB+eHadPX/+tZvQcsB
         akBg==
X-Gm-Message-State: AOJu0YzQl7IoJgA+hLorgu//w4dRm09bACBoSiRjBbfHok11IIIdIYXu
	WswmKSiLo9s82M5+/abjb1JUww9Vse7I/HE9v8Z0ABPYrr8tyYUa
X-Gm-Gg: ASbGncvjlq1qQJgE4A3v44ca3EVf/wRkYt33dch1i9yLmXtiLbOMo4JAhCzo79AG8Dw
	Z8zPpxciUY0HhEnlTrEnXkRNL8P2WRC3nC7Gsr9GXlbEKFGa3DL5ZCKu5ON/ERjseYp9fvZA+Ot
	M77+mwT5g82WRIT9ci+79E74zQMD6BZiEhHznX4lM1Ao0pmtL6s0T4/RyGiCDcvYwJbM3E/iDWV
	p5nneEfphAEthAtuYaVl7GaYNwc5A++8RH43YYjFnTBntaBjFeYvAXHD4chQC8sG0+HbFmRvscY
	4bDZTpKI6sFO7SyLO17G/rNycQm+lfPGOEQMOx1mBpFYy0kVlJ1N
X-Google-Smtp-Source: AGHT+IENb6XUcPxgjKLkbP0qmMhjj4SlaApewj8OHzgfqDb3t6JpoTvdMHoBjymD6/Dx/su/LKlmPQ==
X-Received: by 2002:a05:651c:158d:b0:30b:f924:3554 with SMTP id 38308e7fff4ca-3107f6ceb59mr3523531fa.21.1744791736738;
        Wed, 16 Apr 2025 01:22:16 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:16 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:31 +0400
Subject: [PATCH 06/13] dt-bindings: timer: via,vt8500-timer: Convert to
 YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=2962;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=rQgBMOj5Ew34+i8Xh45VB7HVlc0vQ+Js8dV6FOcVoJc=;
 b=cyrY8bMMM4FzShamz8Jror+JqU2ISzf6zzaPROlnVffmoBLzeE/nIs/54j2YnWjYCMyICGaYB
 JTE1vN/oiyZBT4fRur+pa8iTMnrcMs6Mp6t4Y9oNmKFM2Z3LQb5CkuF
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012219_223481_5BB94D15 
X-CRM114-Status: GOOD (  15.56  )
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
 .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 ---------
 .../bindings/timer/via,vt8500-timer.yaml           | 36 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 37 insertions(+), 15 deletions(-)

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
index 0000000000000000000000000000000000000000..7d9dc93b708823de9594d20ef6b7e0367c5a36f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/via,vt8500-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Timer
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
+    maxItems: 4
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
index d131004add981446b08b1b3d572a3daa8377fd61..46339ed45ad18ab2b9470c749f604d9aaf72015b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3432,6 +3432,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
 F:	Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml
 F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
+F:	Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


