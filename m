Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80511C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BSVq6jDIx0gJiVYHcgvtP/1XdtkFfYyKmECHdYtqDM=; b=qF0u3mxeyV5JHdwhiab8Cxqkvc
	Vh2qYo3KX/PIw9nKQzVvJOEw/4rOwAh1TOGh8A1E38/EvuSOGyBxBYZUcR0+sAX782OLFsqK+zYYL
	ffPUsN8Dr1XeWVxPec0KDVI8w5ASGIJdVbi6zbB4yY8iDY5ZwA9dLLbAb57d3K/mI9dzzG0MZ0d/m
	j82Q4bhQnyBmf8HS6Gparhsb5p2dLU3X0HTz+aJMJgD62aUQEb9Nyg4KSY0GDuEnMq2M6EexedMYC
	qnBPhfUden7HrFkWV8v2hzdxBwRJOVuhhCEO5fcHfYxJUOqXUV9D8Z90+a37Bnn0Y/g4abNjm0oiV
	b5LM8nXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBagn-00000005QGj-0N79;
	Sun, 04 May 2025 14:51:33 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBab8-00000005PPP-1qdE;
	Sun, 04 May 2025 14:45:43 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so8503131a12.0;
        Sun, 04 May 2025 07:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369941; x=1746974741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BSVq6jDIx0gJiVYHcgvtP/1XdtkFfYyKmECHdYtqDM=;
        b=nFUN7bRFnXw8Rk6X9Lp4h/63Cf5tTK9+92T/uyAq25M70H65S/XaLEDsEx2vM3N1Fv
         /MRvANxXUKZgchvL7VVQGD2rNk7rQpDLPx8MlP71ZKIHG+ZbSXNu1gOXwH+26VPU3TT0
         k1W9nprMWvFztWFET4TTjTGlI4kTuolM631DDKAdFWLcSjFAYvWfty2VIJ3wsvOVNkcW
         GAwGz6OBrWI57+3/ws9y0ZfJG49FGIRgIw7oTGgPSsdi+aSr006Z3kAjR0hj4rJ+JoHw
         jAfTyHSzncpi1W05k7DhiA1ALQ7wWfMlYeKovEkS1GGz5SdTlm/qvveivynAhCPKmXui
         2+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369941; x=1746974741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BSVq6jDIx0gJiVYHcgvtP/1XdtkFfYyKmECHdYtqDM=;
        b=c9K0rFg7vosbbI9Aaw72A//RYfsZSkWd3cU8SIjLlWzi7++2nCeQtnHUsuAXLzP+zW
         ysiMCQkE6C6Mr/4SPgy6I45hdAilzct6sLzLbe50WFZc5rwmYWOhBjCpg4gcIOHF7YvS
         Q9QJrrz/A0P6qjd1oCOcbGPdwx+U0HB0kuBykm8gmsqwEj4+3vMRLjWU76fLuleAGMLu
         TUC/xEFhqE0eCCkiUGjOXAYcJmTyGVGG7DWH+sKoVkvj8MDSpP54LsFyUfRbhOLvK6mf
         VIYFE1jH6gdrs2azIGfIYGGL4kVfqueOPmPgBAAqZEfDtdSi+V2Eitk87Q7kKNdQmncD
         s1WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKiPRl+srmlAGX5EEFiNxByWuWO9VZiv7N5qIY6cRMTMY8NPkUQSWfOKsfZjqfJbsyY9GSN9+eeRKrMXIGUkAF@lists.infradead.org
X-Gm-Message-State: AOJu0YwviLRMe5F8Ry8uP16JZ7zImVj0gSFMaDRmwRm9z1BkYj6wsCWc
	LPgq4OrbxjpzayX/J2g4q2NZhq1XiBm3T60K/fzdrTr7ylFTzGjBDCNJDw==
X-Gm-Gg: ASbGncu09RuXt458UyC8kJsT4TdZgyOevxIDyL0dNmfci44RfxkDMbB8HuVrVXAo82B
	vDVfJFmge3B9+11MxHOGy827DfiWZZ9oppUktGLoQqPMQPNB3Zj+uZyphSE79vv10oEKef2eU0p
	e/wlacmzHpJp852AG7oK/LgKxlDLRSnxlIXUkCAFJ2TgwKjPJxpTLoFP34zEW2wvntB2CD5PGp8
	Z4UCtvLPB9pm8NU8XdgjM1H3zXHzPUbTedget8I2pJdB8L28N+z3Y30axUQIZ+6iZ4NrImedQzo
	Tsiro+ulNEEaKTxeLZ+MP7lcYqn5A2L005yEj6GMYIUyReeoOA4Rsavn4dqF761doLVDpLfnhCw
	6M4UF/3x7idYjUJxs
X-Google-Smtp-Source: AGHT+IGseBUdREIdCgIBWp9MzoQsy7P4bCBbCMZPLx3ZedRLperaW69nIVN6ZjiqGB8e6RpDelnxiw==
X-Received: by 2002:a05:6402:3493:b0:5fa:e2bf:5491 with SMTP id 4fb4d7f45d1cf-5fae2bf550bmr2184616a12.11.1746369940623;
        Sun, 04 May 2025 07:45:40 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:39 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/10] dt-bindings: phy: samsung,usb3-drd-phy: add exynos2200 support
Date: Sun,  4 May 2025 17:45:19 +0300
Message-ID: <20250504144527.1723980-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_074542_477107_427C2C59 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

Document support for Exynos2200. As the USBDRD 3.2 4nm controller
consists of Synopsys eUSB2.0 phy and USBDP/SS combophy, which will
be handled by external drivers, define only the bus clocked used
by the link controller.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 27295acbb..4506c5801 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     enum:
       - google,gs101-usb31drd-phy
+      - samsung,exynos2200-usb32drd-phy
       - samsung,exynos5250-usbdrd-phy
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
@@ -33,24 +34,32 @@ properties:
       - samsung,exynos850-usbdrd-phy
 
   clocks:
-    minItems: 2
+    minItems: 1
     maxItems: 5
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 5
     description: |
-      At least two clocks::
+      Typically two clocks:
         - Main PHY clock (same as USB DRD controller i.e. DWC3 IP clock), used
           for register access.
         - PHY reference clock (usually crystal clock), used for PHY operations,
           associated by phy name. It is used to determine bit values for clock
           settings register.  For Exynos5420 this is given as 'sclk_usbphy30'
-          in the CMU.
+          in the CMU. It's not needed for Exynos2200.
 
   "#phy-cells":
     const: 1
 
+  phys:
+    maxItems: 1
+    description:
+      USBDRD-underlying high-speed PHY
+
+  phy-names:
+    const: hs
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
@@ -150,6 +159,27 @@ allOf:
         - vdda-usbdp-supply
         - vddh-usbdp-supply
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos2200-usb32drd-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: phy
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+      required:
+        - phys
+        - phy-names
+
   - if:
       properties:
         compatible:
-- 
2.43.0


