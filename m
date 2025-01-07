Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AD6E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Fl/eQkZJH18zTL1orpXZ1EJV3FIZbVYbkE1L+IoBj4=; b=ZyeTYZTgRjhB4aewVXAETLD3oG
	YQniphx0f/3MXkUpm7WQyYgaHzhJzNHWnjYT8Ca7r5b+JCXQ40ldeR8w2cpFLdqM78qhINphoHexI
	O63gCSw3B4eZP1xFCBhnNRSxmYZm0iZBIdhBwunJ4YpnTgXKI/sVFi6kpfPQkTkeLXKtLv7pkdU0N
	00M7ZoxuJaNWCuezTKD2UTz1f2TYsMZbsPYqs3BqwX3WyJQUxELbI5PlkbXVhX2f3rZJ/AiLLOcS/
	PW5WS4e6WaNgWUMIYzMcKGSlTv2nVXA5xS5D4mpiUG3D64SGIVzBIX9qqjD93EPjUrme+CRn5DTz/
	rJjAHMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9PL-00000004xPi-1Ndd;
	Tue, 07 Jan 2025 13:14:07 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9Lo-00000004wVs-3OGO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 13:10:32 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3862f11a13dso1857413f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 05:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736255427; x=1736860227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Fl/eQkZJH18zTL1orpXZ1EJV3FIZbVYbkE1L+IoBj4=;
        b=XJP6VI09U6GqxKiWYJvUvB8XVAH6jxfDrNGvHkakw5XPD+yGA5Je/ldvwiYbYq1Wfg
         03E+vohrFRsXKb4v3tj3v8q7eiMnctnKv/BvZB/Ci8yb9zg+V/C0Bg9GtYyFTZnqBs4i
         fTye8ebHN86zPP1BkyoPF052DgvgZ4eV0MfY4qEKyKjkZx+xaqRtaDsXX6j0vIJ60NAo
         tKHXJvqk0MNyR0U/D0bF9nHnQriGBxhz/OmFOD68t8wyT4RdQTjRCde9zMW+DfVKjl6t
         jUbe5XC5QbX8aUkRCbp3i9aZnIWxI9EAKtrjG9+SP9o5F0Kh+3Z3XG8dO63J7J56X1vf
         VZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736255427; x=1736860227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Fl/eQkZJH18zTL1orpXZ1EJV3FIZbVYbkE1L+IoBj4=;
        b=DehD/YAt01yZclhBiIJ8Fy3pXwdkQJ/G7FAkJwFL2rod/CmL2P3h1RKzHEElaj9r2W
         5d8M3mBLnXnHVc3OSVNtjrNUYOzQjNGK2WVevnZLQpixkKD1MmW7fyqAnHYsL6Focm1M
         46fNHsET12/+ABHDctN58q4+eVNBvhcIDKCtn8Qnd4cQKAuOy4whPFGhw3P+oVmPydi4
         7FTeqk/jhgyuRNhJZvXLrSZyhtXEzxSvIpWSRVF/RWRFb0LrErLn36b0WQkKhFKC60K1
         ZQ4E2eEY3GuclihvroOSDxrRNixYiEFMPbeiHG6ZF8WqBYnmTJsIJSzGjj1r67X21Lvt
         K3aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWaM5IleQGoUqo8veMkriMgr3R3cRFnLKiV8+ckJEBoqCisBlYUn/WLY5yuF5wGFcAUOykMu63/NNbVqNKA/Yz@lists.infradead.org
X-Gm-Message-State: AOJu0YxtAUApSeTkqboEqktQC1iTxrBoXIP+Iab9+nxYTRn4m0n8ooh8
	EVsn7Ngn4ORFHV9w5Iff1rpjPvJ34tKjrVCfqUbAJahuAJdNEcQOgV1M7/lStwo=
