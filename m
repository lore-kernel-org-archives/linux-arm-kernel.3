Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB0DC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=; b=rOFRx0lhnMXYkKNJ3E91T0eVdh
	qvSq0ekZgonUQdT8MkjxXhzhDmvhz9W5U03kyrDQUvQiJtLkZZP3QCoX3jB94xEgOz9/dMzeBgFdb
	mlSxa4UEDJrWWE9oQ2g1rFoxIl/9CzkSWXuLddYFCux39J5AsG76NEhTgFTFQ4RwJsxaC/bSvOXiW
	2MmiSnjLyUYctr0KekEn7Ck/Set6uhLT0h4ZwKUe3JzwWY2auDM+Wnm63eQnfDXKvgZtGw/p7dRBj
	+MbtRughL8INGQ4pli/4xwFbvUz7+NCUOYRGTJU6BdAHCGBLQ+cdCuYud8H2MVaHW2fCd67EIOGMC
	TdRz8jbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zZ4-00000009oDt-1U7X;
	Tue, 08 Sep 2026 17:24:58 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zYx-00000009oC8-2Qkz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:24:52 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso181224a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788888290; x=1789493090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=;
        b=odcu9h6q84QpgATjYMhGbCsfKWfspZdpsFsZ/F3H5m0xvwRkNXJlbt58cgBDXYTQO+
         SI6+Ug+CiCe7M2vgSLNAJRaVrStOoobNqzhTtcohCCyikJaEUzlhOVQLEBazw3Afnz8l
         xIYiniMZxBxGTrNBKrAmPaX2EQUN9/c0fdd0Q1+2yPMLfvCuRp1TyLp2X1htJx3oWCfc
         8JGZ6t8HyznLkPEYrkSRkupDgw9/NDcGDe7twC3NYePYOJLEFeyrStKAL3U6xcW4r9wf
         i9zEab43u6hCI9RbKXyRzhSvqCq2cBbAmYFmBybHkb8CmG9g3KmkZxDOyncOWbsdRrZZ
         Pixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888290; x=1789493090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=;
        b=c99QS2J9BTG4zfQx/T7E/YQ9h+AuZZnwBjyx2XlPbyGG3Sy6QoC+ZrqNbnBEJ/3/Em
         ho3G3nwj2BKN3uGJ7Z/t9xW0P1Sjvi48ZPLr3CPTk8svFqrkoH1owfK+0hVWwTKYc/sq
         CyS+19xU0bZ4SBkVY8PndnTnm+lQXTiJf8vr+DXcuZwqStFikg7efMfIMcViq/mBW8fL
         9G/GvIomV6O8YwI5EgLmIdjhe9Gdn/nj1zzR+pBSwcF3VAI1q9PSSPNwycfFY0DGSTsp
         YaazHjnDVUIu734ulbcWds2U+UnnN/WPmTAO2UE/WKz/uRWzZxErXlwT0Wilj/PdYPy+
         hb5w==
X-Forwarded-Encrypted: i=1; AKwUvBwWhNhrcBSXR4YuYu7gjGBp58BhvfG8IGiJiZsPqIGgjgz9odRMRTJhYq3zbgxcZ+fWo4Iw/3e0v3Ojxgh+DgrV@lists.infradead.org
X-Gm-Message-State: AFuF++nD6lFgGFKOWiO/Uzxi/ci7pg2x7vPshVq79WXudpWwYVCQX4uU
	LY92ZnT6Cfb63t4Cm9GUBshH4SEiuNvdmt897rgXp0736VDTISgohy5K
X-Gm-Gg: AYBFou3UY2JSNNDxeFe+OyHS1WBb3YRX+88gjtD+CW1nSpajdNNTd8xEUgcjoemLjJZ
	7kb6zZKlbt3KjCiCBfPMQi1C4c+8l8lrqq4LJ1lN3qZYgKJpK9U0tmHeErj7iSPIy9M/FoEh4LE
	Akqm68GS/AfjLKqER8cPuhS7A/k8KS27FVZYfSiGtA1xNvUecj5owIdsmgzFFy5OmaWqU5mGzli
	7IID1+Ea+CM5D4wf2WUzyAXwNfBZG1rB0YVYePXj2/lW+SukwxxeT1ozUh3lOMzxVa4c8IvIvUs
	bnletGBNnSybT+7+fGIb+sL1NSjrJ28IPA1fvYS4C0I84PHvgGIZgUN8UVmxXDFzCAJJVoPj3kM
	RO6U26NHtshmeWKlK9rEchXj7c6X8LV0StFLyfodZqNN2c0xbGSPrM0QGYokqNPmCbnnQ7lOQ3U
	IJr0rHwkwtNV2YcsVj0rmSRkk5mF3FFqqnhEg0gNvwxmgntWS6x8dytswibh/HUCX7CSHIkw==
X-Received: by 2002:a17:90b:4d84:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39bac138257mr1168410a91.1.1788888290224;
        Tue, 08 Sep 2026 10:24:50 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:43ae:bf76:d99a:e5ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm19297176eec.20.2026.09.08.10.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:24:49 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v4 1/6] iio: adc: bcm_iproc_adc: sort headers alphabetically
Date: Tue,  8 Sep 2026 22:53:54 +0530
Message-ID: <20260908172359.30003-2-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908172359.30003-1-mdshahid03@gmail.com>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_102451_627002_76169345 
X-CRM114-Status: GOOD (  11.60  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Sort the Linux kernel headers alphabetically to improve consistency
and make the include list easier to maintain.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index ab66b97d2f04..e46e3761993a 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -3,14 +3,14 @@
  * Copyright 2016 Broadcom
  */
 
-#include <linux/module.h>
-#include <linux/io.h>
 #include <linux/clk.h>
-#include <linux/mfd/syscon.h>
-#include <linux/regmap.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 #include <linux/iio/iio.h>
 
-- 
2.43.0


