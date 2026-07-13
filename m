Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93C0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FOjodbDLawuqaxqRGW5J71xttNR9yOzfD0eE/pV9Fc=; b=2G0KvZzuEOKwK/T9BfGxAzj+Qy
	UvC2XLysyVCEwXnWPJ1hv5nANFhtm4x+KUJWLCzfEe9e3bW1INe57A4lnObnRYFPxgC+e822+I3NB
	SjWOLGiHo2G84ssv3MHop5hytE/pKwrInI7cB+mhJ+spTLrsJlPRGI4gjb3rEUmnL5oQpQ+tgRQJi
	wokpQmxy54GHXjWaHLhftvy4xX1Akqt0Km7EHvvKiPE6V/ldDnJNa4g8OpwRuGR/HkfC4lkcT0c3g
	AOaWCaGOIAcrrmx4nLy7F0g/45cIn/a0xMcVWTceFH/kVrR6XZNSH4CrsEiRSwFcnKHtQAGiQvVZM
	L57pxEYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDf8-00000008qgI-2F60;
	Mon, 13 Jul 2026 10:13:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDf5-00000008qe5-3eU9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 10:13:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so88335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 03:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783937598; x=1784542398; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4FOjodbDLawuqaxqRGW5J71xttNR9yOzfD0eE/pV9Fc=;
        b=mZsy+29ppmd6SU/QfHEdCZFDbqQzUtUZNRsctHGLJGppAqQCUytk9hj5ti7bWaVIDi
         WnhWyMXZoNxKfRAdvmpYCIGk0ros8aJOEtcpNMP4nBfgICOL1a7a8EqqIkmfkOJJoyg1
         rXQrDR9j7//jRTzYG1klDMA7404L/opjAcIN2g07RqruaItdbxXjkN5NhyywkPIYJc2M
         YmIbbkNh1nWlSCOt54t3KMSac/dNESs5lg1XJ1YjllYNVP+ulfWV5PX5in6E7jMNz/Ii
         35OCnrU5e923BKcftKosZIc8WpdOh/PK06IgWEdCgxsd809lE6xSiHjJhwW+feF3NITm
         qIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783937598; x=1784542398;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FOjodbDLawuqaxqRGW5J71xttNR9yOzfD0eE/pV9Fc=;
        b=j5ghcWTf4q6vwbABlKtLcLYfp/SbZVzMsI3b2lr/g+CZv+5V6/SvMEAns4yKu05m+B
         0mJXCp2V6nO9URhp4GIcDb1vMMET6T7AxE2mdABGUqJ84Vtrwb4d5Yy4qyi+Jxr7mDes
         7kEwDTdEKJol/5epeQDJjKfNbYFgrwD9l/fB/hlwUx55N3KID+WBIYXBlUnl2pVxdq2L
         kSCshcN3nSQgmR1BpAqWOAU/U2bPeva9DlgefPe3MPOn9u1vrWOJYqLgVw7xfkpgVvB3
         wdlH413fJhuwnqzyWEHR4fpusOBIWhT6GdseqPqr1hKNJwMfHC0RbygyJ5VbxtNu6Upa
         ksWQ==
X-Gm-Message-State: AOJu0YzTjry7b4xHcxgA9mA8GPygmj2LFnhHqpLRwCZ+e0qWvxBALvdP
	NOnWky8iVlKM5qTT8DNy6FgrmtqUiEUYwCq9O8/IVGrcDEMiyFpVb9JmCHZurzBKsg==
X-Gm-Gg: AfdE7cmQ6JLa61f+wCmAXB7pw+v9BP1ZaY2MW4smeiOHQ98BE3ejARG+Wx3LlyFYVB7
	avTTKV4H1U1Oncb0YjJT0MGogHgJQc5pcuizUZes8LGgymrNUCxcGDMkQ00cX5vCFk5WPZ3ss07
	E+d3d4UwWgHcJEnPv/mZg64Q20LlkdsWkejHQtIau59Wzgn3RbKAqnLsKEvxRl0I58CL4DJbJ2i
	0gcAr6aM0Gp0/XyRsrEfHosa7fq5E6QeP6p0ClK389lx6S8bhWpi85AqD0wak/JjMpn05Pnar2i
	JrT5+FOcYhrRdVI4/EuGu3XcdKAoRuLBw539nz4747N2bGcB4eRmi09gsAK844S2RwuEocBsCVF
	SJ9UTR9FQ3524HTdp71JmytyecRIkOMwwUBUdCkfd7Bh0OsSxMNIFaKAt710CKSo9bMnRrekkT4
	MKYp0nfFFXlGgCFNUyocCYxkyUTIxd1sck8p+7mIbnrtrY5szx
