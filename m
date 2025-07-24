Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDF8C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlXiIo1YTe81LzNvByvFXaqoppLPAdO13nkKqXERm8A=; b=OVS5FRe5clxMNK/wmAa6qTfCkB
	EP+UIdZf4AeJfms5yE4OTQM3Xd8A+Yc/KQVVMXHryFMw9WU/9N5vhj6oqmVPeETgnVPJhmvkP/sXw
	WO7wNm4fzgkkK5DqR9P2KaxDur84Wm343B/Hq5nIKk/zea4zlcm8rH7LEof26QMTU+dM/fkN/px80
	4QYTV3AstHdrDMeCmTQs314ZVS7hD8VWXBWjq+TaQYn8NVQO7P+A43kanbFxjDDVlSC1elgKwCwRJ
	sc/t8VhBOxwLrYTU5L2bn0DzE0XzWOuuISuGR5z2C56eUhUzcj/ZcVVzqajhjrNW1/bnhqjnDGZ5L
	V15I073g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexp9-00000007qGt-02ly;
	Thu, 24 Jul 2025 15:25:35 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uettk-00000007JNV-09lv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 11:14:05 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ae35eb87810so17035766b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 04:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753355642; x=1753960442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlXiIo1YTe81LzNvByvFXaqoppLPAdO13nkKqXERm8A=;
        b=oPcPGltefy2l/7VespH1Lw/o7/Zx/rCWxTUKSoFBfEAaFTlXhG2lNxoKq31h8diF17
         lJ2rp0f2vgMkBWneAk580cMN75t5ELuqZ/FpCLO3BTF1iY/grFSlVxg0O0FDRa1yslYT
         GVDjJXYrXUw8kClh+9A2aT3dLXK1o6EwUr3STA/BATJI3Gvm8W6VvFCb451+X/rjCxLh
         H4tc458dfP3/krPfVHcbqJB4vugbV5WNCvKy5eVDc22dlcGfSdNuu1qaPVUu50m469dw
         nn0v/a2r8V+bwCu8EtKAoaNxXP84xkKWbHycKakbIMCvCK9pitkxPKaB3ntKgBY7U3/7
         vwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355642; x=1753960442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlXiIo1YTe81LzNvByvFXaqoppLPAdO13nkKqXERm8A=;
        b=VKaVQDDAw1RA1Egu5e4eOcwWot0mWLwUt2CyijbI1wY5m6X1GxGSijt4Xmnvo2XhUN
         PWGYweux9mNuR4eZg5Eji/JI4pbPm/sfoBEmaGQJH4MDQTGV53rhfA453RSqLUZkbgXa
         2fIdul28HTICgqOG/ck5gYvRTFjFL+4OIfdKgaKlYBRBIWz4jpdkbPIftEy8dYlq1CGg
         32S0C32Zylbbk/dmBeNR6kYsvjErFltazTtWTSWBatUW3P75T/OC8y7YSP1v4I4/2cmq
         6kC1qtlrU9o0cNSkbAa3oyrdDzelE550amF8mPsf6ORt2jplzA0VP2vOgLh/Jhe+mE2q
         hl5w==
X-Forwarded-Encrypted: i=1; AJvYcCX4AUV934TOfFx6dB25JpUe/zMhKEGjXQb6BISnwEJyIXlbajpS3UINuLTWW2d3+mO+uql5GPMyRMM/aLEKPqrC@lists.infradead.org
X-Gm-Message-State: AOJu0YxS7TRJ5ipSoDt3ekahYBFtjKy2cRi6rx/kQ09eWp5H2YqoA0RJ
	EhbrhCOZgwUl6inIzjrrddJ3q+2UMVMyPM9mfkNa9aSK9t3hwP1KH6evzJPawgpbe0M=
X-Gm-Gg: ASbGncsofOJ9FQFJNJSEsaDMa7Xanmdsf+/nbFxJCPPteTMVNp/z4/R43oYEBCJtazh
	4mrYcodx7om5Rjh9MnLCRduOaVPLPtZ/cjDbkB0Z8vQ7mFmyfQ8eZ5citrD5jXiEowxhdt/EwqC
	lfnBKqCcj83eJpFd/o+e/3c96BJTqALKDdTLZhbrzZHi493OZc7thjLQZ/t7UFT9/0muFyW0Eic
	QPNHXwKCX8IuNneHiBtnUGJkbkWnhbYxwLozCv+uo0SrpgHX9+aHmkYhQm0WgwCQCqnKj8GfJSj
	uhBypRBK9UynLec9PoQGlnjIgb2AUbszyWsTRz3+6fZ0z2PxbXoBWiKVUWscS903BRrVc9hGD+I
	yOJBziX0YM5D7z54pq1Bl0VyRp4cBk+rb
