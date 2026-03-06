Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F670F01825
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FUcP5CBZJQtkRrAcWORzv320QMtIf9elaWuqQIxzig=; b=ex5aGFmhrbA46n4lkkcV2KQzHS
	IWTWbuoBcU6weembc88XRHgEjdTgOM9IzhitezEbXH+LPv8y69T1Ur8zUp6npeh+1jWS9xy1BfKEa
	jJK6WCKvTl60A74Tv8NScl93OPxTgFWMJByp1zQBb13V/8v1sXqXxT9EL0JYy8V+CtDZPAbYwBndl
	eWeVkaC7yWzVTNR2NJ4q9FhHBl800v+suLoklqHw/2QOoiK4ftIz5rmddwwqPprUNDPHW/Cm3NVXt
	F8/TuVooJayxIUPW3hNOyjg2fTXRPAa4ZlAPi5Kix26ASC5+5BmlZq3Xz3YVJA1VewLQ3DJ/IIlTh
	GNP6ufMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRX-00000003Sab-3UnY;
	Fri, 06 Mar 2026 10:30:03 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRR-00000003SUh-3rnZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:29:59 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b936331786dso983158866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792996; x=1773397796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FUcP5CBZJQtkRrAcWORzv320QMtIf9elaWuqQIxzig=;
        b=aAshSyp1I1gXW4y1kxM26vH0gZvDFE6Frts3jYZ1PjYbki6MPTmgkFooBuhDtj6+9j
         7WT5qtT9zPUKwkHaA9YrgRj+O4cinKqK5B9v4NQy32ShXr7SjOykErRJEj8teyy9Qgfz
         9jH4Jet6t0n9S3Yq2rD0XZPacIq3gWsRE4MRgRO9aEco5UxMUEdHzs03r4LpeWWoel/+
         zx1w5+asg+cHOrLy9K6Gjn25C4A1dJJt5Bz3AWsNUKymTB4tcp5IUSaDOp7CLYxF6Ss2
         KAOX74p/XWrNviXdkXZg1zUCKBUYmXfdviAc/gduJ0nNAQ+0HygGDba+iHFul504SLSH
         kSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792996; x=1773397796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3FUcP5CBZJQtkRrAcWORzv320QMtIf9elaWuqQIxzig=;
        b=Bi76CesQ57pcBSPuRd8hpIULdG29VHG4wVopFuymhVFFr09eiAY0zQkjJN5Tgo3G9O
         3AHXO2J6dZNmgPTDbJjSUAGNM9CxV+WVhbGJ0Oa+kmCNX0T07RPC6pA3fn784wOCjUi1
         godVWhU2OZvWyS2v+h7Yug+oKATYV7KZzi5e27qRmb1XYML/H0Q/KimmFUo3Bf2YWmHR
         iOpTrC9oMy4n3Cwso/6kAwi6N/8MbHSbZa6IN0nNr5sJcwRSri4nya52B9RkMXPyP+F1
         Hbe2GcJDcAEQlYwK0hWyJ9OiT9+eymFLUGjrS5mpl0UfBxNOXOBu4l4Q1lPXoI46ehnc
         /5hA==
X-Forwarded-Encrypted: i=1; AJvYcCUF0MViETtNOjgUU0FLvmbQZNfNoDcA9CvE0BXmZgx8YceENUPrtXbfPz4kZKtUwSJ5s2Jjt15FLx6FjpTUENQS@lists.infradead.org
X-Gm-Message-State: AOJu0YzBLEdp+t/MevUdfl3C49p59tIMrHHD+o+OMTRggrG1J/skEjha
	N00owoB4ZAB3Iz30Mgc5SMF+PNdHTIcyHeImi7m810hK1IuaLRJkskt8dEA63DAcgIQ=
X-Gm-Gg: ATEYQzzhyEv4nM+gUV5kK2uyCNZztUM5AnAR2dn48Chr/u3c5OugrOFJE6byhO54Wga
	5IigOMtA2s+TyiQyYjya10txzX0sMnNNm2OlmyNxxmN20RvyHSCGbWfkJOZs9x0TE1NCPhRaAsh
	tP1fHJF0hC14uAPtIKSg4shWbiTTJNYVLdirIsafbejYhAimCK/m21tKo7jFMry53ao4hdnLGNx
	gA3kzhLL62aYfeLJvN380KxQ1zcWZtunHFTFzT+0BcG9NSl5LZCIoK2RlH68i7sVc+s3LEo3EX1
	dP1hLJOTNQfJGq9chN9DYAdFfgGCA6zVklCGSmRxQFtgT+lJgB9k038tTxpDPmhz3GR4mOCKNNe
	3FqzLBiuRZBEl8uxPosdE8A02n4U38xwi9Cx6mpzvC2keXX8cBguIKrnvaZN3FwtGoI8IV/z7It
	Q7F8RCJMFjMOcXsQTfqD5WVxhSXJ0fC7Zd8SRmKF8NVTp/ZOwj2xfa1+9AI/KiliiJGbrJVenBR
	Al0ESkamZQ5UN8=
X-Received: by 2002:a17:907:f816:b0:b83:b7c5:de2c with SMTP id a640c23a62f3a-b942dbcd35dmr93807866b.10.1772792995758;
        Fri, 06 Mar 2026 02:29:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:29:53 +0000
Subject: [PATCH v7 02/10] dt-bindings: power: samsung: add google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-2-03f7c7965ba5@linaro.org>
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
X-CRM114-CacheID: sfid-20260306_022957_972773_099302F3 
X-CRM114-Status: GOOD (  12.85  )
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
2.53.0.473.g4a7958ca14-goog


