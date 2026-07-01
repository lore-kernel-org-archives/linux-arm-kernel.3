Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E46C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bArU32dZH6f5UF8IuQnAtSTa5QhA69SwqVteecUtE6o=; b=1V+e6Zo2BW/Q/knfw5ReecKiTp
	B9PkToHhTTOLcPt0YppMlrzmnSIgtCvmjjVbK31uPSyntc0B+X1oEtMu1INalOMDF55LRktxLN5uF
	CoMAUgGQ5IAaTg1nvrN1ZvcwM/c0SEuz48PNfXiqi0F3X1NJr0fcDIA7ZckStvnamdyJ8p/Q69QiJ
	4JQwRkget8FM3L83rNNeWQPxGjfKxq4kPkw66KOuSP2dqtoas/CrjnJDNLUwvE2le0/EAWiBNYCnG
	s2RbxOLPbsDEEr1YeHenJR8eSQ5Lruax9qDMRKN4XgcSMD/sCV3NhuKoNArP51NSk5uTqpIOpTaFy
	xumEIvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4Nb-000000039Pm-49w9;
	Wed, 01 Jul 2026 23:30:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4Na-000000039PY-2LtR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 23:30:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A38A06001D;
	Wed,  1 Jul 2026 23:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D4C1F000E9;
	Wed,  1 Jul 2026 23:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782948605;
	bh=bArU32dZH6f5UF8IuQnAtSTa5QhA69SwqVteecUtE6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eBEnYSsCxJdg72eWOKTR5Rv0bJWUTRCZU9fOfcmDJxaSt+7zbmJ2FNXB8eR8dt1KS
	 iZL4lw4FbGX/6pTZRtNO9mfjU3tmDP5DP/G0EuRPuPLqdZ2dxDjZzNckB0Hqi7po2L
	 7kHtHs/lYGymzDEbci+Alz3QtLPrmL9QNdiMOOU8LKaMW/2bqjmoTYJaNbP9bsII9h
	 d0ZALwM40qqeANKijTiJoDE0miHVC9cHQ+T2SE7yMxDC4X3/OkP9HWA06AJ18flJJV
	 4SSxqvJgEb3xCpFy9Q7dUzbdsJhP5R1MNcoHEvvLN7P9QYcBjCNl3pPBX0RtsyQEv0
	 3AxOE+Cl+dR1A==
Date: Wed, 1 Jul 2026 16:30:04 -0700
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: stable@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: Treat HCR_EL2.E2H as RES1 when
 ID_AA64MMFR4_EL1.E2H0 is negative
Message-ID: <akWi_E_tQPzhlfc-@kernel.org>
References: <20260701204342.2654385-1-coltonlewis@google.com>
 <20260701204342.2654385-3-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701204342.2654385-3-coltonlewis@google.com>
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

On Wed, Jul 01, 2026 at 08:43:39PM +0000, Colton Lewis wrote:
> From: Marc Zyngier <maz@kernel.org>
> 
> [ Upstream commit 3944382fa6f22b54bc3624c9657b98ec34b5ba59 ]

What is this? I have the commit in question as

3944382fa6f22b54fd399632b1af92c28123979b

> For CPUs that have ID_AA64MMFR4_EL1.E2H0 as negative, it is important
> to avoid the boot path that sets HCR_EL2.E2H=0. Fortunately, we
> already have this path to cope with fruity CPUs.
> 
> Tweak init_el2 to look at ID_AA64MMFR4_EL1.E2H0 first.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Link: https://lore.kernel.org/r/20240122181344.258974-8-maz@kernel.org
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  arch/arm64/kernel/head.S | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index 6517bf2644a08..e32c8dd0b17a7 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -589,25 +589,32 @@ SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)
>  	mov_q	x1, INIT_SCTLR_EL1_MMU_OFF
>  
>  	/*
> -	 * Fruity CPUs seem to have HCR_EL2.E2H set to RES1,
> -	 * making it impossible to start in nVHE mode. Is that
> -	 * compliant with the architecture? Absolutely not!
> +	 * Compliant CPUs advertise their VHE-onlyness with
> +	 * ID_AA64MMFR4_EL1.E2H0 < 0. HCR_EL2.E2H can be
> +	 * RES1 in that case.
> +	 *
> +	 * Fruity CPUs seem to have HCR_EL2.E2H set to RES1, but
> +	 * don't advertise it (they predate this relaxation).
>  	 */
> +	mrs_s	x0, SYS_ID_AA64MMFR4_EL1
> +	ubfx	x0, x0, #ID_AA64MMFR4_EL1_E2H0_SHIFT, #ID_AA64MMFR4_EL1_E2H0_WIDTH
> +	tbnz	x0, #(ID_AA64MMFR4_EL1_E2H0_SHIFT + ID_AA64MMFR4_EL1_E2H0_WIDTH - 1), 1f
> +
>  	mrs	x0, hcr_el2
>  	and	x0, x0, #HCR_E2H
> -	cbz	x0, 1f
> -
> +	cbz	x0, 2f
> +1:
>  	/* Set a sane SCTLR_EL1, the VHE way */
>  	pre_disable_mmu_workaround
>  	msr_s	SYS_SCTLR_EL12, x1
>  	mov	x2, #BOOT_CPU_FLAG_E2H
> -	b	2f
> +	b	3f
>  
> -1:
> +2:
>  	pre_disable_mmu_workaround
>  	msr	sctlr_el1, x1
>  	mov	x2, xzr
> -2:
> +3:
>  	__init_el2_nvhe_prepare_eret
>  
>  	mov	w0, #BOOT_CPU_MODE_EL2
> -- 
> 2.55.0.rc2.803.g1fd1e6609c-goog
> 
> 

