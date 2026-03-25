Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAB8109C03A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4d98qQH7jolVo8IoGMvQio/hE6nxnHp59wjwajsO4A=; b=XGr7XR6Igfm9gl3u5mMChXSG1S
	oJHxVFdX8zUWunIZKGzoYGUkTpLdNCGcG7NUsuaThb6vrBjoZ9qSOHe7qdrZoyIfeEgW3aBm/ZGwS
	Wv9Wr+ljpHDwD+hHEYmMuf4NmTIrC5jC5PxjfuoIiEKZue3tNDt99Gq6KgkvSs76Yqm5n5eQu7tlY
	9c//XW2FNjuxgdzuUw//3rLZl5ChijyN+mUJe5boc/FPvUaKT9QAZfT4aMCWWFIpx00pCZQtON0Hb
	VVUXsSXkpWlpuiGA5YlmqRrU/ByqThofLtU6YCzOnPPEy0kggyXUNx6NpTRpLItcTENJLP+hv1n9H
	BCOODfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RCp-00000003uvU-1X0M;
	Wed, 25 Mar 2026 16:35:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RCn-00000003uvL-3ggr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 16:35:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 056D960121;
	Wed, 25 Mar 2026 16:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B769C19423;
	Wed, 25 Mar 2026 16:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456540;
	bh=e0RZsWo0PGMZlAbfKytC5RYpmLuG3nP0M8rJFiCYFsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jo7K3OXEGOEVLEort8/CMLp2itGbgwwdm5Z8hI6qh/cROLtO59B2F+AM9fCZoBnbu
	 YT4uPwV0PN78JGTe0KD9+yyIhPUplu26Wpgnt9Ae8OSmP9eu1lwtgpk1H4pGVnB8Us
	 PJU1wihxPwsI3sP6FhGSbvhlZanfRdUvBx203++yJMGVAgEjhh1WmE4L0cmxNAhNBu
	 QQrI643pIPHr7USOpsGr4p8zOvakktgUSgESMRyUliWq1T1ETyiSAJjPtCMkTFuZue
	 53DdgFeRCc2Koc8Sveo4V2iLHqpjUe0xOsCdwZkb8PBueHr1bhL3j2hKU7fAwfNLZF
	 Aglw6rleP9pcQ==
Date: Wed, 25 Mar 2026 16:35:35 +0000
From: Will Deacon <will@kernel.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Breno Leitao <leitao@debian.org>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: panic if IRQ shadow call stack allocation fails
Message-ID: <acQO16dmw0v6pzu8@willie-the-truck>
References: <20260324161545.5441-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324161545.5441-1-osama.abdelkader@gmail.com>
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
> diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
> index 15dedb385b9e..b32ed7ef8e00 100644
> --- a/arch/arm64/kernel/irq.c
> +++ b/arch/arm64/kernel/irq.c
> @@ -14,6 +14,7 @@
>  #include <linux/init.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip.h>
> +#include <linux/kernel.h>
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

I don't especially see the point in these panic() messages given that
presumably all sorts of other things will go wrong if we fail simple
allocations this early during boot.

If you really want to check this, then we should at least do the same
for the IRQ stack itself, otherwise it's all a bit academic. So maybe
have init_irq_scs() and init_irq_stacks() return -ENOMEM so that
init_IRQ() can panic?

Will

