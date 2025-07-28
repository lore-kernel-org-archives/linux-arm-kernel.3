Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68005C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ao8eoPOSjBo1pqHWYqmxG6F29BfmtszTrihrIa5aqow=; b=yZ78/HDzHecf3m8jRZYKlZv43k
	0O51b1rsRDi+t3UQEWbAoV3KZJA/7OgftfLY+E0UDlw0+Y2hIFu2Ndn3PCmnxOLcoHv4ysF/w6hLc
	USJzbbt70p+qz+i/jFVxxiTdPrHZj9TF5UOUh7bX/EZ0cTvc3QdLLxpZeeKzVj5RM6ljZQAJmqsLU
	kSXDwyxTLHdnJaRKo80jCUucWn7SpeOcqsovAd/qd8HOEYCeqt8mvyNUCyd3zs5UOUZkpVlbyOfYB
	74u3T9yTr0bAR7c5x63zBMsesd3rHGYjrV1x6P5A2YmGwLLbfK74i0Yau7BLYJAxIh7XV9/2YwRNa
	jTuXATdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugH1y-0000000DjMh-3xBP;
	Mon, 28 Jul 2025 06:08:14 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGqa-0000000DhLZ-1Z1x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 05:56:29 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-23fc5aedaf0so10499785ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 22:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682187; x=1754286987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ao8eoPOSjBo1pqHWYqmxG6F29BfmtszTrihrIa5aqow=;
        b=IGfxeWzm6HKmB+Vu91I8aqGZlYb5N5rXPR4az24pfRxXhoMJyDsY/7QZgyFKWE/+Og
         o/1Bs1pdfCACgJN4ypogVT/axvYuAkdpjTMw9WBbU9O1jdsQQI3sjgFR4Z8a//wu6HkW
         15l3OoVGNYj89+xhnrCiBPI2K/9kiQlk0uvvQ2RVgA9OEBe7ymIQfp+8rGjUkk4OGL4M
         hhyA/BpEBQVdEBOrMChvg/OIve5KMIrUYxDT2mvrJ1Dfm+ZNRd8kdGu+E1vU6xWxpJXs
         a7r3D2XYBzkMXttXwOiHaxPa/onVyCzY4c2SYzuhv4JHfoa9TGnEHq5Lb9r4drrTrr93
         sveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682187; x=1754286987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ao8eoPOSjBo1pqHWYqmxG6F29BfmtszTrihrIa5aqow=;
        b=xHujFH8fIZoAuaqkcalSbLYYXEzjqYE7XiMBDAJhJGQlI+qwNKEUweJsfZqTWBp7Ec
         uqQJNtEuzFvNTfHyFuRjk5xaoRipcecYu3owBgop8qxU3QiVQOK7dSTmvS6pIplqjNCl
         UPuw1um4u4ADNmKY3o6OGTWF1JbWdQUjHvyAWtSboYMF+Zs8wMPJ8wYnNhkYi6o67BEL
         eO+if4yyQjFRCtmaRhG7fSwsE9ql4KN2IUbkTNjLDu11uS2LoG2vm60VcCR+PxH9O+eS
         H2c3FbODVqfPoLoQGalTLxAX6F9qCcfH+FFqAG02m4cQXCyK38MbQFjD7xM77r+NQYTC
         KZog==
X-Forwarded-Encrypted: i=1; AJvYcCXBWHxe2HnMH9YdGRGCbNimSjj6p1vlPRsudHmzIe9kHB1WLRMuz3Oa4O4azyBfcdmtTyqINEMc+0rAV4hrpSf1@lists.infradead.org
X-Gm-Message-State: AOJu0YxF+ojqFS7U2p7SLOIBnOTrGTRY1ASoX8HjY500Ji7ZHnxTotwa
	qLolNNiN8AWXR/3Z4TbWV5zZm4omYkA05jMrtDawhIt1p450ZX8E+CjT
X-Gm-Gg: ASbGncvb7nOY8JGxgfTGjHspQwsYGDQa0NDbPEZ3mAsUDR/qALaF7aIGSXZeYGpI1s7
	tLIut+R6aeAeV0QdUDeiM4gMYSTWUGGO+fGEABz2nwaZ31KQpvmzdWH62mm4hwYvmKlx580d0CZ
	kes/fHw3PlYrdNSrb4UMtw5t9v9c4zeQB5FYwKgNBLbX6qEseLY7TeT3azfL22ewqQr0V4EBBNj
	0MhDn9wejQXQb7nrlvKcNZLH8QHUMqgW4JHBAkMMVilHeWC1gXjN93/xBV7t6DlP85ygkNJKIu7
	Yy7Lee6JeC85JT2Vlwe2Kt+QhPtUj3Kp2Oo3jPqouELn79GmBr6UI5O275sqS6bSKcv9QxnnPRn
	LPF1dsFvAhZy5lsDYJ2iez4IIAdfSyz4qCfVYkogJz+V+UP0dOc0AmdIT4D87hknjygy+j/VYxw
	8=
X-Google-Smtp-Source: AGHT+IHaS05eV6o8vv06se/fDbSOemG5P7tT7lHJSRm7a5+F+76GtfyNY3WoBVTNDjM4ynNXLyA3xw==
X-Received: by 2002:a17:903:15cf:b0:234:c549:da0e with SMTP id d9443c01a7336-23fb3129f72mr148697115ad.47.1753682187515;
        Sun, 27 Jul 2025 22:56:27 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe514b59sm45091795ad.128.2025.07.27.22.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 22:56:27 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v4 03/13] ARM: dts: aspeed: Fix DTB warnings in ast2600-facebook-netbmc-common.dtsi
Date: Sun, 27 Jul 2025 22:56:05 -0700
Message-ID: <20250728055618.61616-4-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250728055618.61616-1-rentao.bupt@gmail.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_225628_426456_390B13DB 
X-CRM114-Status: GOOD (  12.12  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Fix deprecated spi-gpio properties in ast2600-facebook-netbmc-common.dtsi.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v4:
  - None.
Changes in v3:
  - None.
Changes in v2:
  - None (the patch is introduced in v2).

 .../dts/aspeed/ast2600-facebook-netbmc-common.dtsi     | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
index 00e5887c926f..208cf6567ed4 100644
--- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
@@ -31,9 +31,13 @@ spi_gpio: spi {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
-		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
-		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+		/*
+		 * chipselect pins are defined in platform .dts files
+		 * separately.
+		 */
+		sck-gpios = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
 
 		tpm@0 {
 			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
-- 
2.47.3


