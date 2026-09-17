Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0FBC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wKxSa7c0p0O4eldd/cbeEnDVQJr9g2t4qchSV9TWeM=; b=d7JF6QBN7wodE7Lo3QIn7cCHQJ
	oRonjOHwn65kNIijGgjVl3UUbEIeBQ2SErAIHbMDz+v8+tRZ0IqD8NDok3Dpe3La1ZRvDAtNSe4qT
	akwgVjSUCi/VWnaLhm8UuJY80dFQCaMkl/NXkLyfHTcTvUYYEJMODEFmkfmH5y49gT67SEOtCtaqW
	f4ut70fm2gXqqGWiL3w3OAGTzniYUvb2a4E+oRfwH5wE/dUxOyryJtgDiSabUb7NnY8BctpvIZtdY
	kJTdUGk5x8p9QXJUhDGn+Xm0o63xze7x/yLxpyUYCOH3PRkFHMOCzC3sLbhkMH+tKSvST2TqsurWc
	9TSmX+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DCf-0000000BYHQ-2fgO;
	Thu, 17 Sep 2026 14:35:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DCd-0000000BYG8-12se
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:35:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2CAD1476;
	Thu, 17 Sep 2026 07:35:00 -0700 (PDT)
Received: from [192.168.178.100] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 735AC3F86F;
	Thu, 17 Sep 2026 07:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789655704; bh=mobytS+1K2rkJCeo1bg8kHuJ2xKRSO5VB5xXMn9bBS4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iqHXQy1JB2qQbP3MjChIwmtzj+93Umn86ZBQsDSTZGKWutkkKFuWxAmMh4B7G882X
	 t49S9TiQH/OuzPpJBUWpvJugzd9EYUqw5JPodoZqA2xm0egrEQGISGahSQQIcAPjYi
	 b6b5wjWLuz+I6I/cz1LfWsLlsqLcc06ls9uP3LJw=
Message-ID: <bddc9273-fe02-4984-bfe9-5078e9e6e111@arm.com>
Date: Thu, 17 Sep 2026 16:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arch_topology: use the boost frequencies for
 capacity_freq_ref
To: Oleg Keri <okerixx@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Sumit Gupta <sumitg@nvidia.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-pm@vger.kernel.org
References: <20260917125112.2283-1-okerixx@gmail.com>
 <20260917125112.2283-3-okerixx@gmail.com>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20260917125112.2283-3-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_073507_333428_57DC2239 
X-CRM114-Status: GOOD (  13.36  )
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

On 17.09.26 14:51, Oleg Keri wrote:
> capacity_freq_ref is latched from policy->cpuinfo.max_freq by
> init_cpu_capacity_callback() on CPUFREQ_CREATE_POLICY.
> cpufreq_frequency_table_cpuinfo() excludes CPUFREQ_BOOST_FREQ entries
> while boost is disabled, so on a system that boots with boost off the
> reference is the non-boost maximum and stays there.
> 
> Once boost is enabled the CPU runs above its reference.  On arm64, where
> the AMU drives frequency invariance, amu_scale_freq_tick() caps the scale
> at SCHED_CAPACITY_SCALE, so the scheduler cannot tell a boosted CPU from
> one at the sustained maximum, and arch_freq_get_on_cpu() cannot report
> above the reference, so cpuinfo_avg_freq is pinned to it.
> 
> CPPC based systems do not have the problem: their reference comes from
> highest_perf, and a disabled boost shows up as cpufreq pressure.  Do the
> same for frequency table drivers and take the highest valid table entry,
> boost entries included, as the reference.  With boost off
> cpufreq_update_pressure() then reports the difference as pressure.

Ah, you want to fix this for 'frequency table' drivers.

IMHO,
https://lore.kernel.org/r/20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com
is trying the same at the moment.

[...]

