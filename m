Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7848CAC594
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/SeeyRvYxEIsfGVZybU2qc9C9N7ZeMuzRETBp2zbnM=; b=CeE4MaVYB88apXHlFTwbbQAP72
	lgCxGZIdD4HEtUpw95TC1WIDWE+gXz0G7Hn8XA52j+ITq94n3njo13r/0PpRW5tDGSIjWGMnFrqwC
	kzls+ZjMY2WXE7wF7z6vRpcFM3uz4veRKJKpY0Yc4t9uRMfyx6OYqPSkuTWxZAoivJvAhzlajZk5a
	qlEg5EcOjPgwqMFEkbAEz+06YEeHYHWEv9MK4hv/pKYyNoH69z1Ryn+TYZDEFekE1cawrY30UCVqQ
	MjQLh8KeDzpZntfmMyLDD3dcXFW1yhP0PqmCOpIp3zTftoN7nwLvlSOd0I9q3+Q8AK62jXZLhr2xS
	P4G0ds8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXbi-0000000GI34-198o;
	Sat, 13 Sep 2025 21:16:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXbc-0000000GI0V-0Xqh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:16:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so26686685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798182; x=1758402982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/SeeyRvYxEIsfGVZybU2qc9C9N7ZeMuzRETBp2zbnM=;
        b=Oxo9fq3k49NGYg+nKkqoWZHX0agdiVUg4ef5au9pwT6oYZcI5UZHduM+WNzsJnys58
         eT4eoY6F2ATaznKMGinIn8OIV9V1MMZlHmwCJT1wvErrH+HQcdTSgwmSA8Q647tX+XD3
         0B9IH4J2Vtl97ViOYHNa3W+eXN3LoJlaW1KlnzGZyIeCdjdWtSLJoYj2VO/Br8y/6JAC
         glyafpiIAyCdBWRj3kbuKLXizxqwGmD8JvVFbtOeqkf1I7gkggwASUzA1dt/lJOHLpBr
         6zWwjhWUqrG+4mJBDguP+k2X8B592759sU5r3LP1AWcBqck2si2CVbJ1MeElW2SVRyEi
         amfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798182; x=1758402982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/SeeyRvYxEIsfGVZybU2qc9C9N7ZeMuzRETBp2zbnM=;
        b=UHlfPIi6ry2qHSL6zQV3PBCdCpgnvIiCkGEA8LyvLipARpe2PGuL7ZH9IOjibfnZ3A
         Y7U8bhqwv3upcT2YnMQ4VEY1NNjbMbZeTmiWIro3cM4B82w2UI6dPCWhev1G4CQ2uPN4
         uG0f/cO+Oww4a+R/+TAuUlcHG247eDMJmzVPhsKgAP0GU5gJ83whjzsan1Jx1DhyON5i
         uBOCGipzvsYNvDXnAxgoeYWwHQIN/mPQgVcFrHPGJ7SgVP9+ZtjZzrUfahbcm4xqqGMh
         9XEFEP2LcvErqrez6I/KIZDBS7RrpV0sSImOH/AXVF0qbO5H8yi4+tq9fGmuwA5/bCHQ
         78WQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6SDDz30kMHNFZG2ECVBiaQCtLgBkavyEU0uV0drt1NiJSzJpKjFUT3zrG2mp2K5ALyrsbbmFcKIyfCQWeuV2T@lists.infradead.org
X-Gm-Message-State: AOJu0YyqjSsprhQ8ezfkANt8EnqjUZDiwMMLh6q4dH0FjyBgrvrsOX5c
	Q/0klDFwssbR5o7SKEu4o2Gj4XmAu5ZqqQgZahBD86nbaKxXCLzGxrUL
X-Gm-Gg: ASbGncu9ebpaIZwakQRUEj78pivpLTm3eqSMJoKxrkdz6/M8iC3tly7jxhrqtAcNMrQ
	TbanjugW9jq4rsyvZWJttn1RUspJjs2p8VVZnl1oqAeyvES2bb7VSHi18IKIUnPmCe6KP2G0lha
	eOFC1fxXjXpC5YyS8576ZiZciYsVWaJ6/pAiKqp/CY8xVc9l5vdSr37HG6oYz3korxGlXHDkyo3
	PGeyV/RVpotINwYP7CnzLOmVsy9vJMuZ5VlddN6Uxqw5nqU2fhsghs9fx0bI/8JOFKcW7iQzoE4
	dmNf+fMGgjND7l52xChuxmWfNHjmMUbkPUAl2N25b19oUBlnR8jgdTxDc0Oub2VMkvknipcqKpO
	rITxMyIRcPp9LPXvN80Zi/3sj1NZvy/4p7UVAIWIz+A==
