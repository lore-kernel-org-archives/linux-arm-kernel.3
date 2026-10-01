Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6558CA5FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbJhgquatt87upvJf0Ak4lxdnZtpIeSb+aDtxb1CtgI=; b=r87CciWW2unKyu5YMODf1+1TFo
	tZJRlBZqIPNF5u3D2udST/JZhmxCoHMyRZipaL9P2Q7N/vCGB36dsdxBJpWOHOqyzeuc0ZteervST
	QIp9rZf1x0KxDFDdplJYZnYHYPl1D3ngV3mMgy8ee3jJm5KJ2oo+9gJtxE3fj0gVU3w3PJAJID7Wj
	Qq3WFRtjbFrVjAHF5NB7VLdSB/VanhihXkEWFgcFDWjH69K3UWeNj6HWAsra/YGNxELKTP06Y3Eo/
	bcYlAEWPWNGt61YeWbMN7+nhkiI/EUw+g5HD1MSA6J3Mpx7TIoBcNVGDZd5dkUK7qJ3JhhSyKsAGI
	/UVK+DMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCE7n-00000008WIB-3EcZ;
	Thu, 01 Oct 2026 10:34:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCE7n-00000008WHX-0JE1;
	Thu, 01 Oct 2026 10:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xbJhgquatt87upvJf0Ak4lxdnZtpIeSb+aDtxb1CtgI=; b=oPjEY3kJQ4HBOpowg0quk/3xk2
	74VjW7/qKOuV51Z2N4Xm67I+IYiudxcplzOcQ2MxYPrU0hIQVib0HqYSQGlKUE50MyldkVXDz66r3
	WCObSwGLljzoDs9jRbVWEDa2bm08+LmAG27Ff2EUlCydIo5a6mV0Pi50lL0JnDiNkoniOfyHENxoK
	s2Fs4nUvuRETCwm1YJfnvMZPbeA0FwuSVQDB7kYziJNhLiqKfGFwwyFz0iXYfqAD2NFhdeUPUTwqB
	k71/r34eUL5HHZ4nPBmrLMfejkYUAceiku7ubqqoK3laOZXNEUhD65XiuNw220gcN7vsPhnLkRrik
	fK9B0FqQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCE7i-00000004qdd-30Wm;
	Thu, 01 Oct 2026 10:34:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B5CE9300446; Thu, 01 Oct 2026 12:34:44 +0200 (CEST)
Date: Thu, 1 Oct 2026 12:34:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christian Loehle <christian.loehle@arm.com>
Cc: rafael@kernel.org, zhenglifeng1@huawei.com,
	zhongqiu.han@oss.qualcomm.com, viresh.kumar@linaro.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Huang Rui <ray.huang@amd.com>, Perry Yuan <perry.yuan@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>,
	Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
	Shubhang Kaushik <sh@gentwo.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>, jonathanh@nvidia.com,
	zhanjie9@hisilicon.com,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 0/3] cpufreq: Resolve CPPC frequencies to performance
 levels
Message-ID: <20261001103444.GU4120091@noisy.programming.kicks-ass.net>
References: <20260929102957.2591657-1-christian.loehle@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929102957.2591657-1-christian.loehle@arm.com>
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

On Tue, Sep 29, 2026 at 11:29:54AM +0100, Christian Loehle wrote:
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
>   /sys/devices/system/cpu/cpuX/acpi_cppc/{lowest,highest}_perf
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
>   schbench -m 2 -t 31 -F 256 -n 5 -R 18000 -r 60 -w 20 -i 60
> 
>   metric                         baseline       resolve-freq      change
>   median p99                    3364 us          3280 us          -2.5%
>   mean of run p99s              3664.2 us        3299.0 us       -10.0%
>   worst run p99                 4360 us          3500 us         -19.7%
>   median throughput             16431.08 RPS     16460.69 RPS     +0.2%
> 
> In an instrumented run of the same workload, cppc_set_perf() calls fell
> from 1,136,868 to 866,703, a 23.8% reduction.
> 
> Christian Loehle (3):
>   cpufreq: Add a driver frequency resolution callback
>   cpufreq: CPPC: Resolve frequencies to performance levels
>   cpufreq: Skip updates for unchanged resolved limits
> 
>  Documentation/admin-guide/pm/cpufreq.rst |   4 +
>  Documentation/cpu-freq/cpu-drivers.rst   |  19 ++
>  drivers/cpufreq/cppc_cpufreq.c           | 257 +++++++++++++++++++++--
>  drivers/cpufreq/cpufreq.c                |  99 +++++++--
>  include/linux/cpufreq.h                  |  11 +
>  kernel/sched/cpufreq_schedutil.c         |  19 +-
>  6 files changed, 359 insertions(+), 50 deletions(-)

No objection to the kernel/sched/ change. I'm assuming rjw or other
cpufreq maintainer will take this?

