Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36B8C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 04:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=; b=07bWfVpqmtzRtxo3xLu7b4lvTz
	sX9UQQE4G9Y4h2Bc99T1Ak8AXiawry86peBNvdGVKaSO6Hvi9czQsxFGKjsvuaBp7J+h/cKPYV9Wv
	r7RdyO88fU4di9IHeFzHdqQ+W/XbHH+d+/mS8sdbIXBHKa+iPlny0icGHZU/8XOOq9RuYx7WhVLyq
	R945Y8JhiG6tlHIv8bvC7Qjfg78uylTDFTIW9ccexE7CdvrdXuWxyTBlLHyIy/A4o0rKk85k0UWFk
	M8Q/EakI740s6UPAxVtWTwvUHQGuA4nno9XL8rxk3NwgM2hWycMRGI8vCl8Coy3qOlyd+az273YJP
	VDjKxbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1timyg-0000000DZ5j-1iwS;
	Fri, 14 Feb 2025 04:06:58 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1timvw-0000000DYbH-1CgB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 04:04:09 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fc32756139so51394a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 20:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739505847; x=1740110647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
        b=m1elYkFfv+yO466p0OKLEJeqw1chQHYff5BcWgYFUFtpxeQcthAlqxLe1g3PcYtkMY
         VtinhQEOzYvkfgRlnJx4tNiiyC+YuhBZgloi5OmSh5ykBSSuZOwy5/U+9M67xT9SdGD2
         f214OW1dG5wQqCyXOrKr87UrafsO/zvYBe6GDgTrnvLkTWclUWpCkQEvE630GFxjFEz+
         bBhLZ25dcxmIr76ezkNMGKSIgAyJNlkQbwQdQPza5Jrgt3OuzH6YePaYcC66+JmQriaY
         IkwUOE2Ayz67zhGDsU/e0HzZJKnp3HLU4aS1jbws3hUvup6I65vJ9FpZUaE1t8T6qO8v
         xLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739505847; x=1740110647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
        b=EL5xQghX5M26PqaMx3ofMSEWrgmdLpyrhhNb7gyvCJV88EQKF79rvZQEPtV8s8n7k0
         Z4IUzFzUCETkfoBoEXZVozbVq7nTQC/x6K52f7TTN/rBYpuUB39AQ4LVgJc9lY1MhY9a
         TA75fSef/VnNKq0aBA0gS+RlyXW4JajVnNtrJNNGOA9dM2E/PHOdoZJIUMii9ZMj6oF6
         OmDy8wFXzICZ27P4sncZN7mk+CIkHZe6Q7KnGXW7cwJUs7rfPGiPWRw7QKO0LDy5smwv
         Jk1becay0Jq4CLKAQn0V7sXxmJihPIgD+vCbjGkCliupPJ9avwDqg7euGd49Q6zdz7jZ
         QLmw==
X-Forwarded-Encrypted: i=1; AJvYcCUeV33BGpcIVjEMwoAJ1ljpDyBXWs9Ta7TYdOkMP+FWq/LbPUM9q/VUeEIxGdTlCQk9U+EXBNQ5Z0l6vAH5vaxK@lists.infradead.org
X-Gm-Message-State: AOJu0YydNs0nbS9tVjbQkdGCj2vVsk3JyvI7EOEOiYWyJID8xvPvXzEf
	VYnPLl25iEm5uvgoYl72dcIPKdEWnfg2UjbeVOz7RIrAD/pNsvcH
X-Gm-Gg: ASbGncuouWGzj5+YT0ZyYG/XRSL7OkaMYKZTy4wNoTs1xkRGHrq04Sj56kpKNG5TlZ8
	xVPzzqXIBTSUaaVgYM9qJ49tEUBMd3lxWyRvwGhnfvK6jV/+kNJJA9yHuWoSyfWl6byPBv3O15G
	/i2g8KRfaCzyHTfRdG+I1hXS4lLk/2/4Zp8p5sbY4z/3ICnyY2VOMsI/JYXf4XxiCNYBSIl+RAK
	O+iEI5a/OJu/PuG0gEepXpEa4E1yfCuRXe6dzXm/Wl8EbLYqoRHSi+xaVs3SfwS4XPFiDwh6tzA
	swfkXVjO1OGzBqc=
X-Google-Smtp-Source: AGHT+IGgz94u5dSaKE5PwBYaLjtoVurlg0X6dABIb3PB35R+FknVncdnfvcsPkYesVe9CLDNkNni2w==
X-Received: by 2002:aa7:8894:0:b0:725:9f02:489a with SMTP id d2e1a72fcca58-7322c3f4d96mr13423478b3a.17.1739505847127;
        Thu, 13 Feb 2025 20:04:07 -0800 (PST)
Received: from nick-mbp.. ([49.130.17.220])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7324273e3e7sm2181227b3a.91.2025.02.13.20.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:04:06 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Janne Grunau <j@jannau.net>,
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
Subject: [PATCH v6 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
Date: Fri, 14 Feb 2025 12:02:12 +0800
Message-ID: <20250214040306.16312-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
References: <20250214040306.16312-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_200408_322784_D7FCE025 
X-CRM114-Status: GOOD (  13.04  )
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


