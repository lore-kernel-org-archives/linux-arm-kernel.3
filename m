Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F385C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 13:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyGvUlX3nhvqwIijBCAMkxyNhwchTriV8JeIHCuQDlc=; b=OiJLlhggSmqwnXqBO+J2bDuxEm
	CofMHX3lqqc+Zto4qZtHNl2zP/rEdt/D4LHE/fLuKn2UoMecnDyM6RY2Ry+Qd2fO7wND6Ay4SejtV
	FY/yc9oSoLHZc69b6FWu6EBQpDhSrULC251pwNY5u3u6uiSJtmI83Vi0umaWGzEofHbuSte32+YW8
	axTZtJWMs2TAvQXyCbbSPf87ULOb5nKvhWlGl4IYx03PbRxJWJ9UWcQRydvyvlwhDPZvRVzoj3loA
	qMOg81CcwgrWi6a5kGU0R3EJBg1lSG7E82mU+JtPdQUGtb6YV+sBX1mUjkG+bnInwgDMwCKg6w8vX
	sIYA8d2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclYC-0000000Cjml-0s6P;
	Fri, 18 Jul 2025 13:55:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclOv-0000000Cj1H-0anm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 13:45:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E44F5C6491;
	Fri, 18 Jul 2025 13:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27009C4CEEB;
	Fri, 18 Jul 2025 13:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752846324;
	bh=lBP1tzJtVv+ELpkrm+Hxa6Vf6Oiw3IR0Q/iMkUJvCxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6yFO+QciUODNeNc6oLaPSievka/COZ7FjdiqWTRSHbwajP52I4qTSihh2m4CKxWl
	 8SA2w9m2zLbgsQ/Bv/FY8avM/ZRklvj+spKlpRArQiSDx60NWHu8vc4ackmEf02XXg
	 tbmDZ4WPmE/nkZPceSTCKapGZutcdmi3PG1k0e/fDC/OWdrQhEtmv+PJlG73M1J+oi
	 wXOOahvXEq3dEdOeMxV8Pq4qXbqmOfAseOAvciovHfDkWucQZgL9HZP04sVsluJ6wl
	 cLxBGMyOIjqAAxjqzlvPafBuDWNHUIBMedJczxZ9HgycszXhOOK9m9SOIdDAVUO3K9
	 mH8eEr0svb//g==
Date: Fri, 18 Jul 2025 14:45:17 +0100
From: Will Deacon <will@kernel.org>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, ahomescu@google.com,
	armellel@google.com, arve@android.com, ayrton@google.com,
	qperret@google.com, sebastianene@google.com, qwandor@google.com
Subject: Re: [PATCH v7 4/5] KVM: arm64: Bump the supported version of FF-A to
 1.2
Message-ID: <aHpP7fntDQ7SMPAC@willie-the-truck>
References: <20250701-virtio-msg-ffa-v7-0-995afc3d385e@google.com>
 <20250701-virtio-msg-ffa-v7-4-995afc3d385e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-virtio-msg-ffa-v7-4-995afc3d385e@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_064525_270875_2CD14D3F 
X-CRM114-Status: GOOD (  24.17  )
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

On Tue, Jul 01, 2025 at 10:06:37PM +0000, Per Larsen via B4 Relay wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> FF-A version 1.2 introduces the DIRECT_REQ2 ABI. Bump the FF-A version
> preferred by the hypervisor as a precursor to implementing the 1.2-only
> FFA_MSG_SEND_DIRECT_REQ2 and FFA_MSG_SEND_RESP2 messaging interfaces.
> 
> We must also use SMCCC 1.2 for 64-bit SMCs if hypervisor negotiated FF-A
> 1.2, so ffa_set_retval is updated and a new function to call 64-bit smcs
> using SMCCC 1.2 with fallback to SMCCC 1.1 is introduced.
> 
> Update ffa_call_supported to mark FF-A 1.2 interfaces as unsupported
> lest they get forwarded.
> 
> Co-developed-by: Ayrton Munoz <ayrton@google.com>
> Signed-off-by: Ayrton Munoz <ayrton@google.com>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 18 ++++++++++++++----
>  include/linux/arm_ffa.h       |  1 +
>  2 files changed, 15 insertions(+), 4 deletions(-)

This patch needs to be split into smaller chunks as it's doing a number
of things in one go.

> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 5fd6474d96ae4b90d99796ee81bb36373219afc4..79d834120a3f3d26e17e9170c60012b60c6f5a5e 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -678,6 +678,13 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_NOTIFICATION_SET:
>  	case FFA_NOTIFICATION_GET:
>  	case FFA_NOTIFICATION_INFO_GET:
> +	/* Optional interfaces added in FF-A 1.2 */
> +	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
> +	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
> +	case FFA_CONSOLE_LOG:			/* Optional per 13.1: not in Table 13.1 */
> +	case FFA_PARTITION_INFO_GET_REGS:	/* Optional for virtual instances per 13.1 */
> +	/* Unsupported interfaces added in FF-A 1.2 */
> +	case FFA_EL3_INTR_HANDLE:		/* Only valid for secure physical instances */
>  		return false;
>  	}

This could be a standalone change ^^^

>  
> @@ -734,7 +741,10 @@ static int hyp_ffa_post_init(void)
>  	if (res.a0 != FFA_SUCCESS)
>  		return -EOPNOTSUPP;
>  
> -	switch (res.a2) {
> +	if ((res.a2 & GENMASK(15, 2)) != 0 || res.a3 != 0)
> +		return -EINVAL;

Why are you checking bits a2[15:2] and a3? The spec says they MBZ,
so we shouldn't care about enforcing that. In fact, adding the check
probably means we'll fail if those bits get allocated in future.

> +
> +	switch (res.a2 & FFA_FEAT_RXTX_MIN_SZ_MASK) {

That makes sense, and can be its own patch.

>  	case FFA_FEAT_RXTX_MIN_SZ_4K:
>  		min_rxtx_sz = SZ_4K;
>  		break;
> @@ -931,7 +941,7 @@ int hyp_ffa_init(void *pages)
>  
>  	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs) {
>  		.a0 = FFA_VERSION,
> -		.a1 = FFA_VERSION_1_1,
> +		.a1 = FFA_VERSION_1_2,
>
>  	}, &res);
>  	if (res.a0 == FFA_RET_NOT_SUPPORTED)
>  		return 0;
> @@ -952,10 +962,10 @@ int hyp_ffa_init(void *pages)
>  	if (FFA_MAJOR_VERSION(res.a0) != 1)
>  		return -EOPNOTSUPP;
>  
> -	if (FFA_MINOR_VERSION(res.a0) < FFA_MINOR_VERSION(FFA_VERSION_1_1))
> +	if (FFA_MINOR_VERSION(res.a0) < FFA_MINOR_VERSION(FFA_VERSION_1_2))
>  		hyp_ffa_version = res.a0;
>  	else
> -		hyp_ffa_version = FFA_VERSION_1_1;
> +		hyp_ffa_version = FFA_VERSION_1_2;

The move to v1.2 can also be its own patch. So you end up with three in
total.

Will

