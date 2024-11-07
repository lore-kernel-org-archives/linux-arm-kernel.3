Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA41D5D689
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 20:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmvnnqFAAzMpEl4IO3/ZIdo2Rwf7zSoowL2FEf2Q8/A=; b=IwipYvqMGODoI7ndyZt4tNuGju
	6OH7SddGGmKOrhxs8jsZzZVebY2KFJM5KLhtFVXQwaX2/DuPOyBsbyJ7ADuMKHJphoJCkXoWj9UQl
	3W+lBBiMSV/Y+nROKSAf8PHKiCYCzDwF4mjHaUIL2VMvv8CooSXAwKduMvTNl0rEStnOLcR9VqUjV
	Ehghz0gw42DYe2VwiScNY9pn+ddkZ3+8U39sdePFPnOKUJ+2GjRmHbuv5lYGfmL+kcyqx/vD7l3wi
	UxaACWhByekl3+6Lo1UjjjgTSLQVvv1kfmnpG7NiLi1xIevL1RmuV8RVqn09WNDY/u4S42AVyvHEi
	nAtNHTzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98nO-00000008Cry-0OqZ;
	Thu, 07 Nov 2024 20:07:58 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98NE-0000000873w-3kPE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 19:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731008457; x=1762544457;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZiLvEMXcWk3EnlXkmWOiJoDNigYaUUBGA9qbxDSnzUE=;
  b=bwuntsgj9UZyy4AaDRUAjNxbrAcuQvCW2UERFgHG9vWNE2SMjuF80ikw
   OKfxb6nvscUevrjVffqQcgbVrBgXfDQ4pFtUaRYJU8R2rEHt4TZU95PYZ
   0Mn/pqIqy7oqDFKqswbCtBVbicEX1dszt6Y3cMafwsbh8Y+OX9Nq3jCF3
   HLOWQ9I9flBBKf60M3pdYfiCFbKks7a1kmYUu+4anuoea7bSeNaezbiMN
   c2B/SkDRTCUTyP2+VGyaJt1lJHqTvIZTj2UQNldC5SN9F5xQkY6uXs9Zw
   xjQTe/mQzaPn5SYpcr/b6c2e5r5Wy68Xd7r8sJD+yTjw9QP2sD3eAdr4g
   w==;
X-CSE-ConnectionGUID: LfW7PLruReGJawebLHNBsA==
X-CSE-MsgGUID: g8l7FHmtS2Si6qPCLKwkEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="56271335"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="56271335"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:40:56 -0800
X-CSE-ConnectionGUID: 8diFUQnRTBqpJudeHxV87g==
X-CSE-MsgGUID: yb097d/eQf2HXs6Mu1tSfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="84728163"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:40:56 -0800
Received: from [10.212.68.83] (kliang2-mobl1.ccr.corp.intel.com [10.212.68.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 5A72420B5705;
	Thu,  7 Nov 2024 11:40:51 -0800 (PST)
Message-ID: <393bbcf0-aebd-450c-ad0b-e6140f1272b4@linux.intel.com>
Date: Thu, 7 Nov 2024 14:40:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] x86: perf: Refactor misc flag assignments
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
References: <20241107190336.2963882-1-coltonlewis@google.com>
 <20241107190336.2963882-5-coltonlewis@google.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20241107190336.2963882-5-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_114056_990475_7F1BA99B 
X-CRM114-Status: GOOD (  19.45  )
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



On 2024-11-07 2:03 p.m., Colton Lewis wrote:
> Break the assignment logic for misc flags into their own respective
> functions to reduce the complexity of the nested logic.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> ---

Acked-by: Kan Liang <kan.liang@linux.intel.com>

Thanks,
Kan
>  arch/x86/events/core.c            | 32 +++++++++++++++++++++++--------
>  arch/x86/include/asm/perf_event.h |  2 ++
>  2 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> index d19e939f3998..9fdc5fa22c66 100644
> --- a/arch/x86/events/core.c
> +++ b/arch/x86/events/core.c
> @@ -3011,16 +3011,35 @@ unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
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
> +	if (!(guest_state & PERF_GUEST_ACTIVE))
> +		return flags;
> +
> +	if (guest_state & PERF_GUEST_USER)
> +		return flags & PERF_RECORD_MISC_GUEST_USER;
> +	else
> +		return flags & PERF_RECORD_MISC_GUEST_KERNEL;
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
> @@ -3028,9 +3047,6 @@ unsigned long perf_arch_misc_flags(struct pt_regs *regs)
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


