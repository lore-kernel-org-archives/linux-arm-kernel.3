Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF0DD116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 18:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxb7kF1mQ5Q711JdUVnxSpLmaN0ALGx+03mNw9RSIoo=; b=pVqfaPeU/mJnLZ3Yc9bCtzrNgm
	FLPLEYmtyYJP0iau9hdfn1r8OMA+onZYP6OtRR2qpm7Zy+zK6EjyzPzm4egfQihMZTGXFy8B/tgpw
	kpPoiGTJyH/HFUkmrauP2DeMEGxHcb7qSVnA7j7gmmOXHG8f0Rrdwf71vdBtTuRkydguE93v2wfuD
	I7W2m6604/QxVRAyvhmM1yJz1OfOAUkAVdZS0holOUHqfKltvQ+mZP5VG76ntUDQh8en2CLQtIxmm
	eAxxb5cZ9o/+jd93brNd6/To+dWCSC4iMXCcr4l6CSCXsqDMx6GRxzPQgpdCgaqrOdDvzCS+o01he
	MqWQz1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3Vx-00000000n0C-0bsA;
	Fri, 28 Nov 2025 18:48:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3Vu-00000000mze-3Yf5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 18:48:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A338340320;
	Fri, 28 Nov 2025 18:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6BEC4CEF1;
	Fri, 28 Nov 2025 18:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764355692;
	bh=FSDNcDjcSHNEpBt47zKm4TaQeFx3bDhR+BL9MuiqZ+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COincvZmdF6AYs666DRcJHlpv2QVyg8rvNVSTKD724SSpnQ6rH2bApNmStmgePXqv
	 ukqfRFpKUdTqqPQmwY6lg8vBNwAgx6g3KJjL8F7zrIn18/kQ4Vk3WKM1THsGmzt1tU
	 qdIA5TL601IayzwlIzvBa6RKpZ0kcISaJrRVPEGNZVPDrlhsknOwtEvlfdwrC6UjBa
	 +1R6vC/g2fUp0NC9FBf6mMzUFnRvjzMUkMM/9E2aN2ql8rxh0/VWb//fK8hdtJP6nP
	 tRb1nRlcCQE+NJ2o5apZEcyOa3rAzAYyzK/WeLIx/O/6nvsxYJ55eIHUYl24hClKWr
	 F0pazRWMAPswQ==
Date: Fri, 28 Nov 2025 10:48:10 -0800
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, oliver.upton@linux.dev,
	joey.gouly@arm.com, yuzenghui@huawei.com, suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH 3/4] KVM: arm64: nv: Don't mask VTCR_EL2.HA if
 FEAT_HAFDBS is present
Message-ID: <aSnuauBCe1Ru2q0T@kernel.org>
References: <20251128100946.74210-1-alexandru.elisei@arm.com>
 <20251128100946.74210-4-alexandru.elisei@arm.com>
 <86v7iup3bv.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86v7iup3bv.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_104814_932950_A7A0F390 
X-CRM114-Status: GOOD (  22.66  )
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

On Fri, Nov 28, 2025 at 03:46:44PM +0000, Marc Zyngier wrote:
> On Fri, 28 Nov 2025 10:09:45 +0000,
> Alexandru Elisei <alexandru.elisei@arm.com> wrote:
> > 
> > Commit 39db933ba67f ("KVM: arm64: nv: Implement HW access flag management
> > in stage-2 SW PTW") added support for hardware updates to the access flag
> > to stage 2 if the feature is available to the virtual machine, but forgot
> > to remove the VTCR_EL2.HA bit from the res0 mask for the register. Remove
> > it from the mask to allow the VM to use the feature.
> > 
> > Fixes: 39db933ba67f ("KVM: arm64: nv: Implement HW access flag management in stage-2 SW PTW")
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  arch/arm64/kvm/nested.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > index 911fc99ed99d..7a34163f6c68 100644
> > --- a/arch/arm64/kvm/nested.c
> > +++ b/arch/arm64/kvm/nested.c
> > @@ -1719,7 +1719,9 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
> >  	set_sysreg_masks(kvm, VTTBR_EL2, res0, res1);
> >  
> >  	/* VTCR_EL2 */
> > -	res0 = GENMASK(63, 32) | GENMASK(30, 20);
> > +	res0 = GENMASK(63, 32) | GENMASK(30, 22) | BIT(20);
> > +	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, HAFDBS, AF))
> > +		res0 |= VTCR_EL2_HA;
> >  	res1 = BIT(31);
> >  	set_sysreg_masks(kvm, VTCR_EL2, res0, res1);
> >  
> 
> The fix is correct, but I really do not want to add more of these
> tedious checks, one after the other. We should fix this once and for
> all by converting VTCR_EL2 to the feature dependency infrastructure
> and be done with it.
> 
> I've pushed a small series at [1] that does that (very lightly
> tested).

This looks alright to me, do you want to post it?

Thanks,
Oliver

