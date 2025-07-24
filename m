Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F39BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fU1t/gY+fvQSdT58b4/oSddCY0LCDKCOWarJB5CkkMo=; b=NCBI1blEvzsYT6WmtDptIn3xuc
	EuVa5Rj2AV6uMdC+MRN55IODnYu5LF7ZCafi5vmgKobcz43QcOuCFtIFxdv/IjP57lzFwZkIQZnxw
	KkvH0XYv+gLozHsU47vDDzgY5ADFAYvpIrOpflns570uaGnx/vFF5tNCU611FeoehNaOdxSalWID0
	04gcoYTzFmhJhpx5ZQgJXlLZSm6daHTnMAIB4umJVYzc9h4E84CR4TIfNAJYauiDR3vEQC41CvfDI
	trssvZrx6kc8tJ/xykTlm9UT3+XsM1VOWB+xWsK1tbusrqqHo4b2uDlpPTthoxRxO6+/Mf6jjdISm
	fEjUqkgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewNz-00000007apK-3A4W;
	Thu, 24 Jul 2025 13:53:27 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uettf-00000007JMI-080X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 11:14:00 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-60e5396e101so167325a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 04:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753355637; x=1753960437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fU1t/gY+fvQSdT58b4/oSddCY0LCDKCOWarJB5CkkMo=;
        b=zbTv8+A++xmPb0yRz1rW96C/usvYjPfPzgMxxnJZQvRtBj765hMJS0t0xfjHEgi1Q8
         Q4GVUI7lkXWS79xmSIQTqRq6WmGnk1Q6bA2p+8eukdy66KLOQBYagL0fIXHXDVSGiwLi
         V8LhPMh8mud2qwwCk52awVA5rHc2qw2cotjlUO9yF8OOprF875gZyoU6tH2rPu4uidHA
         Kx7IlY2+pZwpmwHTGcRr+df3Y0nuY4MJOpNfZDgt2Lv8z4mErQEEPWucVQ2xmpofwzst
         e3JdQ+CdRkUSEpWF17ZqMGNKtHaVZHf5rcxoLenrBR1p1vbN6v0RT27x2O1v6Rdwj8Dw
         6mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355637; x=1753960437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fU1t/gY+fvQSdT58b4/oSddCY0LCDKCOWarJB5CkkMo=;
        b=OFgKyJchVJ1ZXGbjgjcLe5JPtZMTb6ZHc/GzseOlhmRRYBLtrb6d04HL0yMIVScbtf
         b3/MqnHAHObXE53xoGJ6vkgNq4xWOy/7rlY+mKvFE6bQ1/aFS+BHiJg/h69DmoZ2UmeA
         r8fPRUva1J9U0PffrnRKsrIeQRe0HwV/upbn4ovO7ym5J2AloI/j/IO6IOeqJUX3Ecof
         5mGUVgaX7owuhrudxcG4X1WGECNKuJAhZpUXdHt62W1wrold2KtDkcSQt1YsXiWVR/1F
         WJj33Uq0EO/7dZR+xPm596/WB+SGq5fuCLuxlRxSJB/lKUq1w5Xo0AeneJE30jukqLg6
         DC7A==
X-Forwarded-Encrypted: i=1; AJvYcCXWzZ6hW4oK8X6BBHa4kaWUle2lQHiiaw1+uz13QMzZB20ZBUUgJPSC7s3I6/3s2ra/ne7tPheE/Uf6sOQ/t32K@lists.infradead.org
X-Gm-Message-State: AOJu0YxrWJN1AerYo5Ld5HHyDvAk/tbQOz4Iy1bBQOzUbeuq/cWR6hfE
	f+tkBqEPWfLezEVpuIEy6Lor7BDXFj95xUVZidXw0L6S9rqNBlLzZx1DDEm8bdgEoTA=
X-Gm-Gg: ASbGncsemtZLL32Wbk7AnEGo9b0LrkhfaHzEGHM2WvdrtQtuYMWSDzBZWclyNOTW14c
	GAgDUBLBLy6TsMpjOzGIZOHKnn3FiwqbaFywjlJw6Q7v2B+D3En412oEjVuN1rOYZ5XNgXcA+U8
	0BvZCdK/pfuKI0eQAUIf7/y34rQiEFR/n5BMSUuxjVKHb+rBYPsteeu3zlXKufE+JlnGIE9jGSz
	Xyj2A5IiOgJPLAr1nFpc9Ied+ApUs2yHQ19bRMoTB+mRCYCJoAXKCey9rTI/CWlgePeWuSTwf43
	nb0QrJnVCsgxmqpMXP377o4WFICZQmzWBHGXo/5OP4Ssod7wnXZQ6SBGAmmWMOhpf9NdMQAUgyC
	/Rqjs28JbJbIZ++9RWxZqyVqHFCH/hCZ0
