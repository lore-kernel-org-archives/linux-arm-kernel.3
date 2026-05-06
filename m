Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1A2CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ur8c28lhnUflYWUOGV0vG2eZfjzXIY6F2Cmao5d8XfQ=; b=DBm27YNy2EIpGUH9MDWuwmOzhG
	S0Twp0JWCufqUH/x6oG0g7rjy/S7eYw/EugZtkdnMQSnNmReOA6Ee17qFpmow2MeeQSb/w4o7WM17
	SFbjw0oKrwgrjHOx+GWybpOGrw3DLhuE4nPUoDBMl48K5dJRA4F2OgbMicBrWdha7rwl9mh7+vwCE
	5te4dgUOFFZ0WgQWCnjAZrUmvJzBUCqMKRnay7htGwEvWzi4oio17dot1lP/Ue3LXedsZN1wZ7RVm
	At6cjDadRos5Fwkb7Z4H6xOsSRGLH9vmFRChRlzXqV9dyLh3cN5VFdgibg2dUOMJMtu1Y6/fPYxsz
	/PgArMsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbYV-00000000n5X-1IeT;
	Wed, 06 May 2026 12:40:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbYT-00000000n4b-1H5e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 12:40:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64F131A9A;
	Wed,  6 May 2026 05:40:38 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59B943F836;
	Wed,  6 May 2026 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778071243; bh=roG9jIEcvqLpVOFpK2wPqagrkQmdJh1NYxFbv3chBNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mnYLglEyYvd+CNgIlsFM2VVyuLWaa6JyAumtdUbbpi6Kl+JX1ENkFOYIHEtK9fkVw
	 TcHnG/92OxVON/c/achNdlKYKoQyk4hWC1uOFuuCf13zczHnI5bt/zo8O14jN1vFg1
	 YcpmEqebRClOPKiVo24dfRhmvlRJ0zTJlkZ+DgQU=
Date: Wed, 6 May 2026 13:40:39 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Work around C1-Pro erratum 4193714 for
 protected guests
Message-ID: <afs2xxlaGdQk3Utn@arm.com>
References: <20260430155911.628402-1-catalin.marinas@arm.com>
 <afsgm6pVTFwtqc4e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afsgm6pVTFwtqc4e@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_054045_386699_9B7CCBB7 
X-CRM114-Status: GOOD (  18.41  )
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

On Wed, May 06, 2026 at 12:06:03PM +0100, Vincent Donnefort wrote:
> On Thu, Apr 30, 2026 at 04:59:11PM +0100, Catalin Marinas wrote:
> > From: James Morse <james.morse@arm.com>
> > 
> > C1-Pro cores with SME have an erratum where TLBI+DSB does not complete
> > all outstanding SME accesses. Instead a DSB needs to be executed on the
> > affected CPUs. The implication is pages cannot be unmapped from the
> > host Stage 2 then provided to the guest. Host SME accesses may occur
> > after this point.
> > 
> > This erratum breaks pKVM's guarantees, and the workaround is hard to
> > implement as EL2 and EL1 share a security state meaning EL1 can mask
> > IPIs sent by EL2, leading to interrupt blackouts.
> > 
> > Instead, do this in EL3. This has the advantage of a separate security
> > state, meaning lower EL cannot mask the IPI. It is also simpler for EL3
> > to know about CPUs that are off or in PSCI's CPU_SUSPEND.
> > 
> > Add the needed hook to host_stage2_set_owner_metadata_locked(). This
> > covers the cases where the host loses access to a page:
> > 
> >   __pkvm_host_donate_guest()
> >   __pkvm_guest_unshare_host()
> >   host_stage2_set_owner_locked() when owner_id == PKVM_ID_HYP
> > 
> > Signed-off-by: James Morse <james.morse@arm.com>
> > [catalin.marinas@arm.com: move the hook to host_stage2_set_owner_metadata_locked()]
> > [catalin.marinas@arm.com: use hyp_smccc_1_1_smc()]
> > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Oliver Upton <oupton@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Vincent Donnefort <vdonnefort@google.com>
> > Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Sudeep Holla <sudeep.holla@kernel.org>
> > ---
> 
> Reviewed-by: Vincent Donnefort <vdonnefort@gogle.com>

Thanks Vincent. Would you mind having a look at v2 as well:

https://lore.kernel.org/r/20260505165205.2690919-1-catalin.marinas@arm.com

The only addition is not initialising pKVM if the firmware doesn't
implement the SMC handler.

-- 
Catalin

