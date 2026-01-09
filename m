Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CCFD1A623
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 13:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNJ/URyboV3qmggSKMnI01TP+ce3UFJ0WOImS1SFBIg=; b=i27wHpA/53XFHw8r60neLLL+oe
	A1ykmWJzB4cbjekxodidPxgjsQQY0MEPGjLdn/aAyIdZKpYBDizXeLUxYT+bFYTyh+gdwJ2MIrKH/
	N7O1vMtVjrGhHpjd3ojCnr/MnOWx6AwvFZFJvTVbXSBN+5q5/Z48Tlg//qaCGWVN2MASXXf6PoQFF
	UW0wlMx3X7JLeasXsIt0jbtBnMlBRHoavCdxER/O0oOSxSP8y8gv2Q2aC4iZQZWBtAMhBx0CIMfJ7
	Dd9b2rw5QIMznFbYBnm56iaw87OCQebQDQzVDG6CRUkSCjWmEk6DmvSpKJdqr2rQFHlQ37tLD7EBo
	sfcbu+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veCpv-00000002N1e-1zVX;
	Fri, 09 Jan 2026 13:47:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veCpu-00000002N0t-0LeM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 13:47:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7341E4051B;
	Fri,  9 Jan 2026 13:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8A3C19422;
	Fri,  9 Jan 2026 13:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767966449;
	bh=cEF2HlQxucHUoV1e6UadmpWp+jSEoVJADc0Y46qZqbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C1FWGrPcQeROcGwnj7vSyZsZ1zoSFgaD4Ln4/ur1+e7jz2eTTP6zYm4hc6t69Rtx4
	 ZMmzuPPYsHpinghqDInHPL7rn5HeCDufgC5QuhRtbfMLhWFLcCU60gr6oeygzkIrDL
	 3jFoHuAyXCVfTLXcowVvzN7EuhmBtm8euqQh7RyfCox9zqcC/B5cvi9niLHeasjEIb
	 QD6oexPs+n4lFjegd2rI/pWCvTT1Tedm5O83ZKR50AEKyofkAbTp3btKM6ZjDQrz9Q
	 k7/CFJCmNVlIFPAnncs0QS5avgRg0WcLROqnnMZwJBKdvA8WGI9ZJFpKbjdQ9nuecr
	 R94qzMn7rVI1g==
Date: Fri, 9 Jan 2026 13:47:23 +0000
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
Subject: Re: [PATCHv2 bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <aWEG685zlaV0o7M7@willie-the-truck>
References: <20260109093454.389295-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109093454.389295-1-jolsa@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_054730_155930_A8F53876 
X-CRM114-Status: GOOD (  27.63  )
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

On Fri, Jan 09, 2026 at 10:34:53AM +0100, Jiri Olsa wrote:
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
> Reported-by: Mahe Tardy <mahe.tardy@gmail.com>
> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> ---
> v2 changes:
> - moved ftrace_partial_regs_update to generic code [Will]
> 
>  include/linux/ftrace_regs.h | 25 +++++++++++++++++++++++++
>  kernel/trace/bpf_trace.c    |  1 +
>  2 files changed, 26 insertions(+)
> 
> diff --git a/include/linux/ftrace_regs.h b/include/linux/ftrace_regs.h
> index 15627ceea9bc..f9a7c009cdae 100644
> --- a/include/linux/ftrace_regs.h
> +++ b/include/linux/ftrace_regs.h
> @@ -33,6 +33,31 @@ struct ftrace_regs;
>  #define ftrace_regs_get_frame_pointer(fregs) \
>  	frame_pointer(&arch_ftrace_regs(fregs)->regs)
>  
> +static __always_inline void
> +ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs) { }
> +
> +#else
> +
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
> +	ftrace_regs_set_instruction_pointer(fregs, instruction_pointer(regs));
> +	ftrace_regs_set_return_value(fregs, regs_return_value(regs));
> +}

I think the AI thingy is right about dropping the const qualifier here
but overall I prefer this to the previous revisions. Thanks for sticking
with it!

Acked-by: Will Deacon <will@kernel.org>

Will

