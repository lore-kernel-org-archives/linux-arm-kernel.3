Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B147C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+GaxzidZogxfQOf2BNMTZIqNz2cvmskT+zzhjMsHF8=; b=yfDPLfAGK8wPNqNSoetpZhFs9+
	BOPeV19tRruU+Wu6Fkw5Fb8hQpkiyrjFxTdSerwmrHFwjXx7O4oeCd9OgsP6qbL857GOkqA7wYIsn
	iimNt+GskSVPJwFYfkm2etBhR//GpRPQVRSpv9BTL1aqtlakdzPcFrDWOxCTN2BSDfQ2d8tFEC+zf
	nuzvKDs7iGqpVB5+qlP0g8/tD2jqRQGm2jkk6CZuSFkuoyCFJV14NV8/BfpCwo5XrIJPF2HCNphzr
	1fXG0p8oRohzeXy8XycHj96K+BAle+i6RMa2/0F3/LZNHjsZI75kimvoGoinpfHUxNTqO+pM0qXg7
	acURZ4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrD27-00000001dzb-3MM1;
	Tue, 04 Aug 2026 11:10:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrD24-00000001dz1-480P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:10:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9174D1476;
	Tue,  4 Aug 2026 04:09:57 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 823313F86F;
	Tue,  4 Aug 2026 04:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785841801; bh=b6Ze859gC7l30dPLruPru3YqgKlfkIEHUkYWKtb4HJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOMy610+Vqt6+m+Hvu3l+Z6VbEUC1b7NtZkN3G+hqPSqoLvZRkltTHX4M5VnQLzzU
	 QPEjODrCqA6gjaCYBdGW4OAzmBx4bDVRL2EDYGVbHQNN5aFdqpC65aJ0aYQMi4MBdq
	 pFOeqhLUkeCYG0HExALdBtwGVla6iYzJrvZuzvMQ=
Date: Tue, 4 Aug 2026 12:09:56 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Hyunwoo Kim <imv4bel@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 3/6] KVM: arm64: Consider SCTLR_EL2.M when mapping the L1
 VNCR page
Message-ID: <anHIhHS6INKZLnrZ@e143914.arm.com>
References: <20260801124818.366274-1-maz@kernel.org>
 <20260801124818.366274-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801124818.366274-4-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_041005_256390_83FA6519 
X-CRM114-Status: GOOD (  26.52  )
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

Another thing I forgot..

On Sat, Aug 01, 2026 at 01:48:15PM +0100, Marc Zyngier wrote:
> We record a VNCR TLB even when SCTLR_EL2.M is 0 in order to make
> our life easier. But this is not something that the architecture
> anticipate.
> 
> As a consequence, a hypervisor is free to set VNCR_EL2 to
> some PA when SCTLR_EL2.M==0, use it to run a guest which indirectly
> accesses the VNCR page, then eventually set SCTLR_EL2.M==1 with
> the same VA. Yes, this is odd, but apparently legal.
> 
> A common trick in HW is to invalidate the TLBs on SCTLR_ELx.M being
> flipped. But doing this is a not a good idea for us (we'd need to
> trap SCTLR accesses), and wouldn't scale as we nest deeper.
> 
> Instead, use the fact that the S1 MMU being off at the point of
> translation is cached in our TLB, and simply ignore it if it
> doesn't match the current MMU state.
> 
> Fixes: 2a359e072596f ("KVM: arm64: nv: Handle mapping of VNCR_EL2 at EL2")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/include/asm/kvm_nested.h | 7 +++++++
>  arch/arm64/kvm/at.c                 | 2 --
>  arch/arm64/kvm/nested.c             | 3 +++
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
> index 012d711034d17..cc48817a5bf7a 100644
> --- a/arch/arm64/include/asm/kvm_nested.h
> +++ b/arch/arm64/include/asm/kvm_nested.h
> @@ -388,6 +388,8 @@ struct s1_walk_result {
>  	bool	failed;
>  };
>  
> +#define S1_MMU_DISABLED		(-127)
> +
>  static inline void fail_s1_walk(struct s1_walk_result *wr, u8 fst, bool s1ptw)
>  {
>  	wr->fst		= fst;
> @@ -396,6 +398,11 @@ static inline void fail_s1_walk(struct s1_walk_result *wr, u8 fst, bool s1ptw)
>  	wr->failed	= true;
>  }
>  
> +static inline bool s1_mmu_disabled(struct s1_walk_result *wr)
> +{
> +	return wr->level == S1_MMU_DISABLED;
> +}
> +
>  int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
>  		       struct s1_walk_result *wr, u64 va);
>  int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa,
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index 640f2dc00a8ba..0926426b87989 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -11,8 +11,6 @@
>  #include <asm/kvm_mmu.h>
>  #include <asm/lsui.h>
>  
> -#define S1_MMU_DISABLED		(-127)
> -
>  static int get_ia_size(struct s1_walk_info *wi)
>  {
>  	return 64 - wi->txsz;
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 035cda256e2a5..d7dba02dc84fe 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1578,6 +1578,9 @@ static void kvm_map_l1_vncr(struct kvm_vcpu *vcpu)
>  	if (!vt->valid)
>  		return;
>  
> +	if (!(vcpu_read_sys_reg(vcpu, SCTLR_EL2) & SCTLR_ELx_M) != s1_mmu_disabled(&vt->wr))
> +		return;

Another thing, should we set valid=false? (Haven't really looked into
what that implies..)

Thanks,
Joey