X-Google-Smtp-Source: AGHT+IEFsO1jeCJCKKhxjlisy/SsUZZ3OuDpWFhFwhM5aFP4wr0fQrdhbCZsUAkk2m0dTOMZzux8qg==
X-Received: by 2002:a17:906:7956:b0:aec:5d6d:2180 with SMTP id a640c23a62f3a-af2f8c55a72mr223332966b.13.1753355642274;
        Thu, 24 Jul 2025 04:14:02 -0700 (PDT)
Received: from kuoka.. ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cc6b416sm98680266b.40.2025.07.24.04.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 04:14:01 -0700 (PDT)
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
Subject: [PATCH 3/4] dt-bindings: iio: adc: samsung,exynos-adc: Use correct IRQ level in example
Date: Thu, 24 Jul 2025 13:13:48 +0200
Message-ID: <20250724111345.47889-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
References: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=QUlUkMxYLf0SjVpBsl0OVkwsTq7YyKk/KjAw6Del9ZE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoghVuzHS4uXkyTU6sLVWBewujbkHFikNttM/IZ
 isOEeWsOKCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaIIVbgAKCRDBN2bmhouD
 10l9D/9DQ2PDHDgUtLpbh1bG9p4sGi3ncJTi0AN2Is3G8KmpxmpfhMyu1KOOykbxxWYASd5nQQn
 XLCKNWaU40/sTcE05eH6IeyPkaVbBAmrqOIKiWYnkGPWLk2hFeyeDjU1i/299W2erhYLqqImuFZ
 BdUteV1wXC9ce8uWNX0o14sewzu6cz7tRYfaCcM+TSmP/Ngj1xDy+4HOIgw/dZb5jaDN0Dkx+oF
 BX7F0Toypv9+/XDHBm/ToCHcF68AHBVsUH4Sun7kLo6gnUu8uqDZ3wyDq6inD9w+iUkkwb1kquX
 kunMrEATyImHxNK9PBKolSZe1BnFjP6qM/G796nPqDzotG3blFp7admLxwk20kfNBGgeBF9LGPV
 BSAbdxqQcxiN33p/icJcU6hLpEy7wsLgPguvVkL+3qwBWfKo9mlnlmf0GpyVGh1qAm5o9v3p/Mg
 T/Ut7KQp4l00G0fmEBvTELyk8iXW4KRMZTFoeNFChPU+iXoJCKRfY5ULOtpSzXYn8wJnoRLwVkf
 DSpoXxNqM1g8gim36z+BCRQgS5jFE9Miduv2EhAZQVedb+0Tu0Tep62i7ZLXUpl6KKGTCsmj3bE
 vAdNuW2Cslh5TlRotpuzZ+fv3XaVrA+z6fLaIfLrL18NXt0ptrlGhgOjMlhPNV8wLYZZ/RG649H oPxf6PSkRACc8nQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_041404_076800_50E77783 
X-CRM114-Status: GOOD (  11.39  )
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

The interrupt line to GIC is IRQ_TYPE_LEVEL_HIGH, so use that instead of
"none".  Also replace the hard-coded GIC_SPI flag.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml    | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index 4e40f6bed5db..8069e99ddac8 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -128,10 +128,12 @@ allOf:
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     adc: adc@12d10000 {
         compatible = "samsung,exynos-adc-v1";
         reg = <0x12d10000 0x100>;
-        interrupts = <0 106 0>;
+        interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
         #io-channel-cells = <1>;
 
         clocks = <&clock 303>;
@@ -152,11 +154,12 @@ examples:
 
   - |
     #include <dt-bindings/clock/exynos3250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     adc@126c0000 {
         compatible = "samsung,exynos3250-adc";
         reg = <0x126c0000 0x100>;
-        interrupts = <0 137 0>;
+        interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
         #io-channel-cells = <1>;
 
         clocks = <&cmu CLK_TSADC>,
-- 
2.48.1


