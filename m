Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD6FCFD63E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrkTKIbyXsEGWqGI67Oim2UGb68eybLwM9OyxxOtW3A=; b=mkE+v3vae2NgklDVsNjD+JWfPM
	Cvzvj0wR9wyLcmLoTtdxbT6CBfAC43MIwG3b+LHj3fJkum+sDaN+v4VjkMimJIGv+GUp1NkXcfJ6B
	wXgzwS4ZtiTtmPAIWzKJes2Cy+TGd6PCJ06GkTi7rXmtCwcNqrMlXE7zYMxiulXyaEvJonsVOFBkB
	vwKfCnFdPEOYtX4PvrgjdK5UqFuX90mHOIC2DgETDUgQ1eFOPbEpPXgyA0p5Pc71cIdzF1xwyoviH
	COTQah0mMEg4txREi7fH43zJ4zGg/gv/TVFKJ5nYS0CojzDE+tuZX2WXFg4kQcJWYvsXMDQId0Lly
	CR0mxXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUKc-0000000F4NU-0BEv;
	Wed, 07 Jan 2026 14:16:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUKa-0000000F4NN-1Amn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:16:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 66E4A60007;
	Wed,  7 Jan 2026 14:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911F4C4CEF1;
	Wed,  7 Jan 2026 14:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795371;
	bh=Hfk0xs9mtMTgHWqYqiIZSwai97YK7tXfeXKFSxGISsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cOew/IROfm9qzOOTQIlOisZOSH2KDoX3TgEbHyuflgqC5Z5szpbbIyuEetC1flL6Y
	 SYTDzqJW12y5zkLVrJYPlpNkw9Wxr3Wl6b6qFj2lSry637N+RjGLs1BNZp3EX/T67s
	 doWTIk3TUg3TiyRXTEGzUuGaNUaYKOTU75qGJxUFaPkUDAdFQlmbe0SXBxJB+IQaq8
	 a1gL6Qy83KbVAlQgf6RA1sokeiZ2VtjnXC/YcLo3oT9GhG7GFW01i8XXcMFp9YP8Ju
	 1t/kHF5utWwL9fzUqEQ285i3g1aeqr3Kn+MnpolB5I9wfd2ytmGhbMHTjmxNF/kKxZ
	 YCtS4FD8oCXVw==
Date: Wed, 7 Jan 2026 14:16:05 +0000
From: Will Deacon <will@kernel.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>, bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Yonghong Song <yhs@fb.com>, Song Liu <songliubraving@fb.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <aV5qpZwxgVRu2Q8w@willie-the-truck>
References: <20260107093256.54616-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107093256.54616-1-jolsa@kernel.org>
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

On Wed, Jan 07, 2026 at 10:32:55AM +0100, Jiri Olsa wrote:
> Mahe reported issue with bpf_override_return helper not working when
> executed from kprobe.multi bpf program on arm.
> 
> The problem is that on arm we use alternate storage for pt_regs object
> that is passed to bpf_prog_run and if any register is changed (which
> is the case of bpf_override_return) it's not propagated back to actual
> pt_regs object.
> 
> Fixing this by introducing and calling ftrace_partial_regs_update function
> to propagate the values of changed registers (ip and stack).
> 
> Fixes: b9b55c8912ce ("tracing: Add ftrace_partial_regs() for converting ftrace_regs to pt_regs")
> Reported-by: Mahe Tardy <mahe.tardy@gmail.com>
> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> ---
> v1 changes:
>  - used ftrace_partial_regs_update with comments from Steven
> 
>  arch/arm64/include/asm/ftrace.h | 24 ++++++++++++++++++++++++
>  include/linux/ftrace.h          |  3 +++
>  kernel/trace/bpf_trace.c        |  1 +
>  3 files changed, 28 insertions(+)
> 
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

I still don't understand why we need anything new in the arch code for this.

We've selected HAVE_ARCH_FTRACE_REGS and we implement
ftrace_regs_set_instruction_pointer() and ftrace_regs_set_return_value()
so the core code already has everything it needs to make this work
without additional arch support.

Will

