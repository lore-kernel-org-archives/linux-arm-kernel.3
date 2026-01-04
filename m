Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EABC2A06C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 11:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHWuScMnE43MBF17SntuhCPn9/ypQW7BMwUOJWNkTIA=; b=qYcD337CufDJQaCJlfCRoxskhW
	JR0MuVdoWKg0nVJeaV825Lqwx0CozL6+cmnV0mD6Y6KCm2cKGFIldMHkHdHt0kOcQPbHAsEWDJNNp
	8DJIug9qGgFF3sdc62ciyJ1F54kQzTeXE+xwph7j6MuH73CRSNiJdd25s/ap/jtCeaXrRMLgeEV96
	L50BAQEBoj1zGLcOEC3LidK2cZIz8jyFrIHHwPsSyDUExxPhy3WsPigyaoTBfnn6VIdbpeIQGvMoJ
	bheO5phUJRKZJDB37cXeQc11wQBq5Fh7EHfJPPitLHWsQoP6P/q/GGguJivGnanJwZQpG6O9EuR/b
	AncpJgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMie-0000000AD49-0dMn;
	Sun, 04 Jan 2026 11:56:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMib-0000000AD3l-2zuw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 11:56:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so83684615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Jan 2026 03:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767527779; x=1768132579; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHWuScMnE43MBF17SntuhCPn9/ypQW7BMwUOJWNkTIA=;
        b=AEb7bdJucT/Fi6Noxnx6I1PwB/sBetXnU1wqClS95a3/M6kRz4nqZM9Gz8mgg1R1DR
         AI5iOmCg13DXicqf8NINmlkTljqZfG65nhShRcK20zrwOstvWBqKDiP0Xnys69nGlPaN
         lTUkbeIca7XmjtCHmU3EKwIRj68rTz8rDN1EXBCw9fyO+xp9m6duT7aIoLXAJQ6CYiJX
         IlrXxmuhsoyZ6HC9/LCC8J2TTgKsDYlDrBpBo1jDCyp80He3UAYVq7n4hm3fFrq+Jx6E
         0Vhan4wvIaj2H+EmTIB5WZLWl7PheNZR7blTWqjJEgnLYaN4mdWoPoMORujUq4efr9hd
         jSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767527779; x=1768132579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHWuScMnE43MBF17SntuhCPn9/ypQW7BMwUOJWNkTIA=;
        b=JflhCuLX9aaSR5V0rR+BBz+F993+AZdiYa6J2gPqvQyHn5gAijtvwPRmYe2ZUS7VM5
         XtmeuJBESR7RDjAbyp+5UhLkRUYn+YQ0cSq60TVWRG01erTk13YSZp0hfsB9EjNy+jOh
         p5sBb5Mjsp1/JBuhNdFFRiCfb0C7fdsdgnY6DgTgZR4mUuyzFwrgHcQE5Z24F//sPEMV
         UgMr4mFIBlI6SqZlr5elTqSTQPC6Jomlf5VkJ4fjVMdCtOprY5MQqVlA4+YCdQJcuzFO
         WwWeC2CmM4XOytZswlWCb4hkUJaHtEF6emktKpysBkeBDqyL/M2ZBWNn+jEwxYtMWHBU
         5H+g==
X-Forwarded-Encrypted: i=1; AJvYcCVQ3FPgXt6DDMu1EofITtjAZmDUG44m8d/mE4/crV5suQJ71AWfMAtORqaNcLooqtiewRRyfF9wF8KGBalBsl4b@lists.infradead.org
X-Gm-Message-State: AOJu0YxCRoZ9Y8u+utFGQ8YYCZ2keHi5tLl0vDS/LXzHeG8Fv6asNZ1X
	9/NGm/0hQD9EIqvpD2X2eKYj2/hcOoWh/ar0u4bWI+ipoIAOYHTmWSo9
X-Gm-Gg: AY/fxX4R6xoLrp25ZMHQoQwjDFyfZXR+0rsXpLqLzJAfn/afRnfBkyUf6D/epu3GUu6
	YhasuJSvtzrRRcO12zkTKfSooXVEpwlDYYOCqp2jJMoJEBiiSRsDgOIiZM6V4HOT+Nf3N04ftJR
	ohOnCtODHqTfUciNZHNVdwNEGemmP1eShSop4RMSkDQFauuXvWIXtZmq6k/Uin0q0Ei/rhLZUFM
	PzepNrvzX0GCnTKmCeyArIGEyJrhyrMkY6lRxxvVG6mgkeBJU/bs4q7Vdc+B7VHKkzl/CUH2HoH
	b4xEFO+A+SFvt2bG+qEzio2lwDH0xeZ5yNtq1W3nXrwh4xqWMXI5AZiCHWnf/coy77CD+dGzG4g
	ZT+G7fBCk2LsTgL8WcMIP1PI+KNL2c9dIL0JgY8n6wNykhYO8HM5pJndSFB/8
