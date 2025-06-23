Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464C9C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 21:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKkW4+XVrDVdyJMGMoOg/KRLZUDhgXliMkMQQ7T6pik=; b=1z+I7jBr7cCD/WZ56850QjcEaY
	xviXYHu5+QMsLV9SymSRUoDRZcXqwWNxyxa+IFD4/lBsr3qm6mL2Qt68Q1p/kF27ZLo3WHfpdqnwn
	Wvi7kpna5dPEawdiGk1gsNSGnAU5rBEu/VcO5ZxZfG0xbZzdAuTbF+SC+KYgITMPRXRHFV+xCmEi5
	YeDE/06/QZ9GSMWcE74lBr9HFLCKCnTbglZBqMOOGXIsh/sopv4wQcmlhpB0R2fynLXAJcRw1v+zO
	u/od1o+TCfUw6cwweHHTiR2rcySVeEMtnuvsQQAwabzo38iLSfCLP3rIPyPDkOSQYBg4PdzCp1SSl
	d0mVBjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTov3-000000041st-37Nh;
	Mon, 23 Jun 2025 21:41:37 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkTG-00000003UcK-40qc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 16:56:40 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so8019900a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 09:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750697797; x=1751302597;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EKkW4+XVrDVdyJMGMoOg/KRLZUDhgXliMkMQQ7T6pik=;
        b=Xc2ivb+o7AJfLYL0jwZVO6FLkMu9E3mn2FIE73lqALuNbvsOXtv54oa/geW7S8RcTj
         Yel4Ka3TuPWOM16FfBS7XoNl/6v68xZ/gEvOxfRENL0RjocvL+Rl91I7BOdx8wCfE5+y
         sD8UCV2qmMox/Zs0SnRpYedS2lxd9vnbBnybTQXvQJHags0bsE0DM9zeoyXivsGZqFyS
         tWL0dpw1BqK+naFeNp58aC36yaL3txV6pXDUf0zJsTylfIwehu9/2YtREblibi1KmJsG
         cGveg5UkX/vB+/O6iQkEfxXNxMczk1W8fKtBLuEdhx2bTeJgSI0DpoG1nwYmpWyC05Le
         FQ/A==
X-Forwarded-Encrypted: i=1; AJvYcCXtQlmtzqsSzW6kOzBLn8YAVEsRkJQHzuol1e99T9x2FNVvdktjDC9prcPRGH09QgJBsA+lJv6HDsa759Fct3K+@lists.infradead.org
X-Gm-Message-State: AOJu0YxCCEdvFXWWYoRmMHsOl+lJdFdmMBtF0aYxmDEGOyMfaQT/+WrF
	tSBV3KB3eFljRE5zV/t1hm4Gg8fteuUETCtu3U3rhTaKa2Gl30s+Aqyv
X-Gm-Gg: ASbGncvu0sbi2qJrbhPryCMu5crixg4hWL/gpCE8JBDexzyG+UmXMxIiTMcM3/dP32K
	NSgRnI82BHHT6Gi7rys9zqNE2R2rXdWNx3TEzqX3VlUtfgyG/b+pR+DwKeBD8ggCEsZI5F3z948
	mw+Iy2rMnijfwUUZMVTKd2SJJ65+mfIKHMHCQO3RQhJETordtDMcLkTihBu6tzQ0Jc7OEpJWWR5
	tOS2K50P5XJNjrc/xM24CH49uCYCmKQTvGSv0VNTxstZrM2muNGHX1BY9apnN/qrRZgsd6xkPgj
	xOGfaAhMfSrs1c+TfYFEl8qoGXUj3MGILdJAZGoZoP5My5OBjuH2Uw==
X-Google-Smtp-Source: AGHT+IFuuiJ7hwhPP7REvZZAdBwiDq48UgRKHsUFqEjQfTFwPXA33KyLu0BTqZ5IL7d9tF0bI3+zyA==
X-Received: by 2002:a17:907:3d09:b0:ae0:a684:2594 with SMTP id a640c23a62f3a-ae0a684278bmr38731066b.0.1750697796691;
        Mon, 23 Jun 2025 09:56:36 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm549543666b.40.2025.06.23.09.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:56:36 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:56:33 -0700
From: Breno Leitao <leitao@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, andreyknvl@gmail.com
Cc: Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	song@kernel.org, mark.rutland@arm.com, usamaarif642@gmail.com,
	Ard Biesheuvel <ardb@kernel.org>, rmikey@meta.com
Subject: Re: arm64: BUG: KASAN: invalid-access in arch_stack_walk
Message-ID: <aFmHQbpwX4WnR/5p@gmail.com>
References: <aFVVEgD0236LdrL6@gmail.com>
 <CA+fCnZfzHOFjVo43UZK8H6h3j=OHjfF13oFJvT0P-SM84Oc4qQ@mail.gmail.com>
 <aFlA1tXXUEBZP1NH@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFlA1tXXUEBZP1NH@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_095638_997262_DA041A7D 
