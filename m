Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971D4C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGjfPszrVrEVOxka0UUUD+znsu6IGYgXm5WWAeRergQ=; b=GEpXQN426ZAR13Uhe1PKDZBezs
	6F+UQCGRlZyEQJtZ3AbxOfJqwYXtzojYzwdyzm/QTkbF9yFGJx201SiXYIxEWk1OMS1+g+Le6h3n6
	IoDrj4nFw8cNy0LUOJVKPf1zvf8aEt5hilp4r7X2YuXOe+UFe3Pp0snyVWdkqIOHpWfpwHEHX/akz
	usT4RcoDOVb38x+nSyU/VpvXRBKtgqVt2SQjXf//MUosXNLy3R8Ay8GdPHI9dZI+BoIsGArnPovD6
	N0vVLyGU8ul1D1e1vTyLcSoYYBPd0G0RK0FGh8+SaO+1ThXQBmDSAHOZcn6s95XqiEqFjBMZMXlpv
	E9TSU0yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewO1-00000007asy-2or9;
	Thu, 24 Jul 2025 13:53:29 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetth-00000007JN3-12xL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 11:14:02 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ae0e0e464ecso16224666b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 04:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753355640; x=1753960440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGjfPszrVrEVOxka0UUUD+znsu6IGYgXm5WWAeRergQ=;
        b=FsZ4b92xX86H7+5B2q1594IFhTYvlubkbG3bV+hlXXpmGTe2WZdUEMcl8AtCYPO7Pw
         7b1/L6/K1P/7rM+jrPGgEqezmWg28WN9CliLAEEzgeOjf0uujBZ6gvHiwQFFxMnIcVLL
         /rIUtwUR6Q4Dt1+iey7QrSZpdLRinvjPwbXBkkSby3NuYx9ybFkVbl+LbFkomcuSQ773
         t6acZwR5b3HIOjElFN8PjTreuo36wdxFqftzoH+OOYobcYy3n3nBNjxn+69h2kACOa3d
         5uDyDwr3eU1DXuUxioHNLwUgRNOjazF3zINKD7FHW0wOIVGV7zEBxOnE4L1y7wMx0iXC
         PxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355640; x=1753960440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGjfPszrVrEVOxka0UUUD+znsu6IGYgXm5WWAeRergQ=;
        b=W5LBnitCak0d3TwFVe3WtomPXbXYhDoqtkPaOVEc6fnnpZWB0ZaMTJBcCMppgDfvbg
         VKtDIQXfprFCb6rs3gD1aS7gppWZkxiYDDENpG9DdVBMzJ9HibPbFqD4wPbb71uflEH4
         JzgGMvuyJ1shNML/sR5IZTglNq15yIouEO1mrYdQj7Pqk4VRT/s/mfrh2TztA4o+PAmj
         IZJJB6KsertdprPfy3aIT8zoc+rqvX5krVL80E/y7NbraCLhBOKBJh/PSscvlvT4p60x
         GJGDW1Sr3uHNumMXZg2CD3MIFW0OGMUoL5kbwUNlGxTTA+YAUcWZLuTRsEuNz6tbsLlI
         B+yA==
X-Forwarded-Encrypted: i=1; AJvYcCUZhXbEgCQtJS+s0a3y5HPUflbYHvlKtWjuW47q9EA94vGyzRzFnJMmy6/GefSOc5rnk4C2KE685j4NmE5N4yBA@lists.infradead.org
X-Gm-Message-State: AOJu0YzEqwCdYdgPUwUsLOCl1Dhhcdqm8AOVoGhqISPxW5XUcDF/9/XW
	wbZGB6DBe1Qbd4ym4pjh7rCrqVRrUZMqK/w7MKLyeGjXvrF1s3o5YDs1beySNMt2gVM=
X-Gm-Gg: ASbGncs9ui0B/SqOZh3k7RoOA3LTbdxOpR28Cw1Cale1YZk2Ld4YFb4fa3D8XiW9PZM
	cuOeiTafV261AiFRW/RTbIKCm945EoTxRRVeYQJ0vrhUa2tzkdm1/V0ZPJ6VRROf6wxpIdNQy8y
	HgXyOtoI9bZUUYqkhj9zh2Rl1QDgzzr6xFfy2GF22WC4ltNvKaCL/IkddBcfM9+NZVHkRT0v2VX
	aY4LZF0ryVCZqY4cuKdzLUsjhxmeGeEKUYB5Zy7OrRqu/StDzZJJKT/cghM8HIQ71otPXPDGYh2
	hHy97MmBlY3dM5HfhalGbdNnhEmnCtMgxtnpeOHmO5dStXT8GTdEQ7W1xeRcQbqwZU8Rsl1Rym3
	uPsi0zE+kTBguhUAaJ2/wQMNuFaDq2QFl
