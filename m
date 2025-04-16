Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9777C369C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dj5PT88n8b2JvNXoUABiLvbxSkILiT0Rl9oj3LLY50Q=; b=M+1tQwDSkmMVk9nPrHMPjVOM/E
	zb9EEhvoPWUdUYkcN6LYjfduDWa+qns5lVIfnDs5Ikxx+/jRt4tNuN49xqmkiyEouNxCFP40x4zrQ
	/TpkOMO8vkeXttwJ0U5Un9bJrZqQw45zkZXShItsE1ZNtTXIvl8e7yyFlEsmrutHNUSQiCdzaK6/M
	MZ2oQR3/8ef3olo5X0J249yT2HRH2XiNwGXjHqzS9D1MC22vzhy85nHE4/Ng5P5pJIdUp0bjHvkuX
	3iy1k9HibIe03Bq/bHH/yj7CNT7XibGbNueCg4WA/jc67ynj0DhyuYIWJ+rw/HlbiuB8VF8/rmDg/
	g0f0etHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502Q-0000000985A-2h84;
	Wed, 16 Apr 2025 10:30:38 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y2A-00000008nXb-1C0f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:22:20 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so58821131fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791732; x=1745396532; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dj5PT88n8b2JvNXoUABiLvbxSkILiT0Rl9oj3LLY50Q=;
        b=SeLRkXDYoXPiJsjxsWcH3RW+o2nK7hJ/W1oiLmtgLsRKll72wY1KKIThVWfS3Zbm9x
         7TGNHCtaqy487wLi3wEtb2oIA7M/5nI13ucVU3pPybXAqykGb3xLKz2OjJwG65qvJX7P
         uUe2S9UVtGY1WhNWDNZtBVHSlCkcxfNJYYhXp6zfQymxHX2+HvmOEEUqeDdD9gD5jO1C
         TxFaLXFJ9mkpJ4qlu2m6XCwHITeFGBzpIK9nG5Rv4Rlxqx+jbqbMaDcv1tG1blsa2qPc
         ceXJlqbIjN6qlPDtzm+Hr/7FTDLtjlTjmHze3QDcFW50lSbsu6PXTNDLpDtxoJVS4WHC
         d31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791732; x=1745396532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dj5PT88n8b2JvNXoUABiLvbxSkILiT0Rl9oj3LLY50Q=;
        b=qzM7Dd8/uUQ0IneHYMy1gyujjAuHD3q7LKO5vOTlDBX9+au0TyopAPqOkDCmYNYbpv
         m2JMm6fEMLpRWevnqVM2zMLYuVvPEzDa2+jU2fCifIlLiSbhBn+XFPaqVp3WgcdX4EvY
         cTEIOmPtPnYBlPj1JiCCuTy+qHo/4YzBGbAMDRQZt7xeTJRNA/VMykK6FTENeQZ0BRKA
         NqM7PcWfbvn+lOi5DAbQEYlLWSw0yuoWcPsOmboflAYwgOpLOr0MBjsEPPikQCRb0Aha
         ZTaj/iuzo2iSRtvlX3wnfS85nveFecs2NmbtRH0+ErRJ7k2kqdfEKPpEnHchHK6qlg9o
         sJog==
X-Gm-Message-State: AOJu0Yzt8eEmMQBzI9MU8k7uzBKEgsCG3fJ3LIsQ9K4lcoZIaYNGt6WS
	q83U48J6X2YBB1SOxFzbdEERgXBxN7c/cJMTmfw5kGDdrCGhIEZN
X-Gm-Gg: ASbGncvn3FKL2wsx/xZli2Kf4yp/Y89i1ss3w8NZCn5lo/ShxQ44oCbmtiEkLVervG6
	3cPY3W3CG7ec0TLliw9mjGdFhce9Z3cDkIJjQx6mRGbluQgcUrcN336TkhIXvJo0SH6dJcDXcl2
	jDxhSVvFHA+NjTR+k6s1nsWRp1gApZbud28sAGl3QLNx2OeukrYGryPBRNoyFX7lZ80c9Njv+To
	Vq7U6zKqBIsKYQ0a2/5jzTc1p5/UNk5LHtD0zl7SeRJUlF+mLSn8MFwU+eidsgbswMklZ4a4lku
	BFRGAN1+aBudvta1PxWlA0PL2/BgDDoOaGikAl07H1AKj3N5C0ww
X-Google-Smtp-Source: AGHT+IE9lnGE1KsUoj9JV0gEDYMhu1y4IoeMb6WofbocdBnl/7R5ilrJ5bpyWUq8Z39pTLiMZzYGWQ==
X-Received: by 2002:a05:651c:30c2:b0:30c:719:1145 with SMTP id 38308e7fff4ca-3107f6cdb69mr3020381fa.17.1744791732408;
        Wed, 16 Apr 2025 01:22:12 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:11 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:30 +0400
Subject: [PATCH 05/13] dt-bindings: pwm: vt8500-pwm: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-5-f9af689cdfc2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=3177;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=pSa2/+lArCQElaZ7zv8t6mgy94jBQOEPi6HZFwmgmf0=;
 b=5IArVazk/Vp7LbhkSLdoFtXb1jIC+84A1bxqEt5dF1N5SFJ/vY/W23YdW1D3UTtXNTpblMARY
 j/mELPMv6Z7Atzr05vYG8E6JVZSf03GFFz6XvrHPh1UESoohzwmf5mg
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012214_339301_B483302C 
X-CRM114-Status: GOOD (  16.72  )
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

Rewrite the textual description for the WonderMedia PWM controller
as YAML schema, and switch the filename to follow the compatible
string.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 ++++++++++++++++++++++
 .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 ---------
 MAINTAINERS                                        |  1 +
 3 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml b/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a5f77fa848e0f604bed63c36b8e0996cf599cec0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/via,vt8500-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500/WM8xxx series SoC PWM controller
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: via,vt8500-pwm
+
+  reg:
+    maxItems: 1
+
+  '#pwm-cells':
+    const: 3
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm1: pwm@d8220000 {
+        #pwm-cells = <3>;
+        compatible = "via,vt8500-pwm";
+        reg = <0xd8220000 0x1000>;
+        clocks = <&clkpwm>;
+    };
diff --git a/Documentation/devicetree/bindings/pwm/vt8500-pwm.txt b/Documentation/devicetree/bindings/pwm/vt8500-pwm.txt
deleted file mode 100644
index 4fba93ce1985a1e4c5a361423725fafb10eaa339..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/pwm/vt8500-pwm.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-VIA/Wondermedia VT8500/WM8xxx series SoC PWM controller
-
-Required properties:
-- compatible: should be "via,vt8500-pwm"
-- reg: physical base address and length of the controller's registers
-- #pwm-cells: should be 3. See pwm.yaml in this directory for a description of
-  the cells format. The only third cell flag supported by this binding is
-  PWM_POLARITY_INVERTED.
-- clocks: phandle to the PWM source clock
-
-Example:
-
-pwm1: pwm@d8220000 {
-	#pwm-cells = <3>;
-	compatible = "via,vt8500-pwm";
-	reg = <0xd8220000 0x1000>;
-	clocks = <&clkpwm>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 001dc954fb44cc9b26570d663ea3bf9214c2deff..d131004add981446b08b1b3d572a3daa8377fd61 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3431,6 +3431,7 @@ F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
 F:	Documentation/devicetree/bindings/net/via,vt8500-rhine.yaml
+F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


