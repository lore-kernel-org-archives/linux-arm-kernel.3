Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F339C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMfFkOBv7vea26mag8Jd4fWTZiErr47zU0KC7mS0yCY=; b=vw1x5xoYNAaLFibTQUHqDscGE+
	c0OB508VUERyqdUKHIfJ9l8IL5FjgVieqzAvtOBv2NCzyQ7nvoN05MJ34Myu8GWcgly6eF7jmXwpB
	tVZNd3dqV0Q2g9s5k7yFu+90bQzoB3ASffjXhVbmZg5SJ9oWj0L4XyIqQ1f5PpqN3C0U3VEvAooWm
	Ev8iIV/sGJcPNWv9V1dZ41Td83raQRD+IuYpWZpF3amvjT+YxvDXW/mvnPo52oGcAyhnySbZrQqzd
	EeRoIDSJoHwhz0mFJT0GoZkQse1rjkEk7bCcW1IWKkpER+jNw2QAfppy7+iOu3kbHcydFjCDNLvzs
	AjPUATTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjBD-0000000DmrO-216a;
	Tue, 11 Aug 2026 09:53:55 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjB7-0000000DmqA-2m3N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 09:53:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YMfFkOBv7vea26mag8Jd4fWTZiErr47zU0KC7mS0yCY=;
	b=ILqyC7eEg41qepyyUww353hLWhY79P6m/OsDM2LUbN3zM5RLf5HHwwqoPl5+bowyvGWk6GzT8
	Gv/NbgEBpyQvj1fEBrI4kcpO/Pnvnoee0oqMqPLuQY7blVBrVLH5tYJ+y9uLqu6c0fM/YtU8Wbc
	kp/4ildR5JsOIRtVpuVkXJU=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hK69r1pg2zpT0b;
	Tue, 11 Aug 2026 17:42:56 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 2602C40538;
	Tue, 11 Aug 2026 17:53:38 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Aug 2026 17:53:37 +0800
Message-ID: <88bdbbd3-8644-49f0-ac64-30eb58679c4f@huawei.com>
Date: Tue, 11 Aug 2026 17:53:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 21/45] arm64: gicv3: remove GIC_PRIO_PSR_I_SET
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-22-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-22-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_025351_342383_B5FB7D80 
X-CRM114-Status: GOOD (  20.95  )
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
> `GIC_PRIO_PSR_I_SET` was used to keep track of sections of the kernel
> where interrupts always need to reach the CPU and could not be masked

I understand it's used in scenarios similar to CPU idle entering WFI,
where the CPU needs to be woken up by interrupts.

> via interrupt priorities, or DAIF bypassed the status of the PMR.
> 
> This flag unmasked IRQs when OR'd to GIC_PRIO_IRQON and ensured that

Yes GIC_PRIO_PSR_I_SET | GIC_PRIO_IRQON has has a lower PMR priority ,so
unmask the IRQs.

> that IRQs were seen as disabled by the `local_irqs_...` functions,
Yes, a flags value that is not equal to GIC_PRIO_IRQON is regarded as
the disabled state for interrupts.

> as they would only check the PMR if pseudo-NMIs were enabled.
> 
> This is not needed anymore as our IRQ masking APIs now know how to handle
> interrupt priorities properly and in parallel with DAIF : remove it.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/ptrace.h         | 2 --
>  include/linux/irqchip/arm-gic-v3-prio.h | 8 --------
>  2 files changed, 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index e4c7e6bafa3d..cf7e51b8ef0b 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -24,8 +24,6 @@
>  #define GIC_PRIO_IRQON		GICV3_PRIO_UNMASKED
>  #define GIC_PRIO_IRQOFF		GICV3_PRIO_IRQ
>  
> -#define GIC_PRIO_PSR_I_SET	GICV3_PRIO_PSR_I_SET
> -
>  /* Additional SPSR bits not exposed in the UABI */
>  #define PSR_MODE_THREAD_BIT	(1 << 0)
>  #define PSR_IL_BIT		(1 << 20)
> diff --git a/include/linux/irqchip/arm-gic-v3-prio.h b/include/linux/irqchip/arm-gic-v3-prio.h
> index 44157c9abb78..464bf1d29453 100644
> --- a/include/linux/irqchip/arm-gic-v3-prio.h
> +++ b/include/linux/irqchip/arm-gic-v3-prio.h
> @@ -20,17 +20,11 @@
>   * GICV3_PRIO_NMI is the PMR view of the priority of pseudo-NMIs. This can be
>   * written to the PMR to mask pseudo-NMIs.
>   *
> - * On arm64 some code sections either automatically switch back to PSR.I or
> - * explicitly require to not use priority masking. If bit GICV3_PRIO_PSR_I_SET
> - * is included in the priority mask, it indicates that PSR.I should be set and
> - * interrupt disabling temporarily does not rely on IRQ priorities.
>   */
>  #define GICV3_PRIO_UNMASKED	0xe0
>  #define GICV3_PRIO_IRQ		0xc0
>  #define GICV3_PRIO_NMI		0x80
>  
> -#define GICV3_PRIO_PSR_I_SET	(1 << 4)
> -
>  #ifndef __ASSEMBLER__
>  
>  #define __gicv3_prio_to_ns(p)	(0xff & ((p) << 1))
> @@ -45,8 +39,6 @@ static_assert(__gicv3_prio_valid_ns(GICV3_PRIO_IRQ));
>  static_assert(GICV3_PRIO_NMI < GICV3_PRIO_IRQ);
>  static_assert(GICV3_PRIO_IRQ < GICV3_PRIO_UNMASKED);
>  
> -static_assert(GICV3_PRIO_IRQ < (GICV3_PRIO_IRQ | GICV3_PRIO_PSR_I_SET));
> -
>  #endif /* __ASSEMBLER */
>  
>  #endif /* __LINUX_IRQCHIP_ARM_GIC_V3_PRIO_H */


