Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA628C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZF0iQLfzAvBUCWBc6u2tYLj3HbiOY3Ow4lnc9zCLabE=; b=kl61FB9yf0c5hmY2iqQpzWQKrk
	959AGCFAm/1Xc2ngrK2ktavkGk7hGYI6QdG76hgYhfsSINq3qfAmbKvMce1WrDq+Y0oLIWynoIgg6
	eEpc0RavvuDc2/ivz2MfVEHzJIJQ0drMu9UmcHxTn1MmeB78liYoiuzD9zLUQyl3o9SNH+7esRJ94
	o82oOUG1W4XZKmfTgvLV2D61Z+vxNBSj+Ugt7Iz2jomzbd81CnoNNlcbSJtKRYRhBWP9JBGPH0jkb
	kGeyyMpoRoV5bfrH7JuHlGd4WiT2auW/U6xkjUChV63RQppE20lFGPHzp4SMaANtDhesQyTcIv6Dj
	bKixlssA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBSX-0000000FpoF-2qTS;
	Fri, 24 Jul 2026 08:40:45 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBSU-0000000FpnU-46up
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784882440; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=ZF0iQLfzAvBUCWBc6u2tYLj3HbiOY3Ow4lnc9zCLabE=;
	b=crJfkJCU1mk82tjdR/O3d5YqSVhzznXdN2ArVISZX9sOAxWmXkoRNjID1QIkE6n2eJV/pe6WNLbbs8lVwa2WxW4HcI6eRdnjA1t888th1k7i3WdbFjfKC0Jy3E2VqzkRGy2EcTXpe8ZmhDCNVZDzJwx+JCNDK42fbVDpah3WqMU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R871e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7ia0lT_1784882439;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X7ia0lT_1784882439 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jul 2026 16:40:39 +0800
Date: Fri, 24 Jul 2026 16:40:38 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 24/28] KVM: arm64: Engage NV3 ERET trap elision
Message-ID: <n2ora3retqaoki3u5ovoqwvh4iqzsziqmybzxid7mylcoua2fc@xlhyqzhwh4cl>
References: <20260722074234.3330999-1-maz@kernel.org>
 <20260722074234.3330999-25-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722074234.3330999-25-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014043_532801_E947DEC6 
X-CRM114-Status: GOOD (  19.57  )
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

On Wed, Jul 22, 2026 at 08:42:30AM +0800, Marc Zyngier wrote:
> When running on NV3 HW, always engage ERET trap elision when running
> the L1 context, as there is no benefit in not doing so.
>
> An L1 can itself engage trap elision by setting its own view of
> HCRX_EL2.NVTGE==1, which will subsequently be honored.
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_emulate.h | 10 ++++++++++
>  arch/arm64/kvm/hyp/vhe/switch.c      |  4 ++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index c562d8171d5e1..b32870a5e1236 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -706,6 +706,16 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
>
>  		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V))
>  			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
> +
> +		/*
> +		 * NV3 is a host-specific extension, and we always use it
> +		 * when present and that the guest uses NV. It may be be
> +		 * hidden from the guest though.
> +		 */
> +		if (cpus_have_final_cap(ARM64_HAS_NV3) &&
> +		    vcpu_has_nv(vcpu) && vcpu_el2_e2h_is_set(vcpu)) {
> +			vcpu->arch.hcrx_el2 |= HCRX_EL2_NVTGE;
> +		}
>  	}
>  }
>  #endif /* __ARM64_KVM_EMULATE_H__ */
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index cbda9e087db39..4ed745bdde418 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -345,6 +345,10 @@ static bool kvm_hyp_handle_eret(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	u64 esr = kvm_vcpu_get_esr(vcpu);
>  	u64 spsr, elr, mode;
>
> +	/* With NV3, the fast path is handled in HW */
> +	if (cpus_have_final_cap(ARM64_HAS_NV3) && vcpu_el2_e2h_is_set(vcpu))
> +		return false;
> +

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>  	/*
>  	 * Going through the whole put/load motions is a waste of time
>  	 * if this is a VHE guest hypervisor returning to its own
> --
> 2.47.3

