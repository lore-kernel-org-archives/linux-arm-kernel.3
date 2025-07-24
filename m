Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96544C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 01:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yBgNXOzVYMuT3p5X0sPGb1CyLZHQHf4C3ha7d+WUCs8=; b=GI97uoB72KyL5cPMOHplsss/WL
	LjzBrmMDBaLFm4rzJlcY/ukFYoqxtn9FTROOR846k3CHMxCL6tTz16PnM3KXqHf7s8O1AeEFXR9R8
	0wwS13zDuv/i1i7ke1WUVurKXeE6lik2NtcigEn0O24wTihF+P7UDCoyaSbrQnvnPBqV/0jRL3GwU
	cpE+6h34WItrghiimrUYy0wh3C8AFUyN7SOJdVbR9XFhJgzYS+Jti4Z2U9FN2Jkco9ScuqvXalJ3O
	iVePB2V276Uy76r+Z+jabkFzUTfXqZp0YxkRIinHzQ1DdENBy4bwDGFgHn/0kTnihpGU5OMadtmHI
	+LljNOIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf6rX-00000008nR5-2VLf;
	Fri, 25 Jul 2025 01:04:39 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5j3-00000008jQx-4C0q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 23:51:51 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-87c707bfeb6so151219939f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 16:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753401108; x=1754005908; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yBgNXOzVYMuT3p5X0sPGb1CyLZHQHf4C3ha7d+WUCs8=;
        b=LKHENp5HEwLe/sgsnO37ZuCm2nvmvwr7ZZrTvRRbZLwGbxzdzXUCwnYf7ihZNbHmL5
         6NpPTA6rv2g9fpUqBY9qaAgmVRNHLKVR+OjsfH9E2aAkdBrtEuVWtuR+cGTCrzRBqHwt
         q5eoLFrorhFmdJQHzdXQNTDf6e2Z1UwUgqTrzsMpAzWNm+9kQDkEW7Tr3FrMkc2PpAyZ
         HzG7gm22GDk6IvIA6tneEKt1fan7Pq1vcKt1ZUFwg9kGKN6MnrZSUf2OIglFp97+OrGu
         DoK4a9TQABdwhYWzsJa5DKKPLBBLlXdbU+qzzuRn3YjiMKmzuDuBWzgPxI5e/Ae8GJrL
         XQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753401108; x=1754005908;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBgNXOzVYMuT3p5X0sPGb1CyLZHQHf4C3ha7d+WUCs8=;
        b=Q8qTj6V6tAyy7Nyt/8OqXJt2VhxdKW4N60+TBrLTRJAZIYbgte7vLl8+AvDmH8E2vE
         b2uZAaAI00V3R5qhovzhfAcQMB9gaLKqj0c42PyzHmyuMT8Pf2parnB8WiU5Wk22eJZx
         FmXxSOJxipIK7cU2+zxQAZcPn7HIdih6c0ztyHxkRwkIN+xOGOW54YkDIVtGV8AlAMCW
         3VKYNu5f7ZTRCpRe+DAzNq70irxHXHKQRDjF8xx82WGZbQEp66w7I/9yV7wO6RsRaot4
         59Ef8gww2HPS9Dj/TBNvM+BwSKfyxtz4ZYKOLNxjtVWvAtnl5LyWsQFDob6TeS5LZBxt
         6H3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUK/UVlCh5WBTSVxY8+Y0y0SZBIgYJCNPQMt1sj/Ka+EtVyMOUtPt8aI9pYnLoboIAZW/N7tPeroDHIiEI7fUh9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb06xBRr9k7CIq2looBcu9aW3jkVAZbB5jUWlaqVbXGaPX7ZAE
	a0E9+WGxk/lUyUTeJp8uODCAH1rLCCZ3uSNb6YPt9rrFZzF7TXx7T/TuuxaA6ATatP7Frq1Prhe
	KdNFFZ9E4Nw==
X-Google-Smtp-Source: AGHT+IGJJw5L0nOEev3xzncdd7QXg/JvCOjo9FLlOHz8os9ojHiaM/jdOkQnSqh8f7hlvencNdgmFK+BlV4o
X-Received: from ioqc13.prod.google.com ([2002:a6b:7d0d:0:b0:87c:3255:3907])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:b8e:b0:876:7876:a587
 with SMTP id ca18e2360f4ac-87c64dc5c35mr1439425539f.0.1753401108447; Thu, 24
 Jul 2025 16:51:48 -0700 (PDT)
Date: Thu, 24 Jul 2025 23:51:42 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250724235144.2428795-1-rananta@google.com>
Subject: [PATCH 0/2] KVM: arm64: Destroy the stage-2 page-table periodically
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_165150_043483_E4A0A5EB 
X-CRM114-Status: UNSURE (   8.38  )
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

Thank you.
Raghavendra

Raghavendra Rao Ananta (2):
  KVM: arm64: Split kvm_pgtable_stage2_destroy()
  KVM: arm64: Destroy the stage-2 page-table periodically

 arch/arm64/include/asm/kvm_pgtable.h | 19 ++++++++++++
 arch/arm64/kvm/hyp/pgtable.c         | 23 ++++++++++++--
 arch/arm64/kvm/mmu.c                 | 46 +++++++++++++++++++++++++---
 3 files changed, 80 insertions(+), 8 deletions(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.50.1.470.g6ba607880d-goog


