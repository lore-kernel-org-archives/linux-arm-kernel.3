Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27107CFA451
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6ZymKRSWALD3tr8yraYTxqfQ/UdViNz9LJ1HFkC+Vw=; b=o40u/7fGwOU3DX8x0EH09bjXwf
	J5+00lieVvXcPLa23tKBZPnmcw9JLMd4br1y+tOQkExtzzXav+s8s2cVXkaeQA0b7FahbsWEaw/VE
	nGD9DkWfuotJJkc42zPHoFTVGLMiKq8ZJ40I3sqZi8VqeKH88UN3b33WxoI9YVvSH6ZeH+Sy24X6s
	pgWh0slPpD3RBmcyqX89c9PpHLBwSdcIYd1CZywwFA4e5E0JkQ9R/UFnS4eYxcq7DsHu4wO9flMpv
	VZ4SzDnXxzHqIJy/vxB2cy62/P66nr939bOlDqB+0AELAv7rto1XVD4e0UwPt4nuou3viiJVy/MKg
	AtVVq4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3v2F-000000003iv-10jw;
	Thu, 24 Oct 2024 10:25:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uyU-000000003Bi-3YHr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:21:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83B1F339;
	Thu, 24 Oct 2024 03:22:19 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A91F53F71E;
	Thu, 24 Oct 2024 03:21:48 -0700 (PDT)
Date: Thu, 24 Oct 2024 11:21:46 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 12/37] KVM: arm64: Sanitise TCR2_EL2
Message-ID: <20241024102146.GB1382116@e124191.cambridge.arm.com>
References: <20241023145345.1613824-1-maz@kernel.org>
 <20241023145345.1613824-13-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023145345.1613824-13-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_032150_958141_048BB917 
X-CRM114-Status: GOOD (  12.87  )
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

On Wed, Oct 23, 2024 at 03:53:20PM +0100, Marc Zyngier wrote:
> TCR2_EL2 is a bag of control bits, all of which are only valid if
> certain features are present, and RES0 otherwise.
> 
> Describe these constraints and register them with the masking
> infrastructure.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/nested.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index b20b3bfb9caec..b4b3ec88399b3 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1179,6 +1179,28 @@ int kvm_init_nv_sysregs(struct kvm *kvm)
>  		res0 |= ~(res0 | res1);
>  	set_sysreg_masks(kvm, HAFGRTR_EL2, res0, res1);
>  
> +	/* TCR2_EL2 */
> +	res0 = TCR2_EL2_RES0;
> +	res1 = TCR2_EL2_RES1;
> +	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, D128, IMP))
> +		res0 |= (TCR2_EL2_DisCH0 | TCR2_EL2_DisCH1 | TCR2_EL2_D128);
> +	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, MEC, IMP))
> +		res0 |= TCR2_EL2_AMEC1 | TCR2_EL2_AMEC0;
> +	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, HAFDBS, HAFT))
> +		res0 |= TCR2_EL2_HAFT;
> +	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, THE, IMP))
> +		res0 |= TCR2_EL2_PTTWI | TCR2_EL2_PnCH;
> +	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, AIE, IMP))
> +		res0 |= TCR2_EL2_AIE;
> +	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S1POE, IMP))
> +		res0 |= TCR2_EL2_POE | TCR2_EL2_E0POE;
> +	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S1PIE, IMP))
> +		res0 |= TCR2_EL2_PIE;
> +	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, VH, IMP))
> +		res0 |= (TCR2_EL2_E0POE | TCR2_EL2_D128 |
> +			 TCR2_EL2_AMEC1 | TCR2_EL2_DisCH0 | TCR2_EL2_DisCH1);
> +	set_sysreg_masks(kvm, TCR2_EL2, res0, res1);
> +
>  	/* SCTLR_EL1 */
>  	res0 = SCTLR_EL1_RES0;
>  	res1 = SCTLR_EL1_RES1;

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

