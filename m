Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD0BCD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7ghlEoHBHGmCrn5Bs1oOERL1T6HbRmnFLgtX+ZwhaU=; b=jFDjljJ9CSdl78U+NUvC1IIrs6
	daRiUOqMWThnG0B46QRa42JB4vKj8P5d54bg4V3MbeY2MjhxIUKLty6HGFYTmkZMo+sNvNn5Tzfu0
	xFSTNkSmoqSMg9WeaiurpnsBLhaubmPM74GQ3xTjhr/1YmfYFpifu98tJM+GEYCF13xggu+tLAFti
	itGHRKRyWYv2lMJ61z2HD/ysm/ZHDM384rn9dFe/QVaxCHu5cC5yjU/mCyc9NhiWxkDXKUQqQ3zR/
	gx5l3QIfaEQFBErXapNGC8da8UB9/eo2ctnvn7AMMF2LnSem/EcHWFA++ynok+MvEgyBLMJqMPoQf
	luJpIIsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0K4-0000000GEj6-12Nk;
	Mon, 18 May 2026 15:56:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0K3-0000000GEik-2CUz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 15:56:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5DCA601E3;
	Mon, 18 May 2026 15:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F903C2BCB7;
	Mon, 18 May 2026 15:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779119762;
	bh=dpZik2/Jd8VdAFvr0/z5S0PoQjKxn1keu6UZtFpwAJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOWUIdFa5gfNcdVH9/pGSoGCEtls2XDpW+SgbCLZ0XVxKzAWSgIsZWe6sirm11gp8
	 eG0HhcCFmVlorjyxBU8sSWzS9FEDX8mRfPYbpTRo1sQg8WgXeY058dPZPOrvsxGw2c
	 Uhtw6ITIyuCdw5doFGvxUSv5GqPKLqFsGZ9CRHYI2iLsczIjf9jVUYISGLb0GFIura
	 DDRz6zBXRQsiODY7kbOrtL7eTXCz8UTadPhDuYR9AgS9K8Uxo/KWxdAx9bAUjt5vir
	 8mmyyc/ccYv9mU9noEpRTVVbBzlG1KXSdjKzuK8mao1AEK7euNrDjGMuiANPLWoKdx
	 mY/WmSXqMXEPw==
Date: Mon, 18 May 2026 16:55:57 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2] KVM: arm64: Don't populate TPIDR_EL2 in finalise_el2()
Message-ID: <ags2ja9HW41_GKls@willie-the-truck>
References: <20260518153127.6078-1-will@kernel.org>
 <86y0hgwwul.wl-maz@kernel.org>
 <86wlx0wwro.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86wlx0wwro.wl-maz@kernel.org>
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

On Mon, May 18, 2026 at 04:41:15PM +0100, Marc Zyngier wrote:
> On Mon, 18 May 2026 16:39:30 +0100,
> Marc Zyngier <maz@kernel.org> wrote:
> > 
> > On Mon, 18 May 2026 16:31:26 +0100,
> > Will Deacon <will@kernel.org> wrote:
> > > 
> > > Currently, it is not necessary for __finalise_el2() to configure
> > > TPIDR_EL2:
> > > 
> > > * The hyp stub code does not consume the value of TPIDR_EL2.
> > > 
> > > * On the boot cpu, TPIDR_EL1 is used for the percpu offset until the
> > >   ARM64_HAS_VIRT_HOST_EXTN cpucap is detected and boot alternatives
> > >   are patched. Before boot alternatives are patched,
> > >   cpu_copy_el2regs() will copy TPIDR_EL1 into TPIDR_EL2. It is not
> > >   necessary for __finalise_el2() to initialise TPIDR_EL2 before this.
> > > 
> > > * Secondary CPUs are brought up after boot alternatives have been
> > >   patched, and __secondary_switched() will initialize TPIDR_EL2 in
> > >   'init_cpu_task', after finalise_el2() calls __finalise_el2()
> > > 
> > > * KVM hyp code which may consume TPIDR_EL2 is brought up after all
> > >   secondaries have been booted, once TPIDR_El2 has been configured on
> > >   all CPUs.
> > > 
> > > Remove the redundant initialisation from __finalise_el2().
> > > 
> > > Cc: Oliver Upton <oupton@kernel.org>
> > > Cc: Marc Zyngier <maz@kernel.org>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Reviewed-by: Mark Rutland <mark.rutland@arm.com>
> > > Signed-off-by: Will Deacon <will@kernel.org>
> > 
> > Reviewed-by: Marc Zyngier <maz@kernel.org>
> 
> Ah, realised too late you intended for this to go via the KVM tree.
> 
> I'll queue that for 7.2.

Thanks, Marc!

Will

