Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB711CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 04:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iwbbb29wVewcrUtqmSsxEVWBRgR+SWD7H3XDAsjIyY=; b=K+GnIs2ybETatFKtErtMe+ZoEu
	fnYuPqSMfeEJs2KG4CHF55i2Vs7wam1VVrM3oXrKDV3TOYKACDdS6VLn24/+1a3/8KS+PoaHvCmFg
	ZAxvvRlXxgCvwAoKcmtAstWxUI3mTMJGZxYV7eNYePL8OGK4mr87y3d2hkPNths5RQFt3g4F3RgWL
	KLi7g9qVt0G0B0haLr5+NsOsSiteCraW+7liIdNkvCSBYkpRYICpaa3LYtHky9rcdRw4cQb1W7Whj
	3BEx8MWKboSZB2/ZBPyl4KARpHi/C26ANadd9U2Azwa5nbH49IDszs2E/LeI/ZYnfJygoeWJWgekZ
	GsnrinxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGrMD-0000000EqbR-3YOP;
	Thu, 06 Nov 2025 04:12:21 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGrMB-0000000Eqav-0fD5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 04:12:21 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4d27yY3qs7z1K96d;
	Thu,  6 Nov 2025 12:10:29 +0800 (CST)
Received: from kwepemr500004.china.huawei.com (unknown [7.202.195.141])
	by mail.maildlp.com (Postfix) with ESMTPS id 92A101A016C;
	Thu,  6 Nov 2025 12:12:03 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemr500004.china.huawei.com
 (7.202.195.141) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 6 Nov
 2025 12:12:02 +0800
Message-ID: <bf38a9cb-41a9-4a40-ba17-afe679018003@hisilicon.com>
Date: Thu, 6 Nov 2025 12:12:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: topology: Improve AMU-based frequency
 calculation
To: Bowen Yu <yubowen8@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<beata.michalska@arm.com>, <ptsm@linux.microsoft.com>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>
CC: <prime.zeng@hisilicon.com>, <wanghuiqiang@huawei.com>,
	<xuwei5@huawei.com>, <zhenglifeng1@huawei.com>, <zhangpengjie2@huawei.com>
References: <20251104075544.3243606-1-yubowen8@huawei.com>
 <20251104075544.3243606-2-yubowen8@huawei.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <20251104075544.3243606-2-yubowen8@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemr500004.china.huawei.com (7.202.195.141)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_201219_531785_F609AFD0 
X-CRM114-Status: GOOD (  14.01  )
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



On 11/4/2025 3:55 PM, Bowen Yu wrote:
> The current approach of reverse-calculating CPU frequency from capacity
> values introduces quantization errors due to intermediate scaling of
> arch_scale_freq_capacity, which results in the calculated frequency having
> only 1/1024 resolution.
> 
> This patch:
> 1. Directly computes frequency using AMU counters in amu_scale_freq_tick():
> freq = (core_cycles_delta * timer_freq) / (const_cycles_delta * 1000)
>  - core_cycles_delta: Measured CPU cycles
>  - timer_freq: Architectural timer frequency
>  - const_cycles_delta: Reference cycles from fixed-frequency timer
> 2. Returns pre-computed avgfreq in arch_freq_get_on_cpu()
> 
> examples:
> Before change
> [root@localhost ~]# cat /sys/devices/system/cpu/cpufreq/policy*/cpuinfo_avg_freq
> 2297851
> 2297851
> 2295312
> 2297851
> 2297851
> 2295312
> 2297851
> 2295312
> 2297851
> 2297851
> 2297851
> 2295312
> 2295312
> 2297851
> 2297851
> 2297851
> 2297851
> 2300390
> 2297851
> 2297851
> 2297851
> 
> After change
> [root@localhost ~]# cat /sys/devices/system/cpu/cpufreq/policy*/cpuinfo_avg_freq
> 2299177
> 2298117
> 2299188
> 2297330
> 2296530
> 2298817
> 2298434
> 2298986
> 2298596
> 2299395
> 2299560
> 2298446
> 2299108
> 2299294
> 2298707
> 2298453
> 2298632
> 2299218
> 2297962
> 
> Signed-off-by: Bowen Yu <yubowen8@huawei.com>
> ---
>  arch/arm64/kernel/topology.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
...
> @@ -288,7 +293,7 @@ int arch_freq_get_on_cpu(int cpu)
>  	unsigned int start_cpu = cpu;
>  	unsigned long last_update;
>  	unsigned int freq = 0;
> -	u64 scale;
> +	u64 delta_core_kHz;
>  
>  	if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
>  		return -EOPNOTSUPP;
> @@ -340,14 +345,11 @@ int arch_freq_get_on_cpu(int cpu)
>  			break;
>  		}
>  	}
> -	/*
> -	 * Reversed computation to the one used to determine
> -	 * the arch_freq_scale value
> -	 * (see amu_scale_freq_tick for details)
> -	 */
> -	scale = arch_scale_freq_capacity(cpu);
> -	freq = scale * arch_scale_freq_ref(cpu);
> -	freq >>= SCHED_CAPACITY_SHIFT;
> +
> +	if (check_mul_overflow(per_cpu(core_delta, cpu), arch_timer_get_cntfrq(), &delta_core_kHz))
Hi Bowen,

IIUC, the variable 'delta_core_kHz' doesn't mean its name.
'core_delta * timer_freq' is just a transitional number.
The naming is misleading.

Perhaps consider reusing 'freq'? i.e. define 'freq' as u64 and replace
'delta_core_kHz' with 'freq', then return (int)freq at the end.

Jie
> +		return -EINVAL;
> +
> +	freq = div_u64(delta_core_kHz, per_cpu(const_delta, cpu) * HZ_PER_KHZ);
>  	return freq;
>  }
>  

