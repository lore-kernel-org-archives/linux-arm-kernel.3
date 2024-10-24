Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2F3D2C56C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sgpI3T0x2L4T7NxnPqedwkXrLcP1i7Y217zyfpmX0A=; b=LJovYxdgMzMP/LW75c+8Aqyv8D
	/v0y6GawliPfo7i0XmuHWcmcbg97qoRkeF3r0dgfaCedOERa+uOvPZU2URFPkNSjn4mJA0m0dngPy
	gq0Mj+PIAcpDImQEDm43wdhsCbT8vVLV1bA+T/W5uDCZnDrz6TDe1EYA1DpuSE/ILVWLSkKmDAABf
	8a5nRrN0RycDls5Tyl+oiJfMNn1yh2jVESCkAaAIP3DZD2M0OnUB3tjtxipVNQPuvkMFGvrneny8H
	UvaAOTR/5igwtAC/4otZUcu0tRI0w4djMvf+p74BlHMy8Y2Ob+0DlzSYtPw4yPl7OQ9X4X4rWaK/v
	i8q/3zIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vOP-000000007RO-1iaQ;
	Thu, 24 Oct 2024 10:48:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vG4-0000000061b-3Rc8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A6DF5C5F4E;
	Thu, 24 Oct 2024 10:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B4DC4CEC7;
	Thu, 24 Oct 2024 10:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729766399;
	bh=mD1dTKNh8myCfdf1+kBM7oiCZXQEoZyzkuOrn42wznQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MN4SNXikIhlOQaS9kUWu2EpKpdzQwMwH85Ho4w7gGgT2KzMXWfw3Nw65cyk4LA7hf
	 qvQnA6XiUyghZDuikoyV5RgKDDTbjR0/NI2vjg4PqfBQhyXzY3Dz3Nmc2tEkWUv8Nc
	 3g8+tgojONU897SYGPZ1+oFsYJ+wA/3QlVKulIvQDg/98loH0wXhy9fWlG08drIDBN
	 4k06mAgTX29Bw1fE2W0GKly/ViXkjghOOtCsxdS/56gTNr0RYrj/ILHs2dacWsbgZ7
	 5XL/WSt2mtvGiTlDI4l1Vd0SKYqP698beehuaypdgQArWUj8DaFBKPTi5Lk6KxXSrv
	 zbDFe32AyyzCA==
Date: Thu, 24 Oct 2024 11:39:54 +0100
From: Will Deacon <will@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf/arm_pmuv3: Add PMUv3.9 per counter EL0 access
 control
Message-ID: <20241024103953.GA30206@willie-the-truck>
References: <20241002184326.1105499-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002184326.1105499-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_034000_972442_E73FD956 
X-CRM114-Status: GOOD (  24.04  )
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

