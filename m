Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752E7CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxgL3AzDrrZHKcYrme0egJ79bqapQGokq5EDgAEIJ+c=; b=EEzLw7eaPRMX0JsQVbdW96Wscu
	81MZjG37NsGCz9aX3RDf/7OGtyvuZh+bs+MmRCUYBz/UywiNaNTzSj2mckE0cUlBP7c0z7RK+pH83
	K1vZzKDpvONvqJyS4XuokKsXny/Sj3GB9SfjIAGPbazjRDHvlPuNyjXR72GIFsRCFp/8KjikelZe2
	NIn0L23ibWKvVtPQfboxXdon2E50Nrw/or6lxecI+ulc8sw4nFcaN+jAFsM4ldQSDlC37XSicZRqb
	qj0oC6mkL8dT1DmYwOdAQcF3KBYXGLgissElg6syrDTBM4KrVDsSe7I09M+G2/feGEHAXaZ+heqx6
	49vGee3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoplh-0000000Etoe-2Au4;
	Wed, 20 Aug 2025 20:50:49 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolaN-0000000ENoR-0pcP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 16:22:52 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-30cce5cb529so283290fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 09:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755706969; x=1756311769; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IxgL3AzDrrZHKcYrme0egJ79bqapQGokq5EDgAEIJ+c=;
        b=4FtFa6ILn7i/xzGclJgTvPQ9dJ8P3m7sYsEExftg9XZGv5f7dWR+A11Ku8TacwFHHn
         OVgdZwkOJad7/Es3Vc6dA8uUYXqhKGLJlf/wlTs/m0uk4C0wgAHE2lvU7lllpokdkAVa
         kcQAD/rrQFGVYSyftPzZFQPXo3TIg4kWJgfDGVASp/FBuU+lxB0BufoiXUq0n0F9BAkB
         QBLHSVJjlXTKawdwPoygffszT6lTG4NoNnDOj1UUKyojiGfiZLfeqT36HjiXj2rnI0tb
         uQu8Gji9OfqlQZtFnvm5myu/rCO/OQKlz92reKpYvR2Q7MCspVcR9vb6AduYNwXtHwg8
         fUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755706969; x=1756311769;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxgL3AzDrrZHKcYrme0egJ79bqapQGokq5EDgAEIJ+c=;
        b=i0mgrVZkWJf6RmUrGvmSjCgbnd3WWmy6SD3uMjvA5kpAF179VEgy8Tqept0Z4+A02A
         9rBECzqV6BBd8bdNOEBoVQvKHW9xIAqGwCKQnLLqLS5coboVgKNZbWy11/CdrJEougFB
         2sUJ3c1cYDkVQrYYXAajnReKj/39TyAtR2oynruy/xiXz9JW3ZbShUHujp6qP0PTw1JR
         /zPaXxmIi33F77nKCQlVM5GiHZVLvosG0ORMUjsO5Ri0lF9EHmvnCn9wpWQkp5n+ybSe
         N+Q+6BWpB+NTLPAaQ1tmTKMQ9v+tLDlOyVN0cyPuqyO8PcZSP52pPVomm1VM11cHOTJH
         6KDA==
X-Forwarded-Encrypted: i=1; AJvYcCWcphAs42UKlxXLWN9hSBNr5SbEr+lQFefGAIkPhrHr54oN1NWHKOiUytLjOZOQmrT8HNx8qVlqWHcOTwYyOY6b@lists.infradead.org
X-Gm-Message-State: AOJu0YxB8Fuit7vOt0DujtC61jaYOcwTP4K1B5U4xFBi/REuJzX5ezOs
	8/65Ip9VVwfvJBnMj4LquyDDk7ZO/WOCOZEeDwO7NkzonkhP2voEepG8xKsKfP350ONOLysXCMO
	iRWGxNfLjGw==
X-Google-Smtp-Source: AGHT+IGHN40LChKmW4U+xn4mYc2JbS9gSROkMCaEkVyOWl8ZTwAYUdz9gBc8qFeauFM0HFD3Zo+x0vJsjUGN
X-Received: from oabxe23.prod.google.com ([2002:a05:6870:ce97:b0:29d:f69c:1743])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:687c:2be8:b0:306:9f1d:da2a
 with SMTP id 586e51a60fabf-31122769fd5mr2072917fac.5.1755706969532; Wed, 20
 Aug 2025 09:22:49 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:22:42 +0000
