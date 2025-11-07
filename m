Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DF2CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 13:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7JGfFT/Ae86QXeNX8btOgOnDy+eoBhlZoZaxojdT4U=; b=hWPqfz5SucPvsi6P0gX2ck1iud
	KJ+Lzx8bOaUx35VXE+50jdcvlJhpuaJSOVC8lVUCsF3+oNEyw/esCj1/0pQdarZhJeqPPIhYwQ7AO
	qTPC5OYvLeF5VzOW4X6x4pnNYqF28AmEE5ZidThQH4d+iT/XlbJkMMFj41dL9Tu0DLiiEqPX5gfYQ
	xD9G7BgL3omJmFv8t+YLEDJd0fo6byUoYwgDGV9AH3JU/DvlpVCPmw/LDcYd8ReJ1WC7mdrWWvcSm
	Z3fVVmcdT/CMZf8AohMTodxwLiseXWQcG4BFB7c/v9yvfIXVbXSts9LMdqX9PA2cETugXOQissfMo
	Cod0jh6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMF1-0000000HNYr-368g;
	Fri, 07 Nov 2025 13:10:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMEz-0000000HNYP-1SwQ;
	Fri, 07 Nov 2025 13:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60B0B43ACD;
	Fri,  7 Nov 2025 13:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84724C19421;
	Fri,  7 Nov 2025 13:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762521056;
	bh=9yNpA1SE+6LUazhxfaVM0P+KTY2xAhLSO9vXTnuC8wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1pL5YGYFuG6hxkKpIelSp4d5IkSoL6mbBtbq2kEckqm8NKtXk0sV5yE4uZEwNt1q
	 ethdg2+fJxg4IQ7wEAJCWBsr3M4QlRFC7sKNaUDJXDpXrb0nfCOAbjbv0gQI6Bru4h
	 fydJwyetpw3hex5Orwn9R0FuIcYMuiERvBPHxKwFDX6pnNRSlfwUb95i792MUyccOa
	 O9tAxtas6uw8A1dp02fOK28qXtF/zEGda7ciCQzGk07YYgKSw4/Oe51Xdq2hvdAj40
	 vHZ4hzLyNf5jfkxq0b0gGTPJw99/B9LhRb33I8h/Xl0Ebl2LMSB+9pgDUEbMvSEIE1
	 q358Q5AwLVEig==
Date: Fri, 7 Nov 2025 13:10:47 +0000
From: Will Deacon <will@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org,
	aou@eecs.berkeley.edu, atish.patra@linux.dev,
	catalin.marinas@arm.com, dianders@chromium.org,
	johannes@sipsolutions.net, lihuafei1@huawei.com,
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org,
	mingo@kernel.org, nicolas.schier@linux.dev, palmer@dabbelt.com,
	paul.walmsley@sifive.com, suzuki.poulose@arm.com,
	thorsten.blum@linux.dev, wangjinchao600@gmail.com,
	yangyicong@hisilicon.com, zhanjie9@hisilicon.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [External] Re: [PATCH v4 1/2] watchdog: move arm64 watchdog_hld
 into common code
Message-ID: <aQ3v15yrm9JaWgrm@willie-the-truck>
References: <20251014031425.93284-1-cuiyunhui@bytedance.com>
 <20251014031425.93284-2-cuiyunhui@bytedance.com>
 <aQixsIQXTjYyhRVj@willie-the-truck>
 <CAEEQ3wk5Ru4-=4Ecnc6kQAAbR57806xxYTz0o1z4KfgZE6Cg6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEEQ3wk5Ru4-=4Ecnc6kQAAbR57806xxYTz0o1z4KfgZE6Cg6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_051058_068713_949BD2CF 
X-CRM114-Status: GOOD (  18.69  )
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

On Fri, Nov 07, 2025 at 10:42:25AM +0800, yunhui cui wrote:
> On Mon, Nov 3, 2025 at 9:44 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Oct 14, 2025 at 11:14:24AM +0800, Yunhui Cui wrote:
> > > @@ -306,3 +307,85 @@ void __init hardlockup_config_perf_event(const char *str)
> > >       wd_hw_attr.type = PERF_TYPE_RAW;
> > >       wd_hw_attr.config = config;
> > >  }
> > > +
> > > +#ifdef CONFIG_WATCHDOG_PERF_ADJUST_PERIOD
> > > +/*
> > > + * Safe maximum CPU frequency in case a particular platform doesn't implement
> > > + * cpufreq driver. Although, architecture doesn't put any restrictions on
> > > + * maximum frequency but 5 GHz seems to be safe maximum given the available
> > > + * CPUs in the market which are clocked much less than 5 GHz. On the other
> > > + * hand, we can't make it much higher as it would lead to a large hard-lockup
> > > + * detection timeout on parts which are running slower (eg. 1GHz on
> > > + * Developerbox) and doesn't possess a cpufreq driver.
> > > + */
> > > +#define SAFE_MAX_CPU_FREQ    5000000000UL // 5 GHz
> > > +__weak u64 hw_nmi_get_sample_period(int watchdog_thresh)
> > > +{
> > > +     unsigned int cpu = smp_processor_id();
> > > +     unsigned long max_cpu_freq;
> > > +
> > > +     max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
> > > +     if (!max_cpu_freq)
> > > +             max_cpu_freq = SAFE_MAX_CPU_FREQ;
> > > +
> > > +     return (u64)max_cpu_freq * watchdog_thresh;
> > > +}
> >
> > Why does this function become __weak? Neither arm64 nor riscv override
> > it afaict.
> 
> Would you say there’s any particular issue here? If some architectures
> might need to override the hw_nmi_get_sample_period() function later
> on, wouldn’t __weak be a more reasonable choice?

__weak is pretty brittle (it can depend on link order if you have multiple
targets) and I suspect it prevents inlining when LTO isn't enabled. It's
cleaner and more robust for architectures to provide their hooks by
#defining the symbol, as is done commonly in other parts of the kernel.

But in this particular case, it's completely unnecessary because there
isn't an architectural override and so this function should simply be
static.

Will

