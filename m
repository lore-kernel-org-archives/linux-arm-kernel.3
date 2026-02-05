Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB57ECD9AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvcy5crOR/n7O0iVn83ybwQmabvZYx05b4AZ55A+3Wo=; b=cJ6MRBkOX6mHfCPOwxZHTVMczv
	rKUCYHVw/jISNg/BN4ay+t219rBmb6DIymZJUhYV9K3MIge/dPEuMX+8bvQTZe55quxCVWBhAjC1Y
	lghJQZYHOo5KbHuho85+JiNnRLUmaw0tdAtApQIr1qvt/ChEIBt9ok4b+dfPla9FpvOPTIRlA+9sL
	N1SnHyd7oLAqnjGCzKQhZliccGPGH7RI8nDGPTT0p2OQ6rj9nUC/wHiev4+qvKa0wSLfaDD4Pl25E
	IoExjZ3CyaKVfdkxs0LknZHjUSTzy4fKk/W2A7q5bFBEHlzEI15/RHYI0kkeOkifr4kJzE9SzK6cD
	HhblR/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77Z-0000000AWuz-22n7;
	Thu, 05 Feb 2026 21:42:41 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77U-0000000AWqL-0Di1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 21:42:38 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-b8d7f22d405so213306866b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 13:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327754; x=1770932554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvcy5crOR/n7O0iVn83ybwQmabvZYx05b4AZ55A+3Wo=;
        b=b2utfeSsfy11FiM/EMpVeIS/df2FvAClV9keC6j+K51/FOj5OaX7o2n3qb7LkMngm2
         8E0Hx/1FFPt0Vcm8maAv3P5Nqle/7edl7tLmwQDi//tSeYEVx42z7w/jR2F3SQBpaKaS
         9SW4xTopt/bGVBmqeZoINl2O43VMJsOuB4l3Trr0b1tASopVYtpebpnQQ5sUye+oB8SI
         rTRwuZ60RJDYpNcaoGzcxZLZ3PCR7Kigw9aGDEgQ7Y4PIWVfWc9of0Mv0YS/boHi2ltC
         S8vtbynS1M79hGbmEtt2/BHMwwB6bVOGIunIaUS8N9KO0e2mddY9t+3aDnaPzrBfBqkr
         /AbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327754; x=1770932554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nvcy5crOR/n7O0iVn83ybwQmabvZYx05b4AZ55A+3Wo=;
        b=W+tnMqpW2G5QEpUtL42bqkW68XDluKuE+YQ3XMNf44gZlg0YQ5TDxL1+sGdhJmYgo6
         RFEv12vn2exFLfDUV+DxMTNiEXMuekEYxXnXLzWvuNppMKSkcF5cxRzOF395MMNgBxw7
         iI0FzERpq2+WfQVBP1V3abevIywxmrL8ucU2wl/AFM269dbJAAx4zdNMCKAwyZxfhFf8
         NFRN+JLDZkkPZSEK8StVN9XxGD3eDFTlqG/OdEUxS1OVABVOnW47KQu1+r28juuqvLDz
         WAjqRz785fiWCYyzTevKyDqAfae5cfSHibBjK06Jr2IAOpgHFqGlCT/SFxe+A2Dhca2s
         xzgA==
X-Forwarded-Encrypted: i=1; AJvYcCXDzZgV9J1thjLV0Cc8QV2/lhakHhp5HLpmBP3wbip8hffS7oqpHLpU5ga4EXtXtAT3dSJ/RsY2c66dm4DQw86n@lists.infradead.org
X-Gm-Message-State: AOJu0YywI8Yk2DJCGeEqXG9iLTjDbvIF3gjBD4u9QSe6JtVVjEKlbWMi
	E9eZlAWDWsjKX80H4fBYlwA71AaNNFynB3kA4hQ13QiP0NxyYcHfDvamKkt23Uxp7Kk=
X-Gm-Gg: AZuq6aJzPHYIt1Ys1AV9y7D1taCJDnVB2JScbaLfJIdck6663KeQW1HhbYHhDLvYHXQ
	lJlVCnL7uA6iSNdi98D08zS64PwLEexh/ni1RYss+uj8kZltKhFjB1Le/boiA7Y8mHj65feb0DT
	7yLwgYlZ+zTEMXBxmSBbEY1AP1xVY74K/tfaUIFEkuhOTGZcakRxnNashPObd0DGKiTkr+jO1/A
	x4Vm7feoslk4P/nzJnNeMV02xz2FzC5dKIXKeWmKAbqI2Fh1i8xDchZbwXADr31/HepXbmTNDjV
	D2NFvhENJSG3+rJLry9HkUDyy51QKBJT3EmDrMSVHzLtnW2VLLHVA9lTEzNOsl0xDtMS8yQ2cpm
	xZuzq5sJiNulmUK9JYrjDXliHLoRaqMVPcAK0m78mGv0nqlK90+uqv4NpRFBYSfbtSrd/Ekwe+l
	7omCyjA+j6VNw66dFVkGjzKj13TUME3Ft1cuWdDF2zfTLcRsCjEi8p92JYW+jPo4qEELUaBh3jW
	IvWcw==
X-Received: by 2002:a17:907:d8d:b0:b88:6dd4:9ca0 with SMTP id a640c23a62f3a-b8edf49d98cmr21661166b.64.1770327754366;
        Thu, 05 Feb 2026 13:42:34 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:34 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:32 +0000
Subject: [PATCH v5 04/10] dt-bindings: soc: google: gs101-pmu: allow power
 domains as children
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-4-ede49cdb57a6@linaro.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
In-Reply-To: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
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
X-CRM114-CacheID: sfid-20260205_134236_116388_3B7B135B 
X-CRM114-Status: GOOD (  14.41  )
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
2.53.0.rc2.204.g2597b5adb4-goog


