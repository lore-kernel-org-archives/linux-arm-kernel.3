Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6980D0D143
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzdT4LNR7504Y+BrGqwCeK7rZnSgwTwnSN4cseQ/E9g=; b=SOGqwv2WmOwKzFY/inlIRF9Dg+
	QTDhKtReAlnjPJ7uw3QrzwPUDx4+hCKmYbsdC0vEcXWnsskN6iycxFuhGxBDt8lBpyuRpmINrZeQZ
	nMSQt76uB+zdH0W5bJ3gYHZYKr37ADuGy1Ml6h9qU3rR/jw9y/e7LPjDlNuZL92h5RqPhYbhu7sB2
	HaCBJcvptLr4wf/dsz5wE79aOMOi2k58yaOWMA57ZeOMJAAMgBlAfv0Pt3Tfm7jT5y6ILozTF7mma
	WNeFBTQEGVCSW4kll11yqMeVLvPgHM5iE7OMl2exZ8NPcZN50MwbmIAUffaTLWwlmJ5KyP9dr8xsO
	GTWoFtJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWmL-0000000FL3G-1x6y;
	Wed, 07 Jan 2026 16:53:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWmJ-0000000FL2o-13y8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:52:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D00B6000A;
	Wed,  7 Jan 2026 16:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F72FC4CEF1;
	Wed,  7 Jan 2026 16:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767804777;
	bh=Shd5mmE6P/nw2xrOG+cMibnmSWeGIUUuJFYBTbfi5iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JnoEz4JtCLop4X4PmitW0XkO8WuKzicKzFLLTRTvi8ez8CGlhK54G4YScYsh9Ny5S
	 4FeGWKN/7H+ylfe6GSdmvtSgPm0tx2MGAM0ncv1D7TgCEOPZWHM/6w5grHuSm9RQrQ
	 rKRxdpls3RItooMiVVpE8eSHq/vRIf1Hg2bqtKZpZlYzdAVFuXzQn//ya/AQaFQnAp
	 JoVf+NygHhhbt/Dl9xa/Jk+iqK6u+8VeUw6zK+Liy2ipvCRPW+HbFjImnISDkwWLZC
	 XDTnAOHFZTietBXOkVibkpFNiEzUwSPjq1jomQ+E6bomd+y+5+VA/X1e65HUBkUqNX
	 xLkxAWB3iaMeA==
Date: Wed, 7 Jan 2026 16:52:52 +0000
From: Will Deacon <will@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>, bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Yonghong Song <yhs@fb.com>, Song Liu <songliubraving@fb.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <aV6PZKx9g_hCz4ZW@willie-the-truck>
References: <20260107093256.54616-1-jolsa@kernel.org>
 <aV5qpZwxgVRu2Q8w@willie-the-truck>
 <20260107110814.1dfc9ec0@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107110814.1dfc9ec0@gandalf.local.home>
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

On Wed, Jan 07, 2026 at 11:08:14AM -0500, Steven Rostedt wrote:
> On Wed, 7 Jan 2026 14:16:05 +0000
> Will Deacon <will@kernel.org> wrote:
> 
> > I still don't understand why we need anything new in the arch code for this.
> > 
> > We've selected HAVE_ARCH_FTRACE_REGS and we implement
> > ftrace_regs_set_instruction_pointer() and ftrace_regs_set_return_value()
> > so the core code already has everything it needs to make this work
> > without additional arch support.
> 
> I believe the issue is that the BPF code takes a pt_regs and does the
> update directly with that, and not the ftrace_regs.
> 
> I'm guessing this is due to BPF programs modifying the pt_regs directly,
> and BPF programs do not yet understand ftrace_regs?
> 
> Because arm64 requires making a copy of pt_regs as the ftrace_regs has a
> different layout, and the ftrace_regs is what does the changes, if the
> pt_regs passed to the BPF program modifies the values it needs a way to
> propagate that back to the ftrace_regs.

Sure, but isn't that exactly what selecting HAVE_ARCH_FTRACE_REGS says,
and so any other architecture (i.e. riscv) using a separate structure
will run into the same problem?

In other words, add the helper to the core code along the lines of the
diff below (purely untested, just to illustrate what I'm trying to get
at).

Will

--->8

diff --git a/include/linux/ftrace_regs.h b/include/linux/ftrace_regs.h
index 15627ceea9bc..3ebd8cdac7c6 100644
--- a/include/linux/ftrace_regs.h
+++ b/include/linux/ftrace_regs.h
@@ -33,6 +33,15 @@ struct ftrace_regs;
 #define ftrace_regs_get_frame_pointer(fregs) \
        frame_pointer(&arch_ftrace_regs(fregs)->regs)
 
+#else
+
+static __always_inline void
+ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs)
+{
+       ftrace_regs_set_instruction_pointer(fregs, instruction_pointer(regs));
+       ftrace_regs_set_return_value(fregs, regs_return_value(regs));
+}
+
 #endif /* HAVE_ARCH_FTRACE_REGS */
 
 /* This can be overridden by the architectures */


