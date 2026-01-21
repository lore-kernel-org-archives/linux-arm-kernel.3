Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E737DC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 23:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baKCCT6IcJCcP+ZJd7nl3UhTQ2o4CoIB1zP8k4u5JxM=; b=bivmPJfPJyBn+pu8OPjwAsEgVp
	t531kSApuQN07xW4c9lKUj20LALp6m2DMdSqPICaO5VuC8BsuTgWSDCW+qw6yyX3lSVZD62B9iGre
	/ejX1RB3otiHZtG5jOZ7XyZEdNHOo6f7KrxcYfxLkR9P3nvexFrFn6Sa6Vdz01eScx7MTQAJN3zJj
	iaW7vq9+pzJmBFH1cR/EWJWHuVDo+PXlaEF3serEhNg1lMAsoNVBhuD3JzNdgWZQQ94o8S/C8VeHs
	QVKXMVeukQxL0E3bTKJmWTRZO5wuc8GDABCRGxK0iGeFz8RU6u/jXYUbNE1tBME/Y0FrZdOcrEtUl
	Wqw4FFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihgK-00000006BBC-2NFR;
	Wed, 21 Jan 2026 23:32:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihgI-00000006BAq-3SMN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 23:32:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 083F84176B;
	Wed, 21 Jan 2026 23:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8A6C4CEF1;
	Wed, 21 Jan 2026 23:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769038329;
	bh=nkvchCcqQhAAmS8zGkyfFLYiFbzKmdwcZy36WJKOnTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5QIBB47jUpqq11SfeZHWLtxbdvAc23J4MyRuKt6xZg2GJaG/AV/K+R/V13BJT1PD
	 F/vxCKLlutlfJJ4pWuv0fXK9Og/pGhxYd37c0cAe8wTG/UeSMmxjg2Rkb72TsVeDxk
	 nRILcxpnUhD0kpOc/bNcJ+lBjo9iX+P2JHykg90vTAkZI82b5Fbt1FHjLoJFNiL10Z
	 3RHscnBl/3fwxVJetTPNpnRP8PZk0tbEJyauBYu4+IosVXcnyhmgoHBVZvT9HpvpVM
	 rCHcYOW76iqah73IVuqdqyNTK/R6dMWxc7u6QLAYYGf8h6b5LCW29mktFc4Y+ficZ1
	 JSNgClFkU62Xg==
Date: Wed, 21 Jan 2026 16:32:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 4/6] KVM: arm64: Account for RES1 bits in
 DECLARE_FEAT_MAP() and co
Message-ID: <20260121233204.GA1507843@ax162>
References: <20251210173024.561160-1-maz@kernel.org>
 <20251210173024.561160-5-maz@kernel.org>
 <20260120211558.GA834868@ax162>
 <86zf67b5oa.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zf67b5oa.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_153210_906900_0FEFE89F 
X-CRM114-Status: GOOD (  27.72  )
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

On Wed, Jan 21, 2026 at 10:50:45AM +0000, Marc Zyngier wrote:
> Let me guess: Cortex-A72 or similarly ancient ARM-designed CPUs, as
> hinted by the lack of GICv3 TDIR control? Then these do not have
> FEAT_FGT.

Yeah, Cortex-A72 for the one box and an Ampere Altra Q80-26 (which I
believe is Neoverse-N1 cores?), so indeed, no FGT it seems.

> The issue stems from the fact that as an optimisation, we skip the
> parsing of the FGT trap table on such hardware, which also results in
> the FGT masks of known bits not being updated. We then compute the
> effective feature map, and discover that the two don't match.
> 
> It was harmless so far, as we were only dealing with RES0 bits, and
> assuming that anything that wasn't a RES0 bit was a stateful bit. With
> the introduction of RES1 handling, we've run out of luck. To be clear,
> that's just a warning, not a functional issue.
> 
> At this point, I don't think the above "optimisation" is worth having.
> This is only done *once*, at boot time, so the gain is extremely
> small. I'd like the checks to be effective irrespective of the HW the
> kernel runs on, which is consistent with what we do for other tables
> describing the architectural state.
> 
> Anyway, I came up with the following hack, which performs the checks,
> but avoid inserting the FGT information in the sysreg xarray if the HW
> doesn't support it, as a memory saving measure. Please let me know if
> that helps (it does on my old boxes).

Works for me as well, no warnings on either box with this patch applied.
If it is useful for a follow up submission:

Tested-by: Nathan Chancellor <nathan@kernel.org>

> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 88336336efc9f..fa8fa09de67dc 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2284,9 +2284,6 @@ int __init populate_nv_trap_config(void)
>  	kvm_info("nv: %ld coarse grained trap handlers\n",
>  		 ARRAY_SIZE(encoding_to_cgt));
>  
> -	if (!cpus_have_final_cap(ARM64_HAS_FGT))
> -		goto check_mcb;
> -
>  	for (int i = 0; i < ARRAY_SIZE(encoding_to_fgt); i++) {
>  		const struct encoding_to_trap_config *fgt = &encoding_to_fgt[i];
>  		union trap_config tc;
> @@ -2306,6 +2303,15 @@ int __init populate_nv_trap_config(void)
>  			}
>  
>  			tc.val |= fgt->tc.val;
> +
> +			if (!aggregate_fgt(tc)) {
> +				ret = -EINVAL;
> +				print_nv_trap_error(fgt, "FGT bit is reserved", ret);
> +			}
> +
> +			if (!cpus_have_final_cap(ARM64_HAS_FGT))
> +				continue;
> +
>  			prev = xa_store(&sr_forward_xa, enc,
>  					xa_mk_value(tc.val), GFP_KERNEL);
>  
> @@ -2313,11 +2319,6 @@ int __init populate_nv_trap_config(void)
>  				ret = xa_err(prev);
>  				print_nv_trap_error(fgt, "Failed FGT insertion", ret);
>  			}
> -
> -			if (!aggregate_fgt(tc)) {
> -				ret = -EINVAL;
> -				print_nv_trap_error(fgt, "FGT bit is reserved", ret);
> -			}
>  		}
>  	}
>  
> @@ -2333,7 +2334,6 @@ int __init populate_nv_trap_config(void)
>  	kvm_info("nv: %ld fine grained trap handlers\n",
>  		 ARRAY_SIZE(encoding_to_fgt));
>  
> -check_mcb:
>  	for (int id = __MULTIPLE_CONTROL_BITS__; id < __COMPLEX_CONDITIONS__; id++) {
>  		const enum cgt_group_id *cgids;
>  
> 
> -- 
> Without deviation from the norm, progress is not possible.

