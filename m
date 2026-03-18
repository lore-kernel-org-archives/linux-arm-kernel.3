Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFFE103E19B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P48rUo71pAt5qHURMk+v6z4m8HRw94KlYaJLWRXtfGc=; b=UhWnU1xSX6r6OPgWXX5pTvzSWA
	lYkOl0xdnNULrC3On1Mu2xw0l4R68Fq2opId2tHTs+OLL9zzG4njFmfvy3RWrpsRj8AoNa184bmlH
	BOHW70iNhd+7MMOIJuhHLVhfZ6QHkh+jy/NFSZKsSWqhnIZXjNuvmeJd0+//IFUniiPWYL38ZlGk3
	yemPJMCuh7uWBswNGMKpxrHS2zW9Gb/lKxyldnzoKhx9ZzDJyF6jcH7Dz3IvOrKSKidjtp+Wdh3v2
	yW4rFDvTMeG63gEWgoMwZExjB4X+Q9H7lujSrVoQjD8dkCJtXSfeTFk/PrHnpkN8/R434LyvX7Bb7
	sgzV8GrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sob-00000008hdG-3sjF;
	Wed, 18 Mar 2026 15:28:09 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soU-00000008hXO-0jeB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:28:03 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b886fc047d5so150870466b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847680; x=1774452480; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P48rUo71pAt5qHURMk+v6z4m8HRw94KlYaJLWRXtfGc=;
        b=sQL5VPOijAIGPKB9x07ySCx+AOpLWL78clK9FQj98jQ4lb9PT5koOQIjOJ9ciikj5E
         q22nWKLOYAaVG6bWy55iXBrzDerhEGTvdyuCkl6n7GKQg/uZYONfCHkJ+RACUzLTup1u
         C9itKILjP5g/IekxYqpX/jJjOu357cE2EEN1cK/C8YPzFb173kNkrrxlkHRkEEqCCgLL
         QebgLo5sHyC2QZfEwN3o6VNw5XrtSB//0uxjDoRlkjnUc6dsF/6DjShZaKORrJmsh/6R
         NGqohe2EKBA/10T9KrO/SIbGAuurZm6dIjZHl9JInMidB9YR6KpG4s+27TvIMYJYkhYa
         MDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847680; x=1774452480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P48rUo71pAt5qHURMk+v6z4m8HRw94KlYaJLWRXtfGc=;
        b=Uxzotwihpeh3YY9cs9UPSG7hArB3VPPheKeA6aCI0a+Mp8be7sW1u7kqjtBeE909uw
         ms34tAfmXtUGrXHumEk1eYAeUVkvOIjNdJtCS+XscUoXJ7AQwFcV42OE2E+inAZ6d0lH
         MP7ZVdxWbaZHqB0fB/2kMDlOKduaHajDfCWNf9ehOmkAL0mIM4233IS+bFAZLulFXZmx
         dJFqPbdHOpzU9y5j4JHmr4QH6NbxKr8r93Qp9WVyYLeOUc+flke05nrakDcgmo3gziuh
         T9XQRzlKYDPdfKM22MAT/NFvL/B19QkS/Zp++RYxS29/R8RXiXYFJW2czA/GJGmc3yna
         zU2g==
X-Forwarded-Encrypted: i=1; AJvYcCUOesxyRy4oYnMMTqgArHaofuDokL+UxJb3wh3T2tqi8Bu4jZ+tJl9yLE30y/5iF/UShIbfcq5IztjqA6YN1kmk@lists.infradead.org
X-Gm-Message-State: AOJu0YyWOcHtbGGUpOG5qAM9aHJJUuisI3soEo3adUS9EQhDUi9Ob7GG
	sN+Cq2rEVREdyl/uDxevH+BGg9Sx/kva4k5r7qCqljiYapA+bBiRUxs705D84PTqT10=
