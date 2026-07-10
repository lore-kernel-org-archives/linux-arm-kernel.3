Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0855C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36epyzeQ57987BAo//5mNX8OTT88iDUdRaI6qY+H3cE=; b=lcms2Aw2/z42Dm8T55YtsV4eda
	pG4J/tCmZFjq7AlBZo520JgWBX/G8WxuaBD8CGDrgmnB57JnxxnZRNxeHILAsmRsP8y2M8OFcMSFJ
	ur50It1htF9V20c2y6h9+poiZZXPqn+6ivp0KjfRMHQ4CtDEYgRLoTwhallNkXn1Fc+6tel64aBNu
	fuYHdx2B8t+/AbinJsweycA6eJ90gMAXjDzDgDpV96oH898V1qcdbvCDVC8HyzWq4bHoNmx+9T8fG
	bhampQX5O4oeKF0oepm0bcri3NPrXDw/4rlZsgefez57vSpPl/pdoLnaYO46acdrXLuMpLVfkTj0V
	1CcIvR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDv4-00000005Gk2-0Wjh;
	Fri, 10 Jul 2026 16:17:42 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDv2-00000005GjU-1tV8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 16:17:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493f25d47dcso8799605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783700258; x=1784305058; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=36epyzeQ57987BAo//5mNX8OTT88iDUdRaI6qY+H3cE=;
        b=Xc8gVQhqyBdgugbiyvCheejV9o5wwil6vk1hcNUWuzhEKgLZ5JGxa6nbK62mqIAgmv
         E+T00qb9Z+fn2KbwY71wLbSx8ziYqGoJigUK5WgaZAAtXJZONJKbxBWw+Bci2iBWflGo
         xlSNrdvJD8Zp2Qi4+TfHbXagiSYsUS0Xjps5MXTB1mJTQe7ONPBlugo9pp/ah02Z05I6
         nS87pG5oIdwe1FbMnA674ttY2mTr382GhDFysTztYtClPkLTX6PZZ0G+5x0zbuENFwSq
         ZeF6GgOCz3VVC4hfZqxCRCPk8PqP1OAg1B/wUpp3JPwZ6EVo6owrXbozHUCyZxS4EgWi
         1Rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700258; x=1784305058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36epyzeQ57987BAo//5mNX8OTT88iDUdRaI6qY+H3cE=;
        b=YfmIWgomPkIqU3LlZ0C1lUq0dVakWHMePo9VDJilQM91a+DMOw9wRB1nItUQaxZJht
         aZCqXT8VqPs68zw8L7UDvJNAFyJxDsTRckodshPZvDqN/q0jLmjcrzIuY31B91PGp//4
         +d6n3mqEuk7+oyawtC0/1+YnxV68bLfx5KBz0szd9MhmLlgxp0Y6dqiNkAtsYK2IdPYf
         pnbhX9GS6assdtgHRDR5BAB96pn1tVaKk9GMwOXFYGj2oT2++D07h9F4/hwzdLPcSfWq
         RV7JpxC4rJF+mFub4stB/CX29CDnL4v5zuedUPe87KriN/Jzvg5COB40ovEPJwRtVeAl
         T+cw==
X-Gm-Message-State: AOJu0YxHyN+fhApsVeSDmYFd2oH/ePqeIfKYFxzv4mqmoFEj8KsoK35Z
	+jOHLByR/lH+HIfvHsXYYJsBzFx0+XYiBfWkF+H7rN/9nTuDx2/CGtCX5k9KhlhQJQ==
X-Gm-Gg: AfdE7cnY/00tvc15XGMihPns387mloGUGOs66GOh2cqLxZQgUhNCu7YI3Ej+Wn2+pSg
	yJxmAd8pRO48dwqD7Tm+vNIDOeoYAZfkoQn302lPz2VrfFQMPGGLHlCxu41WNYssO/KmGQJClhT
	DucbQYfJPGRU9eMAC/cBKFv6k0VZVwgvruhDKXYqLgMlfsTtkeg4gzuJG//gN5Xrcq+DIS78Wo1
	hz6g2BLgMYiEbtxUcrTixYc17GuI2tldz/ME2PTQPQX9BzmuKiKyVlPeNqyqL60W1RLKuqx/QYq
	cpqBJO21NYvPoDIMSppt5rPrSuRqnA9YpgYdH0ZZ+ndJdRB8Fpgx8MRTq5UxH59+/YfR3p0dL6f
	zEU8OX9oDzpkboc23/8iygG0lJmpkAY6xPsSuMmHH2OJsSM0bF1GdXre+Tx+U79GJOTNu20hB8e
	MevXpR0n/4U8drKyNCXKl/QSIfETox/F6WA1+wHPx2b/r0Gag+IS8=
X-Received: by 2002:a05:600c:3496:b0:493:bc4a:c6b4 with SMTP id 5b1f17b1804b1-493f7499191mr13922845e9.38.1783700257980;
        Fri, 10 Jul 2026 09:17:37 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm143760685e9.3.2026.07.10.09.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:17:36 -0700 (PDT)
Date: Fri, 10 Jul 2026 17:17:32 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 07/25] KVM: arm64: iommu: Introduce IOMMU driver
 infrastructure
Message-ID: <alEbHFbmr_PvY6ZB@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-8-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501111928.259252-8-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_091740_526677_4E6ADF05 
X-CRM114-Status: GOOD (  31.61  )
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

