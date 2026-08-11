Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B825BC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EzVfU42DNboWBRrLELfhvDn1lnOQfSuYeFuDLVFwHY=; b=bQcyxhjMAWTL/QwRjmRQlcux/4
	m+7aKicoT7YvxRylgVN22tMKokoINknKIkFXCio3ik0vy1+oeSSBLHdptaLANNaezIHc6bY57ptIw
	KSVzBn9k6im188MkivkwzdmruTU2S1r0NiVaFgHZ60DeJmyusZTrCXv1+oUaQLyU37bdc4c4ra+H/
	aRiD7n9Yx/ZI0ReOhZ0UxMm0/ZQrXwZADZzhwdM7cBJ/YWkrok0nm2/vw68s2wTVfn4rlhRhb5B9u
	vRPcVMOSeGKVzzH0l3OvjBtDPX0xeBaufBioS9ir8+Tq8y7rjUiit5M5JN/DO8AuQO2rVkNIUbE1f
	hdrTP6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtm6k-0000000E3u6-1nIg;
	Tue, 11 Aug 2026 13:01:30 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtm6g-0000000E3t1-1oT7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:01:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7EzVfU42DNboWBRrLELfhvDn1lnOQfSuYeFuDLVFwHY=;
	b=6spCHFowSfjeLeN67/0y5TMk+DC6s2cVvQuZG/CnFJtYXg2FjbG3F2Bx6HSA3mHoznszgeGAw
	Oz54kH5NC4idcttIt0IGUHcUnSi8+9tnU9Hq7+ByJHNK+xAU1YRn4KSgLTtMVxapLF6c/PV3SKe
	5DONG+aiN0Ru7pLb+OnzjJg=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hKBL945Y3z1K96b;
	Tue, 11 Aug 2026 20:50:25 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E3254055B;
	Tue, 11 Aug 2026 21:01:02 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Aug 2026 21:01:01 +0800
Message-ID: <f3297dda-9811-439b-8a49-6b66cf7e3767@huawei.com>
Date: Tue, 11 Aug 2026 21:01:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 33/45] arm64: irq: Report FEAT_NMI masking local
 IRQs
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-34-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-34-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_060127_132770_F073F6C2 
X-CRM114-Status: GOOD (  25.44  )
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



在 2026/7/28 0:34, Vladimir Murzin 写道:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> As we clear SCTLR_EL1.SPINTMASK when enabling FEAT_NMI, ALLINT masks
> IRQs and FIQs regardless of superpriority.
> Update irqflags.h and `regs_irqs_disabled()` to take it into account,
> so we properly keep track of the local IRQ masking state.
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
>  arch/arm64/include/asm/ptrace.h   |  3 +++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
> index c719b7e2912e..9115cdc9d517 100644
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
> @@ -104,6 +114,9 @@ static __always_inline unsigned long arch_local_save_flags(void)
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
> +	if (system_uses_nmi())
> +		return !!(hwstate.allint & ALLINT_ALLINT);
> +
>  	if (system_uses_irq_prio_masking()) {
>  		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) &&
>  			     hwstate.pmr != GIC_PRIO_IRQOFF &&
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index cf7e51b8ef0b..16ba164b890e 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -206,6 +206,9 @@ static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
>  	if (regs->pstate & PSR_I_BIT)
>  		return true;
>  
> +	if (system_uses_nmi())
> +		return !!(regs->pstate & PSR_ALLINT_BIT);

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +
>  	if (system_uses_irq_prio_masking()) {
>  		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) &&
>  			     regs->pmr != GIC_PRIO_IRQOFF &&


