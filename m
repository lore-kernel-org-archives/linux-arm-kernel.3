Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEEFE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=; b=R16uJx7GzeLysuNWvu6Nfhkcyl
	iestfV/zGro9FEWS5NDpNyzMyPrYY9w7gQRqwPWoqUHM7IUNqB6inN4wFvkG7ZKGMmb5pVqUrnrKY
	CrHsmf8eRuMcecaVmA+fynur67AkEl52lYrzak1FWRWN1TE1rLGhdrk+JO+dwC1d5A3OyixhJhYKA
	2uISPkhMKhXwHTGDI5o4BFXkO5u18kGFA+rFnziMNxC0Zl7MEwZvNNEMkYU/1i/4paovpEpzgfJbh
	Zwesk7+b5wt4VByGcynuPMdDZgStmrMbRT5x1d/Jznsx+5bdM3Ce67mToknL7GG68pP/EKLGZ5+00
	ULg0q2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYi4-00000006oYK-46Hi;
	Mon, 09 Dec 2024 08:01:40 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYg3-00000006nr3-0qY4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 07:59:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-216426b0865so6663695ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 23:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733731174; x=1734335974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
        b=NCEuo9pjkeGmMB7e5gEwpJoulQod6PLk9+rT4F/rmW0kY7b+8cRgGoTYV2F0TUfVSc
         2Zy3WFXyM524LxfHlW8va7klBE4QwIiao0CuJdM3jpZZmXim0bMo9CFBoKtSWvXS3/hK
         UDcasGbhRR9RVYcHL1W/X25EXA77VLWHgmxzgNnHKAU+F/GDQewUagKTg2xPaHkUb0xx
         aeMx6TnW96xI0VUX6euleWZUtBGteeIBYTe1omf0fH1jzsKBZwxu0A22m2zzMvU1IN4F
         o+0sok5QVX6KA3vkL9cSySVm72Z8fTd947UI2vADEcweVlF4gL2emXhSc3J04vOOEnQR
         6eEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731174; x=1734335974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
        b=eh6cavQrk4Oz881CsdrhekSq+Jkf8Xty2Vc7UpRsM8d9qXpWCtE07yGfoTzuVpEH4m
         F/0aEahIoviVOcAqBYFEx/VPPDTVWfwwSYzyVazlL4tNL9/hxb7aPg4v6CyDjOw9XDn7
         R+LWig0dOlhmmyQ2V8AnDsXjp4kl3JInk7bFeuiVOMJFvaPWNBOVKV+XUz6pZlzxwFGj
         8QvFj56+KtAKkCU+n7WoRIVURuJrsF9PXKdbWq2E84hnbIRAyU+/jBeaLSR+PXI97nqc
         vM3p+aQCKnKU8QFRoW+cqlzDLlMulMYIHulQf1FLNuw3Ue8KoP3f82Yl4UXnR7S2Ar8s
         IpRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU53YZ4mLE3o3ZTn60KhXCKvhzGoNLk5fiNF4xso8BkFmd2OrsB211mhNIOw5WYD4QvabUkR4TjlhAkowhSWl1t@lists.infradead.org
X-Gm-Message-State: AOJu0YxDYom6QASKtXu3d8BihryQV2W6/hOJBzfcosrXXlXJAwquQ+Ox
	QiEJZs/WeEGFjf0TLTB8bwtdMteyYMRxSK5sgq5AkNoGyS322kvr
X-Gm-Gg: ASbGncuwJkrTJam0ClExZMrKKyEkKbBJDN3U8YY0ONJ2owddzTUTbsq3ld8DaZthmMZ
	GQca4gY7gIRCuQEIGm0UQ60mBBUDPmYlKmjBNIraxc2nFRJvItkNKKoVgyZX88IGYy1rzjbsm8u
	VMya3w5farIUflRZGNxVmV0i1E47KED20UITdirwKhRp9TWZ8MacLPmkOhFur+cc+PDJjCzxnlY
	7iAaLW1DNlP2Xxzu5eW3tbfkckk2CDHuDSi4x6FgOV6/u/1L5CKTBhWf1ilWxF8SA==
X-Google-Smtp-Source: AGHT+IHAz1igIUyVxn7/F31nUUXielqAW/wiAuTMbEeQeNxfmCtQzSeNLB5DvIv4dcsvWo5CidKtsA==
X-Received: by 2002:a17:903:234b:b0:216:4943:e575 with SMTP id d9443c01a7336-2164943e7d6mr35625795ad.57.1733731174215;
        Sun, 08 Dec 2024 23:59:34 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:59:33 -0800 (PST)
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
Subject: [PATCH v3 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI backlight
Date: Mon,  9 Dec 2024 15:58:33 +0800
Message-ID: <20241209075908.140014-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209075908.140014-1-towinchenmi@gmail.com>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_235935_230854_7AC246A1 
X-CRM114-Status: GOOD (  14.57  )
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


