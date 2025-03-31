Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F75C36011
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 09:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1G/2f/kzgQrI6H05GnwJcV5s7P3UOsc3wy1MZhe8JsE=; b=dDSALss6Kva9a1eGdU/Q0xBjzr
	PzR45MvwK4DcSeRgzNAda8CXHQVTXJhQxwqk9GxCk5H44pDITIfsw4LRQfJLPCjTnCsd6rbwKktBE
	WtH3bDfo/zyhnDE9SP38tVimnDVNf8tY6p32DNABn/Pj5IrG06vGS+6x/LvlVkmsrHG9wQzTNVnDG
	kJVpdMSaWEI3O4Ha52yiN79F84aoGlOZni2woD018PpNlbAaGHfVr9RGpc+hoHoQXKqVByVlasbRQ
	6dXcNOC3xgyX5CfU8Vjbva1VL/cXbCeMsIqo3bOQutS75avX1ZPNCu7mH3mA7wQqvPiQFE2JkYmeV
	THD5Vlnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzB73-0000000HS7l-43XK;
	Mon, 31 Mar 2025 09:07:21 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzB5M-0000000HRxS-2an5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 09:05:37 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso741405566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743411934; x=1744016734; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1G/2f/kzgQrI6H05GnwJcV5s7P3UOsc3wy1MZhe8JsE=;
        b=D5iiSVgnmf0I+cWUGSNCBl+HyfVDg2o2ve49zoUL2d98DAudc5lC0yRBiaV2vRNeVQ
         e17fW948ACIYMBRE4/HOqMBwL3GaQeKyZsihb8DtC9jE9Af1g17Rao7aUzHYscvVoX2h
         N53KHVZdJrZZiKEHOsEhdWiMG0oKkqxJ/BwdU0NK/+P3Rjas1flbjWWcgWAegYlpyEVr
         XJOQg0N3QgWkWaCN6Qh/AeFtk0CFBtBLrIRQax5gg/w0yq3SmrlSP03MDu5MoOumq/DP
         EP9GCEnhjhynMUb2ZcxwBey3Ja024zHmMNbnXJprHAqEFhkvURxJRjLfVo5JQ2UWWlU5
         415w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743411934; x=1744016734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1G/2f/kzgQrI6H05GnwJcV5s7P3UOsc3wy1MZhe8JsE=;
        b=xNuI/gPCUMCVmXoPQm9b/Adf5HXE9pp9D3p/KLE1ZPRT2vZEgaDFQbjBVk0UNkjBtt
         HbcRvb77MvQax4svgFAq154+TttLh7iM4mKqSujOWUB7A2oJSNKkuazxizEy+qLsDwlU
         NCxYXyH+UotxaQzAoADNHGjvUfDZdTpriyDXZ2J13dv1inqpKpj2hlLGdjvIKvmouz+K
         U11oZlTTbU2hBp7wPPoEFnhtrZbo3PEZSP59u+caG5eRebnzAI7UCFICxcSevCgVMj80
         VBc5GOj+F91fMb6hwS8tuvYyB8cSH2FOnoe4jTwlU6gTb1gyoLDmVXu4IPK31IZC+Env
         m6Nw==
X-Gm-Message-State: AOJu0YwwCVs+jC/sFg9se4E1j9ihi/PO2zUw5CK+KCaksPl9LHmPMCFG
	7lELoj6B1UF/flFMQBaVIUIqtzJ7dJrBfl8qwcsP3yCk6yiiAx32R3Q11ZK0NMk=
X-Gm-Gg: ASbGnctim6KFIdCSk6YSexXiqbIAx0WyBvp8b3Z1nzdFERYUNd4qIZHPENlYuHkK191
	XiN2Ml5eYM67S88qWT0EQ7XKWg6y58LKtsbcOzxWbefbRgvw8T9MAuQXV0q93wQJKM8ws0MvgDx
	/339aYZLeqqOPpJl1SAidkWSNZy7sbkcTkvlqwmc5+EncqFvmI89WHS9h9KsccVrHAryEr6FNkK
	kS5IoDKX+7k/mFjHOGny7gNlmyyjE9EEmhZG9z/WQqLe7QHOgznVBCAdGgQEEc2CjvxkeMu/DSQ
	gOBHUciBC6SPuMQYMWaQHT8XyKY9RMLbitQwDiUmFtp0IAxVMu0chRLbB8NpKo07sDSTvx1JjpS
	xnIZvZTwC1NHO
