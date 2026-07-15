Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E0CC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xRWik7oMk39agPS8Gpaej2sQhyVer8C5rt7PdSERk0=; b=ekhwOtKjCxPzyrthg3y16rwM5J
	2iMWBZTxPacxlusBvpUNsbh1s7sxWig3Ny6Ln8BCHjThHK2H+PxYR+jYY/aCy/CAcKDK2gN38JdN7
	xAas2W2/rKTNzc9DuyOnk/37QoR2ykN0KQN8uu/FAb7n83ZOPZLu7jaP2p0F3hJOpHptW0OwmpRAl
	LSmAfeC1h2M5Lc49nRZdMBAykvhLT5Ka7e4t0DPi8Ej5pgvJbOJ/NtkF0Oa76gsorM524UXwll62G
	1Vfz4nB4yfnlGMjoNIdIZ6JrFMUvF7KCy2c9AlrHK41asUWpMPUdf0kfHpawHxpddbzhxTwQZgCGP
	M2qunhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuXw-0000000E63y-3AbR;
	Wed, 15 Jul 2026 08:00:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuXn-0000000E60t-3RJf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:00:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 46555600BB;
	Wed, 15 Jul 2026 08:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96691F00A3A;
	Wed, 15 Jul 2026 08:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784102439;
	bh=6xRWik7oMk39agPS8Gpaej2sQhyVer8C5rt7PdSERk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nA3IRwwErLKqfQGojuyqxnTXbJwwXvZDVgVhUl5OuKarcqsxrQo+7R4J6Kyi8skLH
	 mhsFU97kz0buOOx8UicSxnPYXuznj0hqYYsMIhD2Wx2d5ZcSI9xgJJFphb4NP8Id8g
	 t7CpwYDb1R7o/hfz7Ef78aDJdv1xn5kNBoG7Xv29w4F63eWdSjhlY1idsLxcq/y7v4
	 7txuwuMXKNzwQxdQBAaG36/frJQxOmwBPCZJ9fFHiIyeze7MmuP6YlQYp01saXJckl
	 EtgJaT9VJ0Q/eQiCEZkRQ3BY2cioFM3JMI+3A7QJUjg5KjXf166H2nSxZ6NcmcB+g9
	 5J7g75j2La4jw==
Date: Wed, 15 Jul 2026 01:00:37 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 07/28] KVM: arm64: Don't evaluate HCR_EL2.NV nor
 HFGITR_EL2.ERET on ERET fast path
Message-ID: <alc-JSvHDjSV5c_G@kernel.org>
References: <20260714091641.1970822-1-maz@kernel.org>
 <20260714091641.1970822-8-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714091641.1970822-8-maz@kernel.org>
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

Hey,

On Tue, Jul 14, 2026 at 10:16:20AM +0100, Marc Zyngier wrote:
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
>  arch/arm64/kvm/hyp/vhe/switch.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index bbe9cebd3d9d5..a83be345f8450 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -344,13 +344,10 @@ static bool kvm_hyp_handle_eret(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	 * if this is a VHE guest hypervisor returning to its own
>  	 * userspace, or the hypervisor performing a local exception
>  	 * return. No need to save/restore registers, no need to
> -	 * switch S2 MMU. Just do the canonical ERET.
> -	 *
> -	 * Unless the trap has to be forwarded further down the line,
> -	 * of course...
> +	 * switch S2 MMU. Just do the canonical ERET unlesss we are in
> +	 * nested context.
>  	 */

typo: unless

I feel like it wouldn't hurt to add a bit more detail to the comment
here, that L0 KVM doesn't use ERET traps in the nested context.
Otherwise it isn't clear why these always belong to the L1.

Thanks,
Oliver

> -	if ((__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_NV) ||
> -	    (__vcpu_sys_reg(vcpu, HFGITR_EL2) & HFGITR_EL2_ERET))
> +	if (is_nested_ctxt(vcpu))
>  		return false;
>  
>  	spsr = read_sysreg_el1(SYS_SPSR);
> -- 
> 2.47.3
> 

