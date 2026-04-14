Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A0DED7B96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfhtP/TymotrhPrcOVkiPER8szRMYGC9sOoOX92Yt+I=; b=z+dv0wyhMTQ5rom0dST6AJSoKC
	X5dYyMQX7kF/9bKfVQPPeG3/gbHIrNdbkkRtAoE3NOTdRgg6YGmlroctNMesoggNn84gAc9tCgOGl
	VMzmjdfGB9mV3FTxKb8u5SsCHBEHS0jnzpn2IbsB4C0A/EDCmOllwviUminSYxGVaTI5ynxN4C/RP
	t3qgwL7z91YBxTeZg8dMOYFXOHk5kLLZ+c2CBEg6e0p2qZU+dYrb71YFsLtrraFiNlevlmJVEcoUd
	9Dnno/8tgavevte3eSX+nuznQ3J3px2prsHibWzssL2K+duzM2BUGSir4vzsc3SlzCO+Twfgcv816
	TkfobiMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCamp-0000000H7Mz-3Ezn;
	Tue, 14 Apr 2026 10:14:27 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCamm-0000000H7Mc-3EvZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 10:14:25 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso924969f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 03:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776161662; x=1776766462; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NfhtP/TymotrhPrcOVkiPER8szRMYGC9sOoOX92Yt+I=;
        b=hDDUiV/2C7j4F66WUixg4GEAOqHt3nK0APK4n3KWH/IBsqLzy7nlGkGIxHMFdSxAnz
         X1vBDAio+xH4Lczs5CysufUjI8ttIkGTuR44RrBenL2jktK63LgnJI201dEkTqkuiJUz
         3Udat5f32wsG9uoxmgazNet+wC0L2NA/wn/0VcQRfYcNNXAIq4wApzT0/cCMGPcixvuT
         uwOSgZ+WiTihzMasF3lXCEjWhGxeCQpVoq9AGCPa2TzGxtoBhmLwiEeWJoyn0qPzFfMB
         sCvZB0b75nISSVcSFsB0XpaGae4NMJkLcE7qk3n5SiuHht5++HW6TaQoZ+zeJ4H0GQ1V
         8G+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161662; x=1776766462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NfhtP/TymotrhPrcOVkiPER8szRMYGC9sOoOX92Yt+I=;
        b=CgaTeBClpy6+uPQnmHLZMO3VKfSM7N+XYJaS3K5U15hZQDxEAY7qPO/Tt3LabaVpvb
         /14rl+ToAz6h5/1VmTN/YB4M30yLhM+oGT5oLk/gJkckpX3L9BgPgLEBXdbAWZyl3zf3
         PmZ/UD6O+TxMxqCuVMcHTNQuqRk3sOpDtTemGv0tzTytjysEgtiFEcOYV4Q30oBUfTG0
         qszq2LOhcw8zDgp2apbUH+scpvFT7QyHcJF+I5wTQLQ1E6/IrdhW8qq0LcxMmhUVHbGE
         JIrqPeXFQILX86GvnBIDwDnopavLdaunxzYAAPaI+MvyHxpdBMP9KRMw6Th1WVHuj8GK
         Q0mA==
X-Forwarded-Encrypted: i=1; AFNElJ+PsyXcTtczcQmki4I9Wt1tAz67ULFBFl0SHfyioDvHl3n/Yh6aoWge0p+DFUG+6Y2MxEASM0IKtQVqzEQg2s0c@lists.infradead.org
X-Gm-Message-State: AOJu0YxsL9S7vGRmI7RPfbZxewuxw42eTEJbrd/JfUNrqYi4xaxLVCr6
	EVw8DzvU2aql3RtyhvRmPUiAn2kqB+N7XYp0SMocrm47WzK9qft5e8L7
X-Gm-Gg: AeBDieuL6CDksEJrkS4Km80FdTlXUis7nymGSnCHbkxfRDcnD3QIr4i/1tvlLh1ohw5
	i7IDBpBNmHTZnQ81h0PSX/gWXpljzkxwKXGhM3BV4PRr16/X4blMEG/QbKxJoyFxwEwGfs0W6MU
	XKxBjfdekgJU31882qL/x/i9pL3/liF5MqmUIcP0Rdtuz5EPmDndAw1mWixpPjzEa8dLnPD2dE6
	bsPOgB3yur5ESs5rooJbexK7XFrrQSkQpMEQhfQ7+QKKZYFnSU+DnuNhiIoSFuhHaVGzN5TqE6Z
	uy8RgJv7n9t6oPuo3U/zUUkUCp88oe3yYV0Tk9rLlhlCQhBayedAcwLvHm7skSJwNgJDMZnqn6W
	ibtOBvK1VidshujQOabxRielb2SlLzLaBA2brsKUzqEP2qhcWtVV784yshj5KrxDIn3KJ+VAEkT
	Ih6Ck/fyXX8Fa6t68Ub0IEOYvRzZYUsoTg3aj14meXiE6Z5DxYWfzOsxQxuQ==
