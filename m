Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61963E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 13:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=; b=K5rRpcejJD6ip7Y3Qs4OoW/1XH
	CrsTh85OdhmiCINCYUE0/ARbm4cpP1qNxrG3p/xgVohQ+gSnSLKhoUkHhKdYEALUxwZcBgHYUg0ri
	6n+hotnqUcXwuZI1HgFy33wL/vd9DxTCaHvYIhe6tl20CBrOcmTcZNxJp+/8sRNG/mEo4mzyYlG19
	/4OWlxjbFcvrREqNNl5cIliUZnTK5RZpdl2BQCl/flFyAC8TXfRAaAlMp8H3+qkFSL8CgzyZONno6
	22ZLU2Vihyi36PEUi0+x/vZYvGOuB9iz6hZWJONCqCXX+6vDRmR10wEsK0ePsl73JsK1XABuMA3gG
	p9JvxbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJuWS-00000003y2F-3JUl;
	Sat, 07 Dec 2024 13:07:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJuUT-00000003xdX-04Dv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 13:04:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2155312884fso31509815ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 05:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733576696; x=1734181496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
        b=V+6j5sMb2whSBRUuUIobM72T+k08auN6H7HVNDxlLy7N8j6vfuBjanlwEqLc0W7qs6
         davZbwrnm80+Ot30aydltF+zPzu6UT2ALRYzqLas4p44vmuOEilbUsDQBm8WbGMxQO4K
         kpF0xqfc/Bgl8Qb4nINJxtRHLvWFJ0qsYgWtEXcfQ7/FwMMRQJVCOY5Fb1EekaeTjFAn
         /4UX917STbNf6ns3lSpA+KzbKgJT0ejzbqETpi+t4sNQ+eqQ85kjW5zsiw3ibVABbHY4
         XifPi38ngTglc7m0zvqJtD6xMSHnaqFMde1za8QSw8+CZKEnDINunRTmDhBWuyld1LhH
         SGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733576696; x=1734181496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
        b=jQT5zlLYvRX+xB/uwgjFxJ7X3vN21SyEISHQjw3NU3azLYIT4nS1qDkRE4agFtx/EV
         aWCMQ0p2JmTY3o+1LKi8k8bv2SCDYUFJxXuNMlxjvsZ0C9NK31+EPYFbl6O1MMf9NgIc
         Vwb8M2eyk+v1+jQ9l36zJFSUEVvpetKKW2CE/rGBMiVD0ym9SGGrF6NWEELkX2VJs5NS
         oNTqPliDCYK3joszguMkYva9qcexFcbzzIPEDa4AMfZ1rKqP9Q9vSHk8Qpr06+U+Z/ju
         2y3bdri9w4SD7tjXT4/3huGizV8xQibxmkvd8sGm4uUA1Gz56IxdNiWQa/CLnm8bTzo/
         YLkg==
X-Forwarded-Encrypted: i=1; AJvYcCUVcCVIExUeHFr2Z2KeO9wa/HdL1/5uIXjUribER4Km5SLXyQpuI5nxdXhEZQS6n13ljjcnUsZzkLdNhDCAb+lb@lists.infradead.org
X-Gm-Message-State: AOJu0YyWXN+ZF8ePHTvmEKWsHAcFivzDU5fh6/pR6H0bazaikG/VjInj
	W1QkgqqqvnF9wqzpzbanwfDJ9aLULQ4Lah0B8EihCrBm/rQI71m/
X-Gm-Gg: ASbGnctep+lmSnR6zCGX1ZgyvNjIRGxpbU+Wyity7U8lFgQq4kdZorsjmaGIIY+NCc3
	iQbUtoYZWCndORMbVVBOcL1dVb1no6GRsZ9wRx0UQFuUT8E3Smp7CCLxXAgGf+uDb1xCJTzrhcy
	yGsT4bEuSyxOBLEsN4ZWiR98mGS6bVvkRkFnbQK5McjBp4bbkD7e4mNN68ONlvYXNPdKcFOAtfg
	W4f6fotYCtns3VlUrMjm/OAvnfPp3H8OOtR0A9i1cj2Vflty2vuqPzh9O+t/aISfw==
X-Google-Smtp-Source: AGHT+IHSBn/pq77OCjYDKU4tqjEmdqZd8B5Zl+VAbPbKPPsQr8JFMXWjlUkJ7t8BCQ5XsnHByPmm6Q==
X-Received: by 2002:a17:902:c40a:b0:211:ce91:63ea with SMTP id d9443c01a7336-21614d35675mr103444335ad.15.1733576695885;
        Sat, 07 Dec 2024 05:04:55 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628c59730sm12779715ad.105.2024.12.07.05.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 05:04:55 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI backlight
Date: Sat,  7 Dec 2024 21:03:14 +0800
Message-ID: <20241207130433.30351-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207130433.30351-1-towinchenmi@gmail.com>
References: <20241207130433.30351-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_050457_052057_F9DDB7D0 
X-CRM114-Status: GOOD (  14.51  )
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

Add the device tree bindings for backlight controllers attached via Apple
DWI 2-wire interface.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..9d4aa243f679
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,54 @@
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
+description: |
+  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
+  iPads and iPod touches with a LCD display, 1-2 backlight controllers
+  are connected via DWI. Interfacing with DWI controls all backlight
+  controllers at the same time. As such, the backlight controllers are
+  treated as a single controller regardless of the underlying
+  configuration.
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
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dwi_bl: backlight@20e200010 {
+        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+        reg = <0x2 0x0e200010 0 8>;
+        power-domains = <&ps_dwi>;
+      };
+    };
-- 
2.47.1


