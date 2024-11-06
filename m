Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F92D59F50
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 16:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rfuOZvnAuj0nJQPp26kpH9tNbtyuod4jy7uet0uJOw=; b=L0JhHcIja/dbjvW4EQxNpHC0VB
	H0RmaS4qMW/u1jhG3mppOSGwjyoo8kjoYjvxc6LG+TC6iyDn7xgwm+GteWcCzraLe5mre4g3Dh71l
	lN4cprfUALfObKVNI9R6xebsrdUql+CIFBquQrGJ2nlHytl01fw7Hi5cEPE71nb6nasOs8roDB83S
	f9VIBn+FNcGf862dkkvKOC9ZaJl41ya7RVXTDuEbG3wwnHazwScyYbOqHH9BwQuImD+jYchJaSlJ7
	G6TPj7quAl+CGmPocohY6P2MHrKA2U7TkjN1L7vmXVxxWHQTAmYIqp0PR9nkdMXuoGh4WN4/LRgPC
	fYEQ9AFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8idp-00000003z1k-3Mwo;
	Wed, 06 Nov 2024 16:12:21 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iZi-00000003xsH-0VXh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 16:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730909286; x=1762445286;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YqxQs5N7780pZPl+viPzrqgEiiSjrsm9V2x3PaeBgBM=;
  b=TVlMQQMdenLk+n1jgeRe67uafoIbaHEo3S/NCxJ9Mr5HF3P8bh+/zucg
   BiOYIm4aC8b3Eh2ucrZ7TuvcOb8QIqfFIF9r8H3NkaQ/lSnoUBI9ete5C
   skO2wHXwZv91TbY/EFs1yTpaeXn3DG0+sJUp/MEejaorkoP+eh+QBWSbx
   ryPzb3VBhPbTJY3vANZ6gFlTRAJThFDlnnx8kDmtYAQyStlWHkEuG6pn+
   ZovHRvPjyZEdTm31GM/cgAazW9dK/ymrSICcU6haW8R5AlucIVkMcBDze
   kgLfI6G5hXJSIIrd4nc5Qu29FaD2Bzzvkz9S4+e+e9IKfRp67l9/BjiL3
   A==;
