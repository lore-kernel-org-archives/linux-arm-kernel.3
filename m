Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA960C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 20:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVnUcLf7rUkhmKcblE8DIPr7Qf/4SKbPpJHYfQM91kU=; b=ez/hdzpO0IvykUjiikrBm1Jm6V
	cdQcV0OSsIHDzEyEb+iKHHIfi4XO3aD1+2d/DNHr/+GvoXJ9Gs6VZpOeSq3qlXSynnUf7hdl1iCUP
	NW4y8aXKYz5apHVr6WQsoh1pcQhZsUraubBd94JhIoTo2Q+6wijKB1MLX3BfZCtAtUgseTH588LV1
	oDe6Qb/XQBrT9LNJjeOAArG0EniRiikzzb/N3kdIr4YAPVVhCZtCHkUlfPd6MXPLxbi6MjE56NhT/
	6Df/NwRsR4fhrIPMvyqPED3m0BEmDqSBv3f7z+j/hj/jjV0U4F+mmVQfIc03+5l+ATOzgHRKTj0Fv
	eO7w3h6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cKg-00000008Uf2-1NO8;
	Wed, 09 Apr 2025 20:47:38 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cAu-00000008SZY-2xcv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:34 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso2150988a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231051; x=1744835851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVnUcLf7rUkhmKcblE8DIPr7Qf/4SKbPpJHYfQM91kU=;
        b=BGFzlVdj5PcLxwCIiYvdMWasCHNJKm/TDEugZZyt7ruSajzM3aw7HtwIjbtLGawy+g
         tZCjTjojrBVQMwnHzBCwf/4IlKjZWZ1sBqkO5XQEe+FYWJVNFtRutdhD1+ooVkg5AD0a
         zSp5QuUkV02Zb4k8Z1zRckLlvO/Qcni0VuZ6aVka+sd+Gpbz7zUi77FTYKqbwX/2XaJ4
         Lw8nD8DISVNTuQ+o2wrRMv6Y/JQfUQJc5bVujJoa6iE/kJmdsU4x5d5r9OhJocA8XLBD
         LRrKDla7dtJqdYCPpZR6ZdWy9cNdZChpi0akKAYpnXFPrAWzZIhb8F5bSUPwFSiGuwyV
         BC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231051; x=1744835851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVnUcLf7rUkhmKcblE8DIPr7Qf/4SKbPpJHYfQM91kU=;
        b=I1tzEqG125PpPEmUKPytqCbyqlnp9SX2r40k0ZTDUQdeGeKZKL+TJ7ftvp0SwUn8yJ
         5qzcaz4K9orjb+ecctuPD4RbQ68fJx3vNUPNvA6c8csgN99Gb+kbmcWs2gcqMjU7NaPf
         knKsO+3d46G/l/mltBMIOqI9KHIMjsI3XSoW7WRuIXoMjC8LXvGeueE+wFq6zecvUUxn
         dNao8ziZaUopD8DKcf30Ns/6xG/mn/ZeT0kaOoRRGzqYeLvCy1o7Gz9d3g2uCOgIQ+9v
         WZNlOJv8iSkzeE2g9qoBt2G9+UwAEd55v+ljzZRWpfGh39Ac/TMOz9Lsnn+xqpCg3VXo
         u6mw==
X-Forwarded-Encrypted: i=1; AJvYcCV4PetVdokQnXZkVWUSnpbMef8bMXSJbkmqCZvSNf0c/atWi8+j4CRV+3zgRZLnYHrSKjl3oQvAfiWFz/gedkZB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5rO5JsKmgcjZgoUQaTrlcVZDm5nZbXBJchOQC3ekZMYN0neUW
	IZIMZo2crxwq5sUrNxotARHoxL5Lr/k9EnpTfp7tAjjBZ/4F9sS91htl0dms4dI=
X-Gm-Gg: ASbGncuiyoJH3cDFYL6XoHCIhlgIlqGzoyMmF7TOgjhQqQK0i/pB2vNTkWZXsyvjO0T
	qkmtyvtwYeHHhaBD6Pyw6/+sYuXjFcwHonhhpkKY3SWKuf5FWDfqEKkfEQ1X+NfaIvyp3cQC5fs
	67F1Hx5AuJ6VTz1OFsjoVEoNTdQ7lUHERK38J3wG0F67entsLPQskBwaNT0ky0PS+a5Zu2ZcrRj
	mwkp5Nu3CsXZCW47324LvgaEPCVk1G7mGGXtwfjz0mLLy89scHzwU8Pw03prPzT3TNnDx/+Ft64
	9ln9DZ7XLrrKE7VCbejLId3LWRrC+arEIv0/cMwBoAW7FxouMVk9HQBdb+jiCrGosi87z82kMDK
	T9gYJ03F8WmmmP/XEpsmo8OLpzU0=
X-Google-Smtp-Source: AGHT+IEjKjbyVX1trxn6vhWMEq8SjYl6s0uvLlNF7RYWo3JUaldcMy8toq0oDQoK52nrthEFmj8Kqw==
X-Received: by 2002:a17:907:7e8e:b0:ac3:8895:2775 with SMTP id a640c23a62f3a-acabd36b337mr8219466b.13.1744231051032;
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:24 +0100
Subject: [PATCH v4 03/32] dt-bindings: firmware: google,gs101-acpm-ipc: add
 PMIC child node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-3-d66d5f39b6bf@linaro.org>
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
X-CRM114-CacheID: sfid-20250409_133732_741537_C3784119 
X-CRM114-Status: GOOD (  11.13  )
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

The PMIC is supposed to be a child of ACPM, add it here to describe the
connection.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3:
- drop '$ref' and 'unevaluatedProperties' from pmic subnode, use
  'additionalProperties' instead (Krzysztof)
- add some regulators to examples since s2mpg10 requires them as of v3
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 2cdad1bbae73bb1795eccf47e1a58e270acd022c..9785aac3b5f34955bbfe2718eec48581d050954f 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -27,6 +27,15 @@ properties:
   mboxes:
     maxItems: 1
 
+  pmic:
+    description: Child node describing the main PMIC.
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: samsung,s2mpg10-pmic
+
   shmem:
     description:
       List of phandle pointing to the shared memory (SHM) area. The memory
@@ -43,8 +52,34 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     power-management {
         compatible = "google,gs101-acpm-ipc";
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
+
+        pmic {
+            compatible = "samsung,s2mpg10-pmic";
+            interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
+
+            regulators {
+                LDO1 {
+                    regulator-name = "vdd_ldo1";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                };
+
+                // ...
+
+                BUCK1 {
+                    regulator-name = "vdd_mif";
+                    regulator-min-microvolt = <450000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+            };
+        };
     };

-- 
2.49.0.604.gff1f9ca942-goog


