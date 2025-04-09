Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000A7C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJ5xfpPt+Udr2klxgQkLdnjiXALVAMMpe1APzqbpdGM=; b=qsIHPNxhLdGHs39OCcSYESdokj
	Fn+OWrTtnUL5IrnQrrlLXmTesYVuFs9eE94+GEfi5WyPWJySpCH4tisQWnLr7tuIWkwT3YzmuNqFs
	AqQzk2nvvuNaVY0JAgWLghMqAM+o0z187d6VTFnqsGFzgO9oA/rM1pR9Q9uUlukEcZtBPDPixs0dK
	avXr8oZx2PuTwtghMHYDSk4CTFWyYyS7KGDkoehQUlvAd2a7HcIPzYBZ+CdUoL8b4rkI0Br29ag/n
	8g2ATfAzQC5xf/K6d+F0Jlkr0m6x47GkKuracRzP8NCu9khLlSqRuSCzc4cF+zvu77zsKBQ95EmQJ
	9J1qYFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ccJ-00000008WkO-2t4e;
	Wed, 09 Apr 2025 21:05:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB2-00000008Sf3-2VKm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Apr 2025 20:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZJ5xfpPt+Udr2klxgQkLdnjiXALVAMMpe1APzqbpdGM=; b=Q1yGHR4m5Z22IdmS8h35THt4ZN
	A3NIWWg+a+3e3d/iBNRGw7cy9xl8XaFgcuoSaHOGFtikPZM8N5JHKeBtX2mQvNNzKcPqIDzA6lxj0
	N3+xPjkhjKI9a/2omepI2ksV/L6KBustUQPSXmEcee4sMdanqCOhE7aVV7IXv5GBYxVp7PFokgbIC
	SWPEeiHLGivnYHSM8nMRAjS8IVMVXFfz/v3GIvf8Pn9n6tM1cSrCXm/UJ/1sDUKOZM81m84loB8x0
	Ij5bge/ZyeWZRHUJ90GUIYEjr3a9eZ7Ei/e1mc+fdn3LBqDWTa8XYhPWMkenc3jMGVekM/n7Tsof9
	K0ilPCeg==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2cAx-00000008gYj-2gqU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:39 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac289147833so19062366b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231052; x=1744835852; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJ5xfpPt+Udr2klxgQkLdnjiXALVAMMpe1APzqbpdGM=;
        b=GqqadKkWZ8Q5Sz9ZvaycpT4lEgSSmLFL5HI3KJoeuklparmYOeuMDmnkYzxIPStziN
         1rryVsMtCr+TAXjnBuEXp80+PcG/3/FE/zLcTvZAtz1mBOUicCdQDpZXsHX0wiERLRNJ
         iDLi6+PN4P3cc5C0fzhR7ZL7CZzbWQAMfybhMRjrebWE7qjDkW9vv9vq28nSL9xmFn3p
         wHRB/xkcV5yIeuzcb1jZw5laCKn94/MgcEgTFVWcU3kaxICVFF1XnXV8J2ciw10zGBj5
         RPZNnFXzdDZOIboF6w9dIOwhyn0Oam5NO4EUjPgDPnOTbZRXQxLFRMCOGOafyok2oyht
         0CJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231052; x=1744835852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ5xfpPt+Udr2klxgQkLdnjiXALVAMMpe1APzqbpdGM=;
        b=AtOBuB1QoPEqFChTXZX2ZOu//dpZ0LqODtcOF6l01P5Vdhg/YgvMHE/k4dpnfccxVe
         n+1YcBlTkViJCfghggpIK1U1SjU8Zwq2MFB5NHLlNBhrpw6P6tyZFdTDwZ8Jz2DHzytB
         kILOw0zyUmxOxTjyM9ZF+F14I2NEW14BVjJLJqeps3GcB9/gY+8gV6+xGhH3D+Rp1gzm
         0qMJCujN5iQ3cgfXrk419p8utX7X25xb7A71dz2FS/dimOQnEDFP5yGZDn2qBgWkFpYP
         CblBe8n5aj/8lrgMBXg3w8caaQeSWEEgHm+uvhVXGFeAsmcfdaU6ZMCP0MEll/JIvdrd
         r8FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWopJfS5Q/FVxW2CGPQq/MvLVHuddiXHbaz87RPPOcQeSzt4m+TgbZIFlibqPYZDfdsRrBism8InIad4/rN4Tzj@lists.infradead.org
X-Gm-Message-State: AOJu0YwErQKBTfimn7GqaacI52CvBsaZwNAeJxkUHK13DzeDBnM8U3em
	h7zcDLf7pSEgSgTsn6esUUbqNdy1eagNam5BmWGpr2nJNLy6wHK+R5JUxbQFuM4=
X-Gm-Gg: ASbGncv4vvX5ZE7kLekQstICyhJxBi537E0Ec8uhQMQhU50L0JQzIXlVJgaAiZraVMU
	Iy1necZnz7pOENfDvXmeChfHU5DK9aJS5rb//QhhpDuPLLvt46GzoO+TpztW1YQhgqKLFM0cxy7
	xhAPNgEq3UOdt8X8b6YtfWPUDnkgtBJc14gZrv4l5CDgb4USy4b/rrM5NxZJh90KOdB00PIq5DI
	DZSPgCsDsHmk9Pal860ORDzTKNEBFYwfbh+7s6YaIM2tCgjrTNhYFzvPHtKl6B++m3221AgpqPK
	3g4evGZmGkPAyEEmRJSHVWmjdhqx7iBvZEWqtOktjrNMH17LDi3EuU6L2mKPOBfkyD0Y1JNoSTM
	xI2+gpTmb0xBaOEZpA79CkkoqQX8=
X-Google-Smtp-Source: AGHT+IHjirWHIybtv9mCOYpNHyYmTU6KD1TdSj+7K0HHxN3o9SAgZZYxV6t8b5P0L2dTzB7k1zUW7w==
X-Received: by 2002:a17:906:f595:b0:ac2:7cf9:71a0 with SMTP id a640c23a62f3a-acabd3bbf77mr8344766b.48.1744231051972;
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:26 +0100
Subject: [PATCH v4 05/32] mfd: sec: Sort includes alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-5-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_213736_355498_68B09457 
X-CRM114-Status: GOOD (  11.79  )
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

Sorting headers alphabetically helps locating duplicates, and makes it
easier to figure out where to insert new headers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 14 +++++++-------
 drivers/mfd/sec-irq.c  |  5 ++---
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 3e9b65c988a7f08bf16d3703004a3d60cfcb1c75..e31b3a6fbc8922e04a8bfcb78c85b6dbaf395e37 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -3,16 +3,10 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/init.h>
 #include <linux/err.h>
-#include <linux/slab.h>
 #include <linux/i2c.h>
-#include <linux/of.h>
+#include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/pm_runtime.h>
-#include <linux/mutex.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
@@ -23,7 +17,13 @@
 #include <linux/mfd/samsung/s2mps15.h>
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 047fc065fcf17f5bde84143d77a46749111ea5b8..5c0d949aa1a20f5538d8baf7a8aefc1160ffa14c 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -6,9 +6,6 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/module.h>
-#include <linux/regmap.h>
-
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
 #include <linux/mfd/samsung/s2mps11.h>
@@ -16,6 +13,8 @@
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s2mpu05.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
 
 static const struct regmap_irq s2mps11_irqs[] = {
 	[S2MPS11_IRQ_PWRONF] = {

-- 
2.49.0.604.gff1f9ca942-goog


