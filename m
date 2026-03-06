Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F41F01827
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsgk7ZObqyZr/3jbiTlB5XfU/jafWS+xFJNQ3TVojOs=; b=H9/AmzsfT0A3+RLQwR0UA5A9HU
	HWWS5W2XJJM99vVQfyJtZnB0o6uhx9NMrgaCYTyw2i81XhQ6O7DvMp8NCII8v4dImGL8j6pCQarIQ
	+fkYM7KLJeCD8wn4aCOUnegR/9MqME1N7VcpTQVpUpRdfNWtZ3AB77oBNZySnyxCRbQz9EdIgmbMK
	aaT0qsswL1tOx6lVpWcN8P/EIOIYXnpUjGwwJslSrpzQbDcxtPKMKaPCVp28gijsqDgSlH7odyPFL
	e8qmrCqXeBZc5Amc/J25q0cYMDLRhUq6YvVnovl2IIXkSByULQNH0EWEv+kLe4eBytsEuqQtz6qxi
	LQxdBK6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRY-00000003SbZ-29zI;
	Fri, 06 Mar 2026 10:30:04 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRT-00000003SVD-0Wbj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:30:00 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b8fbb24a9a9so1481434066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792997; x=1773397797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsgk7ZObqyZr/3jbiTlB5XfU/jafWS+xFJNQ3TVojOs=;
        b=xT3OhBygumsUfEK6Jc4XPHQVUDqwnytaBQsophGszD/felTFz5xJi/No4txdgROnF2
         8HRXdLo0Rodn102LfpPthnxAXdvTXkm/2ySpVVJyIS1QontJ6+xIsJIhdHhq6BnBBQty
         RZ9Yn7bo1LeCSdF8EzwozPtzdIvboh3ivCpSOWX6KU8ZV6aYsUOvrxIoREKFN/kvb+1/
         ovGIjyOEyD/zXMcI7EtsT64/rvav481qXWicru6318PqKAKWbllu83lS73LD4WVKuY8x
         /AP642wCNxt/5IEoklJl/YPXORBAb3XyJw1FgHmgfencEkfeTAgNRtHsIixpQ1Vd/Fiy
         p5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792997; x=1773397797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bsgk7ZObqyZr/3jbiTlB5XfU/jafWS+xFJNQ3TVojOs=;
        b=LzeoAwbd2FQmE7wvSZZ5HNa+KykN3t+lATApwNMvu/VdrhOZJzykUhZzgccgd/iHTT
         G6H5rgn8SWRHbJY/dtnk68EaiNq4W15VukhCRHsufJudYQfHae2dsc2ChZtEQpk9sizf
         6yGg/YfDhb5jt393z7Kn3BtxF9XUQ3sP/IU2YvHB4KrO3kxH5E5HFLHSSIhxWBh4Q5uP
         3J8AMy9VDmlO85sjgbSYFsyxVyv0v+blBtDsSR4anaNJ3OBwClq4ofWA1BrsekssTQGP
         cJpdRuDyn652GJuHcwhk5euyb+4U7/EXPMjR4Gq8l7Ab2JHS7iIcgxBflcY0MwC7u7R9
         BXsg==
X-Forwarded-Encrypted: i=1; AJvYcCV9y/RpeqMM2kh/wrYrfJeNK6TzWDBNHXpbJvQDAgWy05mMl3P/IuWbz96GUJddnRrXZWrqaCAoMQoyD03NS9QF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywov7rHbx7FuEmMbpbhUTJHX6Oq3OLkGGAnZn3rrW4CX3z8KuHn
	j6Od9I0G1UEsmu0wvFU0xsbfJNZ+uSeOTFpxzUcUscNDnUlXSl/MZqEnEo8poPgghAo=
X-Gm-Gg: ATEYQzwvWGtKVBb2JVbUKiqDXZb7YsJrBEy5zQCR0ZyhhNUkII6vq2NE2qdQZgUJ02O
	LJCIOfesT2azQM4uclzAx82SdgdO6k8R4ZGwCxwSRjjmISvX6y9NjEAHO0sAL7en8bY08249BgV
	YI5dYJHAmNLgkUR+65sIRHbKHuURqJCMhZUXJRpcoOY7mmQ97l3vvIlIj4hR85ItBBLiMZIbNNd
	G8a8IBpz/8SNyq4NqKnazH2cGVdi223JvsnLX8BwxyNMKe6CvsIxtdCLhphIf103gk0trt1e1rI
	21ot7SH0i1oY36i9iPzXlf6B/DIsLpUrb4B4ozpN+Ph35PsBIB/1WCh8/IV/uHgylByOiPk+szr
	dgA6AfZKZyh+PZbnIWLC7Cby93yIIDnOdMU63sGyV1cCyP0RHd7hcLdQ9XXdbo4doG7sVHOQ162
	tPkZ+XnaA1EHZyP8xBu2XuDei36YNuYu5VV80DImNXJF5tB2tyRzMNqoUZwmYM2XOL8hhU9UCvG
	5oE9qwulsI5sSusnzJo49cJqA==
X-Received: by 2002:a17:907:8690:b0:b8f:c684:db28 with SMTP id a640c23a62f3a-b942d06f624mr92068866b.12.1772792997027;
        Fri, 06 Mar 2026 02:29:57 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:29:55 +0000
Subject: [PATCH v7 04/10] dt-bindings: soc: google: gs101-pmu: allow power
 domains as children
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-4-03f7c7965ba5@linaro.org>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
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
X-CRM114-CacheID: sfid-20260306_022959_203236_8AACE6D3 
X-CRM114-Status: GOOD (  12.22  )
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

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v7:
- really be consistent with quoting (Krzysztof)
- drop invalid tested-by tag (Krzysztof)

v4:
- consistent quoting using " (Krzysztof)
- add samsung,dtzpc to example

Note:
Because the properties added are 'required', this commit breaks DT
validation of the existing DT for Pixel 6, but a) that's simply because
the DT is incomplete and b) a DT update will be posted once the binding
is accepted.
It is not possible to write the binding such that it supports old
(incomplete) DTs in addition to the full version, but as per above
it's not required to keep supporting old DTs.
---
 .../bindings/soc/google/google,gs101-pmu.yaml      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
index a06bd8ec3c20..dfe6f87e5949 100644
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
+  - "#address-cells"
+  - "#size-cells"
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
2.53.0.473.g4a7958ca14-goog