X-CSE-ConnectionGUID: d3S4hxlES7CJu2DuvQXeyA==
X-CSE-MsgGUID: pnmwZTEiR/alzVovQqE/Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30932622"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="30932622"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 08:08:02 -0800
X-CSE-ConnectionGUID: 09YIEWwaQoulcZ9i16jkuA==
X-CSE-MsgGUID: iezak7uMSDC1ynrtqPQ/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89211010"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 08:07:58 -0800
Received: from [10.212.82.230] (kliang2-mobl1.ccr.corp.intel.com [10.212.82.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 2CB5920B5703;
	Wed,  6 Nov 2024 08:07:54 -0800 (PST)
Message-ID: <007cfed1-111d-45aa-b873-24cca9d4af01@linux.intel.com>
Date: Wed, 6 Nov 2024 11:07:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] perf: Correct perf sampling with guest VMs
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: Oliver Upton <oliver.upton@linux.dev>,
 Sean Christopherson <seanjc@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Will Deacon <will@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org
References: <20241105195603.2317483-1-coltonlewis@google.com>
 <20241105195603.2317483-6-coltonlewis@google.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20241105195603.2317483-6-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_080806_195587_700FD0BB 
X-CRM114-Status: GOOD (  28.83  )
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



On 2024-11-05 2:56 p.m., Colton Lewis wrote:
> Previously any PMU overflow interrupt that fired while a VCPU was
> loaded was recorded as a guest event whether it truly was or not. This
> resulted in nonsense perf recordings that did not honor
> perf_event_attr.exclude_guest and recorded guest IPs where it should
> have recorded host IPs.
> 
> Rework the sampling logic to only record guest samples for events with
> exclude_guest = 0. This way any host-only events with exclude_guest
> set will never see unexpected guest samples. The behaviour of events
> with exclude_guest = 0 is unchanged.
> 
> Note that events configured to sample both host and guest may still
> misattribute a PMI that arrived in the host as a guest event depending
> on KVM arch and vendor behavior.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  arch/arm64/include/asm/perf_event.h |  4 ----
>  arch/arm64/kernel/perf_callchain.c  | 28 ----------------------------
>  arch/x86/events/core.c              | 16 ++++------------
>  include/linux/perf_event.h          | 21 +++++++++++++++++++--
>  kernel/events/core.c                | 21 +++++++++++++++++----
>  5 files changed, 40 insertions(+), 50 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm/perf_event.h
> index 31a5584ed423..ee45b4e77347 100644
> --- a/arch/arm64/include/asm/perf_event.h
> +++ b/arch/arm64/include/asm/perf_event.h
> @@ -10,10 +10,6 @@
>  #include <asm/ptrace.h>
>  
>  #ifdef CONFIG_PERF_EVENTS
> -struct pt_regs;
> -extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
> -extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
> -#define perf_arch_misc_flags(regs)	perf_misc_flags(regs)
>  #define perf_arch_bpf_user_pt_regs(regs) &regs->user_regs
>  #endif
>  
> diff --git a/arch/arm64/kernel/perf_callchain.c b/arch/arm64/kernel/perf_callchain.c
> index 01a9d08fc009..9b7f26b128b5 100644
> --- a/arch/arm64/kernel/perf_callchain.c
> +++ b/arch/arm64/kernel/perf_callchain.c
> @@ -38,31 +38,3 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>  
>  	arch_stack_walk(callchain_trace, entry, current, regs);
>  }
> -
> -unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
> -{
> -	if (perf_guest_state())
> -		return perf_guest_get_ip();
> -
> -	return instruction_pointer(regs);
> -}
> -
> -unsigned long perf_arch_misc_flags(struct pt_regs *regs)
> -{
> -	unsigned int guest_state = perf_guest_state();
> -	int misc = 0;
> -
> -	if (guest_state) {
> -		if (guest_state & PERF_GUEST_USER)
> -			misc |= PERF_RECORD_MISC_GUEST_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
> -	} else {
> -		if (user_mode(regs))
> -			misc |= PERF_RECORD_MISC_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_KERNEL;
> -	}
> -
> -	return misc;
> -}
> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> index 24910c625e3d..aae0c5eabf09 100644
> --- a/arch/x86/events/core.c
> +++ b/arch/x86/events/core.c
> @@ -3005,9 +3005,6 @@ static unsigned long code_segment_base(struct pt_regs *regs)
>  
>  unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  {
> -	if (perf_guest_state())
> -		return perf_guest_get_ip();
> -
>  	return regs->ip + code_segment_base(regs);
>  }
>  
> @@ -3034,17 +3031,12 @@ unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
>  
>  unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  {
> -	unsigned int guest_state = perf_guest_state();
>  	unsigned long misc = common_misc_flags(regs);
>  
> -	if (guest_state) {
> -		misc |= perf_arch_guest_misc_flags(regs);
> -	} else {
> -		if (user_mode(regs))
> -			misc |= PERF_RECORD_MISC_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_KERNEL;
> -	}
> +	if (user_mode(regs))
> +		misc |= PERF_RECORD_MISC_USER;
> +	else
> +		misc |= PERF_RECORD_MISC_KERNEL;
>  
>  	return misc;
>  }
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 772ad352856b..e207acdd9e73 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1655,8 +1655,9 @@ extern void perf_tp_event(u16 event_type, u64 count, void *record,
>  			  struct task_struct *task);
>  extern void perf_bp_event(struct perf_event *event, void *data);
>  
> -extern unsigned long perf_misc_flags(struct pt_regs *regs);
> -extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> +extern unsigned long perf_misc_flags(struct perf_event *event, struct pt_regs *regs);
> +extern unsigned long perf_instruction_pointer(struct perf_event *event,
> +					      struct pt_regs *regs);
>  
>  #ifndef perf_arch_misc_flags
>  # define perf_arch_misc_flags(regs) \
> @@ -1667,6 +1668,22 @@ extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
>  # define perf_arch_bpf_user_pt_regs(regs) regs
>  #endif
>  
> +#ifndef perf_arch_guest_misc_flags
> +static inline unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> +{
> +	unsigned long guest_state = perf_guest_state();
> +
> +	if (guest_state & PERF_GUEST_USER)
> +		return PERF_RECORD_MISC_GUEST_USER;
> +
> +	if (guest_state & PERF_GUEST_ACTIVE)
> +		return PERF_RECORD_MISC_GUEST_KERNEL;

Is there by any chance to add a PERF_GUEST_KERNEL flag in KVM?

The PERF_GUEST_ACTIVE flag check looks really confusing.

Thanks,
Kan
> +
> +	return 0;
> +}
> +# define perf_arch_guest_misc_flags(regs)	perf_arch_guest_misc_flags(regs)
> +#endif
> +
>  static inline bool has_branch_stack(struct perf_event *event)
>  {
>  	return event->attr.sample_type & PERF_SAMPLE_BRANCH_STACK;
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 2c44ffd6f4d8..c62164a2ff23 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -7022,13 +7022,26 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
>  EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
>  #endif
>  
> -unsigned long perf_misc_flags(struct pt_regs *regs)
> +static bool should_sample_guest(struct perf_event *event)
>  {
> +	return !event->attr.exclude_guest && perf_guest_state();
> +}
> +
> +unsigned long perf_misc_flags(struct perf_event *event,
> +			      struct pt_regs *regs)
> +{
> +	if (should_sample_guest(event))
> +		return perf_arch_guest_misc_flags(regs);
> +
>  	return perf_arch_misc_flags(regs);
>  }
>  
> -unsigned long perf_instruction_pointer(struct pt_regs *regs)
> +unsigned long perf_instruction_pointer(struct perf_event *event,
> +				       struct pt_regs *regs)
>  {
> +	if (should_sample_guest(event))
> +		return perf_guest_get_ip();
> +
>  	return perf_arch_instruction_pointer(regs);
>  }
>  
> @@ -7849,7 +7862,7 @@ void perf_prepare_sample(struct perf_sample_data *data,
>  	__perf_event_header__init_id(data, event, filtered_sample_type);
>  
>  	if (filtered_sample_type & PERF_SAMPLE_IP) {
> -		data->ip = perf_instruction_pointer(regs);
> +		data->ip = perf_instruction_pointer(event, regs);
>  		data->sample_flags |= PERF_SAMPLE_IP;
>  	}
>  
> @@ -8013,7 +8026,7 @@ void perf_prepare_header(struct perf_event_header *header,
>  {
>  	header->type = PERF_RECORD_SAMPLE;
>  	header->size = perf_sample_data_size(data, event);
> -	header->misc = perf_misc_flags(regs);
> +	header->misc = perf_misc_flags(event, regs);
>  
>  	/*
>  	 * If you're adding more sample types here, you likely need to do


