Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630B1CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bafh6Qz+/AR0dvxRSvNKPJVNHyEjLHl83jQu2pz2VaQ=; b=MxWxginxd1Nn5OJNxNof8A+vOE
	ZwbCgMK6l5B6dYy2lUZ5nqgryJfNOOtsUHwU4XE0bb04Hm9mxD4kgO8bxzk4drxRpumQ+OJF1vZIc
	KzHRG3q9l1PmCFhXSg1m5slkKoWPcyX+vx5CtkHO7jvdsWaF5k0NgTMRx6PhyexjgjvHdELstjCjd
	6rd4u74Fj+NJCIcF3f1+aiocIwVLfw7pRgQEx5NRwwPDkoiuYVFsD/neUw9uEx1an84QkZ5xNHzR9
	xMrZ0tbyVhmf/myUugkjY/DhdL77g8U2bTYDucVeVWnsF04u0Uc/5S/D0gvEo1bz6f4etBJYQBMnD
	Dv9BsZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwRx-0000000A9BT-1IVA;
	Mon, 03 Nov 2025 15:26:29 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwRv-0000000A8Y7-03Y6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:26:28 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762183445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bafh6Qz+/AR0dvxRSvNKPJVNHyEjLHl83jQu2pz2VaQ=;
	b=ExtowJG6k8ibWUtu1chzuZs5NfMgy5tLtx5y0m0R4Ub6M15dCtEAVFjRv23Ly1Z7pZp84Z
	xQXT5HVu4vmDD49ewnTlNwDTeQlPymJIQi6UuZ4fBZhNokaCrgOuPC201pPfMf7qrnx3yd
	VCVHRQ6k3es432+8sGlrBOsfesx6qrY=
From: Dawei Li <dawei.li@linux.dev>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com
Subject: [PATCH] arm64: Remove assertion on CONFIG_VMAP_STACK
Date: Mon,  3 Nov 2025 23:23:45 +0800
Message-Id: <20251103152345.175463-1-dawei.li@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_072627_195958_5759ADCE 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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

CONFIG_VMAP_STACK is selected by arm64 arch unconditionly since commit
ef6861b8e6dd ("arm64: Mandate VMAP_STACK").

Remove the redundant assertion and headers.

Signed-off-by: Dawei Li <dawei.li@linux.dev>
---
 arch/arm64/include/asm/vmap_stack.h | 4 ----
 arch/arm64/kernel/sdei.c            | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm64/include/asm/vmap_stack.h b/arch/arm64/include/asm/vmap_stack.h
index 20873099c035..75daee1a07e9 100644
--- a/arch/arm64/include/asm/vmap_stack.h
+++ b/arch/arm64/include/asm/vmap_stack.h
@@ -3,9 +3,7 @@
 #ifndef __ASM_VMAP_STACK_H
 #define __ASM_VMAP_STACK_H
 
-#include <linux/bug.h>
 #include <linux/gfp.h>
-#include <linux/kconfig.h>
 #include <linux/vmalloc.h>
 #include <linux/pgtable.h>
 #include <asm/memory.h>
@@ -19,8 +17,6 @@ static inline unsigned long *arch_alloc_vmap_stack(size_t stack_size, int node)
 {
 	void *p;
 
-	BUILD_BUG_ON(!IS_ENABLED(CONFIG_VMAP_STACK));
-
 	p = __vmalloc_node(stack_size, THREAD_ALIGN, THREADINFO_GFP, node,
 			__builtin_return_address(0));
 	return kasan_reset_tag(p);
diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
index 95169f7b6531..213ac72ce4fd 100644
--- a/arch/arm64/kernel/sdei.c
+++ b/arch/arm64/kernel/sdei.c
@@ -63,8 +63,6 @@ static void free_sdei_stacks(void)
 {
 	int cpu;
 
-	BUILD_BUG_ON(!IS_ENABLED(CONFIG_VMAP_STACK));
-
 	for_each_possible_cpu(cpu) {
 		_free_sdei_stack(&sdei_stack_normal_ptr, cpu);
 		_free_sdei_stack(&sdei_stack_critical_ptr, cpu);
@@ -88,8 +86,6 @@ static int init_sdei_stacks(void)
 	int cpu;
 	int err = 0;
 
-	BUILD_BUG_ON(!IS_ENABLED(CONFIG_VMAP_STACK));
-
 	for_each_possible_cpu(cpu) {
 		err = _init_sdei_stack(&sdei_stack_normal_ptr, cpu);
 		if (err)
-- 
2.25.1


