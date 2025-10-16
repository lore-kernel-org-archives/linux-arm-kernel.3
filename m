Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88182CCD1A1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAQW91aNDUliYu6xIPIKkGd7wbQwulcJzXF5XdkzCOM=; b=NFPkrI9EZ3Aq5Ikabue+t2JI07
	OS5/0udi8YuyTKqHuxPuhvmIrWatkd3nT5DXPfU7AM1ujLxNBJ/e2N3GuMVbZdtJmjPSRXnQNYHW3
	Cj6Ohk5L4ov1MTMc3IFHiqY18tjzbfLFbb70RgWca7oPLQBpVRxexIqcMn+kM7GMi7HxnHcD/NfFu
	DLf7lZtxNL7vQKvetpMtMaps3vEiDq/2pOxHa6srSdoH3RxsPFk9pwrcisnl4y+yWUZ0dIJDwqUk7
	IyOhoL474BafZhbJUyJ3uvgWO5qr2ESF5S66qarTgVrO3ug2Vn5R5lvaF8YZvQNdJ7+Ayv3HVNx0b
	IR+67Xeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNZ-00000005Ihy-2GoZ;
	Thu, 16 Oct 2025 15:59:01 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNO-00000005IWQ-3qpi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:58:54 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b3d80891c6cso379112066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630329; x=1761235129; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAQW91aNDUliYu6xIPIKkGd7wbQwulcJzXF5XdkzCOM=;
        b=QhBZEQ+5R5amwevhSH97fl27mcloTifBJSTMDcYld5exw/R6lZTYY3LvsHKD+JI0S8
         QTAoLkLM+IHHJneow0dFIvUTeVImTuDq6PP4TLaIau3aXUjSDkmiB00dZCWbhvIjyxeJ
         9ENrsDiT5K+MqBAiDSIOe//agWyumanfE5UHJO1Ef54PmNiX0lcUhOZtb6iOt2NgeO5y
         mumgC80nstc9S5SlC/iV1nwVhqsh6Olnsd8jTwpxhNj6vLtiMtIhUnG1cQnzmZY8lJP6
         Wv9P/SYDmCCj7ehh+tQI86/NF0bZZ5JoS0oO8poVVstVYmMMNC9xf8MZEXX0MuKdCreg
         VeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630329; x=1761235129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAQW91aNDUliYu6xIPIKkGd7wbQwulcJzXF5XdkzCOM=;
        b=WYju5xM3NEJZikTYulzcD2EnyOb2rSetP7BKNAL0R9QUvv3HAuRJPGTwcT4tqUc800
         AwAGwVqU/bibvMkItOWM7EfG4bd4HZDGORxAhh8nmkFmcW8UKfsemWyZv5lFC4yw+wgA
         0zsQunnbbOGivBqM95CEdvAq/sTAIoLcKQHS2JQucP7HZG39CmQwNvSLFYn07kA9zPN2
         5lNjVctiRxeptG/VEnWDP6cDYumK7MNzh/3Ydb7buuydnwYzf3OO88AHgN7WcA21f2Ht
         qhSeGl7Hlg5QzZffRzLA32R4m8r2DAKEUAwb7xPnTV/k7xc9JFNdZdRTEDnjHLoAsV7d
         mlkA==
X-Forwarded-Encrypted: i=1; AJvYcCU5LdBhIVpE6VN80NnbKE+cGdJeXE1RtKZ/WO7l88hmkLw38SUAW6dt6GFYLSyYh56Mqke4o7f8JmE1LMz/Vk9f@lists.infradead.org
X-Gm-Message-State: AOJu0YwU8kpIUCbWrR5XAs0Lnyz2dJSIF05oaAEeNknOUuv7mQV4lei/
	F+Re4Ym6YJO1fcF3ugT0ClrB9z7j2E71DWlSow5xEgp4WfZ4DqAn9tjoU7eCsJjNYVQ=
X-Gm-Gg: ASbGnctLqxESiE7vRAu/pftYWpG0KcYrpJFHs0YRKLAzj0LYFLFgztmH1fXUC8k6PxY
	LbPbzJrmtvp2HzlG4J1YBKQgwDggIjVzI9OKljltCO55TKJsHWiJy2zUrNHKnnb8FHIadrVnyTi
	6m1i8kBVcFWqZChcKDjvKz1vE84BatHFq1josxLwtzKYfzUay4rm+Xdky1gc6XXHyDzT95gswGD
	giwgAViobVa7kfPmaBLRzs0mOIiMfBGu/Z9dq2+qSpNtUHkHRpKAjpk0214gy7+PsWNsHYKNA7X
	kazWEUfWmuKkFHdqcZB9JeqXgKhcSvbzBv7946LTWjx6+tvzS2dEosTSKV5boMPunNsRUOhBheI
	ksmzOkk3t2YEPAwGQ6bOd4lJx31vcmkuG/aUlRHEBa6OgHIke/oJHucCwdyMai/m9pG+AA5p3xZ
	fn9g5dGGrR/+3fKnrgtticbvzvZJ+68iYFHJa+WntEvKOJnj85C8cVAEanUvMFqUuEx+xMnXU=
X-Google-Smtp-Source: AGHT+IFwFoVlzrd3EzfRgwjFNULDxybArmFxvRw3PQFLU4BEOlEa5CBeY9fanhhp1MvTHV/cP8fhDg==
X-Received: by 2002:a17:907:3992:b0:b40:c49b:709 with SMTP id a640c23a62f3a-b605249d84dmr571454166b.8.1760630324759;
        Thu, 16 Oct 2025 08:58:44 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:36 +0100
Subject: [PATCH v3 03/10] dt-bindings: soc: samsung: gs101-pmu: allow power
 domains as children
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-3-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_085851_024098_B6E4FDC5 
X-CRM114-Status: GOOD (  14.42  )
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
 .../bindings/soc/google/google,gs101-pmu.yaml      | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
index f7119e7a39a3fe0a0a23d1faa251d356f83ba501..a24390f6d2a54afe1aa84935e03f719a62f4fc8e 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
@@ -26,6 +26,14 @@ properties:
   reg:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
   reboot-mode:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml
     type: object
@@ -49,9 +57,23 @@ properties:
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
@@ -61,6 +83,24 @@ examples:
     system-controller@17460000 {
         compatible = "google,gs101-pmu", "syscon";
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
2.51.0.788.g6d19910ace-goog


