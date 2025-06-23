Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09117C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 20:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64+Kcu62qwNapQJ3CG8fsGya6FkUjObefaU0itBbNEg=; b=FX+rCSe5gKVgo3VPqIpSB3811R
	IeMftXzJ3qZPaNp/J4ntMQ+dUEb6JTlNs6nK39ydjdKnoFRutqSH2s0aZPGoKhjEAxTLCul5Kn3Y6
	/UuQios/0OwX+T2mLZmrQIPWOKqB7IYKEE3JeYKUXDc06Qm8MpqmcdVp9/QqSReeY/rkGto18dzfg
	qe3k2CT+8hUed8pMDm2Y9itLaXchGJ1qe6GtiOoS0W53tNnnBWHX2pkCZo0KoNYsIlf7TXArBQCrx
	drs/bF/bRcCcLPRkOHv4AbEZVEe1v6Hs5l/dv1TMfh6CSjMyarOkGzp3klrRUvHwMegCoxBAnemkC
	JYe1cMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnQR-00000003tcJ-0Gt4;
	Mon, 23 Jun 2025 20:05:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfmW-00000002Zy9-2y5e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 11:56:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A209D113E;
	Mon, 23 Jun 2025 04:55:51 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A21FA3F58B;
	Mon, 23 Jun 2025 04:56:08 -0700 (PDT)
Date: Mon, 23 Jun 2025 12:56:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	song@kernel.org, mark.rutland@arm.com, usamaarif642@gmail.com,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: arm64: BUG: KASAN: invalid-access in arch_stack_walk
Message-ID: <aFlA1tXXUEBZP1NH@arm.com>
References: <aFVVEgD0236LdrL6@gmail.com>
 <CA+fCnZfzHOFjVo43UZK8H6h3j=OHjfF13oFJvT0P-SM84Oc4qQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZfzHOFjVo43UZK8H6h3j=OHjfF13oFJvT0P-SM84Oc4qQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_045612_835107_11BC90E6 
X-CRM114-Status: GOOD (  22.04  )
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