X-Received: by 2002:a05:6000:4387:b0:43d:7508:c9c1 with SMTP id ffacd0b85a97d-43d7508cd32mr14134342f8f.50.1776161662283;
        Tue, 14 Apr 2026 03:14:22 -0700 (PDT)
Received: from osama ([2a02:908:1b6:8980:1aaa:ede0:d93f:dcaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ea764eff2sm2779121f8f.27.2026.04.14.03.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 03:14:21 -0700 (PDT)
Date: Tue, 14 Apr 2026 12:14:19 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: panic from init_IRQ if IRQ handler stacks
 cannot be allocated
Message-ID: <ad4Te1AKgWt2stVL@osama>
References: <20260326225755.50297-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326225755.50297-1-osama.abdelkader@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_031424_831798_81249184 
X-CRM114-Status: GOOD (  20.08  )
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

On Thu, Mar 26, 2026 at 11:57:52PM +0100, Osama Abdelkader wrote:
> init_irq_stacks() and init_irq_scs() may fail when arch_alloc_vmap_stack
> or scs_alloc return NULL. Return -ENOMEM from both and call panic() once
> from init_IRQ(), covering per-CPU IRQ stacks and shadow IRQ stacks
> consistently.
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
> v2:
> - Add return -ENOMEM from both init_irq_stacks() and init_irq_scs()
> - Call panic() once from init_IRQ() if either init_irq_stacks() or
>   init_irq_scs() returns -ENOMEM
> ---
>  arch/arm64/kernel/irq.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
> index 15dedb385b9e..9fafd826002b 100644
> --- a/arch/arm64/kernel/irq.c
> +++ b/arch/arm64/kernel/irq.c
> @@ -10,6 +10,7 @@
>   * Copyright (C) 2012 ARM Ltd.
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/hardirq.h>
>  #include <linux/init.h>
>  #include <linux/irq.h>
> @@ -32,34 +33,43 @@ DEFINE_PER_CPU(struct nmi_ctx, nmi_contexts);
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
> +static int __init init_irq_scs(void)
>  {
>  	int cpu;
> +	void *s;
>  
>  	if (!scs_is_enabled())
> -		return;
> +		return 0;
> +
> +	for_each_possible_cpu(cpu) {
> +		s = scs_alloc(early_cpu_to_node(cpu));
> +		if (!s)
> +			return -ENOMEM;
> +		per_cpu(irq_shadow_call_stack_ptr, cpu) = s;
> +	}
>  
> -	for_each_possible_cpu(cpu)
> -		per_cpu(irq_shadow_call_stack_ptr, cpu) =
> -			scs_alloc(early_cpu_to_node(cpu));
> +	return 0;
>  }
>  
> -static void __init init_irq_stacks(void)
> +static int __init init_irq_stacks(void)
>  {
>  	int cpu;
>  	unsigned long *p;
>  
>  	for_each_possible_cpu(cpu) {
>  		p = arch_alloc_vmap_stack(IRQ_STACK_SIZE, early_cpu_to_node(cpu));
> +		if (!p)
> +			return -ENOMEM;
>  		per_cpu(irq_stack_ptr, cpu) = p;
>  	}
> +
> +	return 0;
>  }
>  
>  #ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
> @@ -109,8 +119,9 @@ int __init set_handle_fiq(void (*handle_fiq)(struct pt_regs *))
>  
>  void __init init_IRQ(void)
>  {
> -	init_irq_stacks();
> -	init_irq_scs();
> +	if (init_irq_stacks() || init_irq_scs())
> +		panic("Failed to allocate IRQ stack resources\n");
> +
>  	irqchip_init();
>  
>  	if (system_uses_irq_prio_masking()) {
> -- 
> 2.43.0
> 

Hi All,

Can you please review?

Best regards,
Osama

