Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8CBC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKg6VK9RqPImUYGMS477AME02hlbupA9/UkMQE70Rmo=; b=PjM/Rzo1Uv0lvcNPcMebTGwaLu
	PIu/NbK/ygrFTF23iKJp2Re7w0j95cj0fc9oygrKnsTuxomZ8bs+jMFnygyXLOmA25uMoQggpNXcK
	iSnYIe9L2SnArtXIQxxIuKMwoWJ+62Ab4xttHZvS2xs7PHBESwaEtLf26ebCKMPM5G+u2MWpKjFsF
	HGj8zBY9IBZ2A47C3cKlu9uTmf0+wf/bRIW72sgjO53jl8E3ixx27qfT2f4T0QY9IwQrS4wusvTtP
	ehdM5YkN4rC8ofKESy2tMRuLbJZ7b/WF2nwoffOB5x9KUsQZRX08mzddqRvpcd0C7fYin45TeORk1
	hYmCnsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn98H-0000000FYsg-2BLC;
	Fri, 24 Jul 2026 06:11:41 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn98F-0000000FYs3-0aRQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784873497; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=BKg6VK9RqPImUYGMS477AME02hlbupA9/UkMQE70Rmo=;
	b=sVTT+Doxo0Q0AEyZHxVW7UFd9LpJJQuAh+TELJgObi2Y4P/bkPFjHzt2wC09ylS/OTZXNISm75dRpYHSjA+trYWFHOln/kqF+b1KoSYE9BaJfwdBQtRfcL8RyHqSzkFuliNqBP5OIRQqx7DCRQx+UBpuqdgYoV3ZxypuZoQAbAE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7iE9hJ_1784873496;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X7iE9hJ_1784873496 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jul 2026 14:11:36 +0800
Date: Fri, 24 Jul 2026 14:11:35 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 16/28] KVM: arm64: Split NV-specific exit fixups from
 the non-NV handling
Message-ID: <bs3c4cdx7pqd4u3kszy5tvje5to6b5y5ztfcyies6ancgtwgqs@v4nxtyvc2bud>
References: <20260722074234.3330999-1-maz@kernel.org>
 <20260722074234.3330999-17-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722074234.3330999-17-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_231139_367171_F54B1D0B 
X-CRM114-Status: GOOD (  17.46  )
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

On Wed, Jul 22, 2026 at 08:42:22AM +0800, Marc Zyngier wrote:
> In order to facilitate further changes, move the NV handling of
> early fixups in its own helper. This also makes the code slightly
> simpler to parse.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/vhe/switch.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index a8da40568a048..53af19212895d 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -539,18 +539,15 @@ static const exit_handler_fn hyp_exit_handlers[] = {
>  	[0x3F]				= kvm_hyp_handle_impdef,
>  };
>
> -static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
> +static void fixup_nv_guest_exit(struct kvm_vcpu *vcpu)
>  {
> -	synchronize_vcpu_pstate(vcpu);
> -
>  	/*
>  	 * If we were in HYP context on entry, adjust the PSTATE view
>  	 * so that the usual helpers work correctly. This enforces our
>  	 * invariant that the guest's HYP context status is preserved
>  	 * across a run.
>  	 */
> -	if (vcpu_has_nv(vcpu) &&
> -	    unlikely(host_data_test_flag(VCPU_IN_HYP_CONTEXT))) {
> +	if (unlikely(host_data_test_flag(VCPU_IN_HYP_CONTEXT))) {
>  		u64 mode = *vcpu_cpsr(vcpu) & (PSR_MODE_MASK | PSR_MODE32_BIT);
>
>  		switch (mode) {
> @@ -567,8 +564,15 @@ static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	}
>
>  	/* Apply extreme paranoia! */
> -	BUG_ON(vcpu_has_nv(vcpu) &&
> -	       !!host_data_test_flag(VCPU_IN_HYP_CONTEXT) != is_hyp_ctxt(vcpu));
> +	BUG_ON(!!host_data_test_flag(VCPU_IN_HYP_CONTEXT) != is_hyp_ctxt(vcpu));
> +}
> +
> +static bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
> +{
> +	synchronize_vcpu_pstate(vcpu);
> +
> +	if (vcpu_has_nv(vcpu))
> +		fixup_nv_guest_exit(vcpu);
>
>  	return __fixup_guest_exit(vcpu, exit_code, hyp_exit_handlers);
>  }
> --
> 2.47.3

