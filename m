Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882A5606C445
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hzAzK+lE;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=q4HJidW4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8AMRBsRaVVrjH9DufOp64hCzIFx64y5T91ZTRdXBHRQ=; b=hzAzK+lEL/gOIg
	IdbzoX+A1aipU4uUiemsvHz+iAE3rBqqCGr46j5RlZNZ07cy5EWNDcirkjI4bZDoZbFxabt5wtiGk
	DH7IGYKo4lg92Qno2awvDhc96iwYZU4IsZBfgLAAh3YC/ts1Tw3ECXa10mPygIfrf7uYV7atwLL7U
	f5pDgrB5cIvIs9gykRIu43OOHZ5XQSyArUcIHup5UdxwnKbzCvkZkk2QIKjzIOFyQqHkYl7BQtfRq
	iw1Do0ZyUDesPkSCquuXuFvDolwzTjJSvACANOyslOP7JARF8nzdx1ijvB65M+sPCZw6drmQpkdgC
	oB9lYdbAf0zHDKy0zIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfj8-00000006Ocr-3ARD;
	Wed, 04 Nov 2026 18:28:50 +0000
Received: from out-249.mta0.migadu.com ([2001:41d0:1004:224b::f9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfj5-00000006Oc7-2Jit
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:28:49 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=mrdhsCyYkgJCthcE9mwZdhKXoi0YwuzvcjVgzOgRLv8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793816925; v=1; x=1794421725;
 b=q4HJidW4HJrNqiFBIHcbsJipJ2hJej+ltF1PWamu0xne+Xed0E5vOFgrYxsiM7Mk/cLRO0Cd
 mQDxrG4cRPCdBoLfFjJAE1TL/NnuDUq0T1RrBM+K5gGsxUq+467GsBSKISbUQPXrkMyqMGtZkrm
 Hib/cFoyMAjhnXZA3vZKnplc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id fb19e5cc26c67389;
	Wed, 04 Nov 2026 18:28:45 +0000
X-Mizu-Trace-ID: fb19e5cc26c67389
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Breno Leitao <leitao@debian.org>,
	Dawei Li <dawei.li@linux.dev>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: sdei: Run the event handler on the kernel vectors
Date: Wed,  4 Nov 2026 10:28:41 -0800
Message-ID: <20261104182842.3436759-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104180936.2981070-2-kas@kernel.org>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_102847_845400_47299AD4 
X-CRM114-Status: GOOD (  29.56  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed,  4 Nov 2026 18:09:33 +0000 "Kiryl Shutsemau (Meta)" <kas@kernel.org> wrote:

> With KPTI, VBAR_EL1 holds the trampoline vectors from the return to EL0
> until the next exception from EL0 maps the kernel and installs the
> kernel vectors. The trampoline vectors only handle exceptions from EL0;
> their current-EL half is zero-filled.
> 
> An SDEI event is dispatched regardless of PSTATE.DAIF, so it lands there
> whenever the CPU is in user space. The SDEI entry trampoline maps the
> kernel but leaves VBAR_EL1 alone. An exception taken by the handler then
> executes the zeros, takes an undefined instruction exception to the same
> vector, and loops there forever. The event never completes and the CPU
> is lost; RCU stall reports are the first sign of it.
> 
> RAS notifications land in user space whenever a task consumes the
> error, and NMI backtraces land wherever the CPU happens to be. The GHES
> handler takes no exception on its own, but any exception in the handler
> path does it: a WARN, a kprobe hit, or a fault fixed up by a _nofault()
> accessor.
> 
> Install the kernel vectors in do_sdei_event() when VBAR_EL1 holds the
> trampoline vectors, and restore it before returning to firmware,
> including when the handler fails. The IRQ-like resume into user space
> keeps using the interrupted value, as it must go through the trampoline
> to map the kernel.
> 
> Fixes: 79e9aa59dc29 ("arm64: sdei: Add trampoline code for remapping the kernel")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  arch/arm64/kernel/sdei.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
> index 778f2a1faac8..9fa2a3aeed48 100644
> --- a/arch/arm64/kernel/sdei.c
> +++ b/arch/arm64/kernel/sdei.c
> @@ -18,6 +18,7 @@
>  #include <asm/sections.h>
>  #include <asm/stacktrace.h>
>  #include <asm/sysreg.h>
> +#include <asm/vectors.h>
>  #include <asm/vmap_stack.h>
>  
>  unsigned long sdei_exit_mode;
> @@ -214,6 +215,20 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
>  	if (arm64_kernel_unmapped_at_el0())
>  		clobbered_registers++;
>  
> +	/*
> +	 * With KPTI, VBAR_EL1 holds the trampoline vectors from the return to
> +	 * EL0 until the next exception from EL0 maps the kernel. They only
> +	 * handle exceptions from EL0: an exception taken by the handler would
> +	 * run their empty current-EL half and never come back. Run the handler
> +	 * on the kernel vectors. The IRQ-like resume below keeps using the
> +	 * interrupted VBAR, so it still goes through the trampoline.
> +	 */
> +	if (arm64_kernel_unmapped_at_el0() &&
> +	    vbar == (unsigned long)this_cpu_read(this_cpu_vector)) {
> +		write_sysreg((unsigned long)vectors, vbar_el1);
> +		isb();
> +	}
> +

Does this cover the whole path that can take an exception?  The
swap is done inside do_sdei_event(), but __sdei_handler() calls
irqentry_nmi_enter() before it and irqentry_nmi_exit() after it,
and both of those still run with the trampoline vectors in
VBAR_EL1 when the event interrupted user space.

Both can take an exception.  ct_nmi_enter() opens with
WARN_ON_ONCE(ct_nmi_nesting() < 0), and ct_nmi_exit() has
WARN_ON_ONCE(ct_nmi_nesting() <= 0) and
WARN_ON_ONCE(!rcu_is_watching_curr_cpu()).  A WARN is a BRK, so
either would run the zero filled current-EL half and lose the CPU
in the way the commit message describes.

Would doing the swap in __sdei_handler(), around the whole NMI
entry and exit pair, close that window?


>  	/* Retrieve the missing registers values */
>  	for (i = 0; i < clobbered_registers; i++) {
>  		/* from within the handler, this call always succeeds */
> @@ -221,8 +236,6 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
>  	}
>  
>  	err = sdei_event_handler(regs, arg);
> -	if (err)
> -		return SDEI_EV_FAILED;
>  
>  	if (elr != read_sysreg(elr_el1)) {
>  		/*
> @@ -233,6 +246,11 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
>  		pr_warn("unsafe: exception during handler\n");
>  	}
>  
> +	write_sysreg(vbar, vbar_el1);
> +
> +	if (err)
> +		return SDEI_EV_FAILED;
> +
>  	mode = regs->pstate & (PSR_MODE32_BIT | PSR_MODE_MASK);
>  
>  	/*
> -- 
> 2.54.0
> 
> 

