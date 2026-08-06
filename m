Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A168C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6n9+tn1FX85xHqa53wOOTAdXVH64YAjilIMF7HdWsJo=; b=O/I659+QObKmY5qoD/U9FNzVoW
	FP9SFtoYimfu2iDtZS7exGjk0TtGAGqGXGO7LdAU/fhsbrmOeWU6W4xufQvjvjtEOjy2CXVYUExsT
	dkU5N706kMykPRKwOEFOCF4Wiz4DPbxoby/SKSW7D+c+D1KTKPn53uDM+rJmdd420sTfzj4lMK/Xh
	0qGmHttHxHGXIN+IQNX1ZB4VuoYG/tCPvEgeCPObX3VVSaReNGn+4S+3SAJQRRYgS9ptRr67AyiLx
	wcIgi3vQyny16m3UBZ447JU+RgOYSpQrnt0s7ntk6a/bU5xEJjpAWQvMmtiaYv82+Ofe+A7JNfFp+
	AdgY+9Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtPn-00000005E2E-2OQJ;
	Thu, 06 Aug 2026 08:25:23 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtPk-00000005E1M-25oz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786004718; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=6n9+tn1FX85xHqa53wOOTAdXVH64YAjilIMF7HdWsJo=;
	b=mcxP7Igm1hPNnZOzVtzFvgx8aT3Cv8t+pEIF9BmY3Omj07iNj5xM8X2KeaasuJ6ZQh2OcCY6N4pTcYe1SuP2GKwcWt8WPKAhI96lhuKOfnPriu7BAFWcjO3WrmSJb9gm6dKRBWwORXIizxwzH/+60JZUQC4182ri4puegrTUcUY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X8TPEvo_1786004716;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X8TPEvo_1786004716 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 06 Aug 2026 16:25:17 +0800
Date: Thu, 6 Aug 2026 16:25:16 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Oliver Upton <oupton@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 04/14] KVM: arm64: Ensure GCS memory effects are
 visible
Message-ID: <q2kb7muy5d3rdl2d3pvipggc33xkgq2o7tn6wy6p75qeegas5n@ijikgyexqt74>
References: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
 <20260803-arm64-gcs-v18-4-fd8c40f5ad88@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-arm64-gcs-v18-4-fd8c40f5ad88@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_012521_079223_D2AA31AB 
X-CRM114-Status: GOOD (  15.33  )
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

On Mon, Aug 03, 2026 at 11:56:49PM +0800, Mark Brown wrote:
> In order to allow efficient implementation of GCS implementations are
> permitted to do GCS specific caching, with barriers implicit in stack
> switch operations and GCSB DSYNC as an explicit barrier.  Since we do
> not use GCS in the hypervisor or host kernel the hypervisor cannot rely
> on any barriers being present in vCPU context switches other than those
> it explicitly inserts.  Add explicit barriers when loading and saving
> vCPU state.
>

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kvm/hyp/nvhe/switch.c   | 13 +++++++++++++
>  arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 14 ++++++++++++++
>  2 files changed, 27 insertions(+)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> index 7318e3e6a5f3..fe8727bf2833 100644
> --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> @@ -301,6 +301,12 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
>  	 */
>  	dsb(nsh);
>
> +	/*
> +	 * Ensure any GCS memory effects are visible to this CPU.
> +	 */
> +	if (ctxt_has_gcs(guest_ctxt))
> +		gcsb_dsync();
> +
>  	__kvm_adjust_pc(vcpu);
>
>  	/*
> @@ -345,6 +351,13 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
>  	 */
>  	dsb(nsh);
>
> +	/*
> +	 * Ensure any GCS memory effects from the outgoing vCPU are
> +	 * visible elsewhere.
> +	 */
> +	if (ctxt_has_gcs(guest_ctxt))
> +		gcsb_dsync();
> +
>  	__deactivate_traps(vcpu);
>  	__load_host_stage2();
>
> diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> index 2431c18f5792..4594992b008c 100644
> --- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> +++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> @@ -239,6 +239,13 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vcpu)
>  	if (vcpu_has_nv(vcpu))
>  		dsb(nsh);
>
> +	/*
> +	 * Ensure any GCS memory effects are visible to the incoming
> +	 * vCPU.
> +	 */
> +	if (ctxt_has_gcs(guest_ctxt))
> +		gcsb_dsync();
> +
>  	/*
>  	 * Load guest EL1 and user state
>  	 *
> @@ -299,5 +306,12 @@ void __vcpu_put_switch_sysregs(struct kvm_vcpu *vcpu)
>  	/* Restore host user state */
>  	__sysreg_restore_user_state(host_ctxt);
>
> +	/*
> +	 * Ensure any GCS memory effects from the outgoing vCPU are
> +	 * visible elsewhere.
> +	 */
> +	if (ctxt_has_gcs(guest_ctxt))
> +		gcsb_dsync();
> +
>  	vcpu_clear_flag(vcpu, SYSREGS_ON_CPU);
>  }
>
> --
> 2.47.3
>