X-Google-Smtp-Source: AGHT+IFl8bw5VcqnaZyFMvU5N/+Z9FnZSRMF08+PL/sdFu/kNwhhTBGIr/Ez+0UF8NF5JU+4/pUhLA==
X-Received: by 2002:a17:907:1ca4:b0:ae6:eff8:bab0 with SMTP id a640c23a62f3a-af2f927c442mr230489466b.15.1753355636774;
        Thu, 24 Jul 2025 04:13:56 -0700 (PDT)
Received: from kuoka.. ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cc6b416sm98680266b.40.2025.07.24.04.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 04:13:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lucas Stankus <lucas.p.stankus@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Dan Robertson <dan@dlrobertson.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dragos Bogdan <dragos.bogdan@analog.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	=?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	Stefan Popa <stefan.popa@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Ceclan Dumitru <dumitru.ceclan@analog.com>,
	Alexandru Lazar <alazar@startmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	David Heidelberg <david@ixit.cz>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
	Andreas Klinger <ak@it-klinger.de>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] dt-bindings: iio: Drop unused header includes in examples
Date: Thu, 24 Jul 2025 13:13:46 +0200
Message-ID: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13440; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=EzzIiAoijePLKsMHhDEAi/RsAbRH40rRrq9ogMFdd+Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoghVp1lbwagOVzqnb4D4tPHa76QycwmUcOD8wG
 rj1LtwZ+vyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaIIVaQAKCRDBN2bmhouD
 13FoD/43m/JIqB7zoemYOwgQTGXeBr2NHqZX3JjU1PNOPdslHa6EEIzjX9tPb84kF5Y3xi1LeHy
 hv/4VRTOzK3anln9OLWQCpNvOe9DKZAQBLPbA0TbvUB0Q960y/xUjwFNUH54C9dQDbxJTrTDzxz
 jAC14J5MbleGVZ9wh1eLFN8kRo2kUxcoG0AhkIC2KPncOCLDa8v4LwsEDdKhZaOwzBC+Rwax27A
 JYQeOzUCHOF96sj1TT03AugZHXGbvMLR4b4KyAPEuW6S7lrb+ou6nT5LfnC9UyFAkCxgp+zCzVh
 4EeIzgZZ86ChXCF3JEuVEuA/P5BRmCFvZIXbdDn8iOgBKrgpFuoVdCY90DvOo3L4FGPQbfz1nw3
 FTVpdwglTDSDct0eDWw8RunTiavSfgmrc9si53ghRwX9Mc54xsf9APpRiV4r2B3+UrWVFNUuF2Z
 mRN36MocYerVvVC+azuA3RqoYGq75hrElFxtHXP5QJRHvEskyGtvLmUR+kwh+Yl30gKgjKb3woC
 CGABbDDz6cvHXwrwKSWa+XnYH4phU7sVHcROxQWdamZnrYnfWusRIHDmVYXZZqLOadUHIXhQqyE
 KcKz4F3CMJ0XF5p5YWuZgpm9d6QYksD8isNOm7ZRGLUe0QrvAH7UKdh1yW6/hq2+brXKjMeWBDk cFazX3wrd9S/cEA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_041359_073994_B7CF0BBB 
X-CRM114-Status: GOOD (  11.24  )
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

Drop includes of headers which example code does not use.  No functional
impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml  | 1 -
 Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml    | 2 --
 Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml    | 2 --
 Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml    | 2 --
 Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml    | 2 --
 Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml   | 1 -
 Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml   | 1 -
 Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml   | 1 -
 Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml     | 1 -
 Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml       | 1 -
 Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml   | 1 -
 Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml     | 1 -
 Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml    | 1 -
 Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml       | 1 -
 Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml    | 1 -
 .../devicetree/bindings/iio/imu/invensense,icm42600.yaml        | 2 --
 Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml     | 2 --
 Documentation/devicetree/bindings/iio/light/st,vl6180.yaml      | 1 -
 .../bindings/iio/magnetometer/voltafield,af8133j.yaml           | 1 -
 Documentation/devicetree/bindings/iio/pressure/bmp085.yaml      | 1 -
 20 files changed, 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
