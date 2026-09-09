Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D35C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWnWnWE0ol79mzY2/f3yYz1gKCP+/xm67UeNq5cxw2g=; b=orIpP4MewEmEBrEiJW4MsptwEr
	5LieCaD5v1c8f6tpueSbYRrYJ7IG5MXF+tg0zlaSiXgTuV/vuMXLm6WwOud/iIE8NrocEM6GI9xZU
	BOah334hTpmWDxxT+BbXfsIo6Xe7qT2DngK1AfcdE2jyvg48/CvnIe2qMKEs064Bh4NAIx2zyB3Z4
	y7DxMOEu6WQ2R7YX+J2Ku/xSj/14OkCFo/k/6MY2KYtvJxzRq5yaCXHlahX7tc4aj0MuyS4OZ7b/c
	jSfb882TRFMxJg9AQJMauGsSGDo8HtIkpWHe/1C0x8qiNeCHbiC/fvm7sqm1+IzKw7ObLnWcaL90n
	4c89LGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K53-0000000C7Ua-2vat;
	Wed, 09 Sep 2026 15:19:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K4x-0000000C7TC-0sR8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:19:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1470C176B;
	Wed,  9 Sep 2026 08:19:10 -0700 (PDT)
Received: from [10.57.73.177] (unknown [10.57.73.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4CF63F528;
	Wed,  9 Sep 2026 08:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788967153; bh=JVtbIx6b4JixBca9/3cW8IIAuyorQfe6n8JSHIidnqs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U0qm13YB5WYFYasx1y8R4omfspRoS9xTNbVV7scKvzqDLalmp23hpW0cqjNPeD/if
	 /8Mgp4YURpXg27zZxYOWsniPkPJvG2wbjnhSEK5fg+7DTQ5vy41ovyI1bye+haeR2a
	 gy6REZ6hA8vEbF5EifUahC/Y2F5j+vuXDAHXCmgo=
Message-ID: <89694e14-4be8-4c9e-9d7b-2808f87dd95f@arm.com>
Date: Wed, 9 Sep 2026 17:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
To: Andrea Righi <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Mark Rutland
 <mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>,
 Breno Leitao <leitao@debian.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-2-arighi@nvidia.com>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20260909062649.469633-2-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_081915_307771_9512A116 
X-CRM114-Status: GOOD (  10.34  )
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

On 09.09.26 08:26, Andrea Righi wrote:

[...]

> +void __init arm64_init_sched_topology(void)
> +{
> +	if (!IS_ENABLED(CONFIG_SCHED_SMT))
> +		return;
> +
> +	if ((read_cpuid_id() & MIDR_CPU_MODEL_MASK) != MIDR_NVIDIA_OLYMPUS)
> +		return;
> +
> +	if (!topology_core_has_smt(smp_processor_id()))
> +		return;
> +
> +	set_sched_topology(arm64_asym_smt_topology);
> +	pr_info("Enabling PE0 SMT preference for NVIDIA Olympus\n");

I'm not really a big fan of using this arm64 setup for NVIDIA Olympus
alone here.

> +}
> +
> +int arch_asym_cpu_priority(int cpu)
> +{
> +	return MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 0) == 0;
> +}
> +

This is done since it will only be called for NVIDIA Olympus since it's
the only CPU model enabling this. I think it will work but it's still
ugly :-)

[...]


