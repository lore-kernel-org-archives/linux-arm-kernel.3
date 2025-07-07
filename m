Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F9AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PapJhVSx7IcQDSM+TeUXlADsIscgxWH3CSKjJfukQns=; b=znVEq+h1imNdwWoZcCCdqfXfWa
	tspOwwh7hbbjBiIg/309+c9IAtnVK+jjfm5fbLQLGcbvkogf/IOTCPRfx7EF3rATtDAtLhjI57rbK
	FX51sHACgDB8bZ3ScQe59TvVA7MuuYkGGgH39iELcm/eIA45bK5Zh9UoZus6SwLEfUC8Xhk8iOqtl
	UBZCRjvuDM+kP6iWJ05B1ondAMiqSRzjnThAhqRersokDL8LTEXfozoOkV3yn2DZ0g71wasg1hAcH
	FEcaJjyjkVjeNRZPfELD2CJZMtWsjCUrXcyAhVCuhK5TBZnHG9xrprqkyy2GgPX7F9cdj+mzCGRDb
	v5aw74Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqHD-00000003Fl3-1Nbv;
	Mon, 07 Jul 2025 18:09:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpAz-000000036JM-1d4R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:58:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 405C6168F;
	Mon,  7 Jul 2025 09:58:32 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 093CC3F66E;
	Mon,  7 Jul 2025 09:58:40 -0700 (PDT)
Date: Mon, 7 Jul 2025 17:58:38 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 07/22] perf: arm_pmuv3: Generalize counter bitmasks
Message-ID: <aGv8vgrZTET0aXjQ@J2N7QTR9R3>
References: <20250626200459.1153955-1-coltonlewis@google.com>
 <20250626200459.1153955-8-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626200459.1153955-8-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_095845_470192_547F76AD 
X-CRM114-Status: GOOD (  17.74  )
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

On Thu, Jun 26, 2025 at 08:04:43PM +0000, Colton Lewis wrote:
> The OVSR bitmasks are valid for enable and interrupt registers as well as
> overflow registers. Generalize the names.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>

FWIW, this looks fine to me, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  drivers/perf/arm_pmuv3.c       |  4 ++--
>  include/linux/perf/arm_pmuv3.h | 14 +++++++-------
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 6358de6c9fab..3bc016afea34 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -513,7 +513,7 @@ static u64 armv8pmu_pmcr_n_read(void)
>  
>  static int armv8pmu_has_overflowed(u64 pmovsr)
>  {
> -	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
> +	return !!(pmovsr & ARMV8_PMU_CNT_MASK_ALL);
>  }
>  
>  static int armv8pmu_counter_has_overflowed(u64 pmnc, int idx)
> @@ -749,7 +749,7 @@ static u64 armv8pmu_getreset_flags(void)
>  	value = read_pmovsclr();
>  
>  	/* Write to clear flags */
> -	value &= ARMV8_PMU_OVERFLOWED_MASK;
> +	value &= ARMV8_PMU_CNT_MASK_ALL;
>  	write_pmovsclr(value);
>  
>  	return value;
> diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
> index d698efba28a2..fd2a34b4a64d 100644
> --- a/include/linux/perf/arm_pmuv3.h
> +++ b/include/linux/perf/arm_pmuv3.h
> @@ -224,14 +224,14 @@
>  				 ARMV8_PMU_PMCR_LC | ARMV8_PMU_PMCR_LP)
>  
>  /*
> - * PMOVSR: counters overflow flag status reg
> + * Counter bitmask layouts for overflow, enable, and interrupts
>   */
> -#define ARMV8_PMU_OVSR_P		GENMASK(30, 0)
> -#define ARMV8_PMU_OVSR_C		BIT(31)
> -#define ARMV8_PMU_OVSR_F		BIT_ULL(32) /* arm64 only */
> -/* Mask for writable bits is both P and C fields */
> -#define ARMV8_PMU_OVERFLOWED_MASK	(ARMV8_PMU_OVSR_P | ARMV8_PMU_OVSR_C | \
> -					ARMV8_PMU_OVSR_F)
> +#define ARMV8_PMU_CNT_MASK_P		GENMASK(30, 0)
> +#define ARMV8_PMU_CNT_MASK_C		BIT(31)
> +#define ARMV8_PMU_CNT_MASK_F		BIT_ULL(32) /* arm64 only */
> +#define ARMV8_PMU_CNT_MASK_ALL		(ARMV8_PMU_CNT_MASK_P | \
> +					 ARMV8_PMU_CNT_MASK_C | \
> +					 ARMV8_PMU_CNT_MASK_F)
>  
>  /*
>   * PMXEVTYPER: Event selection reg
> -- 
> 2.50.0.727.gbf7dc18ff4-goog
> 

