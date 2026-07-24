Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3454C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBJPCq06j/mROJ1z/tUYXDZdGERXJLKDUkBXfllJZzs=; b=zxBNMwpMCAob2FtxpXXvCStB+B
	r5CaG5NNrnEH1qHDAWA1pzkiykgNqWpYvXcv+vHQgAflWA7ESBsOM52A0n4/oNOD4WGWUpy0FHzso
	J9eY2FKiuJr7dUxLjwAYi7vZzKjoBeFpSOXwFTMYycHqzo4cV+yrYGvu7uZnp3E1PGyD6IwI+Kw/3
	t7owfMS8j/c8/273eTrYyeyK446St+qtsjtsP2yWGLk0y3geB2Jri0OZeLOYvL2C2k3qZ3zAe8WoO
	dc1mI4gJTVoWblqkL26cGwDAYpiCzwltBLktzUCZakm9a7zCAzjrD2/MeFPpozFoRDSvlyoy9wMhR
	JCzZDYLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn93i-0000000FYK9-1vxK;
	Fri, 24 Jul 2026 06:06:58 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn93e-0000000FYJd-3zJr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784873212; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=nBJPCq06j/mROJ1z/tUYXDZdGERXJLKDUkBXfllJZzs=;
	b=xnP1DwuqD8bEjgEGEimoOoL9CeSsS1ewZNhhh8aBmDgg8FHgjAcUoYVBbHrQyps4gHmveH9IPk/vDQpVni40QIN5zKsp5H6+k9EIW/scfxqt/gMsbny5Wvl+U0DjGX4LBHu1KGpxl+Hei9Z85OhI9p1/O5IGv8oNlUkoCkCS1xQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7i9haS_1784873208;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X7i9haS_1784873208 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jul 2026 14:06:48 +0800
Date: Fri, 24 Jul 2026 14:06:48 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 09/28] KVM: arm64: Relax CPTR_EL2 handling when
 FEAT_NV2p1 is present
Message-ID: <itfuntllavrtihse3vgrrmiamhiduyegqxh6i5mhwg65m5rcmn@a4465gauamq2>
References: <20260722074234.3330999-1-maz@kernel.org>
 <20260722074234.3330999-10-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722074234.3330999-10-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_230655_518581_8D2FF443 
X-CRM114-Status: GOOD (  19.87  )
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

On Wed, Jul 22, 2026 at 08:42:15AM +0800, Marc Zyngier wrote:
> With FEAT_NV2P1, it is no longer necessary to trap CPTR_EL2 accesses
> via CPACR_EL1, as CPACR_EL1.TCPAC is guaranteed to be stateful.
>
> Prevent such trapping and context switch CPACTR_EL1 in NV contexts
> when NV2P1 is present.
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 5 +++--
>  arch/arm64/kvm/hyp/vhe/switch.c         | 3 +++
>  arch/arm64/kvm/hyp/vhe/sysreg-sr.c      | 8 +++++---
>  arch/arm64/kvm/sys_regs.c               | 5 ++++-
>  4 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index 8e5f492f39086..7b27296c94607 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -108,9 +108,10 @@ static inline void __activate_cptr_traps_vhe(struct kvm_vcpu *vcpu)
>  	 * The architecture is a bit crap (what a surprise): an EL2 guest
>  	 * writing to CPTR_EL2 via CPACR_EL1 can't set any of TCPAC or TTA,
>  	 * as they are RES0 in the guest's view. To work around it, trap the
> -	 * sucker using the very same bit it can't set...
> +	 * sucker using the very same bit it can't set. FEAT_NV2p1 fixes it.
>  	 */
> -	if (vcpu_el2_e2h_is_set(vcpu) && is_hyp_ctxt(vcpu))
> +	if (!cpus_have_final_cap(ARM64_HAS_NV2P1) &&
> +	    vcpu_el2_e2h_is_set(vcpu) && is_hyp_ctxt(vcpu))
>  		val |= CPTR_EL2_TCPAC;
>
>  	/*
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index 684cebf23aa0e..a8da40568a048 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -443,6 +443,9 @@ static bool kvm_hyp_handle_cpacr_el1(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	u64 esr = kvm_vcpu_get_esr(vcpu);
>  	int rt;
>
> +	if (cpus_have_final_cap(ARM64_HAS_NV2P1))
> +		return false;
> +
>  	if (!is_hyp_ctxt(vcpu) || esr_sys64_to_sysreg(esr) != SYS_CPACR_EL1)
>  		return false;
>
> diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> index be685b63e8cf2..6f0f046e4ca4e 100644
> --- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> +++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> @@ -42,10 +42,12 @@ static void __sysreg_save_vel2_state(struct kvm_vcpu *vcpu)
>  		u64 val;
>
>  		/*
> -		 * We don't save CPTR_EL2, as accesses to CPACR_EL1
> -		 * are always trapped, ensuring that the in-memory
> -		 * copy is always up-to-date. A small blessing...
> +		 * Without FEAT_NV2p1, we don't save CPTR_EL2, as accesses
> +		 * to CPACR_EL1 are always trapped, ensuring that the
> +		 * in-memory copy is always up-to-date. A small blessing...
>  		 */
> +		if (cpus_have_final_cap(ARM64_HAS_NV2P1))
> +			__vcpu_assign_sys_reg(vcpu, CPTR_EL2, read_sysreg_el1(SYS_CPACR));
>  		__vcpu_assign_sys_reg(vcpu, SCTLR_EL2,	 read_sysreg_el1(SYS_SCTLR));
>  		__vcpu_assign_sys_reg(vcpu, TTBR0_EL2,	 read_sysreg_el1(SYS_TTBR0));
>  		__vcpu_assign_sys_reg(vcpu, TTBR1_EL2,	 read_sysreg_el1(SYS_TTBR1));
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 6b47d936efb32..1dfc1f88bec82 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -326,7 +326,10 @@ u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
>  			val |= __vcpu_sys_reg(vcpu, reg) & ~CNTKCTL_VALID_BITS;
>  			return val;
>  		case CPTR_EL2:
> -			return __vcpu_sys_reg(vcpu, reg);
> +			if (cpus_have_final_cap(ARM64_HAS_NV2P1))
> +				return read_sysreg_el1(SYS_CPACR);
> +			else
> +				return __vcpu_sys_reg(vcpu, reg);

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>  		default:
>  			WARN_ON_ONCE(1);
>  		}
> --
> 2.47.3

