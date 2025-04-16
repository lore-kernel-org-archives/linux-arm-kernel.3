Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C76C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8qy9kZJ9vS/40HWYigFrcHUynaDvE5wR9i1xbTW0Jw=; b=TS5nJ4Ue2A+HejZNEC8lmuyilX
	PKMvKdbPSNiF+1jC9TfXDTmDrokwO8b61EerFafUE1GfuiLIPqcQUyDEsYPpFvRvh3R+jElcXj9yX
	WE6rOoPe2bx6onOI63cnhxpvAHJ3AQBbata1d3thdQLZMpTN6FewdDSjhIRT2KWtZypxhPh1GD7Bq
	OifFpd7tDErieI6pXgsw6qJAIEYoVU1Nq961qzdZ/4rn/rJXpEbjRL8MAvC7J4oI9OllyF/bWEE0o
	yarN87K81f6oRFg2fto/ghSPa50bZ/PoC1GqPhAXszC13wWoYXHH9CU7rB9GuwJctPPj0hVtA8qec
	jo6n2d9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502Q-0000000984r-0F5w;
	Wed, 16 Apr 2025 10:30:38 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y25-00000008nW8-3xje
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:22:11 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso34216561fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791728; x=1745396528; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8qy9kZJ9vS/40HWYigFrcHUynaDvE5wR9i1xbTW0Jw=;
        b=jA0e5f97TavSRpEWasLm8kcHMt/F8oefJyN1TMhadXBRGfCFbbrGfexS9xN3laLrPA
         UmvgFABG0hw2GV9p1EERhI/W1WsfksQfY3JNpaVsNzOGn86lPXXA2in+vty6YmcKVCFV
         F21WJjkKV0VNHlHuCzgbkRwfmSPQ5awnEUY3jc604wIEhqRvrgeMJweL7Tj6M6LcmhUe
         91aShxETWRSvuRorX+pNDSZmTHMOFuqYkqlHKsOc5fV6PxOqA5SK1X+G6Sl89b4xCvLK
         GL7dDinOKToKkpAUeNxK870xs3IxiKeaOgTFHTnF63bFdBU2Y0YBNdDqZSBcw0+qHcl8
         r0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791728; x=1745396528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8qy9kZJ9vS/40HWYigFrcHUynaDvE5wR9i1xbTW0Jw=;
        b=Sq1r142hkYurPE1OS8CLzIb+5ZiIITgSfk1G+o9gfU3Zi8H8tKbPwmhcYTt1b7wDDE
         Oqg4h6hZeJ/h3IeGPcl4xP2+3pXaPjpcX74/Sy6B4LEbI/yAtoHdSFTM9PiLXNKWvoIK
         A10vrZ52AqSCCwRcnyUJtPhCkJ6/sN5vJqP0n89tDEvTf9AMRwqU762PcbrCuNHH7bRm
         uRzud9M7qGE9vON088AftAfC2i5KvWBuCKNHzw/htaUHfyd8aK7sCqqggRz5lwJY3x5F
         qTkSi+Y29fq/s8dD4Qcg1tXJ68/rbALNIO5I1rNssAeL3rc7qaL7mLshivboB6k+0oq+
         XhAw==
X-Gm-Message-State: AOJu0YwYcefPHaLAq+X2l170jm+9YsfACpDMx3EbVb/ilFCl2VX8PBIW
	HmpA9C45ZVwCHf+Wm6ikg+ZkLmRVYMqKpKHPQJIQLF2BEHZIosZWgbS2ZO+4kJI=
X-Gm-Gg: ASbGncv4e1wWNSqYm73RCuLFkP9PWSG5ZqaJeJTuzrFoFE6Itbqyl+fDDq4xS4RK/Fr
	fRLuHZFrma1CFRaaMZ6FC5LmlY4alxQeltg9GbZVYtzxO8dW01M3QWMsTOuTorfT0nSVLXeHENh
	c7cZPXPO2OLWgznfpYP5NzBTAFTnKSSrpY+XA8iLUmDPE7vtARMqrhYB0NN4r1E5e2Jrp4GItUQ
	gKO6OJs99BNj7veDRXEcH2jLUkf+pHXvtr48U+Yt3SJi10NEIHbdQ25jziXHZxn+ps+vudWTzLW
	ZCMe0nb81HJXDxMm11QCy8fqSYe11fComRF1/YZskS9rYnbWcn2r
X-Google-Smtp-Source: AGHT+IGwzEZB6Wbmx5s+djW77Fr70WX50lyYPxCuVy7xrw+kB3xOzYK/2x15WkC714ccSbYnStizXQ==
X-Received: by 2002:a2e:9a0b:0:b0:30b:a20b:6667 with SMTP id 38308e7fff4ca-3107f6c05aamr3727991fa.9.1744791728015;
        Wed, 16 Apr 2025 01:22:08 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:07 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:29 +0400
Subject: [PATCH 04/13] dt-bindings: net: via-rhine: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-4-f9af689cdfc2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=3176;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=dcxoptYL9HCbCFT2aZUHR8rimZgrebZryeu0MSpFEqQ=;
 b=bKiVZ4hj2U8YtTwvKXSFiS4NkhtwWoP+P9aKp8A/9LH8ZAT7I4eZiFe/vANxcE9TXeY64CXXo
 8oxCvDfslRACOPN9zaJsiJo8fsniCDH3sTpfUx2IYeNPt39dHTsV8z+
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012209_987880_F7775B3F 
X-CRM114-Status: GOOD (  16.35  )
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

Rewrite the textual description for the VIA Rhine platform Ethernet
controller as YAML schema, and switch the filename to follow the
compatible string. These are used in several VIA/WonderMedia SoCs

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../devicetree/bindings/net/via,vt8500-rhine.yaml  | 41 ++++++++++++++++++++++
 .../devicetree/bindings/net/via-rhine.txt          | 17 ---------
 MAINTAINERS                                        |  1 +
 3 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml b/Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e663d5a2f014788481dfa0c612c261eb6adb6423
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/via,vt8500-rhine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA Rhine 10/100 Network Controller
+
+description:
+  VIA's Ethernet controller integrated into VIA VT8500,
+  WonderMedia WM8950 and related SoCs
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: ethernet-controller.yaml#
+
+properties:
+  compatible:
+    const: via,vt8500-rhine
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet@d8004000 {
+        compatible = "via,vt8500-rhine";
+        reg = <0xd8004000 0x100>;
+        interrupts = <10>;
+    };
diff --git a/Documentation/devicetree/bindings/net/via-rhine.txt b/Documentation/devicetree/bindings/net/via-rhine.txt
deleted file mode 100644
index 334eca2bf937cc4a383be87f952ed7b5acbbeb59..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/net/via-rhine.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* VIA Rhine 10/100 Network Controller
-
-Required properties:
-- compatible : Should be "via,vt8500-rhine" for integrated
-	Rhine controllers found in VIA VT8500, WonderMedia WM8950
-	and similar. These are listed as 1106:3106 rev. 0x84 on the
-	virtual PCI bus under vendor-provided kernels
-- reg : Address and length of the io space
-- interrupts : Should contain the controller interrupt line
-
-Examples:
-
-ethernet@d8004000 {
-	compatible = "via,vt8500-rhine";
-	reg = <0xd8004000 0x100>;
-	interrupts = <10>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index f106850b9d3d349d82953b672588b967a37ea27b..001dc954fb44cc9b26570d663ea3bf9214c2deff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3430,6 +3430,7 @@ S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
+F:	Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


