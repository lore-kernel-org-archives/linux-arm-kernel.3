Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA24C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 22:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epweE/CfbfJt2xFB7j7q8NZbqQJAbZszVB23uUdGgMg=; b=BXvpjp9+EgCbXCDIEWumdqLzg4
	a3dofkSpvNZJ5et3/YHNa/lfGdD/ZRsnKjSNWuY+wJuzRmbHsbPExHw/iFTxmh9UJfWsWRVB7xvn3
	HWMKfU8Csrj5oagw1OjYwIfEyVgyaYMHiwmXH46qePhp8aH3xsl8DMsylBoXEh70WhsmW+vcZ3CXN
	ZznOEOjseg9hdEDJU/RUW7zojOvp4B1OrCa3a9cf6bhwncaPaip5G7Nuc1FcP2K8QcMbpVfQDGl1M
	qne9yJS100BQQZApSZCBpotTUUHpdy5JiYUPgyo797zJiHVMWEIsYCPSn0U/XDx3w0/RA20PZDzFu
	rcHKEIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twU8Y-00000001rEu-0Mbf;
	Sun, 23 Mar 2025 22:49:46 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTya-00000001p4d-1Rdd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:29 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so677055066b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769567; x=1743374367; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epweE/CfbfJt2xFB7j7q8NZbqQJAbZszVB23uUdGgMg=;
        b=sKCAy+mfTirtJVVxm7yOshTvgbLaXKqFWivwuOlJX+/8uRMQX+o2Vi4N51vTjcrv3w
         cd+E6cwSP8yq/Ni8OvxGtHTOMTUGiKYzk6Qu8+PKdT74shP61uGSiBs9UwnuQdYXx7rW
         CiPnXsCag/z/Fyb3CA7E7I5bagm3lNagHeepYSjzP0vwF9qptzYATbQnxareiSK3PEGG
         q2SDSmFxa1A2zUFXjEEN/4TJqLmrst9m2GtgHkYpK0qZT52jTOTFlFImZVvIj8QMhh6p
         PsvnZzkODZSs3gSuwW5rqSEki1G8tRKRKpIQUF1rxO0qNRBGwk3g4FQ7IF08aIGET+Oj
         N9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769567; x=1743374367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epweE/CfbfJt2xFB7j7q8NZbqQJAbZszVB23uUdGgMg=;
        b=G01anbtxbgJalQ0KvOssi/Q8u10VrEjFldNtg2IUhgDTNuVadxRoq4vuKnTpxy1pLZ
         0UgWOy/vJNKOSnvDNW5y25yRAZj6WI4ACFyhAxqIbf81Hy9wkEH1oVeBmub0AujWnb9P
         qgrUDP9MkKme8X3KA6x2JTcl/40M+Jh96mJA9vsy29xXyFlrEdvRaXOtRxiglA0VgeAx
         haZ3fx/UFSHXfCquyUTm8zO/nRCVLcdyTPrysRCRu8b/G7X6b5sEurRFZanSg8uYkX0R
         IBaStEmzy9URpsV7OG8EGmGyhpMFsvTZrMj/r8bZrtKCh2bFTJUhJ3FL9Pg9x6+pEqgJ
         eouQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCe4r+XxGvHdybmZCTJvAzCgc+F7uI/KdP++zkoukbWgluBG4iHBIPFyLRhJiJFqb4IY9f43tMiSNorhuYF74B@lists.infradead.org
X-Gm-Message-State: AOJu0YxqvDbvg4A2Oew17iYozXc7E7H3qF1Dppva0ZQZYwbj/UuNNLZu
	HPcUtms656wVBg0r6syn4G+KswlDgs52A21ZdCp+rNjnRubbgo044tuljoH7MFM=
X-Gm-Gg: ASbGncvXsmEM2vxCXWGfYeH+rl6qg+RYoxFEQW6qo5FsscGYMJweKcfEbvIC0yUsx35
	J+x4L1NRSR2eRNAWi7F5gVef8NiHXUeZtqXhLe6RmU0lS74GdJkJH0MOIHQm3UfY0bL/c+7y0dN
	Wuikr6mMJ6AnY9wEcPaLs42Q8c04BTRyYYUwbh5CBiHjv8xNzZqdc+CklWIgLnZy7KfNsApi58n
	bsy6eN1w+p7ittxi08J99hh+9o+OYTI1DBJYnVxGJD1EKXpjyuchFdmc2lDmthcZQazxCW72kjQ
	hh8At56o+jm52083YQbnIxYYdwP14Xecnb2ECCWIIGjpK204Q1rPFionRkbCxkgxZevlgRrMFGB
	UjuZsFLzzDHlItT2YBc7UKHCtUR1l
X-Google-Smtp-Source: AGHT+IFxrAKkMvESpg2DzD65IhmLmaroltgGQ5JYq8gpBxP70jAXR5CPVBPl8pc6WMyqqMZfFh61ag==
X-Received: by 2002:a17:907:7f22:b0:ac3:2a54:875d with SMTP id a640c23a62f3a-ac3f251b8a8mr1007451366b.36.1742769566602;
        Sun, 23 Mar 2025 15:39:26 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:26 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:21 +0000
Subject: [PATCH 05/34] mfd: sec: sort includes alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-5-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153928_380048_EBD1F4CA 
X-CRM114-Status: GOOD (  11.52  )
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
2.49.0.395.g12beb8f557-goog