On Fri, May 01, 2026 at 11:19:09AM +0000, Mostafa Saleh wrote:
> To establish DMA isolation, KVM needs an IOMMU driver which provides
> ops implemented at EL2.
> 
> Only one driver can be used and is registered with
> kvm_iommu_register_driver() by passing pointer to the ops.
> 
> This must be called before module_init() which is the point KVM
> initializes.

Everywhere s/KVM/pKVM/ as this can be registered only if pKVM is enabled.

> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h       |  5 +++++
>  arch/arm64/kvm/Makefile                 |  2 +-
>  arch/arm64/kvm/hyp/include/nvhe/iommu.h | 13 +++++++++++++
>  arch/arm64/kvm/hyp/nvhe/Makefile        |  3 ++-
>  arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 20 +++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/setup.c         |  5 +++++
>  arch/arm64/kvm/iommu.c                  | 26 +++++++++++++++++++++++++
>  7 files changed, 72 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/kvm/hyp/include/nvhe/iommu.h
>  create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
>  create mode 100644 arch/arm64/kvm/iommu.c
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 851f6171751c..52898d2a3ec6 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1733,4 +1733,9 @@ static __always_inline enum fgt_group_id __fgt_reg_to_group_id(enum vcpu_sysreg
>  
>  long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext);
>  
> +#ifndef __KVM_NVHE_HYPERVISOR__

I think it's not necessary, a lot of things aren't guarded for
__KVM_NVHE_HYPERVISOR__.

> +struct kvm_iommu_ops;

Perhaps we can keep this private to hyp code by just using (void *) here?

> +int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops);
> +#endif
> +
>  #endif /* __ARM64_KVM_HOST_H__ */
> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> index 59612d2f277c..0ddef54f7434 100644
> --- a/arch/arm64/kvm/Makefile
> +++ b/arch/arm64/kvm/Makefile
> @@ -24,7 +24,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
>  	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
>  	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
>  	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
> -	 vgic/vgic-v5.o
> +	 vgic/vgic-v5.o iommu.o

alphabetical order.

>  
>  kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
>  kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> new file mode 100644
> index 000000000000..1ac70cc28a9e
> --- /dev/null
> +++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ARM64_KVM_NVHE_IOMMU_H__
> +#define __ARM64_KVM_NVHE_IOMMU_H__
> +
> +#include <asm/kvm_host.h>
> +
> +struct kvm_iommu_ops {
> +	int (*init)(void);
> +};
> +
> +int kvm_iommu_init(void);
> +
> +#endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> index 89d0533921f9..606c0e1b7bd0 100644
> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> @@ -24,7 +24,8 @@ CFLAGS_switch.nvhe.o += -Wno-override-init
>  
>  hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o \
>  	 hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
> -	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
> +	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o \
> +	 iommu/iommu.o
>  hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
>  	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o clock.o
>  hyp-obj-y += ../../../kernel/smccc-call.o
> diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> new file mode 100644
> index 000000000000..406c8fb9b3b9
> --- /dev/null
> +++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IOMMU operations for pKVM
> + *
> + * Copyright (C) 2022 Linaro Ltd.
> + */
> +#include <nvhe/iommu.h>
> +
> +/* Only one set of ops supported */
> +struct kvm_iommu_ops *kvm_iommu_ops;
> +
> +

Empty line.

> +int kvm_iommu_init(void)
> +{
> +	/* Keep DMA isolation optional. */
> +	if (!kvm_iommu_ops || !kvm_iommu_ops->init)
> +		return 0;

The absence of the SME workaround on affected systems breaks pKVM init. So
perhaps the IOMMU should do the same? (see pkvm_check_sme_dvmsync_fw_call())

> +
> +	return kvm_iommu_ops->init();
> +}
> diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> index 8041f6e80cd1..1f6b221db9a0 100644
> --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> @@ -14,6 +14,7 @@
>  #include <nvhe/early_alloc.h>
>  #include <nvhe/ffa.h>
>  #include <nvhe/gfp.h>
> +#include <nvhe/iommu.h>
>  #include <nvhe/memory.h>
>  #include <nvhe/mem_protect.h>
>  #include <nvhe/mm.h>
> @@ -329,6 +330,10 @@ void __noreturn __pkvm_init_finalise(void)
>  	if (ret)
>  		goto out;
>  
> +	ret = kvm_iommu_init();
> +	if (ret)
> +		goto out;
> +
>  	ret = hyp_ffa_init(ffa_proxy_pages);
>  	if (ret)
>  		goto out;
> diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
> new file mode 100644
> index 000000000000..f247384fa193
> --- /dev/null
> +++ b/arch/arm64/kvm/iommu.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Google LLC
> + * Author: Mostafa Saleh <smostafa@google.com>
> + */
> +
> +#include <linux/kvm_host.h>
> +
> +extern struct kvm_iommu_ops *kvm_nvhe_sym(kvm_iommu_ops);
> +
> +static DEFINE_MUTEX(kvm_iommu_reg_lock);

could be moved directly into the only user: kvm_iommu_register_driver

> +
> +int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops)

__init ?

> +{
> +	guard(mutex)(&kvm_iommu_reg_lock);
> +
> +	/* Only protected KVM before de-privilege. */

Don't think that comment brings much information, looking at the line below.

> +	if (!is_protected_kvm_enabled() || is_kvm_arm_initialised())
> +		return -EINVAL;

-EPERM?

> +
> +	if (kvm_nvhe_sym(kvm_iommu_ops))
> +		return -EBUSY;
> +
> +	kvm_nvhe_sym(kvm_iommu_ops) = hyp_ops;
> +	return 0;
> +}
> -- 
> 2.54.0.545.g6539524ca2-goog
> 

