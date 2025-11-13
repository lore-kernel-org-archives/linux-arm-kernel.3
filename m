Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0356DCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 07:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4ie9nWkncZ3cv8xdi5OzMmGRGX86lWEjgjZYnVw6xo=; b=ud6d+stH7E45fd2u1xSffW15PR
	ulHqzoM2v8ZHn66lwwNmhPle81nKBPpDagy/Zw3FWrKkELuAZxLJsAqJK6aYz8wqLJWp41ROoy+Nf
	KdjsMBthpCwVEEXj0swxXK/egddiqJwusfAmetp7cmkixPq3mdX81O5tVVZN+ky2pAQHsRzqOKLoR
	OisiwevdGJYIKkVlTZFbhjIj2DQ1b6KgQulWSPkgyUVBXHeWb4a+G9CLwdeoPYdTkdf+WPkMnbloJ
	2C7GlhRLl/Og7qI1uyc/gknPqSFZPIuw7Bu0oKI9rZW+MAjpOOK0ATAVnwA1zMBSWmuFzXlM4ts8C
	+KaEZxXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJS6o-0000000A1Wt-30GM;
	Thu, 13 Nov 2025 07:51:10 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJS6m-0000000A1WW-3KBp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 07:51:09 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b73161849e1so77826266b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 23:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763020266; x=1763625066; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z4ie9nWkncZ3cv8xdi5OzMmGRGX86lWEjgjZYnVw6xo=;
        b=TyG8RzafHfPfxSQCeK/LXn5UvQ0crMVACzDgbAOGrSWxoxq99c9GrJK4Vcq8Nn9TzC
         zkskPNhXnj+VnHkLwe/rG3pcYUx5iCKUuSHGUDiSj1iqlto1KWI0TbdLoXVeS5mJsgHf
         TIM3VdYUUochuSRRGXwhPCOC3B2dB4L0uVstJ5/uCRoW0sK2LUoZ6651QVA8tnhqxbk/
         4A85QsO8SCEYaYz5KsycgoBtjteo2B9D+tlzQZnUo1H3/xd185hWx3sWxesFX7uhUktd
         hxeXkW5E8RGDn5Rc86JW+rSF3DDIVVRzxwr5ODIhdRqaplvikzafxY/zLU5wiMETpl0H
         IiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763020266; x=1763625066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4ie9nWkncZ3cv8xdi5OzMmGRGX86lWEjgjZYnVw6xo=;
        b=QLb67HdN7ewUny9lHrpBq4Qd9ryKvDeOQh45BAowo1bwKTM27MOMCwfroonoFDLWfY
         QHpdiqjoZMKAYwU8p2asAxILoaIqYW6aNJOr4KpAGUaLTkid8E948q113p402AqFVTw1
         SoAzX5BBjRxIzn6uaO+kZEIWXjj1rNpB/qUcwKPluA7yTBxZBBVX1yck0LySrGp0KPDT
         ZkaC2LgDeWaHcToqOzj99EiIKOgjpXzE5XlRrJzcTD7y7H/7LhZ/2gdrWnD6x++V6eYM
         6oIIUyCasaXyqdrWnJIWsQKKaS8NQAsns59zbUsALWJ8pZtwNJzQjOPfLqyZosMNjRcM
         IEPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0acMc4lgwSrb0oqGuQ8tl1jCWC53q9Z14fHgYGTf4jfR9xY3RDmQyVoX0buaCeph1CZPBup2IOIo7V9El2o+p@lists.infradead.org
X-Gm-Message-State: AOJu0YzDTSkjwIeBYj+qqpdczYrWj/wx4saLF4n8eMtvAHyg3vkaRNxY
	N8s2330QTxSeHktSQc68Q/cXKBhig0aDb3Wtu6qeILXd6q0bdSLI4avs
