Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5F6CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 02:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzRgxKaFFDli8ftuhQFfyH2ObKCMh7+2PDYIIzQvueg=; b=43gC8j0qcDVmwhwXmFy1MIWV4z
	llr6/TM642s5EI44tivZejU2699blN5KIMvKMinJM7aSbPFrQVwnrgZrS38r5r6syvgxpOodT1D/0
	rkt4DgPVEFqIDY+Wzz0yItgg6PfFUuE8ZwG94oV6FxCIE7qdJ6dTbCOA+dKP85tt5I90w3M90kP2S
	NhdTpa2nUsxaxmQDBAV05+NzWCcSVLAYxJ4HXfyTyJbBJislF+1c4JjWOgphF+85aq59xDzHd8yQ6
	1Tog3AQsnjYp3gAlhabcmFuIhkFEZtbO60GZXXls1z2+qhG1JUaRBDhQPBhWy5EQ7NLA+0YODiPPR
	pGmJAliA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTg8-0000000CviJ-3anb;
	Wed, 05 Nov 2025 02:55:21 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTg6-0000000CvhN-2Gho
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 02:55:19 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-294fb21b068so71333195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 18:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762311317; x=1762916117; darn=lists.infradead.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RzRgxKaFFDli8ftuhQFfyH2ObKCMh7+2PDYIIzQvueg=;
        b=Xr0M6l61PVfJXjOTFwXBulESIrHV8W4UVpTLtT1mxCGLkCCbhqJfML97BwHlSQDjai
         ABxRBugRSP6WQyZKUjClnECreGiWo2aJ+J1VeNxqeYzc2eAc9n9SGkwsL2ub3FFf4cnD
         jRZbUl871Qugq0+XF06Ql8cLZobLnwT+JVPaPvuiv6OB7ObR82WEROY+zcWuW00MHtcR
         VDOmVG9k4O04DurCxOG+CmmYlvuSPEfTlfQZTByP7/iXjsVIxMD99+KnGRJC55RIFuGF
         znDSOvRI4EHvwc0hLodrN6z0pAyxv3dKH7ychCypnJwdq92Jvtv6+/IePd/IfMJ4S192
         pZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762311317; x=1762916117;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzRgxKaFFDli8ftuhQFfyH2ObKCMh7+2PDYIIzQvueg=;
        b=E/INAAg+EaXRiBDNMhuZbvd2+h64DnqBYu9ID8HEdriSIuUounCPyKBO8jEzH0jvCA
         YM0rbxoNEyicvOEd/zm+zheObgMwFrLBevONiYzp1PgeMuqiu5rBjU2nCfA8hgQPHWVr
         D6yPiYHQFDzWZIC4qlMgulQBM8kQnWeE+pYJEZqxbNnUvSqPYUzmm0CJW2zz1iqbWSuz
         zv/WAAksAkMNBuRXkcQOQUj2dRxVZQ62xYnVaDRfHiJBLduMKGG8dB2aiyh5M0Jq6oP5
         35msNkFAWJuZt1iiZx5m8VuoBNSIU7be2nNnLBPpmo8LOCYFPVm4MI45/VrMg3UeAYSZ
         H0LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZv/Uy6LUfncs9uYkWz01Nt/Wvt+rUCbYKq91Vbd0kCxZMlU/rXMI6WcPffzc2/1SrmuEotBKu+1VqIn3IzLRU@lists.infradead.org
X-Gm-Message-State: AOJu0YyI4jIiPZmxvY1Z+yqso+p13IfYEK8rXqUjU9MMtvoFVSPK/gQa
	TgK3mwycyyUMqCMdgBzVYO9xR6YATojznLNahM14o54aX7R3Q7HgSvvP/mkra0ET
X-Gm-Gg: ASbGncv9bka0Bjs6TzGOi9sRdke+LMt7UwCNP+tsKJZYuU9YP0wwlDmlMOke9t4UIqq
	aIwQYAFnN9cnykszPrgiox8LHRiRjcEaosDoMGGtHkReAnGlLhxekMru/z+gGOVxLobrkpI5F1l
	pwh5V8FdvU7y0Zr97aG7PBNFMkFKfBLfOd/yq3pkCYt1jWxflVXaFr9eyPHt00IC3WIchJPrpUI
	V0hTA0TIb3gJPEr/qjiDnG+HkVoFe0UwjGsrjX7ZRweo+iBgRgXhJIrtNRyAhZfakOQn+zfUBEI
	giIH4RFWbgsj+tVKRyGHDXVRqqhuuMbhFSrY248jQqySwCZl6tMKijtVqSni0uuEXlDyFeifFnT
	gzvCZXrwQ2uuKnysgfpdra8MrHNmRr8LNlqR5fgOAZr/irB4RBf4HRAOQ9rE/03Zk052KQA==