On Sun, Jun 22, 2025 at 02:57:16PM +0200, Andrey Konovalov wrote:
> On Fri, Jun 20, 2025 at 2:33 PM Breno Leitao <leitao@debian.org> wrote:
> > I'm encountering a KASAN warning during aarch64 boot and I am struggling
> > to determine the cause. I haven't come across any reports about this on
> > the mailing list so far, so I'm sharing this early in case others are
> > seeing it too.
> >
> > This issue occurs both on Linus's upstream branch and in the 6.15 final
> > release. The stack trace below is from 6.15 final. I haven't started
> > bisecting yet, but that's my next step.
> >
> > Here are a few details about the problem:
> >
> > 1) it happen on my kernel boots on a aarch64 host
> > 2) The lines do not match the code very well, and I am not sure why. It
> >    seems it is offset by two lines. The stack is based on commit
> >    0ff41df1cb26 ("Linux 6.15")
> > 3) My config is at https://pastebin.com/ye46bEK9
> >
> >
> >         [  235.831690] ==================================================================
> >         [  235.861238] BUG: KASAN: invalid-access in arch_stack_walk (arch/arm64/kernel/stacktrace.c:346 arch/arm64/kernel/stacktrace.c:387)
> >         [  235.887206] Write of size 96 at addr a5ff80008ae8fb80 by task kworker/u288:26/3666
> >         [  235.918139] Pointer tag: [a5], memory tag: [00]
> >         [  235.942722] Workqueue: efi_rts_wq efi_call_rts
> >         [  235.942732] Call trace:
> >         [  235.942734] show_stack (arch/arm64/kernel/stacktrace.c:468) (C)
> >         [  235.942741] dump_stack_lvl (lib/dump_stack.c:123)
> >         [  235.942748] print_report (mm/kasan/report.c:409 mm/kasan/report.c:521)
> >         [  235.942755] kasan_report (mm/kasan/report.c:636)
> >         [  235.942759] kasan_check_range (mm/kasan/sw_tags.c:85)
> >         [  235.942764] memset (mm/kasan/shadow.c:53)
> >         [  235.942769] arch_stack_walk (arch/arm64/kernel/stacktrace.c:346 arch/arm64/kernel/stacktrace.c:387)
> >         [  235.942773] return_address (arch/arm64/kernel/return_address.c:44)
> >         [  235.942778] trace_hardirqs_off.part.0 (kernel/trace/trace_preemptirq.c:95)
> >         [  235.942784] trace_hardirqs_off_finish (kernel/trace/trace_preemptirq.c:98)
> >         [  235.942789] enter_from_kernel_mode (arch/arm64/kernel/entry-common.c:62)
> >         [  235.942794] el1_interrupt (arch/arm64/kernel/entry-common.c:559 arch/arm64/kernel/entry-common.c:575)
> >         [  235.942799] el1h_64_irq_handler (arch/arm64/kernel/entry-common.c:581)
> >         [  235.942804] el1h_64_irq (arch/arm64/kernel/entry.S:596)
> >         [  235.942809]  0x3c52ff1ecc (P)
> >         [  235.942825]  0x3c52ff0ed4
> >         [  235.942829]  0x3c52f902d0
> >         [  235.942833]  0x3c52f953e8
> >         [  235.942837] __efi_rt_asm_wrapper (arch/arm64/kernel/efi-rt-wrapper.S:49)
> >         [  235.942843] efi_call_rts (drivers/firmware/efi/runtime-wrappers.c:269)
> >         [  235.942848] process_one_work (./arch/arm64/include/asm/jump_label.h:36 ./include/trace/events/workqueue.h:110 kernel/workqueue.c:3243)
> >         [  235.942854] worker_thread (kernel/workqueue.c:3313 kernel/workqueue.c:3400)
> >         [  235.942858] kthread (kernel/kthread.c:464)
> >         [  235.942863] ret_from_fork (arch/arm64/kernel/entry.S:863)
> >
> >         [  236.436924] The buggy address belongs to the virtual mapping at
> >         [a5ff80008ae80000, a5ff80008aea0000) created by:
> >         arm64_efi_rt_init (arch/arm64/kernel/efi.c:219)
> >
> >         [  236.506959] The buggy address belongs to the physical page:
> >         [  236.529724] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x12682
> >         [  236.562077] flags: 0x17fffd6c0000000(node=0|zone=2|lastcpupid=0x1ffff|kasantag=0x5b)
> >         [  236.593722] raw: 017fffd6c0000000 0000000000000000 dead000000000122 0000000000000000
> >         [  236.625365] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
> >         [  236.657004] page dumped because: kasan: bad access detected
> >
> >         [  236.685828] Memory state around the buggy address:
> >         [  236.705390]  ffff80008ae8f900: 00 00 00 00 00 a5 a5 a5 a5 00 00 00 00 00 a5 a5
> >         [  236.734899]  ffff80008ae8fa00: a5 a5 a5 00 00 00 00 00 00 a5 a5 a5 a5 a5 00 a5
> >         [  236.764409] >ffff80008ae8fb00: 00 a5 a5 a5 00 a5 a5 a5 a5 a5 a5 00 a5 a5 a5 00
> >         [  236.793918]                                                     ^
> >         [  236.818810]  ffff80008ae8fc00: a7 a5 a5 a5 a5 a5 a5 a5 a5 00 a5 00 a5 a5 a5 a5
> >         [  236.848321]  ffff80008ae8fd00: a5 a5 a5 a5 00 a5 00 a5 a5 a5 a5 a5 a5 a5 a5 a5
> >         [  236.877828] ==================================================================
> 
> Looks like the memory allocated/mapped in arm64_efi_rt_init() is
> tagged by __vmalloc_node(). And this memory then gets used as a
> (irq-related? EFI-related?) stack. And having the SP register tagged
> breaks SW_TAGS instrumentation AFAIR [1], which is likely what
> produces this report.
> 
> Adding kasan_reset_tag() to arm64_efi_rt_init() should likely fix
> this; similar to what we have in arch_alloc_vmap_stack(). Or should we
> make arm64_efi_rt_init() just call arch_alloc_vmap_stack()?

In theory, we can still disable the vmap stack, so we either fall back
to something else or require that EFI runtime depends on VMAP_STACK.
We can do like init_sdei_stacks(), just bail out if VMAP_STACK is
disabled.

Adding Ard, it's his code.

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=51fb34de2a4c8fa0f221246313700bfe3b6c586d

-- 
Catalin

