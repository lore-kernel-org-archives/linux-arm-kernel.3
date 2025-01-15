Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75520C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0R6rCNecZsxYuG3mKwLdbaB7qjo1ppTRtlAgGE34AeQ=; b=B0oPcbvKTTU2bUc+krdUj0RIQW
	VL5zEaPCfrhFnRc9bWgFL32WnwWaYjXGE4EfX0Pw0w35SaYC7MpytXfNQo8/1HvaKf2HB4dcJ19r1
	c2/PF9Zzov9TIW1jGXTlvgGHV0A850tzef2meyFTuvQmnkHEm7pLX7wEbW84vqXGQ56G7KsCntIqb
	BbU96ObpF6YkgeHYAYhhC0g/aTjkgHHN1PD6vjMGu5EkA/SBuJvujPrrLTL2klFMyRWb7n/9KipDF
	HLcx1KGmJ3rvyaJCnxPUakIcv4+0I8tG15TK1eZE075AFs/Uayx4JtCbGGAZFflw1A8mkU9M9xsWt
	zZ4TMBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Kv-0000000Bclh-3jbZ;
	Wed, 15 Jan 2025 11:13:25 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1JS-0000000BcQE-40h3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:11:56 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso710008e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 03:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736939513; x=1737544313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0R6rCNecZsxYuG3mKwLdbaB7qjo1ppTRtlAgGE34AeQ=;
        b=w2luuml215sLFVK2Cdu2dWDILNAt4nlk/Pdk4I5qTAEWSFrqk5r5xU4rIHeVXaBErj
         yjftPh/9vg9YS7OQv+miSBWmUnR7ScolVK7v+ObJAIN7u9zeCOAARtEOLl6JP7tlcuY0
         oeBKUYOxGvjrFhpFh2RcUG5O56yt3oovCeGSWNehbj+EQaFJrUATMxmLa5xUke0/9wcy
         +YZYmRRw2zBT0Q/zk8tSUefaqLLSc7mKMq/WBxrXnOm2BJjOCG2M5MwP0NSzaMwVoNs+
         Gu+z4NVEoNukCRw2AgC+iGaUcs29HqF6SXR3gVwQVr/lrjLK29ntasEMdLJzQWlgRcRB
         eRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939513; x=1737544313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0R6rCNecZsxYuG3mKwLdbaB7qjo1ppTRtlAgGE34AeQ=;
        b=FwFwpOaWtUVBTcrQ+tObYGHIRXjNOpqdqNinjvJqF1DwZdtKRBUI+H4sKJl1QNNh0w
         YiZnC7I6NTfxK2XA+VQ8WIMNSDmlSKmDAuJSbfTvxSewO8AuB9M7PtHASJ9wr7/uHuKW
         fNnrDWQC+4RMm+L4Gt88KLbYwTJnpmLPtNiaoW0U8hkOkv6QSkQF4hsOC5GC05b65wNm
         VQCJsACLKSY3RS+ggqj1dyQyUzl/Dnw0QUG7+kMy5whinGHr+18eMVUn0eBkTBWWAehp
         giK3nRbhf1hkyv3jbhjvF491ZzY6WfoFfAkcwuompL8waRT0aW/zolphSlA23WuQ7hyc
         kn6g==
X-Forwarded-Encrypted: i=1; AJvYcCXDCQtK3+vnJqg+1rUM2uPHY+uKtWEdnY/sMoLtP6A/Plvgo8EdgBJDCy5oBHnc5pyt6qALTDkGkiD2NdomKptZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxZqNSyhzjn+hklh9lbc6OcIWvTnSSiEWRKdnLLUyCtEf3eWyT3
	cKC9B1u78KFDcnN1LmkNLywqFvhrV4/L2D/a6pMGMUS4Ng5soqurCS8/3lWLplY=
