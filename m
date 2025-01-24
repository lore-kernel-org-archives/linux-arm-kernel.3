Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89862C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 04:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+20Fk7zyp2RtNpIMRSC1POlfQ3etXop9xutsBlpZu2o=; b=byyG63+SSjFB8ThVW0H4B494my
	WyLJbcPbDA7FEWD5+iI8hMLJZkz+2qITt75ibIzsfUEl8OJCWu6SBEACQQAyh545Q4Sww5sRXujOK
	xKlxUQZzsakELmFyhoezWnHW9CIOXjvWuEU8BAAQ5H3BTJHmEyz1gH4BSGnDYtI22fJJJU8NcVKDV
	fMAinVVN630gvXAPnI6ewFK0kXXN0bFIxXfVJsP8p/3R0UhSKHdIxmjAsk2+jj/gv4ujDIXKLlfHD
	SO3n8iSszw9bDJGAOeVknfXRnstFr/jq3bEA4gIhRQSCLcRidI+g4XM6YFeYx2lgUoepEE6puW2DA
	vukiEv9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBaa-0000000Duek-0PiS;
	Fri, 24 Jan 2025 04:46:40 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBZG-0000000DuYP-0lF8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 04:45:19 +0000
Received: from [100.79.193.133] (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id CC5132109A4E;
	Thu, 23 Jan 2025 20:45:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CC5132109A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1737693917;
	bh=+20Fk7zyp2RtNpIMRSC1POlfQ3etXop9xutsBlpZu2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GylOoa/b7uIZmPHUubKyuKJiom+DF/cIZ08dUsmrxl6niNCvsENNXYCX464tVNTTy
	 OqvzbUfaYlgiLai86dE6KzPiS3Cj3SwfqGQxrTyfrpAApL0ZZJf9w+bIvRQqT3T1o9
	 t7l3RtYeDKOxfPlkl+WQ2xiRfF7bp6tdWyt3UZCo=
Message-ID: <fe4c48e0-5bc5-4a16-8df2-e848b55c1015@linux.microsoft.com>
Date: Fri, 24 Jan 2025 10:15:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/5] arm64: Update AMU-based freq scale factor on
 entering idle
To: Beata Michalska <beata.michalska@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 ionela.voinescu@arm.com, sudeep.holla@arm.com, will@kernel.org,
 catalin.marinas@arm.com, rafael@kernel.org, viresh.kumar@linaro.org
Cc: sumitg@nvidia.com, yang@os.amperecomputing.com,
 vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
 zhanjie9@hisilicon.com
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-6-beata.michalska@arm.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20250121084435.2839280-6-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_204518_252374_B6C71E28 
X-CRM114-Status: GOOD (  16.16  )
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


On 21-01-2025 14:14, Beata Michalska wrote:
> Now that the frequency scale factor has been activated for retrieving
> current frequency on a given CPU, trigger its update upon entering
> idle. This will, to an extent, allow querying last known frequency
> in a non-invasive way. It will also improve the frequency scale factor
> accuracy when a CPU entering idle did not receive a tick for a while.
> As a consequence, for idle cores, the reported frequency will be the
> last one observed before entering the idle state.
>
> Suggested-by: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>   arch/arm64/kernel/topology.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 5f5738b174c7..6c43aafac77c 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -213,6 +213,19 @@ static __always_inline bool amu_fie_cpu_supported(unsigned int cpu)
>   		cpumask_test_cpu(cpu, amu_fie_cpus);
>   }
>   
> +void arch_cpu_idle_enter(void)
> +{
> +	unsigned int cpu = smp_processor_id();
> +
> +	if (!amu_fie_cpu_supported(cpu))
> +		return;
> +
> +	/* Kick in AMU update but only if one has not happened already */
> +	if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
> +	    time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)))
> +		amu_scale_freq_tick();
> +}
> +
>   #define AMU_SAMPLE_EXP_MS	20
>   
>   int arch_freq_get_on_cpu(int cpu)

Looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>


