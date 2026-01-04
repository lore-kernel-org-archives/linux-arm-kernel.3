Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FDBC2A062
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 13:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ht9osj/SlfdF9zdZ033/a5zuDLqi9fXmpDsm5KVVmII=; b=xvezxjKm9A2Zd9/rdAP7x9Dwhj
	JFq5s9DxW8UFDbgWW5l5zwmOCFWIisSh92yC735w2bLbdGMvGUFIoyHREsX6xQ+4e7+Qzwi8aCFCn
	flBCRPGGYf8Gu66ceH+W+rsFrUkWNYMuBaLjHt+qWBx/gR/XRXGc/JxpV63ofPL7iTEIc+yoMJYST
	YPnvY/NI/slQPm4u+ZhACoHxrkXLS/cEFCLl3eLyJtAXrOQmbaYAoL8U6j4KlmHHkmxHALKs/4P0M
	yrclfqN2KA9xSx+wWmf9+0F8iiC13pdgcG8stR+CO5dnkp5+JEGKlt7TVPN8ra7JuoVi+tUvrsG4b
	nPgehZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOFV-0000000AG45-3XWK;
	Sun, 04 Jan 2026 13:34:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOFT-0000000AG3h-14cV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 13:34:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 060FC40C57;
	Sun,  4 Jan 2026 13:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B715C4CEF7;
	Sun,  4 Jan 2026 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767533660;
	bh=N0L6XvnNB1qvZL1c++Orzx2mTUa1KFODZzyzqoGfs/w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LF2/Qqmx7cycOOAoJ7Vc+ukOjTVc4eYgk0QIxW0/1mYoC4aMyCkVQJ4E9IpPCmYRx
	 KpOnbyfpoY/W4/1N6l5dtg/PAAkl8sqH+aP72FXIagGjxMgtUGv0YCS9RR/h//5YmK
	 E5UJ6Dgiy+K30aACPyjyScD4p6FtWcsmKV318iNzEB3auutal8izRdVwhuh823H7CT
	 IA+wi+6VSaYCbS6h879ioIClNilpLhg/dWqg67qwGEY5b9KVeUUI8jNgvHyWoer/E5
	 2LjcBlceRrdIf9Mk8quOZ/FjxBSQHxKbyMWR8rrKdZTWTC6kShMUDYr17iHMLUNslr
	 MEj9it+WYZc1g==
Date: Sun, 4 Jan 2026 22:34:15 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Jiri Olsa <jolsa@kernel.org>, Will Deacon <will@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>,
 bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Yonghong Song
 <yhs@fb.com>, Song Liu <songliubraving@fb.com>, Andrii Nakryiko
 <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mahe Tardy
 <mahe.tardy@gmail.com>
Subject: Re: [BUG/RFC 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-Id: <20260104223415.0a31f423c861c0b651de966b@kernel.org>
In-Reply-To: <aVfbqYsWdGXu4lh8@willie-the-truck>
References: <20251105125924.365205-1-jolsa@kernel.org>
	<aVfbqYsWdGXu4lh8@willie-the-truck>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_053423_395676_AD116DDD 
X-CRM114-Status: GOOD (  29.10  )
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

On Fri, 2 Jan 2026 14:52:25 +0000
Will Deacon <will@kernel.org> wrote:

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

I agreed with using the generic APIs. Also, ftrace_partial_regs_fix() is
not self-explained. Maybe ftrace_regs_set_by_regs()?

Thank you,

> 
> Will


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

