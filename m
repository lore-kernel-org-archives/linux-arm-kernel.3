Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E442C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 20:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3vOplXPBv9vPD9lBSm7Gge48LGWl9qyZ2ygjv1+YJc=; b=Yx8qsRypn0iBWP0tPkOzFFjHTW
	SwFWmM7wQxJb7p+R2Y1mHiAHVAFLn0I7o3xskfao9Ecyme+YAgWAXrJzLl/AYqYlADkLCVrAQPUDq
	dZH8T1841naZ9nvGZdE2RnbQZoREsJpOWpApr1O1MLU7/XjhCo3eIbhu7MjggUFlsUmqE820lkuLG
	EGJdKp8HB/Y6rqRxcGey0rVS8wjAAmLUDBwBSCNc3aDReNWKizVy3Pd3UWdeQ/GPicXqTh5eNjXU4
	zFMbiXwXnUmiw+uYcEXBDQQripPm9tDLZa4v41F0XqRW+8Mgt5fMWuIpUjUFIOub1qk56Elz/auaY
	4iKVEXOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjkq8-00000002VyH-22yV;
	Sun, 16 Feb 2025 20:02:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjknL-00000002VUO-1mBP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 19:59:16 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-220d28c215eso50975095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 11:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739735954; x=1740340754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3vOplXPBv9vPD9lBSm7Gge48LGWl9qyZ2ygjv1+YJc=;
        b=Xa67GPUcyUcDwCCoFDA+yKQq3LZGYd3COInnac3I+hhdjz37jWL46XPXBXIoL/Tsmx
         PDq54gTbpoCPUV9aw511iwuI4TjegNZsnb54pvsYEX7zJUuiOIlbcbMZCfM1izP5nTB1
         oXRixbXmeGlaYlMoiTvDj/RD1p9i/ea0oM1m6UfZQojan4LvC58ozsig1UZSMZxnE63f
         D+wIY0Zcuaogalfpl0VUK0JmYJd5pl0UtyqeWn5ujq3DLYjCGjQ9/ci/5O/j+QRXZDvJ
         KLvX7rM3IewaNgow6HDETnRoVmEugVP9ZrR2czll6C91v1hNNvTiPoG0FeNwWSGqn35i
         ptFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739735954; x=1740340754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3vOplXPBv9vPD9lBSm7Gge48LGWl9qyZ2ygjv1+YJc=;
        b=e4NuxK7uZwRdGfhr9fGES12sBZwezvuHEbhokMkB+We0NIOE8OuIz2vdkooceNpMdH
         KEQ4qKECUcxm+LdPZyzAKQmEyiIBMob9UmYxhqpg3BU12Z961BfLYsy2Sg/zNVVHMgNK
         U4ZqlwL1w9wyAFQIKQda9vQB6Oja8SZ84zbKa21Wzbkzm+O9ezaxvsrQgyIEvJEHDDFz
         XnQrsF8NY5Ph9aNcKNiFfJn++4FG7gBXEFGFX1KfLjtGczCGJymk2jtP4uKvaMwWwq0q
         MN9Fo/qvRMWa5RqF2+orF/tEnkjtEQXDB6Le5WjMECNd9V5rqmKpm2PvRR3uHh6mcZ5Y
         0WqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM57ALXqEhp7ISDzhjADvB136dwfe4K94txcei6k9crVqxLjpMBLApe9oUMRd9vyY/RX+KL7BKlFCH6foXgNO6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzju/YlwVOlDQi42vW5JcCRm7z4ZD4uLsfPRyIkY0/yXL2aiHyU
	flj6pAj52bkWOcP+jxf5LbpgMD06mVDRWANjh4Ro6SU4g63p/mnK
X-Gm-Gg: ASbGncsGyQfzyppRhNPMBeDH/eNo8EQ+6KpU9pqtJpVaTclHcgp/eja/XZc62a+yfkp
	WfwVZPdzsuIwDWxLtl6O0P8NKUFIv2fTeip+8URja7KbD9FK79EXIx0EZ/rYfuZPmbI95kuliSR
	mCArG5uiiY3K6p5Br4JLXtJkUUYyTFgxCq34Q8KaIBumEGPlYhCEDOlG96xi+NmE6uZv3+NtOF4
	CNLvWjNjOgxA+din9JSLumd43uoe16C3sVzmx/nVkTtd3ly0uuMNQ+UMrRhGnjVhvPo0q45G1Jz
	/jWFGOo6Y/4GZOqV3sRc9sPFhliy7Q==
X-Google-Smtp-Source: AGHT+IFGbwIDWIhyF8K5CcWFvD31AIlgT3bB8i3xIlYwtNFzuT2rTMPreGlTXLOnQJiYl5U3hxxNmQ==
X-Received: by 2002:a05:6a20:6a1e:b0:1e1:b727:1801 with SMTP id adf61e73a8af0-1ee8cbc1aeamr12185284637.27.1739735954530;
        Sun, 16 Feb 2025 11:59:14 -0800 (PST)
Received: from localhost.localdomain ([110.44.101.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73265098570sm3023559b3a.22.2025.02.16.11.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 11:59:12 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 1/4] drivers/thermal/exynos: Refactor clk_sec initialization inside SOC-specific case
Date: Mon, 17 Feb 2025 01:28:34 +0530
Message-ID: <20250216195850.5352-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216195850.5352-1-linux.amoon@gmail.com>
References: <20250216195850.5352-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_115915_464038_CD29E451 
X-CRM114-Status: GOOD (  16.15  )
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

Refactor the initialization of the clk_sec clock to be inside the
SOC_ARCH_EXYNOS5420_TRIMINFO case. It ensures that the clk_sec clock
is only initialized for the specified SOC and not for other SOCs,
thereby simplifying the code.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: improve the commit message
---
 drivers/thermal/samsung/exynos_tmu.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c5395..9c138772d380 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1040,19 +1040,6 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (IS_ERR(data->clk))
 		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
 
-	data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
-	if (IS_ERR(data->clk_sec)) {
-		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
-			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
-					     "Failed to get triminfo clock\n");
-	} else {
-		ret = clk_prepare(data->clk_sec);
-		if (ret) {
-			dev_err(dev, "Failed to get clock\n");
-			return ret;
-		}
-	}
-
 	ret = clk_prepare(data->clk);
 	if (ret) {
 		dev_err(dev, "Failed to get clock\n");
@@ -1060,6 +1047,19 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	}
 
 	switch (data->soc) {
+	case SOC_ARCH_EXYNOS5420_TRIMINFO:
+		data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
+		if (IS_ERR(data->clk_sec)) {
+			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
+					     "Failed to get triminfo clock\n");
+		} else {
+			ret = clk_prepare(data->clk_sec);
+			if (ret) {
+				dev_err(dev, "Failed to get clock\n");
+				return ret;
+			}
+		}
+	break;
 	case SOC_ARCH_EXYNOS5433:
 	case SOC_ARCH_EXYNOS7:
 		data->sclk = devm_clk_get(dev, "tmu_sclk");
-- 
2.48.1


