Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D841E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKs6SqWvOBPQFDy0xdKVrrMMEBXzqiAL0Gp7ECA7uFA=; b=lXD8Jtaw4O5bsX4eOk6OCml5VI
	W8On3M5WWew3j4n5s7u8qxYf5oWl00RuXTJpxvAm2W/8aICPpZghMccQdYNhp+ljS8v7Gryjrizce
	wSawNlUxqia6ol0iLRK9NXxzfIKprKVyXG2Q7S7D/nK3/2Nxwp5+zx9lRHUW2xvZzHbFW75KVHehn
	JPRdpFh2dDHI/ZYIrzxJJZ9fAGUFDGd+HxbhtmiuRSvmJRmspoEYGsMR1BEaDbLFDb9JXeTn4apqp
	MTRxQM8gNuuPgGzUHKfSBTN635a/uhBbxWaKWaLCNv7dsXy3CGVoB2ylFuI9Px3AH2fuR2arQEXUd
	yakyyZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJc9d-00000002LVt-3zSb;
	Fri, 06 Dec 2024 17:30:13 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJc7f-00000002KxL-0X4J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 17:28:12 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7fcf59a41ddso1776837a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 09:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733506090; x=1734110890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKs6SqWvOBPQFDy0xdKVrrMMEBXzqiAL0Gp7ECA7uFA=;
        b=asP7Ex1ZosKML7d3c4QuKxg5CWq9Hir7halioFcnaqDJeFSgymcITWL0qs9CoSuaKo
         +4hHjGJwgp7prGI8Ghy2BlFhLx0gCzLFSLkbGmHdmpH9Dfk/ilCN8rPRpTtwG2Uw0FJM
         wGClWhryRxkbwxry2HRZ8B/BjWwQm1dy0bYnKhfu/t7Rv2H6SXW2VTJ45G81pDs9zKoe
         x25P87NQyxKoWEyn0CxP08isVYveVTebd4kjkfOh/zGxd7G2tlUj3z46ppQ5ruciABI6
         yg4swpND7gOsYFi5TAMuoEDLZvigCxByk7GJUki8QAoPdaxC8T2xfW0YJ/r4EEvyVuoO
         PT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733506090; x=1734110890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKs6SqWvOBPQFDy0xdKVrrMMEBXzqiAL0Gp7ECA7uFA=;
        b=CjvO1xtLM44MUrAZxvKbPwfq2n/cRODiLermhXuMDy1ca47CIWaAWLT0SKs+ZQ/DrH
         jagoOp3QOaQ3RpbOqUAOCL3SzczkGmO+pGLtg8M8p+2AwvZKcunE/Szfhw5VE4GpUfvY
         ZDw3xeKAdQavQj8RdVG70VGo5LD4jVm5su9YEfxSAujrmtrZGPqJrjn+bIDSMfUqHzVK
         2zjxR4blInzJySp0poCZJ/pTm2jasYmn2hXxdy+iYqJf4SCwDX0nxZzpxNxJypQ8211k
         NZ0xPv/2YJzPJzkh27Fc8dXi1h0iqMJMFlvtI0f36e0oabPupL5An1GV7Xcb6up6sXfm
         U1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp7UwXln9BEtF06kbdiAWCaGJWznGFM4XBobHTagS8LPyKnzUBk51GgQ9u1kSVILjoXJxpjBJcp58cFnuapE1O@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Ii1ZEL3oWKGgJvIZS1HYOEI4fv8EIOOM0K1IeI1pNvwjFoFQ
	lH1Q5SbMeqYrO6X3iLrAC4w0WqvfXo6S3ADchhM91CM4KwU8KGAt
X-Gm-Gg: ASbGncvovqUD9fla2HA0XHkXITVnwQA+alNrDIP1cMBRNYBxl2k6z1TyBwO4fD9DrSU
	RnuWNoBDzp1pq6kGNOVPE1Wj5SoGqMoTg0KJX1A7/FQR0Q+TXKH2VeopzOTe/sMivv/tNFc/9A2
	CsUAgqBst+IJ5CWdlvcPMjGMjFamGAWp9iVCoR4lAA63L+4L7+4R4hLsA6Txj6XsFMeqLrkY64z
	tv9a84ZbDmGfFOn4luePMbtwZm0sw4Yesd2Bju1hkLKQ8wsBDu32ZzvNdidi3I1
X-Google-Smtp-Source: AGHT+IHkO1RmdNJpR/98buAGJm0YvKeK4V7vOM0AkKSIB8tDWbwjkVo05dKTym9p80CfxeZrKTxMuw==
X-Received: by 2002:a05:6a21:9a01:b0:1e0:cc8c:acc4 with SMTP id adf61e73a8af0-1e187136d40mr5795557637.37.1733506089650;
        Fri, 06 Dec 2024 09:28:09 -0800 (PST)
Received: from localhost.localdomain ([49.130.54.203])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725a2cc6950sm3204512b3a.173.2024.12.06.09.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:28:09 -0800 (PST)
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
Subject: [PATCH 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI backlight
Date: Sat,  7 Dec 2024 01:24:33 +0800
Message-ID: <20241206172735.4310-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206172735.4310-1-towinchenmi@gmail.com>
References: <20241206172735.4310-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_092811_162521_5428166E 
X-CRM114-Status: GOOD (  14.28  )
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
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..fa3789b0b043
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/apple,dwi.yaml#
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
+  - power-domains
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


