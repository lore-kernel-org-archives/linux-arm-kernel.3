Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2EAE77197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 01:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYbGITGbEZjb6OpwtH5VOJ2a6xe00YC1HHwGj8LN0wU=; b=NBIzdoYfbwNQQqXUVnC18ScFAD
	SRKeES79f+ClsxyXXYTmRK9F5GmZhGiUlwNukkAIBbwu8d4Qy2D9M5/wFxh4Faw3sm4bZRR8AjBfq
	8L9cNqvH7tMoY91QszanyJuzfnaNfCGL/6ZMu4EEdfVPrZDnzJ33zpJE1L3UNwqKGcCvTn6HKgNcm
	7rAKfdJw3nQeFmSr7S+yBHiDiMeoxTVYMxmaAlWHrQqTonVS6+1bqi5ICw/GTuLGnCQNEGjK67tMh
	PPriw1B+tW/frfu/9j1GYdJJ+D5V/D4/RDYQ5u9SiZyGAmR3fjwgJfLnLzOxEpukccnC9ryXHRK1D
	AS8J+Ljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKkc-00000006i0G-3kEt;
	Wed, 08 Jan 2025 01:20:50 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKiF-00000006hGb-2Moh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 01:18:24 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2164b1f05caso234888985ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 17:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736299103; x=1736903903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYbGITGbEZjb6OpwtH5VOJ2a6xe00YC1HHwGj8LN0wU=;
        b=h4sIWAUCvjGhuW3DJ53Nun0iEn6lwW0m/X3dsvc1VrbIvZq6TwEaqGKorD1qy6tAbP
         TULVlHszNOzX4XlBrfbfQVGp0c19RaORD0n/z7dhdG/mHX+iFUj8PvCm+ez1Sbkm5bKp
         f/EskP94y+cwvxLsCGp+dYidbFXpAUezJ1B+9EZr4wugC1XgEc32TmdUJXJ8k0ScAvzI
         wFfxv6+OqOArNjaCslt+V7DV/4bsjJouPJqqMc+5Hh8Fn6KjMRPUkiBp7Qp2Pz8Sb7C7
         T4OoVIM8lC/ImqgGYFTs72JY9zLLPXFGXhBO+DR8P5wNC3PUWLN3MDRti9tb1N1fNPMz
         LVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736299103; x=1736903903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYbGITGbEZjb6OpwtH5VOJ2a6xe00YC1HHwGj8LN0wU=;
        b=vhijefpf+LUVxOnz/rPTi3WreM28ApODMPNYVQ9UJuwt4ohmmz1A3UK7J9gSir9HBd
         mWRC94pfuvwhwo71HA4FJnzWaClsFqpq0v8EWe7s/hF9PXFKzQMBT2e5avwwqsNkiwGp
         MhXcqv3G1ZLBHhixssyI9BGZlaLohP930jXgDMylZ344ogzNJ2cdCsGEWj8HxMcSDnRt
         efH4Ms1sHWSGMP1oeUTYZiT1Cswt7iplIFieMbfNGLmEgU4ZEBpt13zxO8uVHlXf9c7i
         uuO9dOz/eey1p2A9ELgdc2MS178rOMFwNjkmaeets05t5ivj9ZKEOuCdfzFSrH1ABOUB
         25/w==
X-Forwarded-Encrypted: i=1; AJvYcCWslfEhGepaRjFqeunEKbWnH4/hOZhhUjTIxvHWnk6JunChNH5x+rE/C4XbZybxwfbRp3bJIUhhWR13Ep6lifwu@lists.infradead.org
X-Gm-Message-State: AOJu0YwvZ3YygKf422zFiTQhYxgHOcOlIj8N8s5+gOIWdtnXm/Ojjtzv
	T0QU1Xi3vNbWm6wnIaHE2KtATsM9umIpf07Tj9TzgpyikIQC9WBh
X-Gm-Gg: ASbGnctlGvBJfJZzzVdnM6cdZRFZnw/zegtyPHtk+i6ZRN6zhw3WuvHZE7G58e0LYS9
	0kDvUHZGsSpfyf8mO18WJXkhif37bpoODhHBTlBeLoDuVR/j/01g8sFDmQP6UT41OVYjBwe9O0a
	JJod+aNDsEIj2uYJ/ceHhcYFcWNxWI6Ftff1Ti0ojgumPAcgFXJlGMEnmpFLHCdMNiC6UYjDgIK
	Pstp/dmBdRhxwSXR71uGCFFUJNsglzOK0D+F4Wx7XsARpATA+wntoZsph7G2zZ+m1P6QhXKnsev
	QSeuxTvLVlxq30LI8BbMkY5K/XTgwB6QUUrrAAY/JA==
X-Google-Smtp-Source: AGHT+IFDcZKcr8r+6R5GTj8bFAPrGBQ0pnx9mZqhIoabk5UESwlqeD+2cfBofS0ds7DMtcNebRzGJA==
X-Received: by 2002:a05:6a20:9c9a:b0:1e1:f40d:9783 with SMTP id adf61e73a8af0-1e88d0ee90amr2280910637.40.1736299102840;
        Tue, 07 Jan 2025 17:18:22 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad83033esm34045009b3a.48.2025.01.07.17.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 17:18:22 -0800 (PST)
From: Ming-Jen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	peng.fan@nxp.com,
	arnd@arndb.de,
	sudeep.holla@arm.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH v5 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Date: Wed,  8 Jan 2025 01:18:11 +0000
Message-Id: <20250108011812.627-2-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250108011812.627-1-mjchen0829@gmail.com>
References: <20250108011812.627-1-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_171823_606932_7E1D4236 
X-CRM114-Status: GOOD (  14.03  )
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

From: Ming-jen Chen <mjchen0829@gmail.com>

Add YAML bindings for MA35D1 SoC keypad.

Signed-off-by: Ming-jen Chen <mjchen0829@gmail.com>
---
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..889f253b3bc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Keypad
+
+maintainers:
+  - Ming-jen Chen <mjchen0829@gmail.com>
+
+allOf:
+  - $ref: /schemas/input/matrix-keymap.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-kpi
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
+  linux,keymap:
+    description: Keymap for the keypad.
+
+  keypad,num-rows:
+    description: Number of rows in the keypad.
+    minimum: 2
+    maximum: 8
+
+  keypad,num-columns:
+    description: Number of columns in the keypad.
+    minimum: 1
+    maximum: 8
+
+  debounce-delay-ms:
+    description: Debounce delay time in milliseconds.
+    maxItems: 1
+
+  scan-interval-ms:
+    description: Scan interval time in milliseconds.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - linux,keymap
+  - keypad,num-rows
+  - keypad,num-columns
+  - debounce-delay-ms
+  - scan-interval-ms
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    keypad@404a0000 {
+      compatible = "nuvoton,ma35d1-kpi";
+      reg = <0x404a0000 0x10000>;
+      interrupts = <79>;
+      clocks = <&clk>;
+      keypad,num-rows = <2>;
+      keypad,num-columns = <2>;
+
+      linux,keymap = <
+         MATRIX_KEY(0, 0, KEY_ENTER)
+         MATRIX_KEY(0, 1, KEY_ENTER)
+         MATRIX_KEY(1, 0, KEY_SPACE)
+         MATRIX_KEY(1, 1, KEY_Z)
+      >;
+
+      debounce-delay-ms = <1>;
+      scan-interval-ms = <20>;
+    };
-- 
2.25.1