X-Gm-Gg: ASbGncvK9ZvjFsiwwXnDfUsxGSKiQZ2bpE1hLEmj/V+yV5BIoexgPRQksnAk7J4m3Lf
	RP3QiHnk1VV3zx1lQMVpn7EHNxb5CIGKBTYRz4XqE6Oilt6by+Mr320l+QHnfJw2a4CaIWX4sAs
	WmSwLggeW81+wTQAkf8MsGcHUWWaHt6cEmkEa+irOnAW8v5LY9jShXo9Ft56Qjfi4oEKXwkAzhd
	weRqJYmxBrZ+zZh2hqcWsDvuKbpMAIAhPNTmSHY3lfeM8kuhBh73VWsjFXFYQH6et8hGM1ZbpMg
	sAvhuQ2J/5PpEy7sIWZJE5UvSe9TKbqrCxsGoLdiAVgeBMtnQZ7eWMb97vwBCEc+CX1NykB8qmm
	1QWfRqSqMIfKHiTp2lJBoZHtMXhi4Y2pc5P6o+6RyZn3VlxH26GtGMatC0fUojxUfpU7ND8pyw5
	Y2EY9IYEFZNPT0B8lKGklLizk=
X-Google-Smtp-Source: AGHT+IHVrkl5ftPUCc2idnw2qC4J8BRUimnWx6JJY1s/gQB+ln/cURHHPYk7pTtS8ycN6UhNj5km9g==
X-Received: by 2002:a17:906:794e:b0:b3d:98fa:b3fe with SMTP id a640c23a62f3a-b7331b307e2mr650559466b.63.1763020266209;
        Wed, 12 Nov 2025 23:51:06 -0800 (PST)
Received: from krava (37-188-200-155.red.o2.cz. [37.188.200.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7359bfb238sm13421466b.14.2025.11.12.23.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 23:51:05 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 13 Nov 2025 08:51:00 +0100
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Yonghong Song <yhs@fb.com>, Song Liu <songliubraving@fb.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mahe Tardy <mahe.tardy@gmail.com>
Subject: Re: [BUG/RFC 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <aRWN5EnjEekA5VE4@krava>
References: <20251105125924.365205-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105125924.365205-1-jolsa@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_235108_872428_9D3688D8 
X-CRM114-Status: GOOD (  26.01  )
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

ping, thanks

jirka

On Wed, Nov 05, 2025 at 01:59:23PM +0100, Jiri Olsa wrote:
> hi,
> Mahe reported issue with bpf_override_return helper not working
> when executed from kprobe.multi bpf program on arm.
> 
> The problem seems to be that on arm we use alternate storage for
> pt_regs object that is passed to bpf_prog_run and if any register
> is changed (which is the case of bpf_override_return) it's not
> propagated back to actual pt_regs object.
> 
> The change below seems to fix the issue, but I have no idea if
> that's proper fix for arm, thoughts?
> 
> I'm attaching selftest to actually test bpf_override_return helper
> functionality, because currently we only test that we are able to
> attach a program with it, but not the override itself.
> 
> thanks,
> jirka
> 
> 
> ---
>  arch/arm64/include/asm/ftrace.h | 11 +++++++++++
>  include/linux/ftrace.h          |  3 +++
>  kernel/trace/bpf_trace.c        |  1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> index ba7cf7fec5e9..ad6cf587885c 100644
> --- a/arch/arm64/include/asm/ftrace.h
> +++ b/arch/arm64/include/asm/ftrace.h
> @@ -157,6 +157,17 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
>  	return regs;
>  }
>  
> +static __always_inline void
> +ftrace_partial_regs_fix(const struct ftrace_regs *fregs, struct pt_regs *regs)
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
> index 7ded7df6e9b5..4cb1315522bb 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -205,6 +205,9 @@ ftrace_partial_regs(struct ftrace_regs *fregs, struct pt_regs *regs)
>  	return &arch_ftrace_regs(fregs)->regs;
>  }
>  
> +static __always_inline void
> +ftrace_partial_regs_fix(struct ftrace_regs *fregs, struct pt_regs *regs) { }
> +
>  #endif /* !CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS || CONFIG_HAVE_FTRACE_REGS_HAVING_PT_REGS */
>  
>  #ifdef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index a795f7afbf3d..7b5768ced9b3 100644
> --- a/kernel/trace/bpf_trace.c
> +++ b/kernel/trace/bpf_trace.c
> @@ -2564,6 +2564,7 @@ kprobe_multi_link_prog_run(struct bpf_kprobe_multi_link *link,
>  	old_run_ctx = bpf_set_run_ctx(&run_ctx.session_ctx.run_ctx);
>  	err = bpf_prog_run(link->link.prog, regs);
>  	bpf_reset_run_ctx(old_run_ctx);
> +	ftrace_partial_regs_fix(fregs, bpf_kprobe_multi_pt_regs_ptr());
>  	rcu_read_unlock();
>  
>   out:
> -- 
> 2.51.1
> 

