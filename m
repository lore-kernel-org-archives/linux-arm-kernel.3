Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A889D10375
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 05:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8n0RK31A+ec3zN8vE8zvo+3qlTZfSr6qORtM7xzltbs=; b=hfp/UCgkZ/HCKcfhkVCLrrMjER
	NDXUqI/ODouYlXAKHH/FULMvLSx1aQDjMTU4DFYik0jBKNtbf3rkugd6fnZ1L2YUy+mwQnN2PsIYY
	aNVN2Gnrcsg9wmZ6eKItCOOdywfiAFOPRM3kxgmY41G5kAq+m2h+1vGUvSHTADs/wII0gox8PsiOC
	OahItPDx/bFaVYWWQ/sJjB+E2BvNUyP49DeeUuP9c9edcbKaKAFiQx2USeA8uGcU7LEpBem8j8oUC
	3/VNt6RE4HA8/WB8YcVFjuC5QTlOxDwIrp7QYdH8pR5JtDyV2nMAPtt+0NhakG/SDsCOnl3+KQPPk
	uLGHP6iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOUw3-0000000G0tP-3qZR;
	Thu, 27 Nov 2025 05:52:55 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOUw0-0000000G0sI-3Egf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 05:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764222765; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=8n0RK31A+ec3zN8vE8zvo+3qlTZfSr6qORtM7xzltbs=;
	b=FQM7sMR1qMRBKETlINuu+HDjTug1EUO6Du6L79YnyKE9sOnVfk+mG7YSfn7Xiim348dp/M7Ms08PwgXX4rw0iMTE5b4cJbTy+g7mUOKwMeLYdYHyqdGaboj4zXKJxjnU2kizqdApnucru0BmI3t68iC24gRisKAl6Ns9SKYaisI=
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0WtW0l1z_1764222762 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 27 Nov 2025 13:52:43 +0800
Date: Thu, 27 Nov 2025 13:52:42 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v2 2/5] KVM: arm64: Force trap of GMID_EL1 when the guest
 doesn't have MTE
Message-ID: <itxexyotztmtvuvcbs4wjcdod3tfpufqe5t2gmz6vyky3vtihs@a3atxxjadgfq>
References: <20251126155951.1146317-1-maz@kernel.org>
 <20251126155951.1146317-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126155951.1146317-3-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_215253_051061_B992D058 
X-CRM114-Status: GOOD (  13.44  )
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

Hi Marc,

On Wed, Nov 26, 2025 at 03:59:48PM +0800, Marc Zyngier wrote:
> If our host has MTE, but the guest doesn't, make sure we set HCR_EL2.TID5
> to force GMID_EL1 being trapped.
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 9e4c46fbfd802..2ca6862e935b5 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -5561,6 +5561,8 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
>
>  	if (kvm_has_mte(vcpu->kvm))
>  		vcpu->arch.hcr_el2 |= HCR_ATA;
> +	else if (id_aa64pfr1_mte(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1)))
> +		vcpu->arch.hcr_el2 |= HCR_TID5;

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>
>  	/*
>  	 * In the absence of FGT, we cannot independently trap TLBI
> --
> 2.47.3
>

