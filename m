Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A35DC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zF2nLiIalRwSIJzUkKVjQarCty9tVHGhPYWypqzVXUk=; b=vdMTsH9RDyiYNAKfs9a02ikrcY
	5y24UyorQT+LqXlSKPYO1MHvNERtJvr7DWFwI4Ag3gFVWGSAQamVTpVHR/8XFvfMaaKCnzsKpVb3G
	OYzT8jviGaC5zFyQWYORo2gEJN/ETokClvHPKGLMqS86ixzmkx+a+pluOJ2NGb0DVyOk5Pyg0YtzV
	Xo+OSEDIciiaAuKpewT1urlHr7avukEBPuo6pKqSWygg0zkjSHJUinkozCk8gdIyXgW6MVm/QE6zo
	/4E+U4jRj9kJyzlJh4pOx7cFV1/dAbFIcKwwD8h1RUQmmS+mt1qGo6dqBkNo0Wq4Sg06yytYDfKNw
	8ncKkGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502O-0000000983g-0pIR;
	Wed, 16 Apr 2025 10:30:36 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y1t-00000008nSc-0HrJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:22:03 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso61635401fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791715; x=1745396515; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zF2nLiIalRwSIJzUkKVjQarCty9tVHGhPYWypqzVXUk=;
        b=k2Ev8iHH8d7K0gVWRDpDof0g9SsjNmo7v43sOavD/dKB/qTiiAd0HOTb54bpw4RE+k
         mXm1rD0gJl5vadFEQ42pjQhD+hz1y9sI1HAZXCM3PcTcqCYbu/8V0SBouY1QWTxbPHvz
         9+EfDx+1bo/B1g7tRRmZm7wrZkQc6+sMs+gklsjAFoCTaBH6kjtZksGkpBGAav9xROTs
         Adyg3iOQBonrswdVWiH9DfArN4t0fzpUKy2C9hYbzcfBWqGqFZXKSNIH33Zeu6Wdff5g
         LyFd6cPD2h1aYYaqSPQnEW8HIIJaQNv/su55PH2miigkOQMNEVwJC8mRV68saoRdahA7
         OMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791715; x=1745396515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zF2nLiIalRwSIJzUkKVjQarCty9tVHGhPYWypqzVXUk=;
        b=FrIpgiWPGUPrbO0T71HcMDSvEv/tvSnzxBhs8DT55sccI5UZ8MCLLzY9TiSXWFp41u
         iTe6RUgSyJVaDLbKdaXDaCP/i5P1z5clBcDV5YjMjXmesvSQwMtF+rTuyS4b/TYjQ2s6
         qsKeIcerWTwn/6RtVAKlrZImMa416ckksmbH9CxTayjWjLIrx5Gkv3eT5Gohp/XXVu8Y
         MhHSXWy+GcPqcNF/Dh2f4pmfJCRTaDRfqs8t4DoDwM84OO1FGv8VxUp3F5gOat5fyq9H
         KrW7h9IiAkyND0mBOiD5poDV76CqTp7snGQAfSNVPRIQGaqzXOXERfOru1kcqXtbwM7R
         toIg==
X-Gm-Message-State: AOJu0Yyiefb0a3Uz/GTq0JAg2j7nE7Q0FQfdE25MPXgPNqgwhtinALAh
	2h7dTnekZQ1PIpLpKORgPM77sFZz49hioeoJ0nLCvRpPHAs8cF3z1ZLxKO9Fbtg=
X-Gm-Gg: ASbGncuADVA5Lr2aOHIEvXlHdWllnLdQYGOO9P8ZDfjvmTcTYNRLs96/9tSd6zl4vr5
	2IyJHz2GOCxL5XzYM0OshgFTl7Ejb4Ovb89ombVQmA7VFMzBQfzEZqNCzDzBByq0V87R6Y8x3Dt
	FTIati8GWmkSrUqQ3r3I/XMQC4GOsTyqflrEeSP75fdXi6s5jULi4IJi3df+wYU9wwEfgsUjpbU
	Qw2yarymAnM/wRiBifMFfNktkY5bsaNZIR0WL6Xm0kuWECnMRJ0iB9zG6ZvAzwy4w799VndHlm/
	NuDi+ctQoagPuXjVfWWErKls1Sz2QvzBt/CQWBHQitiunwkjZ6kF
X-Google-Smtp-Source: AGHT+IGKgbxsPUZ8e6QYd3i4IL00BMajnpxY3Tdn5JifjzSLJUZac+Wl2mqvZhg7yql0uqt789LhJg==
X-Received: by 2002:a05:651c:514:b0:30b:bf4e:f6fa with SMTP id 38308e7fff4ca-3107f6ccf73mr2651111fa.17.1744791714786;
        Wed, 16 Apr 2025 01:21:54 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:21:54 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:26 +0400
Subject: [PATCH 01/13] dt-bindings: i2c: i2c-wmt: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-1-f9af689cdfc2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=3424;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=rLGOiAxFmtYr1z3EibKMzDrgcDWDiyp5KqoWHiu8Zvk=;
 b=AvOr1yeaqVjcM1b5V5n4K1CJRJqYHkLcBKvJWXi7s5DMJOf09NZaw6K648Ll8yfbyrTB3ZFZD
 6i4O11iiDG5Ajw3JEeQqkInw/fcubjZaW+5LjzieHsw4wBG6FC/ToiH
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012158_400077_D3244241 
X-CRM114-Status: GOOD (  17.33  )
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

Rewrite the textual description for the WonderMedia I2C controller
as YAML schema, and switch the filename to follow the compatible
string.

The controller only supports two bus speeds (100kHz and 400kHz)
so restrict clock-frequency values accordingly.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-wmt.txt  | 24 -----------
 .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     | 47 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 3 files changed, 48 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-wmt.txt b/Documentation/devicetree/bindings/i2c/i2c-wmt.txt
deleted file mode 100644
index 94a425eaa6c78bc9e3136ae7055b51635baf16ca..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* Wondermedia I2C Controller
-
-Required properties :
-
- - compatible : should be "wm,wm8505-i2c"
- - reg : Offset and length of the register set for the device
- - interrupts : <IRQ> where IRQ is the interrupt number
- - clocks : phandle to the I2C clock source
-
-Optional properties :
-
- - clock-frequency : desired I2C bus clock frequency in Hz.
-	Valid values are 100000 and 400000.
-	Default to 100000 if not specified, or invalid value.
-
-Example :
-
-	i2c_0: i2c@d8280000 {
-		compatible = "wm,wm8505-i2c";
-		reg = <0xd8280000 0x1000>;
-		interrupts = <19>;
-		clocks = <&clki2c0>;
-		clock-frequency = <400000>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml b/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e498ce47b885203fcfe233b946f987abdac6784a
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/wm,wm8505-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C Controller on WonderMedia WM8505 and related SoCs
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: wm,wm8505-i2c
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
+  clock-frequency:
+    enum: [100000, 400000]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c_0: i2c@d8280000 {
+        compatible = "wm,wm8505-i2c";
+        reg = <0xd8280000 0x1000>;
+        interrupts = <19>;
+        clocks = <&clki2c0>;
+        clock-frequency = <400000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..c5195a98b15a39583d337fb6310b80432b0f6922 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3427,7 +3427,7 @@ M:	Alexey Charkov <alchark@gmail.com>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
-F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


