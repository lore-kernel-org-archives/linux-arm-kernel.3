Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FEFE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0h+wOrNYOq1rWia66zWwU+kYGms7B8E2S8S2isesVU=; b=Pb6kjS4PHoAoGo19eRWTkTioKD
	cf8nxI0FmYayrS15W/3/tQNZcDeMpLtl3Iu4eZfoOnBCbLocqjCnaKwRR55PtMX4cDFzUNFPzB9Xw
	YVQrxJbMGeOD6fmUgs77e7GB9tSBjT1Amjk1gGYGFrFj97rVxAHoaIvQHJ0V9qaxcuCDcX/8IjqkC
	RGfrdClOcP2Xni6k9KkcFPw5GitKmH7VGbzxHT2lPog02FU3XdSLfpcWZrzZ6DJwprHMp52vJNqvB
	Ujweysa/mA13NKzNh/89/9I2bkVdz2Fz0Xu7F5AbnG4LRfS0UTu5ot9tkM3+jANoEcBP5/uIjuV1X
	qeF5FNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRrHc-00000003JkZ-333J;
	Sun, 29 Dec 2024 11:16:32 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRrFJ-00000003JO4-3mVW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 11:14:11 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2163b0c09afso104182115ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 03:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735470849; x=1736075649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0h+wOrNYOq1rWia66zWwU+kYGms7B8E2S8S2isesVU=;
        b=WiiZRCyp2FmbO/A7TD5+3loNaZ1T25Swyv1KglydLo/LOEv6l49DRJgxLgJNvgik2A
         KBY3+y6+iqyVhQHmAtZRMKGmWPMBfJMi+AEOo+7rzHN02V3MPMnZUwkMJi9cxWpppGct
         yNkGzErzX1AgoL9klWfVvHQCHGWM++dHouHHUc1NBgny/Rg21fgyluTz1/1oFHvOaXnn
         nQon40CWvTHCJqz6iOaUAT2aKHLSarxyankpCdEmnrl46GEhCSnRxHe7yuxa8DSlpV1h
         k3CNOikCxvfGeKyN19RcqVa+mtZv4Km8yzrsgj24LEqLecaoRvUKdTpiHRePlLUu97Jg
         b8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735470849; x=1736075649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0h+wOrNYOq1rWia66zWwU+kYGms7B8E2S8S2isesVU=;
        b=rVAIaP5v/IrgvdA3/Of/3DyaFcca8/4DRKolv377o8Cz/SVPdFKwQZBPEnwPiXtFF4
         Vh5z2XFLmH/dXKD/gRVGWHCRSu0PCKma8Lowuq0f1cUmIFSqyWTkkeYycwPO/reRrbrU
         GeOMxg5LxsqWDDJPw8wulrNZgX3adfDfSpo2De1WxlxzcxmjtAi/i70Pz+Suir9WAl3m
         Ucg46+vG6cwHwLJnYmYtGFxKdqGPEiVbAeHoeBuAqwwu9pxU3CL0l5K0b+O6QflZkxCG
         JD2dmYRDuxvGfvkt/6OscocbFxByHYTEQM7VZtZyegSdXOToPJPY59LCtRHkXWdUrzAd
         8vbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTEevnvb7FEgHxV0aAppsx2h3nW4thTrPLzfDN6eWIbxXK6P7eiPca3QVMXTPom05dtWWY5nH1ust1VEqEoGKL@lists.infradead.org
X-Gm-Message-State: AOJu0YyVOca3aCNmhiTfLslytp/imDCVgjBtNNAJW/cqfM2uR9dDSZBq
	DoSVoBnYVsSYZoYVxSbMQKsFAedWHGD6Sdn7jCMgIndsSWo3qJ7s
X-Gm-Gg: ASbGncuFXon9605UNCSS7eSwSQU4dL65CbAiZdT6nGDry15cSnYIhyYUOpdI7Dk2tNQ
	l8LqH8aAhhjd3s71M0ImLrDHMAHBVUb14xj8LPahjjybg3rEP7CtlLhJTZ2dQxvnaydUFGrLSUm
	aLQx+CrVu+Ev42KAS78dHJZV0uw1zVuQlW2SiMTBNnyZCbE6xPwhMDKvN0RxVyYZ+UsM5QEzfb6
	4gmyz4DY9BxOdGy/t6nJy4uNmOL6pLNk0lCYZbirmGbH1F0TJ+AHewUYA==
X-Google-Smtp-Source: AGHT+IHw2F+g8azy9+A2CTTjFUe3/G4dCC8p/k0dOHQU8Dj6MYf/830XflujqJ4t4aGM+bWVkhywyw==
X-Received: by 2002:a17:903:94e:b0:215:96bc:b670 with SMTP id d9443c01a7336-219e6e9df70mr420824845ad.18.1735470849111;
        Sun, 29 Dec 2024 03:14:09 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca02544sm161655895ad.255.2024.12.29.03.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 03:14:08 -0800 (PST)
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
Subject: [PATCH v4 RESEND 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
Date: Sun, 29 Dec 2024 19:11:17 +0800
Message-ID: <20241229111322.4139-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229111322.4139-1-towinchenmi@gmail.com>
References: <20241229111322.4139-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_031409_963880_7FCAE9CD 
X-CRM114-Status: GOOD (  12.79  )
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


