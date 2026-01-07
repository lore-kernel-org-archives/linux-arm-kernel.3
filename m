Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D756ACFD658
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvyu8ngHIrvDt5M9MmXXt9nxxx7mdNT/GJSNCYaUTJU=; b=r9WnGzYjCNxGNqnGrgUscvb//8
	IM7An6nA4DF54E69myYG3enuiOmfpi4dFDUqU7A9SJjh1K/d+GUR2m2L3MUI7nTJkO6aai/kuy3rT
	QVaYwqSDbI+GmC+c1j8dNf9SyxiQ0dZ7q+MPICTPKQZVJk3hJ1wlpiEwawgjVbswLACDAcbniedfz
	cqEQ/k5EZFu3DlWS8twtEMdgjJJRmhfTYR7+myt0xyHXcYjRTtiRYeuhbBlOiplWE/yXlQOaZYLrD
	qvxrYAO6QXg+Mky7PAWS8IaCbY3wo0Rt0My7rrxyyJa7r+9s58X7OmwLISu9E6hfBUMvgOCf53s90
	4Gy1NrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdW0U-0000000FDtz-0HAR;
	Wed, 07 Jan 2026 16:03:34 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdW0R-0000000FDtB-1PTr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:03:32 +0000
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id BDE121A5130;
	Wed,  7 Jan 2026 16:03:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id E70AC20023;
	Wed,  7 Jan 2026 16:03:25 +0000 (UTC)
Date: Wed, 7 Jan 2026 11:03:52 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Will Deacon <will@kernel.org>,
 Mahe Tardy <mahe.tardy@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Yonghong Song
 <yhs@fb.com>, Song Liu <songliubraving@fb.com>, Andrii Nakryiko
 <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <20260107110352.3fd7ddda@gandalf.local.home>
In-Reply-To: <20260107093256.54616-1-jolsa@kernel.org>
References: <20260107093256.54616-1-jolsa@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: E70AC20023
X-Stat-Signature: 13qo46g6zpia7f3nofbp81nnodino9w7
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1957k6O/UsmSN3vUac32Bo7sXZIZwwkaaU=
X-HE-Tag: 1767801805-671253
X-HE-Meta: U2FsdGVkX18RsKY0dngVyvOKbOnb578X+xSZkEOG7hLLVWfcT997CreYeXdTXjiUBbrnEpEplun5zUoX/yIde/2G7I0khiiwc2+9R3i83hE5x9MaXQsj752xyWlfb1torPzACnrRGbNQRBs76gmyhpH81bHqH6l5Ph89iZObGEZbEZGFPfhDP4wmX4UEQOSAmpy+EanvESqs05MZHmkt+EhdhXlEt4bxk4hAlAIcQw42HV/JXn0BV2+43E+XurhE5vtIgIOTTqPOPf6C1dvfnCE7BZArazcQzYY63MXPU9eCBeI0YhZEhYxCQn/Q3+/MgFzPmaLc5W8Wh67jl6agKZJpPxz16ltc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_080331_437486_50A553B9 
X-CRM114-Status: GOOD (  19.22  )
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

On Wed,  7 Jan 2026 10:32:55 +0100
Jiri Olsa <jolsa@kernel.org> wrote:

> diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> index 1621c84f44b3..177c7bbf3b84 100644
> --- a/arch/arm64/include/asm/ftrace.h
> +++ b/arch/arm64/include/asm/ftrace.h
> @@ -157,6 +157,30 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
>  	return regs;
>  }
>  

See my reply in the other email thread:

  https://lore.kernel.org/all/20260107105316.2b70a308@gandalf.local.home/

-- Steve


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

