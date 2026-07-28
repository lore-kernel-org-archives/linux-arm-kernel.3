Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB11C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 02:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ezikVBnXSki6nhUooCP/KeXpuFqnz8K+KhIid8hIrs=; b=nVOYNzceNWlbL70FldiBW+zd9A
	Y2QzHsUum1XH4MZbbWa/CdDvyy6h0Owk4vvlpR3LMJ+3JBi/xonTQ3G+BrIzaK5rDQNH6+4qcFnEo
	hYwvkIBpdPnUdkLqBL/mSyK74YjiMu2KC1yF63sx11TCt9VZHZsqpwXnIB37JDMv0Zpv/EY95Mt4m
	eQrxEMG83BwijYvHyFp0msnvP1lAlISoJvBtnB9ZgqsVN+YlXXpThgi0FjDsEDf/uKQBk/RpBETob
	fJH9DjevdHs3uU8mI1o+nWN78Ih8TuzLmrs5khpQr0ucPnp4Sn4oIDSAvOwitin5IjLbj0XQA1E/C
	wl4bvN+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXmd-00000004HMT-0Jxl;
	Tue, 28 Jul 2026 02:43:07 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXmZ-00000004HM4-1QVh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 02:43:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9ezikVBnXSki6nhUooCP/KeXpuFqnz8K+KhIid8hIrs=;
	b=Si0aDQ2tzlExlwEMX/Ka6FtqI37MIm6dGWnce3j4y/eUMgcaj9mw8fHNtAujyyyOuACzi6Akb
	s/lFngOT81y85UW2s6G26JpzhEtmPBF5zZV/x0dy0PjMlapypA8i/0TXm2l+epxBYCP1b+CtkZh
	7vfelOlkyhM8Rp77WuW4fHY=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4h8KJk10XTznTbD;
	Tue, 28 Jul 2026 10:33:26 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 2EF4F40572;
	Tue, 28 Jul 2026 10:42:54 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Jul 2026 10:42:53 +0800
Message-ID: <e3c7c161-7cd8-420a-9708-548fd9fbd39a@huawei.com>
Date: Tue, 28 Jul 2026 10:42:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 10/45] arm64: irqflags: Introduce arm64-specific
 irqflags type
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-11-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-11-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_194304_050913_2EFC0A05 
X-CRM114-Status: GOOD (  25.00  )
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
> With pseudo-NMIs enabled, we have two mechanisms that control
> interrupt masking in parallel :
> - The DAIF flags, masking at the CPU
> - The GIC PMR, masking before the CPU
> 
> However, our irqflags implementation currently assumes that only one
> of the two is used at a time, so both DAIF and PMR masking use the same
> `unsigned long flags` in their own way.
> This is incorrect, as some parts of the kernel will mask interrupts
> with DAIF directly or bypass the local_irq masking via the PMR,
> and makes tracking the state and changes of both in parallel impossible.
> 
> The irqflags API expects `unsigned long`s to be passed around, but
> they should not be manipulated outside of the arch-specific code.
> So, we can encode the information we need however we want as long as
> we return and accept `unsigned long`s.
> 
> Introduce a union type for arm64 irqflags whose first member is
> a struct allowing us to track DAIF and PMR in parallel, and the second
> is the `unsigned long` expected by the irqflags API.
> 
> DAIF is a two byte value, to maintain compatibility with existing defines.
> PMR is a one byte value, which is the maximum amount of priority bits
> allowed by the GICv3 architecture.
> 
> Update the internal irqflags functions to use this new union and convert
> back and forth with the irqflags unsigned long.
> There should be no functional changes.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/irqflags.h | 43 ++++++++++++++++++++++++++-----
>  1 file changed, 37 insertions(+), 6 deletions(-)

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
> index a8cb5a5c93b7..1863a955d119 100644
> --- a/arch/arm64/include/asm/irqflags.h
> +++ b/arch/arm64/include/asm/irqflags.h
> @@ -9,6 +9,8 @@
>  #include <asm/ptrace.h>
>  #include <asm/sysreg.h>
>  
> +#include <linux/compiler.h>
> +
>  /*
>   * Aarch64 has flags for masking: Debug, Asynchronous (serror), Interrupts and
>   * FIQ exceptions, in the 'daif' register. We mask and unmask them in 'daif'
> @@ -20,6 +22,23 @@
>   * exceptions should be unmasked.
>   */
>  
> + /*
> +  * Internally, we want to independently manipulate and track the different
> +  * interrupt masking mechanisms.
> +  * Externally, the generic irqflags API expects unsgined longs to represent
> +  * the state of interrupts, which are treated as obscure arch-specific data.
> +  */
> +typedef union arm64_exc_hwstate {
> +	struct {
> +		u16 daif;
> +		u8 pmr;
> +		u8 __padding[5];
> +	};
> +	unsigned long flags;
> +} arm64_exc_hwstate_t;
> +
> +static_assert(sizeof(arm64_exc_hwstate_t) == sizeof(unsigned long));
> +
>  static __always_inline void __daif_local_irq_enable(void)
>  {
>  	barrier();
> @@ -79,12 +98,16 @@ static __always_inline void arch_local_irq_disable(void)
>  
>  static __always_inline unsigned long __daif_local_save_flags(void)
>  {
> -	return read_sysreg(daif);
> +	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
> +
> +	return hwstate.flags;
>  }
>  
>  static __always_inline unsigned long __pmr_local_save_flags(void)
>  {
> -	return read_sysreg_s(SYS_ICC_PMR_EL1);
> +	arm64_exc_hwstate_t hwstate = { .pmr = read_sysreg_s(SYS_ICC_PMR_EL1) };
> +
> +	return hwstate.flags;
>  }
>  
>  /*
> @@ -101,12 +124,16 @@ static __always_inline unsigned long arch_local_save_flags(void)
>  
>  static __always_inline bool __daif_irqs_disabled_flags(unsigned long flags)
>  {
> -	return flags & PSR_I_BIT;
> +	arm64_exc_hwstate_t hwstate = { .flags = flags };
> +
> +	return hwstate.daif & PSR_I_BIT;
>  }
>  
>  static __always_inline bool __pmr_irqs_disabled_flags(unsigned long flags)
>  {
> -	return flags != GIC_PRIO_IRQON;
> +	arm64_exc_hwstate_t hwstate = { .flags = flags };
> +
> +	return hwstate.pmr != GIC_PRIO_IRQON;
>  }
>  
>  static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
> @@ -171,15 +198,19 @@ static __always_inline unsigned long arch_local_irq_save(void)
>  
>  static __always_inline void __daif_local_irq_restore(unsigned long flags)
>  {
> +	arm64_exc_hwstate_t hwstate = { .flags = flags };
> +
>  	barrier();
> -	write_sysreg(flags, daif);
> +	write_sysreg(hwstate.daif, daif);
>  	barrier();
>  }
>  
>  static __always_inline void __pmr_local_irq_restore(unsigned long flags)
>  {
> +	arm64_exc_hwstate_t hwstate = { .flags = flags };
> +
>  	barrier();
> -	write_sysreg_s(flags, SYS_ICC_PMR_EL1);
> +	write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
>  	pmr_sync();
>  	barrier();
>  }


