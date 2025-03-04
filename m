Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAF3C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 02:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/DGEAYBEVTzJ9sL1Ia6fxuaUGdrC9YfgcvHAwDkdpY=; b=V5CgE1gUd47oRdG/Idny1DRYT9
	2Cz4+5Axb4g97Eb8tT7EqQYrF6qeEZzPmJOXk0Exd9GM5nUjcfxr1AaWz8e1CZfSfd33LWSkvz5Un
	9hNrYHTYZsl7TddzAE0XgskBmqYPDFB7spLTwJYedqa3MXuS0rdS6PHmDHIWfc6LoZpGHDWL/Mr4A
	D1558lAPRMxAdiXDTkED8duwXDQO2wtSfW/KAQlQA5KYL6Uriklh0tNFGKYLI7gAC5ncZm3BhTKF4
	HxwBVFdUyUxNrbnf+/4Y4eWjkzAXmPeZVceKzKtk2z2dOvhl/bDP+TDFQHpUmPFVgZDSza1NVxE1x
	Ut2QAaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHuO-00000002t9N-2ibb;
	Tue, 04 Mar 2025 02:21:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHWU-00000002pnd-0w32
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 01:56:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B0C5A5C49CD;
	Tue,  4 Mar 2025 01:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA13C4CEE4;
	Tue,  4 Mar 2025 01:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741053401;
	bh=FUVChTxusLCMBLUVlti1YUL8LW7/tvUKTXZZlRvP6rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uNJEIl1/t95dU9GT2B34a8VuVRjvsPNcprE9PkVvHlHbKTTyXm5zK9o6p0m85fEgW
	 n7mEtMyT6uP5e/QBv6B+2lzevvUwBWjfSVcsFiyFxnT8nFqpT7nLEAv0Ns65jzlGws
	 MyPyha38P/a4MDUGjLtM2ckh809jCe1Ens/9DTIIWwEqCI4V5SfZGemgEFbijV7qpW
	 XvgiN7sn7H4LYbGeKfqhdTbBOhLL3xXGl4QZ9IyNYVhnEakHqrBDE95LS6Ni29DYLi
	 5xrOtEesB3mJ58Rjjalw24MyHMsXPGSdVGqne40sgY4qaEDOEgvBx4c6X5XGClGeAR
	 +hvX72HSm51pw==
Date: Tue, 4 Mar 2025 01:56:35 +0000
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
Message-ID: <20250304015633.GA30882@willie-the-truck>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-4-sebastianene@google.com>
 <20250303234259.GA30749@willie-the-truck>
 <Z8ZPBZF7J-qKdb_i@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8ZPBZF7J-qKdb_i@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_175642_317363_9D1A89A5 
X-CRM114-Status: GOOD (  26.63  )
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

On Tue, Mar 04, 2025 at 12:53:25AM +0000, Sebastian Ene wrote:
> On Mon, Mar 03, 2025 at 11:43:03PM +0000, Will Deacon wrote:
> > On Thu, Feb 27, 2025 at 06:17:48PM +0000, Sebastian Ene wrote:
> > > Map the hypervisor's buffers irrespective to the host and return
> > > a linux error code from the FF-A error code on failure. Remove
> > > the unmap ff-a buffers calls from the hypervisor as it will
> > > never be called.
> > > Prevent the host from using FF-A directly with Trustzone
> > > if the hypervisor could not map its own buffers.
> > > 
> > > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/ffa.c | 46 +++++++++++++----------------------
> > >  1 file changed, 17 insertions(+), 29 deletions(-)
> > 
> > [...]
> > 
> > > @@ -861,6 +842,7 @@ int hyp_ffa_init(void *pages)
> > >  {
> > >  	struct arm_smccc_res res;
> > >  	void *tx, *rx;
> > > +	int ret;
> > >  
> > >  	if (kvm_host_psci_config.smccc_version < ARM_SMCCC_VERSION_1_2)
> > >  		return 0;
> > > @@ -911,5 +893,11 @@ int hyp_ffa_init(void *pages)
> > >  		.lock	= __HYP_SPIN_LOCK_UNLOCKED,
> > >  	};
> > >  
> > > +	/* Map our hypervisor buffers into the SPMD */
> > > +	ret = ffa_map_hyp_buffers();
> > > +	if (ret)
> > > +		return ret;
> > 
> > Doesn't calling RXTX_MAP here undo the fix from c9c012625e12 ("KVM:
> > arm64: Trap FFA_VERSION host call in pKVM") where we want to allow for
> > the host to negotiate the version lazily?
> 
> We still have the same behaviour where we don't allow memory
> sharing to happen until the version is negotiated but this
> separates the hypervisor buffer mapping part from the host.

Sadly, the spec doesn't restrict this to the memory sharing calls:

  | [...] negotiation of the version must happen before an invocation of
  | any other FF-A ABI

We're also probing the minimum rxtx size in hyp_ffa_post_init() so doing
this here is doubly wrong.

So I think we should probably just drop this patch.

Will

