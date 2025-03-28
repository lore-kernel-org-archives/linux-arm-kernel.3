Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44231C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bj8t/d7ZCz8V074ZRQQT4KdwjDhZIZlUROdEW2RBy3s=; b=nHrqI2sw4ZIuwGSo0YHFPKkw2d
	zeUyCOLIYkAzjy+8Gs35JbxcariD+6KuxJT9vuImke8UeMd/sGgUpcB+y8unml9a9rWyrpSVVdbxl
	6U9pJXLp3sEW3VzWphb/8JzZz8eD5OG888/z5pLfSfTkgbXRgxf3bqTHHQrmF5aBLViDPulhn4J6S
	H80bZP7fgXxXatO5hM/SnTWkEJQuWnrCqziP7pwm1jhkiHFQXvcDb5QihE6TmndrrXHAYBWQjBwj9
	LT/g/IuHe2lANNwb7d4HAAInyWe1/lIneFx0u1P3ztaValbXh/MsNBv70bcaq+7+rC8dwfOdERbtp
	Fbnsa5Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9pF-0000000DR80-0CDv;
	Fri, 28 Mar 2025 13:32:45 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nT-0000000DQbe-212d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:30:56 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso4222435a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168654; x=1743773454; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bj8t/d7ZCz8V074ZRQQT4KdwjDhZIZlUROdEW2RBy3s=;
        b=DmBH3zEYPzS+C8t6e9tRvXpGUyXfuCUc+zq5ej59J7AibUDDjDKyfGiYud7DLfQJMO
         fhJ+Q3rFi9UO5CAHcq6pF/Ai7SdnPpw0cNlx4ollNKkqWutF1bFbasEFGypdm3QgQfv8
         9lDFca6TUNkNNIcSr3oeVmR3ariI0BAzRpYIFSiEgktM+Mr6a3Ay3P6AM88VVBh9Y+Tn
         AlXN8H/HW0VqqybILAEug+VNakELhxOjE8LO3gm/tlMpzl+Es4cQFlUpfEloslY0IExM
         IwNxQKfwE5Kxt7rogMPyDnwOtLD+fI5HeAikFjiQaGYC+UccIRlYgmr863VaY9jBwpF2
         /chA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168654; x=1743773454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bj8t/d7ZCz8V074ZRQQT4KdwjDhZIZlUROdEW2RBy3s=;
        b=Cq3ZqUcOFJIW7yhMd6H6PF7IUBvfJL0d3noulGkZ3LfvFSIvQWlo8LNJbUqgH7MmJq
         SNhwLrDofW+q4vnznNmOIwIbDioWjOUrp+lPNsMn3FBejhDNEAMAyzyUeLMz9dJanc5l
         ZoQAEOlGKYMBfuXhEKPl7Q0alXvprsX/j3gw5sWWluZhmoFGQTN3TYaN6aP+E6crieor
         /UX9q8NqZcZj73j+T+5XITYnErGEp1+A4M74fvGZRd71+5sfKajbaJOVgG1J2yopZiHd
         OSy1kpw3KGjYEwXDLzV+exq545gtvQv6Vx1jz2O4LXG4xec6vFmDZQLG4Kb3tc2XgHJx
         WSHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNkIu6YTLEF4C+3jWlHy1Q5m4D9KMcsQ5swTvX7O2Tgna5YQT6RNrj/ijWBMX7mDBLVtDcaoaQJP0GCOVveulf@lists.infradead.org
X-Gm-Message-State: AOJu0YxvxZ6yfMDziB1Bpj1AqMoq7pFV6DNGQUU6lSQc2wI+IiiC+8El
	UimuTXxJUq+9SS4iKXKczsUmBU4hJwiJeDpQx3YFszIqR/t69vhD91PlfJPJyJ8=
X-Gm-Gg: ASbGncvtQYNgIkj0WKKr+jcr7qYBNYgR8CCps4ybKQO5VfaVqcS092UwQbIBYlRfEO3
	R4RSKgevL9sTgRoPWEZodGDJ012pEIxDPJbBOAV18fT4PqLQbjXK2i32R5Fr7U2GdndkXCe5RLQ
	mH6hYWrwrG8vE+5Ib9EYk/1do2t26tPsrqRX9dPwUvtiOmvMl7gq3CcQzc/pSLsShA0Jzyu+dTt
	uDts5VfX4qwk4bWl2mTYry0p9VflDKkYpPSa7zp8Fp0CaePnSXLLNx1FRF+CpIHL3TE3s19enif
	kQF8XLGgal/n6chwf3NKLonAiLNj3F5rGZVmABAMis15c1OFU0+7063O7Gx5K/YBdTfXMAeQ5Ty
	mmXN4EhUKwx3hVH8DI4amYNPGvHgd
X-Google-Smtp-Source: AGHT+IG5iLE7r81td49W0bBe07yr5W+PK4WyVyGMbJeUq+YUB/jGY98HLwkEVGj4tkqcJ2fbAud1Ig==
X-Received: by 2002:a05:6402:27ca:b0:5dc:63d:b0c1 with SMTP id 4fb4d7f45d1cf-5ed8f5f7241mr7187353a12.29.1743168653567;
        Fri, 28 Mar 2025 06:30:53 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:53 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:47 +0000
Subject: [PATCH v2 01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-1-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063055_519155_27E45DDB 
X-CRM114-Status: GOOD (  13.36  )
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

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
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
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 28 ++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index ac5d0c149796b6a4034b5d4245bfa8be0433cfab..62d0e9f8a4d39add50a986af1836cfdcf065ad48 100644
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
+        - regulators
+
   - if:
       properties:
         compatible:

-- 
2.49.0.472.ge94155a9ec-goog


