Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B97D0D141
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hbwAqQmwcKkcTQlzwNL4cPS7/2BgqWyWqgU0a+KMdc=; b=nEMgQiOR/qfmYdsSR4gi/R4a0g
	KLWztRwt+qzKBL0BwqAO27ycHzbGOAUATW1g91H7TpLNcWt95cocLXTC9FX1Oj19Qx1FWypDOjhxF
	8dIvCtqY8mlz9M0t5uwluUrt34KK/4vYuVUvsq5i0mqMVMfUiVsNSUwffDLCojWZOmLrQfeqFRH2q
	a2Z7sFUEdFn/nhiSgoItEXMNjEeSNOwja2Z2QtS+eghGchiIQ9WxgHP4N+XUKBOy8vKbxlanYU8f7
	8cNm40JNnrxxQgXOPLb3wErsNtZSl1bqCtN3oiNah7ss9iCjARwQvYL36mpmd67aa/uXlEc/phAf+
	xyOIwk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdX6t-0000000FMJ7-1IR9;
	Wed, 07 Jan 2026 17:14:15 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdX6q-0000000FMIl-2bhT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 17:14:13 +0000
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 0F98113AE00;
	Wed,  7 Jan 2026 17:14:08 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 6B0F92F;
	Wed,  7 Jan 2026 17:14:05 +0000 (UTC)
Date: Wed, 7 Jan 2026 12:14:32 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Will Deacon <will@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mahe Tardy <mahe.tardy@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Yonghong Song
 <yhs@fb.com>, Song Liu <songliubraving@fb.com>, Andrii Nakryiko
 <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <20260107121432.73fccf84@gandalf.local.home>
In-Reply-To: <aV6PZKx9g_hCz4ZW@willie-the-truck>
References: <20260107093256.54616-1-jolsa@kernel.org>
	<aV5qpZwxgVRu2Q8w@willie-the-truck>
	<20260107110814.1dfc9ec0@gandalf.local.home>
	<aV6PZKx9g_hCz4ZW@willie-the-truck>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6B0F92F
X-Stat-Signature: x699t8kczy5smeco8119n45nwyhjh7kg
X-Rspamd-Server: rspamout08
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/eu39LNRtM+1f1vTfX4QNOH6R7Y6POl28=
X-HE-Tag: 1767806045-271552
X-HE-Meta: U2FsdGVkX18bqAQ0pJDQFkJKpjD++ZFbUeHomqsNgRoCLor9V56o+Khto2aWB3wznp+gQ2/oE2h1SOvfL+LLrlkN8aerHgOvhp5QuGzQDrvm8wjk50Vo4f6vq+oc6JWvx2wiBBzZ2hZX5Vemc4FHjU/IDUy/Tv1J3di6HgNaVO+5rGvw/ktLj+UOI0+sMf/7CG5uwpl58yJgEdq7b+/+n+w28TiwBvwDT6ffskoAc39+I3kyasYoO2BbRAlNIeUQLEo/HDQr/sh/1PtHym0b+3rwzF5Hx7Cmjngd+TGtg5So6tMt07t6JeHSCHNk9YNPXZgETTRo6t3rcmtjaBukt9lCCBuUE+hd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_091412_724834_F16473AF 
X-CRM114-Status: GOOD (  13.12  )
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

On Wed, 7 Jan 2026 16:52:52 +0000
Will Deacon <will@kernel.org> wrote:

> diff --git a/include/linux/ftrace_regs.h b/include/linux/ftrace_regs.h
> index 15627ceea9bc..3ebd8cdac7c6 100644
> --- a/include/linux/ftrace_regs.h
> +++ b/include/linux/ftrace_regs.h
> @@ -33,6 +33,15 @@ struct ftrace_regs;
>  #define ftrace_regs_get_frame_pointer(fregs) \
>         frame_pointer(&arch_ftrace_regs(fregs)->regs)
>  
> +#else
> +
> +static __always_inline void
> +ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs)
> +{
> +       ftrace_regs_set_instruction_pointer(fregs, instruction_pointer(regs));
> +       ftrace_regs_set_return_value(fregs, regs_return_value(regs));
> +}
> +
>  #endif /* HAVE_ARCH_FTRACE_REGS */
>  
>  /* This can be overridden by the architectures */

Hmm, maybe that would work. Of course you forgot to add the helper for the
!HAVE_ARCH_FTRACE_REGS case ;-)

-- Steve

