Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62287C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgbwbSIUrCAJoYAPbbnt1Im9GqwGuzBgACzlnjm4QXs=; b=mZ8NpuH2Wfxztsw9F4AnvZyje9
	4gzW/GIJJ8x9qh4f9bYPUVvjfW7iP7XUwH/E4xBRyX19SmOeb4DjtJQVC1s5/YfutVPo36L7dYG9A
	krO+TI8IDSA7/r3o0uQUBfPde27eAlyzgVDB2a+HXRKj6bra4+nR+zCpfpODMyYlPRhMEkgQxTmA4
	8X+YBrwTYM0bIsIuT4YpVV6sTr/ojncwaC8fpcPGUfuIpOtF7otJgpWY04URobXdaQlr0raYZOZC1
	CUdL+NCQG9Inw3ejb/hu7ygZd5XoTm3ZsYBgGePitLoknVpcVNG4y/WojNQ37DMAsbYvdaOFhORID
	gAFrxdHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0NC-0000000F56T-0Cfz;
	Wed, 15 Jul 2026 14:14:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0N9-0000000F55c-2BYr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:14:04 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so43975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 07:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784124841; x=1784729641; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KgbwbSIUrCAJoYAPbbnt1Im9GqwGuzBgACzlnjm4QXs=;
        b=gpD9VYnT5AAzPuqZhqleBmjtWMigyuTALCwdTZYDyh8cWmHpatWu61xgomrsOTLynb
         nd3YDkzqszPg8BhtiGquOoaC/P8Y96Wx70EJit8ghlwe8w4qcubi0U3UD+LPrbAQlVfX
         Y4YnnXBbRV3Pn0dUYn/pVZngAlonwPJ1IXYkkbETtNL0EyoioqWFXYHFbYu6idkYoKzH
         9ml0+N+OJXENZm/c3offIm/0rZUIfua4FQWt6hQ3o6nmns6b6rK7/cfEL1qAYrk31xCU
         bD9HbsUe7LDCAYNW8KOj5RmxqUQV2TUsoywRtw/gzKA4gDBJGxQT+EoY/yRY2hEreiWd
         rHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124841; x=1784729641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgbwbSIUrCAJoYAPbbnt1Im9GqwGuzBgACzlnjm4QXs=;
        b=VF8tHc8q6AnvvaRNEny/Qh5OBJqjNTIl8PWJ3jMn2pLUiqCrjtlqU3SxsZf1B3pDId
         3ewFaOnrnqc+qZPmbZ/eZf6E2SAh0+TwyKPm3ME/46bCUplJFYovNMmFJiEAMcxRRFQc
         L8j6EENfaGaDXIeDi1dTEZSeK9zsCgeTItrX/KV/LGW7zqn87DBM5ip3qq2jFBnDmPyR
         3nfIMkyrJMrLS7CO5g5HDJOVqmNLX5GegGcrL3j1IgMHtwtIDbjsw6vMUcvW4Beus0D5
         /Hk+OdXB52UU8CMc8X8ZJj7lmUgyjGDfpsuesjw//bWQL/Gu1Lsix2szjy84aGq8J3CD
         L5vw==
X-Gm-Message-State: AOJu0YwjX8o/MbVSNg73K9E4Zd2IrTOeEpkBHWX99HDWdi2pAoUDdE3n
	BOKedzJyTdqhwyJ0IVV33aEaEZnUGNG6Lq/nk6hpiGb75JhO1ezNVPvBVzNqFSWHjg==
