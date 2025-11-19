Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F7DCF6487
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 22:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+O4eg/kZJokk+PBCs1QXY7C3uGXEXTLLo0jZuFdCME=; b=B2XopVzGhl6cMdBojZ8iHr3bqZ
	RMXM35EkDOEhE1C1Rk1dpzFOiIcoB4Cv21G3g+kNURr4U+kG0gQvrhe7LO+dZCMvj8aVw2EYafw0U
	FiAH4wK7A398m1AxUyoD2IcX11AhQ+gQLJx0Z5bidSzKiZ2NPdVHQSQNIOLEa8L7wkxpMsFP6CRAN
	FERkY/H87QcwjKEfTgrtthlrFsPSSvh31Q37xXm8HbpzMevxcOxnIem0GzDY3IDuc8QPKq5jPnZUC
	5WMN51Z4w//bAtYmMzmBJ2HV4cTi42JcSGJ3XZnAukXpbgX1e96jhkKg2EdHBxux/x3U6PanDLBTG
	lwx110Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLqm6-00000005nlc-0s33;
	Wed, 19 Nov 2025 22:35:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLqlx-00000005njz-03ik
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 22:35:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC82743EAF;
	Wed, 19 Nov 2025 22:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8992C19421;
	Wed, 19 Nov 2025 22:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763591731;
	bh=sDyW89qPXT3xdQtj10GxlHLo6uAfus5uHKYULC7hRl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rt0Vg+lzXkk7T3RVTZNY/ZGYbm7HWy7YYAeYDktDAgzB4DG+fqhFxJ5KVxgemCpAx
	 uLpKJ9LFrcVGvOxsgPcurh4KAT+/qHiy1K/4LKT2Dm9uDQ/ighMwPkz/pGOPsnspTh
	 4lYlwLHJ7xsi4KdUReKoML5WaUtgAWxtxo3zO80+zHLqltFeUAimDZrIpa/z9GStJv
	 xk1CUYTjSbP1YqQm5+RTWnvx4hDWT0j1wtZ4JRAv82Pm3mMtdzPbapGNA62yOdODBb
	 sxqkZ05AoP+HlPlYAsYdtCMW7wcf32HmiJcY36JRkjy0tHFD9w+MpEg5fiSC4AxWL+
	 L4S0oZ1e+P/FA==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH 0/3] KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables
Date: Wed, 19 Nov 2025 14:35:28 -0800
Message-ID: <176359161125.183996.17801262311162275177.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251113052452.975081-1-rananta@google.com>
References: <20251113052452.975081-1-rananta@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_143533_074690_F34F889B 
X-CRM114-Status: UNSURE (   7.39  )
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

On Thu, 13 Nov 2025 05:24:49 +0000, Raghavendra Rao Ananta wrote:
> When destroying a fully-mapped 128G VM abruptly, the following scheduler
> warning is observed:
> 
>   sched: CPU 0 need_resched set for > 100018840 ns (100 ticks) without schedule
>   CPU: 0 UID: 0 PID: 9617 Comm: kvm_page_table_ Tainted: G O 6.16.0-smp-DEV #3 NONE
>   Tainted: [O]=OOT_MODULE
>   Call trace:
>       show_stack+0x20/0x38 (C)
>       dump_stack_lvl+0x3c/0xb8
>       dump_stack+0x18/0x30
>       resched_latency_warn+0x7c/0x88
>       sched_tick+0x1c4/0x268
>       update_process_times+0xa8/0xd8
>       tick_nohz_handler+0xc8/0x168
>       __hrtimer_run_queues+0x11c/0x338
>       hrtimer_interrupt+0x104/0x308
>       arch_timer_handler_phys+0x40/0x58
>       handle_percpu_devid_irq+0x8c/0x1b0
>       generic_handle_domain_irq+0x48/0x78
>       gic_handle_irq+0x1b8/0x408
>       call_on_irq_stack+0x24/0x30
>       do_interrupt_handler+0x54/0x78
>       el1_interrupt+0x44/0x88
>       el1h_64_irq_handler+0x18/0x28
>       el1h_64_irq+0x84/0x88
>       stage2_free_walker+0x30/0xa0 (P)
>       __kvm_pgtable_walk+0x11c/0x258
>       __kvm_pgtable_walk+0x180/0x258
>       __kvm_pgtable_walk+0x180/0x258
>       __kvm_pgtable_walk+0x180/0x258
>       kvm_pgtable_walk+0xc4/0x140
>       kvm_pgtable_stage2_destroy+0x5c/0xf0
>       kvm_free_stage2_pgd+0x6c/0xe8
>       kvm_uninit_stage2_mmu+0x24/0x48
>       kvm_arch_flush_shadow_all+0x80/0xa0
>       kvm_mmu_notifier_release+0x38/0x78
>       __mmu_notifier_release+0x15c/0x250
>       exit_mmap+0x68/0x400
>       __mmput+0x38/0x1c8
>       mmput+0x30/0x68
>       exit_mm+0xd4/0x198
>       do_exit+0x1a4/0xb00
>       do_group_exit+0x8c/0x120
>       get_signal+0x6d4/0x778
>       do_signal+0x90/0x718
>       do_notify_resume+0x70/0x170
>       el0_svc+0x74/0xd8
>       el0t_64_sync_handler+0x60/0xc8
>       el0t_64_sync+0x1b0/0x1b8
> 
> [...]

Applied to next, thanks!

[1/3] KVM: arm64: Only drop references on empty tables in stage2_free_walker
      https://git.kernel.org/kvmarm/kvmarm/c/156f70afcfec
[2/3] KVM: arm64: Split kvm_pgtable_stage2_destroy()
      https://git.kernel.org/kvmarm/kvmarm/c/d68d66e57e2b
[3/3] KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables
      https://git.kernel.org/kvmarm/kvmarm/c/4ddfab5436b6

--
Best,
Oliver

