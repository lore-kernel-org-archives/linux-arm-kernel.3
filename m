Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC5BC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/eBnhEyAChHmfoKpstGgctSA6buastclrXBl6YTP04=; b=EkejuFwP9C8h9y6voB1N1sbe19
	gFnN3j1pD2jDValbL5tE311WDEi6VQ9GsJw3wvuqaR54d/k+yxAD0bB32oPySPGDOV15+ONUexlfO
	UO5CJLwFUzxDlo+nGmtK7Y0UiKP/IJxuFHER2i43WVyXfJz4nzVa9wUqs5IneTGp0TL/TuzijqcLe
	g6g0UaUfavkon+cbQtf9ZUBGn6+WOSyCUfamcCmyWie3YsOm9MwEU0fnwSS3geozFTGGG+2xBWY5B
	7dyI+lEsKHJmhsw98H0NUzqJto9XVZJ1ZrVs+vc3FARml8rC9G2ue/l0RYyh8rLoDGhx7mHjaCHGP
	ofritlaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78sZ-0000000B3LU-2ZZF;
	Thu, 17 Sep 2026 09:58:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78sW-0000000B3KZ-1bXo;
	Thu, 17 Sep 2026 09:58:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7CA91476;
	Thu, 17 Sep 2026 02:57:58 -0700 (PDT)
Received: from [10.57.74.102] (unknown [10.57.74.102])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD88E3F7B4;
	Thu, 17 Sep 2026 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789639082; bh=VXqLon1IWeQzTI8dDj4hKxc7saHoW6A0Hg3046jh/QI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vja3M8VABVOrmZ2ChYzc/upsrhetTGKhEnf/pEqYK+HiSbSu/clHPeW+o3eKoIK4Z
	 0+Wx3stikCeAmbXeqVmEvNHb/v78HBmo4ovtzTcV7kdJ1PuFCDwMqvcvyMeHDTyFTu
	 Uj8E/utZDL2YEdMx2GCJKyelvgXqlKah9PS1wewY=
Message-ID: <f8b0745c-d265-4112-90fe-79a08ad01553@arm.com>
Date: Thu, 17 Sep 2026 11:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] cpufreq: update capacity_freq_ref when the boost
 state changes
To: Oleg Keri <okerixx@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Russell King <linux@armlinux.org.uk>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Sudeep Holla <sudeep.holla@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, driver-core@lists.linux.dev,
 linux-pm@vger.kernel.org, jonathan.cameron@oss.qualcomm.com,
 sibi.sankar@oss.qualcomm.com
References: <20260910063440.4677-1-okerixx@gmail.com>
 <20260910063440.4677-3-okerixx@gmail.com>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20260910063440.4677-3-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_025804_598836_EF6877CE 
X-CRM114-Status: GOOD (  10.29  )
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

On 10.09.26 08:34, Oleg Keri wrote:
> capacity_freq_ref is latched from policy->cpuinfo.max_freq by
> init_cpu_capacity_callback() on CPUFREQ_CREATE_POLICY, and never
> updated afterwards.
> 
> cpufreq_frequency_table_cpuinfo() excludes CPUFREQ_BOOST_FREQ entries
> while boost is disabled, so on a system that boots with boost off the
> latched value is the non-boost maximum.  Enabling boost later raises
> policy->cpuinfo.max_freq but leaves capacity_freq_ref behind.
> 
> Two things then go wrong on arm64, where the AMU drives frequency
> invariance.  amu_scale_freq_tick() caps the computed scale at
> SCHED_CAPACITY_SCALE, so a CPU running above capacity_freq_ref
> saturates at 1024: the scheduler cannot tell a boosted CPU from one at
> the sustained maximum, and utilisation is underestimated.  And

IMHO, this is where the concept of 'cpufreq pressure' on CPU capacity
comes in.

The cpu_capacity value is calculated based on highest_perf.	(1)

In case you start with 'boost == 0' nominal_perf might might be lower
than highest_perf.

cpufreq_update_pressure() calculates this value:

cpufreq_pressure = Cmax * (1 - fcapped - fmax)			(2)

[ fcapped = policy->max, fmax = capacity_freq_ref ]

Example on RADXA Orion 06 CPU10:

$ grep . /sys/devices/system/cpu/cpu10/acpi_cppc/*
...
/sys/devices/system/cpu/cpu10/acpi_cppc/highest_perf:7876
/sys/devices/system/cpu/cpu10/acpi_cppc/lowest_freq:800
/sys/devices/system/cpu/cpu10/acpi_cppc/lowest_nonlinear_perf:2520
/sys/devices/system/cpu/cpu10/acpi_cppc/lowest_perf:2520
/sys/devices/system/cpu/cpu10/acpi_cppc/nominal_freq:2500
/sys/devices/system/cpu/cpu10/acpi_cppc/nominal_perf:6600   <-- hacked
/sys/devices/system/cpu/cpu10/acpi_cppc/reference_perf:1000
...

# cat /sys/devices/system/cpu/cpu10/cpu_capacity	<-- (1)
984

# cat /sys/devices/system/cpu/cpu10/cpufreq/boost
0

dmesg (added log)

[    8.065337] cpufreq_update_pressure(): policy->related_cpus=[10-11]
policy->max=2500000 pressure=173			<-- (2)

# echo 1 > /sys/devices/system/cpu/cpufreq/boost

# cat /sys/devices/system/cpu/cpu10/cpufreq/boost
1

dmesg (added log)

[38137.194134] cpufreq_update_pressure(): policy->related_cpus=[10-11]
policy->max=3031666 pressure=0				<-- (2)

The task scheduler gets informed via:

get_actual_cpu_capacity(int cpu)

  capacity = arch_scale_cpu_capacity(cpu);

  capacity -= max(hw_load_avg(cpu_rq(cpu)), cpufreq_get_pressure(cpu));
                                            ^^^^^^^^^^^^^^^^^^^^
  return capacity;

[...]

