Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05153CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKmyIWt43Wn/d/APqXrWdvq+rkEmc05Mvkd3GYPmTCo=; b=EcUFTuFM9MZDEmKSUYccHEcX1w
	YAbL+CiV6NFJ7euOGsw+t+CHf2IC8nIuk97ccSaKuVAqLt9DM9d7dtPfVHzEWtqvnBUaZf18qK0p0
	HAAlHatjNaHmMTJtQZJAm7oHl4GCTLw8O0XaJD08Fr8zJBHASQ8KhhmpTSDXI3pyvv6pPEA27u9oF
	m8x1yduGQToAiUaLdu1NoBGJHY1nxoS7+48WOh21uNhURZdsa0a5heEEArsRs090FihK2ZkEbjJtq
	YswFuf9IR3Sp5zzszFYyzmtihY42T2Iz2o5a3XkFFix3TBYZzFG50F1Qjv5EepxBp5eH7GKjRJQdD
	dsj1GbzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgk7-00000002p8b-2MT6;
	Fri, 16 Oct 2026 12:08:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgk5-00000002p8E-0Hzv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 12:08:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B073914BF;
	Fri, 16 Oct 2026 05:08:51 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE35C3F871;
	Fri, 16 Oct 2026 05:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792152535; bh=VFMH9dN/WQRl6EcUgR05d3+nY7m15apBlHJFVXqVwaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZueOI6wp4sAix2W59PLrWZY2Wfb/pUbddS5jR0dFXrqo1hImpFPo9X4bSWf82m0K
	 5E7Erv9pXv7+Ivxz3n/gRoQ4PjKJyFnCiN4LJed73EILzQytL4TH9BC1tzgYcUrDTx
	 ZBmd5Lb0iKIE0sdJQzdz7/sYpspWNAZPw5oSfKPA=
Date: Fri, 16 Oct 2026 13:08:49 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Kohei Enju <enju.kohei@fujitsu.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 3/4] perf: arm_pmu: Add workaround for FUJITSU-MONAKA
 Erratum E#030002
Message-ID: <atIT0dmeqAXLoThW@J2N7QTR9R3.cambridge.arm.com>
References: <20261016-monaka-fix-for-upstream-v2-0-fc7ede7f9f48@fujitsu.com>
 <20261016-monaka-fix-for-upstream-v2-3-fc7ede7f9f48@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-monaka-fix-for-upstream-v2-3-fc7ede7f9f48@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_050857_190171_DCD5137B 
X-CRM114-Status: GOOD (  41.02  )
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

On Fri, Oct 16, 2026 at 07:00:47PM +0900, Tomohiro Misono wrote:
> FUJITSU-MONAKA Erratum E#030002 affects FUJITSU-MONAKA CPU.
> 
> On affected FUJITSU-MONAKA CPUs, after a PMU event counter is
> stopped at a value just before overflow, an overflow might still
> be incorrectly detected, resulting interrupt storm in some case.
> 
> For example, if the following conditions are met:
>   1) Running perf to count an event in user space only
>   2) The event can also occur in kernel space
>   3) The counter value is set just before the overflow
>      (when using the -F option, initial counter value is -1)
> 
> when the kernel is about to return to user space after enabling
> the count, an overflow interrupt is incorrectly triggered by an
> event that occurred in kernel space. Since the counter value is
> not updated (correctly), the interrupt handler does nothing and
> returns with the same condition. This leads to another wrong interrupt
> and results in an interrupt storm and eventually a softlockup.

I don't fully understand this.

Surely the relevant PMOVS{CLR,SET}[n] bit set as if the counter n
overflowed?

If that bit is set, the handler will certainly do *something*.

If that bit is not set, the interrupt shouldn't be asserted at all. When
does it get de-asserted?

> Work around the erratum by avoiding programming PMU event counters
> with values within five counts of overflow.

Without more detail, I don't think that can be sufficient, because you
can end up in a scenario where:

1. The kernel confugures the counter to -5.

2. The kernel returns to userspace.

3. In userspace, 4 events occur, and are counted, leaving the counter at
   -1.

4. Some unrelated interrupt is taken, entering the kernel.

5. Upon return to userspace, a kernel event occurs, triggering this
   issue.

6. The PMU interupt handler runs, does nothing, leading right back to
   the original issue.

What am I missing?

Mark.

