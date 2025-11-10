Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D05CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weqyq8Tba3HKD1yhHCEShkz4WEe5mnLP0G60ZfgyOB8=; b=Rn6VRhSJqCOkCNVIQdL+oJjhX6
	LiCUK4+h/NMunudZ18Yf3xrbHaRivsII55b38j+q9reDNlsdE8MQjd1I1DTfQxGKsLmZqK6PTG+5y
	+Jlw7mj3H4sxRcwK/MumxxJtKPh+0m+GUobvwMXCu0kX9oLpGzwAilHrU8ALiyxEZ32vjG5Aiit3B
	w6Fj/ufR3jkz5z5uXVD6YGldgg6wxN4e9eJYoh5Sfnt3Qwpk6R6sox/l8UweC9zeF6kiKPym4w5rg
	/a3VLEGkjTJwDkuninbhSW/t1SOncE1o5hphZa2AiFobmSjiUXdB6L1IPIyFSD0eVDYRdZJi0G8Gl
	dD1jCb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVQw-00000005sun-0Khu;
	Mon, 10 Nov 2025 17:12:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVQt-00000005su0-0d5N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:12:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61CAF2B;
	Mon, 10 Nov 2025 09:11:50 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 458D73F66E;
	Mon, 10 Nov 2025 09:11:52 -0800 (PST)
Date: Mon, 10 Nov 2025 18:11:55 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Bowen Yu <yubowen8@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, ptsm@linux.microsoft.com,
	linuxarm@huawei.com, jonathan.cameron@huawei.com,
	zhanjie9@hisilicon.com, prime.zeng@hisilicon.com,
	wanghuiqiang@huawei.com, xuwei5@huawei.com, zhenglifeng1@huawei.com,
	zhangpengjie2@huawei.com
Subject: Re: [PATCH 2/3] arm64: topology: Use current freq in governor for
 idle cpus in cpuinfo_avg_freq
Message-ID: <aRIc20ErWTQr4dRa@arm.com>
References: <20251104075544.3243606-1-yubowen8@huawei.com>
 <20251104075544.3243606-3-yubowen8@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104075544.3243606-3-yubowen8@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_091159_222784_08634B09 
X-CRM114-Status: GOOD (  25.35  )
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

On Tue, Nov 04, 2025 at 03:55:43PM +0800, Bowen Yu wrote:
> The current cpuinfo_avg_freq interface returns an error when all CPUs
> under a policy are idle, which is relatively common. To address this, it
> is better to use the current frequency stored in the governor. This
> implementation is also used on x86 architecture.
Well, the very reason of having this knob was not to mix hardware and software
view of so called 'current frequency'. Note that for x86 there is a dedicated
config option that keeps the behaviour you have mentioned for backward
compatibility.


cpuinfo_avg_freq -> average freq as seen by hw
cpuinfo_cur_freq -> closes one can get to current frequency - hw feedback
scaling_cur_freq -> requested freq, so smth the software believes should be the
		    current freq (often might not be)

The following thread might be useful -> [1]

---
[1] https://lore.kernel.org/all/20240603114811.oio3uemniib5uaa2@vireshk-i7/
---

BR
Beata

> 
> Since the current frequency in the governor is the last known frequency,
> it should be more user-friendly.
> 
> This patch also removes redundant !housekeeping_cpu() check since it is
> inherently done when checking jiffies.
> 
> Original output when all cpus under a policy are idle:
> [root@localhost home]# cat /sys/devices/system/cpu/cpufreq/policy0/
> cpuinfo_avg_freq
> cat: /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_avg_freq: Resource
>  temporarily unavailable
> 
> Output after changes:
> [root@localhost home]# cat /sys/devices/system/cpu/cpufreq/policy0
> /cpuinfo_avg_freq
> 1200000
> 
> Signed-off-by: Bowen Yu <yubowen8@huawei.com>
> ---
>  arch/arm64/kernel/topology.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index c0dbc27289ea..f1370a4a4df9 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -333,14 +333,13 @@ int arch_freq_get_on_cpu(int cpu)
>  				if (!idle_cpu(ref_cpu))
>  					break;
>  			}
> +
> +			if (ref_cpu >= nr_cpu_ids) {
> +				cpufreq_cpu_put(policy);
> +				return cpufreq_quick_get(start_cpu);
> +			}
>  
>  			cpufreq_cpu_put(policy);
> -
> -			if (ref_cpu >= nr_cpu_ids)
> -				/* No alternative to pull info from */
> -				return -EAGAIN;
> -
> -			cpu = ref_cpu;
>  		} else {
>  			break;
>  		}
> -- 
> 2.33.0

