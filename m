Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BB9C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 17:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Ds8ZTCnuuJX8YoiEXe67S5tyk4cccTW3kTX4rJWKqc=; b=S6bWnzcD7sZMnWJA5ZnfG20eD1
	XvMlHHzqsd8xsPKWgbdaXYVgL1xuj+2cvtV41Nrcb8ICUfuH0cJZbTOen/dWnc0YqQPIXEcPSIHZn
	mvB+xu3Emw0pTLtyv6YvY+d696X5vFx0oT7oCQ+87+6e58csMV7QZlXNXbSbrjt4IjsuLZ3jrThpE
	4bBJJTXQCgaMiZoT5HcwZ0h7leCZ36/WIjE5vdXT8uu8f3etrkYFBaAomEPtPjYmCsPUI62bm3niq
	kySmGWZ7t1/Vu07qoghwPhpLQZpd78v7ekHqsVPIPMmfLF/kEbNWQDprtp3i3XfNqORdTR7LqEovX
	gJPsPm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiAI-0000000FxyS-3fxp;
	Wed, 06 Aug 2025 17:43:02 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uji5B-0000000FxKZ-3iFn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 17:37:47 +0000
Date: Wed, 6 Aug 2025 10:37:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754501862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Ds8ZTCnuuJX8YoiEXe67S5tyk4cccTW3kTX4rJWKqc=;
	b=OsFNdeLeDvZyIFiiB1P4x4mWtoQy5vL5ZWA2tYr/zzJpw2Mrs7Cza1OvWrHba5WqdpThxY
	ZJkFFBys3aoF1VbW3jltvWSIZw8COfKcGBhuwLT5bC5+pnuoitfF0MIV6t4ADdf2E8EfgB
	9XgTfpziVOpPqpPoi8bypZ12rtBJyYA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1 1/2] KVM: arm64: nv: fix S2 translation for nVHE guests
Message-ID: <aJOS3oOwUWeRLS4j@linux.dev>
References: <20250806141707.3479194-1-volodymyr_babchuk@epam.com>
 <20250806141707.3479194-2-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806141707.3479194-2-volodymyr_babchuk@epam.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_103746_146442_4DCDCA9E 
X-CRM114-Status: GOOD (  16.51  )
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

Hi Volodymyr,

Thanks for catching this.

On Wed, Aug 06, 2025 at 02:17:55PM +0000, Volodymyr Babchuk wrote:
> According to ARM architecture specification (ARM DDI 0487 L.a, section
> C5.4.3), Stage 2 translation should be skipped when VHE is active, or,
> in other words, E2H bit is set. Fix the code by inverting both check
> and comment.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>  arch/arm64/kvm/at.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index a25be111cd8f8..5e7c3fb01273c 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -1412,10 +1412,10 @@ void __kvm_at_s12(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
>  		return;
>  
>  	/*
> -	 * If we only have a single stage of translation (E2H=0 or
> +	 * If we only have a single stage of translation (E2H=1 or
>  	 * TGE=1), exit early. Same thing if {VM,DC}=={0,0}.
>  	 */
> -	if (!vcpu_el2_e2h_is_set(vcpu) || vcpu_el2_tge_is_set(vcpu) ||
> +	if (vcpu_el2_e2h_is_set(vcpu) || vcpu_el2_tge_is_set(vcpu) ||

The check should be HCR_EL2.<E2H,TGE> == '11'. Maybe instead:

	/*
	 * Exit early if we only have a single stage of translation
	 * either because we're in the EL2&0 translation regime or
	 * stage-2 translation is disabled (i.e. HCR_EL2.{VM,DC}=={0,0}).
	 */
	 if (compute_translation_regime(vcpu, op) == TR_EL20 ||
	     !(vcpu_read_sys_reg(vcpu, HCR_EL2) & (HCR_VM | HCR_DC)))
	     return;

Thanks,
Oliver