In-Reply-To: <20250820162242.2624752-1-rananta@google.com>
Mime-Version: 1.0
References: <20250820162242.2624752-1-rananta@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250820162242.2624752-3-rananta@google.com>
Subject: [PATCH v2 2/2] KVM: arm64: Reschedule as needed when destroying the
 stage-2 page-tables
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_092251_236492_3FD0E7B5 
X-CRM114-Status: GOOD (  15.98  )
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

When a large VM, specifically one that holds a significant number of PTEs,
gets abruptly destroyed, the following warning is seen during the
page-table walk:

 sched: CPU 0 need_resched set for > 100018840 ns (100 ticks) without schedule
 CPU: 0 UID: 0 PID: 9617 Comm: kvm_page_table_ Tainted: G O 6.16.0-smp-DEV #3 NONE
 Tainted: [O]=OOT_MODULE
 Call trace:
  show_stack+0x20/0x38 (C)
  dump_stack_lvl+0x3c/0xb8
  dump_stack+0x18/0x30
  resched_latency_warn+0x7c/0x88
  sched_tick+0x1c4/0x268
  update_process_times+0xa8/0xd8
  tick_nohz_handler+0xc8/0x168
  __hrtimer_run_queues+0x11c/0x338
  hrtimer_interrupt+0x104/0x308
  arch_timer_handler_phys+0x40/0x58
  handle_percpu_devid_irq+0x8c/0x1b0
  generic_handle_domain_irq+0x48/0x78
  gic_handle_irq+0x1b8/0x408
  call_on_irq_stack+0x24/0x30
  do_interrupt_handler+0x54/0x78
  el1_interrupt+0x44/0x88
  el1h_64_irq_handler+0x18/0x28
  el1h_64_irq+0x84/0x88
  stage2_free_walker+0x30/0xa0 (P)
  __kvm_pgtable_walk+0x11c/0x258
  __kvm_pgtable_walk+0x180/0x258
  __kvm_pgtable_walk+0x180/0x258
  __kvm_pgtable_walk+0x180/0x258
  kvm_pgtable_walk+0xc4/0x140
  kvm_pgtable_stage2_destroy+0x5c/0xf0
  kvm_free_stage2_pgd+0x6c/0xe8
  kvm_uninit_stage2_mmu+0x24/0x48
  kvm_arch_flush_shadow_all+0x80/0xa0
  kvm_mmu_notifier_release+0x38/0x78
  __mmu_notifier_release+0x15c/0x250
  exit_mmap+0x68/0x400
  __mmput+0x38/0x1c8
  mmput+0x30/0x68
  exit_mm+0xd4/0x198
  do_exit+0x1a4/0xb00
  do_group_exit+0x8c/0x120
  get_signal+0x6d4/0x778
  do_signal+0x90/0x718
  do_notify_resume+0x70/0x170
  el0_svc+0x74/0xd8
  el0t_64_sync_handler+0x60/0xc8
  el0t_64_sync+0x1b0/0x1b8

The warning is seen majorly on the host kernels that are configured
not to force-preempt, such as CONFIG_PREEMPT_NONE=y. To avoid this,
instead of walking the entire page-table in one go, split it into
smaller ranges, by checking for cond_resched() between each range.
Since the path is executed during VM destruction, after the
page-table structure is unlinked from the KVM MMU, relying on
cond_resched_rwlock_write() isn't necessary.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Suggested-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/mmu.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index e41fc7bcee24..0d6d42a86126 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -903,11 +903,35 @@ static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
 	return 0;
 }
 
+/*
+ * Assume that @pgt is valid and unlinked from the KVM MMU to free the
+ * page-table without taking the kvm_mmu_lock and without performing any
+ * TLB invalidations.
+ *
+ * Also, the range of addresses can be large enough to cause need_resched
+ * warnings, for instance on CONFIG_PREEMPT_NONE kernels. Hence, invoke
+ * cond_resched() periodically to prevent hogging the CPU for a long time
+ * and schedule something else, if required.
+ */
+static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
+				   phys_addr_t end)
+{
+	u64 next;
+
+	do {
+		next = stage2_range_addr_end(addr, end);
+		KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
+								next - addr);
+		if (next != end)
+			cond_resched();
+	} while (addr = next, addr != end);
+}
+
 static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
 {
 	unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
 
-	KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, 0, BIT(ia_bits));
+	stage2_destroy_range(pgt, 0, BIT(ia_bits));
 	KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
 }
 
-- 
2.51.0.rc2.233.g662b1ed5c5-goog


