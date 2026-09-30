Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658D0CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wwWQH0RuSx1sfd7/SgXUFkFYOs6i6IKZVk7OeFK0Y8=; b=InE00p6NzyVkOlzIWk+GHYjNiu
	TIxrkxdukzV6D6moRxI+tHy4NetztcWmnKd9KuIN/3LH3xuISHqX1WZIT6dXyEYaE4Pt4h9jeU2mi
	mnOUkIIhWySG4l9IYKqeHJdzhBdN2ea1iXwynfggTAphe/lR0WJ0FCzfhYNrj2CKUVfB0qsILomXQ
	mNCL+EpOO7fnfYw1+N+rsHHusCqUlDg1vkZI+d0NuJryOzhfOlt6FqLXI43ExTshMhWzkY1LTt59V
	KnqiSKidG4XtqYDTLUpkzyjPLn/sNnTdksxL9Q2Tgdw7/Ecto6vaXC9gWm7ZanNzxtdS8CT8uRDd4
	7BFsvm0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0Zp-000000078sv-0lbg;
	Wed, 30 Sep 2026 20:06:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0Zn-000000078sh-1jGN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:06:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B3E2601F1;
	Wed, 30 Sep 2026 20:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FF91F000FF;
	Wed, 30 Sep 2026 20:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790798810;
	bh=9wwWQH0RuSx1sfd7/SgXUFkFYOs6i6IKZVk7OeFK0Y8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dsTyOIL1lc+U+TSySonbnY8xOMbpjOb6PlRCeAtuJ4zuKOoEF6tgz54w8WfcrOKgL
	 /q+WbSyU8bJHk/+m/mXIsGhj7CJBruTLwxTZTtYdz67HeU94qlzmLeGFCKYk4lbcN9
	 Flh+e6oWvUdiE7WSFb/xgr6u/qNbYmTsIV09ZNhtW8hTmlFbbw8ethtIvWsZdTcv2Y
	 02UlFmIn5hL6Hoiimv+tDAoujdmrckq6jRkS4t+huKUQxAt+bHsc+yr1lzK4aX66H5
	 c/6IbGuiH6yNu9ttSBA0RFGXTJTzw2uwJ5xpXvVyAv3VWgMtyO9v7tEJjIGUHuOEgi
	 GKbbIuJn6QUgg==
Message-ID: <8cdd2938-a7a2-4d20-bacd-7ab4f5cbe80f@kernel.org>
Date: Wed, 30 Sep 2026 15:06:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] cpufreq: Resolve CPPC frequencies to performance
 levels
Content-Language: en-US
To: Christian Loehle <christian.loehle@arm.com>
Cc: zhenglifeng1@huawei.com, zhongqiu.han@oss.qualcomm.com,
 viresh.kumar@linaro.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, K Prateek Nayak <kprateek.nayak@amd.com>,
 Huang Rui <ray.huang@amd.com>, Perry Yuan <perry.yuan@amd.com>,
 "Gautham R . Shenoy" <gautham.shenoy@amd.com>,
 Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
 Shubhang Kaushik <sh@gentwo.org>, Pierre Gondois <pierre.gondois@arm.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ionela Voinescu <ionela.voinescu@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Jeremy Linton <jeremy.linton@arm.com>, Peter Zijlstra
 <peterz@infradead.org>, jonathanh@nvidia.com, zhanjie9@hisilicon.com,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, rafael@kernel.org
References: <20260929102957.2591657-1-christian.loehle@arm.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260929102957.2591657-1-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 9/29/26 05:29, Christian Loehle wrote:
> For table-based cpufreq drivers, the core resolves requests to supported
> frequency-table entries before governors such as schedutil compare them
> with their cached target. Different kHz requests selecting the same entry
> therefore need not reach the driver again.
> 
> Table-less cppc-cpufreq lacks this resolution: the core returns the requested
> kHz value even if firmware exposes only a few CPPC performance levels.
> Different requests can miss the governor's cache yet program the same
> Desired Performance value. The tested ARM AGI CPU exposes only 61 levels,
> with bounds visible at:
> 
>    /sys/devices/system/cpu/cpuX/acpi_cppc/{lowest,highest}_perf
> 
> Add ->resolve_freq() so table-less ->target() drivers can canonicalize
> requests without constructing a frequency table. CPPC resolves requests
> before sugov_update_next_freq(), allowing its existing cache to skip
> equivalent requests. Raw limit notifications still trigger
> reconsideration, but only changed resolved limits force a driver update.
> Failed limit writes remain pending for retry.
> 
> Testing on an ARM AGI CPU (61 distinct CPPC levels) with schedutil gives
> the following end-to-end results across 16 iterations:
> 
>    schbench -m 2 -t 31 -F 256 -n 5 -R 18000 -r 60 -w 20 -i 60
> 
>    metric                         baseline       resolve-freq      change
>    median p99                    3364 us          3280 us          -2.5%
>    mean of run p99s              3664.2 us        3299.0 us       -10.0%
>    worst run p99                 4360 us          3500 us         -19.7%
>    median throughput             16431.08 RPS     16460.69 RPS     +0.2%
> 
> In an instrumented run of the same workload, cppc_set_perf() calls fell
> from 1,136,868 to 866,703, a 23.8% reduction.
> 
> Christian Loehle (3):
>    cpufreq: Add a driver frequency resolution callback
>    cpufreq: CPPC: Resolve frequencies to performance levels
>    cpufreq: Skip updates for unchanged resolved limits
> 
>   Documentation/admin-guide/pm/cpufreq.rst |   4 +
>   Documentation/cpu-freq/cpu-drivers.rst   |  19 ++
>   drivers/cpufreq/cppc_cpufreq.c           | 257 +++++++++++++++++++++--
>   drivers/cpufreq/cpufreq.c                |  99 +++++++--
>   include/linux/cpufreq.h                  |  11 +
>   kernel/sched/cpufreq_schedutil.c         |  19 +-
>   6 files changed, 359 insertions(+), 50 deletions(-)
> 
> 
> base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