X-Gm-Gg: ASbGncvK1976ylIa96UgqangQ/Eu/hp1WqDPS9gMumaBbb2d0uI+L3D7WJlAtxP+V7d
	EN+1qxLoVPZGmSgzHUthKOPRrQ+GBmW3zNQzxvH73213dpFtQWo6BBqBhSOKVrzkBxqu+vQbk+9
	l0QIFbCojV6zmqU6+XUZm0VElye6new8r8OfJuKdQV1klHCscOjyqWwxRGIKUlZT61U4w8HibUe
	fSGF4H2eKB25rBgWcf/cThBioIPNA0S13uFJPZFExmWalQ1DCYUUXGPUbrLD+Nbo3UhBZE=
X-Google-Smtp-Source: AGHT+IFfRKTmcWYhwuQK29x6GhgM+3KuBDEhfqEMYqrc2eSiz3KPEdyVrqLgqFdD9VKtsVU243o1zg==
X-Received: by 2002:a05:6000:4022:b0:386:3213:5b78 with SMTP id ffacd0b85a97d-38a221e211dmr19758927f8f.3.1736255426632;
        Tue, 07 Jan 2025 05:10:26 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm49772227f8f.38.2025.01.07.05.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:10:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: timer: Correct indentation and style in DTS example
Date: Tue,  7 Jan 2025 14:10:22 +0100
Message-ID: <20250107131024.246561-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_051028_861253_8E1ABA52 
X-CRM114-Status: GOOD (  12.89  )
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/timer/arm,twd-timer.yaml         |  6 +--
 .../bindings/timer/renesas,cmt.yaml           | 44 +++++++++----------
 .../bindings/timer/renesas,em-sti.yaml        | 10 ++---
 .../bindings/timer/renesas,mtu2.yaml          | 14 +++---
 .../bindings/timer/renesas,ostm.yaml          | 10 ++---
 .../bindings/timer/renesas,tmu.yaml           | 22 +++++-----
 .../bindings/timer/renesas,tpu.yaml           |  8 ++--
 .../bindings/timer/sifive,clint.yaml          |  2 +-
 8 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml b/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
index 5684df6448ef..eb1127352c7b 100644
--- a/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
@@ -50,7 +50,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     timer@2c000600 {
-            compatible = "arm,arm11mp-twd-timer";
-            reg = <0x2c000600 0x20>;
-            interrupts = <GIC_PPI 13 0xf01>;
+        compatible = "arm,arm11mp-twd-timer";
+        reg = <0x2c000600 0x20>;
+        interrupts = <GIC_PPI 13 0xf01>;
     };
diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
index 5e09c04da30e..260b05f213e6 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
@@ -178,29 +178,29 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/r8a7790-sysc.h>
     cmt0: timer@ffca0000 {
-            compatible = "renesas,r8a7790-cmt0", "renesas,rcar-gen2-cmt0";
-            reg = <0xffca0000 0x1004>;
-            interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 124>;
-            clock-names = "fck";
-            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-            resets = <&cpg 124>;
+        compatible = "renesas,r8a7790-cmt0", "renesas,rcar-gen2-cmt0";
+        reg = <0xffca0000 0x1004>;
+        interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 124>;
+        clock-names = "fck";
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 124>;
     };
 
     cmt1: timer@e6130000 {
-            compatible = "renesas,r8a7790-cmt1", "renesas,rcar-gen2-cmt1";
-            reg = <0xe6130000 0x1004>;
-            interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 329>;
-            clock-names = "fck";
-            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-            resets = <&cpg 329>;
+        compatible = "renesas,r8a7790-cmt1", "renesas,rcar-gen2-cmt1";
+        reg = <0xe6130000 0x1004>;
+        interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 329>;
+        clock-names = "fck";
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 329>;
     };
diff --git a/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml b/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml
index 233d74d5402c..a7385d865bca 100644
--- a/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,em-sti.yaml
@@ -38,9 +38,9 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     timer@e0180000 {
-            compatible = "renesas,em-sti";
-            reg = <0xe0180000 0x54>;
-            interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&sti_sclk>;
-            clock-names = "sclk";
+        compatible = "renesas,em-sti";
+        reg = <0xe0180000 0x54>;
+        interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&sti_sclk>;
+        clock-names = "sclk";
     };
