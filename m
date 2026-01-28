Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF38ED3F093
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYVOKvbh+cV5QpKAWjih0XGIXXiGAQB69mHgAD7pq/8=; b=KITPO+bgXTaAnsjafh0nEljhud
	FZpdQ/P8YhgAIOHepx3YzbC4dV88RLyT3ZuUtKbK+A4Gl7pERFnOUs4XzrtFHjoLrhXPcpgJxSeRw
	btI/7mVd+3IhT/CWpLJGLKJW5Y5wmdYdVUDA6jdJEZ9+oHRuSlP9vyqtgEb7OvIFBKTKBcensMP3u
	nb3AZRik94ITHgW5uTKveYF8Un2vywiDxp8pLOTxFqtgPQzXbAj6qGO1SedJp2yoj2X6juAy2jC8E
	Py7m0YBPZRPmWmdB+uNqJl1/MDNCSn/VKLQxpDfyXn7hgzu/ZBAjtHKiO5L4WZ+YOGn7kvj+wkB0i
	Nx8x9lXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88P-0000000GLyd-01YL;
	Wed, 28 Jan 2026 16:11:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88D-0000000GLty-3wzX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 16:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CYVOKvbh+cV5QpKAWjih0XGIXXiGAQB69mHgAD7pq/8=; b=F6ni25G4zBEkAIqvxyA2mtEljN
	24E9iEBoP4P9CED+Mmp/W1MuhSc8PEPxgPcbq+gTufwmsoXGA0LaN8c///huvXNFHfmxCmIZ/7d9u
	SmxEQ03MnmSZ2QhZci6J78Nf9NZlScrbZgXTejV6uvShwJap3AgdgQjOJmZ/J2U9d57VUw7I+XIWb
	gl3rSu3zgR3gZU4/JxApefsl8GBklFVDkQ+LQKatwFjGjleDOiS2xlrZrbS0NZ23Cdhmw7Sakdemk
	f8WjrtEFiskB6xHvoF8qXH8x54CHJ/c7UTdbS5EuYW1+fJiTPKAGtgKkEo26Sv/hJRwMQdBVZfQdS
	3+7v0YMg==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88A-00000008uTR-2571
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:11:00 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b8838339fc6so3487666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616655; x=1770221455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYVOKvbh+cV5QpKAWjih0XGIXXiGAQB69mHgAD7pq/8=;
        b=z2fgZadyWJhBKmFFOSfunmCBc2fkGuExfXjg59ALACwgoIOZbLcSLSQFw4sc+wcC6l
         rRuDzGQpSilF82BVofvcdhUeS6QZ9YxjT2EgikOxJx1l/4W2vmuU2vZmYc6kLPmSeRQe
         +oUaajiw8C1QQvQA0Js8KN5Sikz6PLDECxYyxZ7q/KfADJ4roPyQyK/N4rZfnJTxkJuO
         MdKYNHDCbVglQHSTlO5KuJV5DrYRmccU7G40HlUXhxpVO6oUuHT9ds/HRqYlVJpS3mQ/
         jAcHn1ux4/QTmHKLJoJPjDVTarUO6EStXchaFjBptVQDeq8jq5VVcO/fGUUnHI6v7g3H
         /laQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616655; x=1770221455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CYVOKvbh+cV5QpKAWjih0XGIXXiGAQB69mHgAD7pq/8=;
        b=pgbEt7GzVcAR3f7WSmQjMcq++AVynOgjOK88aa/I8rqm8PPv6iCKYGVLkcQsCroWcm
         Dh7s9e8JrC+chifHfpw45CY+Q9Sl4OBBmXYnDO4yIDIP1ADiQQmeE7EGuVK8SzXBFawT
         0u2G0RsjbM4sSgLG95Sqt1f6dtBzEyJCXEanxbaxJrKNsBOGegZ1tgpL5Nx6mHIQdF1K
         A7Fb3OVb/NXvL0pfzr3G8E/v7CCGb8QE91vMRk2WfO5UdF7MdL37iFqWMKh1hFQVJliH
         BwtAU9NO/RV4VWrBTWyJAisk78MvKKHdQLBuCqzXbOezAT7/f+r5GxmrqcCZnl6ckS3D
         dUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO4IW4L6LmpxyGo0V2jEoHeJ62zCaPNJJiALr3XD7GnjvVy5rV8uv3uwMY+txpuU8oX3mYNtMKR9GAqEoxL56N@lists.infradead.org