> Signed-off-by: Tomohiro Misono <misono.tomohiro@fujitsu.com>
> 
> ---
> Changes in v2:
> - Add user impact explanation in the commit message
> ---
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 17 +++++++++++++++++
>  arch/arm64/include/asm/cpucaps.h            |  2 ++
>  arch/arm64/kernel/cpu_errata.c              | 10 ++++++++++
>  arch/arm64/tools/cpucaps                    |  1 +
>  drivers/perf/arm_pmu.c                      | 13 +++++++++++++
>  6 files changed, 45 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index 527af20b26468..0efb24ec01b4c 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -377,6 +377,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Fujitsu        | MONAKA          | E#030001        | FUJITSU_ERRATUM_030001      |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| Fujitsu        | MONAKA          | E#030002        | FUJITSU_ERRATUM_030002      |
> ++----------------+-----------------+-----------------+-----------------------------+
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ASR            | ASR8601         | #8601001        | N/A                         |
>  +----------------+-----------------+-----------------+-----------------------------+
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 5d1a17ab0f593..43fd265156e46 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1361,6 +1361,23 @@ config FUJITSU_ERRATUM_030001
>  
>  	  If unsure, say Y.
>  
> +config FUJITSU_ERRATUM_030002
> +	bool "FUJITSU-MONAKA erratum E#030002: PMU overflow may be incorrectly detected"
> +	depends on ARM_PMUV3
> +	default y
> +	help
> +	  This option adds a workaround for FUJITSU-MONAKA erratum E#030002.
> +	  On affected FUJITSU-MONAKA CPUs, after a PMU event counter is
> +	  stopped at a value just before overflow, an overflow might still
> +	  be incorrectly detected.
> +
> +	  Work around the erratum by avoiding programming PMU event counters
> +	  with values within five counts of overflow.
> +
> +	  The workaround only affects the FUJITSU-MONAKA.
> +
> +	  If unsure, say Y.
> +
>  config HISILICON_ERRATUM_161600802
>  	bool "Hip07 161600802: Erroneous redistributor VLPI base"
>  	default y
> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
> index 9220b917ec207..c0a0452daf949 100644
> --- a/arch/arm64/include/asm/cpucaps.h
> +++ b/arch/arm64/include/asm/cpucaps.h
> @@ -68,6 +68,8 @@ cpucap_is_possible(const unsigned int cap)
>  		return IS_ENABLED(CONFIG_ARM64_ERRATUM_4193714);
>  	case ARM64_WORKAROUND_FUJITSU_030001:
>  		return IS_ENABLED(CONFIG_FUJITSU_ERRATUM_030001);
> +	case ARM64_WORKAROUND_FUJITSU_030002:
> +		return IS_ENABLED(CONFIG_FUJITSU_ERRATUM_030002);
>  	case ARM64_MPAM:
>  		/*
>  		 * KVM MPAM support doesn't rely on the host kernel supporting MPAM.
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index a11135f83e858..6363b694b4478 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -1048,6 +1048,16 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>  					{}
>  				})),
>  	},
> +#endif
> +#ifdef CONFIG_FUJITSU_ERRATUM_030002
> +	{
> +		.desc = "FUJITSU-MONAKA Erratum E#030002",
> +		.capability = ARM64_WORKAROUND_FUJITSU_030002,
> +		ERRATA_MIDR_RANGE_LIST(((const struct midr_range[]) {
> +					MIDR_ALL_VERSIONS(MIDR_FUJITSU_MONAKA),
> +					{}
> +				})),
> +	},
>  #endif
>  	{
>  		.desc = "Known broken GICv3 SEIS implementation",
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 1e57a0105395b..ef8ce70ab7121 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -133,3 +133,4 @@ WORKAROUND_SPECULATIVE_SSBS
>  WORKAROUND_SPECULATIVE_UNPRIV_LOAD
>  WORKAROUND_BROKEN_AMU_CONSTCNT
>  WORKAROUND_FUJITSU_030001
> +WORKAROUND_FUJITSU_030002
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 1150695653892..c0b8580d80bae 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -234,6 +234,19 @@ int armpmu_event_set_period(struct perf_event *event)
>  	if (left > (max_period >> 1))
>  		left = (max_period >> 1);
>  
> +#if IS_ENABLED(CONFIG_ARM64)
> +	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_FUJITSU_030002)) {
> +		/*
> +		 * Due to the errata, overflow might be incorrectly detected in the handler
> +		 * when the counter is about to overflow in a single increment, resulting
> +		 * interrupt storm in some case. As the counter can increase by up to
> +		 * 5 at a time, set 6 here to prevent the condition.
> +		 */
> +		if (left > 0 && left < 6)
> +			left = 6;
> +	}
> +#endif
> +
>  	local64_set(&hwc->prev_count, (u64)-left);
>  
>  	armpmu->write_counter(event, (u64)(-left) & max_period);
> 
> -- 
> 2.43.0
> 

