Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49B0C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 08:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=exM5WeQf7V88qX4aXEQgDj3AKfapiBe/11rzDjhEwBc=; b=O60ADSoovGS2N/QkLaZRAjamkX
	SRs3xi1UyxEa30kLIgqohzWWuIrJinPpS0k2fc/OH2WPp0vfCqvAmZgVbrD4LN4CZ7PiALvvYRRZm
	nA9BLEi+9K/+f62v1lXQ0dwmcy0J1H54tofo7SMrigW4RodVYkX999Ax1DKslF8/GlS/BYuFIiCZe
	z8kAqyLdE4SRwedP5gHHjWAfAlCSz9umASjS9zOZl2yBbcqVohQfZHxl6Jb/AFhtRJYjQjJMhdtu9
	URVuVnrmjsakvoVT1X5BTeHy3ZzcEAfx42jJJHrDNVqE7C+IMs7vEF4mLK7SSdDJ/4c1qxJaB2FA0
	wuTDo41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6vr-0000000AOGA-3ZXJ;
	Thu, 06 Mar 2025 08:50:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6re-0000000ANef-1Wqs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 08:45:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43bcf9612f4so2940115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 00:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741250756; x=1741855556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=exM5WeQf7V88qX4aXEQgDj3AKfapiBe/11rzDjhEwBc=;
        b=ylPVirzKYl3TNJSps4mD8gBkWvlrFC8iaVe5Y22xkQqiezHA0/xdSx9O7n3B+69ug7
         I/hz7oIwjNyGK2sIzaTI3mkDamCHyhNUhZhqpjF8pCVJsbDrWwFAXitipw0YIhWBcSay
         dMPUWshJq8CmX9xNnPC05SzgOiBbbqnA15hAcmxwOcwNsCECwczc7bvWg7FOSGAKjIqi
         4HS7sZkZINQTiXbgFpIXyvk5ZIre0ukwsMgZqKwsYb2KVUIf7eqZ+dAksQ6b85hZS/TR
         H2e9F0tGz2y+6rrWFUyVFMDATrU5YqDQzWdM5zEOaeJI8dBm03TToNxsX6FNug8Y84h0
         /IgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741250756; x=1741855556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exM5WeQf7V88qX4aXEQgDj3AKfapiBe/11rzDjhEwBc=;
        b=CarruKpMSKnoNfBKXZrjx+r8mlgBMxWEzjs355ClA5tgOi69f1ydqbM1bZYQZqwDgl
         TJO+mugYtbXvFkoOfqlk3PFIOeIGJDWPIQc7F4UH0lVR44te0BdjE6SmScRROYlwGuxa
         Df/NmNz9CUCRsHWE4g86ew2GVhpA4Wsz8HbOCrULHd8VHT9p0koomE9ysuIAyWbMmlO6
         1L7S2hnkV34pYTTqWgD/tb/6Xc70WxdvMbLMU4eMGGwX47g9nYybpsO6oNSjTTWMxN0Q
         8r7Grfal/aZP1Onqyy6PKsg+Q8gazogIhT3idf/E8/TSqXXCb/2eBfFh4T3WCz7IQqJ4
         DgoA==
X-Gm-Message-State: AOJu0YxUUp4L1GVaxz55wjDt4enXANNh8KJUz1DVr4ElqswEiRoBgi/B
	4By5+Q2eRJGV0LsV0gpfHpGTrXIzLhuIBM2dBTk0pjpkfJFJ2D+54pjL9nnI+2I=
X-Gm-Gg: ASbGncvL25MJUgsRunPZyrkcVyge1C7plX0WV5J/q/JgDfhdYUCUl72ZlDIVSXpXhGF
	x3R7jE7ntysoBGNlObka+RHup4o8LzHpfD0F+gPiCyiDhKs2nD6PAIHC2HmPCuinFPPEl4UKBgO
	YlP68b+rgozoqR2dqZSM0/rUAvUKXKEUdDR2qznn6r8RLQ8iSHC/0pnJ13TbxUIeWca1XGEom1m
	ITS6jSlSiqvNX8pyQP88kudYfovHglKg3tgKbEoTRoeHzCupuKLyJxl6I/C3UUoKO+5M9nUR35f
	sUwJFJkm9w4Z0lmhj75P8RmQdtRHNCnBEarUOrBk9fg=
X-Google-Smtp-Source: AGHT+IHDs91S0oaws6PWoor39yct8o1C0NI6ivNX/zDIW11OE8J6I3CdTUAnY4C9EKwnKsz0wC36kw==
X-Received: by 2002:a05:600c:450a:b0:439:9a43:dd62 with SMTP id 5b1f17b1804b1-43bd2ae5de9mr46019805e9.24.1741250756015;
        Thu, 06 Mar 2025 00:45:56 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ce13:b3e4:d0d:c6a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8dbb2fsm12631655e9.20.2025.03.06.00.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 00:45:55 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] irqchip: davinci: remove leftover header
Date: Thu,  6 Mar 2025 09:45:52 +0100
Message-ID: <20250306084552.15894-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_004558_409123_1F17BEA1 
X-CRM114-Status: GOOD (  12.30  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Commit fa8dede4d0a0 ("irqchip: remove davinci aintc driver") removed the
davinci aintc driver but left behind the associated header. Remove it
now.

Fixes: fa8dede4d0a0 ("irqchip: remove davinci aintc driver")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/irqchip/irq-davinci-aintc.h | 27 -----------------------
 1 file changed, 27 deletions(-)
 delete mode 100644 include/linux/irqchip/irq-davinci-aintc.h

diff --git a/include/linux/irqchip/irq-davinci-aintc.h b/include/linux/irqchip/irq-davinci-aintc.h
deleted file mode 100644
index ea4e087fac98..000000000000
--- a/include/linux/irqchip/irq-davinci-aintc.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2019 Texas Instruments
- */
-
-#ifndef _LINUX_IRQ_DAVINCI_AINTC_
-#define _LINUX_IRQ_DAVINCI_AINTC_
-
-#include <linux/ioport.h>
-
-/**
- * struct davinci_aintc_config - configuration data for davinci-aintc driver.
- *
- * @reg: register range to map
- * @num_irqs: number of HW interrupts supported by the controller
- * @prios: an array of size num_irqs containing priority settings for
- *         each interrupt
- */
-struct davinci_aintc_config {
-	struct resource reg;
-	unsigned int num_irqs;
-	u8 *prios;
-};
-
-void davinci_aintc_init(const struct davinci_aintc_config *config);
-
-#endif /* _LINUX_IRQ_DAVINCI_AINTC_ */
-- 
2.45.2


