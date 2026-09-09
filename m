Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB8EC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mqbOi63kUAsHZ0zibDAGgq9MP2n2OnK+z4SkjemtbY=; b=g0UhqGSerGd3QzmareJ+tnjzqW
	Qiggk0sM6i64Y6uck1e9iXMSAG92mIgWBeaC1lG+umyu+lF2AyxSbHiW0andhHu5Tk3G5PckvtUxg
	hVS6Z1v5q46sBR3mUFK1Qjo5B84AiC6QNH2KpjzTaQQpBAesPCee4E9jKLsTZpivHWeDMq9h5282X
	WdVq40UJ9Vq6lYM86uKvAyma1TMIkjNlxvGZlsHQZIMhy7VhIYrXgyc5YRmx4SDVaP+kjfw7wEtQ0
	qsnPBocan1FhsNSZSPlBo1OXe5LTdCAOtvUPYPajTpEoh/v6LYfqOksmtilJQdE6sVngT1uwDk4cD
	iiJb5Tdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KJf-0000000CBMD-3JcS;
	Wed, 09 Sep 2026 15:34:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KJe-0000000CBLq-2JV6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:34:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 389FD41443;
	Wed,  9 Sep 2026 15:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9291F00A3A;
	Wed,  9 Sep 2026 15:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788968066;
	bh=/mqbOi63kUAsHZ0zibDAGgq9MP2n2OnK+z4SkjemtbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MpyBAmy9ewejgBOq+OB5P5O7yETpZk5Hf7Q+jwseySYEfIgEkCm2kLCZMQ/y6taiG
	 eYYFvYPBOQcrWusC2JU5EwpDLxm/PGg6gnMFb+DuOmWUqbr/PcCby8AOean7+QbjGD
	 o5Fr5RRyjgOzzznaIyHBoPrhZBxcJm4APuYa87s/U9Bs/t5H4PBtaC4xvLa1QB2zdL
	 0FfTdPtteaC1WKR2yXdMaQmKcuOtGcTHuoiVpM9CpBrI2hQk8fg8ovWxtiXOq8yawt
	 l75qnotc/R3J42VSMF1TGXFMAM6rjUYu8YaznJlNMRlCPHicVz86BGsNtRAXlTwmvb
	 GWyAtNcbsFWow==
Date: Wed, 9 Sep 2026 16:34:18 +0100
From: Will Deacon <will@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
Message-ID: <aqF8euAA8wLmr4w1@willie-the-truck>
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-2-arighi@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909062649.469633-2-arighi@nvidia.com>
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

On Wed, Sep 09, 2026 at 08:26:08AM +0200, Andrea Righi wrote:
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f1..e5a7a4b2e3844 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -19,6 +19,8 @@
>  #include <linux/init.h>
>  #include <linux/percpu.h>
>  #include <linux/sched/isolation.h>
> +#include <linux/sched/topology.h>
> +#include <linux/smp.h>
>  #include <linux/xarray.h>
>  
>  #include <asm/cpu.h>
> @@ -44,6 +46,55 @@
>  static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
>  static cpumask_var_t amu_fie_cpus;
>  
> +/*
> + * Switching the active PE on an NVIDIA Olympus SMT core can keep the core in
> + * two-thread active mode, with resources partitioned between the PEs.
> + *
> + * Prefer PE0 so PE1 can remain idle and the core can stay in full-resource
> + * mode. Firmware does not currently describe this preference, so detect
> + * Olympus by MIDR until a firmware interface is available.
> + */

Fix the firmware?

If we add this MIDR kludge, I guarantee that it will never be fixed.

Will

