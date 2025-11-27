Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7490CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 05:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QKv6ZOvX2SBICDdmwi+E+eWq1SX0cudMyw17vPaerg=; b=ZS6Txn10dHK0d4hPaJwO7pE8pK
	hqpoS615a8YImJH5n3MUBPHa/eZSX7Chul+hnROWpvtRgglJbk3n5GErrNH3sj2tpKDh8ydndvawu
	s0OG7jlvJPW2wxlOcwaYdP7xvs19uA4OTuwP07wWB1D37fWuU2YofkbTm122BCg5Iwvulo/EE2E/+
	VIPvg6uVjA/YLNnW0J74iV0GIZ0yKwfhlLhUqCNHcs7Gc2psAvg096zif9ZvM+6Iv2jnzMaF/wgSp
	EBhVED5Niex/SkG+QCmv4UMUpTVgb0zkNyCnXzT4ZnEW4yx+zQv2a2BRU7IFU992Vrd+GenQA6/JM
	m41/XISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOV0U-0000000G1Br-0nxX;
	Thu, 27 Nov 2025 05:57:30 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOV0S-0000000G1BR-0b4S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 05:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764223046; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=4QKv6ZOvX2SBICDdmwi+E+eWq1SX0cudMyw17vPaerg=;
	b=Br6h3imQQqGqHlTr+D/1cQ1BOCghNbSQoyEjevfkt6+Qs2qgYlOzL/3QJYT90SfAJORG6DUjGFMGWS/3wApnME4EbzjMbwiV/FRh7SH3WEYL3b0aL2LOg9cslQBUEW0dRObhfC+I9sLei8BuTIXKSVtPSnp5utUHYbK40xVSWVM=
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0WtVwrDT_1764223044 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 27 Nov 2025 13:57:24 +0800
Date: Thu, 27 Nov 2025 13:57:24 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v2 3/5] KVM: arm64: Add a generic synchronous exception
 injection primitive
Message-ID: <5f65l5sg5xxxzoh3uuqixwqrvkuwfvaqhkz2u4mme2jw2rcfzq@oq4lhswlquxt>
References: <20251126155951.1146317-1-maz@kernel.org>
 <20251126155951.1146317-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126155951.1146317-4-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_215728_558028_29435DCC 
X-CRM114-Status: GOOD (  16.02  )
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

On Wed, Nov 26, 2025 at 03:59:49PM +0800, Marc Zyngier wrote:
> Maybe in a surprising way, we don't currently have a generic way
> to inject a synchronous exception at the EL the vcpu is currently
> running at.

Hi Marc,

Thanks for bring this in generic way.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>
> Extract such primitive from the UNDEF injection code.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_emulate.h |  1 +
>  arch/arm64/kvm/inject_fault.c        | 10 +++++++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index c9eab316398e2..df20d47f0d256 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -45,6 +45,7 @@ bool kvm_condition_valid32(const struct kvm_vcpu *vcpu);
>  void kvm_skip_instr32(struct kvm_vcpu *vcpu);
>
>  void kvm_inject_undefined(struct kvm_vcpu *vcpu);
> +void kvm_inject_sync(struct kvm_vcpu *vcpu, u64 esr);
>  int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr);
>  int kvm_inject_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr);
>  void kvm_inject_size_fault(struct kvm_vcpu *vcpu);
> diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> index dfcd66c655179..7102424a3fa5e 100644
> --- a/arch/arm64/kvm/inject_fault.c
> +++ b/arch/arm64/kvm/inject_fault.c
> @@ -162,12 +162,16 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
>  	vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
>  }
>
> +void kvm_inject_sync(struct kvm_vcpu *vcpu, u64 esr)
> +{
> +	pend_sync_exception(vcpu);
> +	vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
> +}
> +
>  static void inject_undef64(struct kvm_vcpu *vcpu)
>  {
>  	u64 esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT);
>
> -	pend_sync_exception(vcpu);
> -
>  	/*
>  	 * Build an unknown exception, depending on the instruction
>  	 * set.
> @@ -175,7 +179,7 @@ static void inject_undef64(struct kvm_vcpu *vcpu)
>  	if (kvm_vcpu_trap_il_is32bit(vcpu))
>  		esr |= ESR_ELx_IL;
>
> -	vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
> +	kvm_inject_sync(vcpu, esr);
>  }
>
>  #define DFSR_FSC_EXTABT_LPAE	0x10
> --
> 2.47.3
>

