Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499D0C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 01:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9bGMpSO4WqiAydjTYI1BvmIFHA6ViKMaNDWLEKT1C0=; b=D3DEwoztFvv9TAMM8jK4eyR/cL
	qo/sEuugYJQG+COfvUPcJpjAiG9OrYK1JXqvqGp6oAenyXC15qHJGnBTqB6/vC19IY2JGrymG6F1t
	OCjJRFSdk21PWkCbj56hyotdIqt4AWjf1I3U5fdeVLkP4FH9TyERuA8YTzQ+4e1kiLQb/YuvffwaZ
	zZqvS+4B1JlE1A5Y/4xruw5dmWEO+wu1EvpbhSJKdT2a/9cGnD0zyBuV/cOAYREZW0NJ4d7qxGTXu
	rOMPMNSUuZAm8t8sk5pH/RPQP/fxaqWppDHb/cRBg0oqYl3wL2Dkc6amTwJHtsBynwUIjY44DMIci
	JOfqFTzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSmjR-0000000GtnU-2tZD;
	Sat, 21 Jun 2025 01:09:21 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSmhC-0000000GtXo-0gAk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 01:07:03 +0000
Date: Fri, 20 Jun 2025 18:06:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750468018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x9bGMpSO4WqiAydjTYI1BvmIFHA6ViKMaNDWLEKT1C0=;
	b=lcs+3a2ZLhflGQHKJ+gTgO7tBN917ZPbJW/VqGm5qDtkba9vGMlVsl2g4UsIib1GPpDr4G
	Qz0ka4yuqWFfIVF8ZG1dVxusdCKjloC/kN1XPEVs7C6tPFt7GQ6bMeuvijVPunIWZecPoH
	tkaZ/VVRFsn3eo+FUkZ0KJuGDM0AJ7I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 07/23] perf: arm_pmuv3: Introduce method to partition
 the PMU
Message-ID: <aFYFqrYRsmCi6oii@linux.dev>
References: <20250620221326.1261128-1-coltonlewis@google.com>
 <20250620221326.1261128-8-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620221326.1261128-8-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_180702_561943_639AADB6 
X-CRM114-Status: GOOD (  36.29  )
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

On Fri, Jun 20, 2025 at 10:13:07PM +0000, Colton Lewis wrote:
> For PMUv3, the register field MDCR_EL2.HPMN partitiones the PMU
> counters into two ranges where counters 0..HPMN-1 are accessible by
> EL1 and, if allowed, EL0 while counters HPMN..N are only accessible by
> EL2.
> 
> Create module parameters partition_pmu and reserved_guest_counters to
> reserve a number of counters for the guest. These numbers are set at
> boot because the perf subsystem assumes the number of counters will
> not change after the PMU is probed.
> 
> Introduce the function armv8pmu_partition() to modify the PMU driver's
> cntr_mask of available counters to exclude the counters being reserved
> for the guest and record reserved_guest_counters as the maximum
> allowable value for HPMN.
> 
> Due to the difficulty this feature would create for the driver running
> at EL1 on the host, partitioning is only allowed in VHE mode. Working
> on nVHE mode would require a hypercall for every counter access in the
> driver because the counters reserved for the host by HPMN are only
> accessible to EL2.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm/include/asm/arm_pmuv3.h   | 10 ++++
>  arch/arm64/include/asm/arm_pmuv3.h |  5 ++
>  drivers/perf/arm_pmuv3.c           | 95 +++++++++++++++++++++++++++++-
>  include/linux/perf/arm_pmu.h       |  1 +
>  4 files changed, 109 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
> index 2ec0e5e83fc9..9dc43242538c 100644
> --- a/arch/arm/include/asm/arm_pmuv3.h
> +++ b/arch/arm/include/asm/arm_pmuv3.h
> @@ -228,6 +228,11 @@ static inline bool kvm_set_pmuserenr(u64 val)
>  
>  static inline void kvm_vcpu_pmu_resync_el0(void) {}
>  
> +static inline bool has_vhe(void)
> +{
> +	return false;
> +}
> +

This has nothing to do with PMUv3, I'm a bit surprised to see you're
touching 32-bit ARM. Can you just gate the whole partitioning thing on
arm64?

> +static bool partition_pmu __read_mostly;
> +static u8 reserved_guest_counters __read_mostly;
> +
> +module_param(partition_pmu, bool, 0);
> +MODULE_PARM_DESC(partition_pmu,
> +		 "Partition the PMU into host and guest VM counters [y/n]");
> +
> +module_param(reserved_guest_counters, byte, 0);
> +MODULE_PARM_DESC(reserved_guest_counters,
> +		 "How many counters to reserve for guest VMs [0-$NR_COUNTERS]");
> +

This is confusing and not what we discussed offline.

Please use a single parameter that describes the number of counters used
by the *host*. This affects the *host* PMU driver, KVM can discover (and
use) the leftovers.

If the single module parameter goes unspecified the user did not ask for
PMU partitioning.

> +/**
> + * armv8pmu_reservation_is_valid() - Determine if reservation is allowed
> + * @guest_counters: Number of host counters to reserve
> + *
> + * Determine if the number of host counters in the argument is
> + * allowed. It is allowed if it will produce a valid value for
> + * register field MDCR_EL2.HPMN.
> + *
> + * Return: True if reservation allowed, false otherwise
> + */
> +static bool armv8pmu_reservation_is_valid(u8 guest_counters)
> +{
> +	return guest_counters <= armv8pmu_pmcr_n_read();
> +}
> +
> +/**
> + * armv8pmu_partition_supported() - Determine if partitioning is possible
> + *
> + * Partitioning is only supported in VHE mode (with PMUv3, assumed
> + * since we are in the PMUv3 driver)
> + *
> + * Return: True if partitioning is possible, false otherwise
> + */
> +static bool armv8pmu_partition_supported(void)
> +{
> +	return has_vhe();
> +}
> +
> +/**
> + * armv8pmu_partition() - Partition the PMU
> + * @pmu: Pointer to pmu being partitioned
> + * @guest_counters: Number of host counters to reserve
> + *
> + * Partition the given PMU by taking a number of host counters to
> + * reserve and, if it is a valid reservation, recording the
> + * corresponding HPMN value in the hpmn field of the PMU and clearing
> + * the guest-reserved counters from the counter mask.
> + *
> + * Passing 0 for @guest_counters has the effect of disabling partitioning.
> + *
> + * Return: 0 on success, -ERROR otherwise
> + */
> +static int armv8pmu_partition(struct arm_pmu *pmu, u8 guest_counters)
> +{
> +	u8 nr_counters;
> +	u8 hpmn;
> +
> +	if (!armv8pmu_reservation_is_valid(guest_counters))
> +		return -EINVAL;
> +
> +	nr_counters = armv8pmu_pmcr_n_read();
> +	hpmn = guest_counters;
> +
> +	pmu->hpmn_max = hpmn;

I'm not sure the host driver needs this for anything, KVM just needs to
know what's potentially in use by the host.

> +	/* Inform host driver of available counters */

... said the driver to itself :)

Thanks,
Oliver