X-Gm-Message-State: AOJu0YxH7otDx7XSV7m9Zo7HEU634T4+7948bNBG9h5Dzv+z+kiZN2FX
	fUeWf85vva46OTdYvHptTawcFFu+0M68n1ytR/x62731InNQANmh0Ho5lgFt5osdCys=
X-Gm-Gg: AZuq6aI7x8t9xp1J7X4HIshkKsLcsNgeSYnaThYDzd5GJgblnDHFmPq/6LAgY1mQV4D
	BR8FamI3oH9aCdA4qcbrLS8VL8xaB784aHn9NMcfJDEhlqWvNHHCd0PJJugIJrF1kKEcT87XxLQ
	XS1y6om61muG1vgzA9WDwnCcIewWZ6iXAmtsDdWEhWfHgok7yN2e1hiCE4sZJ1p/NOO2nZNvXvJ
	HC2t5YGSFYMDh2u6h9xl4tCWWzYlZsSgr6cdiBIj7pIvl05IBiorX6tOEjdKDC47xHoF33huEZG
	sht7mTVNHyov65SvvLm3rJV9YY/YVPtVrEZlJVmBE8EbFWrPPH36y6egZohlweOdljn0jRlMhpA
	TvaVmr7BJflJp1lKIt5iy3d5XOSbpKRVm++FwU8/nQ6PBctCgpQCkhusPSGhpM/om3OSyXOlV69
	nT5jGXS5ZAiUcZD1WczGdE5y6pwab0WANFeh1rm8r6QGTUreaeGAVxx3SRBfNjn2hyE0T1A9qdo
	pMOQ5kwAbL3jB7f
X-Received: by 2002:a17:907:3f21:b0:b88:20c0:d37f with SMTP id a640c23a62f3a-b8dac9aacf6mr387798666b.9.1769616655313;
        Wed, 28 Jan 2026 08:10:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:53 +0000
Subject: [PATCH v4 04/10] dt-bindings: soc: google: gs101-pmu: allow power
 domains as children
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-4-cbe7bd5a4060@linaro.org>
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
In-Reply-To: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_161058_724383_532FBC8D 
X-CRM114-Status: GOOD (  14.21  )
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

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v4:
- consistent quoting using " (Krzysztof)
- add samsung,dtzpc to example

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

Rob said in
https://lore.kernel.org/all/20251010141357.GA219719-robh@kernel.org/
that this is a known limitation in json-schema.
---
 .../bindings/soc/google/google,gs101-pmu.yaml      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
index a06bd8ec3c20faf0b364d3d3ef1763502c2b09cf..c1ee9575092a3ab17873d228a88468addb62d838 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
@@ -16,6 +16,14 @@ properties:
   reg:
     maxItems: 1
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
   reboot-mode:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml
     type: object
@@ -39,9 +47,23 @@ properties:
     description:
       Phandle to PMU interrupt generation interface.
 
+patternProperties:
+  "^power-domain@[0-9a-f]+$":
+    type: object
+    description: Child node describing one power domain within the PMU
+
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: google,gs101-pd
+
 required:
   - compatible
   - reg
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
   - google,pmu-intr-gen-syscon
 
 additionalProperties: false
@@ -51,6 +73,25 @@ examples:
     system-controller@17460000 {
         compatible = "google,gs101-pmu";
         reg = <0x17460000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
 
         google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
+
+        pd_g3d: power-domain@1e00 {
+            compatible = "google,gs101-pd";
+            reg = <0x1e00 0x80>;
+            #power-domain-cells = <0>;
+            label = "g3d";
+            samsung,dtzpc = <&pd_g3d>;
+        };
+
+        power-domain@2000 {
+            compatible = "google,gs101-pd";
+            reg = <0x2000 0x80>;
+            #power-domain-cells = <0>;
+            power-domains = <&pd_g3d>;
+            label = "embedded_g3d";
+        };
     };

-- 
2.52.0.457.g6b5491de43-goog


