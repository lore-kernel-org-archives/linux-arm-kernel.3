Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C76BEEF30A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 06:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQtOQFVrniTIH/jIOVZYrUmJOb+M7nuCmtE/30pbV54=; b=h0zJfT+buH2/sxl4Mu2sgl6bkx
	HhCX/wWxiEKZZCMEmj03g+hhFvHIhOcwd86cIe1jB5prNMyFgU3q50mdoOn9U4MlyGgcTB5UAPzmd
	eUDMd2LraznID4ZJYLunlaojEFLcZE/2jdeTFkDVZy7Afu9Z7kYFn14OUhZrPTmRaHsbSQxlSFQLy
	nyZp/az18fVNG0xxErEjfu4QEWRh90MiXXbcXhH8l7MAKcjdCbWTYDRH8DFyer0aj4+qhUVqAhpus
	UgZdh+zjuoq5iXLeDf0x7uIH2PHGdVDB7S+76jMvV6gzLZsDzIwsILlSTpWywwptbeFR2SVLfMSVC
	JhYxBGjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wJ-00000000ybD-23P0;
	Thu, 05 Mar 2026 06:12:03 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wF-00000000yWw-0FER
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 06:12:00 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b939cfc1e83so610652966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 22:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691117; x=1773295917; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQtOQFVrniTIH/jIOVZYrUmJOb+M7nuCmtE/30pbV54=;
        b=QpOivlcSLpxTARy//wF7hBgk1atdq+3cjT1hMLzg3WnsNMu8VlKrelxJkSVWTMfg6g
         xFb3swUob0DkcDgsYySR3TVqHWv7/Ns8nYC+mCZ+/TLygiLgA9VHvI4z7MGIb7hc7iWS
         6b8NKQ4d3E2DWxsZd+FPSqT9R+nez6eKImZjYKxvhxBoniMXjuIhhjRbpH/2aoVVhbDq
         u9H16hodgNm+mLHnzniJDcptoaE/sMVmFmCOyrBE4pGF9+EKFJqneN/7+XhEourtB+5Y
         oG7BeVoLEhkK1KosbrvHM/0zZrjztnPNW+uRVnpaBfk33F+hdKOxA6F+4NbI0cnoUtEr
         i8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691117; x=1773295917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZQtOQFVrniTIH/jIOVZYrUmJOb+M7nuCmtE/30pbV54=;
        b=IHN/unEcfg10P5e+roo5UMD4zgMl4VsKSrUZfEENi31AL1oOiO2lGW7yKswTYonj7c
         3LIiqLumzvMsJQUpQ8f2kz3ZzhpdiwuX+/TzONm0AwGIsgDeLR8dt46aF1Q73jsc3gx2
         GtkR92jRBjBWJWHI4WHOoB+irRBT6JdgT5blT5HO1hy4qHSjqX6Nrq5Yor8KchBCWXAK
         1TUp+Q1KPpG/VW0qZX6uRbMdT4aZueAL0C3ZDOMqbn+3IGcq07Ce2L7vAWXVMQBzQ5Bw
         XC9ohI28Zxylj79xlXRK4UiKPqhZQiOEWOIUYqMDGv5vUoi1Ge23at7E3hs8l1bM30DB
         DOQw==
X-Forwarded-Encrypted: i=1; AJvYcCUkEOLBccgrE/6Ud92/fJas7+brcd030/D7TizAq1a+9ppJHghmby5b4772KwfYhR0BYUmDR1XW913awP78Wh2Z@lists.infradead.org
X-Gm-Message-State: AOJu0YysHw+hI5f25frZEFqjcA26NNbaVRHLZIU9GaI1xwPF17Nx+8wJ
	WfSq0bd3WWO6FJnP+cvi5H7jbP/gzgPdRiIjngWtNr7VUJ4Q10hmfZj6yOeTWjfn3eg=
X-Gm-Gg: ATEYQzwIHGBtF0n99CkQ6slrimjRfupAC9V/Puzd2TGQ1LWp3zUlf/6cE1HiKlKmal/
	nzDrzCYeX6ZyuBZDbvhP2Uqse8mmXNnmp6gSCbQJcYG+NOMxVczMOhdzzHnfRCngCFU0ptRFDXc
	WzNGlQcZTRil0/OI0Y8teG5HU4xM4uW1nkqvykPQgAZ7LHOEGRj/QnxNH5B4TZfvjBmcyK9zFR6
	3OWtZSGwJ1htT1O/mKS68EgPpBNa+ExWOt5B2yrixuVsOfbwLfMKQCA+slVed86Sb2Rz7xs7GWH
	gqxF2Lb2ixlYCDFkWtuWDBhz2uBJzAvSzj3qq0EgxAv82mj/woVGoOBW5BllKPA5lr43YgkBB3L
	xtNbrdgFs7OBKYWgx1Ut2HQ300ybQ54pe69b//LFhdv+MwwI51vh1h1avTQyc0BCouvxiLmFN4Y
	aPkv2iae8lTcN2/LeP9y7wKq5dQTivwWo08wynoKG+SySoJSdYECaN78NrvetdBogS2ch9Ob0Xz
	7V5ig8nJwj2B+8=
X-Received: by 2002:a17:907:c11:b0:b87:fad:442f with SMTP id a640c23a62f3a-b93f1467ffbmr287511466b.42.1772691117024;
        Wed, 04 Mar 2026 22:11:57 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:53 +0000
Subject: [PATCH v6 04/10] dt-bindings: soc: google: gs101-pmu: allow power
 domains as children
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-4-8cb953c1a723@linaro.org>
References: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
In-Reply-To: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
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
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_221159_115391_1687755F 
X-CRM114-Status: GOOD (  12.75  )
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
index a06bd8ec3c20..c1ee9575092a 100644
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
2.53.0.473.g4a7958ca14-goog


