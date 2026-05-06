Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9AFCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 13:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGV26fxWeaXiY9rUme+lA6RZN5rDKEIrxGsO7OEUy+c=; b=B8euyl+jPusUQ0wzuvVLUi7S1M
	ubC/58hTm9PffJiS+jTYW4b/9B2scwycifoquWOJHtmoakpXQvqeBHVV7VnGTHpV+s0Ws5XXcOEUw
	TRYnLUgb7oY7EgNhr9jJADMJ0KCfbYtsxukwcIwgZW9mg8fskh5Ug3HZ9/T7/Oh4FqHqNYTeNYG7W
	EJZeFKNz7AQAcNB1zDqXSbHl3xjDLOxegtbmoeI5mvHhrj0Ngc94NQbwTkgTZqa+TYNnYT23WEYLK
	rdilabflfOVDEw5hz7vRivuSheEg98ZmG1Q1+JfCdHf/Hi8MWqBD2EWI5uVIOCxGebdSd9FMqvFVB
	fW3NRyIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcAF-00000000sGs-2fbV;
	Wed, 06 May 2026 13:19:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcAD-00000000sGE-3PYB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 13:19:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso9193365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778073584; x=1778678384; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xGV26fxWeaXiY9rUme+lA6RZN5rDKEIrxGsO7OEUy+c=;
        b=JQtrp0bvXa4aJ8jXGnfnkmHUukfMokCfNXUw1IU8n91HDLV/ZFiazJ0ESAdzmJXWjj
         OhNQgsrYtAIoRsGY9pXZbzoQZxre0ZYPylEKO8zh25tzLKqDwSOZLEOHHRJCne2gPkII
         dk+kM4AcZ3iReItZaK6pu2sAD072qNROnPkxhy4IG85Tu8su9ajY3zSuJHwmTxoY+J1j
         FHaBv3kWpsJZ/MI2SfI7ws4ihj7T81FQ+FijxdKCJ0YfV4aAO4XOvHnU7BAzTFDMh40R
         I1gBs08VjL7imd8JUz4+omiNED2WZv2ulcTiAnaeP2Nj/WYfc3LsgNZrNFE3ZqKHH/qz
         AzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778073584; x=1778678384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xGV26fxWeaXiY9rUme+lA6RZN5rDKEIrxGsO7OEUy+c=;
        b=iTHgoWZYMnNP3IqFkOICgddTEftYw+4/J8ZEQmyOr2vbVX5n0FtH2GIuJ2YVHPkuN4
         17MfUSsQrwXP5MlXPrSNNBf4OoQ1PNeKA5JmhAJ/wa+rUpzQmTsqCPHZAuKil70s1/Hz
         ElilWKMQfVtIxdXl5jVOzcCOMtUvSKSjhcOLuDOv1BAsd+gUSNFunNmxkFrknqs1lKDX
         f2lwp+jP+KzAgyV5M+t0kEasRTLNg93GMJogMKqCMYyp5MJ7cqCVkXdvq8X9m9NGTZFH
         HFF/E5A9YyTqxIpU0yiqCdCJEtNq9Ng4j6OuHDDv18U4Xcw/pz9nXiY6aLJiJ90xmGr6
         MQBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9u8I7x4fVnCuRlx7HTsohZjt7VGxejAWc/KkT5Z4ekfvdfrYjj6hIkgizbVpJsEPuD+rXeFLP7ck0iGJwm77R5@lists.infradead.org
X-Gm-Message-State: AOJu0YzSrqxlgzeywkQuAnOJO05+HWAoSIq05PGzY76OXy3VwEqN2ydW
	GUYovCtAnpNcCVvSQpJC+OpZbeb47vm8k1r6lB5TaQyUiT7SFVGk4Ttg
X-Gm-Gg: AeBDievDZLu0uc6VSJ71Ky+UBHQdqXEKieKB7JJujhm0jBULrnZrD7L3gDa4y2x1H0a
	T1g6Obwcz21qLv4Ko+FcHRom/HB43+f4xPxWR0/i0qlXOgQkpuQtXxDKPHgkMy+aGSJhXydY5Xy
	riQ1FRHytkXWIA/gTMS/0GGjsDqI1UslExj6kEpc8Gz9FHzl/C0CoVyXUyJkAmVax3OudEnRiyw
	Oh9A7SYP+Sd873r+//48oZY2BWg4hppoATCLJrn6a3sGG8D6uVeWOcgUgr6/Knp/dSdf+/HfDxy
	pQkQheR1XcnEdZ9PVieec+OyobCGLJ1uzdoP9adhYCA/bgpwKTa1ZlHiLUBjiQAQm2/6bwydrsk
	CCPwPWaXoKlByQ15TgXKrvqiUcOwHiv4Y38JzRk8bGpBf8hxK+TzIUlZk7n+j1XnmOSIQhiWcQX
	rDODD8V4R+u67+gwJ262bfFy/LM2kjTQ0/WXPEh6NeHZ/cYOPb8NU76sleHOWnApCSePQP2ISHT
	iPkHpY=
X-Received: by 2002:a05:600c:348f:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-48e522c0854mr52865865e9.13.1778073583834;
        Wed, 06 May 2026 06:19:43 -0700 (PDT)
Received: from osama ([2a02:908:1b6:8980:89b3:e462:e9ca:df27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538acbfcsm44485185e9.8.2026.05.06.06.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:19:43 -0700 (PDT)
Date: Wed, 6 May 2026 15:19:41 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: panic from init_IRQ if IRQ handler stacks
 cannot be allocated
Message-ID: <afs_7VzAljJ1ESbR@osama>
References: <20260326225755.50297-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326225755.50297-1-osama.abdelkader@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_061945_870571_25C5DE94 
X-CRM114-Status: GOOD (  19.49  )
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
ping.

