Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD919CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 13:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xOnaJT+qlmbXSk4aJvGSyTkESDT5w4EYTzVPV3hV18=; b=z3g53SRbJNEBNcOtIOUSauIH39
	fLU8srRQZE5T7yDY7N2StfkQFI24HO8TGn2hqQnKbNkvc/DByf1URa73L5yKC+yGjQ1IFlDyLS7wp
	oHrPsDOTU/HMph4lYyW88k4pHcJw/yfkwZy51dRwHEOUA/91BPmuEuTbmI9rcc8V74Yxv3K67vYhv
	fpnpKUXWQPSU2SCmGmyrz17bEDRI/2d5AuNfXTlg0eCIBVcFEsu5aqWpRrVGwN8ZSBTdiviWWv3l5
	Tqig6JqoNrrBBbIUAtt/FEw/GixeYzToAxjkO2jEmVALgXAJu3btDwQlPKCmHOd8E9/KGABj+CIwd
	rxeTff0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFurE-00000009wQZ-1Qde;
	Mon, 03 Nov 2025 13:44:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFurB-00000009wQ1-3cOE;
	Mon, 03 Nov 2025 13:44:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 673EF438EC;
	Mon,  3 Nov 2025 13:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8F1C4CEE7;
	Mon,  3 Nov 2025 13:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762177464;
	bh=0MbAV9bNWbSdrKxjEc6SEhW2otB9NDHuKXLNye47LYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQw4MTmkeuu7tJsm35ZTr+SPFj62DZG75dkVxgZ7qMlIoDYfG55sxMZzcOuBLZAqE
	 WCbtKleagoN5AxpZWR519RitBnVTxNUjYMRkoo7H9n0l7SVHDaZlGeK+h/FaHVlF0O
	 iUWl6eqUOPjvfw9MxqAi0KmTktxc7kKUlmOl+WtMQkejRumLVNkKAdyMlPk2XaWKvg
	 WAt5CLxLnj7vwOA0XVyipOQiaarEpW2K3BfkXiUvZms3LuR5XyC3qk+a2qyPBiGPf/
	 /9AnaWLcOX3bjlxjrwvY1unWAAcNTjLqaOtDbSGOMM17hsBgv+uiScOcEYnZ33uKIE
	 HfHs2TLsiepGw==
Date: Mon, 3 Nov 2025 13:44:16 +0000
From: Will Deacon <will@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
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
Subject: Re: [PATCH v4 1/2] watchdog: move arm64 watchdog_hld into common code
Message-ID: <aQixsIQXTjYyhRVj@willie-the-truck>
References: <20251014031425.93284-1-cuiyunhui@bytedance.com>
 <20251014031425.93284-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014031425.93284-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_054425_920026_15F283DE 
X-CRM114-Status: GOOD (  12.45  )
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

On Tue, Oct 14, 2025 at 11:14:24AM +0800, Yunhui Cui wrote:
> @@ -306,3 +307,85 @@ void __init hardlockup_config_perf_event(const char *str)
>  	wd_hw_attr.type = PERF_TYPE_RAW;
>  	wd_hw_attr.config = config;
>  }
> +
> +#ifdef CONFIG_WATCHDOG_PERF_ADJUST_PERIOD
> +/*
> + * Safe maximum CPU frequency in case a particular platform doesn't implement
> + * cpufreq driver. Although, architecture doesn't put any restrictions on
> + * maximum frequency but 5 GHz seems to be safe maximum given the available
> + * CPUs in the market which are clocked much less than 5 GHz. On the other
> + * hand, we can't make it much higher as it would lead to a large hard-lockup
> + * detection timeout on parts which are running slower (eg. 1GHz on
> + * Developerbox) and doesn't possess a cpufreq driver.
> + */
> +#define SAFE_MAX_CPU_FREQ	5000000000UL // 5 GHz
> +__weak u64 hw_nmi_get_sample_period(int watchdog_thresh)
> +{
> +	unsigned int cpu = smp_processor_id();
> +	unsigned long max_cpu_freq;
> +
> +	max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
> +	if (!max_cpu_freq)
> +		max_cpu_freq = SAFE_MAX_CPU_FREQ;
> +
> +	return (u64)max_cpu_freq * watchdog_thresh;
> +}

Why does this function become __weak? Neither arm64 nor riscv override
it afaict.

Will