X-Gm-Gg: ATEYQzxYM7YcVk3M0ntXneM/K06nZPOZdKPWmyo/7M3K7B7Sr7lrKBvJE/d6wRljvor
	MY9zs2LW3S+1QwB/YlAEb/zx32BT8UzjN8DZKJxmzwf7UNi+mKLVhDJqo81Lr2hcz/ve9T8mLz9
	JpVtlnS9bVbFwpz6LY87EQkZrL/M1FNTa0FgEGjtjz2rJNxWSoodevo4aM+BqBW6lB/cMISjduO
	78cy1ZLR5oBFZ04jDT+bbBSKQX9p/6e0SpnVDM8Vbd6UwXBt9Ez6NxwtsImoe1ahqZ4daIWCaY8
	GdI9aEpmfiDT956m8k0CBATIFnz87acox2C0LxLb9xUUnS1UO5TGqKhblOwwWQ0XKfSQnQYteA4
	iFDCz5Ckv1oh6xC7B7QImC3hd0wB2cLD7XDCUun0Dy1/huia+Mq5NoTrSlXNh5b7METhv6MK258
	biZCMPrHHoNT7xwoquPyo7hxtCvGO1e08FPOXIkHoLXyh45PHz7qZxYdbHfJii9jlfBMIu20hP3
	VTTIaXKRiLEovI=
X-Received: by 2002:a17:907:3f9d:b0:b87:b0ba:5d2d with SMTP id a640c23a62f3a-b97f4b86e27mr250568466b.57.1773847679718;
        Wed, 18 Mar 2026 08:27:59 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:27:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:47 +0000
Subject: [PATCH v8 02/10] dt-bindings: power: samsung: add google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-2-241523460b10@linaro.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
In-Reply-To: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_082802_257444_C8263FD3 
X-CRM114-Status: GOOD (  13.40  )
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

Add support for the Google gs101 version of the Exynos power domains. A
new compatible is needed because register fields have changed and
because power domain operations involve interfacing with the TrustZone
protection control on newer Exynos SoCs.

Power domains can also have a power supply linked to them, so add
optional support for that, too. It is believed that all (existing)
platforms could benefit from this, hence it's not being limited to
gs101-pd.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v5:
- add domain-supply and update commit message

v4:
- add new vendor property samsung,dtzpc
- drop previous tags due to that
---
 .../devicetree/bindings/power/pd-samsung.yaml      | 33 ++++++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index 9c2c51133457..3f1a2dc17862 100644
--- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
+++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -13,12 +13,10 @@ description: |+
   Exynos processors include support for multiple power domains which are used
   to gate power to one or more peripherals on the processor.
 
-allOf:
-  - $ref: power-domain.yaml#
-
 properties:
   compatible:
     enum:
+      - google,gs101-pd
       - samsung,exynos4210-pd
       - samsung,exynos5433-pd
 
@@ -33,6 +31,9 @@ properties:
     deprecated: true
     maxItems: 1
 
+  domain-supply:
+    description: domain regulator supply.
+
   label:
     description:
       Human readable string with domain name. Will be visible in userspace
@@ -44,11 +45,28 @@ properties:
   power-domains:
     maxItems: 1
 
+  samsung,dtzpc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Distributed TrustZone Protection Control (DTZPC) node.
+
 required:
   - compatible
   - "#power-domain-cells"
   - reg
 
+allOf:
+  - $ref: power-domain.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: google,gs101-pd
+    then:
+      properties:
+        samsung,dtzpc: false
+
 unevaluatedProperties: false
 
 examples:
@@ -66,3 +84,12 @@ examples:
         #power-domain-cells = <0>;
         label = "MFC";
     };
+
+    power-domain@2080 {
+        compatible = "google,gs101-pd";
+        reg = <0x2080 0x80>;
+        #power-domain-cells = <0>;
+        label = "hsi0";
+        domain-supply = <&ldo7m>;
+        samsung,dtzpc = <&dtzpc_hsi0>;
+    };

-- 
2.53.0.851.ga537e3e6e9-goog


