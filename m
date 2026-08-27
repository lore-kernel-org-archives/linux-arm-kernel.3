Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472A5C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 12:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84D7JGfn3OSGzXIWSGTcG//xl0whJ+rapCqk+y7kxGM=; b=taoVT5UAwABsyOHkPyciM95Kzt
	OZuxab7q7FE8RWTydNVyd/zv8ZNbu6Z7CHN/KBuah5DRKVE0+Vt6sKwihFPMg9zV7IS4wf/FMwcLe
	3QS3zXlB51wOYxgNFD87G8hwQRg5c5XbZwTUq3QeE3DgjXfCCmDo3ThWeoc5Mt+NMRGdTMT3eYaKR
	8CqHaZ2UTc+pBHQ5DoyzPihfKRf/cDcMHC8g0CEiOw1+YYQfgsOKvjC5TGcoJESGQO5zvF7rveKKQ
	ZOQD7ti5k8Tiuxvfn+byMS+ddy5xgPS6oj6JJG8mK1zclCv0eGjXUXELEKHOA8s42BRst9F9PaVOj
	ZcpWlLGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZes-000000040OZ-3tCM;
	Thu, 27 Aug 2026 12:56:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZer-000000040OL-20F8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 12:56:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F41743F6D;
	Thu, 27 Aug 2026 12:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139751F00AC4;
	Thu, 27 Aug 2026 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835401;
	bh=84D7JGfn3OSGzXIWSGTcG//xl0whJ+rapCqk+y7kxGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EqdhRjO69TFsGv7z/qz2fyi5pLykZxzEtoKo0V+rVh/cnSQIBfdBnPXXribWkEPs0
	 EkPCCscmhMTXOUmeMn1BllS3Q3CL728VtQKsOw2bemkg62e0f+I128SIZ6Vb1JgxT6
	 XehR/1K2kCTwSRsrxSjqt7Z2gkJSfQMBtIzy5NUheyhMTI2WAmUBkTDN7VWXDZ/LkO
	 jcpwp3EjrvygKkh7q94ZzeHRtZJQjuFZfSOLF9BQsMjE8wNpSC8N5w1yYzDP+zFqeU
	 5+O6y6huLTq+ENkzXOy3w3ecJM04r08p4KOyRS2bEpnNA/GvhjEQV0F+3o/l7SEEue
	 u3Vtvq2qPkP+A==
Date: Thu, 27 Aug 2026 13:56:35 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v4 2/2] arm64: Don't read GMID_EL1 when MTE is disabled
Message-ID: <apA0A-bqLVBcmdSv@willie-the-truck>
References: <20260825164219.3347229-1-fuad.tabba@linux.dev>
 <20260825164219.3347229-3-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825164219.3347229-3-fuad.tabba@linux.dev>
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

On Tue, Aug 25, 2026 at 05:42:19PM +0100, Fuad Tabba wrote:
> __cpuinfo_store_cpu() gates the GMID_EL1 read on the raw
> ID_AA64PFR1_EL1, so it reads the register even when the kernel has
> disabled MTE (CONFIG_ARM64_MTE=n or arm64.nomte). KVM sets HCR_EL2.TID5
> in that case, and pKVM injects an UNDEF the host cannot handle:
> 
>   Internal error: Oops - Undefined instruction: 0000000002000000 [#1]  SMP
>   pc : __cpuinfo_store_cpu+0xf4/0x264
>   Kernel panic - not syncing: Attempted to kill the idle task!
> 
> Only pKVM reaches it, and only after a CPU is offlined and brought back
> online: its CPU_ON relay sets the host HCR before the CPU enters EL1,
> while plain nVHE sets it at CPUHP_AP_KVM_ONLINE.
> 
> Gate the read on __read_sysreg_by_encoding(), which applies the cmdline
> override, and on CONFIG_ARM64_MTE, which no register reflects.
> 
> Fixes: f35abcbb8a084 ("KVM: arm64: Trap MTE access and discovery when MTE is disabled")
> Cc: stable@vger.kernel.org # needs "arm64: Apply overrides to CPU local capabilities"
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/include/asm/cpufeature.h | 9 +++++++++
>  arch/arm64/kernel/cpufeature.c      | 6 ++----
>  arch/arm64/kernel/cpuinfo.c         | 2 +-
>  3 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index a57870fa96db5..0b374e938f708 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -1085,6 +1085,15 @@ static inline bool cpu_has_lpa2(void)
>  #endif
>  }
>  
> +/* No ID register reflects CONFIG_ARM64_MTE. */
> +static inline bool gmid_el1_accessible(void)
> +{
> +	if (!IS_ENABLED(CONFIG_ARM64_MTE))
> +		return false;
> +
> +	return id_aa64pfr1_mte(__read_sysreg_by_encoding(SYS_ID_AA64PFR1_EL1));

I'm planning to internalise __read_sysreg_by_encoding() into cpufeature.c
so I'd prefer to avoid adding another user of it, if possible. In this case,
__cpuinfo_store_cpu() has already read the thing, so all it needs is the
override logic (but see below).

> +}
> +
>  #endif /* __ASSEMBLER__ */
>  
>  #endif
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 88b15b5ef2f7f..23f174b3c4e26 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1228,7 +1228,7 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
>  		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
>  	}
>  
> -	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
> +	if (gmid_el1_accessible())
>  		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
>  }
>  
> @@ -1523,11 +1523,9 @@ void update_cpu_features(int cpu,
>  	 * they read/write depends on the GMID_EL1.BS field. Check that the
>  	 * value is the same on all CPUs.
>  	 */
> -	if (IS_ENABLED(CONFIG_ARM64_MTE) &&
> -	    id_aa64pfr1_mte(info->reg_id_aa64pfr1)) {
> +	if (gmid_el1_accessible())
>  		taint |= check_update_ftr_reg(SYS_GMID_EL1, cpu,
>  					      info->reg_gmid, boot->reg_gmid);
> -	}
>  
>  	/*
>  	 * If we don't have AArch32 at all then skip the checks entirely
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index d50e2a9b066b3..389fca84f106b 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -502,7 +502,7 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
>  	info->reg_id_aa64smfr0 = read_cpuid(ID_AA64SMFR0_EL1);
>  	info->reg_id_aa64fpfr0 = read_cpuid(ID_AA64FPFR0_EL1);
>  
> -	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
> +	if (gmid_el1_accessible())
>  		info->reg_gmid = read_cpuid(GMID_EL1);

I'm not sure this is safe. For the boot CPU, __cpuinfo_store_cpu() is
called before init_cpu_features(), so the arm64_ftr_regs[] array hasn't
been sorted and we can't call get_arm64_ftr_reg() reliably. In fact, it
doesn't even look like the overrides will have been processed.

So we're in a bit of a chicken-and-egg problem here. Perhaps we need an
early (__init) function that can apply the override manually to the
value read from hardware using arm64_ftr_safe_value(). You'll probably
need something like my old hack [1] to avoid the bsearch though :/

Will

[1] https://lore.kernel.org/all/20230110161651.GB9436@willie-the-truck/

