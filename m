Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA17C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnV5QCYs96+b5L9vYPvdSR5j/BEGUkoqeIIiwjVfNWA=; b=H6a+cy0xDJRmbXLq36hHxEjvlk
	Tg3TixSiOvmM1d7edVXWS/V6BM+H5OP4ImMTq4Xi8J2JK+XcSX2K1GuP+XBh18tLXxi92fB92MnJ3
	7jTkEU1W/8f9ZhGuPHF0QPrsVCK4+8YlO8+x7mGXLEEKVWiJyqgd81KwcNup2F84QrhD7cl4I3U1x
	kKG1KtjZhy9izXqiE9odR22F+WGo0nL5gAeoFIE0bnEngPXZNSQ/9X3nbqZHVhe4MjQxzRWwDTkWC
	8aN0hLmf1aoObEcm+64tzF2MwAJA9JX4LecmuuHt2AZEYNOSM5uUi+/o/ma+FucrwivayGWmeWkXI
	WrQtHn5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn922-0000000FYCO-0DEr;
	Fri, 24 Jul 2026 06:05:14 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn91x-0000000FYAB-3s2a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:05:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784873100; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=SnV5QCYs96+b5L9vYPvdSR5j/BEGUkoqeIIiwjVfNWA=;
	b=rk9ZkMttYYcaRZuoOVOl8xCuFf31kmEUu8MhD/PIU2ysusBWVOaBTdla2KcRexc2U/OWeIwka9HrKYYT51eev/0HKNds6t+lGTtD6cme1O0/CecT/pCO6dllqHvqoHZNQxOyzW4NwUqO32W3oHzRaDodLPFde6L28oHbX3FXN9A=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7i9h0p_1784873098;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X7i9h0p_1784873098 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jul 2026 14:04:58 +0800
Date: Fri, 24 Jul 2026 14:04:57 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 07/28] KVM: arm64: Don't evaluate HCR_EL2.NV nor
 HFGITR_EL2.ERET on ERET fast path
Message-ID: <syytdlctsuj4ixszpy76bjdovdr4bxgfofgpfzjvo3hotwmjti@qfnfzngfuxcy>
References: <20260722074234.3330999-1-maz@kernel.org>
 <20260722074234.3330999-8-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722074234.3330999-8-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_230510_671393_21BAFA42 
X-CRM114-Status: GOOD (  20.23  )
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

On Wed, Jul 22, 2026 at 08:42:13AM +0800, Marc Zyngier wrote:
> We currently avoid using the ERET fast path if the guest has HCR_EL2.NV
> set. This is an odd check, as NV doesn't mean much if HCR_EL2.TGE==1.
>
> Similarly, evaluating HFGITR_EL2.ERET makes little sense, as
> this only applies to the nested context, while the ERET fast-path
> is purely for the benefit of L1.
>
> Replace these bizarre checks with is_nested_ctxt() which makes a lot
> more sense: if we are running an L2, the ERET trap must go to L1.
>
> Fixes: dd0717a998f77 ("KVM: arm64: nv: Fast-track 'InHost' exception returns")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/vhe/switch.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index bbe9cebd3d9d5..684cebf23aa0e 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -344,13 +344,15 @@ static bool kvm_hyp_handle_eret(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	 * if this is a VHE guest hypervisor returning to its own
>  	 * userspace, or the hypervisor performing a local exception
>  	 * return. No need to save/restore registers, no need to
> -	 * switch S2 MMU. Just do the canonical ERET.
> +	 * switch S2 MMU. Just do the canonical ERET unless we are in
> +	 * nested context.
>  	 *
> -	 * Unless the trap has to be forwarded further down the line,
> -	 * of course...
> +	 * Note that this is made possible because KVM itself never traps
> +	 * ERET when running an L2. The consequence is that any ERET trap is
> +	 * the result of HCR_EL2 or HFGITR_EL2 programming by L1 for its own
> +	 * guest, and the exception must be forwarded to L1.

Yes, right.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>  	 */
> -	if ((__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_NV) ||
> -	    (__vcpu_sys_reg(vcpu, HFGITR_EL2) & HFGITR_EL2_ERET))
> +	if (is_nested_ctxt(vcpu))
>  		return false;
>
>  	spsr = read_sysreg_el1(SYS_SPSR);
> --
> 2.47.3