X-Google-Smtp-Source: AGHT+IEZKen+GqDOHtdkyeLLNPETjZemufqDk6C+fKS+SFiLecdoalHH5ETBCA5wdaHh1QGXT8ZLeQ==
X-Received: by 2002:a17:906:aacf:b0:ac7:4d45:f13e with SMTP id a640c23a62f3a-ac74d460c41mr385561566b.13.1743411934297;
        Mon, 31 Mar 2025 02:05:34 -0700 (PDT)
Received: from localhost (host-87-5-222-245.retail.telecomitalia.it. [87.5.222.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927af39sm590257066b.44.2025.03.31.02.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:05:33 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 31 Mar 2025 11:06:50 +0200
To: Song Liu <song@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org,
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com,
	irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org,
	mark.rutland@arm.com, peterz@infradead.org,
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v3 1/2] arm64: Implement arch_stack_walk_reliable
Message-ID: <Z-pbKrO0w2g-2u3o@apocalypse>
References: <20250320171559.3423224-1-song@kernel.org>
 <20250320171559.3423224-2-song@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320171559.3423224-2-song@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_020536_660895_BB3AB884 
X-CRM114-Status: GOOD (  25.07  )
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

Hi song,

On 10:15 Thu 20 Mar     , Song Liu wrote:
> With proper exception boundary detection, it is possible to implment
> arch_stack_walk_reliable without sframe.
> 
> Note that, arch_stack_walk_reliable does not guarantee getting reliable
> stack in all scenarios. Instead, it can reliably detect when the stack
> trace is not reliable, which is enough to provide reliable livepatching.
> 
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  arch/arm64/Kconfig             |  2 +-
>  arch/arm64/kernel/stacktrace.c | 66 +++++++++++++++++++++++++---------
>  2 files changed, 51 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 701d980ea921..31d5e1ee6089 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -276,6 +276,7 @@ config ARM64
>  	select HAVE_SOFTIRQ_ON_OWN_STACK
>  	select USER_STACKTRACE_SUPPORT
>  	select VDSO_GETRANDOM
> +	select HAVE_RELIABLE_STACKTRACE
>  	help
>  	  ARM 64-bit (AArch64) Linux support.
>  
> @@ -2500,4 +2501,3 @@ endmenu # "CPU Power Management"
>  source "drivers/acpi/Kconfig"
>  
>  source "arch/arm64/kvm/Kconfig"
> -
> diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
> index 1d9d51d7627f..7e07911d8694 100644
> --- a/arch/arm64/kernel/stacktrace.c
> +++ b/arch/arm64/kernel/stacktrace.c
> @@ -56,6 +56,7 @@ struct kunwind_state {
>  	enum kunwind_source source;
>  	union unwind_flags flags;
>  	struct pt_regs *regs;
> +	bool end_on_unreliable;
>  };
>  
>  static __always_inline void
> @@ -230,8 +231,26 @@ kunwind_next_frame_record(struct kunwind_state *state)
>  	new_fp = READ_ONCE(record->fp);
>  	new_pc = READ_ONCE(record->lr);
>  
> -	if (!new_fp && !new_pc)
> -		return kunwind_next_frame_record_meta(state);
> +	if (!new_fp && !new_pc) {
> +		int ret;
> +
> +		ret = kunwind_next_frame_record_meta(state);
> +		if (ret < 0) {
> +			/*
> +			 * This covers two different conditions:
> +			 *  1. ret == -ENOENT, unwinding is done.
> +			 *  2. ret == -EINVAL, unwinding hit error.
> +			 */
> +			return ret;
> +		}
> +		/*
> +		 * Searching across exception boundaries. The stack is now
> +		 * unreliable.
> +		 */
> +		if (state->end_on_unreliable)
> +			return -EINVAL;
> +		return 0;
> +	}
>  
>  	unwind_consume_stack(&state->common, info, fp, sizeof(*record));
>  
> @@ -277,21 +296,24 @@ kunwind_next(struct kunwind_state *state)
>  
>  typedef bool (*kunwind_consume_fn)(const struct kunwind_state *state, void *cookie);
>  
> -static __always_inline void
> +static __always_inline int
>  do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state,
>  	   void *cookie)
>  {
> -	if (kunwind_recover_return_address(state))
> -		return;
> +	int ret;
>  
> -	while (1) {
> -		int ret;
> +	ret = kunwind_recover_return_address(state);
> +	if (ret)
> +		return ret;
>  
> +	while (1) {
>  		if (!consume_state(state, cookie))
> -			break;
> +			return -EINVAL;
>  		ret = kunwind_next(state);
> +		if (ret == -ENOENT)
> +			return 0;
>  		if (ret < 0)
> -			break;
> +			return ret;
>  	}
>  }
>  
> @@ -324,10 +346,10 @@ do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state,
>  			: stackinfo_get_unknown();		\
>  	})
>  
> -static __always_inline void
> +static __always_inline int
>  kunwind_stack_walk(kunwind_consume_fn consume_state,
>  		   void *cookie, struct task_struct *task,
> -		   struct pt_regs *regs)
> +		   struct pt_regs *regs, bool end_on_unreliable)
>  {
>  	struct stack_info stacks[] = {
>  		stackinfo_get_task(task),
> @@ -348,11 +370,12 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
>  			.stacks = stacks,
>  			.nr_stacks = ARRAY_SIZE(stacks),
>  		},
> +		.end_on_unreliable = end_on_unreliable,
>  	};
>  
>  	if (regs) {
>  		if (task != current)
> -			return;
> +			return -EINVAL;
>  		kunwind_init_from_regs(&state, regs);
>  	} else if (task == current) {
>  		kunwind_init_from_caller(&state);
> @@ -360,7 +383,7 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
>  		kunwind_init_from_task(&state, task);
>  	}
>  
> -	do_kunwind(&state, consume_state, cookie);
> +	return do_kunwind(&state, consume_state, cookie);
>  }
>  
>  struct kunwind_consume_entry_data {
> @@ -384,7 +407,18 @@ noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry,
>  		.cookie = cookie,
>  	};
>  
> -	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs);
> +	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs, false);
> +}
> +
> +noinline noinstr int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
> +			void *cookie, struct task_struct *task)
> +{
> +	struct kunwind_consume_entry_data data = {
> +		.consume_entry = consume_entry,
> +		.cookie = cookie,
> +	};
> +
> +	return kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, NULL, true);
>  }
>  
>  struct bpf_unwind_consume_entry_data {
> @@ -409,7 +443,7 @@ noinline noinstr void arch_bpf_stack_walk(bool (*consume_entry)(void *cookie, u6
>  		.cookie = cookie,
>  	};
>  
> -	kunwind_stack_walk(arch_bpf_unwind_consume_entry, &data, current, NULL);
> +	kunwind_stack_walk(arch_bpf_unwind_consume_entry, &data, current, NULL, false);
>  }
>  
>  static const char *state_source_string(const struct kunwind_state *state)
> @@ -456,7 +490,7 @@ void dump_backtrace(struct pt_regs *regs, struct task_struct *tsk,
>  		return;
>  
>  	printk("%sCall trace:\n", loglvl);
> -	kunwind_stack_walk(dump_backtrace_entry, (void *)loglvl, tsk, regs);
> +	kunwind_stack_walk(dump_backtrace_entry, (void *)loglvl, tsk, regs, false);
>  
>  	put_task_stack(tsk);
>  }
> -- 
> 2.47.1
> 

Tested-by: Andrea della Porta <andrea.porta@suse.com>

Thanks,
Andrea