X-Google-Smtp-Source: AGHT+IGT5QDdYa15M0nAX2eTGKcvGeF8vLhDDbNPFrB/tqkQztblqIfePsQl2N6GdzxuxEtq31HroA==
X-Received: by 2002:a17:907:6d23:b0:ad8:8702:bc97 with SMTP id a640c23a62f3a-af2f8e71cf2mr227712366b.13.1753355639425;
        Thu, 24 Jul 2025 04:13:59 -0700 (PDT)
Received: from kuoka.. ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cc6b416sm98680266b.40.2025.07.24.04.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 04:13:58 -0700 (PDT)
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
Subject: [PATCH 2/4] dt-bindings: iio: adc: Replace hard-coded GPIO/IRQ flag with a define
Date: Thu, 24 Jul 2025 13:13:47 +0200
Message-ID: <20250724111345.47889-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
References: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=zYD7UiO3dez7RbH8uvDCPOH/dX9cX5UxYcjvd1wxDbY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoghVt6VNb8EiMjGMt4ZyBRzMjh+nf+5u/Li4cb
 AspQBZbA7iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaIIVbQAKCRDBN2bmhouD
 1yreD/9pAXwvGQvWMsustFAtHpbJbZEysb2q48IDvkbMYbOWCebNv0ITYPDGcuruq2O708eDewd
 YmVn88qZDD0cLdy28IZfI+xQ5USH50CizIjVevVOjhCd62C2jt8GzLuir+zh0ImdWOYMpTSad9p
 dooXHQX+Kwn4+5CjOKUWRJliaYpWWHubOlVDTaeX5/zzPMMJDWM5NrQVqmF6Lrz17U9HvQgkYHA
 5ybZe0Q7/szL552pc6G/b8QCu3igFe+kpgVKt5aaX7/kcQAnI9m9zVXBLiAilqe8zTyGwlwuTfb
 sbqx6OPnH4VsKrRXcomLJC0e077hX+ArYstwfo8prizIQsdcBpf81EFxYq2bt5rEe7FMSJ4A7me
 t79ep/dKYeNiDbWU18ut1Ha8IUdwqWaeBiKjhv7v5aPXnLR/vTAS7b/6W6+yoz7MUvZUTj9U+tN
 1eMDgfKBJVXu0bX+oywTOVNdDMoFasdPCy+ZYMRlWOpVKSAXypnFw/aK//zI4eZ8zo8uiPC8PMD
 Y5V1i5PXiyl2fPd7rW0tlldrzDfHegX5E+C77NTfaBhNaXmq2vgRpvWmnbGoz8RfNYlJzZlfCjD
 p+5fWU0WqttjpSIu2LzQsvEDEgsY06cxoI5hQut4/Y6ZIN032JG3YB+5lNjzz3yzgU5axclQ9XA Ni4tforndR1vKWA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_041401_287377_6492D7DC 
X-CRM114-Status: GOOD (  12.22  )
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

For readability use known defines instead of hard-coding GPIO or
interrupt flag.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml | 2 +-
 Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml
index ef8d51e74c08..592854766583 100644
--- a/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml
@@ -63,6 +63,6 @@ examples:
             vdd-supply = <&adc_vdd>;
             vref-supply = <&adc_vref>;
             spi-max-frequency = <1000000>;
-            shutdown-gpios = <&gpio 26 1>;
+            shutdown-gpios = <&gpio 26 GPIO_ACTIVE_LOW>;
         };
     };
diff --git a/Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml b/Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml
index 503285823376..4a8f127de7e3 100644
--- a/Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml
@@ -81,7 +81,7 @@ examples:
             reg = <0x10>;
 
             interrupt-parent = <&gpio1>;
-            interrupts = <29 8>;
+            interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
 
             vdd-supply = <&dummyreg>;
             iovdd-supply = <&dummyreg>;
-- 
2.48.1


