Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1045EC369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnFDDxT3RCgs4hQuTzPxo5KdXonZCEcEppJRXPSAGGk=; b=aIS0DBmrnLpujroImxvjbGgGso
	6PWVUDrA95WrULHCPe6Jp1o20m+0izuKNOvq8t9z87kp1SG0ksCBHRi8vxvJgXSTRWDbp6tksfA7G
	9WULDaU+cYhzJ9GER8lXvWnOTQ2fJAM8lTfOuiLwxRDMMEviwItDpilIGFVFN4vH3hyKNaWLT+cCZ
	5Ru0w5dgUU9zX4vok44TKdkVchjXe28b5QtrXv3/teL+X9418B9ponfwtO1UU/n0AAqcV3tmzwBvX
	VtZgJIA7TGLiRRQ+cBFUkDIw0sNj9Su/5vfTtp29FyYHCwuMQvkn2HdiIw1jKROxuM5FHjDG/VGET
	lXcbcYYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502O-00000009846-3P0h;
	Wed, 16 Apr 2025 10:30:36 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y1x-00000008nTL-0uDI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:22:04 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30f30200b51so64528021fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791719; x=1745396519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnFDDxT3RCgs4hQuTzPxo5KdXonZCEcEppJRXPSAGGk=;
        b=SlWBZBo1i/FgMCvgfMudTYn227BZM7bMzw+tim99BvedwhDmwgiETlt3oz7/RHVnFv
         9Le3YIwwGxfmjqX5wBEefGoptZQBOEX9lRIWUZ4rYsQo2Nx9r/MS0zX/mJTvtIw0erk+
         sUD/+xTGfOw3hoTbbcRq3NUc4PAbYkLAiKF8hR1PEGzi3fW4sLoJ+Icc6jRFG3UrV4FS
         Fqh1/EzpuGBtE5fQB3tmvP4C5Bs0Kq6sn1p6iQn0kyeZ6sTShD4I1HPr8a2j8/A0Oe52
         sRf65pt2ziR3HmjBrNrFsGWeBkFoc773ZOB53woq0XNwEU/zL7K1KQ+O60pKwj9s+iF8
         ynFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791719; x=1745396519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnFDDxT3RCgs4hQuTzPxo5KdXonZCEcEppJRXPSAGGk=;
        b=Fv2a6WX5hEjYGT6H93f1X4YPBBSXKMTy6aRyEWijylYAcOJiW+h4PZ3P6phraHalza
         pLbcPA+syJexAA/a3ThVxR+16gBekTPNfm4BenUTpFe4wbd366BNW4ZJl1bmiEgypY/Q
         OlXYmjFI1eDKEOVaKsrbY9/WnM2tsjxsKn45oaT2OgPeWIKH12dS72Uf+MjOWtY4P+7W
         nJD+Fm4T5bJDH1vc3dozpl8xfXqWjpObPriBWAlPLDkOJyMw4Yp3uqkBJD17MZgRTyI9
         wqGQZX6o/GtFE6i8T1JJ+7zNiVViZsAfFEcwkFoVSfUhQYoMAZq8p+7Nyp68mQUInj14
         tp1g==
X-Gm-Message-State: AOJu0YzHG/hyR6dTkguXrAXvZCamIg53FIN2+hCU25ZYTWxZo7aEsvry
	B8qFQtBFXqwTgrl92JBoCgUdAO+2JhxD8qK4nrcscfBGTVz0UXPB
X-Gm-Gg: ASbGncvkUWtnyn5yuqUnk54JfZHY69fMbP6jeGzBlAnIONhdaqgmhaRiob0mynQwnHl
	SbRcaIjVNux2/FyBdod8fF9Rgi2nbnEaKbfh8rsz4HW0WhM3GJZ2+/Vi+saEhSSuUXkfg4j3lMM
	MHPSVfV3rJ2oVITr3ccSR8ui6kHD+rCXX2DgdidEcSul3OtpbemmNQH/JdhubQDuiZJxacR+7DP
	SxUE3APmN4PQ/YAn6Y9TA1IfR1B7cbCw+yxISDXw5NmQKbxy/oS7Qh2AWb4Vy0KNT5+OXkT/eOY
	sDOnjSPjWV2BpAXDIYlcw063MWRCKjtPrCBzlhwVEE8v4EFjN65u
X-Google-Smtp-Source: AGHT+IHNdTCVP4tlpYMLzSBTCmdb+FUKkztUoWWSmNuGLsZ5hHiJ+/N3ni46vWUo4PEUry2pLFGjjQ==
X-Received: by 2002:a05:651c:30cb:b0:30b:d17b:26aa with SMTP id 38308e7fff4ca-3107f68abc4mr3616141fa.2.1744791719168;
        Wed, 16 Apr 2025 01:21:59 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:21:58 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:27 +0400
Subject: [PATCH 02/13] dt-bindings: interrupt-controller: via,vt8500-intc:
 Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-2-f9af689cdfc2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=3191;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=2W1SHMnD1wJv8s4rxT5+Bc8wad9lO7RuGVZAfK5NWfM=;
 b=wnZH8vnIczYF2PFpRnXlQOB8DA6hJWieCIoYcNSuQwFSJEENXMEeeZjEECR3khTDcZh4VyiMe
 OStBgKZwKCDApl97HJzsq86ijGlwtrE7nM48/qmNdUOxt1H6mzfkAar
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012201_262533_DE73CE31 
X-CRM114-Status: GOOD (  15.76  )
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

Rewrite the textual description for the VIA/WonderMedia interrupt
controller as YAML schema.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../interrupt-controller/via,vt8500-intc.txt       | 16 --------
 .../interrupt-controller/via,vt8500-intc.yaml      | 47 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 48 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
deleted file mode 100644
index 0a4ce1051b0252bbbdeef3288b90e9913d3f16f0..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-VIA/Wondermedia VT8500 Interrupt Controller
------------------------------------------------------
-
-Required properties:
-- compatible : "via,vt8500-intc"
-- reg : Should contain 1 register ranges(address and length)
-- #interrupt-cells : should be <1>
-
-Example:
-
-	intc: interrupt-controller@d8140000 {
-		compatible = "via,vt8500-intc";
-		interrupt-controller;
-		reg = <0xd8140000 0x10000>;
-		#interrupt-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a3fbe985db276e6a3b65cc66c7de097ed0719c0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/via,vt8500-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA and WonderMedia SoCs Interrupt Controller
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+
+properties:
+  compatible:
+    const: via,vt8500-intc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@d8140000 {
+        compatible = "via,vt8500-intc";
+        interrupt-controller;
+        reg = <0xd8140000 0x10000>;
+        #interrupt-cells = <1>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c5195a98b15a39583d337fb6310b80432b0f6922..2444282096e03b301ed0e3209b4de7a114709764 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3428,6 +3428,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0