X-Google-Smtp-Source: AGHT+IHIZnfdFKqNFB8eAXksIPvZyz9IWgsHY++6OlvULt6SnYStqYI9H7OUETi7olVZTWz0wUJceA==
X-Received: by 2002:a05:600c:a31c:b0:47d:264e:b435 with SMTP id 5b1f17b1804b1-47d264eb68dmr411443735e9.22.1767527779267;
        Sun, 04 Jan 2026 03:56:19 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::b44f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6ba5001esm36036965e9.3.2026.01.04.03.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 03:56:18 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sun, 4 Jan 2026 12:56:17 +0100
To: Will Deacon <will@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>, bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Yonghong Song <yhs@fb.com>, Song Liu <songliubraving@fb.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mahe Tardy <mahe.tardy@gmail.com>
Subject: Re: [BUG/RFC 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <aVpVYUaBOWk22RtO@krava>
References: <20251105125924.365205-1-jolsa@kernel.org>
 <aVfbqYsWdGXu4lh8@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVfbqYsWdGXu4lh8@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_035621_796273_1EE1DC30 
X-CRM114-Status: GOOD (  33.24  )
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

On Fri, Jan 02, 2026 at 02:52:25PM +0000, Will Deacon wrote:
> On Wed, Nov 05, 2025 at 01:59:23PM +0100, Jiri Olsa wrote:
> > hi,
> > Mahe reported issue with bpf_override_return helper not working
> > when executed from kprobe.multi bpf program on arm.
> > 
> > The problem seems to be that on arm we use alternate storage for
> > pt_regs object that is passed to bpf_prog_run and if any register
> > is changed (which is the case of bpf_override_return) it's not
> > propagated back to actual pt_regs object.
> > 
> > The change below seems to fix the issue, but I have no idea if
> > that's proper fix for arm, thoughts?
> > 
> > I'm attaching selftest to actually test bpf_override_return helper
> > functionality, because currently we only test that we are able to
> > attach a program with it, but not the override itself.
> > 
> > thanks,
> > jirka
> > 
> > 
> > ---
> >  arch/arm64/include/asm/ftrace.h | 11 +++++++++++
> >  include/linux/ftrace.h          |  3 +++
> >  kernel/trace/bpf_trace.c        |  1 +
> >  3 files changed, 15 insertions(+)
> > 
> > diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> > index ba7cf7fec5e9..ad6cf587885c 100644
> > --- a/arch/arm64/include/asm/ftrace.h
> > +++ b/arch/arm64/include/asm/ftrace.h
> > @@ -157,6 +157,17 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
> >  	return regs;
> >  }
> >  
> > +static __always_inline void
> > +ftrace_partial_regs_fix(const struct ftrace_regs *fregs, struct pt_regs *regs)
> > +{
> > +	struct __arch_ftrace_regs *afregs = arch_ftrace_regs(fregs);
> > +
> > +	if (afregs->pc != regs->pc) {
> > +		afregs->pc = regs->pc;
> > +		afregs->regs[0] = regs->regs[0];
> > +	}
> > +}
> 
> This looks a bit grotty to me and presumably other architectures would
> need similar treatement. Wouldn't it be cleaner to reuse the existing
> API instead? For example, by calling ftrace_regs_set_instruction_pointer()
> and ftrace_regs_set_return_value() to update the relevant registers from
> the core code?

I knew I forgot some change.. thanks for replying

ftrace_partial_regs is overloaded in arm64 and because of that we need
to propagate the change to pt_regs, so I think the ftrace_partial_regs_fix
code is arm64 specific, so can't see that in core code

also wrt ftrace_partial_regs_fix name, I was thinking it might be better
to have begin/end functions, like:

  ftrace_partial_regs_begin
  ftrace_partial_regs_end

thanks,
jirka


--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -2560,10 +2560,11 @@ kprobe_multi_link_prog_run(struct bpf_kprobe_multi_link *link,
 	}
 
 	rcu_read_lock();
-	regs = ftrace_partial_regs(fregs, bpf_kprobe_multi_pt_regs_ptr());
+	regs = ftrace_partial_regs_begin(fregs, bpf_kprobe_multi_pt_regs_ptr());
 	old_run_ctx = bpf_set_run_ctx(&run_ctx.session_ctx.run_ctx);
 	err = bpf_prog_run(link->link.prog, regs);
 	bpf_reset_run_ctx(old_run_ctx);
+	ftrace_partial_regs_end(fregs, bpf_kprobe_multi_pt_regs_ptr());
 	rcu_read_unlock();
 
  out:

