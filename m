Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD54FD339A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fkTku/2hlfLuFEUEbfmaTEX5P1Wden2mB6YLijG1sA=; b=n9jWMWI8OmJcQo7wZNAmBY3tWC
	LtnTuKZReUHtDcID+9TuTRTT4fTgOpkW748VNcAQov9UMobBcPh4EQWg/6RgHmuZ9DpQ9zS/Di+zD
	GL5yB/Wrq7Uwf7iiyuuCpqYqpXMQF9ACZ72r4K1eDYk5iIvcyfhi5c+CDos7+U/VEBG5V38Iw1OBf
	yko2ciP/KwrBbkJCX5hL4qh1XQo83C7m+T5ACAp00xJOIXrQG8NJ39QfCHI+jJ5pPn91b8EeLgSgq
	ynmEkmWhlOV060z1YrRh99URdhJ+f4QUgdZRuXvnviB3BwWMdRUVPiwY3giL+c8j+BMiAkqEmh29y
	fl9UEDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TUw-0000000BeFj-0ZgT;
	Mon, 28 Oct 2024 17:25:46 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TOd-0000000BdUU-0Voh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:19:16 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so60869595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 10:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730135954; x=1730740754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fkTku/2hlfLuFEUEbfmaTEX5P1Wden2mB6YLijG1sA=;
        b=GMkIrOKI28ctAjiKBqYVoSu8ko777jLOti8Y8l7Vt5kiap6ueIPw6mMWb++AkOMJGS
         duAK8TBdswduVJoz8buNGKxBAlU8+9sGy/Uc4MBvRclFAYxwFyz955IEFLO39901C6At
         ht8EIxOTvT5Ez61PWOmA2Xi+bGF6X1FkcAQstAEsQ7DBGrhhy470w3NeDEGWZQ1dxw16
         wZVqRDo9e0vOP4zXsQRFo/YBa2DYDnHSlXS6f8LnhJHR4T5a7/T0G0TEjjLIcTE9Oihz
         23df5+mH/KhRddvYIPnjDr6WDDUACV7n71ZNv1ASfHkCSyo50tuktq8HM2Fj9KgVjJZW
         b9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730135954; x=1730740754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fkTku/2hlfLuFEUEbfmaTEX5P1Wden2mB6YLijG1sA=;
        b=jdULsfIQSyxbZ1MrmAjpFxp96oiyZtUWofXbsXf+MivXSU5vHDRwve9VCbmpZ8YNeJ
         7y+9Z8knyaSDnsWSDsvh6Mo+bfFjGI4LZmlPXx+JGi5q6fJUnDyLEd2g2/R8d7sYzmv/
         0qCJVikQi0fEAvLbI/3LMfCZiFuwY/mFC6lDDyKWL7ZHhOy1ApRNSYS/+ToNrxajLBXe
         nIwXLw/00NfCSh5W52JdujLkvXBTUjAeqqthzLnoAvi8ogA/y/Ye9sFU8eoAM91ikyI6
         6Qavp5/EoaCHCAgs8/eokblIqz/RqxKoIt/nWq1ypk607ZVsVD1fMgUZPwm8D1VBCwNC
         p5HA==
X-Forwarded-Encrypted: i=1; AJvYcCUAX2bW6WkUj0foPAMa8FROHckLm7vaI8xoU9KHuW4YBCsfI1ZhKn9kAME31XyJgoYcZE+nCiq0yTETGyIaXM+O@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Ds9aDcLLHGHa+Vl8sZHnfBR5E0Ko/w+KYgdz2tOMCc6IyNLr
	6a2vz340W/AwbZhOe40YyLlRPA8syxMQwIfCHV4+9lNUvCtleEbskfvTs9Ju0Hx+kXCHKfO/ZNF
	C
X-Google-Smtp-Source: AGHT+IECm76pRbyYpp6SjkcMtCuO1SyMDPfHW0X9U1Tuvf/svqN92ChLfU5gRa1/AIweI4/7e+k+4A==
X-Received: by 2002:a05:600c:1e03:b0:431:555d:e184 with SMTP id 5b1f17b1804b1-4319ad06917mr98125275e9.25.1730135952130;
        Mon, 28 Oct 2024 10:19:12 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1c8a9sm10096153f8f.12.2024.10.28.10.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:19:11 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wenst@chromium.org,
	rafael@kernel.org
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] thermal/of: support thermal zones w/o trips subnode
Date: Mon, 28 Oct 2024 18:19:01 +0100
Message-ID: <20241028171901.2484882-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018073139.1268995-1-wenst@chromium.org>
References: <20241018073139.1268995-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_101915_198041_6423C1CD 
X-CRM114-Status: GOOD (  14.52  )
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

From: Icenowy Zheng <uwu@icenowy.me>

Although the current device tree binding of thermal zones require the
trips subnode, the binding in kernel v5.15 does not require it, and many
device trees shipped with the kernel, for example,
allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64, still
comply to the old binding and contain no trips subnode.

Allow the code to successfully register thermal zones w/o trips subnode
for DT binding compatibility now.

Furtherly, the inconsistency between DTs and bindings should be resolved
by either adding empty trips subnode or dropping the trips subnode
requirement.

Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
[wenst@chromium.org: Reworked logic and kernel log messages]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>
Link: https://lore.kernel.org/r/20241018073139.1268995-1-wenst@chromium.org
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/thermal_of.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index a4caf7899f8e..07e09897165f 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -99,18 +99,15 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 	struct device_node *trips;
 	int ret, count;
 
+	*ntrips = 0;
+	
 	trips = of_get_child_by_name(np, "trips");
-	if (!trips) {
-		pr_err("Failed to find 'trips' node\n");
-		return ERR_PTR(-EINVAL);
-	}
+	if (!trips)
+		return NULL;
 
 	count = of_get_child_count(trips);
-	if (!count) {
-		pr_err("No trip point defined\n");
-		ret = -EINVAL;
-		goto out_of_node_put;
-	}
+	if (!count)
+		return NULL;
 
 	tt = kzalloc(sizeof(*tt) * count, GFP_KERNEL);
 	if (!tt) {
@@ -133,7 +130,6 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 
 out_kfree:
 	kfree(tt);
-	*ntrips = 0;
 out_of_node_put:
 	of_node_put(trips);
 
@@ -401,11 +397,14 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 
 	trips = thermal_of_trips_init(np, &ntrips);
 	if (IS_ERR(trips)) {
-		pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
+		pr_err("Failed to parse trip points for %pOFn id=%d\n", sensor, id);
 		ret = PTR_ERR(trips);
 		goto out_of_node_put;
 	}
 
+	if (!trips)
+		pr_info("No trip points found for %pOFn id=%d\n", sensor, id);
+
 	ret = thermal_of_monitor_init(np, &delay, &pdelay);
 	if (ret) {
 		pr_err("Failed to initialize monitoring delays from %pOFn\n", np);
-- 
2.43.0