X-Received: by 2002:a05:600c:4ec6:b0:493:aed4:8d03 with SMTP id 5b1f17b1804b1-49468883469mr153335e9.9.1783937597212;
        Mon, 13 Jul 2026 03:13:17 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm80270824f8f.23.2026.07.13.03.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:13:15 -0700 (PDT)
Date: Mon, 13 Jul 2026 10:13:09 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 07/25] KVM: arm64: iommu: Introduce IOMMU driver
 infrastructure
Message-ID: <alS6NVzDahb2sCQP@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-8-smostafa@google.com>
 <alEbHFbmr_PvY6ZB@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alEbHFbmr_PvY6ZB@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_031319_982583_824FB97D 
X-CRM114-Status: GOOD (  41.89  )
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

On Fri, Jul 10, 2026 at 05:17:32PM +0100, Vincent Donnefort wrote:
> On Fri, May 01, 2026 at 11:19:09AM +0000, Mostafa Saleh wrote:
> > To establish DMA isolation, KVM needs an IOMMU driver which provides
> > ops implemented at EL2.
> > 
> > Only one driver can be used and is registered with
> > kvm_iommu_register_driver() by passing pointer to the ops.
> > 
> > This must be called before module_init() which is the point KVM
> > initializes.
> 
> Everywhere s/KVM/pKVM/ as this can be registered only if pKVM is enabled.

Will do.

> 
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h       |  5 +++++
> >  arch/arm64/kvm/Makefile                 |  2 +-
> >  arch/arm64/kvm/hyp/include/nvhe/iommu.h | 13 +++++++++++++
> >  arch/arm64/kvm/hyp/nvhe/Makefile        |  3 ++-
> >  arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 20 +++++++++++++++++++
> >  arch/arm64/kvm/hyp/nvhe/setup.c         |  5 +++++
> >  arch/arm64/kvm/iommu.c                  | 26 +++++++++++++++++++++++++
> >  7 files changed, 72 insertions(+), 2 deletions(-)
> >  create mode 100644 arch/arm64/kvm/hyp/include/nvhe/iommu.h
> >  create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> >  create mode 100644 arch/arm64/kvm/iommu.c
> > 
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 851f6171751c..52898d2a3ec6 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1733,4 +1733,9 @@ static __always_inline enum fgt_group_id __fgt_reg_to_group_id(enum vcpu_sysreg
> >  
> >  long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext);
> >  
> > +#ifndef __KVM_NVHE_HYPERVISOR__
> 
> I think it's not necessary, a lot of things aren't guarded for
> __KVM_NVHE_HYPERVISOR__.

That makes it clear that it is hypervisor code, but no strong opinion.

> 
> > +struct kvm_iommu_ops;
> 
> Perhaps we can keep this private to hyp code by just using (void *) here?

That does not leak the struct, it is just a forward declaration, I
beleive it is more clear and readable this way.

> 
> > +int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops);
> > +#endif
> > +
> >  #endif /* __ARM64_KVM_HOST_H__ */
> > diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> > index 59612d2f277c..0ddef54f7434 100644
> > --- a/arch/arm64/kvm/Makefile
> > +++ b/arch/arm64/kvm/Makefile
> > @@ -24,7 +24,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
> >  	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
> >  	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
> >  	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
> > -	 vgic/vgic-v5.o
> > +	 vgic/vgic-v5.o iommu.o
> 
> alphabetical order.

That does not seem to be already sorted.

