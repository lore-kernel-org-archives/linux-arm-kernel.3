Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D4FC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FPZbgiJbb83ig3UORAUcXElGA2dwvm2nNhAABZ7YfkI=; b=HwEsc4/KqRaDvR
	rVThGGYlHhIdhMXHH3tpjVWZwnGzDpY+pTh/7t8b0ty7SPyYgbsMcrFG2WGegRRryR2XhyLgX4HiR
	UL80AG+RZNkjj8qxOsJRvzxFq61KSEDNXeQNi0loDshRcOLwJ99UxNfl+thJ3P+lxQqAYye7FIcIY
	l/uktrby5IzU5h/uRyBgvE722IM/keGbc4iTQg1ez1RnGF1aBV8A7fAvR1pscXpGgoHVCZ518qY1T
	nJhgwEG17UJ9CNSXaLSwBqf4FCydhtLOPL1G1vkM1fWNjLUJ3MfB2VHxu8Q/fmQg0ukFGJMbII3a/
	FvNTXvz6lUlwkPdZkBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEl-0000000Ez6y-3Q4i;
	Fri, 18 Sep 2026 16:14:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEh-0000000Ez3z-0WFq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:14:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DDFDC417CF;
	Fri, 18 Sep 2026 16:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F0C1F000FF;
	Fri, 18 Sep 2026 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748090;
	bh=FPZbgiJbb83ig3UORAUcXElGA2dwvm2nNhAABZ7YfkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vu7rNH92TOdtZLduMK8rLA3uEFDZQDwq8l7LDQGEm82PkkYHhb86gyupURzKebUvF
	 hHvg2fsEhEDNNYqY4eXcbzxU0pCGqEYz5BqAOBtZy4wRH77oZWdhyqngl2tLW2mGlW
	 W1a0NIE0Nv6sARQUcDG5zRLMNqMCQtCyKPl27MJ3NVn0ZRR/NXQs9wj4o+4ew8AdBf
	 WYNbXAGRwW2X7y4W16Hy3ZTZ5LBnZSV5AXsK+qE5zhM/gPWkSZvLINVQDrDuN7TD2F
	 TuLGcL11ABTZf0lw16y0xkD4kyjmTzGi32aappZ4zy99iGnDm83xoSJvVCxI/GsCAE
	 V0PUERIiREpwg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/21] arm64: percpu: Specialise set_my_cpu_offset() for the primary CPU
Date: Fri, 18 Sep 2026 17:13:54 +0100
Message-ID: <20260918161407.2300-11-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

set_my_cpu_offset() is only called from smp_prepare_boot_cpu() which
runs once on the primary CPU and before alternatives have been applied.

Rework the function so that it operates only on the boot CPU offset,
drop the unused alternative code sequence and internalise it into smp.c
alongside its only caller.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/percpu.h | 8 --------
 arch/arm64/kernel/smp.c         | 8 +++++++-
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index b57b2bb00967..3dc7291b16e9 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -12,14 +12,6 @@
 #include <asm/stack_pointer.h>
 #include <asm/sysreg.h>
 
-static inline void set_my_cpu_offset(unsigned long off)
-{
-	asm volatile(ALTERNATIVE("msr tpidr_el1, %0",
-				 "msr tpidr_el2, %0",
-				 ARM64_HAS_VIRT_HOST_EXTN)
-			:: "r" (off) : "memory");
-}
-
 static inline unsigned long __hyp_my_cpu_offset(void)
 {
 	/*
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index a61dc3016a11..702dee8d0db5 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -446,6 +446,12 @@ void __init smp_cpus_done(unsigned int max_cpus)
 	mark_linear_text_alias_ro();
 }
 
+static void __init set_boot_cpu_offset(void)
+{
+	asm volatile("msr tpidr_el1, %0"
+			:: "r" (per_cpu_offset(0)) : "memory");
+}
+
 void __init smp_prepare_boot_cpu(void)
 {
 	/*
@@ -453,7 +459,7 @@ void __init smp_prepare_boot_cpu(void)
 	 * setup_per_cpu_areas(), and CPU0's boot time per-cpu area will be
 	 * freed shortly, so we must move over to the runtime per-cpu area.
 	 */
-	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
+	set_boot_cpu_offset();
 
 	cpuinfo_store_boot_cpu();
 	setup_boot_cpu_features();
-- 
2.55.0.1082.g2b9226bbc0-goog


