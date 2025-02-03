Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FB7C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=; b=yohNeAfsLDCHM7VXH0nHqc7YIo
	ZphsSMMskuJIi4icFOdn1GxsZDi6zIMXQ0gBcm3Nw3KuZ4kOJr/eBq7w7HwPVE/iGXa7CknvFuchA
	MKh6DnpQjBzSd5KEnK+UNFco8yHOc1CE4I320MwZxVUZM3C912ktgJ6vgDr3wsHUgG+KGVaFXTDQr
	TKxSA4uyMQoADmqILaIW6TbIICm3CaUwf0izK/DVbXnZfPjyCkQ097d1gt/sNVSh1+dYTHP3WnAQ+
	SObM8VXRkILjMm8HkzcpXQ0f3TGInprIPw4ADYGoClOAgWm02x23tlajb+XaouiiIxbwac/Ag+WE+
	KanPmT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tev2j-0000000FI7d-1uDZ;
	Mon, 03 Feb 2025 11:55:09 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tev0A-0000000FHho-15h1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:52:31 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21619108a6bso69830655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 03:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583549; x=1739188349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
        b=bTYyfSbD7Fj8SP/dc/rxgdoV6z7X/jOtxoY7i5/l5T6GItsghwqUbG6FXiggPqvH3O
         Vy/tQS32axze/gbpwo9z8s8rw0M1J5dDduUNdxRV5J3GhVomVm8QBS++f4f2v+DSEbSH
         l15ziqkQcHaq0wkWZt4K0leGGbyLPc1nOHg1m1NhB7RuSGUS4TiVFT1dJ9Stb1qg7q6s
         nu5YGn6VXhjdN3X9JyLAF7MtN9jTXXxZv2sUxZmHgTb/mC09FM8aHxjl4mufypw8od9v
         89zoQq7oC/H/6xrYaiTYpMGjk64pCNtLubTkuSDa0NyKy0w/Y6eIAM4M35McW0pAKDpe
         4RMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583549; x=1739188349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
        b=Y6NvHQBNmh2ge6ia9qQJOl6/uzOHo4VqUyjqh3PVOxMNlu6TmhnEDFpSvfG+N7kgXH
         9QoZx1lynoXX8LvDVmYA4Cjf+3kYsv+cjlFCq36C75F/7X6urGwmLlcV+MDnZjdBMOMU
         PueiVOlqxjus07jTBYGNoTSMDsMfE8N01ovV5Yw2sh5aJe/wrY6ivkSx21OHXkHrAIMF
         R+mBu5k8COLl++LaqVORCDy0YEcY+aUFI+J1ybORN/xVACc7eXeQbN+oARC8ZTCMEGTf
         TMrw2bIiRRtHm64Pcr5YJVP5ircCyw9LPGNnl8XFwTHBhcBWV4vz1LRW5eo3ehY16lp4
         E9mg==
X-Forwarded-Encrypted: i=1; AJvYcCUAWM5zKkD9UbddVWYcMl3mDM7g0dYI9enQMAAAVSCmmYC0RFHINhiieYTc6zp4VWMFmxhI9u4GhqGN0d4bcn2O@lists.infradead.org
X-Gm-Message-State: AOJu0YxgKV1nQFAAUlELUZtTGJEq78EnxTk6+FnKuBObeeINli9NzH4/
	0RpBdWdDbNvuVI4+OlKyyUZmvTJDDbVrcK8pEWugWtNiP6m/1cge
X-Gm-Gg: ASbGnctCl8vJ6LGr/x+j8J2JYqjpI0ok4A5IYfllnrLvdTl6QwsmoBa/aPpPj1QJmty
	XEa16LKtmDR7u2lymOUyjhHAwRjuyVo3F+EQ1wpOW88l+x/T6wtYBI5fm3D0SPRReYQ9oeIZoVN
	3/1+yipMJKtpSl0LcyrCbxNTF7md1ZWcLoPrm6OirdxB22kLu05OOjYzfsy50V5ALyLzqqdB2Ic
	xGZwZ3mm7Wuj7gWhFzzix0Ah4QMzPZffsdqzgQiqf/HkJ+KyHo1wuJ9zfQm9Fys/dw0lM07BadW
	pRSiCFJpg7KQjO1U
X-Google-Smtp-Source: AGHT+IH1MtQsv7n9+03TmRQLhZL0KNOrrS14baU7/DtFKLh1qhS09XchSBq/EFGuV307S9+ypU09rw==
X-Received: by 2002:a05:6a20:cd93:b0:1e1:afa9:d38a with SMTP id adf61e73a8af0-1ed7a48c85cmr32676039637.1.1738583549287;
        Mon, 03 Feb 2025 03:52:29 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72fe631c039sm8262408b3a.25.2025.02.03.03.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:52:28 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 RESEND 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
Date: Mon,  3 Feb 2025 19:50:32 +0800
Message-ID: <20250203115156.28174-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203115156.28174-1-towinchenmi@gmail.com>
References: <20250203115156.28174-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_035230_298291_79D935CD 
X-CRM114-Status: GOOD (  13.10  )
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

Add backlight controllers attached via Apple DWI 2-wire interface.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..29caeb356e6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/apple,dwi-bl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple DWI 2-Wire Interface Backlight Controller
+
+maintainers:
+  - Nick Chan <towinchenmi@gmail.com>
+
+description:
+  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
+  iPads and iPod touches with a LCD display, 1-2 backlight controllers
+  are connected via DWI. Interfacing with DWI controls all backlight
+  controllers at the same time. As such, the backlight controllers are
+  treated as a single controller regardless of the underlying
+  configuration.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,s5l8960x-dwi-bl
+          - apple,t7000-dwi-bl
+          - apple,s8000-dwi-bl
+          - apple,t8010-dwi-bl
+          - apple,t8015-dwi-bl
+      - const: apple,dwi-bl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dwi_bl: backlight@20e200010 {
+        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+        reg = <0x2 0x0e200010 0x0 0x8>;
+        power-domains = <&ps_dwi>;
+      };
+    };
-- 
2.48.1


