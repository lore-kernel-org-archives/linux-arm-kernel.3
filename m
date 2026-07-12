Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A57C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 13:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cB15QmrcA0tyUGkN33GVVZ7yR2pDZvCE9+bOTq+KGW8=; b=Vkq3aG+NxBtneqSusFSskQVbDg
	1nsPXN0ECag1ZuBqVy6F8mNWUM702Tn8ZobrAyeCcMmEoMaY1puy3pmWsZdQF4XWuYE7IMhJWsdCj
	bTa+50W0zwVxuB5MlMfqg1W4I9u4prQvfU6WLKVe8ordfKLZ089KjUqezsGEvK2UYmjx4MBSLiRQD
	pH2Lla4nRl2wKkEYbuI+ORGlVasnzPHiyltTDVKyT1mthbXfGQECC8CNRyJhfnS+k+Y66VHoZGkN5
	CjyW3oyxoQW6SN4Ha02XwGrYt2uhE4TFNRQPmxpDLBUO4zexdBJjP4vHu5S7unLZUQmmBIiQ7UA2c
	7+6zKS9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiuUW-00000007U0P-0C0w;
	Sun, 12 Jul 2026 13:45:08 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiuUT-00000007U00-0S1v
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 13:45:06 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493c556ada3so55995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 06:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783863902; x=1784468702; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cB15QmrcA0tyUGkN33GVVZ7yR2pDZvCE9+bOTq+KGW8=;
        b=opXsxCtikHix47GrCvwmbfeB+iV/HkcfBue5FplArsdRwY7AaOUWE/qi10Wi6ylLWv
         OXzSEjjO/mdUvv1nJbxjIyUy/yHLU+jVJTPaGZe21X73ez8HVpxGXvWd3pidV4wCsH6Z
         lQ2AgdIWWRPqqmPW8KkdLolDPscLViio4dwIZvtJZ8jUO/zW6ugtXfPjQOu5yZmTwXTx
         ZtEH8YmJQiRyLc8/kaz04DnisoJ7N+n6wDh/XhTgQvUAWQWnRwseykiUo87BAlrxq5oP
         rMqXsSSMTRaRgooeWbMJUU6CMaNHwcyRPz6t1Lw8xFKs4DHBn5IUDYJRgR3YIyLZruwm
         hzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783863902; x=1784468702;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cB15QmrcA0tyUGkN33GVVZ7yR2pDZvCE9+bOTq+KGW8=;
        b=snmTTEKWZWp8prEtY4mMqG9kWMQ+xtriRCXlCXEEeMjtBtttZOgGyQu1sVEsKUTE5s
         M/ds2how0s8MwjTMNEwVoclpdOHJc1P4dBQdXhHUykipVnwJHoed4KmRfOneCh5lzYmS
         yYXMDI0EIxz8W7aqPb6l2Cwgt6AwsonAqEFVbTW42AymZob7cP+a8YSGdZ3nuS5jlq6n
         JlINQcnN+LhJNBzia5YZ5X6/aNowr1HUYdM31aoqYl6FphBpc+iCxzn6APbI0mGPd1Az
         VEzq/QUiaHREqRgwAY+fz/iSnlu//fdIXRMOpbO5+pXwru8AGFCN6r+2nIHssA1Buejg
         kQjw==
X-Gm-Message-State: AOJu0Yy8DFKUNbJ3xtvaKQrv+rdbYBIX4F7wzKNigigBlktdmppVThqS
	fEs42/esLU9U4Qd01/KQspopVpP3ostAzYTvpdsRm4dA+4qPS+uTx11uBnvevrfpIcGaCwo8QPk
	AS7JgUw==
