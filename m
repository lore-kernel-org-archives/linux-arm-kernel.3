Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718FFC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zC7eAhDlNrYkTxhODTTpYL33+TbjyH7/GlX2hOaaZfE=; b=2M6i57AW82qeBmS5k5VjZ+agIw
	HcfBGXsHBTV3blzc88MJHc56N5mIyvMMvzDtC09sf5gcGIXokBaJJH9kfOsEw2Zyo/nBBGVUcDT3q
	xE5ThesdsSWBOydAHxh7LGDF/tdPmbQGJPZFfM9WkZQAq5AmVHQZAv5lf4tvLUoL8wXcbKVn2qgF8
	U31Iqpe/GpSK8pN7KIXuMyPC/QLCDuLblX7RFli3aIbW+Y0h2dpU1DmIgPeTKlJVJkC+CW5ifDThT
	17iM1M5o3w/JlTZQ1GNdoOoyv3BdZ3jifK6QO9R50Y0NYuPOm5+pUJQ5xXNbSlA7ksq1AeeD9yqbz
	6rZ1zQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9DI-0000000FaJf-3h8M;
	Fri, 24 Jul 2026 06:16:52 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9DG-0000000FaJI-3kBv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784873809; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=zC7eAhDlNrYkTxhODTTpYL33+TbjyH7/GlX2hOaaZfE=;
	b=DfvfZgxusdprwBLu1yQlmk6HDlqgWHUF5yYQaacG5jM8M50V6OFESshDwYDN2hP6siD8SpuZVIdl+37/WobmPPuPZ6EGBUWNAfFcp1xDqvpMzCV3lZPwSbrcr8A+xcnwOysGoAzLHbSAEFN/MZjzEfsInLvg8/I4qmYQdh4FATQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7iD4Pd_1784873806;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X7iD4Pd_1784873806 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jul 2026 14:16:46 +0800
Date: Fri, 24 Jul 2026 14:16:46 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 20/28] KVM: arm64: Add sanitisation for NVHCR_EL2
Message-ID: <vtyzpvpqv2fbzldllzcbsks3sd7ktkwwylatmeeibfmchqydyh@pxhok4n4mswr>
References: <20260722074234.3330999-1-maz@kernel.org>
 <20260722074234.3330999-21-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722074234.3330999-21-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_231651_107168_592E68A0 
X-CRM114-Status: GOOD (  18.32  )
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

On Wed, Jul 22, 2026 at 08:42:26AM +0800, Marc Zyngier wrote:
> Just like any other VNCR-based register, NVHCR_EL2 requires some
> level of sanitisation. Being specified as a live copy of HCR_EL2,
> it adopts the exact same format, but depends on FEAT_NV3 instead.
>
> A subtle aspect is that we only want to apply the sanitisation if
> FEAT_NV3 is actually present, as the VNCR location is otherwise
> used to back accesses to HCR_EL2.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/config.c | 15 +++++++++++++++
>  arch/arm64/kvm/nested.c |  4 ++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 467f57eb8e6bb..1053676551aff 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -1019,6 +1019,9 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
>  static const DECLARE_FEAT_MAP(hcr_desc, HCR_EL2,
>  			      hcr_feat_map, FEAT_AA64EL2);
>
> +static const DECLARE_FEAT_MAP(nvhcr_desc, NVHCR_EL2,
> +			      hcr_feat_map, FEAT_NV3);
> +
>  static const struct reg_bits_to_feat_map sctlr2_feat_map[] = {
>  	NEEDS_FEAT(SCTLR2_EL1_NMEA	|
>  		   SCTLR2_EL1_EASE,
> @@ -1393,6 +1396,7 @@ void __init check_feature_map(void)
>  	check_reg_desc(&hdfgwtr2_desc);
>  	check_reg_desc(&hcrx_desc);
>  	check_reg_desc(&hcr_desc);
> +	check_reg_desc(&nvhcr_desc);
>  	check_reg_desc(&sctlr2_desc);
>  	check_reg_desc(&tcr2_el2_desc);
>  	check_reg_desc(&sctlr_el1_desc);
> @@ -1592,6 +1596,17 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
>  	case HCR_EL2:
>  		resx = compute_reg_resx_bits(kvm, &hcr_desc, 0, 0);
>  		break;
> +	case NVHCR_EL2:
> +		/*
> +		 * Only apply sanitisation if we do have FEAT_NV3.
> +		 * Otherwise, the register aliases with HCR_EL2 in VNCR,
> +		 * and we're better off relying on data transfers between
> +		 * NVHCR_EL2 and HCR_EL2 to sanitise things.
> +		 */
> +		resx = (kvm_has_nv3(kvm) ?
> +			compute_reg_resx_bits(kvm, &nvhcr_desc, 0, 0) :
> +			(typeof(resx)){});
> +		break;

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>  	case SCTLR2_EL1:
>  	case SCTLR2_EL2:
>  		resx = compute_reg_resx_bits(kvm, &sctlr2_desc, 0, 0);
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 35a1c42ad3f84..f646894fec9a9 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1830,6 +1830,10 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
>  	resx = get_reg_fixed_bits(kvm, HCR_EL2);
>  	set_sysreg_masks(kvm, HCR_EL2, resx);
>
> +	/* NVHCR_EL2 */
> +	resx = get_reg_fixed_bits(kvm, NVHCR_EL2);
> +	set_sysreg_masks(kvm, NVHCR_EL2, resx);
> +
>  	/* HCRX_EL2 */
>  	resx = get_reg_fixed_bits(kvm, HCRX_EL2);
>  	set_sysreg_masks(kvm, HCRX_EL2, resx);
> --
> 2.47.3

