Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A9EC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NGJ5rqBC7WbitGDnZ0mNGgmapTnH34KgA6S43fvjY00=; b=fO3UYdGtcTCsIwnrcW1Pu6nwzS
	JumBxDLHOSPTbwt0mLE4swTWOegcIaEi6PXxE0PvEDJiiYdIc+5DXKrrNtJ48Ag53OwlzwEEjjAx5
	ulIbn1gBosW0jsS7hbKL9L+NdwDqc+PufMVOZ3MoAtHPE/DVuXwYVgKBPYFNrAwPBvNYlohVqgiOt
	9qeWlqeSFuIOg9J5nakkYxvt/VTBwI3/+7MYfQuLznsW7dVymEA/B11jX17E72WQwFnXipFtwGgPX
	99/xi1SiX59KHHrUxWrwTcBmqWcAAr434D9YwB2wNIjTzdiVIrS4psU1PemfLIQCABA8cTmKUGsdL
	6QiXBNLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGh8F-00000007IZF-4BZV;
	Sun, 18 May 2025 16:45:00 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGh4n-00000007IJP-0ySi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 16:41:26 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b1f7357b5b6so2334291a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747586484; x=1748191284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NGJ5rqBC7WbitGDnZ0mNGgmapTnH34KgA6S43fvjY00=;
        b=ZUEL5L93DQVtfmo1a5qq8azsRja742J523rp6AU97FLtw7JARUwVxVDkk0aiVAe33B
         s+bCsYUThqHPCRMFt07jzmp80YBI2AVNTpkeatqw3tBPMNw43Hks6uGTQsUVGfeP0/TG
         dw0CQNlzsJpINrmu9DU36OjMpVaZeMzk2tnlEbO/R3757fdoq5qvK0Pog1cQa5DlC3DC
         mCV7ntcANzis5is7SxElYh8iPevWBp3cz5kDARMAV1xJVJn0PgpGRtuKcvXC/+0lTOBA
         +Xsd7aiabnMINaGb9WtHTkaEbmnxJxEnzGjjxY7LgWVbIMs9BNOMcD+guWfJfg1k6VG1
         79CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586484; x=1748191284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGJ5rqBC7WbitGDnZ0mNGgmapTnH34KgA6S43fvjY00=;
        b=Wvd2UnZ7EQIK+uzBp4wZTssMwWXWM6rdwQbGMmHfub+LJ9a5VvMMKR4ET/W4RaPJwX
         oFXhtRb/eP5gNJ1ESg8DZffWU32IJ/2FEXrfovOiCUkC8vWl+UA66SUxk8ak6QZCHizI
         PhEAheSCVjOZw17ndHTQYLaIGyUt6OJHNpEEqbbEPpYfCyrIHUJqjc2zAmDjVlPHjw+P
         WuCBr1Ezj9aaoF8eH41ato/9HdRudQc1r4QEblT1LCNDQfR3tlysjERe6fqpRAH5r9+x
         6ZkGCtcKnzzJBal6scOl/aRkU3HKgwfMQ3ecJEhPZyjkslcLZwsIrD7a7Aoy1eCVPShK
         b/Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUSOjAPHJv4Xdp2y5srIBl6SMwppsQQqRMiEgQ2zxO9hjt0ceLRtQGE+iEzPx0EJ+WkmdPMoXsSGs5o0TJr/C5+@lists.infradead.org
X-Gm-Message-State: AOJu0YxVL7WxgrteC3UBV57uX9RQoz72V7s8zhuc0EJoLhFuzbj/nuSL
	ZA1wVzQOYFCTloHRaxmM5ByUrlxdYIxbwFBp7PZ+X/QL6ZBGB+F9FSGV
X-Gm-Gg: ASbGncttW9K9/soRFBIJ0JfsloP72OZq0u3G73rooOlPTQmvK/086uBK7vjjquhMxg9
	w2RKvYc5VvyNfEJIcvbzzl38MhmaK0zZSElqCCIilZQ/iRjB5fjXC3aj7dFnIKJdTjmmRXQAEZD
	y6oDnQrjyUj4u2E8CUtWlPHtmmGN3xS2pgVKMnghox/5pKSHM44el+QUSPe1+Sc+nTtYyZIk/J4
	71/J2KkUtd+PPuD15gn9ajfWj1qCIBrvhYaTWG3fo8rFD/j3GQpUeSiEq0Re3CAKNdXB24b/8em
	wJx3YkV7T85v+XeSnZ1IinCFhl6Nm5VXmCzIgqUL2mDUQ02bTKkYajogmhBbnmvK