X-Gm-Gg: AfdE7cnsx2J54SLB6thHcHAdlv0bk63wstTWBrEEsciFaPi2qth9NYRgHmQd25ZAZZ4
	JyS1NldIbW6Ue4anMPQjnVz3WZZwETxGxXdoUaYzJD2YGWCY2P+6PJ9e3P4PZo2KDNbeK5gTvJF
	cOkZHQVM8trDoTi63Xm1NdZqS1+cqSRRu+qpaNjZRVRuvRmcWUGN6d+3n2IPfyNWkBLou5wqhUR
	THztZksoOXGULZtj3CocXPcTm0Kw/91fEZpz3N0hbLUrxwJXkbtUi2imre8wOwTbfQhn69mRbxP
	zP60+YnrGKTCxYCAz8Ri/lpT8agutpTPHwWQH1xi3i2oehioc5vB0ycDHLKLt5FqEIyBiBMQMwN
	FOYeJKM2X7mEcMd7ndJFTKgdq5TeQ835xFXiu3s1e0Pvp4thzmmRBRtUn9lMGLEFO3K0Tqsd7UJ
	l1e5KEO0erDbRHCGBQkGxRLYiXIXG3DwU5BFe9WZV4g5MrLuUwCFizSGFZkNI=
X-Received: by 2002:a05:600c:17c5:b0:493:b47f:a24 with SMTP id 5b1f17b1804b1-493f85a0c29mr1695425e9.6.1783863901494;
        Sun, 12 Jul 2026 06:45:01 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e785sm76064126f8f.8.2026.07.12.06.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 06:44:59 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:44:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 01/25] KVM: arm64: Generalize trace clock
Message-ID: <alOaV1q7t2mn_jOn@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-2-smostafa@google.com>
 <alD_hwRhUZ0IPTte@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alD_hwRhUZ0IPTte@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_064505_239172_00647D94 
X-CRM114-Status: GOOD (  50.83  )
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

Hi Vincent,

On Fri, Jul 10, 2026 at 03:19:51PM +0100, Vincent Donnefort wrote:
> Hi Mostafa,
> 
> Sorry I should have looked at this a while ago!
> 
> On Fri, May 01, 2026 at 11:19:03AM +0000, Mostafa Saleh wrote:
> > IOMMU drivers need to track time, mainly for timeouts.
> > Generalize the tracing clock functions in the hypervsior, so they can
> > be used from IOMMU drivers.
> > 
> > 1) Make the compilation independent from tracing.
> > 
> > 2) As drivers might need to use that quite early, provide default
> >    values for the clock data based on cntfrq_el0, the driver can
> >    keep using these values without calling hyp_clock_update() as
> >    they don't need to sync with the host timers.
> > 
> > This is mainly used for timeouts, so a malicious host can DoS the
> > system or cause premature timeouts which likely end up in hyp panic,
> > that should be acceptable as neither of those would undermine the
> > security guarantees.
> 
> This still sounds very risky if the usage shift, and as I explain later I don't
> believe this is completely OK as regard to mult/shift updates.

I see, I still think it is not a security risk though.
My main concern is switching banks between polling might cause
problems.

> 
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/clock.h | 11 ++-----
> >  arch/arm64/kvm/hyp/nvhe/Makefile        |  4 +--
> >  arch/arm64/kvm/hyp/nvhe/clock.c         | 44 ++++++++++++++++++++++---
> >  arch/arm64/kvm/hyp/nvhe/setup.c         |  5 +++
> >  arch/arm64/kvm/hyp/nvhe/trace.c         |  4 +--
> >  5 files changed, 51 insertions(+), 17 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > index 9f429f5c0664..e6a0e43af88d 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> > @@ -5,12 +5,7 @@
> >  
> >  #include <asm/kvm_hyp.h>
> >  
> > -#ifdef CONFIG_NVHE_EL2_TRACING
> > -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> > -u64 trace_clock(void);
> > -#else
> > -static inline void
> > -trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
> > -static inline u64 trace_clock(void) { return 0; }
> > -#endif
> > +void hyp_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> > +u64 hyp_clock_ns(void);
> > +int hyp_clock_init(void);
> >  #endif
> > diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> > index 62cdfbff7562..89d0533921f9 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> > +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> > @@ -26,10 +26,10 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o
> >  	 hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
> >  	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
> >  hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
> > -	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o
> > +	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o clock.o
> >  hyp-obj-y += ../../../kernel/smccc-call.o
> >  hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
> > -hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += clock.o trace.o events.o
> > +hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += trace.o events.o
> >  hyp-obj-y += $(lib-objs)
> >  
> >  # Path to simple_ring_buffer.c
> > diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
> > index 32fc4313fe43..53d0bd55e866 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/clock.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/clock.c
> > @@ -18,7 +18,41 @@ static struct clock_data {
> >  		u64 cyc_overflow64;
> >  	} data[2];
> >  	u64 cur;
> > -} trace_clock_data;
> > +} clock_data;
> 
> I believe this should be separated. the trace_clock is "unsafe" but synchronised
> with the host. the clock you need must be "safe" but we don't really need to be
> synchronised. 
> 
> So overall, I would keep all the trace_clock_* interface unchanged and introduce
> in the same file a hyp_clock, with its own hyp_clock_data.

