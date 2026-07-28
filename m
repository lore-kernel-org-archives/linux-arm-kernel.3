Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2026EC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WK3CgXtr2ty3q8EWbD+1X8fH6pEqlhZrYviQMJYZs3c=; b=tyl3fl+xLiVHIKSVyBfxC+Arik
	516vwRX2NE8EERooPvQRtDlncuA19kQXWMgCCqiNocKzdsIzHYyLkORd5hx2Iddgzmdt1zW+SSNSP
	CPNNTYCVsNj0gDCMyg3ueWjJlAFXnmpXrggdHuOV3P7JjitzB+RjJJhgX/H4tNSB5WWqVI931F/Ao
	QRVBmQPFr+QUnO/WOWKic7v5vOq9g7M+s4bvMMYx3I/DsylCc1rMFfJNOpTLPvU2a5EtjDWMM3T77
	zQI0LjW8fUsyngVgt5Whw+HNo7ZM9xIRAibIWZgQVh4ojL0ydzIUQjYTzMGiKuPuXtbwZFrIUCV3Z
	vGSOrBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofsn-0000000544y-0aqw;
	Tue, 28 Jul 2026 11:22:01 +0000
Received: from [113.46.200.220] (helo=canpmsgout05.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofsj-0000000543h-1HME
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:21:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=WK3CgXtr2ty3q8EWbD+1X8fH6pEqlhZrYviQMJYZs3c=;
	b=yvHKU/YvsvwmZljFM/W1jRfQ9vlo0nFW14EN1S2TliUitQxGxc4p5WLeUsABngV6opwuWRv4i
	zlWz0DsOitKQeGMyw9QIGCQI4TCKlN6/P9nZPZVUCvprtFvKTu8+/5slXlyt0TAf9bz79pTaWh3
	BEprDW3WZfXYtXzUc7luhSY=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4h8XqD1xdXz12LDF;
	Tue, 28 Jul 2026 19:12:08 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id ACCDB4058C;
	Tue, 28 Jul 2026 19:21:38 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Jul 2026 19:21:38 +0800
Message-ID: <015c93b8-5afc-48bb-95c3-c20ffe1d9c19@huawei.com>
Date: Tue, 28 Jul 2026 19:21:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 17/45] arm64: interrupts: introduce a helper for
 GIC priority initialization
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-18-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-18-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_042157_998335_8E3D0646 
X-CRM114-Status: GOOD (  21.62  )
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
> Arm64's `init_IRQ()` calls `local_daif_restore()` to synchronize
> interrupt masking via DAIF and switch to masking via PMR.  This
> depends on a very specific behaviour of `local_daif_restore()` which
> will clear DAIF if masking interrupts via PMR, which will get removed
> in the future.
> 
> As `setup_arch()` cleared DA only earlier, introduce a dedicated
> helper that explicitly initializes the PMR to mask interrupts and
> clears DAIF, switching to IRQ priority masking.
> 
> Given it is a dedicated helper, add a lockdep assertion as
> `setup_arch()` should always have called `trace_hardirqs_off()` when
> clearing DA, otherwise something bad happened.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/interrupts/masking.h | 19 +++++++++++++++++++
>  arch/arm64/kernel/irq.c                     | 13 +++++--------
>  2 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
> index fd4fb5497c7e..193089fda252 100644
> --- a/arch/arm64/include/asm/interrupts/masking.h
> +++ b/arch/arm64/include/asm/interrupts/masking.h
> @@ -5,6 +5,8 @@
>  #ifndef __ASM_INTERRUPTS_MASKING_H
>  #define __ASM_INTERRUPTS_MASKING_H
>  
> +#include <linux/lockdep.h>
> +
>  #include <asm/arch_gicv3.h>
>  #include <asm/bug.h>
>  #include <asm/cpufeature.h>
> @@ -86,4 +88,21 @@ static inline void local_exceptions_final_mask(void)
>  	__local_exceptions_final_mask();
>  }
>  #endif /* CONFIG_DEBUG_IRQFLAGS */
> +
> +/*
> + * During early boot, we unmask PSR.DA before the GIC has been set up.
> + * If we use IRQ priority masking, the PMR and PSR will be out of sync
> + * after the GIC is enabled : sync them up.
> + */
> +static inline void local_interrupt_priority_init(void)
> +{
> +	if (!system_uses_irq_prio_masking())
> +		return;
> +
> +	WARN_ON(read_sysreg(daif) & PSR_A_BIT);
> +	lockdep_assert_irqs_disabled();
> +
> +	arm64_update_exc_context(NOIRQ_CONTEXT);
> +}
> +
>  #endif /* __ASM_INTERRUPTS_MASKING_H */
> diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
> index ca98db345f92..a3d9128ba195 100644
> --- a/arch/arm64/kernel/irq.c
> +++ b/arch/arm64/kernel/irq.c
> @@ -130,14 +130,11 @@ void __init init_IRQ(void)
>  
>  	irqchip_init();
>  
> -	if (system_uses_irq_prio_masking()) {
> -		/*
> -		 * Now that we have a stack for our IRQ handler, set
> -		 * the PMR/PSR pair to a consistent state.
> -		 */
> -		WARN_ON(read_sysreg(daif) & PSR_A_BIT);
> -		local_daif_restore(DAIF_PROCCTX_NOIRQ);
> -	}
> +	/*
> +	 * Now that we have a stack for our IRQ handler,
> +	 * let's mask interrupts via the PMR.
> +	 */
> +	local_interrupt_priority_init();

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  #ifdef CONFIG_DEBUG_IRQFLAGS


