Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6768C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 17:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4+IjJN1qlSPRc3VyF0clOJsZ2olktuVoEmUT+ReHko=; b=sCf0gF3ClAuea7styQ8jL1p1To
	Ah3fOt8bXzLat5krVFvT0Vzmp3+HvYEQ9zCLdUFW8DsS3Xlk5JSuoKT1zAMThQtY0UVwh0deftD/R
	N8O6xM3qVFfoXXA+yUroF+04fIL42IYhuQWnaP95qSgCWnaHsliemLNrwXt+Hj93Qhnv170CsCPNS
	mAtyry5IGMTmc9O3AyB7n9VCuyC80a7a3SH3cRV3/CPbQNH99wn1Zpe5Ae/r+ncGPo0k402u1mgXr
	F0e5Xf52/dvfBfBkZmPSD+AmAo39wLd13OACl+Uyid7Pwo1ZLnk2XO1apNVsILKP3h3jby4i4hRnf
	mLLxpBSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsO7b-00000008VQu-2j7O;
	Fri, 07 Aug 2026 17:12:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsO7a-00000008VQc-3GoB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 17:12:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 901A5600B0;
	Fri,  7 Aug 2026 17:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627051F000E9;
	Fri,  7 Aug 2026 17:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786122757;
	bh=v4+IjJN1qlSPRc3VyF0clOJsZ2olktuVoEmUT+ReHko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A1Vcj/sOmZnG0dCGiV2yUZEK8v2jcDV5hHTs0s0YBwustbktLxNxWF4zi9hCKidWy
	 PwXTwjxLOPliBCFLnRXrkIXjPxD1h6+lzt2DM5WjE06aNJqfpu+gnXnebTlE/Wba0j
	 N2A41zbcx1DHc76mHrb5S8bn8uIVlVNbXJYAD4OU665xwnt+es2RIPcNvJOR6eOvpv
	 wN8xn2rfljh5BU+J7thNqCtvhFCDe49Zd+QeYCkIHXPfrioLcbj4P0kEBtATTpoA2h
	 RCFAdvB2fkBFLGoDR/8byleU/GN0N0YvF3C3mdL4d6Supj42Zphf09PYboPh4CZHcv
	 PYu/+dZpaPVYg==
Date: Fri, 7 Aug 2026 18:12:18 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Hyunwoo Kim <imv4bel@gmail.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/8] KVM: arm64: Handle negative S1 walk levels in
 VNCR TLB size evaluation
Message-ID: <anYL8J1ejjujgp-A@lucifer>
References: <20260806091026.620700-1-maz@kernel.org>
 <20260806091026.620700-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806091026.620700-3-maz@kernel.org>
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

On Thu, Aug 06, 2026 at 10:10:20AM +0100, Marc Zyngier wrote:
> Computing the effects of a TLB invalidation involves looking at
> the size of the mapping cached by the TLB. For S1 mappings such as
> VNCR, this is deducted from the combination of the base granule size
> and the mapping level.
>
> However, this implies that the S1 MMU is *on*. When the MMU is off,
> we indicate this with the level being set to a "creative" value of
> -127 (S1_MMU_DISABLED).

:)

>
> This ends-up being misinterpreted by pgshift_level_to_ttl() as it
> doesn't handle negative levels at all (the level is immediately cast
> to a u8 and only the bottom two bits considered), leading to an
> invalidation size of 0. Not helpful.

So by two's complement -127 is ~0b01111111 + 1 = 0b10000001 = 129

And:

static u8 pgshift_level_to_ttl(u16 shift, u8 level)
{
	u8 ttl;

	... shift stuff ...

	ttl <<= 2;
	ttl |= level & 3;

	return tll;
}

So ttl |= 1 because of the mask and in ttl_to_size():

