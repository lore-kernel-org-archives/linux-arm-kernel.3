Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F9CC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8aSEDEK6ZPgt07ch8i5G0m8dM5j9fAVclCMjxvWcOU=; b=cFHGxphGj5tWuI9YRTfKiFy2S4
	zDQvv1STJOM2naBxzyyfk+rOzFn1z0GALAkkZCHSzE93+pLm7PpWV9b1fuG3WheSsNsZPSYITKVzh
	4up3PdLoHuEsdGa3zZjM+xC5H/WboNqc27oX/+b394j5Vyc+KEOEKtCsj3LIee1amAIW2WKbTfg2J
	v/3QYdBTMP8US1RTgL7+u/WjzurLtYEQ//MIyZAk1zZ68rXMDLDusSV82sRZow2Ym/itydPwgUOQE
	Z9vQKZj9X+nIXn5EAuuAN0HHAMddqyWmOuxC8+HF22JlHxsTNbgiPhP42vYwEFrqvB510LRwPdRjW
	gCMqOkcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuvm-0000000E9jD-3Dqy;
	Wed, 15 Jul 2026 08:25:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuvk-0000000E9iV-39ho
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:25:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FD1B439CA;
	Wed, 15 Jul 2026 08:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33EB1F00A3D;
	Wed, 15 Jul 2026 08:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103924;
	bh=M8aSEDEK6ZPgt07ch8i5G0m8dM5j9fAVclCMjxvWcOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BX3+yfwq25Y7fZyDbwcjjnC7civgxwrMYEi7Bw48MC0GfbEpBwqA/oyZe4euVTH8D
	 xzg+fI4mpLrP6H4Yhi6h6wgxyFjAH01R3PuG6WitKKFua20A/y6IV1OaC5zyRRKEP8
	 //YaxE9fkG5EDEojKw4+WjGO8rmDmnVguSLc71SJ/h/URrc3M9RE561kKDGrI89fud
	 cTtLYZ4bgbIpJ0JMVErt3h9mSOR9xqVkihO5Dd7aGUZSOUW+bsWGfvDf9PL9HlUNqA
	 cjm3k623kMUKGFdt+n9r3k98BPtKwStDHBcln/WRyr/cd/8O2jwNdq2PhD6oVt9GFE
	 QZK0JkdolT/Sg==
Date: Wed, 15 Jul 2026 01:25:22 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 07/28] KVM: arm64: Don't evaluate HCR_EL2.NV nor
 HFGITR_EL2.ERET on ERET fast path
Message-ID: <aldD8rdS06QlI_nU@kernel.org>
References: <20260714091641.1970822-1-maz@kernel.org>
 <20260714091641.1970822-8-maz@kernel.org>
 <alc-JSvHDjSV5c_G@kernel.org>
 <86ech4oebm.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ech4oebm.wl-maz@kernel.org>
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

On Wed, Jul 15, 2026 at 09:19:09AM +0100, Marc Zyngier wrote:
> On Wed, 15 Jul 2026 09:00:37 +0100,
> Oliver Upton <oupton@kernel.org> wrote:
> > 
> > Hey,
> > 
> > On Tue, Jul 14, 2026 at 10:16:20AM +0100, Marc Zyngier wrote:
> > > We currently avoid using the ERET fast path if the guest has HCR_EL2.NV
> > > set. This is an odd check, as NV doesn't mean much if HCR_EL2.TGE==1.
> > > 
> > > Similarly, evaluating HFGITR_EL2.ERET makes little sense, as
> > > this only applies to the nested context, while the ERET fast-path
> > > is purely for the benefit of L1.
> > > 
> > > Replace these bizarre checks with is_nested_ctxt() which makes a lot
> > > more sense: if we are running an L2, the ERET trap must go to L1.
> > > 
> > > Fixes: dd0717a998f77 ("KVM: arm64: nv: Fast-track 'InHost' exception returns")
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/kvm/hyp/vhe/switch.c | 9 +++------
> > >  1 file changed, 3 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> > > index bbe9cebd3d9d5..a83be345f8450 100644
> > > --- a/arch/arm64/kvm/hyp/vhe/switch.c
> > > +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> > > @@ -344,13 +344,10 @@ static bool kvm_hyp_handle_eret(struct kvm_vcpu *vcpu, u64 *exit_code)
> > >  	 * if this is a VHE guest hypervisor returning to its own
> > >  	 * userspace, or the hypervisor performing a local exception
> > >  	 * return. No need to save/restore registers, no need to
> > > -	 * switch S2 MMU. Just do the canonical ERET.
> > > -	 *
> > > -	 * Unless the trap has to be forwarded further down the line,
> > > -	 * of course...
> > > +	 * switch S2 MMU. Just do the canonical ERET unlesss we are in
> > > +	 * nested context.
> > >  	 */
> > 
> > typo: unless
> > 
> > I feel like it wouldn't hurt to add a bit more detail to the comment
> > here, that L0 KVM doesn't use ERET traps in the nested context.
> > Otherwise it isn't clear why these always belong to the L1.
> 
> We already have a tiny bit of information in kvm_handle_eret(), but
> that's obviously a bit far down the line. Something like this?
> 
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index a83be345f8450..684cebf23aa0e 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -344,8 +344,13 @@ static bool kvm_hyp_handle_eret(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	 * if this is a VHE guest hypervisor returning to its own
>  	 * userspace, or the hypervisor performing a local exception
>  	 * return. No need to save/restore registers, no need to
> -	 * switch S2 MMU. Just do the canonical ERET unlesss we are in
> +	 * switch S2 MMU. Just do the canonical ERET unless we are in
>  	 * nested context.
> +	 *
> +	 * Note that this is made possible because KVM itself never traps
> +	 * ERET when running an L2. The consequence is that any ERET trap is
> +	 * the result of HCR_EL2 or HFGITR_EL2 programming by L1 for its own
> +	 * guest, and the exception must be forwarded to L1.
>  	 */
>  	if (is_nested_ctxt(vcpu))
>  		return false;

Works for me!

Thanks,
Oliver