X-Gm-Gg: ASbGnctLTJrqnQ+4xC2lmCOd86bSXwfHrHSkLofKWFKXJ6O9Yr6+At5alDspQBCYc4Z
	Uwcl5KeQzDkFgKi5liFIBhBQuVI32o1RkulAERh1aV4RsEhDDRyFD4BwZ6raFe+EIzIUjJDl4r6
	K3HNguszFxsxi05ZALRcn1QOwUC1ZZ8wzMjaFPqRdleG+iLQgJn0cXGMVbhNZVmC+Q5QFD8DXa/
	FzXb4W43q9Tx2/7ED5uglql8QQmLWMOKq8dPmel0YD8Jj8+igsOfLkg65iMs7SIq4DamPz1IhJj
	s1QRqKh7v90Oh0dM44+yFS1yCx08f2p4E4G0
X-Google-Smtp-Source: AGHT+IH2Z4JqRWKHahQJaGyVVjrUTIt7sz2P35oxqJH02yE5Kej3wh7zM7Y48DAO/YneqXvtV3OHWg==
X-Received: by 2002:a05:6512:3192:b0:542:2e05:313b with SMTP id 2adb3069b0e04-542abfd1f73mr734423e87.21.1736939513323;
        Wed, 15 Jan 2025 03:11:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec073esm1996352e87.194.2025.01.15.03.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:11:52 -0800 (PST)
Date: Wed, 15 Jan 2025 13:11:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: implement cacheinfo support
Message-ID: <ojog62udu3nx6s2557m56ykp7d4drxud7j6f6wivysfyalx6lj@7lbkx7jtsubd>
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
 <20241014-armv7-cacheinfo-v2-2-38ab76d2b7fa@linaro.org>
 <CGME20250115101159eucas1p1261a8b3e78b83c4fec63e3ac00e4d59a@eucas1p1.samsung.com>
 <01515ea0-c6f0-479f-9da5-764d9ee79ed6@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01515ea0-c6f0-479f-9da5-764d9ee79ed6@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_031155_039866_C43F2CE1 
X-CRM114-Status: GOOD (  31.77  )
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

