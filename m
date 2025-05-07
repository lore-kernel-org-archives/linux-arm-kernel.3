Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF19DC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 07:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VFeUtVSK+P31BKn8p8TOmZdmNczMOu9CNSWqC4iQ/A=; b=19ytB/PNo6f1rLN/S9/1i5PwLD
	AAauKjYRepTSmtIQR2r2vONx+hB94hw7kyDh59LeAPF7P4u2v1Sabwty/uxF8RufNhGDTRAVQogNg
	++nkP6auyfmPvkqgdH/PzliSBATr93DVjEOAJfj1oMOWPi+C4kM2Pf3yfyFZRDl6dOWqN0PCV8tmz
	8cMxHmivGMxEh6la/6Ng0gdajTJvQAlB0olwHaMNGqdw++0fDVKuxqecDL4MWQJ/xCDO8jbSIhmW7
	bEwCHfiox4KMaZpTvFSmDuFYGRhzKGg+fUW/RtYN1xPnm8yJxOd3zAU04r7TyqbgdelbU79YCNqSS
	xUxCh+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYls-0000000ERut-41Bz;
	Wed, 07 May 2025 07:00:48 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYjv-0000000ERWn-1qvA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 06:58:48 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-309fac646adso639902a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 23:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746601126; x=1747205926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VFeUtVSK+P31BKn8p8TOmZdmNczMOu9CNSWqC4iQ/A=;
        b=Ax2oe9IY1j5x3Y0piIETxXZ15ZDB6+vIZnh7c9eT9vyThlymQNyczvGbZ+w/Mg3QXQ
         wvfnogdbcdWDykOend86KBVV/b7ywQDmjlOiTjlcGvVizP5Em4PjTo8Qymt2tOm3Y7Zg
         xUKSWhURMR3n+4kohhdeIq25GngDfzbkXmDHYyzudvpDTYJRzHmWFOopJbsw/yjfQmgx
         Q5eXjwIiVDuo0MjT1SOYyOho7F4BMWansR/aBEtv0B6lmPJxpjnpoUz/DOWh5kHXDULM
         ehR7DRVU0VCEOkCPPB7sOP+jGlyg4DMEGcGLiTrEwraT77Nt+pGVUUzKbeCmmSVXs2b7
         GK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601126; x=1747205926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VFeUtVSK+P31BKn8p8TOmZdmNczMOu9CNSWqC4iQ/A=;
        b=jEuyA0ruyRwg0QYuiQfKYneNvtPv85h8lq8CJUHur2Iw2i4hvkfHYNFZPPKI9kV2Wr
         6o+ZGZG4QfMicJ4sO6RxuriCl9/oqdGSkDn1g3N9yMQZyFf4Km1FgVa96vkzWNEER2ea
         /R4hnvk9a2Smph9zUt2i7ZhgW/UjM7tXYP1g+prEy9Dg9kK8qwkCOb51PbM/XeRpSgZo
         HxPdUsYvJK3+aWu8H05Y+W0veL2vcnJZAK1k6HTPIYNWE0yf+8a16UJ4GFokEzKCWvl9
         ztBy6zX8SwIKFsEG/T8UzwdGFlB7QHoWrKaxcNBJZx92gpg2VpPH88LAhW3rkkIUC8JD
         oqJQ==
X-Gm-Message-State: AOJu0YzVys40IuQoK/aYKi+KlBPx2mNZs+532f7l4XSnAfPck19LUjbX
	z0k38QDgzZf79ST7tRaHpzvN0ah0EKHXpSJ1XPq3trqr7kRyQbUY
X-Gm-Gg: ASbGnctUP51kp92I5J6nQ8LDJP5s4q6fmfkDB0nq7IkEN6JD8KM+xSubE6dAo2A5MeG
	R4lI/jf62dIlqXX6mulxzHFHuzaoH+/c06+AEWCq0G+bjA+nEgiXHBW/4+CMb5/w23vguva9l/U
	GxcqvOQleDgBy+QvAVf3xl5W14z8iWGmmVoPJd9w14iFw9P+0JrqTuvaYdGPvYaQx1PRBTHp75j
	xcb83MFanDy2rO/tXD92o87n8393N5liZy1AAhpscQcUDhkndL4/VERKYBl4mp1BWYe1m1pVoNY
	n1K0btZUur8fUMwN+hd4npEvRc09RG0CcE0P9JFCTu+6jfhJK9B1
X-Google-Smtp-Source: AGHT+IFWFsMpADeikjRihtABsrJqSE4NbJAS2GkCODo9n7rqiq9wTg7u55ZgGsyb7HunzWU8SJznsg==
X-Received: by 2002:a17:90b:1d8a:b0:2fa:3b6b:3370 with SMTP id 98e67ed59e1d1-30aa8829e61mr3655144a91.16.1746601126272;
        Tue, 06 May 2025 23:58:46 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae525db4sm1315529a91.22.2025.05.06.23.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:58:45 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 07 May 2025 10:58:30 +0400
Subject: [PATCH v2 1/4] dt-bindings: timer: via,vt8500-timer: Convert to
 YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-vt8500-timer-updates-v2-1-65e5d1b0855e@gmail.com>
References: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
In-Reply-To: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746601114; l=3856;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=8ur7PF+h+OoYNnx+CEH0MbXd0jVGhfPuCWw2eRDq/R0=;
 b=lhE5lWPmUzXCbmWvbeOwQgJMVk1YQ1w5MFmgMOhRfho594LWwPSCvWhcrNB/QZCJF9Me0JwNa
 o7U4TEIhxNqBkkKvgiCqek98wq8QKMYQ0bgDGp4TiocThkarTIKEs7D
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_235847_491451_C8B1C4A2 
X-CRM114-Status: GOOD (  18.73  )
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

-- 
2.49.0


