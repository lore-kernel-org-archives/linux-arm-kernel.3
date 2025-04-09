Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D38C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 20:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkaEGUM0nmTBd/L91+ubJHG0un6i+kZ4jUPyHnK90Ec=; b=qL2+vRWOgGveWVbVVHhut0uiON
	/p+CxHjGVUKJzV9ARfQZYXNKB1j5AEP1GRoJZJEe2Q5aoQuqFmQCWAX8J1sUQizFeJxf4Z1uSJ1+q
	wdB9/El0a2n1YjYLEWZz2Q1UZJbBUbbvebjCgaEPEawxpeP0ozKvhpXfYTcneRHUmQ0LfUmqAGslu
	gtHhWUwgEvW9j2AkhQvb4ouNQPV96XTFni6nLGCaahlUO4ToHtwo4ni62FZuTKDqhQYF8K0TlmfRl
	ffbYorfh0sUoyutEAFSeYFx5zJXO2rU8nKx5r7bussz2NVu2Nh7lL1/cmB0PAH/ECwFGCB+9ljXGp
	Aq0AsB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cDc-00000008TAe-1Amr;
	Wed, 09 Apr 2025 20:40:20 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cAu-00000008SZW-09fD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:33 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so238352a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231050; x=1744835850; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkaEGUM0nmTBd/L91+ubJHG0un6i+kZ4jUPyHnK90Ec=;
        b=VLodWaLqKAk4WY+OeVQ7F/CKdPMl+Qa9pRI+4GPt7TRERUAYgejtn7qsLIEa8/fdh8
         faYAJ7rnGUahBo01F04VCqWBBnBI2XeNSP3TmfAOPtcq+DYUfLxi9DeijSn0CPSSUlm0
         eLRSdGFORDoVpg8W8pr3UxUbprRPoET2tqswPShgp6kOH/Ajy+TPrNYferS7ReBAVPdG
         0UpqXWm+lISTihywpBevkG1Nu6LEI73/aqRNRZs7Dug+TRq54jYeciYQlVspKFDkD/O3
         v4i46NQXz9O5SvjMTS+S9rCVCwZhCdZ2IBXdbAe/Y3AjMjMqhpg1Udj8UZNCKp62LYtN
         BU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231050; x=1744835850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkaEGUM0nmTBd/L91+ubJHG0un6i+kZ4jUPyHnK90Ec=;
        b=LHKSdk2AQ2FpRZ/uY1FZOYcCdneJ/ofCtcMv78yw/ZSwAOsMdUftj4jWtUYk7xDFS4
         nPHLO6IA3M+8TmpHUKBCNbnKR/B7RKhIk603nKcs9tjmeWMczcbr2Hh2r21fUUbGXL7f
         NJdqOWLnh9GVKwavxLwsIyGSZPQKm/sWo/xnLb2hlEzsBkktUuN8G4iLnHCeq9jJWaRo
         X1SCRjlkfuQut7Z3jyLnq4JZn2CG2Nd6/aDky5vkoLxW49RKH4gD5uvLyP+nVlRAYMzD
         f6LucG8sd2A1Hnyjh25cVoooVGffFdxcaiccR0vAhMYPdfRhgyhA4AD2NB7MqYLaxRKG
         UVqw==
X-Forwarded-Encrypted: i=1; AJvYcCW/t516pUN7VzgNhk/M0ehLtZO0vrBkVup00z0xUz6rVnnq2ZYc3hJ1sFDg3KZQ9fkMRMmBoIFQ7R+c7/M1BCgU@lists.infradead.org
X-Gm-Message-State: AOJu0YzpNcrAgrl0++D3nWjCOMO81Q7SKw6/X3965BE4b9cn1sazpFzJ
	faPWffvYHiaAuaI+cmXkut/Jq3a3jsB3oKKc6p+RYrf8eGLje0FQ2y/TvmeW/eQ=
X-Gm-Gg: ASbGncu6ngNM4C7y2NhbnPJH8YHSW5XHzPledYR6+F+CpbKJ1bNJk8YL7navFgPjZU/
	uibLDERiGNuxTeJL18DMFZkUJmtqKcH9Eom3ZqDN5v6VzbjAHargKPe+red3BGm67YutAMKEaU3
	DY6eBk+Kzwj2VzsSyyO133dERC12kUvvLsGxYS8IeZzlmE37iV8aCO6IDFtZEdMJ9i9/2lk2ZDR
	Qgk2o4ZDnzZyR5BOGJ+URHSgmXRSoPkJlNtc6ZdQvqM8SmQ6tYeX8Kfpx0cTegP7o6GeF9J3m88
	rQzTBQfy4w3bnJAoKzw6J274Iqb3rff0BC/8w7ZixJHk40w2L3DoBsbYRB3lJaPGEfFS/KYlRRj
	Bj+reBTKVaA9y1joKpwSrJvXwtKU=
X-Google-Smtp-Source: AGHT+IEPjIei3RK/9A8Tp+rrhp1bR2HYslRxdh3PdoW9/JZ8jdttJ9N/bFj93kTMX29T5OJTm7P8YA==
X-Received: by 2002:a17:907:720a:b0:ac7:ec90:2ae5 with SMTP id a640c23a62f3a-acabd20157cmr6631666b.25.1744231050061;
        Wed, 09 Apr 2025 13:37:30 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:22 +0100
Subject: [PATCH v4 01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-1-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_133732_080214_F272BEC7 
X-CRM114-Status: GOOD (  13.02  )
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
Samsung ACPM firmware, it therefore doesn't need a 'reg' property but
needs to be a child of the ACPM firmware node instead.

S2MPG10 can also act as a system power controller allowing
implementation of a true cold-reset of the system.

Support for the other components like regulators and power meters will
be added in subsequent future patches.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3:
* keep 'regulators' subnode required even for s2mpg10 (Krzysztof)

v2:
* drop ACPM phandle 'exynos,acpm-ipc', and expect this to be a child
  node of ACPM directly instead
* allow, but still don't enforce, regulators subnode, to ease adding it
  in the future
* deny 'reg' property, it's incorrect to optionally have it for S2MPG10
* enforce 'interrupts' or 'interrupts-extended' property. S2MPG10 can
  not work without. Note this is done as-is using the oneOf, because
  dtschema's fixups.py doesn't handle this nesting itself
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index ac5d0c149796b6a4034b5d4245bfa8be0433cfab..d6b9e29147965b6d8eef786b0fb5b5f198ab69ab 100644
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
@@ -58,16 +59,39 @@ properties:
       reset (setting buck voltages to default values).
     type: boolean
 
+  system-power-controller: true
+
   wakeup-source: true
 
 required:
   - compatible
-  - reg
   - regulators
 
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
+        reg: false
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+      oneOf:
+        - required: [interrupts]
+        - required: [interrupts-extended]
+
+    else:
+      properties:
+        system-power-controller: false
+
+      required:
+        - reg
+
   - if:
       properties:
         compatible:

-- 
2.49.0.604.gff1f9ca942-goog


