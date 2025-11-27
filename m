Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34316CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 06:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hy6i4BHIBv92ivIvbJli4o+aE+p41yraaT/sJ5nA6dY=; b=f3Bi3UOjLaG+uyfrIxZ+TKEQty
	a73tGJv9hQKc1feQwgXbOcBpq/qsZTsxYY+XfQorOTtZSi5UA4JskQnyXbEzfgG2YbToT4EGGeQck
	QUSDbqTLOev2J+FUOvaV00XOanhVjr2Iov4YUU4uMfgCvrca3p5op2hNAj47buIfQpG92PEFYYZlj
	8dG8tplEe8Va67iNgiks2q+CUHFR2MtskR/1hkwjaCEBfspLyyVRvSzG0isT24txOp/DcSAZxqZxS
	nHRJ2DZdGVWFU6AKZUd9/LL45jgk9SX9Fqa3rieHN2hUVwrg2gBw1k3UbRkZT3YQiAg/mFgctIVHK
	JVYPL37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVjQ-0000000G3uy-1Zkt;
	Thu, 27 Nov 2025 06:43:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVjN-0000000G3uY-44DO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 06:43:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94F49418C7;
	Thu, 27 Nov 2025 06:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51061C4CEF8;
	Thu, 27 Nov 2025 06:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764225832;
	bh=nJ1AksxvkgzgI5yArHPx9UP569L+VBn2SNhrNoTyxVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qySN6j7BCWXiirX2iH/LbdQY7BIP5AOhi3DKO0XaIffn/BuecmPdQ0LTgTFiENeFq
	 9/JJxc9Jl7VZeJ63qj2hlNfnBm5PhhX/HHaRvyB0KdZy8os65NiC+CFYvCtCgsTKIY
	 /+POJMGyTBi1RHY6gjObEjdi9euL37hb6FfgOpuMtQFY41tZ+0SSM4e3Hzrb9KPV9C
	 of1CkzsjphU4N8MgwcJvIp9MSwdLZ7bw+f0D7Wh1EicNNTdrlmShRqOZcWwdRJG8w4
	 pPE2jVZA2R+3bqktm0J+WtRqITdWnWaNfk3WJcZy1VsRI/Nv/43GLz11YavGKBAt/a
	 7aKiQgm9c1kfA==
Date: Wed, 26 Nov 2025 22:43:51 -0800
From: Oliver Upton <oupton@kernel.org>
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v2 4/5] KVM: arm64: Report optional ID register traps
 with a 0x18 syndrome
Message-ID: <aSfzJxBfdI17pyPD@kernel.org>
References: <20251126155951.1146317-1-maz@kernel.org>
 <20251126155951.1146317-5-maz@kernel.org>
 <dk6bwi72nwfty6qpbh2eaeubznqt74gjffas2rclrrwjn5tr6j@mjitrla3p3d7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dk6bwi72nwfty6qpbh2eaeubznqt74gjffas2rclrrwjn5tr6j@mjitrla3p3d7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_224354_059246_30D3ABE3 
X-CRM114-Status: GOOD (  21.33  )
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

On Thu, Nov 27, 2025 at 02:07:08PM +0800, Yao Yuan wrote:
> On Wed, Nov 26, 2025 at 03:59:50PM +0800, Marc Zyngier wrote:
> > With FEAT_IDST, unimplemented system registers in the feature ID space
> > must be reported using EC=0x18 at the closest handling EL, rather than
> > with an UNDEF.
> >
> > Most of these system registers are always implemented thanks to their
> > dependency on FEAT_AA64, except for a set of (currently) three registers:
> > GMID_EL1 (depending on MTE2), CCSIDR2_EL1 (depending on FEAT_CCIDX),
> > and SMIDR_EL1 (depending on SME).
> >
> > For these three registers, report their trap as EC=0x18 if they
> > end-up trapping into KVM and that FEAT_IDST is not implemented in the
> > guest. Otherwise, just make them UNDEF.
> >
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >  arch/arm64/kvm/sys_regs.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > index 2ca6862e935b5..7705f703e7c6d 100644
> > --- a/arch/arm64/kvm/sys_regs.c
> > +++ b/arch/arm64/kvm/sys_regs.c
> > @@ -82,6 +82,16 @@ static bool write_to_read_only(struct kvm_vcpu *vcpu,
> >  			"sys_reg write to read-only register");
> >  }
> >
> > +static bool idst_access(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
> > +			const struct sys_reg_desc *r)
> > +{
> > +	if (kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR2_EL1, IDS, 0x0))
> 
> Hi Marc,
> 
> Minor: maybe beter readability if use NI instead of 0x0, just like
> things in feat_nv2() below, but depends on you.

+1, using the ESR value as an identifier in the sysreg tables is just
terrible. This reads like a literal.

Thanks,
Oliver