> 
> >  
> >  kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
> >  kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> > new file mode 100644
> > index 000000000000..1ac70cc28a9e
> > --- /dev/null
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ARM64_KVM_NVHE_IOMMU_H__
> > +#define __ARM64_KVM_NVHE_IOMMU_H__
> > +
> > +#include <asm/kvm_host.h>
> > +
> > +struct kvm_iommu_ops {
> > +	int (*init)(void);
> > +};
> > +
> > +int kvm_iommu_init(void);
> > +
> > +#endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
> > diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> > index 89d0533921f9..606c0e1b7bd0 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> > +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> > @@ -24,7 +24,8 @@ CFLAGS_switch.nvhe.o += -Wno-override-init
> >  
> >  hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o \
> >  	 hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
> > -	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
> > +	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o \
> > +	 iommu/iommu.o
> >  hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
> >  	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o clock.o
> >  hyp-obj-y += ../../../kernel/smccc-call.o
> > diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> > new file mode 100644
> > index 000000000000..406c8fb9b3b9
> > --- /dev/null
> > +++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> > @@ -0,0 +1,20 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * IOMMU operations for pKVM
> > + *
> > + * Copyright (C) 2022 Linaro Ltd.
> > + */
> > +#include <nvhe/iommu.h>
> > +
> > +/* Only one set of ops supported */
> > +struct kvm_iommu_ops *kvm_iommu_ops;
> > +
> > +
> 
> Empty line.
> 

Will remove it.

> > +int kvm_iommu_init(void)
> > +{
> > +	/* Keep DMA isolation optional. */
> > +	if (!kvm_iommu_ops || !kvm_iommu_ops->init)
> > +		return 0;
> 
> The absence of the SME workaround on affected systems breaks pKVM init. So
> perhaps the IOMMU should do the same? (see pkvm_check_sme_dvmsync_fw_call())
> 

I initially done something similar, but I was not sure if that is too
limiting as now pKVM will not run on many hardware, I think the
best option is to make this cmdline configurable wether DMA isolation
is required or not.
But for this series we can keep it optional.

> > +
> > +	return kvm_iommu_ops->init();
> > +}
> > diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> > index 8041f6e80cd1..1f6b221db9a0 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> > @@ -14,6 +14,7 @@
> >  #include <nvhe/early_alloc.h>
> >  #include <nvhe/ffa.h>
> >  #include <nvhe/gfp.h>
> > +#include <nvhe/iommu.h>
> >  #include <nvhe/memory.h>
> >  #include <nvhe/mem_protect.h>
> >  #include <nvhe/mm.h>
> > @@ -329,6 +330,10 @@ void __noreturn __pkvm_init_finalise(void)
> >  	if (ret)
> >  		goto out;
> >  
> > +	ret = kvm_iommu_init();
> > +	if (ret)
> > +		goto out;
> > +
> >  	ret = hyp_ffa_init(ffa_proxy_pages);
> >  	if (ret)
> >  		goto out;
> > diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
> > new file mode 100644
> > index 000000000000..f247384fa193
> > --- /dev/null
> > +++ b/arch/arm64/kvm/iommu.c
> > @@ -0,0 +1,26 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2025 Google LLC
> > + * Author: Mostafa Saleh <smostafa@google.com>
> > + */
> > +
> > +#include <linux/kvm_host.h>
> > +
> > +extern struct kvm_iommu_ops *kvm_nvhe_sym(kvm_iommu_ops);
> > +
> > +static DEFINE_MUTEX(kvm_iommu_reg_lock);
> 
> could be moved directly into the only user: kvm_iommu_register_driver

No strong opinion, it seemed it can be easily re-used this way.

> 
> > +
> > +int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops)
> 
> __init ?

Will do.

> 
> > +{
> > +	guard(mutex)(&kvm_iommu_reg_lock);
> > +
> > +	/* Only protected KVM before de-privilege. */
> 
> Don't think that comment brings much information, looking at the line below.

I will remove it.

> 
> > +	if (!is_protected_kvm_enabled() || is_kvm_arm_initialised())
> > +		return -EINVAL;
> 
> -EPERM?

I can see it both ways, my thought that it is invalid to register a
driver after a certain point, but -EPERM makes sense also.

Thanks,
Mostafa


