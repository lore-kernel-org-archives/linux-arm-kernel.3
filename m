Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B4DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOSez2kZNKPIr6/43vKUa8IfzgzZcFJWYi+Gr+NykBo=; b=CEw3Ar3+fKsHOAplVoDY4mVvJJ
	iQ8ZI7opDgCKRPPm4dt2yzZJA9BAp5ksYsBJAPQ9g0bARS2YcznXv1KOqDush37oJN3n9rEidJ5tm
	FcQlhoDVS1tVMqcuMD96N16wcJLooOfi8s+H9PFUuf6GcEk+aGe3GEPTEK5albCp6yXZVqp2pL0Gq
	UcqAHddXjWYRG7CDHyVmrtSaw3AwJ4cAJkhcfJFmCw6+nNaDyxAoZFamjS05rVaBw8X5Y1PVF7Sz6
	ANmxisdLpcLhS90h54krEKs0d3Ftjcr+6AQkWeh6rCx7YaEtK2McDxzVBqsi3lfRvqIr+Y3bVRLSl
	qRufwP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTOF-0000000H4e1-2KpS;
	Sun, 05 Jan 2025 16:22:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTGX-0000000H3Zq-3gCF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 16:14:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso93239175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 08:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093652; x=1736698452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOSez2kZNKPIr6/43vKUa8IfzgzZcFJWYi+Gr+NykBo=;
        b=Zf0Pjxm1gu8TCdrHbDKxTwZ1ioXzh3C5b7C6ONarRg3KGKiZQdoK3f+zlt3HraFB5T
         Lg4FRrtJn2GO0j2h34feIH1nHjz/5V3pt5Sqx+8S8T97ymeLfq8t8i/clp/nHh2+8VLx
         xrSjJNCSyWOgenXNjoA2SWLGLadMIl+gDRr/jiObDsP1YKhmFfwVMmBwySL7p4LGHrqF
         G7hanHrt6tNhesenYgYq+Rlfu9JTYQ94jUL74oZFrVBVQ+pOMsc1QlP0j3hVP8wz2ltA
         dF/MBdezgeQwNTg5h5hvZUXfxJy0mkKEST6mYFXRSg5tM1oC9UMxAQHXOHaer+T4IxWE
         mgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093652; x=1736698452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOSez2kZNKPIr6/43vKUa8IfzgzZcFJWYi+Gr+NykBo=;
        b=ksEP9pxqSnJ8bggOOWmHJqKFe/quIrKXM/Ecsn6jMb8+PzshM/JpTf2bkUZdVZGUmo
         BHblUqJSY8Nt4kxLq078UrfpaO84qJrkccm9soivi5Bxu6TZ7sHrU1XaxnkyoyvK+IDM
         VipK+2qQdGc2jmQkNVJFKOYer0x/R2v+T6LQb9s0KR6qij8gzwXJJa6ZX3fvymF0+ZLY
         tdq9/VXtfRY3wqLyCSqKJDhI+SKjsoojIRk8EGzq/SEmbAtKlai9/tJZgbZiKbjSuZfa
         92SdynDqoDE3vuDGQbgiQWVyC0KlkLBGyG1DGiM5EDwLi+JWGHNSXrgP0rPN359j/KcV
         ErIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOzCfirGNMRQLRuYJjEZbY2PCY5XYn2wmIZkGG+QxdusIcdzK9XP8ArM8CifNQ/My6Ti3NX33jNWKHfBxbPdis@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6rG/UPdwj+ri2CWkzWfWCjgkCUycKmegSpfmpHmJfYTOkmFMv
	k1VjZ5f1SErpeqrRcm4eQSHjoZI/nwrGXyGmxYHmBhb9bRmX6vgw
X-Gm-Gg: ASbGncuoXPq5j5nUh/iF7jPEm1s2+gHdI4NrcL4MT1PY2+cvhKutzb84dwCKGjd5Psx
	2iyHiry2CxLOYxqdvs+K9C6euOplEGywh+BbMthf/WTsk+TDFoFY61fbnaWqgWgwOfaXt4OMCpr
	DRazZeG1Mf9zYyapWjAKt6bvzRx+eSvWxOBFgGVJerHzaZqm+lFp2tMywW0uRQuoKwoUTDRSwxx
	UIido2Rsdksu9Ggu8Q56wyPg146F6moGCLTZ5ue+QjTHF9gyVLgLZvIzRD5qAAOHy6kOr4=
X-Google-Smtp-Source: AGHT+IGGn0UJF9DyGx4oUCveH4zyPEgOigjYmBULy/W6t7z/jQh21cbV2kifxL+XEIbanKLa1PZEkw==
X-Received: by 2002:a05:600c:3b23:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-43668b49950mr412180845e9.25.1736093652049;
        Sun, 05 Jan 2025 08:14:12 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4274csm578250565e9.38.2025.01.05.08.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:14:11 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] arm64: dts: exynos: exynos8895-dreamlte: enable support for the touchscreen
Date: Sun,  5 Jan 2025 18:13:44 +0200
Message-ID: <20250105161344.420749-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_081413_911910_82631DF3 
X-CRM114-Status: GOOD (  13.80  )
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

The Samsung Galaxy S8 uses a Samsung s6sy761 touchscreen over hsi2c23.
Add a node for it in order to allow using the touchscreen as long as
the previous bootloader has enabled the required regulators because
there's no support for PMIC yet.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../boot/dts/exynos/exynos8895-dreamlte.dts   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
index 6c4f8d4a9..61e064af3 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/soc/samsung,exynos-usi.h>
 
 / {
 	model = "Samsung Galaxy S8 (SM-G950F)";
@@ -93,6 +94,33 @@ wink-key {
 			wakeup-source;
 		};
 	};
+
+	/* TODO: Remove once PMIC is implemented  */
+	reg_placeholder: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "reg-placeholder";
+	};
+};
+
+&hsi2c_23 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	touchscreen@48 {
+		compatible = "samsung,s6sy761";
+		reg = <0x48>;
+
+		/* TODO: Update once PMIC is implemented */
+		avdd-supply = <&reg_placeholder>;
+		vdd-supply = <&reg_placeholder>;
+
+		interrupt-parent = <&gpa1>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ts_int>;
+		pinctrl-names = "default";
+	};
 };
 
 &oscclk {
@@ -155,4 +183,16 @@ sd2_cd: sd2-cd-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV4>;
 	};
+
+	ts_int: ts-int-pins {
+		samsung,pins = "gpa1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
+	};
+};
+
+&usi9 {
+	samsung,mode = <USI_MODE_I2C0_1>;
+	status = "okay";
 };
-- 
2.43.0


