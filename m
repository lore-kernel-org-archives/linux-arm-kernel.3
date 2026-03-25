Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD35CFEA835
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 08:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFbVa+0YpacT1+xttrSmQ0z76K08F/kBytm4Dt7GAgc=; b=gaVZstjAIjhLA+BDpfNsGrtIP8
	AXwwqkklpDAqtFs29qCavGTMJLxGTtuowpCKo2l1vhYd81zQec/sMAEU5b5w4s6LxiFEvrfnJmP3x
	zBlc8XZ1fwxHnf4Z1ZUpG5aBNg6kOuXeaRvW2I6FniS9sgUdAG6ql8tR8c6utybsAHGcgLn8OGRsq
	CEP3KCsthZwq345AetYmj7wVCNkMUqddch4BpeRzq61+DfzM23OX/bjAHoBIy/Ns61evixhI7y7y0
	1jwy6reRX6MdQC9a/JoesI1xikY3yAQQQxzN73F2Ti8IPl2ky6J08vOmvgIl5EhSUn/FXYrRDg4gY
	HICrvh+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5K0k-00000002zNE-0vUz;
	Wed, 25 Mar 2026 08:54:46 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5K0h-00000002zMR-1f55
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 08:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VFbVa+0YpacT1+xttrSmQ0z76K08F/kBytm4Dt7GAgc=; b=ffDiRKYa+7jkHaxEv6ziQ8DH81
	yVCM8KS3gaC8hokmXB7FqpdG4WD4tFS4ZwCII6wZBfD9p6KZ1cJrD7OKZFda4hpuTf20kLXyqP0ME
	+gOaILXE26iXr8EmA8oUG9/uipIwDIVnRufm5nKcgIbPZIUuV2a7gMOJWhAd8zqnefkRF9VvzYHlV
	VFMzULwiKOJvsDi71/+Dr77sirnMuPHf3TFzUn9KlG7Wmyb7Hybcs0T3uXjcIx8YlHHHE2+QsUEI4
	rWzDh5UYRQ7PLcZUknKIQZep54pvogrVaZ3tXB1+rmW3EGJMF3FoWWDR6ODMa2FP1AggdocM1zEQd
	wZwIJP3g==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1w5K0b-008xYe-QX; Wed, 25 Mar 2026 08:54:36 +0000
Date: Wed, 25 Mar 2026 01:54:32 -0700
From: Breno Leitao <leitao@debian.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Ryo Takakura <ryotkkr98@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: panic if IRQ shadow call stack allocation fails
Message-ID: <acOhjkLqf2gsM-Sf@gmail.com>
References: <20260324161545.5441-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324161545.5441-1-osama.abdelkader@gmail.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_015443_462618_BC051258 
X-CRM114-Status: GOOD (  20.96  )
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

On Tue, Mar 24, 2026 at 05:15:41PM +0100, Osama Abdelkader wrote:
> scs_alloc() can return NULL when vmalloc fails. init_irq_scs() previously
> stored that NULL in per-cpu irq_shadow_call_stack_ptr, which IRQ entry
> would then use under CONFIG_SHADOW_CALL_STACK. Match other SCS setup paths
> (e.g. SDEI) by failing explicitly instead of continuing with a NULL
> pointer.

Right,  _init_sdei_scs() doesn't not assign the per cpu pointer with
NULL, but, at the same time it doesn't panic. SDEI propagates -ENOMEM
back up the call chain and even frees already allocated stacks via
free_sdei_scs(). Should it panic as well?

> Mark init_irq_scs() __init since it is only called from init_IRQ().
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  arch/arm64/kernel/irq.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
> index 15dedb385b9e..b32ed7ef8e00 100644
> --- a/arch/arm64/kernel/irq.c
> +++ b/arch/arm64/kernel/irq.c
> @@ -14,6 +14,7 @@
>  #include <linux/init.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip.h>
> +#include <linux/kernel.h>

Why do you need kernel.h in here? I initially thought it was
for panic(), but, later I found panic() is already in use in this file.

Isn't kernel.h being included transitively?
>  #include <linux/kprobes.h>
>  #include <linux/memory.h>
>  #include <linux/scs.h>
> @@ -32,23 +33,26 @@ DEFINE_PER_CPU(struct nmi_ctx, nmi_contexts);
>  
>  DEFINE_PER_CPU(unsigned long *, irq_stack_ptr);
>  
> -
>  DECLARE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
>  
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  DEFINE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
>  #endif
>  
> -static void init_irq_scs(void)
> +static void __init init_irq_scs(void)
>  {
>  	int cpu;
> +	void *s;
>  
>  	if (!scs_is_enabled())
>  		return;
>  
> -	for_each_possible_cpu(cpu)
> -		per_cpu(irq_shadow_call_stack_ptr, cpu) =
> -			scs_alloc(early_cpu_to_node(cpu));
> +	for_each_possible_cpu(cpu) {
> +		s = scs_alloc(early_cpu_to_node(cpu));
> +		if (!s)
> +			panic("irq: Failed to allocate shadow call stack\n");
> +		per_cpu(irq_shadow_call_stack_ptr, cpu) = s;
> +	}
>  }

Reading RISC-V code, it seems it has the same problem. Is it worth fixing also?

 static void init_irq_scs(void)
  {
          int cpu;

          if (!scs_is_enabled())
                  return;

          for_each_possible_cpu(cpu)
                  per_cpu(irq_shadow_call_stack_ptr, cpu) =
                          scs_alloc(cpu_to_node(cpu));
  }

Other than these nits, feel free to add:

Reviewed-by: Breno Leitao <leitao@debian.org>

