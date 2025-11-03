Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96E6CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwOqk6r952fnoq6kqx5JJLxmDxQO3I/qHQLZzHd75RQ=; b=A+0fLHJj13/NPFtRMVfFLM3TlP
	WySSysNHbycHSWrjU250EJzCJ/hmfx9lba4iSojfq3Ymr+s0HBYP0/GspRxV6bAiSqxmHUtMuOUVX
	UmxObJkIeFTqmL3MvwrZ2JTHllWveTERv/aMPGp4RqZFECdSxAffLnRhJxh18UOQXhaugt67W3DIq
	Kw6/1/EpOv+ycOWfr5gHjHZO/b9naFo8uRoF2umNOCG2yzpd0HQJ19Owc6fxD2smiWg8tot9zaKpx
	mnZrKnh8HvwLFlsdYcK6T4EuIPi3AYcAnZ5OIX8KpNYGdETDBZn3RxXrfK8DKdOXow/GzwHS0QYgw
	wsK0Ujdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxDQ-0000000AEfF-4ACf;
	Mon, 03 Nov 2025 16:15:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxDN-0000000AEeo-3CmH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D68643BB2;
	Mon,  3 Nov 2025 16:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22BE5C4CEE7;
	Mon,  3 Nov 2025 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762186529;
	bh=S0YKJr0SoBmysmz8IMr3QugNjlhYpJzfR41WjPWBUB4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pMmG9L/wSj8xOcK/DzcO7x+pUKpbN+kaGWRhPKGT/hFa2p/Ay8Nl1Mzz1ZWUyScDa
	 vucJ0XbF6T0spIoI3AD/0qxqWiVKMh+Mmks24qxQFDpKZf3Zexx64cDs61lCh6Efy6
	 od0TqupiK1VEnDg7glIHKRlBc357kZIMtV/jM6SD3qxje1H7u2r4taFzH3oyOWmxWM
	 hHnL2j3jQ8KEJexQD4wpbJBjPfYdQst+gwFFqah20VMhXD96dyPMbnm/scOYZnijeO
	 WcP/Ww9iS8dXs6EdOUxwooqxO/I0VbjvAaMNzv31ZZN/WtGdcK9zJR5blHKdrg4t/9
	 0WafEdG9rsGng==
Message-ID: <c7c8a233-2103-4b48-b65e-ec81666d20e4@kernel.org>
Date: Mon, 3 Nov 2025 17:15:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] x86/xen: use lazy_mmu_state when
 context-switching
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-12-kevin.brodsky@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251029100909.3381140-12-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_081529_848394_B41AA146 
X-CRM114-Status: GOOD (  21.75  )
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

On 29.10.25 11:09, Kevin Brodsky wrote:
> We currently set a TIF flag when scheduling out a task that is in
> lazy MMU mode, in order to restore it when the task is scheduled
> again.
> 
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode in task_struct::lazy_mmu_state. We can therefore check that
> state when switching to the new task, instead of using a separate
> TIF flag.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/x86/include/asm/thread_info.h | 4 +---
>   arch/x86/xen/enlighten_pv.c        | 3 +--
>   2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/thread_info.h
> index e71e0e8362ed..0067684afb5b 100644
> --- a/arch/x86/include/asm/thread_info.h
> +++ b/arch/x86/include/asm/thread_info.h
> @@ -100,8 +100,7 @@ struct thread_info {
>   #define TIF_FORCED_TF		24	/* true if TF in eflags artificially */
>   #define TIF_SINGLESTEP		25	/* reenable singlestep on user return*/
>   #define TIF_BLOCKSTEP		26	/* set when we want DEBUGCTLMSR_BTF */
> -#define TIF_LAZY_MMU_UPDATES	27	/* task is updating the mmu lazily */
> -#define TIF_ADDR32		28	/* 32-bit address space on 64 bits */
> +#define TIF_ADDR32		27	/* 32-bit address space on 64 bits */
>   
>   #define _TIF_SSBD		BIT(TIF_SSBD)
>   #define _TIF_SPEC_IB		BIT(TIF_SPEC_IB)
> @@ -114,7 +113,6 @@ struct thread_info {
>   #define _TIF_FORCED_TF		BIT(TIF_FORCED_TF)
>   #define _TIF_BLOCKSTEP		BIT(TIF_BLOCKSTEP)
>   #define _TIF_SINGLESTEP		BIT(TIF_SINGLESTEP)
> -#define _TIF_LAZY_MMU_UPDATES	BIT(TIF_LAZY_MMU_UPDATES)
>   #define _TIF_ADDR32		BIT(TIF_ADDR32)
>   
>   /* flags to check in __switch_to() */
> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> index 4806cc28d7ca..f40f5999352e 100644
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -426,7 +426,6 @@ static void xen_start_context_switch(struct task_struct *prev)
>   
>   	if (this_cpu_read(xen_lazy_mode) == XEN_LAZY_MMU) {
>   		arch_leave_lazy_mmu_mode();
> -		set_ti_thread_flag(task_thread_info(prev), TIF_LAZY_MMU_UPDATES);
>   	}
>   	enter_lazy(XEN_LAZY_CPU);
>   }
> @@ -437,7 +436,7 @@ static void xen_end_context_switch(struct task_struct *next)
>   
>   	xen_mc_flush();
>   	leave_lazy(XEN_LAZY_CPU);
> -	if (test_and_clear_ti_thread_flag(task_thread_info(next), TIF_LAZY_MMU_UPDATES))
> +	if (next->lazy_mmu_state.active)

This is nasty. If in_lazy_mmu_mode() is not sufficient, we will want to 
have a separate helper that makes it clear what the difference between 
both variants is.


-- 
Cheers

David

