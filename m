Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F2EE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zESwL5z/yFz+1EwFu23hzBHEEa+Luon6DhT4CZGajQ=; b=gozPiXEqPdX6lSSCZ02Fv6r0I7
	AiVSdxukwPd6APAnYu0sVa7c6DBzNm5S78jMQhpKsZhGxZCMZlPwFM1NjoaQjXtu5/TDFx8mgille
	ITr6WtPwEGyphMKZFoIzOdM3EKZDhW4aecuo6KAeI8WY6xlHDUnDiZ/pBicWx22raS9uczca2oceO
	2X5rQXjegATA8Ky5sKnB2nw28K/Sp40pldXpJBuUklYC8ZmmRTN7rS7vanxUJ0WqVegTYoOspvepG
	cX0C9W0WI3FAdon08YvNcb4hmGqk7Z0DPnCLUXaVXw7jyXVZ0iQiyCj/pp1tX4tQTfNOkvdlgjVfD
	WxhMxxgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObDP-00000004mHH-3pLH;
	Fri, 20 Dec 2024 11:30:43 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObAm-00000004lfl-1twQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 11:28:01 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d34030ebb2so2867983a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 03:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734694079; x=1735298879; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zESwL5z/yFz+1EwFu23hzBHEEa+Luon6DhT4CZGajQ=;
        b=qrKKNtm6Kt35T3NALvy1SNEvNx4VdCY6V+/J2/hUtBMXJJCblHSrSBEMzeftbUj271
         ZAkGmgLImSnis/Ot+OngkIusv0BEKkq5151db21o7NwFb8B/b3d/yYo7/PkZDTRpkWoZ
         03f8S7tCCjpVo0aaKt2B8JjkHNw2A++L0A31Qcw9zrqGuC0LbphAq+36E/2/7fsuOUvp
         ptvGWmMKGRE0blXCgnPvitkEO7U631nX2IVUpXjk2ykKdZZnC2lpdwqCv8NRlHNnVfkj
         +zqmrMI9q6H0hqvhNapKKWq3rpq9OWb8QXf4OtL+vMCTXguflfEelNUIndBaEq4dawMc
         Rd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734694079; x=1735298879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zESwL5z/yFz+1EwFu23hzBHEEa+Luon6DhT4CZGajQ=;
        b=Z+aCn+ov2RjZj7uM0kC+sOSj1TMRCVfqSP35Wkt16/TUeaGw2hi8pLhSx/YKz/cFSK
         yTJzq6H3Z9JxEDO95k/lAIqrptlubiUKUeTgBOjQso3VGTJ4iuRAt6xhyLIYnC3o7nbn
         dAQo/rEYwowTauNpgOKHhJhLKhfDf0TP1iJAX1DBVKvp5PovkbMdOrFxCKmURzVcv+Bw
         KA0H+qcJZ1R6kSvlXfkMyQW8t+H7po8qeoBbV4Uw0UvA7l6h5tGENdvEymqZ4Og+FqyR
         d98Xa5LaOWG3++BCE+Ocp6X2D1pBv/jr6i0aGY5O2czs19Ke2W03DSDD7LyvG6q97Ajt
         btSw==
X-Forwarded-Encrypted: i=1; AJvYcCVrveG6geZ6B90i+QOrE5jbs+1Pv14bI6Uvtwf1NAI9475d+vT/W/ZsL+ihayyIR983frkXUFuSD/iUqMbR3Otj@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn5Qlpd2flsYQwVeW3dyrxOpAYmpCSQnzZaMWKZAsnN4YA1XwD
	ISpi6BDq8CARCO2DjfnhhdJmxki9oACgjJ/4Ktd4u9hDVcgfq1g7rlFiR2YNrE8=
X-Gm-Gg: ASbGncuXN4ytNp86hncX/pLO5wLZ6rXQF5cTxEgdRieVPVvJUU+qN32/yQVQybRk833
	nimaXFe3tJyXICqOGnSyQEnbyMZY6ZB6D/KFWNDqWqE2RMdlH8By85AzXysGeyVO6LBjNJ18Jmv
	jWzcvvVSQI5rshkURIogWxjAfFO3TUpe7cWiItIfdbCFOY9Cbxd9kUUh/qoTe7hGGzEZ2f1WIL0
	InKs+SpqgJQInG624drSaaPWIS2TaXQfuHL2zfM4BhvpOZuc4UPsQqZZ2dbHPwxm+PwlTB6rRyE
	DnzRtOFr7HVXT0MO6aOOmmamtLGlC25x9eyFkDpG
X-Google-Smtp-Source: AGHT+IHwdFHGdeIg/yzoQyFEM4Ix23wZS04hAPOurAhS8SM0BMEKA/I7VUHkQxsK73sPZbaMVySSVA==
X-Received: by 2002:a05:6402:210b:b0:5d3:d19e:6d57 with SMTP id 4fb4d7f45d1cf-5d81de0669fmr1906775a12.34.1734694078782;
        Fri, 20 Dec 2024 03:27:58 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701abd1sm1632634a12.76.2024.12.20.03.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 03:27:58 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 20 Dec 2024 11:27:24 +0000
Subject: [PATCH v2 1/3] dt-bindings: arm: google: add gs101-raven and
 generic gs101-pixel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241220-gs101-simplefb-v2-1-c10a8f9e490b@linaro.org>
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
In-Reply-To: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_032800_500203_C7BA4F9A 
X-CRM114-Status: GOOD (  10.59  )
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

Raven is Google's code name for Pixel 6 Pro. Since there are
differences compared to Pixel 6 (Oriole), we need to add a separate
compatible for it.

We also want to support a generic DT, which can work on any type of
gs101-based Pixel device, e.g. Pixel 6, or Pixel 6 Pro, or Pixel 6a (as
a future addition). Such a DT will have certain nodes disabled / not
added. To facilitate such a generic gs101-based Pixel device, also add
a more generic gs101-pixel compatible. We can not just use the existing
google,gs101 for that, as it refers to the SoC, not a board.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/arm/google.yaml | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
index e20b5c9b16bc..a8faf2256242 100644
--- a/Documentation/devicetree/bindings/arm/google.yaml
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -34,11 +34,21 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      - description: Google Pixel 6 / Oriole
+      - description: Google GS101 Pixel devices, as generic Pixel, or Pixel 6
+          (Oriole), or 6 Pro (Raven)
+        minItems: 2
+        maxItems: 3
         items:
-          - enum:
-              - google,gs101-oriole
-          - const: google,gs101
+          enum:
+            - google,gs101-oriole
+            - google,gs101-raven
+            - google,gs101-pixel
+            - google,gs101
+        allOf:
+          - contains:
+              const: google,gs101-pixel
+          - contains:
+              const: google,gs101
 
   # Bootloader requires empty ect node to be present
   ect:

-- 
2.47.1.613.gc27f4b7a9f-goog