static unsigned int ttl_to_size(u8 ttl)
{
	int level = ttl & 3;
	int gran = (ttl >> 2) & 3;
	unsigned int max_size = 0;

	switch (gran) {
	case TLBI_TTL_TG_4K:
		switch (level) {
		...
		case 1:
			max_size = SZ_1G;
			break;
		...
	case TLBI_TTL_TG_16K:
		switch (level) {
		...
		case 1:
			break;
		...
	case TLBI_TTL_TG_64K:
		switch (level) {
		...
		case 1:
			/* No 52bit IPA support */
			break;
		...
	}

	return max_size;
}

So actually if granularity is TLBI_TTL_TG_4K this will return SZ_1G and 0 in the
other cases unless I'm getting something wrong here?

This is really more a 'maybe worth mentioning in the commit log to be pedantic'
kind of thing :)

IOW you could luck out before with SZ_1G for TLBI_TTL_TG_4K.

>
> Tidy-up pgshift_level_to_ttl() to handle these negative levels, and
> ttl_to_size() to always return SZ_1G when no valid TTL is present.
> This allows the removal of open-coded checks for similar situations.

I guess SZ_1G is a reasonable default here?

>
> Note that the check for a negative value not explicitely checking for

NIT: explicitely -> explicitly

> S1_MMU_DISABLED is deliberate, so that actual negative levels introduced
> with LVA2 and D128 can take the same path if we ever support them.
>
> Fixes: 7270cc9157f47 ("KVM: arm64: nv: Handle VNCR_EL2 invalidation from MMU notifiers")
> Reported-by: Hyunwoo Kim <imv4bel@gmail.com>
> Link: https://lore.kernel.org/r/ameGoxbn2wzBq2kL@v4bel
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/kvm/nested.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index f3c75954cf36c..035cda256e2a5 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -505,7 +505,7 @@ int kvm_walk_nested_s2(struct kvm_vcpu *vcpu, phys_addr_t gipa,
>  	return ret;
>  }
>
> -static unsigned int ttl_to_size(u8 ttl)
> +static unsigned int __ttl_to_size(u8 ttl)
>  {
>  	int level = ttl & 3;
>  	int gran = (ttl >> 2) & 3;
> @@ -561,10 +561,22 @@ static unsigned int ttl_to_size(u8 ttl)
>  	return max_size;
>  }
>
> -static u8 pgshift_level_to_ttl(u16 shift, u8 level)
> +static unsigned int ttl_to_size(u8 ttl)
> +{
> +	return __ttl_to_size(ttl) ?: SZ_1G;
> +}

Might be worth a comment about the default?

> +
> +static u8 pgshift_level_to_ttl(u16 shift, s8 level)
>  {
>  	u8 ttl;
>
> +	/*
> +	 * If we don't have a proper level, fallback to the maximum
> +	 * size.
> +	 */
> +	if (level < 0)
> +		return 0;
> +
>  	switch(shift) {
>  	case 12:
>  		ttl = TLBI_TTL_TG_4K;
> @@ -675,7 +687,11 @@ unsigned long compute_tlb_inval_range(struct kvm_s2_mmu *mmu, u64 val)
>  		ttl = get_guest_mapping_ttl(mmu, addr);
>  	}
>
> -	max_size = ttl_to_size(ttl);
> +	/*
> +	 * Don't use the default 1GB fallback, as we can adapt to the
> +	 * max mapping size we allow at S2.
> +	 */

Being a bit pedantic here but I wonder if simply just to say 'Adapt to the max
mapping size allowed at S2' as the fallback is inferred?

> +	max_size = __ttl_to_size(ttl);
>
>  	if (!max_size) {
>  		/* Compute the maximum extent of the invalidation */
> @@ -1124,8 +1140,6 @@ static void compute_s1_tlbi_range(struct kvm_vcpu *vcpu, u32 inst, u64 val,
>  	case OP_TLBI_VALE1OSNXS:
>  		scope->type = TLBI_VA;
>  		scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val));
> -		if (!scope->size)
> -			scope->size = SZ_1G;
>  		scope->va = tlbi_va_s1_to_va(val) & ~(scope->size - 1);
>  		scope->asid = FIELD_GET(TLBIR_ASID_MASK, val);
>  		break;
> @@ -1152,8 +1166,6 @@ static void compute_s1_tlbi_range(struct kvm_vcpu *vcpu, u32 inst, u64 val,
>  	case OP_TLBI_VAALE1OSNXS:
>  		scope->type = TLBI_VAA;
>  		scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val));
> -		if (!scope->size)
> -			scope->size = SZ_1G;

Nice that you can eliminate this and the one above!

>  		scope->va = tlbi_va_s1_to_va(val) & ~(scope->size - 1);
>  		break;
>  	case OP_TLBI_RVAE2:
> --
> 2.47.3
>

--
Cheers, Lorenzo

