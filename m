Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6731C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 14:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAIHljqGY2xLxWGi2l5ZUOWi2PRSE7BWQN/paPrVg64=; b=vvy+dF8HxZp9INicdfxke4g3q4
	InFKE4+SKKjgCg4DJA+f5roBI8s7X5MOApUqrOn9pWaPORfei3aB6tUQvQnraROkUGrQTV1+M3f0H
	rah6g5vmSBlB6BTh79syV4dNW+woi5LAzLm/8Xcj2qA60HoFBMvDBrW7zqNaBLxDtIDGsMFOF9qy1
	HCz2WJtsIPAIVG1mEYkslbfG2TCNzSapjJhJzMz/UlULg2P5pibtXQlGu4qrS6mVZBTaYoQs6bmKj
	Wcs8x6hv+5lOFhjqNgRxyrCVQ3PV9zZ64V3jtqO1W7tWf72v1wLRce/N28rspqCcLuj4MqNFpYX0O
	AFJu+FPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viZgE-00000005h2Y-3Pa4;
	Wed, 21 Jan 2026 14:59:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viZgC-00000005h22-139T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 14:59:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 260C81476;
	Wed, 21 Jan 2026 06:59:20 -0800 (PST)
Received: from [10.57.49.179] (unknown [10.57.49.179])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 004DA3F632;
	Wed, 21 Jan 2026 06:59:24 -0800 (PST)
Message-ID: <4f4b9dd9-02ed-4899-b17d-24415e50e5c3@arm.com>
Date: Wed, 21 Jan 2026 15:59:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: poe: fix stale POR_EL0 values for ptrace
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: david.spickett@arm.com, mark.rutland@arm.com, stable@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20260121135639.1835784-1-joey.gouly@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260121135639.1835784-1-joey.gouly@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_065932_394577_44C7D944 
X-CRM114-Status: GOOD (  22.24  )
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

On 21/01/2026 14:56, Joey Gouly wrote:
> If a process wrote to POR_EL0 and then crashed before a context switch
> happened, the coredump would contain an incorrect value for POR_EL0.

Isn't that also a problem if using ptrace(PTRACE_GETREGSET, REGSET_POE)?
Just like for fpsimd, etc.

> The value read in poe_get() would be a stale value left in thread.por_el0.  Fix
> this by reading the value from the system register, if the target thread is the
> current thread.
>
> This matches what gcs/fpsimd do.
>
> Fixes: 175198199262 ("arm64/ptrace: add support for FEAT_POE")
> Reported-by: David Spickett <david.spickett@arm.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Kevin Brodsky <kevin.brodsky@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>  arch/arm64/include/asm/por.h | 2 ++
>  arch/arm64/kernel/process.c  | 7 ++++++-
>  arch/arm64/kernel/ptrace.c   | 5 +++++
>  3 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/por.h b/arch/arm64/include/asm/por.h
> index d913d5b529e4..46f1356837e2 100644
> --- a/arch/arm64/include/asm/por.h
> +++ b/arch/arm64/include/asm/por.h
> @@ -31,4 +31,6 @@ static inline bool por_elx_allows_exec(u64 por, u8 pkey)
>  	return perm & POE_X;
>  }
>  
> +void poe_preserve_current_state(void);
> +
>  #endif /* _ASM_ARM64_POR_H */
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 489554931231..400182099784 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -665,12 +665,17 @@ static int do_set_tsc_mode(unsigned int val)
>  	return 0;
>  }
>  
> +void poe_preserve_current_state(void)
> +{
> +	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> +}
> +
>  static void permission_overlay_switch(struct task_struct *next)
>  {
>  	if (!system_supports_poe())
>  		return;
>  
> -	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> +	poe_preserve_current_state();
>  	if (current->thread.por_el0 != next->thread.por_el0) {
>  		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
>  		/*
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index b9bdd83fbbca..276d8ee630cd 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -37,6 +37,7 @@
>  #include <asm/gcs.h>
>  #include <asm/mte.h>
>  #include <asm/pointer_auth.h>
> +#include <asm/por.h>
>  #include <asm/stacktrace.h>
>  #include <asm/syscall.h>
>  #include <asm/traps.h>
> @@ -1486,6 +1487,10 @@ static int poe_get(struct task_struct *target,
>  	if (!system_supports_poe())
>  		return -EINVAL;
>  
> +	if (target == current) {
> +		poe_preserve_current_state();
> +	}

Nit: no need for {}.

Otherwise:

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

- Kevin

> +
>  	return membuf_write(&to, &target->thread.por_el0,
>  			    sizeof(target->thread.por_el0));
>  }