X-Google-Smtp-Source: AGHT+IGwTm7URkxWPNS/uaQT82VrA80foZj+Jgsm9GWgCIbhw60EG5vfai2y+vo+uSLgfxHG3bwlGg==
X-Received: by 2002:a17:903:3c4b:b0:293:33b:a9b0 with SMTP id d9443c01a7336-2962ae10998mr22075795ad.32.1762311317247;
        Tue, 04 Nov 2025 18:55:17 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601b8f28esm43621645ad.5.2025.11.04.18.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 18:55:16 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v4 01/12] powerpc/64s: Do not re-activate batched TLB flush
In-Reply-To: <20251029100909.3381140-2-kevin.brodsky@arm.com>
Date: Wed, 05 Nov 2025 08:16:58 +0530
Message-ID: <87qzud42n1.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-2-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_185518_590373_AEF9E1E5 
X-CRM114-Status: GOOD (  26.70  )
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

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> From: Alexander Gordeev <agordeev@linux.ibm.com>
>
> Since commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
> lazy mmu mode") a task can not be preempted while in lazy MMU mode.
> Therefore, the batch re-activation code is never called, so remove it.
>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/powerpc/include/asm/thread_info.h |  2 --
>  arch/powerpc/kernel/process.c          | 25 -------------------------
>  2 files changed, 27 deletions(-)
>

Since the commit referenced in above disables the preemption in
arch_enter_lazy_mmu(), so the expectation is that we will never be
context switched while in lazy_mmu, hence the code changes in
switch_to() around __flush_tlb_pending() should ideally never be called.

With this analysis - the patch looks good to me. I will give this entire
patch series a try on Power HW with Hash mmu too (which uses lazy mmu and
let you know the results of that)!

For this patch please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


CC: Venkat who also runs CI on linux Power HW for upstream testing :)

-ritesh


> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index b0f200aba2b3..97f35f9b1a96 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -154,12 +154,10 @@ void arch_setup_new_exec(void);
>  /* Don't move TLF_NAPPING without adjusting the code in entry_32.S */
>  #define TLF_NAPPING		0	/* idle thread enabled NAP mode */
>  #define TLF_SLEEPING		1	/* suspend code enabled SLEEP mode */
> -#define TLF_LAZY_MMU		3	/* tlb_batch is active */
>  #define TLF_RUNLATCH		4	/* Is the runlatch enabled? */
>  
>  #define _TLF_NAPPING		(1 << TLF_NAPPING)
>  #define _TLF_SLEEPING		(1 << TLF_SLEEPING)
> -#define _TLF_LAZY_MMU		(1 << TLF_LAZY_MMU)
>  #define _TLF_RUNLATCH		(1 << TLF_RUNLATCH)
>  
>  #ifndef __ASSEMBLER__
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index eb23966ac0a9..9237dcbeee4a 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1281,9 +1281,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
>  {
>  	struct thread_struct *new_thread, *old_thread;
>  	struct task_struct *last;
> -#ifdef CONFIG_PPC_64S_HASH_MMU
> -	struct ppc64_tlb_batch *batch;
> -#endif
>  
>  	new_thread = &new->thread;
>  	old_thread = &current->thread;
> @@ -1291,14 +1288,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
>  	WARN_ON(!irqs_disabled());
>  
>  #ifdef CONFIG_PPC_64S_HASH_MMU
> -	batch = this_cpu_ptr(&ppc64_tlb_batch);
> -	if (batch->active) {
> -		current_thread_info()->local_flags |= _TLF_LAZY_MMU;
> -		if (batch->index)
> -			__flush_tlb_pending(batch);
> -		batch->active = 0;
> -	}
> -
>  	/*
>  	 * On POWER9 the copy-paste buffer can only paste into
>  	 * foreign real addresses, so unprivileged processes can not
> @@ -1369,20 +1358,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
>  	 */
>  
>  #ifdef CONFIG_PPC_BOOK3S_64
> -#ifdef CONFIG_PPC_64S_HASH_MMU
> -	/*
> -	 * This applies to a process that was context switched while inside
> -	 * arch_enter_lazy_mmu_mode(), to re-activate the batch that was
> -	 * deactivated above, before _switch(). This will never be the case
> -	 * for new tasks.
> -	 */
> -	if (current_thread_info()->local_flags & _TLF_LAZY_MMU) {
> -		current_thread_info()->local_flags &= ~_TLF_LAZY_MMU;
> -		batch = this_cpu_ptr(&ppc64_tlb_batch);
> -		batch->active = 1;
> -	}
> -#endif
> -
>  	/*
>  	 * Math facilities are masked out of the child MSR in copy_thread.
>  	 * A new task does not need to restore_math because it will
> -- 
> 2.47.0

