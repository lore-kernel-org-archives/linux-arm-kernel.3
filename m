Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C64CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIgGfpMab5d5IHvagQ8PqT9KdQ+uz2nglD6fw13G62A=; b=a6qTGubJpbZoz/NROlZpxw71Dr
	sQGZlQKaCRit5E+yajgg/alkYse5rc7BPP1tNOeD/mXinJpTZERFEdK11QIF2cY23e/IXIs33wsA1
	BoIIguGOakM30nD9K2m0L8fgzisU0gNz6R3wQD6fhU1JnujFK0WGD/1eklY+7mKMVlkMHBuSbXYH5
	dP3YbcAjoQiAwCCwbGgDiynJffdl1VbI3ntyuIL2fOyiAwwGVYhYaqm4f8/k7ODkTo1lavOGG1q6w
	0HzqKy3USepCyHd7w9c5ZWvtwK1PRfroiMAR2JaVrpf12V9oNJpt1Ue+W38i5NgdPeEzpvMPXVIAe
	08ZVeDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sW1-00000006Txa-0kJu;
	Thu, 09 Oct 2025 15:25:13 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sVw-00000006Tre-1eoW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:25:09 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so166672066b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023507; x=1760628307; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIgGfpMab5d5IHvagQ8PqT9KdQ+uz2nglD6fw13G62A=;
        b=Zo93InC8Yrnz/gRNNoq00Wgf7JlF6hT3i/2+R5dXk8Ba69YqoYxhBDIcWieZd38+hP
         G5dO39j/GlhDPBKRmt+8peERtVocv2KpJbdrrn91Jcvv9e8qRCix1QcqypXWYtv8iyMZ
         oOPTgLq1G14ORwHryrO1gnRkdlcd3Rwxgdgl6mILwNUSDoC6/fZfe/K/j3zyU2RBEQ/Z
         WGR4xPI7k60QPAR4BOpc2HAkwgmKgYHOyNKgF3qxbsexI2a+uUGdcnoDqrYDC7r0DYwq
         WIKlyxuECJaUCHPVFQCB1S7FGxkIuDIv8cxPw2LZyU8C7+Ri1ktejjsXrtdzHl17FdI2
         DMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023507; x=1760628307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIgGfpMab5d5IHvagQ8PqT9KdQ+uz2nglD6fw13G62A=;
        b=KNfMwzdmka6GiI6nPdGMEhwbCWhiQzdLhPyY3FYvXTfp/2XlhzLK/zW1LlmyWjEW3f
         wwuOrQJUd95vEaJ9HTg4s2X4WE2BVyDPStlmw3TrKB0MV52Pl9/uRmk390seFC5gWuv8
         c2dxvJW8YlDwf9X5d1oZps//3hCZV0KrF36A3YYNZEk1W8vt4C2aMRYOqDxWFp1qiNZt
         6o8P3szLlcNQn+8nTtBqPbmybo12sjCzyRXKnRIkqFdKjQl/O/cH5FTvR6xpit7dvZ/A
         9DclrRYTkUJhGw9O2vey2FJgwhqTipKQ0WSdSpzn1aKzWf02QOxBYIDYrEHOse/d7Daf
         OGWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7hqtzeLsbXOlyBYsf5QO+jrBNSrX6MnmFL2qatauZodPbPTEHi3NbH1gsHjASTSwOV4cD11dUlzWIgsEM122J@lists.infradead.org
X-Gm-Message-State: AOJu0YxsWAs5t5H229QUBHADx6pimg07Gv7T5PptJ/ninfU6gdTDXBn4
	d9RadWbomrzCy0tFLZp3fG3KHeiQ9V1424F/zNpigWSC3CB5kNZbFd4d1Ay2xu92PpI=
X-Gm-Gg: ASbGncsVVpQe/L6g/BPSa6ZVxtXZ2Vcwb5IiPzQvjrQQ2iFGgzfgB4FChaafjvPbl4S
	IsGxrHHTbucz41srQF50KeqURLYRtyCrJ0WjeR4h0+hEeXRPZ+x5rnVp8/r9HMCXtWqdXv30l0M
	gxOiUr+4DbS1FNHKMh2mF4U1hbULt6os4abcfXASWiKJUIc1+05nn7D1sLVGpiUAkrzwgWCELZM
	Ws/etTAJ7th+GgCrovxKIOn7TOomNt2QcXHW9nwvAO2a0GWLwlBtPyEz6JZ7yJ8dta3MEOakhDe
	tMIk2jdQNSHafPhw8D7/Idylea05dw+bHwWfd2Vpb1QTrCjL4vueIWkefVT0iXXx0qQTud9VTsk
	pxeDnjHOOd7FIpEfIFBV8NB+mpAyeYtcBVPWCNelbwtkvb9kiJ6TKuArLZ2hYxsS5eSrlXfKQH5
	l+qhdNULE362knXKXQabFsXrfls53FY7jZn7ncxmf4bJsTSrzrwhs=
X-Google-Smtp-Source: AGHT+IGg04+IzEonQvFpIX4DqWAql+P+1rz1MPHdkVXRbACm/2BjXy8iSlJQRXa1j6vBNQqyTJPeWw==
X-Received: by 2002:a17:906:c14c:b0:b3c:a161:684c with SMTP id a640c23a62f3a-b50aa49025cmr842742566b.2.1760023506601;
        Thu, 09 Oct 2025 08:25:06 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:05 +0100
Subject: [PATCH v2 03/10] dt-bindings: soc: samsung: gs101-pmu: allow power
 domains as children
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-3-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
In-Reply-To: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
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
X-CRM114-CacheID: sfid-20251009_082508_471457_56A164CB 
X-CRM114-Status: GOOD (  15.02  )
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
---
 .../bindings/soc/google/google,gs101-pmu.yaml      | 42 +++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
index 209ee2f80d449c3eec568188898b3c6f7ae0ddd4..d18a351b649c0736662e67bb64de46afa01e399a 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
@@ -27,6 +27,14 @@ properties:
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
@@ -50,18 +58,50 @@ properties:
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
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
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
2.51.0.710.ga91ca5db03-goog