Makes sense, I will do that, I will make the file compile outside of
tracing but I will keep the tracing code as is. I will introduce 2
functions to read the system timer and to init the hypervisor which
was similar to the earlier versions.

> 
> > +
> > +#define HYP_CLK_SEC_TO_NS 1000000000UL
> 
> Not possible to use NSEC_PER_SEC?
>

It should, we have to include include/vdso/time64.h for that.

> > +
> > +int hyp_clock_init(void)
> > +{
> > +	u32 timer_freq = read_sysreg(cntfrq_el0);
> > +	u32 shift = 32;
> > +	u64 mult;
> > +
> > +	/*
> > +	 * KVM will not initialize if FW didn't set cntfrq_el0, that is already
> > +	 * part of the boot protocol.
> > +	 */
> > +	if (!timer_freq)
> > +		return -ENODEV;
> > +
> > +	/* Timer freq can't be larger than 1Ghz by spec. */
> > +	if (timer_freq > HYP_CLK_SEC_TO_NS)
> > +		return -EINVAL;
> > +
> > +	/* Simplified logic from clocks_calc_mult_shift() */
> > +	do {
> > +		mult = (HYP_CLK_SEC_TO_NS << shift);
> > +		mult = div_u64(mult, timer_freq);
> > +		if (mult <= (~0U))
> > +			break;
> > +		shift--;
> > +	} while (shift > 0);
> > +
> > +	clock_data.data[0].shift = shift;
> > +	clock_data.data[0].mult = mult;
> > +	clock_data.data[0].cyc_overflow64 = ULONG_MAX / mult;
> 
> I don't know if we want to update this from time to time, but we can't rely on
> host provided data. Perhaps the call to that clock could self-update?
> 
> Worst case we fallback on 128-bits mult. but perhaps this isn't a problem for a
> wait loop()?
> 
> And as this is wait loop, perhaps we could reduce the resolution quite heavily,
> so we reduce the risk of overflow?

As mentioned, I will drop this and rely on a wrapper for the system
counter instead, and the caller can handle the overflow as in
__delay()

> 
> > +	return 0;
> > +}
> >  
> >  static u64 __clock_mult_uint128(u64 cyc, u32 mult, u32 shift)
> >  {
> > @@ -30,9 +64,9 @@ static u64 __clock_mult_uint128(u64 cyc, u32 mult, u32 shift)
> >  }
> >  
> >  /* Does not guarantee no reader on the modified bank. */
> 
>  ^
> And here's another reason why you should have another clock. It works because of
> tricks in the tracing interface.

Agreed, this was my concern too.

> 
> > -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
> > +void hyp_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
> >  {
> > -	struct clock_data *clock = &trace_clock_data;
> > +	struct clock_data *clock = &clock_data;
> >  	u64 bank = clock->cur ^ 1;
> >  
> >  	clock->data[bank].mult			= mult;
> > @@ -45,9 +79,9 @@ void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
> >  }
> >  
> >  /* Use untrusted host data */
> > -u64 trace_clock(void)
> > +u64 hyp_clock_ns(void)
> >  {
> > -	struct clock_data *clock = &trace_clock_data;
> > +	struct clock_data *clock = &clock_data;
> >  	u64 bank = smp_load_acquire(&clock->cur);
> 
> The whole bank system is not necessary if not updated by the host.

But tracing can be enabled along side the SMMUv3.

Thanks,
Mostafa