index 5887021cc90f..3dc973b98f81 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
@@ -37,7 +37,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     spi {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml
index 0c5b64cae965..3a8c69eecfde 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml
@@ -57,7 +57,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
@@ -73,7 +72,6 @@ examples:
         };
     };
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     spi {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
index 84d949392012..a23a626bfab6 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
@@ -56,7 +56,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
@@ -72,7 +71,6 @@ examples:
         };
     };
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     spi {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml
index c07261c71013..f39e2912731f 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml
@@ -58,7 +58,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
@@ -74,7 +73,6 @@ examples:
         };
     };
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     spi {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
index 62465e36a590..88aa67bf2280 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
@@ -37,7 +37,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
@@ -52,7 +51,6 @@ examples:
         };
     };
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     spi {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml b/Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml
index 457a709b583c..85c9537f1f02 100644
--- a/Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml
@@ -107,7 +107,6 @@ examples:
         };
     };
   - |
-    # include <dt-bindings/interrupt-controller/irq.h>
     spi {
         #address-cells = <1>;
         #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml b/Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml
index 8723a336229e..c5fedcf998f2 100644
--- a/Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml
@@ -40,7 +40,6 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
       #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml b/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml
index f64d99b35492..53de921768ac 100644
--- a/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml
@@ -57,7 +57,6 @@ examples:
         };
     };
   - |
-    # include <dt-bindings/interrupt-controller/irq.h>
     spi {
         #address-cells = <1>;
         #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
index ddec9747436c..705adbe88def 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
@@ -93,7 +93,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml
index 21ee319d4675..62d906e24997 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml
@@ -379,7 +379,6 @@ unevaluatedProperties: false
 examples:
   # Example AD7173-8 with external reference connected to REF+/REF-:
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
 
     spi {
diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
index c28db0d635a0..b9dc04b0d307 100644
--- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
@@ -278,7 +278,6 @@ examples:
   - |
     #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
     #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
-    #include <dt-bindings/interrupt-controller/irq.h>
 
     pmic {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml b/Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml
index 2a8ad4fdfc6b..f0a1347ba4db 100644
--- a/Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml
@@ -50,7 +50,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/interrupt-controller/irq.h>
     spi {
         #address-cells = <1>;
         #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml b/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml
index 775eee972b12..044b66a3b00c 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml
@@ -44,7 +44,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/interrupt-controller/irq.h>
     spi {
         #address-cells = <1>;
         #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
index bf5a43a81d59..71f9f9b745cb 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
@@ -59,7 +59,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     spi {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml b/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
index 4cacc9948726..3a725ece7ec4 100644
--- a/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
@@ -44,7 +44,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     spi {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index d4d4e5c3d856..119e28a833fd 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -74,7 +74,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
@@ -91,7 +90,6 @@ examples:
         };
     };
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     spi {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml b/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
index 688100b240bc..2930b3386703 100644
--- a/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
@@ -47,7 +47,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
@@ -63,7 +62,6 @@ examples:
         };
     };
   - |
-    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     spi {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/iio/light/st,vl6180.yaml b/Documentation/devicetree/bindings/iio/light/st,vl6180.yaml
index 27c36ab7990d..8598fb631aac 100644
--- a/Documentation/devicetree/bindings/iio/light/st,vl6180.yaml
+++ b/Documentation/devicetree/bindings/iio/light/st,vl6180.yaml
@@ -32,7 +32,6 @@ required:
 
 examples:
   - |
-    #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml b/Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml
index b6ab01a6914a..ed42dc5afb99 100644
--- a/Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml
+++ b/Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml
@@ -44,7 +44,6 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/gpio/gpio.h>
     i2c {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml b/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
index 706b7e24f182..b9ea37317b53 100644
--- a/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
@@ -109,7 +109,6 @@ examples:
     };
   - |
     # include <dt-bindings/gpio/gpio.h>
-    # include <dt-bindings/interrupt-controller/irq.h>
     spi {
         #address-cells = <1>;
         #size-cells = <0>;
-- 
2.48.1