X-Google-Smtp-Source: AGHT+IENdqe6tFLJhgaKYNDsjgAqN3Bky9aI7BhYtkMmCPhOAUK8jcHMz4D/zkFC+NDqh4hUyO9H9A==
X-Received: by 2002:a05:600c:c3cf:b0:45b:8b95:7119 with SMTP id 5b1f17b1804b1-45dfd5c0dc5mr67761295e9.8.1757798182134;
        Sat, 13 Sep 2025 14:16:22 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e014ac468sm65403145e9.0.2025.09.13.14.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:16:21 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:12:48 +0200
Subject: [PATCH v4 1/4] dt-bindings: clock: marvell,pxa1908: Add syscon
 compatible to apmu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-genpd-v4-1-55e4cf32f619@dujemihanovic.xyz>
References: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3482;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=kOa/aUOGsrnkhFr1peiUiieuFcP0VPi+VrVXV4Tn/1U=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlH7yttDbZb+Le3+cKK2ZeWqipxNa3pOcUhyLc4dMmBw
 6FLfLrWd5SyMIhxMciKKbLk/ne8xvtZZOv27GUGMHNYmUCGMHBxCsBEum4yMmxjT5Itvzxl/oap
 ZiuLk4I/dfmt0Jtq8vRR83GfC7/XPitkZNgSrH0n8uXkD+8eFLFU7dliJ1n0tk3zbnmpXdc1Ne5
 uVWYA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_141624_196802_86F50052 
X-CRM114-Status: GOOD (  15.14  )
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add required syscon compatible and #power-domain-cells to the APMU
controller. This is required for the SoC's power domain controller as
the registers are shared.

Device tree bindings for said power domains are also added.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
v3:
- Squash power binding patch
- Update trailers

v2:
- Drop simple-mfd
- Add #power-domain-cells
---
 .../devicetree/bindings/clock/marvell,pxa1908.yaml | 30 +++++++++++++++++-----
 MAINTAINERS                                        |  1 +
 include/dt-bindings/power/marvell,pxa1908-power.h  | 17 ++++++++++++
 3 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
index 4e78933232b6b925811425f853bedf6e9f01a27d..6f3a8578fe2a6810911fec5879c07c9ddb34565a 100644
--- a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
+++ b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
@@ -19,11 +19,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - marvell,pxa1908-apbc
-      - marvell,pxa1908-apbcp
-      - marvell,pxa1908-mpmu
-      - marvell,pxa1908-apmu
+    oneOf:
+      - enum:
+          - marvell,pxa1908-apbc
+          - marvell,pxa1908-apbcp
+          - marvell,pxa1908-mpmu
+      - items:
+          - const: marvell,pxa1908-apmu
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -31,6 +34,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#power-domain-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -38,11 +44,23 @@ required:
 
 additionalProperties: false
 
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          const: marvell,pxa1908-apmu
+
+then:
+  properties:
+    '#power-domain-cells': false
+
 examples:
   # APMU block:
   - |
     clock-controller@d4282800 {
-      compatible = "marvell,pxa1908-apmu";
+      compatible = "marvell,pxa1908-apmu", "syscon";
       reg = <0xd4282800 0x400>;
       #clock-cells = <1>;
+      #power-domain-cells = <1>;
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d321752ac44c91d2d7e74de28e08960..6f1d29c42c2eccf7fad489fd6a9b2c74fb24e4ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2872,6 +2872,7 @@ S:	Maintained
 F:	arch/arm64/boot/dts/marvell/mmp/
 F:	drivers/clk/mmp/clk-pxa1908*.c
 F:	include/dt-bindings/clock/marvell,pxa1908.h
+F:	include/dt-bindings/power/marvell,pxa1908-power.h
 
 ARM/Mediatek RTC DRIVER
 M:	Eddie Huang <eddie.huang@mediatek.com>
diff --git a/include/dt-bindings/power/marvell,pxa1908-power.h b/include/dt-bindings/power/marvell,pxa1908-power.h
new file mode 100644
index 0000000000000000000000000000000000000000..19b088351af138823505a774ff27203429fe2d97
--- /dev/null
+++ b/include/dt-bindings/power/marvell,pxa1908-power.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Marvell PXA1908 power domains
+ *
+ * Copyright 2025, Duje Mihanović <duje@dujemihanovic.xyz>
+ */
+
+#ifndef __DTS_MARVELL_PXA1908_POWER_H
+#define __DTS_MARVELL_PXA1908_POWER_H
+
+#define PXA1908_POWER_DOMAIN_VPU	0
+#define PXA1908_POWER_DOMAIN_GPU	1
+#define PXA1908_POWER_DOMAIN_GPU2D	2
+#define PXA1908_POWER_DOMAIN_DSI	3
+#define PXA1908_POWER_DOMAIN_ISP	4
+
+#endif

-- 
2.51.0


