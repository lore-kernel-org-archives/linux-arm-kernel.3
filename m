Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCD4CD0408
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 21:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNBBz22BNiYZmnE1VS1UVyX/0UoXiRRfFiVmzO9VkJk=; b=Lo4S18EHgX2D821BLx8yXIR07G
	qM6euY1wEZppTjnWwk/+Jye7rsrVS4j3srWenBpOYk0EDs0/Q3P8aprZawJvkNRtVai5nJnLsnQAS
	/WkqHz7A3H6cx/xd+TqSurTETTsdyTfaadFbuIZg81dsY9HnyYN+LqHi0UoORxJrdz4CQRcP/EeV0
	d3rYIvBWcWnSMNNQY+ndF4+OOir6QoOzqIxnrx1fpRajxVdlpDE9aJhrscMYNoMhICpsnFXtONzsj
	bIbcGYgjcdLBVIO6wwKNBbJ8xWRcPgTMJlgl0/Ro81Lrpl3NfXMV93R8spAer8z+haO+7c4KpYlbq
	rE9akrZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcs1k-0000000C7Lc-1m7Y;
	Mon, 05 Jan 2026 21:22:12 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcs1e-0000000C7LD-0iPX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 21:22:09 +0000
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 078001A0230;
	Mon,  5 Jan 2026 21:22:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id 5A2488000F;
	Mon,  5 Jan 2026 21:21:58 +0000 (UTC)
Date: Mon, 5 Jan 2026 16:22:20 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Yonghong Song <yhs@fb.com>, Song Liu
 <songliubraving@fb.com>, Andrii Nakryiko <andrii@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Mahe Tardy <mahe.tardy@gmail.com>
Subject: Re: [BUG/RFC 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <20260105162220.6ba5129a@gandalf.local.home>
In-Reply-To: <20260104223415.0a31f423c861c0b651de966b@kernel.org>
References: <20251105125924.365205-1-jolsa@kernel.org>
	<aVfbqYsWdGXu4lh8@willie-the-truck>
	<20260104223415.0a31f423c861c0b651de966b@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5A2488000F
X-Stat-Signature: xt5nzh7j77fp944s7jzizhee1d83wp5j
X-Rspamd-Server: rspamout08
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19QBzPgleTeDd4xKX+cLaHUy58FxQPd0Kc=
X-HE-Tag: 1767648118-884322
X-HE-Meta: U2FsdGVkX1+rGfZVoK/OULBRFq26IDTCOyJJZkPrf1/Qa14p2mE3SqwSd2AimRvlIvDVEd8pQgw0Y72mGmizrkSEvnjFQ91d+SsTt2Ihf1ODGxFW+OEY6DInWgnHijwrMtbOQ58FqR6KY7yGryX5bEkGZExbO4di5WotTjnQacEQ42hk8Ktkd7J9fG0WrCvcO97/OKDk+be0YtNFkroPVr4HXRGjix1N8zS6oUsNujtLAyaaVLmj5YsKDUOXe9fRTNDkdHckDe1ArW4kboKsHf2mGMb2i4ClK7czP2og0vQZQniUMj3+3yvA4v+IhIQWnzBFXkWNPqDrdzlbtpx/y5s3DpEYaggy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_132206_273674_9F2DCC92 
X-CRM114-Status: GOOD (  15.40  )
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

On Sun, 4 Jan 2026 22:34:15 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> > This looks a bit grotty to me and presumably other architectures would
> > need similar treatement. Wouldn't it be cleaner to reuse the existing
> > API instead? For example, by calling ftrace_regs_set_instruction_pointer()
> > and ftrace_regs_set_return_value() to update the relevant registers from
> > the core code?  
> 
> I agreed with using the generic APIs. Also, ftrace_partial_regs_fix() is
> not self-explained. Maybe ftrace_regs_set_by_regs()?

Or perhaps: ftrace_partial_regs_update() where you call it if you need to
update the regs.

/*
 * ftrace_partial_regs_update - update the original ftrace_regs from regs
 * @fregs: The ftrace_regs to update from @regs
 * @regs: The partial regs from ftrace_partial_regs() that was updated
 *
 * Some architectures have the partial regs living in the ftrace_regs
 * structure, whereas other architectures need to make a different copy
 * of the @regs. If a partial @regs is retrieved by ftrace_partial_regs() and
 * if the code using @regs updates a field (like the instruction pointer or
 * stack pointer) it may need to propagate that change to the original @fregs
 * it retrieved the partial @regs from. Use this function to guarantee that
 * update happens.
 */
static __always_inline void
ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs) {
	struct __arch_ftrace_regs *afregs = arch_ftrace_regs(fregs);

	if (afregs->pc != regs->pc) {
		afregs->pc = regs->pc;
		afregs->regs[0] = regs->regs[0];
	}
}

-- Steve