X-Gm-Gg: AfdE7clqDws34KeB8pXYc2HmBQx48Aj8O1FlLano1et/6oEehnERfoXKksBWAOdAdX/
	2TeTw2pVVqUMnikwCjSkIQcO22F6JHo8naM3A9xya8Z14Vi18Mn/nv+5BNk0+jgtRFQNGQQGpdb
	hSSDk4nBnrEGa5JzgUSDavegIYPglLIRJdvvtyP3J+bEbqYjc7RP4wIc3YjUyCdGbObr6srYHIH
	THex4A3rdU2g51+5WnFBVe8h4sq8PhWOcMlEzrBoyFATbE0Jeq/zmrId8IkFgedrRELC5XrtpZi
	Yf/M5wCcp/KpwdnIwkBLoaSDDbNpZjQDaykRLIEbTn+nVqeY5N+RAaRO4Vq6J0vyXw85AkRFzSN
	HkhOR/1oAdzM7G0EeyhCufhKq2Jpg1TMfJe19XUaIO2FurBtAuDF7/ZG3bsuZBgIhbCzsUR6WxV
	m0fgLuVoJN2ck75aQKd31jcI5fiA3AtN9CT+aj6Ul8DMIGwRr2
X-Received: by 2002:a05:600c:14b:b0:48a:5618:b4d4 with SMTP id 5b1f17b1804b1-495156d9fddmr2601775e9.1.1784124839966;
        Wed, 15 Jul 2026 07:13:59 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm17605107f8f.22.2026.07.15.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:13:59 -0700 (PDT)
Date: Wed, 15 Jul 2026 14:13:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v7 01/24] KVM: arm64: Add a generic clock
Message-ID: <aleVozZEcxiGE4Y3@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-2-smostafa@google.com>
 <alePwq2eKV5g_7Gc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alePwq2eKV5g_7Gc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_071403_576946_E2CCA8CE 
X-CRM114-Status: GOOD (  25.82  )
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

On Wed, Jul 15, 2026 at 02:48:50PM +0100, Vincent Donnefort wrote:
> [...]
> 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
> > index f3e2619db4e4..43d2cba4f810 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/clock.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/clock.c
> > @@ -8,7 +8,12 @@
> >  
> >  #include <asm/arch_timer.h>
> >  #include <asm/div64.h>
> > +#include <linux/math64.h>
> > +#include <vdso/time64.h>
> >  
> > +static u32 timer_freq;
> > +
> > +#ifdef CONFIG_NVHE_EL2_TRACING
> >  static struct clock_data {
> >  	struct {
> >  		u32 mult;
> > @@ -66,3 +71,27 @@ u64 trace_hyp_clock(void)
> >  
> >  	return (u64)ns + clock->data[bank].epoch_ns;
> >  }
> > +#endif /* CONFIG_NVHE_EL2_TRACING */
> > +
> > +int hyp_clock_init(void)
> > +{
> > +	timer_freq = read_sysreg(cntfrq_el0);
> > +	/*
> > +	 * KVM will not initialize if FW didn't set cntfrq_el0, that is already
> > +	 * part of the boot protocol.
> > +	 */
> > +	if (!timer_freq)
> > +		return -ENODEV;
> > +
> > +	/* Timer freq can't be larger than 1Ghz by spec. */
> > +	if (timer_freq > NSEC_PER_SEC)
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> > +/* Return time in ns. */
> > +u64 hyp_clock_ns(void)
> > +{
> > +	return mul_u64_u32_div(__arch_counter_get_cntvct(), NSEC_PER_SEC, timer_freq);
> 
> IIUC, this will overflow the u64 mult very quickly (in few minutes) and also I
> see that we don't need such small nanoseconds accuracy.
> 
> So here we could always fallback to 128-bits mult... or update the epoch from
> time to time. But I have something completely different to propose:
> 

It should not overflow because mul_u64_u32_div() handles this.

> Instead of using a "clock" how about we just modify smmu_wait?
> 
> #define smmu_wait() {
>     static u32 window = arch_timer_get_cntfrq() / ARM_SMMU_EL2_POLL_TIMEOUT_US
>     u64 timeout = __arch_counter_get_cntvct() + window;
>     u64 cur;
> 
>     ...
> 
>     while (!(__cond)) {
>       ...
> 
>       cur = __arch_counter_get_cntvct();
>       if (cur >= timeout)
>           __ret = -ETIMEOUT;
> 
> 
> No risk of overflowing u64
> No init necessary

It believe init will be needed as caching arch_timer_get_cntfrq()
is much better that re-reading everytime. But I can make all of this
contained in the SMMUv3 driver and remove this patch.

Thanks,
Mostafa


