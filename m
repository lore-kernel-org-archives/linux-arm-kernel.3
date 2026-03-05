Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941C5EEF309
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 06:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FUcP5CBZJQtkRrAcWORzv320QMtIf9elaWuqQIxzig=; b=dhKlisZ/3cWKfBAclpWrq7sOhK
	69qfjyorPcCtWZKs9n97o0DkBwa68kQJeun/YfvnkkAv4Gde3pmqhUlS8L+/QlzXsmMqChpQT++kK
	4hEfTf8dgQTumenSe6W3O2FlehZGsjjHTqEgn9Z4wUdSIpOqrNS3kJs7VOlv/PKosoJ6+6SlgIa48
	P2v0KpgZoxJy59MlMjDAvUF6wYruVnVlwo8vd9M0qoF0z3x3Nwt/lQNJPgX5Yql/XYGgccLnT66/B
	fMqLnxcb0q0U9Aa9GpDGjeYcdWlpiQKdeHMCQTS9xTuoMSNTLi+ACPdbfTCvvselDY4hiqLY7g0Y0
	b/4z3JBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wG-00000000yZH-3GRB;
	Thu, 05 Mar 2026 06:12:00 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wC-00000000yVy-2K2C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 06:11:57 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-660d77cacc2so4271554a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 22:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691115; x=1773295915; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FUcP5CBZJQtkRrAcWORzv320QMtIf9elaWuqQIxzig=;
        b=KSwGj64pacHE3Rc/f+TbBUz2vH8y5v1iVG7UaiQ06pxHaEpe+UocGIg/YZal9dE+jQ
         4dFsps6mH3GCV3IdxMLaIQ5N5YxWvJRghwaPpXxdeC2GK9M6+myGxmnM3l+QEnWcTuCt
         Bw+jKwvJIZ0S/ZMW9+6Y5Y+RZ38ZHFuEBniZNkVMavSA+N5V4rPHdjOn+pA3pOStFJXi
         000mUql9vEtQnzlO4qOGquOL2N+3Dsi6TvSxZcI/VEyFUY8lFe6OyNeserhWeMkMVhHn
         7Orw0YLAD4LLg0XEar2XmJD5XALN7d8nM6fIM1sMLrhnxq8sImudMTFdh1qTUtdscu6N
         iPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691115; x=1773295915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3FUcP5CBZJQtkRrAcWORzv320QMtIf9elaWuqQIxzig=;
        b=mCCvSBydvNHb1xmclcbbatkDBshnnTpD9ibL+3+Z5Meu5BXeC4PXCiJcbW7P34Up5M
         EncG0N2atrPTEtWMaIdIbYok9sS59wYlw80fPcxRcChcZapPJW/fG0zzLn+fYy2ML9Wc
         zojtFl34lk85OdlD+QaR8Z4TepLRWOZYtsOXC3NJbdypeqtH619G9rveue5syQlYMgAp
         FJiRGWKh1NhSP89pL/UBRDHjn+3vjKa+J0Ic1eO5ndM7G1IS/z/m2zWxuVIDSG48TzHs
         QxVuLzbpy7uMB95Ej8QWXzJLaE3k4G7zYOkksei+1I8//jbfoi4/FMsQrxH/8HoOPq81
         atLg==
X-Forwarded-Encrypted: i=1; AJvYcCUDHJcn+wqvoE1VJvR/0+JA4Gw5KO3LxWoaX3mKisGgZFhrIYIFjMtnKx6rzZulKR1ZhqmBjjeUbYUGePbUcQFh@lists.infradead.org
X-Gm-Message-State: AOJu0YyJR5kWN/cxSBBfiulVQrK41T61lgQvYaoPZuJseiuRzbDKogAI
	vozhre1CBQUSDyBiqrmcsbeDLw31z4+pIN9yAxeo1tI4hq+DTM5Z28JaSGTFX9eDe4I=
X-Gm-Gg: ATEYQzwqO1GN93pYuelygqczmtpgYV+fXn0y/vmnU7DtJpfO+MhHwi/mySOgtpGgG0I
	uAHtBwp/l76TXxVFBtVgAhR+X6JUQ1xoSM4ZIMdrtejMVr8bfKDQZNdF9ZWBQi4mnyYVQ55sfuy
	0vVA0gh+uGNxILaf01WEn0aD9vk9bnR9g89cC/kg/qSifjvgHQ7ZMAF4yNC4ucB45U3JKyBVTPh
	3kJwZgznzdIagcJWVy4mZzDT1klE+LN1eSCrrMFWWu7bF322Ox4iyvam5JimNNIS4l1HGKCwW1x
	UItqZo30yBqygMEs4uQeoZ2511DKnvk47NWYESYEhi2qK/xjDFKGP5q3wrCx9pk4zYZJ5a3VmMq
	rgfVZuo8CVlec3u9iNK3n764y3pucNx2te8z9eyhT9KFC2+ys6TT33X0PUo/pw9l7hZBw2pmltq
	RgwpIBox/g9M4GXnAnGgPxnpWPSPMCGAfZlRcH2Bbm5Ig0ePA0HCkOX6fKr4fKJwcCFxQ3tM3zC
	b/wtyvUX5iYOR8=
X-Received: by 2002:a17:907:7f93:b0:b93:5a2b:bcda with SMTP id a640c23a62f3a-b9409ef2b9cmr62071366b.29.1772691114572;
        Wed, 04 Mar 2026 22:11:54 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:53 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:51 +0000
Subject: [PATCH v6 02/10] dt-bindings: power: samsung: add google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-2-8cb953c1a723@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_221156_627278_6F8A4505 
X-CRM114-Status: GOOD (  13.65  )
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


