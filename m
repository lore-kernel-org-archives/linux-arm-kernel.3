Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0C4EC01A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 08:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiFXaq2KynT225qwMSd7jsUuMjJ4J3qIwVeyuIMFqQA=; b=1lT3UJJj0/oEHsyJc9xhv2A2xL
	hD/VuZ0OYUUuYUCFMgrgtuuTC5d5cfISWnzZvMsrsWMwLlR1h8g7xKclDz+A/5wdSAFdqUCIOY78A
	A5KlQG0z7z4G3Jb385WjTs+PhUjqw72GQvb8BMR2ytP48h/99GVCwhC9PsEnQ6f1Mwc4iE4PtzkyY
	dANbvJVO0ffjESw6DowswdQVkL7L8Ad9oB2GH6tlf3QuUV0hgNaKeFd+yc6x7WHFO/yjLnVZ/7SxF
	wjkvev6kKPH03kcvX3VlM2c2rZJFfiqQMkjcaAxcuSmg4o+W3v0ilMSl7uj+BWCONfG9NfV9f5V3/
	vegPIChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4axW-0000000GIqv-2EP9;
	Mon, 23 Mar 2026 08:48:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4axQ-0000000GIoy-2Iku
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 08:48:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so26191325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 01:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774255699; x=1774860499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiFXaq2KynT225qwMSd7jsUuMjJ4J3qIwVeyuIMFqQA=;
        b=V64zFC1d3p7Om/CI5NLjPrzhSWaKLcewwTAVBRfOhI00DjWRqNPiEjsIJnjiGzcMZl
         Cyjlxz1/UgdVH0X0k/UE2ygbQE9EUrQq+030VGrEn8Fh2O3ipuYboQ2Fj4aNeuzSAm8e
         OCGvlJVyH1Ej/OfZgNrkD3BRHx9ZqRHlZgfHbQAftgRlxBlByWBohmSg1CGLxHEKN0qR
         S51jrxvxMDJVUlRF1gF3czvUz/r3IUOvyLRATR5E6q+MZIVS/c+gIYboNQ3C4jcLZOOg
         6LzPFtqwZDAeFmXo1/E26Y0xqJX32znii18nallUPCCCZjcMj+A4G9ocmYiLsaglAuA+
         HOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774255699; x=1774860499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IiFXaq2KynT225qwMSd7jsUuMjJ4J3qIwVeyuIMFqQA=;
        b=b5hbtA+Xxc9NbQDfbNbLLo0Gq4C0jKtffXCx4Y2yszD5qpfo8P86xYDVZ/QNOCFJQ+
         OG4LvNTETvFiiWvBnYA22iifF+T10wI9CXd0y4+bsjST0u64v16gX76g0SN9wbjoHf1x
         Sg+BOVb2G2xgiChjPbc1nbh1t6heFwDq0SLg3y527Pp9XigyM/Ts/ATtdJS255fV9mZ3
         DTAevdL9dCnig8/2X2TnlUxc5cttvVQZALR3L/V82c575Z8YFwV8hjqDJ+NepkcjOP6S
         qmQuH9RqMVordkddilRA6rDWHwDllqEsqx1bCSlbzPNi9ClHDjJmYxrBhCp0WNayWFsE
         C5aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpLZOd5dZDEN2654sUAUUOilVFvnHjPL+d7RrrVTqyWxAsUY0B7LavNkTqvLMCfG1Eknt19qAN28M9Ejyh4wat@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+/MzulsroKFgIIvP1beo/jKGjx2eK9+oJqPZ9e3HuFFKyVrnS
	YGs7NMF5AcqBZSfmP3D5HQiP8ASOpH+PTNt3h2K5yiOsqzOHMgcqGPo/
X-Gm-Gg: ATEYQzztXTyuy7GmNYILy603bBGlSWuuZzZAlLgNrZDekwlOJ90zMRzGlyG4xrA7TqS
	mkROWE/k6Yha11epdXJUSMJ+RS/cY2+urgBa81YQgaZ/hWZ/Od73htAmbtbkSqepc/wEwW8zWjF
	SBS0JzYqQ9leBul2wxXOY5uY+LVwc7MIRLI4Jmiu0x1v4nxhwUNQRliT/cTtej/IxfQMO+ESolK
	gyGGkMrVJtS0vyVonlTWZJ+92kITU77QKdphLa5pEGYl40ALWCZdKvOvrG1L7lzA7U+glPffhj4
	1rHOBfvXsjOOFiA8Ah1zPoLOuvASTpXoCqAov3vOhnAcpQQ2qqGut2Rr/JVr6d5Q+81Eb4mXHLi
	RzGZ85F8sOxlTR+jhyq+raXqEhNGJ12qfc6CrSNVmegBGTI1tmb7DDRXbvSJAXKczCDZlgNr3sO
	tF5iVlsHnJ7ivl
X-Received: by 2002:a05:600c:3f19:b0:483:badb:618e with SMTP id 5b1f17b1804b1-486fedf70a8mr160064695e9.8.1774255698607;
        Mon, 23 Mar 2026 01:48:18 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486fe8367d8sm316822715e9.14.2026.03.23.01.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:48:18 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: watchdog: Convert TS-4800 to DT schema
Date: Mon, 23 Mar 2026 10:46:12 +0200
Message-ID: <20260323084616.10469-2-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323084616.10469-1-egbostina@gmail.com>
References: <20260323084616.10469-1-egbostina@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_014820_614900_CC7A4011 
X-CRM114-Status: GOOD (  16.41  )
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

Convert the Technologic Systems TS-4800 watchdog timer bindings
to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../watchdog/technologic,ts4800-wdt.yaml      | 46 +++++++++++++++++++
 .../bindings/watchdog/ts4800-wdt.txt          | 25 ----------
 2 files changed, 46 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml b/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
new file mode 100644
index 000000000..cb2066b4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/technologic,ts4800-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Technologic Systems TS-4800 Watchdog
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    const: technologic,ts4800-wdt
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle to the FPGA's syscon
+          - description: Offset to the watchdog register
+    description: Phandle / integers array that points to the syscon node which
+      describes the FPGA's syscon registers.
+
+required:
+  - compatible
+  - syscon
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    syscon: syscon@b0010000 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0xb0010000 0x3d>;
+      reg-io-width = <2>;
+
+      watchdog {
+        compatible = "technologic,ts4800-wdt";
+        syscon = <&syscon 0xe>;
+        timeout-sec = <10>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt b/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
deleted file mode 100644
index 8f6caad42..000000000
--- a/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Technologic Systems Watchdog
-
-Required properties:
-- compatible: must be "technologic,ts4800-wdt"
-- syscon: phandle / integer array that points to the syscon node which
-          describes the FPGA's syscon registers.
-          - phandle to FPGA's syscon
-          - offset to the watchdog register
-
-Optional property:
-- timeout-sec: contains the watchdog timeout in seconds.
-
-Example:
-
-syscon: syscon@b0010000 {
-	compatible = "syscon", "simple-mfd";
-	reg = <0xb0010000 0x3d>;
-	reg-io-width = <2>;
-
-	wdt@e {
-		compatible = "technologic,ts4800-wdt";
-		syscon = <&syscon 0xe>;
-		timeout-sec = <10>;
-	};
-}
-- 
2.53.0


