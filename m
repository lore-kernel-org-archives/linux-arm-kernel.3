Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23724C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SlatWSaNqRKqHfFu0GCISBxqS4y13FNspQjeXz/a2Y=; b=mQFBBSYBSH6GXkqJLtBdyMXd/g
	0Z426BNNWs7oSbhqEBbYvXF3OkHeZ5+gSp7mvfj3AHkAOxvIySx86f0pnpC+xviCphSMBORHM2tLq
	8vUEQyw+U1hScdzIe+4QgdFU/rHUyiB30Q60Nt9KxougHRNdnZFP45m4ExWMwXbVUrN1cWcoV3UTJ
	E+1pfxtit7OqMatK2Tt8mApiI03ozEk5Dwn2PAjPi/GcWwD4nbIYMmrveuqV+po0TIsOh/FXzndzD
	sRv0qyOkxvQco4w+ziqH+msgYztUg0XM/I9adPDo6w3SzwmfrYUm1vlpROZa+TRy9yQbpV+VUXEVJ
	sxq2FO6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LG5-0000000CLBY-0zt4;
	Wed, 09 Sep 2026 16:34:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LG3-0000000CLA9-1TIU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:34:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3A7B1576;
	Wed,  9 Sep 2026 09:34:40 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61F703F7B4;
	Wed,  9 Sep 2026 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788971684; bh=qOUYammRv9EjNcGeEMpov2EJisgMbi2/GIrImMJBmbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ahXBd+CtAdAUGE7tnGjU8sKS/DnIy1sMSRbI6q74yb7gyVXsUmmuvleGtp1MyOK+1
	 DuxLt0Lk64FBGI7W7XSLwUbieHuQwu9R4LIhwMIFXQlSm2raAcnEFp8YnlAy8Y4+2F
	 Tnic1LYUYx9gA+9HouvrqZFLvKcYOc90ra5LMEyo=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 09/14] KVM: arm64: Allow GCS to be enabled for guests
Date: Wed,  9 Sep 2026 17:34:37 +0100
Message-ID: <aqGKnQZOe6leuXgG@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-arm64-gcs-v20-9-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org> <20260901-arm64-gcs-v20-9-f31750bdfadb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093447_465932_EDCFD23B 
X-CRM114-Status: GOOD (  23.39  )
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

On Tue, Sep 01, 2026 at 10:47:07PM +0100, Mark Brown wrote:
> Now that required functionality for GCS is in place expose
> ID_AA64PFR1_EL1.GCS, allowing guests to be given the feature.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kvm/nested.c   | 3 +--
>  arch/arm64/kvm/sys_regs.c | 5 +++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 17123f0b6dab..a9dea85b6192 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1702,11 +1702,10 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
>  		break;
>  
>  	case SYS_ID_AA64PFR1_EL1:
> -		/* Only support BTI, SSBS, CSV2_frac */
> +		/* Only support GCS, BTI, SSBS, CSV2_frac */
>  		val &= ~(ID_AA64PFR1_EL1_PFAR		|
>  			 ID_AA64PFR1_EL1_MTEX		|
>  			 ID_AA64PFR1_EL1_THE		|
> -			 ID_AA64PFR1_EL1_GCS		|
>  			 ID_AA64PFR1_EL1_MTE_frac	|
>  			 ID_AA64PFR1_EL1_NMI		|
>  			 ID_AA64PFR1_EL1_SME		|

So, IIUC, this is used to filter features for guests that believe to have 
an EL2, and now this allows GCS to be used by them.

> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 1f80c26a9839..fb2c9fd42e24 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2193,10 +2193,12 @@ static u64 sanitise_id_aa64pfr1_el1(const struct kvm_vcpu *vcpu, u64 val)
>  	      SYS_FIELD_GET(ID_AA64PFR0_EL1, RAS, pfr0) == ID_AA64PFR0_EL1_RAS_IMP))
>  		val &= ~ID_AA64PFR1_EL1_RAS_frac;
>  
> +	if (!system_supports_gcs())
> +		val &= ~ID_AA64PFR1_EL1_GCS;
> +
>  	val &= ~ID_AA64PFR1_EL1_SME;
>  	val &= ~ID_AA64PFR1_EL1_RNDR_trap;
>  	val &= ~ID_AA64PFR1_EL1_NMI;
> -	val &= ~ID_AA64PFR1_EL1_GCS;
>  	val &= ~ID_AA64PFR1_EL1_THE;
>  	val &= ~ID_AA64PFR1_EL1_MTEX;
>  	val &= ~ID_AA64PFR1_EL1_PFAR;

And here it says to only mask the feature bit if it's not available.

IIUC this sanitize function is called when resetting a vcpu, is that right?


> @@ -3444,7 +3446,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  				     ~(ID_AA64PFR1_EL1_PFAR |
>  				       ID_AA64PFR1_EL1_MTEX |
>  				       ID_AA64PFR1_EL1_THE |
> -				       ID_AA64PFR1_EL1_GCS |
>  				       ID_AA64PFR1_EL1_MTE_frac |
>  				       ID_AA64PFR1_EL1_NMI |
>  				       ID_AA64PFR1_EL1_RNDR_trap |
> 

This one looks like to be a mask that's used to compare with 
arm64_ftr_regs[] on arm64_check_features(). That seems to be called on 
set_id_aa64pfr1_el1() which is used when we get an ioclt to set a system 
register.

So, basically, does it use this mask to check if the set value is valid?

(So, 1 for nested, 1 for reset, and one for user trying to set a value?)

If I did not miss anything, FWIW:
Reviewed-by: Leonardo Bras <leo.bras@arm.com>

Thanks!
Leo

