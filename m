Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFACFA374B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjh9c0cB/9fhw2icbvqjVGcrgDQlIY7+d70l/pRhBro=; b=LDHZFCWHnXA72rNK66DvhrnX+w
	z3XbRLJkq+QtHK2G/GGLC+/9nslZjEQPRxFMZZt6+lr8wtsBVEPywpQ9jEWHS43oU/uOAj2WBt54i
	BsmmZkJfsZ1tyI4ren2fCTZCDJ98rBoVXn5cvHS/U/5H1uRp05PuzS+fL3FuY2dxJLpFoMY+H+YOv
	P3foRAqsL451RmiINkJylOVHamHdAMl7klbP8Kba95AFdWdf4iPSqE+XG+CemkUBmOhLgaXlukgkl
	3nRFmq6DDWZvc9j5R7FfIbce3QzMp4NUauUv8s07xPKOs1WyjcmmWatElE7mNnniPCo7C8KFyOwAo
	/UlySrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgW3-00000008O8C-0Wfj;
	Fri, 02 Jan 2026 14:52:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgW0-00000008O7Y-3xpZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 14:52:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 41FD844140;
	Fri,  2 Jan 2026 14:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0BAC116B1;
	Fri,  2 Jan 2026 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767365552;
	bh=JQQ5LuFQIAK/IiQNjSgP3KNOzDhsqMGgsVNg6dB+StI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/vDziwnCwq1mltUECV7jiwGIjish4gYTwEefWcXF66tMsA+/3UW4qvnybkYaHTn4
	 EafDa92jcR6Yv1QDuywTsuuNfxdh4BffmTsun4ORuSyLUei3h3lcWX1fV/llAHpnMp
	 pQPzEqJTTLMW4WrXXyHbohmeyTOxaRk0x0jnb7d843oNA1+pvsNglqzU6r2ir73KCc
	 7UA6OwtAlmxeqeTIjiqQhDJKUi9zvYM8H2MUAofDVvHXAjBguDSRc/XtuAqd9Oq9oT
	 F+gsKUS66rDiU34l3iHRSwf8JRiYxsBPII2Jkw/yn+6aalLlvtI7nDPb2yfst/yRNR
	 FwSGKYRmj32bw==
Date: Fri, 2 Jan 2026 14:52:25 +0000
From: Will Deacon <will@kernel.org>
To: Jiri Olsa <jolsa@kernel.org>
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
Message-ID: <aVfbqYsWdGXu4lh8@willie-the-truck>
References: <20251105125924.365205-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105125924.365205-1-jolsa@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_065233_005100_19E47551 
X-CRM114-Status: GOOD (  24.60  )
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

This looks a bit grotty to me and presumably other architectures would
need similar treatement. Wouldn't it be cleaner to reuse the existing
API instead? For example, by calling ftrace_regs_set_instruction_pointer()
and ftrace_regs_set_return_value() to update the relevant registers from
the core code?

Will

