Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5022ECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRXbXMcdQaybVyL41swV860lNNbaXOzw6nia42KxTE0=; b=eQ0Njp2oznJRJPWSFPfSEyOB5V
	NI5QyIrNw6kn+KlPpGgXdeOlh9f94fvShij5w7r0e7+NoWMMT87lqKZ3oiXJT0DaFjFSc1a4yrI/E
	l+trDcxjQZuXGQLD+zwO5M5q9L97Q0gKoTsi5oEcrGYs0AxNyEmK6fF7lwxnMehilJqOt7Khjo3AB
	/WMu+6dN2Mj2rgCM78Z6szOp7zDHYCoD/IhM6d6UeF1HUXTCIpCdntVxQ1ILqn/iZpjpBIZ80CBnZ
	RQkVQk3roBPKPPMC7NfvgKIRlzK+Q6ikhZL58o8KpDW9WvsG35R3x172v8CIzBKjCBOYpbKojX1Qv
	i4plv94w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJE-00000000QVJ-0zDk;
	Mon, 06 Oct 2025 16:43:36 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJ9-00000000QRR-1In1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 16:43:32 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-634b774f135so9231059a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 09:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769009; x=1760373809; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRXbXMcdQaybVyL41swV860lNNbaXOzw6nia42KxTE0=;
        b=s0NZYq/NbgC8+HpP1HrTlwKogzysxW+mE8e1TCcIrxj5o3mRtwNmJvXWvjLWalwO9f
         uKpJ5suX7B4enh36jjuntcOluVS4q46qWrQn7H0KYc4SbFB1h2RylUpA/8eEcnMJ9d5D
         csqppxgILwvX2tkdzd3nnBDlIxmI+4RhCZV/5XWRtXUyJm+mtZ4YtMJ5DD83MI1lsd9g
         V9FNfmr5FDCoiZqcF++kL2VJqpQMdfnmDa+OGKIWWeHFQHgekfaJXmiQAuxAgfP0RuT0
         Ss44WeVdh0uIFWkFZJXS7BDD73WjPFObQL5Dqnzoynl5st2UfuQjt51Dz546axaMy1R7
         8r8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769009; x=1760373809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRXbXMcdQaybVyL41swV860lNNbaXOzw6nia42KxTE0=;
        b=X5msuM7HguWV2jYskjCfZ6A5JtGkWWhFRs4MqWKaG7C/kXthseuqtfRab7M66XS6uL
         IbZI05PzOf3CkQduWe7vGNhZd1sFNwe8EGlIECt3MdslD5YwUY6u4RQSwkx2vaacwy+6
         0LLaTpoFNVWQwR8sreSFMFsob+MPhc1Kbi9/Pi6WL3UJoY/3RBm6EMx+zNyWqH92lhZi
         Rh0oj+mYmMyQC3qLG00IqD9tJCGzgc+exi2ViGnnWXVJnpaUOJkYIMsgAPvWf3tdSpfK
         QpukF20t2xpeUV9GC1ro84MXWoVUrxWpc9J8oVoimxDJ/0TF7mpbSTCfajv5TIauojRh
         czLA==
X-Forwarded-Encrypted: i=1; AJvYcCU/OdQyMuMfVYC5fsj+uARtFGoMr3WJkyQQZNaK/EKGoMVun/zhcUXjhto5aqR/5bGk8We5rAbhGmBzhDEyZyzG@lists.infradead.org
X-Gm-Message-State: AOJu0YzkcQMOJkvY/7jpvMNeQ4YSZ6A4WQiwwRdVJzNMUk9dtx9PD1zb
	2KSvtHR26/6WK0sj2935kClQ3J+ZYKl0kmx77SFC7k7J2iQWkW7ytrGGJTyiMonGdH4tcJa4Tki
	acMGUwlw=
