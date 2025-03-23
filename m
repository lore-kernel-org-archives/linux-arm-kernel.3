Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA72C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 22:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXb1pE2B5VZK7eIRvGjCX0bwONX10G0/gh8FJgs0P90=; b=Nw7eTjJ5w+73SLFUZYURBdsoJV
	c2NoSQyTocTqiaD1MO//BGaWL6gmj1L6bZKgxoYm6385crmVZ8Ca5LOLm/JVeoHEROqXuJ7K4cPYu
	A6PCfGTuffyWBVv6h6NYSthwfw+FrppQ0mfYJxLDv3yquaerflcPFEYsAzg8GMk5XzB1CGMm1H3rV
	lQ8tGLPJuwJyVAugKCZD6y0ZxNOnzJyalPfBHEJLSLg+c531JFhvb3/LYMscoDH7CVcC5Zffe0O9s
	7XYx49bKxhgiC35g4i+Bv/sdr6Lo4fjvg4t9oUDZaBVvrpOVJUl5OCzVN8ea46AJC+YEz34nc9ddp
	voW9tVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twU3Z-00000001qD8-33GZ;
	Sun, 23 Mar 2025 22:44:37 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyY-00000001p3i-1oib
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:28 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so5902728a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769564; x=1743374364; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXb1pE2B5VZK7eIRvGjCX0bwONX10G0/gh8FJgs0P90=;
        b=cfcvLcLE7mgUgnEcKGfyMEdfstU8wcmrDtxpsZQY0ht+7xrOkdqMbrTeZ7iu0FNEsi
         Mkw0CED3duHlok3+4fpRbvasfK2nRQebsG5Uo+SxmMTSBqCgkH3yqm7NWWXKerXNqsD+
         PnrJqQQc3atjhI/g0vRh4ZXxSS/KRH4fpilYCRN111+dt/DfYwHS2pu9Hh1AyMS7uUJk
         0xqX/BNVbeKTgmg69tKs8aOickpmTjLU8S7RWGybS8tk7Y0g+pUyk95v4nmvBshwNDbh
         3bnH6yGjdVW17dX1rrb/4dzPjscd3iQAdP8YP5iQ9ufOfm4NxkKJ3uFW3ZC4GJAnrwTg
         GuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769564; x=1743374364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXb1pE2B5VZK7eIRvGjCX0bwONX10G0/gh8FJgs0P90=;
        b=RwaTetmTaZzWz/We360VSgvXqekY8Gt89nJZQXjiX4vaMDuHVh1k8y8DnGDgoHO+ko
         L6Pz20u12kEPmWdr75LHU9PTDj8R7X72KXHe02QTdz9XWjkyL+M8rkFaU0nKXwuc1QJM
         BrF7h1uXf7CTgS6s4keP8g2fgYD047Ylt9DVy1CbQQB0PN1uxicIkN24BZ/OM9Mv8VNV
         xtqB9ttQTHzuHQKXhxSyTXzGgP0nDHyRWovmA2zrVw4f5TOvvsYii1GJhkjmRtnLfVg1
         00lZ9doJlpLZvWbC9BOIZpWLpIMlvTBRo/VCQx2lBLJEoNPWWy4DBOqTFoBq2fpDWktZ
         5KSA==
X-Forwarded-Encrypted: i=1; AJvYcCW5Ud1Y+Kpf4nDhsjUK3vWL0/54DRjZ5w6qevs/C4SnMJcuMv0v2AwZEnBMJEeKDnlUViw4v0kcRoKzVR7yY9rE@lists.infradead.org
X-Gm-Message-State: AOJu0YyefFd3fYgC7csmTU+MftOV8YaFBUK+gvQ1pfi7dqdX7GoCaHgd
	izxcS4+yCVwE0p9QRIjtLDfdbLNEH9qHZ5WM7N6DtLJxFOeAJ/esdYoGNzMJ5U4=
X-Gm-Gg: ASbGncu906MxMgNJ15+NrqyuEUAwZ1Ee2w79roOV9b54DUXkgRkV1+iDv6F6Tw88nif
	fGh0ZDcv5ruLcZORvnCwLrZMKswHsrpVC2DEMwqOTdAyc8675J39ZOZi+4tyX6ZguHzvOXiuycC
	A9h0Lqxxqs9gr3sdRGFhPYE319Y9gzSVVdTAcfxhRxZQYxoPVKX0C284jrXbw0V6bvfZVhawUsv
	oCN9qy34p4nkvriHT1uPGGPqdMEqDKJRxzVrKKOdcolpy22oB8iSSrC7j1RlmYgD92Ecoa0KsRT
	1r3wsrizqkGoPirfg2CPBz39eRsrcAFMUNTtpL0AsMBEv+6NI1q7aACWXRJDsfmzTUTxZCviHIp
	i+CxSmMbR0o1cBF40BVlz9AeKgKG4
X-Google-Smtp-Source: AGHT+IFEmZ9BlAcg5cpLq9P2zpjpd5ecowSIznI/DDr2rcI73G5OWcR4yuBPI4oD1OUtU38fBId+Ng==
X-Received: by 2002:a17:907:7ba8:b0:ac2:b684:542a with SMTP id a640c23a62f3a-ac3f23df97emr1170613466b.33.1742769564196;
        Sun, 23 Mar 2025 15:39:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:23 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:17 +0000
Subject: [PATCH 01/34] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-1-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153926_643832_09A6A3A0 
X-CRM114-Status: GOOD (  13.53  )
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

The Samsung S2MPG10 PMIC is similar to the existing PMICs supported by
this binding.

It is a Power Management IC for mobile applications with buck
converters, various LDOs, power meters, RTC, clock outputs, and
additional GPIOs interfaces.

Unlike other Samsung PMICs, communication is not via I2C, but via the
Samsung ACPM firmware, it therefore doesn't need a 'reg' property but a
handle to the ACPM firmware node instead.

S2MPG10 can also act as a system power controller allowing
implementation of a true cold-reset of the system.

Support for the other components will be added in subsequent future
patches.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 34 ++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index ac5d0c149796b6a4034b5d4245bfa8be0433cfab..ae8adb80b3af7ec3722c2a5718ad8fddf0a5df34 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -43,6 +44,12 @@ properties:
     description:
       List of child nodes that specify the regulators.
 
+  exynos,acpm-ipc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the ACPM node for when ACPM is used to communicate with the
+      PMIC, rather than I2C.
+
   samsung,s2mps11-acokb-ground:
     description: |
       Indicates that ACOKB pin of S2MPS11 PMIC is connected to the ground so
@@ -58,16 +65,39 @@ properties:
       reset (setting buck voltages to default values).
     type: boolean
 
+  system-power-controller: true
+
   wakeup-source: true
 
 required:
   - compatible
-  - reg
-  - regulators
 
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
+        regulators: false
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+      required:
+        - exynos,acpm-ipc
+
+    else:
+      properties:
+        exynos,acpm-ipc: false
+        system-power-controller: false
+
+      required:
+        - reg
+        - regulators
+
   - if:
       properties:
         compatible:

-- 
2.49.0.395.g12beb8f557-goog


