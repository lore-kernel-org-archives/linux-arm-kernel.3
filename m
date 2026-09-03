Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6D7C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpdQx2CvqU6WPDOftr8e7dSxiX7jnDIBtfbgFNc6/cg=; b=m3tKWE2YvVjM/KDqwSanTB9Qvv
	Sn024xzBJ7zA4AyIU9WsfVz5EqutKSQ2+MnzdsdLZ9/n8CaEKX+Z8lyYRwl0frpldEyJKo2m8Bsj1
	gpw65m4QeMiIKIFw96oqW3JMnL80fWDNq0v9nwFt+fxLoewgn6bZzYUBT4XlOGuMYmY/DvBfn9SyG
	1QB9oy6JNa1hamKceqSkuU/ZfXNUFA4XpYuCBy1evTLnIy0XRRqlR9ncMnaxDt0QGrqy+PCPhLHSc
	aVQPdH7AU9wRnLW34IDcVxLT1hLps+0iLXS/TObqJd/yjB06HTaDWfOe400T4DcQacrnlaVN26MrW
	/i2yjIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Az-0000000H9d0-0tBs;
	Thu, 03 Sep 2026 11:00:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Aw-0000000H9cZ-2b3Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:00:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13F611596;
	Thu,  3 Sep 2026 04:00:04 -0700 (PDT)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37EB83F673;
	Thu,  3 Sep 2026 04:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788433207; bh=l/WLiFAWZGavTCOOkKCUj7KqObYJmvameChFjiTD1Yw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pt6UJRbW6eyrmqq6KoqUnuw1zRAmNRf5RDLIQWQvl9LUSJ4SZxmf5cHJWIUaXPzOB
	 G6sWHKuAEo7iSNg4v1RWHFia1nDmCrn/12ZRhuzy2cyMflWa8/mhAUyyS5erPl+XKP
	 O8gOun+PhScYTZ2Mfq812xj+BTLWJxV0LawkjFlo=
Message-ID: <0d02e284-9a07-4f54-bf63-8edaa5e224e5@arm.com>
Date: Thu, 3 Sep 2026 12:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
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
References: <20260831181800.1668646-1-arighi@nvidia.com>
 <20260831181800.1668646-3-arighi@nvidia.com>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20260831181800.1668646-3-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_040010_736400_D9D1CB5F 
X-CRM114-Status: GOOD (  19.01  )
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

On 31.08.26 20:10, Andrea Righi wrote:
> SD_ASYM_PACKING orders CPUs that share an SMT core, but idle CPU
> selection does not consult that order. A task can therefore wake on an
> arbitrary sibling and remain there until load balancing corrects the
> placement. On SMT implementations where changing the active sibling
> repartitions core resources, that initial choice can cause a large and
> persistent performance loss.

I assume this sentence refers to Olympus/Vera and Power7?

[...]

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 8dff37059faf7..3c49aa63742cb 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8587,6 +8587,65 @@ static inline bool test_idle_cores(int cpu)
>  	return false;
>  }
>  
> +/*
> + * Return true when @cpu has a higher asymmetric-packing priority than @other in their SMT
> + * scheduling domain.
> + */
> +static bool sched_smt_asym_prefer(int cpu, int other)
> +{
> +	struct sched_domain *sd;
> +
> +	for_each_domain(cpu, sd) {
> +		/*
> +		 * Only honor priorities declared at shared-capacity SMT levels.
> +		 * SD_ASYM_PACKING at higher levels may describe core ordering.
> +		 */
> +		if (!(sd->flags & SD_SHARE_CPUCAPACITY))
> +			break;
> +
> +		if ((sd->flags & SD_ASYM_PACKING) && cpumask_test_cpu(other, sched_domain_span(sd)))

Looks like 'other' is always part of the mask?

> +			return sched_asym_prefer(cpu, other);
> +	}
> +
> +	return false;
> +}

SMT will always the lowest SD, so for_each_domain() is not necessary:

static bool sched_smt_asym_prefer(int cpu, int other)
{
        struct sched_domain *sd = rcu_dereference_all(cpu_rq(cpu)->sd);

        if (sd && ((sd->flags & (SD_SHARE_CPUCAPACITY |
SD_ASYM_PACKING)) == (SD_SHARE_CPUCAPACITY | SD_ASYM_PACKING)))
                return sched_asym_prefer(cpu, other);

        return false;
}

[...]

> @@ -8668,7 +8727,7 @@ static int select_idle_smt(struct task_struct *p, struct sched_domain *sd, int t
>  		if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
>  			continue;
>  		if (choose_idle_cpu(cpu, p))
> -			return cpu;
> +			return select_idle_smt_priority(p, cpu);

This one is weird for SMT2. AFAICS, select_idle_smt() is called when
there are no idle cores. So if you find an idle CPU this is what you
will return anyway.

I guess your tests on Olympus/Vera do wakeups via select_idle_capacity()
so you haven't touched this one.

[...]

