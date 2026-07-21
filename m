Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99449C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMOJHz/XCMhKiE2U1vvO9eSGZCNpXYgVldDTYc7JJDM=; b=E1SCPAwskDK0lo
	ljPFNymE1Fj41nwTTuQcxkM8Arf6ys8EScX79FSHTatoiXKbhMwzgaeetAw6YaDNpHcoQaU9+jBjT
	8ZnPZ79+Ymq6FcEjhqJphWGnRDqvnb7KOfjRizA+0DBVz+i/uzg16vfbKMt+YjQSgZfZVOQ/GsTxX
	KPb5fmxUql6PC0uQnaeM06hO3zpxtWxTjQz4k4D8yAysaagNdoWzGB1I3cgd1yO4/t2bhx3AhO8x+
	FNgF2zCfOE5XKqr0FtYU7iJz7CMpoOBtgknf47hTiw0pBk4ZXT1yWpqWv4KSkZaT/353g3Kcg/MAx
	lkLsFOBSt3Pqh2iELgQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6R8-00000008v8b-0dGz;
	Tue, 21 Jul 2026 09:06:50 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6R4-00000008v7s-3h6v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:06:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=IMOJHz/XCMhKiE2U1vvO9eSGZCNpXYgVldDTYc7JJDM=;
	b=A76zcX/le28ZLetwOsdGCYH2sygkrpLpHEjNZfJek5FV16uDXGnuSLvE+cJ5kfEsLa7F6dWNA
	FJSIfPOxvz/57CeL4Fd7unipb1TNsFeYvYQajUhWMMkCgWblarvCiLUAM4IS2/DF4A+kPPQGoMK
	p/T/bKNJ8AzarxJFt0AJie8=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4h4B8V4zWFz1prKd;
	Tue, 21 Jul 2026 16:56:58 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C861340538;
	Tue, 21 Jul 2026 17:06:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jul 2026 17:06:22 +0800
Message-ID: <b9d0683d-4469-4a8c-be1d-77d8b9836c0a@huawei.com>
Date: Tue, 21 Jul 2026 17:06:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 30/36] arm64: irq: Report FEAT_NMI masking local IRQs
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-31-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-31-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_020647_638335_D7B581EC 
X-CRM114-Status: GOOD (  28.53  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> As we clear SCTLR_EL1.SPINTMASK when enabling FEAT_NMI, ALLINT masks
> IRQs and FIQs regardless of superpriority.
> Update irqflags.h and `regs_irqs_disabled()` to take it into account,
> so we properly keep track of
> 
> We have documentation at the top of irqflags.h which explains the DAIF
> masking. Since the additional masking with NMIs is related and also
> covers the IF in DAIF, extend the comment to note what's going on
> with NMIs.
> 
> Co-developed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/irqflags.h | 17 +++++++++++++++++
>  arch/arm64/include/asm/ptrace.h   |  9 ++++++++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
> index b571d34bf11d..a291a231d644 100644
> --- a/arch/arm64/include/asm/irqflags.h
> +++ b/arch/arm64/include/asm/irqflags.h
> @@ -20,6 +20,16 @@
>   * always masked and unmasked together, and have no side effects for other
>   * flags. Keeping to this order makes it easier for entry.S to know which
>   * exceptions should be unmasked.
> + *
> + * With the addition of the FEAT_NMI extension we gain an additional
> + * class of superpriority IRQ/FIQ which is separately masked with a
> + * choice of modes controlled by SCTLR_ELn.{SPINTMASK,NMI}.
> + * Linux sets SPINTMASK to 0 and NMI to 1 which results in ALLINT.ALLINT
> + * masking both superpriority interrupts and IRQ/FIQ regardless of the
> + * I and F settings. Since these superpriority interrupts are being
> + * used as NMIs we do not include them in the interrupt masking here,
> + * anything that requires that NMIs be masked needs to explicitly do so,
> + * but we do check for ALLINT masking IRQs/FIQs.
>   */
>  
>   /*
> @@ -103,6 +113,9 @@ static __always_inline unsigned long arch_local_save_flags(void)
>  {
>  	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
>  
> +	if (system_uses_nmi())
> +		hwstate.allint = read_sysreg_s(SYS_ALLINT);
> +
>  	if (system_uses_irq_prio_masking())
>  		hwstate.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
>  
> @@ -117,6 +130,10 @@ static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
>  	if (hwstate.daif & PSR_I_BIT)
>  		return true;
>  
> +	/* SCTLR_EL1.SPINTMASK is clear, so ALLINT masks *all* IRQs/FIQs. */
> +	if (system_uses_nmi() && hwstate.allint > 0)

The ">0" here doesn't seem very rigorous, maybe:

if (system_uses_nmi() && hwstate.allint & ALLINT_ALLINT)

> +		return true;
> +
>  	if (system_uses_irq_prio_masking() && hwstate.pmr < GIC_PRIO_IRQON)
>  		return true;
>  
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index c630165882e8..096d85d75bd7 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -206,9 +206,16 @@ static inline void forget_syscall(struct pt_regs *regs)
>  		(regs)->pmr >= GIC_PRIO_IRQON :				\
>  		true)
>  
> +#define irqs_allint_clear(regs)				\
> +	(system_uses_nmi() ?				\
> +		((regs)->pstate & PSR_ALLINT_BIT) == 0:	\
> +		true)
> +
>  static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
>  {
> -	return (regs->pstate & PSR_I_BIT) || !irqs_priority_unmasked(regs);
> +	return (regs->pstate & PSR_I_BIT) ||
> +		!irqs_priority_unmasked(regs) ||
> +		!irqs_allint_clear(regs);

Why not define the logic for disable? The semantics of
regs_irqs_disabled() is "interrupts disabled".

204 #define
irqs_priority_masked(regs)>----->------->------->------->-------\
205 >-------(system_uses_irq_prio_masking()
?>------>------->------->-------\
206 >------->-------(regs)->pmr == GIC_PRIO_IRQOFF
:>------->------->-------\
207 >------->-------false)
208
209 #define irqs_allint_masked(regs)>------->------->------->-------\
210 >-------(system_uses_nmi() ?>--->------->------->-------\
211 >------->-------((regs)->pstate & PSR_ALLINT_BIT) :>----\
212 >------->-------false)
213
214 static __always_inline bool regs_irqs_disabled(const struct pt_regs
*regs)
215 {
216 >-------return (regs->pstate & PSR_I_BIT) ||
217 >------->-------irqs_priority_masked(regs) ||
218 >------->-------irqs_allint_masked(regs);

otherwise, LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  #define interrupts_enabled(regs)	(!regs_irqs_disabled(regs))


