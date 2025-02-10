Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C262C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 18:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OloAmN9kMp+YFMRW3e1TPUdz81sQDzo26AuRS+JXMas=; b=3RwQG49GtRO+0Pc4QxZHqwXqUi
	a9UAOmBS2qZeur6JyTqJEX9EKhJ+M1qOfZJw0ESp3+Ie/yvas3Xyf0yngOlUkhp2YDaTAqEE4wlxL
	AaqdUUofmAZLMjTnHvNf96lnVlCU6lvQ9coT0vk0M6v5ttCbreV6ju7prdlzAqcLG9p/m7bcazD7r
	dEYBpf8o2gob7izngpNqbpOyE/dRoAZymkf6V8gryHL2zybiJjinMbiGS0IGJCgkD5pbvEJqhlSKF
	sCcbNLTY40X79sFnIj/gzdSyJvFj+zZ79ocmOUATIJs6UMykFWftQYImOeRbKa5d28yPulr6lVMlA
	8DB4ljnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thYfm-00000000xE8-1zk1;
	Mon, 10 Feb 2025 18:38:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYOG-00000000tX9-3xyT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:20:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 79474A41F3D;
	Mon, 10 Feb 2025 18:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427D2C4CED1;
	Mon, 10 Feb 2025 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739211615;
	bh=W3QAGc5LW3FYdLUn7iW7HNDDQXI4yVqVYSST3W+bEUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHaCjUeyImHZ6oNFBg92Mgwpw1VlhwyRXcVk5+i5KnHOxhoj+D8FKbbxReonNCz6b
	 ESPMZaTfyYTtSVgGDUFPbObpAvagpxDhS9xjOCWiYpdR15N3XTKvNRj+0A3biZWbC1
	 +U12EMiYZjVXVOnbYqujQXyHuGM5PwzkQnlpYz2x7eBwMU5RtcqPQCzKVQ3SPbqzxz
	 25X1KqKBieCA12R+tMkcoPE8VtVuZrOCafycAwIgJTuLizifrdxJ+g6UsUec5MbY/0
	 dGAGnTPgdlKFe3IDrbHdAwdktxM7x7mT3cCOn4E2xjHBPywSfLZZla8/OebUknXsxb
	 7WoMtL0BHqRQw==
Date: Mon, 10 Feb 2025 18:20:09 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 8/8] KVM: arm64: Eagerly switch ZCR_EL{1,2}
Message-ID: <20250210182009.GB7926@willie-the-truck>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-9-mark.rutland@arm.com>
 <20250210165325.GI7568@willie-the-truck>
 <Z6o1t7ys2qVaZ-7n@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6o1t7ys2qVaZ-7n@J2N7QTR9R3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_102017_124955_012B922F 
X-CRM114-Status: GOOD (  22.63  )
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

On Mon, Feb 10, 2025 at 05:21:59PM +0000, Mark Rutland wrote:
> On Mon, Feb 10, 2025 at 04:53:27PM +0000, Will Deacon wrote:
> > On Thu, Feb 06, 2025 at 02:11:02PM +0000, Mark Rutland wrote:
> > > +static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
> > > +{
> > > +	u64 zcr_el1, zcr_el2;
> > > +
> > > +	if (!guest_owns_fp_regs())
> > > +		return;
> > > +
> > > +	if (vcpu_has_sve(vcpu)) {
> > > +		zcr_el1 = read_sysreg_el1(SYS_ZCR);
> > > +		__vcpu_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu)) = zcr_el1;
> > > +
> > > +		/*
> > > +		 * The guest's state is always saved using the guest's max VL.
> > > +		 * Ensure that the host has the guest's max VL active such that
> > > +		 * the host can save the guest's state lazily, but don't
> > > +		 * artificially restrict the host to the guest's max VL.
> > > +		 */
> > > +		if (has_vhe()) {
> > > +			zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
> > > +			write_sysreg_el2(zcr_el2, SYS_ZCR);
> > > +		} else {
> > > +			zcr_el2 = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
> > > +			write_sysreg_el2(zcr_el2, SYS_ZCR);
> > > +
> > > +			zcr_el1 = vcpu_sve_max_vq(vcpu) - 1;
> > > +			write_sysreg_el1(zcr_el1, SYS_ZCR);
> > 
> > Do we need an ISB before this to make sure that the CPTR traps have been
> > deactivated properly?
> 
> Sorry, I had meant to add a comment here that this relies upon a
> subtlety that avoids the need for the ISB.

Ah yes, it really all hinges on guest_owns_fp_regs() and so I think a
comment would be helpful, thanks.

Just on this, though:

> When the guest owns the FP regs here, we know:
> 
> * If the guest doesn't have SVE, then we're not poking anything, and so
>   no ISB is necessary.
> 
> * If the guest has SVE, then either:
> 
>   - The guest owned the FP regs when it was entered.
> 
>   - The guest *didn't* own the FP regs when it was entered, but acquired
>     ownership via a trap which executed kvm_hyp_handle_fpsimd().
> 
>   ... and in either case, *after* disabling the traps there's been an
>   ERET to the guest and an exception back to hyp, either of which
>   provides the necessary context synchronization such that the traps are
>   disabled here.

What about the case where we find that there's an interrupt pending on
return to the guest? In that case, I think we elide the ERET and go back
to the host (see the check of isr_el1 in hyp/entry.S).

Will

