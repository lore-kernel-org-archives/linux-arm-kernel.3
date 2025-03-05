Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF85C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 00:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uiXIpgv9qxEGFC0n1ZJvMUswAydGH9gE8jLJ3sUDRvA=; b=YbaFxp2/VmuLYWzPnIhc/vfIZp
	yMdiJH5+u3HPJ2D+xO7ZT6xNhkZ6g82mW1Tdjp3OaUlWkWD9lhWMhILnaaydYPHbesJpcl+kIR2ro
	tTD/3P4htlM6qeC/jmYI/HJdDA4Jl5czpYAMNetameukPHPxcFB18EvbSH3KPGtTgWbjlD7x2H4u8
	ky/UmdXDBBbRVgWPhCj6wLWHCL2MGcOvxJxHJY3SBe2oyrqaBjnUzpV/WN4TkynyQUjc5XKXEONho
	VwY0qf1dJva4Au9/ElWj5GBldhlsEPu5Si7tW12WhQtj7iIwZl7ovBzf4fXaSAtYq3JCGR5nMZJiB
	Gs7Ij4ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcnj-00000006eQc-0aoG;
	Wed, 05 Mar 2025 00:39:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcm8-00000006eCK-2476
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 00:38:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51558A45E81;
	Wed,  5 Mar 2025 00:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C9FC4CEE5;
	Wed,  5 Mar 2025 00:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741135094;
	bh=pHEcWCG/8MyiAl1bVQnLutpSDPdKJFxtF27iTUsZguI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sygvpchtb82JtF/P1QkuJ6+GK6LhxLJB/tpVdL323+X6MyNJ9J4QuxbqqnQJYzEH2
	 xx8NEewsgfZ9RLnc3Bu2/JUQ17vRSzoAJfL+Y2TM7937WXlCcBW/rcF31Hxy8OOz2j
	 53jaLPN0JCFm0Az5WrYah0RpFhUbhtx8QGyOvVCnc322K8FjPvbdHj5ytArwgsUxN/
	 ZMF4JbDIS6PLS6DiDWsk9BhlLSJKJXQV8IwKDi072VoJRRNtkxKKfS8vdcrl6d4RBr
	 xy/alpB8n6ilcLBfP0rzhmvXyoOtopnpytffeSVANYBZxQ4ib5g8VSyl7x+T2KUQra
	 A8qeD6PRvWDxA==
Date: Wed, 5 Mar 2025 00:38:08 +0000
From: Will Deacon <will@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v2 3/4] KVM: arm64: Map the hypervisor FF-A buffers on
 ffa init
Message-ID: <20250305003808.GA31667@willie-the-truck>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-4-sebastianene@google.com>
 <20250303234259.GA30749@willie-the-truck>
 <Z8ZPBZF7J-qKdb_i@google.com>
 <20250304015633.GA30882@willie-the-truck>
 <Z8c6enoolJe7Zeqk@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8c6enoolJe7Zeqk@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_163816_672118_A31474E0 
X-CRM114-Status: GOOD (  42.14  )
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

On Tue, Mar 04, 2025 at 05:38:02PM +0000, Sebastian Ene wrote:
> On Tue, Mar 04, 2025 at 01:56:35AM +0000, Will Deacon wrote:
> > On Tue, Mar 04, 2025 at 12:53:25AM +0000, Sebastian Ene wrote:
> > > On Mon, Mar 03, 2025 at 11:43:03PM +0000, Will Deacon wrote:
> > > > On Thu, Feb 27, 2025 at 06:17:48PM +0000, Sebastian Ene wrote:
> > > > > Map the hypervisor's buffers irrespective to the host and return
> > > > > a linux error code from the FF-A error code on failure. Remove
> > > > > the unmap ff-a buffers calls from the hypervisor as it will
> > > > > never be called.
> > > > > Prevent the host from using FF-A directly with Trustzone
> > > > > if the hypervisor could not map its own buffers.
> > > > > 
> > > > > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > > > > ---
> > > > >  arch/arm64/kvm/hyp/nvhe/ffa.c | 46 +++++++++++++----------------------
> > > > >  1 file changed, 17 insertions(+), 29 deletions(-)
> > > > 
> > > > [...]
> > > > 
> > > > > @@ -861,6 +842,7 @@ int hyp_ffa_init(void *pages)
> > > > >  {
> > > > >  	struct arm_smccc_res res;
> > > > >  	void *tx, *rx;
> > > > > +	int ret;
> > > > >  
> > > > >  	if (kvm_host_psci_config.smccc_version < ARM_SMCCC_VERSION_1_2)
> > > > >  		return 0;
> > > > > @@ -911,5 +893,11 @@ int hyp_ffa_init(void *pages)
> > > > >  		.lock	= __HYP_SPIN_LOCK_UNLOCKED,
> > > > >  	};
> > > > >  
> > > > > +	/* Map our hypervisor buffers into the SPMD */
> > > > > +	ret = ffa_map_hyp_buffers();
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > 
> > > > Doesn't calling RXTX_MAP here undo the fix from c9c012625e12 ("KVM:
> > > > arm64: Trap FFA_VERSION host call in pKVM") where we want to allow for
> > > > the host to negotiate the version lazily?
> > > 
> > > We still have the same behaviour where we don't allow memory
> > > sharing to happen until the version is negotiated but this
> > > separates the hypervisor buffer mapping part from the host.
> > 
> > Sadly, the spec doesn't restrict this to the memory sharing calls:
> > 
> >   | [...] negotiation of the version must happen before an invocation of
> >   | any other FF-A ABI
> > 
> 
> We do that, as the hypervisor negotiates its own version in
> hyp_ffa_init.

hyp_ffa_init() only issues FFA_VERSION afaict, which is the one call
that you're allowed to make during negotiation. So the existing code is
fine.

> I think the host shouldn't be allowed to overwrite the
> hyp_ffa_version obtained from _init, this feels wrong as you
> can have a driver that forcefully downgrades the hypervisor to an old
> version.

I think that's also fine. The FFA code in the hypervisor exists solely
to proxy requests from the host; it's not used for anything else and so,
from the host's persective, FFA should behave identically to the case in
which the proxy is not present (e.g. if we were just using VHE). That
means that we're doing the right thing by deferring to the host for
version negotation.

Are you saying there's a bug in the current code if the host negotiates
the downgrade?

> We need to do three things, Sudeep & Will please correct me if I am
> wrong, but this is how I see it:
> 
> - the hypervisor should act as a separate entity (it has a different ID and
> in the current implementation we don't do a distinction between host/hyp) and
> it should be able to lock its own version from init.

I strongly disagree with that. The hypervisor isn't using FFA for
anything other than proxying the host and so we don't need to negotiate
a separate version.

What would we gain by doing this? Is there a bug with what we're doing
at the moment?

> - keep a separate version negotiated for the host
> - trap FFA_ID_GET from the host and return ID=1 because
>   currently we forward the call to the TZ and it returns the same ID
>   as the (hypervisor == 0).

Why is this beneficial? It just looks like complexity at EL2 for no gain
to me, but maybe I'm missing something.

Will

