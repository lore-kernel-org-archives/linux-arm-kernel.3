Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56CAE7716F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 00:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+fesaggYnmYPTzNBJhmMN//258qRMFZQIkG5W+7nf4=; b=RMXdt+fY1Dlpt4tI+vB+JddZd5
	5xwl9bXg/KSQNVDLVTnNsWYkmf8yE3OXQWq/37purNB4aTL52EC8tVT/pON4ww+UdvBtp8VYOde1x
	PV3wsaqhRVZnvxp7dCnx4k7Zs1xAPWl+AxKi22wsEFGKzta3LbNwt89SW7gNcWzwC59u7oe5K+VCj
	iYP7Mmx/6iUSaAnnBajJDATFBfSyolkzPrQ/0CQrg+tRme2lAZSc4Gwlcsan7+wskmVcR6eQln+zz
	JK/4J5nllBnhoqH6PUAJ2k5v4RDk16USja+AcY1HAML2b32c/CYZXvvk8KN7zku0CDMQBBaa/ukYp
	+nv5sYiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIztJ-0000000ENQA-2ivl;
	Thu, 05 Dec 2024 00:38:49 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzsI-0000000ENFv-3SzI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 00:37:48 +0000
Date: Wed, 4 Dec 2024 16:37:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733359063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y+fesaggYnmYPTzNBJhmMN//258qRMFZQIkG5W+7nf4=;
	b=ncAmXn3NSw8a8PcZ3ZdbA+Sk7ZibUOGTbgwXXbJrGv82qW64BwjUsCdSRqpCTs6dBEngub
	tWEqrhO55s+7IIotR0RT41ftfStdWGaOdVmbvxXcTLAAjijsQ2KTaDB4kp43I4M78abNUt
	ZFpijB0n+1EyiDcMrpAfOqKyqNcXjaU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: Re: [PATCH 06/11] KVM: arm64: nv: Acceletate EL0 counter accesses
 from hypervisor context
Message-ID: <Z1D1zus18KCpCqjD@linux.dev>
References: <20241202172134.384923-1-maz@kernel.org>
 <20241202172134.384923-7-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202172134.384923-7-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_163747_140237_F8BA1C81 
X-CRM114-Status: GOOD (  18.82  )
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

typo: accelerate

On Mon, Dec 02, 2024 at 05:21:29PM +0000, Marc Zyngier wrote:
> Similarly to handling the physical timer accesses early when FEAT_ECV
> causes a trap, we try to handle the physical counter without returning
> to the general sysreg handling.
> 
> More surprisingly, we introduce something similar for the virtual
> counter. Although this isn't necessary yet, it will prove useful on
> systems that have a broken CNTVOFF_EL2 implementation. Yes, they exist.
> 
> Special care is taken to offset reads of the counter with the host's
> CNTPOFF_EL2, as we perform this with TGE clear.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/include/hyp/switch.h |  5 +++++
>  arch/arm64/kvm/hyp/vhe/switch.c         | 13 +++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index 34f53707892df..30e572de28749 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -501,6 +501,11 @@ static inline bool handle_tx2_tvm(struct kvm_vcpu *vcpu)
>  	return true;
>  }
>  
> +static inline u64 compute_counter_value(struct arch_timer_context *ctxt)
> +{
> +	return arch_timer_read_cntpct_el0() - timer_get_offset(ctxt);
> +}
> +
>  static bool kvm_hyp_handle_cntpct(struct kvm_vcpu *vcpu)
>  {
>  	struct arch_timer_context *ctxt;
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index b014b0b10bf5d..49815a8a4c9bc 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -296,6 +296,13 @@ static bool kvm_hyp_handle_timer(struct kvm_vcpu *vcpu, u64 *exit_code)
>  			val = __vcpu_sys_reg(vcpu, CNTP_CVAL_EL0);
>  		}
>  		break;
> +	case SYS_CNTPCT_EL0:
> +	case SYS_CNTPCTSS_EL0:
> +		/* If !ELIsInHost(EL0), the guest's CNTPOFF_EL2 applies */
> +		val = compute_counter_value(!(vcpu_el2_e2h_is_set(vcpu) &&
> +					      vcpu_el2_tge_is_set(vcpu)) ?
> +					    vcpu_ptimer(vcpu) : vcpu_hptimer(vcpu));
> +		break;
>  	case SYS_CNTV_CTL_EL02:
>  		val = __vcpu_sys_reg(vcpu, CNTV_CTL_EL0);
>  		break;
> @@ -314,6 +321,12 @@ static bool kvm_hyp_handle_timer(struct kvm_vcpu *vcpu, u64 *exit_code)
>  		else
>  			val = __vcpu_sys_reg(vcpu, CNTV_CVAL_EL0);
>  		break;
> +	case SYS_CNTVCT_EL0:
> +	case SYS_CNTVCTSS_EL0:
> +		/* If !ELIsInHost(EL2), the guest's CNTVOFF_EL2 applies */

!ELIsInHost(EL0)

> +		val = compute_counter_value(!vcpu_el2_e2h_is_set(vcpu) ?
> +					    vcpu_vtimer(vcpu) : vcpu_hvtimer(vcpu));
> +		break;
>  	default:
>  		return false;
>  	}
> -- 
> 2.39.2
> 