X-Gm-Gg: ASbGnctIEiXwy0F3jKg+YEloyVB9WTb3G3rnNSQDdlO8iX1pWXPbYLcC8REFfKCtHcd
	jKBOkkqoyNNvxC1iMh84TPfvvNv9aGnT5uz7bmPDqTHNX0410GNiudvzRrvvzow4Qii+kNz+OR/
	DftpB+ZZggFWe5K42AFwZRjksFunMHiVe3lsf20m5uZ/SJKtvbPYpi77jOHGoAardynU+sZ3jf7
	Z9Y2VCxI9+1J3apwyhMNFw1M/KKgiV8eTHIM4ScYbnX2GJ0tSSis9kH3lg0+V5QgQJraK7l+Vby
	BDryeca/DWSYjtP7Kx8rZvjb1wUNcGPkCNZkaWSeV+nTWV6hS6ULODdCqNIRIP4wRiRF6nUoXEW
	JA2eKRtAURc750KmKpChdIUXY/Q8AAIv3PBg4rJnmy2OVlRWjjHeWmJfWF0MZ8kQcKNxTufvtM2
	q+OqKiZeQoRVNlxfaDTC7Ea7J3wCKgFdXRPf36xV7Zul4qvjjkdAI=
X-Google-Smtp-Source: AGHT+IFevyytLGxXOVyUvp2iRJsBS5AIBa1K8SbZl4T99bvaj+wJPujm9cyg6wpDoYz18ydBH9OBMQ==
X-Received: by 2002:a17:906:c108:b0:b45:66f6:6a17 with SMTP id a640c23a62f3a-b49c429cf5emr1502398466b.45.1759769009323;
        Mon, 06 Oct 2025 09:43:29 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:28 +0100
Subject: [PATCH 02/10] dt-bindings: soc: samsung: exynos-pmu: allow power
 domains as child on g101
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-2-f0cb0c01ea7b@linaro.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_094331_374153_167EC3A8 
X-CRM114-Status: GOOD (  15.55  )
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

The power domains are a property of / implemented in the PMU. As such,
they should be modelled as child nodes of the PMU.

Update the example while at it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: Ideally, the newly added properties (ranges, etc.) should only be
'required' if "^power-domain@[0-9a-f]+$" exists as a patternProperty,
as they're needed only in that case. As-is, this patch now causes
warnings for existing DTs as they don't specify the new properties (and
they shouldn't need to). Only if DTs are updated to include
power-domains, such an update should also add the new properties.

I've not been able to come up with the correct schema syntax to achieve
that. dependencies, dependentRequired, and dependentSchemas don't seem
to support patterns. Similarly,
  - if:
      required:
        - ...
    then:
      required:
        - ...

doesn't allow patterns in the 'if' block (or I didn't get the syntax
right).
---
 .../bindings/soc/samsung/exynos-pmu.yaml           | 53 +++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index f0fb24156da9b8980dcfd5339ae75f12a71cf6d6..c2db1cbb969a9a6fea5208dc2990f2144fa480e6 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -93,6 +93,14 @@ properties:
     minItems: 1
     maxItems: 32
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
   dp-phy:
     $ref: /schemas/phy/samsung,dp-video-phy.yaml
     unevaluatedProperties: false
@@ -138,7 +146,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
   - if:
@@ -201,10 +209,27 @@ allOf:
             enum:
               - google,gs101-pmu
     then:
+      patternProperties:
+        "^power-domain@[0-9a-f]+$":
+          type: object
+          description: Child node describing one power domain within the PMU
+
+          additionalProperties: true
+
+          properties:
+            compatible:
+              const: google,gs101-pd
+
       required:
+        - '#address-cells'
+        - '#size-cells'
+        - ranges
         - google,pmu-intr-gen-syscon
     else:
       properties:
+        '#address-cells': false
+        '#size-cells': false
+        ranges: false
         google,pmu-intr-gen-syscon: false
 
 examples:
@@ -231,3 +256,29 @@ examples:
             #phy-cells = <1>;
         };
     };
+
+  - |
+    system-controller@17460000 {
+        compatible = "google,gs101-pmu", "syscon";
+        reg = <0x17460000 0x10000>;
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
+
+        pd_g3d: power-domain@1e00 {
+            compatible = "google,gs101-pd";
+            reg = <0x1e00 0x80>;
+            #power-domain-cells = <0>;
+            label = "g3d";
+        };
+
+        power-domain@2000 {
+            compatible = "google,gs101-pd";
+            reg = <0x2000 0x80>;
+            #power-domain-cells = <0>;
+            power-domains = <&pd_g3d>;
+            label = "embedded_g3d";
+        };
+    };

-- 
2.51.0.618.g983fd99d29-goog


