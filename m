Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0079D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 11:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LhjLtXCf;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KjZbwEu/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EONOj0OHaUwSYU9N/VrCCNs20gpUnplCCd7yehPjBGA=; b=LhjLtXCfsK3VGfUO4AfpHlnEPe
	X1uCwNMrauYBDDYib0c8e1H/QCVfeUidDs6A38vLIgLRHoqWz5rwV+bEgdKJDtK+HIsrjU4qBmJJH
	ZCfA9iFiFyw8lnGKMXufzLrgAljdvReROBSItgsX4+T55OWadtZ+WZwCMDw8JEiJZfmHpLDoB07TX
	qCkHJpTcWqEjacn31ZJfC/neQvdW7pqGgkuoMOutEcqcfeeaUkaRfnJM/qXeEkwOYE8qNc/IORN4H
	7tOqbYozN6D4l4TsrxbuiO5ony/Nh7KXaYo43kXhdvjh/1qtChxFz8i2k+HC356J661u2z88EgDyM
	2rPTnmVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOQv-000000094Nu-0gRH;
	Thu, 29 Oct 2026 11:36:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOQr-000000094NZ-0SsD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 11:36:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E03931BB2;
	Thu, 29 Oct 2026 04:36:25 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F6E83F59E;
	Thu, 29 Oct 2026 04:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793273789; bh=dTGDCsCEyj7FTwEr3QOxyYhJdKuSWQypWjxORP+0gqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KjZbwEu/7pDEST1UcOZipx4PNL9nNtV9k4JfrRVNhaXNfLarV45iCTWV4XZJHtYBg
	 7Qp8V4vg0BATp9y3eKpby/88Kdy0oRFzOenzdRcLRn8qQk5gAomlm+R8fdT7xSPCqV
	 SKKx4Ybb/qFPlXDLhYwX4++/hczTt+/4/Xj4mTiw=
Date: Thu, 29 Oct 2026 11:36:17 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	James Clark <james.clark@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Thomas Huth <thuth@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: Re: [PATCH v2 3/4] KVM: arm64: Reset TCR_EL2 according to guest's
 E2H mode
Message-ID: <auMvsSOJ7canv8lh@e143914.arm.com>
References: <20260917214215.74135-1-weilin.chang@arm.com>
 <20260917214215.74135-4-weilin.chang@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917214215.74135-4-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_043633_278497_C5932B51 
X-CRM114-Status: GOOD (  19.04  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 17, 2026 at 10:42:13PM +0100, Wei-Lin Chang wrote:
> From: Marc Zyngier <maz@kernel.org>
> 
> Previously vCPU TCR_EL2's reset value didn't consider TCR_EL2's
> different formats based on the value of HCR_EL2.E2H. It always resets to
> the E2H == 0 version.
> 
> This didn't cause any problem because the bits set in the E2H == 0
> version (TCR_EL2_RES1) all reset to UNKNOWN for E2H == 1 per the
> architecture.
> 
> Still, it's better to fix it. Choose the correct reset value by checking
> KVM_ARM_VCPU_HAS_EL2_E2H0.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/sys_regs.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 44aae52c473d..62c059747fbb 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -3275,6 +3275,14 @@ static u64 reset_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
>  	return vcpu->kvm->arch.nr_pmu_counters;
>  }
>  
> +static u64 reset_tcr_el2(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
> +{
> +	__vcpu_assign_sys_reg(vcpu, r->reg,
> +			      vcpu_has_feature(vcpu, KVM_ARM_VCPU_HAS_EL2_E2H0) ?
> +			      TCR_EL2_RES1 : VHE_TCR_EL2_RES1);
> +	return __vcpu_sys_reg(vcpu, r->reg);
> +}
> +
>  /*
>   * Architected system registers.
>   * Important: Must be sorted ascending by Op0, Op1, CRn, CRm, Op2
> @@ -3853,7 +3861,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  
>  	EL2_REG(TTBR0_EL2, access_rw, reset_val, 0),
>  	EL2_REG(TTBR1_EL2, access_rw, reset_val, 0),
> -	EL2_REG(TCR_EL2, access_rw, reset_val, TCR_EL2_RES1),
> +	EL2_REG(TCR_EL2, access_rw, reset_tcr_el2, 0),
>  	EL2_REG_FILTERED(TCR2_EL2, access_rw, reset_val, TCR2_EL2_RES1,
>  			 tcr2_el2_visibility),
>  	EL2_REG_VNCR(VTTBR_EL2, reset_val, 0),
> -- 
> 2.43.0
> 

