Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AD8D59F50
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JleaUPasr6t70wZaJk/wxLZq1vhjFjBAb+acJWYkRc0=; b=ns/CKp5FLzfh2MPrH7e/ys+IE9
	M54rHTFTLpqscY25tb8l3Vq1I2r8SXFakemKUtxfkn3qp9lDQh3WYdzv4CwziTVMsQZrSDZMTIGBv
	un9FNpsC1LfYF+l60oNmCbTOXkSkMaoZzerT9bOxirj8YS/ZyhtDsKDL7aaU4EiRr8kO9xS2g6Spx
	muu5albM7DfnfLrJ6ZYFkVSbTfCNxPAgGVI8HShOKll3iaxKXMU+u5RgbkUwMuNh0gi+0tuj2EiC1
	H8ODU8/d6Dtnd+h9MQLXHX2fJPgVqLTM+Fu2lY5ZLBkvFMgALwJgeBYl7SXtFcI3T+CajbbJ8zNjl
	JwUYI+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iWq-00000003x7N-0Wan;
	Wed, 06 Nov 2024 16:05:08 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iV4-00000003wcf-1Dkn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 16:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730908998; x=1762444998;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eeEXuIJ2vlczIF22PZRVZhnTIMIbHqdB4rwbCI1c/Sg=;
  b=DXCnGztjOYA6n35Xw96KYPXOaCPtv0XNfSN7gVLlvd2haHnKGCMhjf9K
   wmkgBGJr9JDgvCS5585E/UhjdTBDeEaOHfX2GoO0/3wCyiXqqndkS2BZG
   x55Lc7YZAdi4gpwX/qV3Qzc/a0KloBYPq+I47QOWyUsGhmE3O+vs4Mr8h
   EN96I3b9ra8pZdtnl/+mEG+F6bj+9ez5eP3dH/9zQBV9skDReQA8Omn0f
   fK/ovLYWM/VrIEhjMKk8yAk7k7O/IgAk3Hi+AmZwgTiENvnP1DGXHLcMQ
   VY+ExL6gbu18CZpHzT1wkdYZF0ISyQAifl0K5t9+gZhpNT5TC0zJ7yq5s
   A==;
X-CSE-ConnectionGUID: 0TzZ2sURRlK2R6iwVZNGLg==
X-CSE-MsgGUID: I1+TDmMNREWU7pOS0JTgSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48176918"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48176918"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 08:03:17 -0800
X-CSE-ConnectionGUID: a5M3gJ+/QYaSWgS/qH6ALg==
X-CSE-MsgGUID: phJVPBFJQuabQWlVho3xvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="84715253"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 08:03:17 -0800
Received: from [10.212.82.230] (kliang2-mobl1.ccr.corp.intel.com [10.212.82.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 2C51820B5703;
	Wed,  6 Nov 2024 08:03:12 -0800 (PST)
Message-ID: <65675ed8-e569-47f8-b1eb-40c853751bfb@linux.intel.com>
Date: Wed, 6 Nov 2024 11:03:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] x86: perf: Refactor misc flag assignments
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
 <20241105195603.2317483-5-coltonlewis@google.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20241105195603.2317483-5-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_080318_427181_DD4A7F83 
X-CRM114-Status: GOOD (  23.06  )
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
> Break the assignment logic for misc flags into their own respective
> functions to reduce the complexity of the nested logic.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  arch/x86/events/core.c            | 31 +++++++++++++++++++++++--------
>  arch/x86/include/asm/perf_event.h |  2 ++
>  2 files changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> index d19e939f3998..24910c625e3d 100644
> --- a/arch/x86/events/core.c
> +++ b/arch/x86/events/core.c
> @@ -3011,16 +3011,34 @@ unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
>  	return regs->ip + code_segment_base(regs);
>  }
>  
> +static unsigned long common_misc_flags(struct pt_regs *regs)
> +{
> +	if (regs->flags & PERF_EFLAGS_EXACT)
> +		return PERF_RECORD_MISC_EXACT_IP;
> +
> +	return 0;
> +}
> +
> +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> +{
> +	unsigned long guest_state = perf_guest_state();
> +	unsigned long flags = common_misc_flags(regs);
> +
> +	if (guest_state & PERF_GUEST_USER)
> +		flags |= PERF_RECORD_MISC_GUEST_USER;
> +	else if (guest_state & PERF_GUEST_ACTIVE)
> +		flags |= PERF_RECORD_MISC_GUEST_KERNEL;
> +

The logic of setting the GUEST_KERNEL flag is implicitly changed here.

For the current code, the GUEST_KERNEL flag is set for !PERF_GUEST_USER,
which include both guest_in_kernel and guest_in_NMI.

With the above change, the GUEST_KERNEL flag should be only set for the
guest_in_kernel case.
IIUC, this is the series's target, right?

If so, could you please move the explanation into this patch?
For x86, the behavior has already been changed since this patch.

Thanks,
Kan

> +	return flags;
> +}
> +
>  unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  {
>  	unsigned int guest_state = perf_guest_state();
> -	int misc = 0;
> +	unsigned long misc = common_misc_flags(regs);
>  
>  	if (guest_state) {
> -		if (guest_state & PERF_GUEST_USER)
> -			misc |= PERF_RECORD_MISC_GUEST_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
> +		misc |= perf_arch_guest_misc_flags(regs);
>  	} else {
>  		if (user_mode(regs))
>  			misc |= PERF_RECORD_MISC_USER;
> @@ -3028,9 +3046,6 @@ unsigned long perf_arch_misc_flags(struct pt_regs *regs)
>  			misc |= PERF_RECORD_MISC_KERNEL;
>  	}
>  
> -	if (regs->flags & PERF_EFLAGS_EXACT)
> -		misc |= PERF_RECORD_MISC_EXACT_IP;
> -
>  	return misc;
>  }
>  
> diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
> index feb87bf3d2e9..d95f902acc52 100644
> --- a/arch/x86/include/asm/perf_event.h
> +++ b/arch/x86/include/asm/perf_event.h
> @@ -538,7 +538,9 @@ struct x86_perf_regs {
>  
>  extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
>  extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
> +extern unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs);
>  #define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
> +#define perf_arch_guest_misc_flags(regs)	perf_arch_guest_misc_flags(regs)
>  
>  #include <asm/stacktrace.h>
>  


