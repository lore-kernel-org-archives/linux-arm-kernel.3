Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52805E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGkzbcqvOFspYq5q3MXmaYRhS/5bP5b3n/UA7OPeKfo=; b=FnXljpcDtAzYcCH2UuDpFlmkvt
	CRtC+0q3fC0PH2/GYZSEgAuwz7IRJttfUM52O++nD7+p8C0QZf3gKtkifZvqstHL6GPu8lTyda8Go
	/yqB9GM561XD5gSnEw7P9PrsSu8LlX/8spVjLM4SCsNXJTr7sOClmtUlD5PWmdAs3/4zpnG16wNGX
	c+w9avxwk9fc9oRbi4FJZ6loCb3To4P6hkoL2sFmurxVWpmsgDZvZACC+Ze5nu6SjK5EpcDfWVgIq
	x9A6J3dmGr/KADn8hsXEn9ry7wOZ6r0qgGs854Z0A25m+QpMS8J+/OtzudKvDj+CmkYz+1BcF5CJc
	i2bdptzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLL2Z-0000000EjRK-1DDt;
	Wed, 11 Dec 2024 11:38:03 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLL0C-0000000Eiu2-3EoX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:35:39 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2166022c5caso24520555ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 03:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916936; x=1734521736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGkzbcqvOFspYq5q3MXmaYRhS/5bP5b3n/UA7OPeKfo=;
        b=Br6lNpKu7TBQ4EZja1yO6avm2McEHCmI7rsiZEzG2tbxpY7flfDMzKiPYTYED9A3AS
         6Ki0zr2NdW3RdDUCgi7y0YoMA68lmuiWwcHh/4hL/+22ZMlHHIU1RZKkBxoJDeOT2Y4x
         46Qel/REYVe1k5WhfmMEVJD2jj3nrS1mKJokCwI0C/d8Iu/Xv0925OfWnQOiImkP2HBl
         dgxcwB1uS64FX/h6sF+FYpE4Xe6f9xTJNiSg5sQLjIFf9WZwIHM0KHfKzhRDCaP96P46
         2/WgSYJhFYScgaO505ogqiifJ5SD1I5E32l86bc7CkugvrVV7xkZuxJSznajKdvpCl3z
         r8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916936; x=1734521736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGkzbcqvOFspYq5q3MXmaYRhS/5bP5b3n/UA7OPeKfo=;
        b=iorY+pi3hEB6x7QJhQy/Y2tLiuwJ3SJn0iYePnFkIR6RY08qUykVQS3t5fP8MPPYEw
         Ly6KI0DFVx/l3O4AltOU4dMP4cMPMi7n4p9unZVzh+KivQouLuxpvRoyzT6hauoHbJSb
         dMMd+3u5B7zVxeDwCtMadp8QjT5spom/tZtabYzM5YBA81osrJSP4YVn4ThNuWLt/eEK
         4FnUniW2c1m6gzm5ocLUkBbdfSogQUJl0eI+jHkWl6wVJ7UVA855Mx7Dj/WTUYfs8A32
         azHAeDE82Ar0DE7u+jkIJCXKIciA6v7gw+38dwiUPXotZ7KiaN8S54EQQNOUSq9T6Kc+
         kjuw==
X-Forwarded-Encrypted: i=1; AJvYcCUXhzbNi+rrR6i8Kpk+KwcHBMfbeTynJWPZQyDQJJvL0QL8ECahEMT0mrpW+xcC5FMqZL+1154UfiDVcyVFfWq9@lists.infradead.org
X-Gm-Message-State: AOJu0YwWcuXJtFNqUSw05yjfx4eOr+gR9QS9dQTMXp+O+u4VbqrrY/fC
	Fwfa8kGnN+puedO/rgKCmfJfNNhQLBFXNuRg2/30xzOuDwJ3esAL
X-Gm-Gg: ASbGnctj/p88F8ewz5TYt4sTRgAxQuCH/j8yrH2d+K6kM041P7fBpC4VdVLlQB93dQ9
	zBTAQpYAID7QYv5R0wuIbQOayRt1nXDJ9wNRVcBhwW18/poQBysPNEnRbOyjC/XSB6F/AaZ7ey4
	md6tVKBKDPOB5N3aFrPE22+VuoYiZZVGqsARktTD77szThodui18q6NfIfr6tEKW+ze3giTtWLT
	XTjEXNF47nlk1Kfz8O0umH1PkBsyBZgCw91kdD1rZ90SiJdkVT+0ZKACWc8AlroAGDQCQ==
X-Google-Smtp-Source: AGHT+IGMlkuqj5IDE2y2hs5ggKANhLCOeqY5ZZVSTXz3hSFIBTS9nP8blx7hzXomQHBVRniqPWetgg==
X-Received: by 2002:a17:902:db08:b0:215:e98c:c5b5 with SMTP id d9443c01a7336-21778390f29mr49010095ad.1.1733916935857;
        Wed, 11 Dec 2024 03:35:35 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:35:34 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
Date: Wed, 11 Dec 2024 19:34:37 +0800
Message-ID: <20241211113512.19009-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211113512.19009-1-towinchenmi@gmail.com>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_033536_815189_F9294418 
X-CRM114-Status: GOOD (  13.59  )
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
2.47.1


