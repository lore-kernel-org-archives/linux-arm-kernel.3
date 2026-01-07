Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A13CFD647
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 15:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86D+szvwX8aWue5hgAtmq8l/feBJYFTNDI4i35iAdc4=; b=tYxII3/Y02addwx0e/7ymNOHVc
	ucUgSBzd2Hp5cPvJRxfaw3MVWvYbK6xcM5A5jxDICrwGwG/YxaDq/H5gOx3pBydmQaYaFFCq+wnux
	HjjGuBe3ws57Xk5qIe0VoqOR8h1dLxMZxvcH8d6Fpw0N3KWnd13Zw20Cc1C677SPkeq6Hh2QbMxTE
	EsTs3L+BGtfVS9s4pExBrVDdaYKmhUy6VIEs27iAVbGpdycii319KaAX0Ar8EwqYjgynsxKMPT4YN
	aM6o7F5+pSfLR6fDQFZAXPPObz6hIP6/GQ71/Rmxo8sMBXoB4npUrg2z7Rj3Kn+Vqmm0gHv0yN/ya
	vrYnfelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVqF-0000000FCOt-3tHv;
	Wed, 07 Jan 2026 15:52:59 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVqD-0000000FCNp-14fp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 15:52:58 +0000
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 5F3D8140441;
	Wed,  7 Jan 2026 15:52:52 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id A363F20019;
	Wed,  7 Jan 2026 15:52:49 +0000 (UTC)
Date: Wed, 7 Jan 2026 10:53:16 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Will Deacon
 <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Yonghong Song
 <yhs@fb.com>, Song Liu <songliubraving@fb.com>, Andrii Nakryiko
 <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mahe Tardy
 <mahe.tardy@gmail.com>
Subject: Re: [BUG/RFC 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <20260107105316.2b70a308@gandalf.local.home>
In-Reply-To: <aV4X5Yx07LomQji4@krava>
References: <20251105125924.365205-1-jolsa@kernel.org>
	<aVfbqYsWdGXu4lh8@willie-the-truck>
	<20260104223415.0a31f423c861c0b651de966b@kernel.org>
	<20260105162220.6ba5129a@gandalf.local.home>
	<aV4X5Yx07LomQji4@krava>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: d78ujc6wjwrs4np7zp9k9df8wcrg8spq
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: A363F20019
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19y53fBfBOjUg/Mlrbjm27/1NrjOMyHETA=
X-HE-Tag: 1767801169-452600
X-HE-Meta: U2FsdGVkX1+hldrlx96Y7+EcduT/AqiVoSH8QmMOWvVLBMrUv1IVv6IO41fhZ4RVAeaEuFfgunBNpxHvG1O1TGLPQ3JiX1a9nfHStvtPjZ+qC6M8Sj4BCMDlqjH//NEprQR2dFXHSO2Q85qKa8ZWd1JmEn8jCjbgD2LzKFFzpxSkbyws8Nw8h5fNGqR9CTdBpatoTRQgXUAqlhWk4gttSADniPTDpYyuvv2n2RwYFSFCyOQdUT8abxn44s6dkRK5JKxdWq5ttP5G1uGsINNp7MeadAIwBGYnyflqKunhECWqX14W7J8qUJy2BT5whAKLzhYH1LrALs1vk1R4DAhVELV+ikzLGxZWFRGjXFouFsoppxNwQBvckPM+gbwdLbSg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_075257_359773_5ECD027B 
X-CRM114-Status: GOOD (  23.48  )
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

On Wed, 7 Jan 2026 09:23:01 +0100
Jiri Olsa <olsajiri@gmail.com> wrote:

> ---
> diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> index 1621c84f44b3..177c7bbf3b84 100644
> --- a/arch/arm64/include/asm/ftrace.h
> +++ b/arch/arm64/include/asm/ftrace.h
> @@ -157,6 +157,30 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
>  	return regs;
>  }
>  
> +/*
> + * ftrace_partial_regs_update - update the original ftrace_regs from regs
> + * @fregs: The ftrace_regs to update from @regs
> + * @regs: The partial regs from ftrace_partial_regs() that was updated
> + *
> + * Some architectures have the partial regs living in the ftrace_regs
> + * structure, whereas other architectures need to make a different copy
> + * of the @regs. If a partial @regs is retrieved by ftrace_partial_regs() and
> + * if the code using @regs updates a field (like the instruction pointer or
> + * stack pointer) it may need to propagate that change to the original @fregs
> + * it retrieved the partial @regs from. Use this function to guarantee that
> + * update happens.
> + */

I think the kernel doc should go into the generic function, and this just say:

  /* See description of this function in the generic header */

or something similar.

Also, should probably have the description in the general function say:

  *
  * For architectures that need to update @fregs from @regs, this function needs to be
  * defined.

Or something similar.

-- Steve

> +static __always_inline void
> +ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs)
> +{
> +	struct __arch_ftrace_regs *afregs = arch_ftrace_regs(fregs);
> +
> +	if (afregs->pc != regs->pc) {
> +		afregs->pc = regs->pc;
> +		afregs->regs[0] = regs->regs[0];
> +	}
> +}
> +
>  #define arch_ftrace_fill_perf_regs(fregs, _regs) do {		\
>  		(_regs)->pc = arch_ftrace_regs(fregs)->pc;			\
>  		(_regs)->regs[29] = arch_ftrace_regs(fregs)->fp;		\
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 770f0dc993cc..ae22559b4099 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -213,6 +213,9 @@ ftrace_partial_regs(struct ftrace_regs *fregs, struct pt_regs *regs)
>  	return regs;
>  }
>  
> +static __always_inline void
> +ftrace_partial_regs_update(struct ftrace_regs *fregs, struct pt_regs *regs) { }
> +
>  #endif /* !CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS || CONFIG_HAVE_FTRACE_REGS_HAVING_PT_REGS */
>  
>  #ifdef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index 6e076485bf70..3a17f79b20c2 100644
> --- a/kernel/trace/bpf_trace.c
> +++ b/kernel/trace/bpf_trace.c
> @@ -2564,6 +2564,7 @@ kprobe_multi_link_prog_run(struct bpf_kprobe_multi_link *link,
>  	old_run_ctx = bpf_set_run_ctx(&run_ctx.session_ctx.run_ctx);
>  	err = bpf_prog_run(link->link.prog, regs);
>  	bpf_reset_run_ctx(old_run_ctx);
> +	ftrace_partial_regs_update(fregs, bpf_kprobe_multi_pt_regs_ptr());
>  	rcu_read_unlock();
>  
>   out:
> -- 

