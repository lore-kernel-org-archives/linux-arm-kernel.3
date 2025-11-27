Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C881CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 06:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68ao8jnY/7hrInorg0kQFScLwkWgUiyORrqNpknEw0Q=; b=Mnf6hbHwJV/Z/iV4eq+aAZrt2N
	U1fYFX1h6LLdOPkYTLbXJymLXYVxrFie+6gbS97ebzIU56uvdhJ738GlN9veU/eh6LUQj8D4JRdih
	/Ghm97NKRVKW1tf21l4jr3Y2W4AhTRoZWWmMqzHaDqDAkRIGObw3Y3b7MhdfNxD2PdugzLWAS8svf
	YCHZuCxqchpAIaQtIHG/Iq1jJG7g6utNaLD332jtkeIfzxbMVBgGAuBnOkZUZctA80YpzzQvwuVJa
	KbNbndSNakx0gJmT3UKc++wTBwo9989xZOngB7h/QuRWD3P4AI1i2R62HWlnUR0zAZX6uOjS151Dq
	W0zZPRYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOV9w-0000000G1sO-2Zfo;
	Thu, 27 Nov 2025 06:07:16 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOV9t-0000000G1rv-1tmp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 06:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764223631; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=68ao8jnY/7hrInorg0kQFScLwkWgUiyORrqNpknEw0Q=;
	b=AMxy3DtyICMvurXFBaUnxDCXz9EM6YbgkwNbDGPG3IwZIHZBLfu3svhihUNWAgrolARtmV2LSDBEOQSWJDX2AIriBS7ILkQcTj58pPXP/wG0tRLb3niDCxJzIXiMaTP9RlnGoC0xK733T4d/nj42eco9hpX/JAmH+yK0N2JGOvk=
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0WtVv285_1764223628 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 27 Nov 2025 14:07:08 +0800
Date: Thu, 27 Nov 2025 14:07:08 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v2 4/5] KVM: arm64: Report optional ID register traps
 with a 0x18 syndrome
Message-ID: <dk6bwi72nwfty6qpbh2eaeubznqt74gjffas2rclrrwjn5tr6j@mjitrla3p3d7>
References: <20251126155951.1146317-1-maz@kernel.org>
 <20251126155951.1146317-5-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126155951.1146317-5-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_220713_775327_E702A7F0 
X-CRM114-Status: GOOD (  20.20  )
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

On Wed, Nov 26, 2025 at 03:59:50PM +0800, Marc Zyngier wrote:
> With FEAT_IDST, unimplemented system registers in the feature ID space
> must be reported using EC=0x18 at the closest handling EL, rather than
> with an UNDEF.
>
> Most of these system registers are always implemented thanks to their
> dependency on FEAT_AA64, except for a set of (currently) three registers:
> GMID_EL1 (depending on MTE2), CCSIDR2_EL1 (depending on FEAT_CCIDX),
> and SMIDR_EL1 (depending on SME).
>
> For these three registers, report their trap as EC=0x18 if they
> end-up trapping into KVM and that FEAT_IDST is not implemented in the
> guest. Otherwise, just make them UNDEF.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 2ca6862e935b5..7705f703e7c6d 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -82,6 +82,16 @@ static bool write_to_read_only(struct kvm_vcpu *vcpu,
>  			"sys_reg write to read-only register");
>  }
>
> +static bool idst_access(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
> +			const struct sys_reg_desc *r)
> +{
> +	if (kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR2_EL1, IDS, 0x0))

Hi Marc,

Minor: maybe beter readability if use NI instead of 0x0, just like
things in feat_nv2() below, but depends on you.

static bool feat_nv2(struct kvm *kvm)
{
	return ((kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY) &&
		 kvm_has_feat_enum(kvm, ID_AA64MMFR2_EL1, NV, NI)) ||
		kvm_has_feat(kvm, ID_AA64MMFR2_EL1, NV, NV2));
}


For others(except the "not" mentioned by Ben):

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

> +		return undef_access(vcpu, p, r);
> +
> +	kvm_inject_sync(vcpu, kvm_vcpu_get_esr(vcpu));
> +	return false;
> +}
> +
>  enum sr_loc_attr {
>  	SR_LOC_MEMORY	= 0,	  /* Register definitely in memory */
>  	SR_LOC_LOADED	= BIT(0), /* Register on CPU, unless it cannot */
> @@ -3399,9 +3409,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	{ SYS_DESC(SYS_CCSIDR_EL1), access_ccsidr },
>  	{ SYS_DESC(SYS_CLIDR_EL1), access_clidr, reset_clidr, CLIDR_EL1,
>  	  .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
> -	{ SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
> -	{ SYS_DESC(SYS_GMID_EL1), undef_access },
> -	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
> +	{ SYS_DESC(SYS_CCSIDR2_EL1), idst_access },
> +	{ SYS_DESC(SYS_GMID_EL1), idst_access },
> +	{ SYS_DESC(SYS_SMIDR_EL1), idst_access },
>  	IMPLEMENTATION_ID(AIDR_EL1, GENMASK_ULL(63, 0)),
>  	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
>  	ID_FILTERED(CTR_EL0, ctr_el0,
> --
> 2.47.3
>

