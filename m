Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D92CFD65E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEHmC+4c2dAZ0TAm3QDoCR6Tt4NogRVHOqnlUG9CaIU=; b=N5JEFWkm6buTXgEh7mZ+7HVggU
	1kRqaf1/xpmmbHp0kxlvRCmT+Z003HjuHausFgAkc6A7lgjzSWT19acv2TuiLBE1UwKtWmOUYuuws
	ioyNW3WfUlxg2J4wC4CX/gwjeqNx0aEoOx5LBnE8hdffb1SDIR8SHu8/xL5nmYdXHKU4mtFf0S1Rr
	zrPXxtg814lK1SHdnNpHW4XJB7IJ8SyQscSozI/YpTSKz6MLcFc5kMvXnhTzm/tanTidb7jwjzfB1
	vzAXAw9hlRIy+Ifx2ZeAImv0aI48L3PyeBjaZIWufQevyhFz30uOU01C522JQJSaFf/N3SeN6SF2w
	L6epG6pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWTt-0000000FJEV-0dD5;
	Wed, 07 Jan 2026 16:33:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWTs-0000000FJEJ-2237
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:33:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90BD36000A;
	Wed,  7 Jan 2026 16:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8966CC4CEF1;
	Wed,  7 Jan 2026 16:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767803635;
	bh=WmWZBR3qZNNjQFP+VxnmCTmNhfkitwmDjgm+bpwc6KA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQjsH7jjzEOMh+NzlZcnrEdADGCJJIxJZN7laW2VI8p5q+R1QTKR+JDMHOEZY08cb
	 WIcsEzdKjUlhQ3aJ1+NJgBauqORDgkX/Kg15AONFGN/g+bw/aR4jyGVz65EjXhvq2f
	 lXmynqhZBxA/SH8nwJGx4niEPtEFAdrAIy8qIDsoxJEmp7auFXiVqgL6EpgS32B+Jl
	 3Ec14JWh4Txt90r28e+3rqmxPsWOdGKYi1wHTV/GL0Wu1k5teQnFsgTb2ze02s9TLY
	 lNM1bz1HWJbOQnZL5f0lxzaaXINEocyqXmemb1HugN0Gq5QXgL3Hz+utGafb3Cj1JA
	 wa6PZPI8SIc1Q==
Date: Wed, 7 Jan 2026 16:33:49 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Lucas Wei <lucaswei@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, sjadavani@google.com,
	kernel test robot <lkp@intel.com>, stable@vger.kernel.org,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	robin.murphy@arm.com, smostafa@google.com
Subject: Re: [PATCH v2] arm64: errata: Workaround for SI L1 downstream
 coherency issue
Message-ID: <aV6K7QnUa7jDpKw-@willie-the-truck>
References: <20251229033621.996546-1-lucaswei@google.com>
 <87o6ndduye.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6ndduye.wl-maz@kernel.org>
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

Hey Marc,

On Thu, Jan 01, 2026 at 06:55:05PM +0000, Marc Zyngier wrote:
> On Mon, 29 Dec 2025 03:36:19 +0000,
> Lucas Wei <lucaswei@google.com> wrote:
> > diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> > index 8cb3b575a031..5c0ab6bfd44a 100644
> > --- a/arch/arm64/kernel/cpu_errata.c
> > +++ b/arch/arm64/kernel/cpu_errata.c
> > @@ -141,6 +141,30 @@ has_mismatched_cache_type(const struct arm64_cpu_capabilities *entry,
> >  	return (ctr_real != sys) && (ctr_raw != sys);
> >  }
> >  
> > +#ifdef CONFIG_ARM64_ERRATUM_4311569
> > +static DEFINE_STATIC_KEY_FALSE(arm_si_l1_workaround_4311569);
> > +static int __init early_arm_si_l1_workaround_4311569_cfg(char *arg)
> > +{
> > +	static_branch_enable(&arm_si_l1_workaround_4311569);
> > +	pr_info("Enabling cache maintenance workaround for ARM SI-L1 erratum 4311569\n");
> > +
> > +	return 0;
> > +}
> > +early_param("arm_si_l1_workaround_4311569", early_arm_si_l1_workaround_4311569_cfg);
> > +
> > +/*
> > + * We have some earlier use cases to call cache maintenance operation functions, for example,
> > + * dcache_inval_poc() and dcache_clean_poc() in head.S, before making decision to turn on this
> > + * workaround. Since the scope of this workaround is limited to non-coherent DMA agents, its
> > + * safe to have the workaround off by default.
> > + */
> > +static bool
> > +need_arm_si_l1_workaround_4311569(const struct arm64_cpu_capabilities *entry, int scope)
> > +{
> > +	return static_branch_unlikely(&arm_si_l1_workaround_4311569);
> > +}
> > +#endif
> 
> But this isn't a detection mechanism. That's relying on the user
> knowing they are dealing with broken hardware. How do they find out?

Sadly, I'm not aware of a mechanism to detect this reliably at runtime
but adding Robin in case he knows of one. Linux generally doesn't need
to worry about the SLC, so we'd have to add something to DT to detect
it and even then I don't know whether it's something that is typically
exposed to non-secure...

We also need the workaround to be up early enough that drivers don't
run into issues, so that would probably involve invasive surgery in the
DT parsing code.

> You don't even call out what platform is actually affected...

Well, it's an Android phone :)

More generally, it's going to be anything with an Arm "SI L1" configured
to work with non-coherent DMA agents below it. Christ knows whose bright
idea it was to put "L1" in the name of the thing containing the system
cache.

> The other elephant in the room is virtualisation: how does a guest
> performing CMOs deals with this? How does it discover the that the
> host is broken? I also don't see any attempt to make KVM handle the
> erratum on behalf of the guest...

A guest shouldn't have to worry about the problem, as it only affects
clean to PoC for non-coherent DMA agents that reside downstream of the
SLC in the interconnect. Since VFIO doesn't permit assigning
non-coherent devices to a guest, guests shouldn't ever need to push
writes that far (and FWB would cause bigger problems if that was
something we wanted to support)

+Mostafa to keep me honest on the VFIO front.

Will

