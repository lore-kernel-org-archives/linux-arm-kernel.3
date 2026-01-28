Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EAAD3F094
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gll/OtNLbOWiVZ7Gkg5CJPf2dV1v2rLa1U/xCUl6ltg=; b=aCSuzADuLZTsNut2qJMrbRFZmy
	JCCueVKvehSEHcA3FZNEdqBjGbt70b88LkrKrsGGD1T9EMQShbmTb9f0dMGBRv/qQPJFOPQV9TxqJ
	V0Sv3/iUlrSPjfFCYYMLdpH43HvR1LIoarhSCuHuSuOw8kALVLXMRTLT0VyET1Q9jhr6MAbg0wnr4
	gofk8VFZeH74Y1xz3tQ7F8/s3pfFbfB8Y5SDlnzlRtDXUnkWQjFYPTazME2tS0jWABqwGNmMCML1d
	+CydEfYglASlTqMAN0tMLtst5yKRbt5jxM+fnUZp51vq7pxzDdtqnW/XSKKd7kAeOuQmBMDfF32+O
	VCinGN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88M-0000000GLwA-2z8H;
	Wed, 28 Jan 2026 16:11:11 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl888-0000000GLqX-0WfL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:10:57 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-655af782859so75911a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616654; x=1770221454; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gll/OtNLbOWiVZ7Gkg5CJPf2dV1v2rLa1U/xCUl6ltg=;
        b=VueDcCxCNKQDXJok097M3n0GImGac6f6F6S3ZJym9oYq5uJp5x0/+cQmlEAchNz4zC
         GyZexrRHCyWibXC9BfF4FzpJwx9iSOjbphovN/FmXU2Rg9n/t2myR6PsgqZbCkcFukNf
         MCz+YaQnxr8WwuNCwDOdBz4FfALwLazqgmmYWdXEem+jD82NZ00gcHGPD4QCyRJkMyVG
         IutpGfi37XbMQ0plx0xqJ8d9GBIG0azkx92FDXRI5z69vimOoEVEl2WvB/AtVrLbQETJ
         62osb52qDxHyNnGvj5A7dsfVMPEgxVwvL2eEHmcyP/I6Zng66X39SmWQ6HdJlr9KOrw1
         7hSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616654; x=1770221454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gll/OtNLbOWiVZ7Gkg5CJPf2dV1v2rLa1U/xCUl6ltg=;
        b=bsdbeFgcwAnag7YGVWCzSjpgUpbDfumKtmyZ0IwGZLFLEkPFkfMFFL4cbhwk98IJnG
         YyZUJEzQGwQ7wWimOOp6+uXeI80u4lQYd5maNWy3vxq+uF0TuZ5ijN09XdE3AIaOmEOg
         7gKtfM5WAgTYkr71AwKGFDY8yb4UrIZNxO0/UB8k0RzaQfQ17NgrN1uDGxzM6SjxB20C
         jN4m02Ylx/Xx1rPM+nJ6Q9Rm+aJRZE0hssHYduez0PFeU7McND6VkeZLU/I0QGz8tUCb
         jlQsdeyFmo5JGF4Q42o7S21UE07DOFP7fHznlYgsHAOtQrp57ydwDG2sm4YLiyA05q9c
         NXUw==
X-Forwarded-Encrypted: i=1; AJvYcCXEQKug5yrU6zIBOrH+tECNIuJEvV4UIBZRasLkGSwOhpCRkQlJed0ydCcOsO4WDRR4EBlq35StTI21WHc7GIPr@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3DEPZ8mTNbv4g4gIhTwCIEMp/qJNaEQ4ro2sI8PnB5GVuumDg
	NY9rriun5TFwnKk3Izy4Pgr+K/WWPTiI4MGaf6ylvcQO8L6FSePAIQwq8tFEkP51zyc=
X-Gm-Gg: AZuq6aLMaox0fTJRqTUiukKZgx6mXl3HwnV9F6hXggG8uegz0Ref1bVo41Q0djW17/k
	Ji/KXFLuXGw10qqc0oakL2GBLaw74qKB3iaLXKAwwuC06WR/g8TgCK3Qxstr3cv4OLdbjdo7qI+
	/jLmZSrs6aRBKZUoEORSXTQsA4zoSqCcYdOA24aBeEwhBp6sP4/o0p1M5AqiH6azJ13kGnYiQzz
	lyLQ33r5bdure/Vn/jMqZmcp28AVCNgXl2YEu1+f8k83T21iHhQe+glaPWnkMnCYEz0I7K912l7
	o4cYYWZj2D91o+CqQGyiLJSGaUEFYc+SZ1+Cf6X34y/97ba5Iq1jgr01zn3LPieygoQ44PF584n
	Yx8f+RRhT6/Gme7+4IhjuFE7+A2FD06+pHloyrQ0K2C9KWXdXaKmSVaxfeXOEdOeIa7E5aroQFI
	9whs23sxICH3hUYwd6NkQ2lMyOSbbscJ/KONt6HCcIkyic2SKjCG6sc3RVjZNzqjlbMcdLjkeFn
	tt3wQ==
X-Received: by 2002:a17:907:c28:b0:b72:70ad:b8f0 with SMTP id a640c23a62f3a-b8dab423008mr381662866b.36.1769616654219;
        Wed, 28 Jan 2026 08:10:54 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:53 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:51 +0000
Subject: [PATCH v4 02/10] dt-bindings: power: samsung: add google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-2-cbe7bd5a4060@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_081056_177594_03501E73 
X-CRM114-Status: GOOD (  12.15  )
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

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- add new vendor property samsung,dtzpc
- drop previous tags due to that
---
 .../devicetree/bindings/power/pd-samsung.yaml      | 29 +++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index 9c2c51133457112ca0098c043e123f0a02fa1291..4ba555e11b30e6a9aaed457bcb57765bf5b481e3 100644
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
 
@@ -44,11 +42,28 @@ properties:
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
@@ -66,3 +81,11 @@ examples:
         #power-domain-cells = <0>;
         label = "MFC";
     };
+
+    power-domain@2080 {
+        compatible = "google,gs101-pd";
+        reg = <0x2080 0x80>;
+        #power-domain-cells = <0>;
+        label = "hsi0";
+        samsung,dtzpc = <&dtzpc_hsi0>;
+    };

-- 
2.52.0.457.g6b5491de43-goog