On Wed, Jan 15, 2025 at 11:11:57AM +0100, Marek Szyprowski wrote:
> On 14.10.2024 15:55, Dmitry Baryshkov wrote:
> > On ARMv7 / v7m machines read CTR and CLIDR registers to provide
> > information regarding the cache topology. Earlier machines should
> > describe full cache topology in the device tree.
> >
> > Note, this follows the ARM64 cacheinfo support and provides only minimal
> > support required to bootstrap cache info. All useful properties should
> > be decribed in Device Tree.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   arch/arm/Kconfig             |   1 +
> >   arch/arm/include/asm/cache.h |   6 ++
> >   arch/arm/kernel/Makefile     |   1 +
> >   arch/arm/kernel/cacheinfo.c  | 173 +++++++++++++++++++++++++++++++++++++++++++
> >   include/linux/cacheinfo.h    |   2 +-
> >   5 files changed, 182 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index 749179a1d162..e790543c3eaf 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -5,6 +5,7 @@ config ARM
> >   	select ARCH_32BIT_OFF_T
> >   	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE if HAVE_KRETPROBES && FRAME_POINTER && !ARM_UNWIND
> >   	select ARCH_HAS_BINFMT_FLAT
> > +	select ARCH_HAS_CACHE_LINE_SIZE if OF
> >   	select ARCH_HAS_CPU_CACHE_ALIASING
> >   	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
> >   	select ARCH_HAS_CURRENT_STACK_POINTER
> > diff --git a/arch/arm/include/asm/cache.h b/arch/arm/include/asm/cache.h
> > index e3ea34558ada..ecbc100d22a5 100644
> > --- a/arch/arm/include/asm/cache.h
> > +++ b/arch/arm/include/asm/cache.h
> > @@ -26,4 +26,10 @@
> >   
> >   #define __read_mostly __section(".data..read_mostly")
> >   
> > +#ifndef __ASSEMBLY__
> > +#ifdef CONFIG_ARCH_HAS_CACHE_LINE_SIZE
> > +int cache_line_size(void);
> > +#endif
> > +#endif
> > +
> >   #endif
> > diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
> > index aaae31b8c4a5..b3333d070390 100644
> > --- a/arch/arm/kernel/Makefile
> > +++ b/arch/arm/kernel/Makefile
> > @@ -40,6 +40,7 @@ obj-y		+= entry-armv.o
> >   endif
> >   
> >   obj-$(CONFIG_MMU)		+= bugs.o
> > +obj-$(CONFIG_OF)		+= cacheinfo.o
> >   obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
> >   obj-$(CONFIG_ISA_DMA_API)	+= dma.o
> >   obj-$(CONFIG_FIQ)		+= fiq.o fiqasm.o
> > diff --git a/arch/arm/kernel/cacheinfo.c b/arch/arm/kernel/cacheinfo.c
> > new file mode 100644
> > index 000000000000..a8eabcaa18d8
> > --- /dev/null
> > +++ b/arch/arm/kernel/cacheinfo.c
> > @@ -0,0 +1,173 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + *  ARM cacheinfo support
> > + *
> > + *  Copyright (C) 2023 Linaro Ltd.
> > + *  Copyright (C) 2015 ARM Ltd.
> > + *  All Rights Reserved
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cacheinfo.h>
> > +#include <linux/of.h>
> > +
> > +#include <asm/cachetype.h>
> > +#include <asm/cputype.h>
> > +#include <asm/system_info.h>
> > +
> > +/* Ctypen, bits[3(n - 1) + 2 : 3(n - 1)], for n = 1 to 7 */
> > +#define CLIDR_CTYPE_SHIFT(level)	(3 * (level - 1))
> > +#define CLIDR_CTYPE_MASK(level)		(7 << CLIDR_CTYPE_SHIFT(level))
> > +#define CLIDR_CTYPE(clidr, level)	\
> > +	(((clidr) & CLIDR_CTYPE_MASK(level)) >> CLIDR_CTYPE_SHIFT(level))
> > +
> > +#define MAX_CACHE_LEVEL			7	/* Max 7 level supported */
> > +
> > +#define CTR_FORMAT_MASK	GENMASK(27, 24)
> > +#define CTR_FORMAT_ARMV6 0
> > +#define CTR_FORMAT_ARMV7 4
> > +#define CTR_CWG_MASK	GENMASK(27, 24)
> > +#define CTR_DSIZE_LEN_MASK GENMASK(13, 12)
> > +#define CTR_ISIZE_LEN_MASK GENMASK(1, 0)
> > +
> > +/* Also valid for v7m */
> > +static inline int cache_line_size_cp15(void)
> > +{
> > +	u32 ctr = read_cpuid_cachetype();
> > +	u32 format = FIELD_GET(CTR_FORMAT_MASK, ctr);
> > +
> 
> On Samsung Exynos421x (CortexA9 based) format is read as 0x3, which 
> causes a warning later in the code. How such value should be handled to 
> avoid warning?

I should be more carefull when doing c&p. I've posted the fix at
https://lore.kernel.org/r/20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org

> 
> > +	if (format == CTR_FORMAT_ARMV7) {
> > +		u32 cwg = FIELD_GET(CTR_CWG_MASK, ctr);
> > +
> > +		return cwg ? 4 << cwg : ARCH_DMA_MINALIGN;
> > +	} else if (WARN_ON_ONCE(format != CTR_FORMAT_ARMV6)) {
> > +		return ARCH_DMA_MINALIGN;
> > +	}
> > +
> > +	return 8 << max(FIELD_GET(CTR_ISIZE_LEN_MASK, ctr),
> > +			FIELD_GET(CTR_DSIZE_LEN_MASK, ctr));
> > +}
> > +
> 
> > >...
> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

-- 
With best wishes
Dmitry

