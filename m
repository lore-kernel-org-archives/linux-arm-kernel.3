Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9EFCD4F2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 05:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ITLN6DrW4j9W1gRe4G0SjKiXKIkSq/9JXCq9e/dhlsU=; b=JOxlR41c5XnC8b5f7lt7zcPypn
	Ko1SF52XwXXAMGxWx5YDw51Yc43R7OU/XCXbAjrfWqYKc/xNB2umS9WmME9EU1LW/3LWu/QVwM989
	lblZWrllXpBUdYBpajWamimBLngkXvyP+xoYQv/qtbPlNogJj+ezNDwaFeFrw6vcK05U5qBd1VcKH
	290YAhSR1GBNYgW4TV3Jl4qxJCHq9KRZEdPBsa2DuLb0RLmRfNSczoxosCPrLZ8t4Ge10PRI9Tzsm
	PnVRLW7aD4r0WgZLXDLpszV2TV9ZPjimGaNyb8+FaGZnk2LhxOduUDdujuY5pJsp0wGwaUpWohFXM
	4GZSUe2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJPpX-00000009urb-46bW;
	Thu, 13 Nov 2025 05:25:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJPpV-00000009urL-47lP
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Nov 2025 05:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ITLN6DrW4j9W1gRe4G0SjKiXKIkSq/9JXCq9e/dhlsU=; b=NZQW57ai9Ndc2R5SySVbnifoMj
	eqiLiDxoGG7Mg0Q2k2CI/w2Rzu/63/bKpgxfbZpsx3VfcB7+rv1BxSVpkOMYsQfnT0K+OCB6ncR+V
	GOuBma2gw3dANYCbMMsY91zOcs7VqW9hafeDxtWgUlvvEB9IIZSSehAZFjbgtaLqgeKlgNm6XsaHR
	Az3ZsPL4MPWAV4rM6daaxtgZYmchsT565gMrP0VnZyJHvg8/YnMVErp0ivlk+rIDWHpl3C7hpgXUQ
	JCRJBD4SV/2AJJj92pefXQaNaJun/0yTLwM1vFqK9squup8fJFqmMhxrjUr8aM6+Zd3ztAIwXDxyj
	ajwVbqiw==;
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJOxk-0000000H4qd-0o2y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 04:29:40 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-433795a17c1so22554075ab.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 21:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763011500; x=1763616300; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ITLN6DrW4j9W1gRe4G0SjKiXKIkSq/9JXCq9e/dhlsU=;
        b=KfqNnku64vzCQKfxlS3ItRqr1XKBvN2PgUF/52TjLlK59J+G13PmKh3yBpuTcNbK9U
         bh/z9Et1glJ/poe70+rFDkk+NPGMVF8utCqnB6pk+swcQ1GeO6oNaw7fL36vTdC/Mnj4
         bN3XHRL54uVAIy4AOR0L9EEy1ivKBVV4QC5xQQMRa+J+6YnPOhow1C3mBuVE1NggmAFm
         t5x6upipDTu1ZlDKWl72QnvZH+aLT8IuZPrAr4mWPbzWakWHuQyXBQoBDBnMenECpHVc
         00zhXgVBnIjdq2dV5pcC4te9pzAVFVW8QNy8BDj5WQg+RHTv7SY8/H4Pos1dp0Z+N1JM
         PEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763011500; x=1763616300;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITLN6DrW4j9W1gRe4G0SjKiXKIkSq/9JXCq9e/dhlsU=;
        b=odTo2kPQYEBkf3OYXu34LIfVsh1hPKkOSYET6JOETQHK1maOvidgb04rG//1MH3sez
         9+QyvzMUoTXdhdCjyqUbFTtY7zBQ2EMMyiAMRDWRfR8n+aL1tJvnxj9rdNjYp3dZjfq7
         B6IFDtFTSMoybGvHGXLiJwyYDJk+oJQ6ZD6V6QATNHGg5HnmC1zAY0bSAhZezpwHVFci
         hSHfjfguHsxdXNaRdp9F1P8Ic6JkkkeMtMU3+kmRJnmhENBmDCCChy/1dyWMGErqvFJE
         W0Rm2fS4t6kX4cbixJrv7tl76LoqR5uAwv753/egCS5pjnjMWt9lP8JTEQucywia0qCR
         55Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVD+O0TEm1mq+azGGgh8l5k1+TZGLhXAqJ6m7DuxdzQxG66haleLTYunBuE3o/a0/3su7khqKaaL9C/MRtDcT6m@lists.infradead.org
X-Gm-Message-State: AOJu0YyInZtWAQdDwEmhCWFpmyogmCoELTcDYmE7W4RembA3ipdY2OoT
	TLxs4mOOVczgAd3Go9/OSCBYfW7F1nA0UhgtiG2/pwJMNC3is6X0AvZFTRMYcW5nEDLyJ2OgMQ9
	/EhM5pNePSQ==
X-Google-Smtp-Source: AGHT+IFL6UP4YmlKx250LyiOtTQeJ7J1ke7xQcOZuRjsBn2ACx0ONuYF1IJLK61YzRE922HtvlvNEGnRGSBI
X-Received: from jaa26.prod.google.com ([2002:a05:6638:ae1a:b0:5ad:7f49:aa05])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a92:c245:0:b0:433:78b8:943a
 with SMTP id e9e14a558f8ab-43473d15984mr90010315ab.10.1763011500033; Wed, 12
 Nov 2025 21:25:00 -0800 (PST)
Date: Thu, 13 Nov 2025 05:24:49 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251113052452.975081-1-rananta@google.com>
Subject: [PATCH 0/3] KVM: arm64: Reschedule as needed when destroying the
 stage-2 page-tables
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042938_203736_4F86D43D 
X-CRM114-Status: GOOD (  10.62  )
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

Patch-1 kills the assumption that the page-table hierarchy under the
table is free (in stage2_free_walker()). Instead, drop and clear the
references only on empty tables.

Patch-2 splits the kvm_pgtable_stage2_destroy() function into separate
'walk' and 'free PGD' parts.

Patch-3 leverages the split and performs the walk periodically over
smaller ranges and calls cond_resched() between them.

The series was originally posted and merged [1], but was later reverted
due to syzkaller catching a UAF bug [2]. This series fixes the issue, and
the original need_resched warning is addressed.

[1]: https://lore.kernel.org/all/175582091313.1266576.4329884314263043118.b4-ty@linux.dev/
[2]: https://lore.kernel.org/all/20250910180930.3679473-1-oliver.upton@linux.dev/ 

Oliver Upton (1):
  KVM: arm64: Only drop references on empty tables in stage2_free_walker

Raghavendra Rao Ananta (2):
  KVM: arm64: Split kvm_pgtable_stage2_destroy()
  KVM: arm64: Reschedule as needed when destroying the stage-2
    page-tables

 arch/arm64/include/asm/kvm_pgtable.h | 30 +++++++++++++
 arch/arm64/include/asm/kvm_pkvm.h    |  4 +-
 arch/arm64/kvm/hyp/pgtable.c         | 63 +++++++++++++++++++++++-----
 arch/arm64/kvm/mmu.c                 | 36 +++++++++++++++-
 arch/arm64/kvm/pkvm.c                | 11 ++++-
 5 files changed, 129 insertions(+), 15 deletions(-)


base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
-- 
2.51.2.1041.gc1ab5b90ca-goog


