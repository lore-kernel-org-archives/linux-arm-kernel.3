Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831CAC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 13:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlzJ7OqVnSYFcGsvn6hw98wKPBswIcyCPnPIRgWwcr8=; b=kZRP/lf4T+ViSlwI/p7Ie3+4V/
	VxXGDhqku7h1LfsudDqYWx1TIT3eLxelIN0xRAqjETtVStN2/o75E2rYbEahDir+m/wais8XCEOVP
	pxHEsNylklVdHHeL1OjI9gAC9hJ1Js9/WBQyBilDUurMgAe6xKgDdfcUGyUFtGTkOYGUJFwXoUUSc
	Jl5XccsRGN2WqXhlDWd8Es/sBid5HlOz1AF1FT4rfvd6P9FH6g7WdA/UWn6romMTLp5KNZRAWLYYv
	kXD0u24VxJJXtFB8XLhpdLs/30Peddtwpitn6qRmEIQMpv9PDTdFJQ3zAo64xcnUy0QS8afVFvnsS
	WF3dj+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUQt-0000000GfKr-2XO8;
	Mon, 24 Aug 2026 13:09:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUQr-0000000GfKl-3qVx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 13:09:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A27F40A90;
	Mon, 24 Aug 2026 13:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356731F000E9;
	Mon, 24 Aug 2026 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787576985;
	bh=OlzJ7OqVnSYFcGsvn6hw98wKPBswIcyCPnPIRgWwcr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JBE8sGwWi5IYI/fZv3pG+Y0XyRHrjiaEye7JXAjA9gyMGYl/AQZSlRB2b7xJIcxFN
	 ttahjaPYiljdsrSiy7V8tIfZn+Zj8HC2UtaPUTMV7/3kH2eZ0wfSkgyEjZDZA2hnI0
	 I40T4m1XmhMKUdcC3V0MRVhlBE8DYTcK17ROhv2O3Uz8Jl8yeel10RKLMYZzRjyG44
	 UUvHADaDLB6T3zr6UJHeLoN0wlL4N0Fn5fGrCf6am6+7uNjCYSruZjrVLb0RHHfN4X
	 jLS0Jfw8c2CD+byqg5i0eHtiZhWZxSNfk3PhX6NmBFOLGd2gWh15Y3wTLLXT402nFc
	 vxK+KKt6Sm7hw==
Date: Mon, 24 Aug 2026 14:09:39 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2] arm64: Defer the GMID_EL1 read to
 {init,update}_cpu_features()
Message-ID: <aoxCk5lFQv6lFwHQ@willie-the-truck>
References: <20260824071004.504894-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824071004.504894-1-fuad.tabba@linux.dev>
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

On Mon, Aug 24, 2026 at 08:10:04AM +0100, Fuad Tabba wrote:
> __cpuinfo_store_cpu() gates the GMID_EL1 read on the raw
> ID_AA64PFR1_EL1, so it reads the register on MTE hardware even when the
> kernel has disabled MTE (CONFIG_ARM64_MTE=n or arm64.nomte). KVM sets
> HCR_EL2.TID5 in that case, which traps the read to EL2 and injects an
> UNDEF:
> 
>   Internal error: Oops - Undefined instruction: 0000000002000000 [#1]
>   pc : __cpuinfo_store_cpu+0xf4/0x264
>   Call trace:
>    __cpuinfo_store_cpu+0xf4/0x264 (P)
>    secondary_start_kernel+0xc8/0x1d0
>    __secondary_switched+0xc0/0xc4
>   Kernel panic - not syncing: Attempted to kill the idle task!
> 
> Only pKVM is affected, and only for a CPU that is offlined and brought
> back online. Every CPU's first bring-up precedes KVM's initcall, and
> pKVM refuses CPU_ON for a CPU that was not online when KVM initialised,
> so hotplug is the only path to cpuinfo_store_cpu() with TID5 set. pKVM's
> PSCI CPU_ON relay sets the host HCR before the CPU enters EL1, whereas
> plain nVHE sets it at CPUHP_AP_KVM_ONLINE, after cpuinfo_store_cpu().
> 
> Defer the read to {init,update}_cpu_features() and gate it on the
> sanitised ID register, as MPAM already does. system_supports_mte()
> cannot serve as the gate, as update_cpu_features() also runs during
> initial SMP bring-up, before smp_cpus_done() calls
> setup_system_features(). The init path gains the CONFIG_ARM64_MTE test
> the update path already had, leaving SYS_GMID_EL1 uninitialised when
> MTE is compiled out, where its only other user (lib/mte.S) is not
> built.
> 
> Fixes: f35abcbb8a084 ("KVM: arm64: Trap MTE access and discovery when MTE is disabled")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---

[...]

> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index d50e2a9b066b3..c8967f185e3dd 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -502,12 +502,14 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
>  	info->reg_id_aa64smfr0 = read_cpuid(ID_AA64SMFR0_EL1);
>  	info->reg_id_aa64fpfr0 = read_cpuid(ID_AA64FPFR0_EL1);
>  
> -	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
> -		info->reg_gmid = read_cpuid(GMID_EL1);
> -
>  	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
>  		__cpuinfo_store_cpu_32bit(&info->aarch32);
>  
> +	/*
> +	 * info->reg_gmid deferred to {init,update}_cpu_features because
> +	 * reading it traps to EL2 when MTE is disabled.
> +	 */

I don't think we should defer this, as I've been actively doing the
opposite for parallel CPU onlining (where the ID registers can be read
concurrently by incoming CPUs to amortise the cost of a trap) and also
for the RNG traps during early boot:

https://lore.kernel.org/all/annJ0oDB2HObQC5j@willie-the-truck/

If you look at the diff I sent in the thread above (I didn't get a
reply), the idea is that __read_sysreg_by_encoding() reads from the ID
register values stashed by cpuinfo_store_cpu(). So you could use that
to check id_aa64pfr1 before reading gmid, as it will give you the
sanitised view.

The only snag is that I didn't convert all the registers over, so
there's some work there.

WDYT?

Will

