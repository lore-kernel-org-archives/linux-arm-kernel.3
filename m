Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A0AC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 15:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7AL4unDmRg0o0GGoNE8HkFCc4SOWy+X7dzSvx+7jpEM=; b=QKGWo2NYFxWu23MzOlY0d3sNAF
	Dl36JqkxFXoTOQN+KesByjhqYVMcaJ44SQZAnto0Joy/U+pXXuoHm/NSsgYaapJVq5Loh/mkDaELM
	ztX4+Qf3U2bKh453EbCtZjK4Ft6Ka9cEEHgozUS3Jbk6tUrTjD6S9Gi3qJcszEZX1XHhQYN6/Qr0Y
	VTnp+iNdN+XT+VQ5OC+EhUcWCNLlxh8gS8OR2bKWlIQPvSPkQN4sBSRR1AF1IWl+ooIHu6qR26DZ0
	leyuH2kZrwrbd7Uf5lv8ROFG+XHMRDLg8sJyq6VMJd7/Th28KEblKXwjnQsG8Cs4SMT7pZhip5S17
	dqQ5ptoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nC4-0000000GYWB-0Egt;
	Fri, 18 Apr 2025 14:59:52 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n7e-0000000GWmB-40CQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 14:55:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-223fd89d036so24372545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744988118; x=1745592918; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7AL4unDmRg0o0GGoNE8HkFCc4SOWy+X7dzSvx+7jpEM=;
        b=EC2nnvvg/MTrKQ1GoPLctKLCFnIunPfLaDtatklJIjiUIqSMgue6zRq/qBWVO9uRZw
         e6Qzfvh/fthL0mQw6gLk7JyhT1j4HLd0gFOBRxj1X8e1ZBWxpStVmsJqNF4qJbrr088p
         nDBDLtDUdAU/F/lF4TXfuikj6TLn6ILT4dLqQrXclHY8kreTdRVClnJXlFB3XySuBQ0k
         dBK3OMZxlKOQU1YDR/ndmrAOroufuo2ymV85R+LYrmjWX3lDSpsVBDWHsJ0sZaBNAmtr
         QeQr23iGm3saGEhL7FQqjyajXdYzAFIFwenMrsq3F4mV+j/aBblNc0b+4yRBjh9P/Neq
         CHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988118; x=1745592918;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AL4unDmRg0o0GGoNE8HkFCc4SOWy+X7dzSvx+7jpEM=;
        b=lJO8tdkXflEZ63AJWjaeZ5Y65Q2fdh4Iztace0kC88ZCdnzzj4o4+F3B9y5VjWcy2m
         0uxYdZ/e06vVRjy8FVzNOBAbAkapfjf7onn41ALi23MuvDSWeXRqyRQapQYHPrNx5hqK
         Z2jMP7lhiYwxwHq49K6X32i6SIuRRck+F++GZZlkjq2ByDrWiWuo3PuvHpLXD8HTymPc
         ENwjsmj/2LiB8rdQCkCyYzVPlBxjoi8XrM4CH1Uvl1eezEOAZyEaFHldrSXBd+9wcH6y
         d5xDZOOq4/FAcImSQGYGfr2xksPs9CtCYnH1f+oJ4gT2QPNuUqtbX5Rd8Qhv390JOFpr
         IpiA==
X-Gm-Message-State: AOJu0Yxak+I1edD0QuL0PoJ1AHMCFDdolGT27yIwg087PqZscPWRZan0
	p6YIVgip90XddqQXsFt8I+DFFmtDdoT3CEhkyzPhK22XUtOIW3CI
X-Gm-Gg: ASbGncvVg5pRE0La6MqUVzEwUWyf/b9YauiFSov4jXuMr6XBnEHOIWCIsCk59FLDXG4
	bxXPhllzJpA7+HPGSkeaogpoCwfCRWE5cpqdH/b9cur0dRufVdK1KB9CjRxgyWMaUQd0N2j7yEa
	EzKUVh6+eO+Zt/X5MTQHqfS7id6mqQxvIqnmAey2Rx32Fl9gHTy6TcKhuKzNQY8E9P6TQ9N9fQV
	TuUpuwe98w2dzaIGyenQtIkujHlogkVyIgZgWqKqMdIjO5xqBRBeDVp/VY21Aa7VccHxs9FKzFw
	mRYxk3TINHNOnwoF+IvzGTKrG18TvPuaJdiG2bEXJvACJ1Qu1Ddc
X-Google-Smtp-Source: AGHT+IGCn/S0qj9GuJ44fQmtWgz5m2TwXqJJpT6TiLeYnQy6Y2uJkuYa90jtpXsoVH052J0M2cNJCg==
X-Received: by 2002:a17:903:3c6b:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22c535a7eecmr49716645ad.25.1744988117862;
        Fri, 18 Apr 2025 07:55:17 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf18e4sm17854525ad.62.2025.04.18.07.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:55:17 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 18 Apr 2025 18:55:07 +0400
Subject: [PATCH v2] dt-bindings: pwm: vt8500-pwm: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-via_pwm_binding-v2-1-17545f4d719e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMpnAmgC/y3M2wpAQBSF4VfRvjbFIPIqkjAL+8Jgxqnk3U24/
 Fat/yILw7CUexcZ7Gx50g7S96gdat1DsHImGcgkiMNM7FxX8zFWDWvFuheR7NI2RgKFkNxrNuj
 4fItF+dlg2Vx4/cf7fgDFRsFZdgAAAA==
X-Change-ID: 20250418-via_pwm_binding-32f7c4e5ede1
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744988119; l=3573;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=RoN3cLeK/9p9mwdRIwmQYy7Phi1BWqjDBzsnmtQBFGY=;
 b=LEtfxtqx3xa3LOsxdPHifRaAXT5Bd6L98wJoxAe3kyGxMg3UKZQxWyxWkoyl3r+NjtusWljVE
 3vyWnJT18z5A38kVLX7VFmV/ujaBPJffn9OXKAF7PHUjKEk7C29CeGp
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_075519_010587_FD2D67D6 
X-CRM114-Status: GOOD (  17.43  )
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
Split the series from v1 into separate bindings patches so as not to
spam all the subsystems with unrelated changes, per Rob's suggestion

Changes in v2:
- reordered nodes in the example same as in properties (thanks Rob)

Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-5-f9af689cdfc2@gmail.com/
---
 .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 ++++++++++++++++++++++
 .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 ---------
 MAINTAINERS                                        |  1 +
 3 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml b/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d9146ad715ba74c1f5641c33703ab06577fe80dc
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
+        compatible = "via,vt8500-pwm";
+        reg = <0xd8220000 0x1000>;
+        #pwm-cells = <3>;
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
index 96b82704950184bd71623ff41fc4df31e4c7fe87..b4a7e04e586bc0fa2913dc97b99ade0680510bf3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3428,6 +3428,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-via_pwm_binding-32f7c4e5ede1

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