X-CRM114-Status: GOOD (  34.31  )
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

On Mon, Jun 23, 2025 at 12:56:06PM +0100, Catalin Marinas wrote:
> On Sun, Jun 22, 2025 at 02:57:16PM +0200, Andrey Konovalov wrote:
> > On Fri, Jun 20, 2025 at 2:33 PM Breno Leitao <leitao@debian.org> wrote:
> > > I'm encountering a KASAN warning during aarch64 boot and I am struggling
> > > to determine the cause. I haven't come across any reports about this on
> > > the mailing list so far, so I'm sharing this early in case others are
> > > seeing it too.
> > >
> > > This issue occurs both on Linus's upstream branch and in the 6.15 final
> > > release. The stack trace below is from 6.15 final. I haven't started
> > > bisecting yet, but that's my next step.
> > >
> > > Here are a few details about the problem:
> > >
> > > 1) it happen on my kernel boots on a aarch64 host
> > > 2) The lines do not match the code very well, and I am not sure why. It
> > >    seems it is offset by two lines. The stack is based on commit
> > >    0ff41df1cb26 ("Linux 6.15")
> > > 3) My config is at https://pastebin.com/ye46bEK9
> > >
> > >
> > >         [  235.831690] ==================================================================
> > >         [  235.861238] BUG: KASAN: invalid-access in arch_stack_walk (arch/arm64/kernel/stacktrace.c:346 arch/arm64/kernel/stacktrace.c:387)
> > >         [  235.887206] Write of size 96 at addr a5ff80008ae8fb80 by task kworker/u288:26/3666
> > >         [  235.918139] Pointer tag: [a5], memory tag: [00]
> > >         [  235.942722] Workqueue: efi_rts_wq efi_call_rts
> > >         [  235.942732] Call trace:
> > >         [  235.942734] show_stack (arch/arm64/kernel/stacktrace.c:468) (C)
> > >         [  235.942741] dump_stack_lvl (lib/dump_stack.c:123)
> > >         [  235.942748] print_report (mm/kasan/report.c:409 mm/kasan/report.c:521)
> > >         [  235.942755] kasan_report (mm/kasan/report.c:636)
> > >         [  235.942759] kasan_check_range (mm/kasan/sw_tags.c:85)
> > >         [  235.942764] memset (mm/kasan/shadow.c:53)
> > >         [  235.942769] arch_stack_walk (arch/arm64/kernel/stacktrace.c:346 arch/arm64/kernel/stacktrace.c:387)
> > >         [  235.942773] return_address (arch/arm64/kernel/return_address.c:44)
> > >         [  235.942778] trace_hardirqs_off.part.0 (kernel/trace/trace_preemptirq.c:95)
> > >         [  235.942784] trace_hardirqs_off_finish (kernel/trace/trace_preemptirq.c:98)
> > >         [  235.942789] enter_from_kernel_mode (arch/arm64/kernel/entry-common.c:62)
> > >         [  235.942794] el1_interrupt (arch/arm64/kernel/entry-common.c:559 arch/arm64/kernel/entry-common.c:575)
> > >         [  235.942799] el1h_64_irq_handler (arch/arm64/kernel/entry-common.c:581)
> > >         [  235.942804] el1h_64_irq (arch/arm64/kernel/entry.S:596)
> > >         [  235.942809]  0x3c52ff1ecc (P)
> > >         [  235.942825]  0x3c52ff0ed4
> > >         [  235.942829]  0x3c52f902d0
> > >         [  235.942833]  0x3c52f953e8
> > >         [  235.942837] __efi_rt_asm_wrapper (arch/arm64/kernel/efi-rt-wrapper.S:49)
> > >         [  235.942843] efi_call_rts (drivers/firmware/efi/runtime-wrappers.c:269)
> > >         [  235.942848] process_one_work (./arch/arm64/include/asm/jump_label.h:36 ./include/trace/events/workqueue.h:110 kernel/workqueue.c:3243)
> > >         [  235.942854] worker_thread (kernel/workqueue.c:3313 kernel/workqueue.c:3400)
> > >         [  235.942858] kthread (kernel/kthread.c:464)
> > >         [  235.942863] ret_from_fork (arch/arm64/kernel/entry.S:863)
> > >
> > >         [  236.436924] The buggy address belongs to the virtual mapping at
> > >         [a5ff80008ae80000, a5ff80008aea0000) created by:
> > >         arm64_efi_rt_init (arch/arm64/kernel/efi.c:219)
> > >
> > >         [  236.506959] The buggy address belongs to the physical page:
> > >         [  236.529724] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x12682
> > >         [  236.562077] flags: 0x17fffd6c0000000(node=0|zone=2|lastcpupid=0x1ffff|kasantag=0x5b)
> > >         [  236.593722] raw: 017fffd6c0000000 0000000000000000 dead000000000122 0000000000000000
> > >         [  236.625365] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
> > >         [  236.657004] page dumped because: kasan: bad access detected
> > >
> > >         [  236.685828] Memory state around the buggy address:
> > >         [  236.705390]  ffff80008ae8f900: 00 00 00 00 00 a5 a5 a5 a5 00 00 00 00 00 a5 a5
> > >         [  236.734899]  ffff80008ae8fa00: a5 a5 a5 00 00 00 00 00 00 a5 a5 a5 a5 a5 00 a5
> > >         [  236.764409] >ffff80008ae8fb00: 00 a5 a5 a5 00 a5 a5 a5 a5 a5 a5 00 a5 a5 a5 00
> > >         [  236.793918]                                                     ^
> > >         [  236.818810]  ffff80008ae8fc00: a7 a5 a5 a5 a5 a5 a5 a5 a5 00 a5 00 a5 a5 a5 a5
> > >         [  236.848321]  ffff80008ae8fd00: a5 a5 a5 a5 00 a5 00 a5 a5 a5 a5 a5 a5 a5 a5 a5
> > >         [  236.877828] ==================================================================
> > 
> > Looks like the memory allocated/mapped in arm64_efi_rt_init() is
> > tagged by __vmalloc_node(). And this memory then gets used as a
> > (irq-related? EFI-related?) stack. And having the SP register tagged
> > breaks SW_TAGS instrumentation AFAIR [1], which is likely what
> > produces this report.
> > 
> > Adding kasan_reset_tag() to arm64_efi_rt_init() should likely fix
> > this; similar to what we have in arch_alloc_vmap_stack(). Or should we
> > make arm64_efi_rt_init() just call arch_alloc_vmap_stack()?
> 
> In theory, we can still disable the vmap stack, so we either fall back
> to something else or require that EFI runtime depends on VMAP_STACK.
> We can do like init_sdei_stacks(), just bail out if VMAP_STACK is
> disabled.