diff --git a/Documentation/devicetree/bindings/timer/renesas,mtu2.yaml b/Documentation/devicetree/bindings/timer/renesas,mtu2.yaml
index 15d8dddf4ae9..e56c12f03f72 100644
--- a/Documentation/devicetree/bindings/timer/renesas,mtu2.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,mtu2.yaml
@@ -66,11 +66,11 @@ examples:
     #include <dt-bindings/clock/r7s72100-clock.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     mtu2: timer@fcff0000 {
-            compatible = "renesas,mtu2-r7s72100", "renesas,mtu2";
-            reg = <0xfcff0000 0x400>;
-            interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
-            interrupt-names = "tgi0a";
-            clocks = <&mstp3_clks R7S72100_CLK_MTU2>;
-            clock-names = "fck";
-            power-domains = <&cpg_clocks>;
+        compatible = "renesas,mtu2-r7s72100", "renesas,mtu2";
+        reg = <0xfcff0000 0x400>;
+        interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "tgi0a";
+        clocks = <&mstp3_clks R7S72100_CLK_MTU2>;
+        clock-names = "fck";
+        power-domains = <&cpg_clocks>;
     };
diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index e8c642166462..9ba858f094ab 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -71,9 +71,9 @@ examples:
     #include <dt-bindings/clock/r7s72100-clock.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     ostm0: timer@fcfec000 {
-            compatible = "renesas,r7s72100-ostm", "renesas,ostm";
-            reg = <0xfcfec000 0x30>;
-            interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
-            clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
-            power-domains = <&cpg_clocks>;
+        compatible = "renesas,r7s72100-ostm", "renesas,ostm";
+        reg = <0xfcfec000 0x30>;
+        interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
+        power-domains = <&cpg_clocks>;
     };
diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index 75b0e7c70b62..b1229595acfb 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -122,15 +122,15 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/r8a7779-sysc.h>
     tmu0: timer@ffd80000 {
-            compatible = "renesas,tmu-r8a7779", "renesas,tmu";
-            reg = <0xffd80000 0x30>;
-            interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
-            interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
-            clocks = <&mstp0_clks R8A7779_CLK_TMU0>;
-            clock-names = "fck";
-            power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
-            #renesas,channels = <3>;
+        compatible = "renesas,tmu-r8a7779", "renesas,tmu";
+        reg = <0xffd80000 0x30>;
+        interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+        clocks = <&mstp0_clks R8A7779_CLK_TMU0>;
+        clock-names = "fck";
+        power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
+        #renesas,channels = <3>;
     };
diff --git a/Documentation/devicetree/bindings/timer/renesas,tpu.yaml b/Documentation/devicetree/bindings/timer/renesas,tpu.yaml
index 01554dff23d8..7a473b302775 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tpu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tpu.yaml
@@ -49,8 +49,8 @@ additionalProperties: false
 examples:
   - |
     tpu: tpu@ffffe0 {
-            compatible = "renesas,tpu";
-            reg = <0xffffe0 16>, <0xfffff0 12>;
-            clocks = <&pclk>;
-            clock-names = "fck";
+        compatible = "renesas,tpu";
+        reg = <0xffffe0 16>, <0xfffff0 12>;
+        clocks = <&pclk>;
+        clock-names = "fck";
     };
diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index b42d43d2de48..d6a73be66765 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -76,6 +76,6 @@ examples:
                             <&cpu2intc 3>, <&cpu2intc 7>,
                             <&cpu3intc 3>, <&cpu3intc 7>,
                             <&cpu4intc 3>, <&cpu4intc 7>;
-       reg = <0x2000000 0x10000>;
+      reg = <0x2000000 0x10000>;
     };
 ...
-- 
2.43.0