X-Google-Smtp-Source: AGHT+IGpcmzbvOjTwEWfKyz0NR5r88tR69+PRwvb3xEu4Qb74Qw2Id1qqyBUkxPFhlZZvE6xhqzJgQ==
X-Received: by 2002:a17:903:2582:b0:232:1daf:6f06 with SMTP id d9443c01a7336-2321daf701fmr31313455ad.47.1747586483869;
        Sun, 18 May 2025 09:41:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231e2118b07sm42255275ad.43.2025.05.18.09.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 09:41:23 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] ARM: integrator: Fix early initialization
Date: Sun, 18 May 2025 09:41:18 -0700
Message-ID: <20250518164118.3859567-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_094125_286956_16B8FF1B 
X-CRM114-Status: GOOD (  19.40  )
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

Starting with commit bdb249fce9ad4 ("ARM: integrator: read counter using
syscon/regmap"), intcp_init_early calls syscon_regmap_lookup_by_compatible
which in turn calls of_syscon_register. This function allocates memory.
Since the memory management code has not been initialized at that time,
the call always fails. It either returns -ENOMEM or crashes as follows.

Unable to handle kernel NULL pointer dereference at virtual address 0000000c when read
[0000000c] *pgd=00000000
Internal error: Oops: 5 [#1] ARM
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc5-00026-g5fcc9bf84ee5 #1 PREEMPT
Hardware name: ARM Integrator/CP (Device Tree)
PC is at __kmalloc_cache_noprof+0xec/0x39c
LR is at __kmalloc_cache_noprof+0x34/0x39c
...
Call trace:
 __kmalloc_cache_noprof from of_syscon_register+0x7c/0x310
 of_syscon_register from device_node_get_regmap+0xa4/0xb0
 device_node_get_regmap from intcp_init_early+0xc/0x40
 intcp_init_early from start_kernel+0x60/0x688
 start_kernel from 0x0

The crash is seen due to a dereferenced pointer which is not supposed to be
NULL but is NULL if the memory management subsystem has not been
initialized. The crash is not seen with all versions of gcc. Some versions
such as gcc 9.x apparently do not dereference the pointer, presumably if
tracing is disabled. The problem has been reproduced with gcc 10.x, 11.x,
and 13.x. Either case, if the crash is not seen, the call to
syscon_regmap_lookup_by_compatible returns -ENOMEM, and
sched_clock_register is never called.

Fix the problem by moving the early initialization code into the standard
machine initialization code.

Fixes: bdb249fce9ad4 ("ARM: integrator: read counter using syscon/regmap")
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/arm/mach-versatile/integrator_cp.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-versatile/integrator_cp.c b/arch/arm/mach-versatile/integrator_cp.c
index 2ed4ded56b3f..03dfb5f720b7 100644
--- a/arch/arm/mach-versatile/integrator_cp.c
+++ b/arch/arm/mach-versatile/integrator_cp.c
@@ -86,14 +86,6 @@ static u64 notrace intcp_read_sched_clock(void)
 	return val;
 }
 
-static void __init intcp_init_early(void)
-{
-	cm_map = syscon_regmap_lookup_by_compatible("arm,core-module-integrator");
-	if (IS_ERR(cm_map))
-		return;
-	sched_clock_register(intcp_read_sched_clock, 32, 24000000);
-}
-
 static void __init intcp_init_irq_of(void)
 {
 	cm_init();
@@ -119,6 +111,10 @@ static void __init intcp_init_of(void)
 {
 	struct device_node *cpcon;
 
+	cm_map = syscon_regmap_lookup_by_compatible("arm,core-module-integrator");
+	if (!IS_ERR(cm_map))
+		sched_clock_register(intcp_read_sched_clock, 32, 24000000);
+
 	cpcon = of_find_matching_node(NULL, intcp_syscon_match);
 	if (!cpcon)
 		return;
@@ -138,7 +134,6 @@ static const char * intcp_dt_board_compat[] = {
 DT_MACHINE_START(INTEGRATOR_CP_DT, "ARM Integrator/CP (Device Tree)")
 	.reserve	= integrator_reserve,
 	.map_io		= intcp_map_io,
-	.init_early	= intcp_init_early,
 	.init_irq	= intcp_init_irq_of,
 	.init_machine	= intcp_init_of,
 	.dt_compat      = intcp_dt_board_compat,
-- 
2.45.2


