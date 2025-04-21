Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA586C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 10:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rok2Mg43bnfRB9cqUAfce4PsDdZdAouW+RpiAparFCo=; b=uMKcE2MHFStXz4MfGDvFByc1Cl
	GpHnHfFZ6YeByC34f1x7rPNICXZntajZ4JOobg/wieu30lzN3HNBo686e2/fYOplzsr84tpTMbS3G
	E47UKuWgNamnG6+99IEdHjBP/PkNz1MbZH3+uElIiWaBDut/AGx/AeaPEkbr9sDpBK8+CFmLU7ijR
	PP5MX1OKRW/A/xnFezLR0TQYwBZSGHoZjU4A0/8YqjAJElokmsHE3Wb6H+LpG9Rkv/G1QaYoXzXAL
	WU8jb9UVttqk/uk8riiSqk+7uTH8vXKwsMYOO4lzFgh98r1xTjA5X3Qu1rYvA2UMUW7BYXcCHX4wu
	oVI9XTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oKF-000000045V1-1AqA;
	Mon, 21 Apr 2025 10:24:31 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o9S-0000000449G-086S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 10:13:24 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b0da25f5216so2374804a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230401; x=1745835201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rok2Mg43bnfRB9cqUAfce4PsDdZdAouW+RpiAparFCo=;
        b=A0J86toPAtYphkfdfSIplSzjcUfJM9J/lOAUBBGICaNAU+amV0pP86RQk0kFRbOqai
         SM/jWl3oRPBrPmf5UsgU/tKOYfQONT5OE4sh+ORxnNb+s/+EaWRIWTAGjPmznC6QI2YZ
         O/q8u/J288aS46uZ93K1W9AFvrdHRWZlvn2g8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230401; x=1745835201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rok2Mg43bnfRB9cqUAfce4PsDdZdAouW+RpiAparFCo=;
        b=exc3nEb8Otl/LjvwaQ1mm457RIrhIAUgdEj5j/CkcEDAN1YdbRB5C92qyXZpwIQ24L
         e8v1oQvScU0kHwXDFCSm5NFgg+sOVUCyFVlmIc+50EXADh9pdOwO9ujKcIJ16/GRSLOz
         pTPcjDunRv5tItcXYlgPCVeZg2218yYEAUNIFIE0/0bCWoc1xc5oeVunTYoxEfRV5+uu
         4NHeew+BalSZtnhKzjWS99iVWDz0ETCwg/5qMDF/ubfbqyXq/btg+601nfnDXgwQXwCC
         C2WyaFex1x/sZsJGGPtZGbW3etJxLKLt5mE+/zylBbDwDFex/oJCRYYzh5B6vvQSJQlC
         z49A==
X-Forwarded-Encrypted: i=1; AJvYcCWg6p2kUmJrb0DDS9/ayxcQRaFGYyOIaGaOsDr0RsWQvIyBngWoNuni+03Mn5xO4ATPOZ1AXPhgbJnRs2aBlBMz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3t1LDnWjfjbZ8JdLYapY/Wjkp+4ZZYxtd6hsFnrRJDbS0ohBd
	DNCZS10aNo9xABMCVQhTfVXEZfaj8c05E3i5nob3oPVGxOFJwVzR2Am999SLMQ==
X-Gm-Gg: ASbGncvMI1VTMeddXAtT0kPIHBvBORjimDJZgrFU/kCMuU+mPL/SmwBl1cM6rztNeOR
	wVhlN/XWZO3EcYVbZOy31dmi4R7nrMMqKZkCYLjKmnSk1rU3TFFgt29CeZBVWlgkbmEojs0TSMR
	/8HdgKkjP1Yax0XmxN8jQUHeRFq9oPnjPZR6Gp7wQBabNyA8q+euin38vQ9Vt1IEdvK/zH5F1Uz
	pDj46lFUoHrgDkQOMJ8+Vw+bwJkSF8EzPja0DrM9QPkL35CZWWAGdffO9+f/8B2tmYW+LrEGTvc
	ri0Ygd4iIxZySgKcga0u9T9EOiPCzdBubfgxfj/DNQRmDLJ3vYeJER2fylk=
X-Google-Smtp-Source: AGHT+IHzGqLnsYoPPrUzas9aFIuhG2tfwpqW1sujdJRkCyGS/gKycIu8sZyY4IdNUXVMBMKhKzW5aQ==
X-Received: by 2002:a17:90b:4ad0:b0:2fe:a742:51b0 with SMTP id 98e67ed59e1d1-3087bcc8fcbmr14175251a91.31.1745230401151;
        Mon, 21 Apr 2025 03:13:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 5/8] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
Date: Mon, 21 Apr 2025 18:12:43 +0800
Message-ID: <20250421101248.426929-6-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031322_152847_03ED6C07 
X-CRM114-Status: GOOD (  15.60  )
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

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate device trees.

Merge the two device trees together and simplify the compatible string
list. The dtsi is still kept separate since there is an incoming device
that shares the same design, but with slightly difference components.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile               |  3 +--
 .../mediatek/mt8186-corsola-voltorb-sku589824.dts   | 13 -------------
 ...orb-sku589825.dts => mt8186-corsola-voltorb.dts} |  5 ++---
 3 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 58484e830063..ff67931e7821 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -73,8 +73,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327683.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262144.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262148.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589824.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589825.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku0.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
deleted file mode 100644
index d16834eec87a..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2022 Google LLC
- */
-
-/dts-v1/;
-#include "mt8186-corsola-voltorb.dtsi"
-
-/ {
-	model = "Google Voltorb sku589824 board";
-	compatible = "google,voltorb-sku589824", "google,voltorb",
-		     "mediatek,mt8186";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
similarity index 76%
rename from arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
rename to arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
index 45e57f7706cc..cc805408a8b7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
@@ -7,9 +7,8 @@
 #include "mt8186-corsola-voltorb.dtsi"
 
 / {
-	model = "Google Voltorb sku589825 board";
-	compatible = "google,voltorb-sku589825", "google,voltorb",
-		     "mediatek,mt8186";
+	model = "Google Voltorb board";
+	compatible = "google,voltorb", "mediatek,mt8186";
 };
 
 &i2c1 {
-- 
2.49.0.805.g082f7c87e0-goog


