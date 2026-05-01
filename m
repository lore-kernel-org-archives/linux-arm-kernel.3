Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3068CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 17:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/0fbdySIsngOpA7Pe2uAdj3McNd9XNZZ99Ou0Rs99w=; b=WRiZS/2IQ7tTXamYT6lNGd1Xbk
	+CuswjglQubBUM03tDFGXL1jORmgza3oeDplFBSf4egPMTJ/QHXnVYZaAYgJBu+K6/KdxlpM6TTtO
	hKsToUHlG0IT2CFoPC7rjiQGX8i8LMt3lwxdYa1vP4Bs+HQbAfyJHB0MFE7kntXAG/3kKAZB6XHGf
	POptvNoUvsAjefZxT7dG9ENUfDk5eyoYml/GceuQf5zh1d6UX6VhLgpuFojmUWoDeI/seqLXUcoSi
	037+X15q6G9lbr+bsvbu+3em9Y0hF4Nr1RE/ADkxOxDRqf1eLiHcf+HhKrqSkCFn8w6BtF+uH7xyB
	5cZaADIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIrsJ-00000007WTy-1xiX;
	Fri, 01 May 2026 17:42:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIrsG-00000007WTT-0kMa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 17:42:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A72B71713;
	Fri,  1 May 2026 10:41:51 -0700 (PDT)
Received: from [192.168.20.93] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E4A73F62B;
	Fri,  1 May 2026 10:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777657317; bh=sFBYGono8pM+MS81Kfe9+/F0mfpEy/2ed8CZ6w24VJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XwrgFjNjXSwioSmxjMAU4Rt5IkPMzimHiDRYGUa8TvAXJThKlU6XopLSF94Y0Hzec
	 6I8xmkLcb4Z+ElUTrh5XXo93BnH27uDKp+y1q4LQc+Xno1lNbwNPo9zo4QKxXa4b9I
	 vGVdg13r7S6mXbkGq1453ptoE5oY13WMPyPvTGtE=
Message-ID: <7e55dd1e-2841-4918-8e3d-82203a70451a@arm.com>
Date: Fri, 1 May 2026 12:41:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: cppc: discard out-of-range delivered_perf
 samples
To: Breno Leitao <leitao@debian.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Jie Zhan <zhanjie9@hisilicon.com>, Lifeng Zheng <zhenglifeng1@huawei.com>,
 Pierre Gondois <pierre.gondois@arm.com>, Sumit Gupta <sumitg@nvidia.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dcostantino@meta.com, pjaroszynski@nvidia.com, Al.Grant@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
References: <20260501-cur_freq-fix-v1-1-f84c9a423366@debian.org>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20260501-cur_freq-fix-v1-1-f84c9a423366@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_104200_429718_A5919D54 
X-CRM114-Status: GOOD (  19.06  )
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

Hi,

On 5/1/26 11:32 AM, Breno Leitao wrote:
> cppc_cpufreq_get_rate() derives delivered_perf as:
> 
>      delivered_perf = reference_perf * delta_delivered / delta_reference
> 
> over a short udelay()-bounded window between two cppc_get_perf_ctrs()
> calls. Per-read latency jitter on the underlying CPC register access
> can skew the ratio, occasionally producing delivered_perf >
> highest_perf. cppc_perf_to_khz() then linearly extrapolates above
> (nominal_perf, nominal_freq), so the value reported via
> /sys/.../cpufreq/cpuinfo_cur_freq exceeds cpuinfo_max_freq.
> 
> Observed on an arm64 host (governor=performance,
> cpuinfo_max_freq=3339 MHz): 15 back-to-back reads returned values
> between 2997 and 4230 MHz.
> 
> Treat an out-of-range sample as invalid and reuse the existing
> out_invalid_counters fallback, which returns the platform's
> desired_perf. This keeps cpuinfo_cur_freq within
> [0, cpuinfo_max_freq] without reporting a value the hardware did
> not deliver.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>   drivers/cpufreq/cppc_cpufreq.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> index 7e7f9dfb7a24c..dd92aa2bca464 100644
> --- a/drivers/cpufreq/cppc_cpufreq.c
> +++ b/drivers/cpufreq/cppc_cpufreq.c
> @@ -814,6 +814,14 @@ static unsigned int cppc_cpufreq_get_rate(unsigned int cpu)
>   	if (!delivered_perf)
>   		goto out_invalid_counters;
>   
> +	/*
> +	 * Sampling jitter on the CPC counter pair can produce
> +	 * delivered_perf > highest_perf, which cppc_perf_to_khz() would
> +	 * extrapolate to a frequency above cpuinfo_max_freq. Discard.
> +	 */
> +	if (delivered_perf > cpu_data->perf_caps.highest_perf)
> +		goto out_invalid_counters;
> +

A little jitter over, is probably expected. If that is what is happening 
then clamping to highest_perf makes sense instead. But then, this is 
really a sampling problem so does it go away if you double the udelay 
slightly. Maybe the udelay value should be proportional to the 
reference_perf value?

>   	return cppc_perf_to_khz(&cpu_data->perf_caps, delivered_perf);
>   
>   out_invalid_counters:
> 
> ---
> base-commit: 26fd6bff2c050196005312d1d306889220952a99
> change-id: 20260501-cur_freq-fix-d569cf1d1052
> 
> Best regards,
> --
> Breno Leitao <leitao@debian.org>
> 
> 