On Wed, Oct 02, 2024 at 01:43:24PM -0500, Rob Herring (Arm) wrote:
> Armv8.9/9.4 PMUv3.9 adds per counter EL0 access controls. Per counter
> access is enabled with the UEN bit in PMUSERENR_EL1 register. Individual
> counters are enabled/disabled in the PMUACR_EL1 register. When UEN is
> set, the CR/ER bits control EL0 write access and must be set to disable
> write access.
> 
> With the access controls, the clearing of unused counters can be
> skipped.
> 
> KVM also configures PMUSERENR_EL1 in order to trap to EL2. UEN does not
> need to be set for it since only PMUv3.5 is exposed to guests.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm/include/asm/arm_pmuv3.h   |  6 ++++++
>  arch/arm64/include/asm/arm_pmuv3.h | 10 ++++++++++
>  arch/arm64/tools/sysreg            |  8 ++++++++
>  drivers/perf/arm_pmuv3.c           | 29 +++++++++++++++++++----------
>  include/linux/perf/arm_pmuv3.h     |  1 +
>  5 files changed, 44 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
> index f63ba8986b24..d242b5e1ca0d 100644
> --- a/arch/arm/include/asm/arm_pmuv3.h
> +++ b/arch/arm/include/asm/arm_pmuv3.h
> @@ -231,6 +231,7 @@ static inline void kvm_vcpu_pmu_resync_el0(void) {}
>  #define ARMV8_PMU_DFR_VER_V3P1      0x4
>  #define ARMV8_PMU_DFR_VER_V3P4      0x5
>  #define ARMV8_PMU_DFR_VER_V3P5      0x6
> +#define ARMV8_PMU_DFR_VER_V3P9      0x9
>  #define ARMV8_PMU_DFR_VER_IMP_DEF   0xF
>  
>  static inline bool pmuv3_implemented(int pmuver)
> @@ -249,6 +250,11 @@ static inline bool is_pmuv3p5(int pmuver)
>  	return pmuver >= ARMV8_PMU_DFR_VER_V3P5;
>  }
>  
> +static inline bool is_pmuv3p9(int pmuver)
> +{
> +	return pmuver >= ARMV8_PMU_DFR_VER_V3P9;
> +}
> +
>  static inline u64 read_pmceid0(void)
>  {
>  	u64 val = read_sysreg(PMCEID0);
> diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
> index 468a049bc63b..8a777dec8d88 100644
> --- a/arch/arm64/include/asm/arm_pmuv3.h
> +++ b/arch/arm64/include/asm/arm_pmuv3.h
> @@ -152,6 +152,11 @@ static inline void write_pmuserenr(u32 val)
>  	write_sysreg(val, pmuserenr_el0);
>  }
>  
> +static inline void write_pmuacr(u64 val)
> +{
> +	write_sysreg_s(val, SYS_PMUACR_EL1);
> +}
> +
>  static inline u64 read_pmceid0(void)
>  {
>  	return read_sysreg(pmceid0_el0);
> @@ -178,4 +183,9 @@ static inline bool is_pmuv3p5(int pmuver)
>  	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P5;
>  }
>  
> +static inline bool is_pmuv3p9(int pmuver)
> +{
> +	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P9;
> +}
> +
>  #endif
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 8d637ac4b7c6..74fb5af91d4f 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -1238,6 +1238,7 @@ UnsignedEnum	11:8	PMUVer
>  	0b0110	V3P5
>  	0b0111	V3P7
>  	0b1000	V3P8
> +	0b1001	V3P9
>  	0b1111	IMP_DEF
>  EndEnum
>  UnsignedEnum	7:4	TraceVer
> @@ -2178,6 +2179,13 @@ Field	4	P
>  Field	3:0	ALIGN
>  EndSysreg
>  
> +Sysreg	PMUACR_EL1	3	0	9	14	4
> +Res0	63:33
> +Field	32	F0
> +Field	31	C
> +Field	30:0	P
> +EndSysreg
> +
>  Sysreg	PMSELR_EL0	3	3	9	12	5
>  Res0	63:5
>  Field	4:0	SEL
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 0afe02f879b4..bb93d32b86ea 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -770,18 +770,27 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
>  	int i;
>  	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
>  
> -	/* Clear any unused counters to avoid leaking their contents */
> -	for_each_andnot_bit(i, cpu_pmu->cntr_mask, cpuc->used_mask,
> -			    ARMPMU_MAX_HWEVENTS) {
> -		if (i == ARMV8_PMU_CYCLE_IDX)
> -			write_pmccntr(0);
> -		else if (i == ARMV8_PMU_INSTR_IDX)
> -			write_pmicntr(0);
> -		else
> -			armv8pmu_write_evcntr(i, 0);
> +	if (is_pmuv3p9(cpu_pmu->pmuver)) {
> +		u64 mask = 0;
> +		for_each_set_bit(i, cpuc->used_mask, ARMPMU_MAX_HWEVENTS) {
> +			if (armv8pmu_event_has_user_read(cpuc->events[i]))
> +				mask |= BIT(i);
> +		}
> +		write_pmuacr(mask);

Since this is a new register, should we be zeroing it as part of our
reset callback?

Will

