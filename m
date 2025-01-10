Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC27E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMSCq8ZRhOoVCRQ+Pn3L8jEsI2Ad0rp7ucXL8/818XA=; b=Q37tByBS3jc9rqfCrdv0kSh/u0
	gZ8afdcNlsqzhy+BjOPebLCYfl60fSrgYQL58nb7AyUwby3430pStXCJQxZIPDu5Ady83Bcb7mLdM
	z8wGYylfRdFssSrvNWRHSsEX938DWnrYZy9TMhh+BDJJaicU1Vwh0ninpO3FGaHURPcdFBcX6GL+z
	2rozDLngDKyRNNYLVzDNFgIbnWB5/I4ZrXJxIAyWAQff3yvqg6dtNHwUJZeTTmKqE4V0rZu1jfscV
	9C5dZ4zydEgntshk4ehgdNjPbMmpWPS1vWu9NM43k185MQpndfVwL5ol1zOn2Y6ezPfanIQL4H1OR
	LIb0OK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCgI-0000000F1sh-2xWy;
	Fri, 10 Jan 2025 10:55:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCdz-0000000F1Td-436N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:53:37 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21a1e6fd923so41633585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 02:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736506415; x=1737111215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMSCq8ZRhOoVCRQ+Pn3L8jEsI2Ad0rp7ucXL8/818XA=;
        b=S8H+se6SNwmU6FQbhvdZckI6zUGdLkiQYPk7EzA9aA/KsDpXGsBfE4T7jQQnx/2ds+
         eDvB8/Ghkpn+DHXjDj0f9DJyrgN660HncGkibMCE0JQ7fEd1CvKum2XV1p5RRnSOmK1c
         Jd4O41gcToBS63I5UBCdPwKmkK1zUkCq6DppoXgCcx7w1AvrrjsL8Ij7EoL9b9VHLkus
         OaT9RbwA3x/faxhqoNgV/5td9T/bECcw0uVEBHvW/JdWUeMQg+8CEMK0mCLUdAWLciDy
         UBfAQaLeJvaq/NuHM3SX3lTSc41lDGYytJW10brgfsVyQkkdvexk9l6/8/poead3WRq/
         rfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736506415; x=1737111215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMSCq8ZRhOoVCRQ+Pn3L8jEsI2Ad0rp7ucXL8/818XA=;
        b=F1qBhwIWWatd7/akbWxShzBHtINFOQotTiQsGZT3Yy3NGiW9rtksX/tMDRTwFLPWzO
         abEz9YcSOE54EUvznyZPozCQF5XrpTG/5CytezcjV35kRnyzVqReNqGIGJCWSAllFKTx
         CqTSMLnt09OAokDnxHhC/sd9m/sJsQ6UTzJhIMg0sS9ze1ATInm1NndRNJY1IDOtSe9T
         O7nhKDeOWZQl5KBYb+5PiiZWw9sStRIWTyI1e5OzjtLPzGVBAxplH8H8gNiSJgmEV6y4
         mAXqbt65iul1fLlU3q7xtNIGjiL4U/CmfsIxsY/fvEQ64Jsxfrc8j93NBvR7mZyknq7D
         2SkA==
X-Forwarded-Encrypted: i=1; AJvYcCWEx1OhG/8JYOdLxokYJ5nxSCcOFDBwKmX+2u7fr3M19lwospF041U28w85OfwMNEA87q9kmc0dRIOHgNS/UpJ0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8eU01k8oD1raGOL51iICVoGDGrxYXhBAREP44xYQhx5WpXUCC
	wBzBzsjxEH6K6Impe9vaFDUKHdOHnq3XWRKovLB/B/dz4DdB+gIV
X-Gm-Gg: ASbGncvf/mbW5B6vtzk0rfjws3/5tAD1Jm+xqEKImRwTC6ePldvn9/HaB64oCmtwWQv
	fshtu9qpkPPsViJ6crVUPH00vFeqU+uU09l5q5Axv+z0tZPOvgthPsWZm+RXRbxqSdnccYIH1Ox
	hbiAg+Cjv6YpJ5HwY9baC9VboNSDCjDrJ+8S1R7IdtjaBKLNsbAJFZSp1v3wN8vg5svkrGNOI9V
	EPzo/ZOc5zFi1+1FXDXSG4VXu8kYZLXpLcVHTZXFiO6Ut9oszSNIq21aA==
X-Google-Smtp-Source: AGHT+IGa4nMEUy38XaSxRcOiqyz7zYEKvL77D4BJO3pJ8lZTFzoYDKUJd+a0uiMcMH9BGkGZ+iGrIQ==
X-Received: by 2002:a05:6a00:1152:b0:725:f282:1f04 with SMTP id d2e1a72fcca58-72d21fcf2d9mr15063399b3a.18.1736506415194;
        Fri, 10 Jan 2025 02:53:35 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d406a57dcsm1333403b3a.170.2025.01.10.02.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:53:34 -0800 (PST)
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
Subject: [PATCH v5 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
Date: Fri, 10 Jan 2025 18:52:04 +0800
Message-ID: <20250110105304.71142-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110105304.71142-1-towinchenmi@gmail.com>
References: <20250110105304.71142-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_025336_000305_A7DE9D92 
X-CRM114-Status: GOOD (  13.58  )
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
2.47.1


