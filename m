Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B25CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 19:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gITJYuN3t1YHbVZuq58zcmjnVsrSVGV338QgJrJjvGc=; b=0fzv8h5Ct3FCEp2LBvWZCCpc1N
	xMvSV2KMIVeUedkVZ/Rno+AhWKNuRkNHY3IECAsAr7uthjV7Nyd+0+l1t2eODRzSEV6D4sEgQKcBQ
	kLnGMMejkuX5T1/rQN5140mRLoZM3yrg2/Ib+AGG5WuaoXbg4Y8fMf465NbZK1Chg4t5On/Edqg0m
	yXsX7KQTwl3krBQdkIEtWGPWOb4SL3OtMr/PPAqW1O7GGHRpJxvLvWAkNlluC/ZNa+sF98sAYy8Yx
	lSySDqOZd4dpe9Ns55oyno9fUBHMznkJGqUExcLkvIS0JOIbRugE0tQ5+OOcbWVgthsb3hPkf9025
	Ntr2IV5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLF9-0000000HHAu-3PE4;
	Tue, 05 May 2026 19:15:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLF8-0000000HHAY-19OY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 19:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4784460181;
	Tue,  5 May 2026 19:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57CDC2BCB4;
	Tue,  5 May 2026 19:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778008541;
	bh=Ai2OUVAeU1hHFyXkQn4BFPhzJ8Wo1VWlb+jckP5ZuGk=;
	h=From:Date:Subject:To:Cc:From;
	b=ehPDIhQ0fxxCrknzFJcQCy4KB5o367nN82BkcXzxMzhfB1BBlK3oRH+MuM9FR+fFl
	 FjHiBU5t6mlu4G5/KD5QzgiMivOZN5hpRV+DOLhO0+ZRVbyWuOMDYWFflIubgV4j1d
	 82sdETUamD2ofZiZ/7hMnOKrsTKrrB0q3RnURLtpMNh57bAg6e3m6cciSg56Ro/cJG
	 cEako0mCFK0v9kmPzIaLHS/3akgRIIlSRi18Ft6UId+yMgIuM4+8AUx/h/nInvH5nr
	 ic3f1yfvucJqk2T4YJVtZMmod/mZ25yAR4IRK0/WcV5WsnkrwS3SfE92kLx7E87z14
	 3xZUA2XAZ1wag==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 05 May 2026 21:15:37 +0200
Subject: [PATCH] ARM: integrator: Fix early initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-integrator-fixes-v1-1-56ab9aac59db@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LMQqAMAxA0atIZgO1ahGvIg7VxpqlSlpEEO9uc
 Hx8/gOZhCnDWD0gdHHmIymauoJ19ykSclCDNbY3zrTIqVAUXw7BjW/K6Ie260NYvGsM6HYK/UG
 vaX7fD3c3butiAAAA
X-Change-ID: 20250603-integrator-fixes-a8345ddba610
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, 
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
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

From: Guenter Roeck <linux@roeck-us.net>

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
Link: https://lore.kernel.org/20250518164118.3859567-1-linux@roeck-us.net
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi SoC folks, please apply this directly for fixes.
Got stuck on a sideways branch for way too long.
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

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20250603-integrator-fixes-a8345ddba610

Best regards,
--  
Linus Walleij <linusw@kernel.org>