Thanks for the feedback and suggestions. Are we talking about a patch
that looks like the following:

	Author: Breno Leitao <leitao@debian.org>
	Date:   Mon Jun 23 09:46:54 2025 -0700

	arm64: Use arch_alloc_vmap_stack for EFI runtime stack allocation
	
	Refactor vmap stack allocation by moving the CONFIG_VMAP_STACK check
	from BUILD_BUG_ON to a runtime return of NULL if the config is not set.
	The side effect of this is that _init_sdei_stack() might NOT fail in
	build time if _VMAP_STACK, but in runtime. It shifts error
	detection from compile-time to runtime
	
	Then, reuse arch_alloc_vmap_stack() to allocate the ACPI stack
	memory in the arm64_efi_rt_init().
	
	Suggested-by: Andrey Konovalov <andreyknvl@gmail.com>
	Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
	Signed-off-by: Breno Leitao <leitao@debian.org>

	diff --git a/arch/arm64/include/asm/vmap_stack.h b/arch/arm64/include/asm/vmap_stack.h
	index 20873099c035c..8380af4507d01 100644
	--- a/arch/arm64/include/asm/vmap_stack.h
	+++ b/arch/arm64/include/asm/vmap_stack.h
	@@ -19,7 +19,8 @@ static inline unsigned long *arch_alloc_vmap_stack(size_t stack_size, int node)
	{
		void *p;
	
	-	BUILD_BUG_ON(!IS_ENABLED(CONFIG_VMAP_STACK));
	+	if (!IS_ENABLED(CONFIG_VMAP_STACK))
	+		return NULL;
	
		p = __vmalloc_node(stack_size, THREAD_ALIGN, THREADINFO_GFP, node,
				__builtin_return_address(0));
	diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
	index 3857fd7ee8d46..6c371b158b99f 100644
	--- a/arch/arm64/kernel/efi.c
	+++ b/arch/arm64/kernel/efi.c
	@@ -15,6 +15,7 @@
	
	#include <asm/efi.h>
	#include <asm/stacktrace.h>
	+#include <asm/vmap_stack.h>
	
	static bool region_is_misaligned(const efi_memory_desc_t *md)
	{
	@@ -214,9 +215,8 @@ static int __init arm64_efi_rt_init(void)
		if (!efi_enabled(EFI_RUNTIME_SERVICES))
			return 0;
	
	-	p = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, GFP_KERNEL,
	-			   NUMA_NO_NODE, &&l);
	-l:	if (!p) {
	+	p = arch_alloc_vmap_stack(THREAD_SIZE, NUMA_NO_NODE);
	+	if (!p) {
			pr_warn("Failed to allocate EFI runtime stack\n");
			clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
			return -ENOMEM;

