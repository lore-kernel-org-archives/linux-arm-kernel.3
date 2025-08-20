Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033ACCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xp70zuJGemGh+mpz8QRBla/5oQc56EUs7B0hph1iaAo=; b=IkWnn1+px2zfJbDfBBss03JvKa
	VyWLEfZxgINNpwztm3AMuNyRyE47zr0+hVR70mVAS4sVXH8JJtVBGxA0looMGMmGpVz6gNb23RTKi
	Wk8BZwYZgy9GNebFVOpX00wT2BiUA1eQr8VM7i0lp2Nlp03PNdLLNxzwzC76uRFTUDM7LLEWcH2Ur
	+b7ewOnboGyCx1Uku5dpR5S2M+oFlR3p99ikurwp+4MTg5IdLs/5suRg6E92Vv4Wi5snqwxvyykmT
	/gv4yYUvb4KZz6c5D9ElKNo7mzK7KfOyQnsgZ8G70f8dZKyzYYH4UXjXnfb1W8WBuXZXfVl5cek+t
	/wHOiUKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoplQ-0000000EtUk-2jX2;
	Wed, 20 Aug 2025 20:50:32 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolaH-0000000ENnV-2s24
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 16:22:46 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3e67df0ed87so218735ab.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 09:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755706964; x=1756311764; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xp70zuJGemGh+mpz8QRBla/5oQc56EUs7B0hph1iaAo=;
        b=wCUdbpG0qE9eoqjIcJrUf1FwSc+wxGKGijYB4PpYTycbFnmSzEx5y621F9SZZNw3gu
         KL2kLQalvlEUgD4pLFlNV10V3EZf+j5hoRBkx/EolkMAyep2R3Z78HznQHkGxYeHB8w/
         N4t1Vq3f9+0qqnzLYXXgXJoDRjTYjzJ31G/PeO5HuQ/qBsthO6GkasDjS8UT3KStcQr1
         geePWTaMGuI5Vzi4H1Tg1z2LZ89cd4r8to+hhge0pplpUrORWfJ4jBEXZS6KP4wz9WJT
         qaLhhs+u2FmU0Q+gCiprYvy15FRKhaFRc7aSVIhVZxqJL1TpnLSMJOu3vGzKrhFKzB37
         Bi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755706964; x=1756311764;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xp70zuJGemGh+mpz8QRBla/5oQc56EUs7B0hph1iaAo=;
        b=PW0wOAdAkVeaNE3RMSVtmiND1kTT2/3gBLNI1FBQVzHQLXk9WZSEEoSV58SvslIoy3
         YUMJdBdW4/ZvzDLGj99Jw+haNuRKWkZo2ozZFG2UjMgrzWL/X1ALwcX2p+gx/Wjbq9xe
         qNf/Bogv6ySSj24Slo+c5wSH2Kl36A8JmgST9ZKtz6YipiMMiUlRCP0/3d4nRRwEnmqw
         o3GQ+4plbiFFh9gjq1zgRj3JmOrIFHO1LSOAfFylIw4F3+nMW0i+u6CMvO8+S8Kx24Uz
         XzS4WECS51s7xmixrTtu2nwNQF67maf3f7LqcHc2r4Bta968s5UQafgP86E7jMz5PASF
         IlzA==
X-Forwarded-Encrypted: i=1; AJvYcCURGUCAYwSgCe4hwgSuiByPvSLGgY00xuy80f1kiMuLO/0MIcjMFtdWy4MEq58aPJ+BFUHoBkCXbz//LVgmcoRO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3zEJPLwqGvwmgXRMFn8N3Pi0er5aNTW9RDeq7k9YOGlUUj26o
	+fQIDMa/u2Uzkttar7ybaA+wqGp4dWNsbcId0LC35Trh69JLCVZjzCiMrbN8lNcSLjJfM6lJZhe
	oIRsjPm9hYQ==
X-Google-Smtp-Source: AGHT+IGsv5qpMpbPMnhvJuzG9XWMKFu3kD7El3S3s+9IMN7sQmHkyA1j8NEArrIUJjtqdjMUoR/Kl3C1mf7+
X-Received: from ilbbm5.prod.google.com ([2002:a05:6e02:3305:b0:3e6:66db:cdf7])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:1a84:b0:3e5:51a0:bcf
 with SMTP id e9e14a558f8ab-3e67ca46ca9mr58572375ab.16.1755706964132; Wed, 20
 Aug 2025 09:22:44 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:22:40 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250820162242.2624752-1-rananta@google.com>
Subject: [PATCH v2 0/2] KVM: arm64: Reschedule as needed when destroying the
 stage-2 page-tables
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_092245_728329_371DD6F6 
X-CRM114-Status: GOOD (  10.83  )
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

Hello,

When destroying a fully-mapped 128G VM abruptly, the following scheduler
warning is observed:

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

The host kernel was running with CONFIG_PREEMPT_NONE=y, and since the
page-table walk operation takes considerable amount of time for a VM
with such a large number of PTEs mapped, the warning is seen.

To mitigate this, split the walk into smaller ranges, by checking for
cond_resched() between each range. Since the path is executed during
VM destruction, after the page-table structure is unlinked from the
KVM MMU, relying on cond_resched_rwlock_write() isn't necessary.

Patch-1 splits the kvm_pgtable_stage2_destroy() function into separate
'walk' and 'free PGD' parts.

Patch-2 leverages the split and performs the walk periodically over
smaller ranges and calls cond_resched() between them.

v2: Thanks, Oliver for the suggestions.
 - Apply the rescheduling to pKVM as well.
 - Use VTCR_EL2_IPA(pgt->mmu->vtcr) to get the full possible range of the VM
   for pKVM.
 - Deference the pgd using rcu_deference_raw() in kvm_pgtable_stage2_destroy_pgd()
   instead of using a null walker.
 - Rename/restructure the functions to avoid duplications.

v1: https://lore.kernel.org/all/20250724235144.2428795-1-rananta@google.com/

Thank you.
Raghavendra

Raghavendra Rao Ananta (2):
  KVM: arm64: Split kvm_pgtable_stage2_destroy()
  KVM: arm64: Reschedule as needed when destroying the stage-2
    page-tables

 arch/arm64/include/asm/kvm_pgtable.h | 30 +++++++++++++++++++++++
 arch/arm64/include/asm/kvm_pkvm.h    |  4 +++-
 arch/arm64/kvm/hyp/pgtable.c         | 25 +++++++++++++++----
 arch/arm64/kvm/mmu.c                 | 36 ++++++++++++++++++++++++++--
 arch/arm64/kvm/pkvm.c                | 11 +++++++--
 5 files changed, 97 insertions(+), 9 deletions(-)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
--
2.51.0.rc2.233.g662b1ed5c5-goog


