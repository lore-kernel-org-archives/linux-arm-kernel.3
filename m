Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A53DC53200
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 00:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZXWw/54kDIDx73XnHw22X7yeZR5LWN5LDGxddSIeDE=; b=Kze0ZOGP54L+HQPXcusCDvLWQd
	Gmguy6ggFaHMwpujjCc6R2ey/51DsOgEA/lBgE/RntnITreYRQkT5GTU/dkyZuNEdTZmJKzynO72f
	CChx9neSijlSnXNTxAL/XPmoujbKyYASHsx2jfEj8QGIY3LbsR0Y9yiYE+yOBXRRgqUcvK74bEwlA
	odobErWsprZL5+yrVk5L9AawKpCarV8bW8/iGkrRAy66VlSGSpdIWwQ1T8Oa30BUBqwavLj55Ldkw
	D2OjTw9F7GKUwc9UT35u49CcU/qUvfdevPN7E/HGhD6kG2sd2yMR7rHHp55K+cGCHzDSiZqLnb3Th
	LXEy3GsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpEF1-000000098tn-22fU;
	Thu, 30 Jul 2026 00:03:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpEF0-000000098ta-3E63
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 00:03:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24BAC41AEB;
	Thu, 30 Jul 2026 00:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B0A1F000E9;
	Thu, 30 Jul 2026 00:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785369794;
	bh=TZXWw/54kDIDx73XnHw22X7yeZR5LWN5LDGxddSIeDE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=i5nFSGTa54IX2AUca+NVsi84ye/eHv0R/PXeVpCmikWEvqGvVEgNq01rWwCctSwKK
	 mcSGvF3NJ2w4pKWWSewA8xqOsYR1ecGWQe+m9DBZu7LmSPKbIh1aJ98HRt7Qyvm0aV
	 oQk7YKhzp9qUhN5VQCcWwqtj/TSSi/pWOQCDTEYW3ZB1zG2vznlvzhwlgz66DRjFYR
	 +0oD2xTAN95YjfGa/2w0oug19eFahFBxbosPh8KDHTheLHoiAWJ+TvHESMEY8wz9Tk
	 brs3/patuZKp+2R16Bh8C86IZ9tQkrrWOxXOO+CNlRDXVDU4uXSwY1nS7XgB2UVAxH
	 A1t9WCsd6A78A==
Date: Thu, 30 Jul 2026 09:03:07 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <steven@rostedt.org>
Cc: Hongyan Xia <hongyan.xia@transsion.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Oleg Nesterov
 <oleg@redhat.com>, Naveen N Rao <naveen@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Jiazi Li <jiazi.li@transsion.com>,
 Pu Hu <hupu@transsion.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "linux-trace-kernel@vger.kernel.org"
 <linux-trace-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>
Subject: Re: [RFC PATCH 9/9] arm64/debug: Mark debug exception helpers
 __always_inline
Message-Id: <20260730090307.24d3e4b1041f30d87d390e1c@kernel.org>
In-Reply-To: <20260729140846.3c18f437@gandalf.local.home>
References: <cover.1785153469.git.hongyan.xia@transsion.com>
	<eb38b41ae1b3216ec69fb45555ef5df57efd7b8d.1785153469.git.hongyan.xia@transsion.com>
	<20260729140846.3c18f437@gandalf.local.home>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 29 Jul 2026 14:08:46 -0400
Steven Rostedt <steven@rostedt.org> wrote:

> 
> Masami,
> 
> 
> On Mon, 27 Jul 2026 12:25:48 +0000
> Hongyan Xia <hongyan.xia@transsion.com> wrote:
> 
> > From: Hongyan Xia <hongyan.xia@transsion.com>
> > 
> > Static inline should be enough to actually inline functions for most
> > compilers, but my Clang-19 somehow thinks it's better to outline them.
> > These tiny helpers then live in normal .text sections instead of
> > .noinstr sections, violating noinstr.
> > 
> > Mark them __always_inline so the compiler can never outline them.
> > 
> > Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> > ---
> >  arch/arm64/include/asm/esr.h       | 2 +-
> >  arch/arm64/include/asm/percpu.h    | 2 +-
> >  arch/arm64/include/asm/preempt.h   | 4 ++--
> >  arch/arm64/include/asm/ptrace.h    | 4 ++--
> >  arch/arm64/kernel/debug-monitors.c | 2 +-
> >  include/linux/kprobes.h            | 8 ++++----
> 
> Are you OK with this patch? If so, can you ack it?

Yeah, this patch looks good to me. Anyway these are expected to be
inlined.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

For other patches, Sashiko noted some comments, I need to check it.

Thank you,

> 
> -- Steve
> 
> >  6 files changed, 11 insertions(+), 11 deletions(-)
> > 
> 
> [..]
> 
> > diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
> > index 8c4f3bb24429..5880445ed0f0 100644
> > --- a/include/linux/kprobes.h
> > +++ b/include/linux/kprobes.h
> > @@ -384,17 +384,17 @@ static inline void kprobe_ftrace_kill(void) {}
> >  struct kprobe *get_kprobe(void *addr);
> >  
> >  /* kprobe_running() will just return the current_kprobe on this CPU */
> > -static inline struct kprobe *kprobe_running(void)
> > +static __always_inline struct kprobe *kprobe_running(void)
> >  {
> >  	return __this_cpu_read(current_kprobe);
> >  }
> >  
> > -static inline void reset_current_kprobe(void)
> > +static __always_inline void reset_current_kprobe(void)
> >  {
> >  	__this_cpu_write(current_kprobe, NULL);
> >  }
> >  
> > -static inline struct kprobe_ctlblk *get_kprobe_ctlblk(void)
> > +static __always_inline struct kprobe_ctlblk *get_kprobe_ctlblk(void)
> >  {
> >  	return this_cpu_ptr(&kprobe_ctlblk);
> >  }
> > @@ -449,7 +449,7 @@ static inline struct kprobe *get_kprobe(void *addr)
> >  {
> >  	return NULL;
> >  }
> > -static inline struct kprobe *kprobe_running(void)
> > +static __always_inline struct kprobe *kprobe_running(void)
> >  {
> >  	return NULL;
> >  }
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

