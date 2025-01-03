Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AA1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVKr+dao3XareXNhtnPMux9P3ucan9oCRszNdejQVIE=; b=0at/c+WajRznVwewPydKBemB6y
	ZVEF4r9VNBhjgJkz/eRo8tGRpz/y4YE/y8kDYp9VnitJZGsCYTHfRCuHn72JuvLUGS3fuF4L3VNdn
	/FuNth6dO2F8IznQ/7IUs8nN5sR9B/7zNA4mGLcnjn8wRYvH1XkXJarwbbPGYRuAfiAmd2wRxYdN/
	kcP+g/+kraBFe7OFIxByE5Qo8Q0X/sBkp2Xwn0ewsH1aZ2ncyNX+3tJyHHK/OLaGz6AqswnkIrYuU
	jBfK9KEzi5YFwOfju26lnSqRWfBR0U34KGIBdlmatelU5IM5MXx5Kc2NF6mL08oZIle3Ry18W7967
	oQ/Zu4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjjz-0000000DJPy-2YkP;
	Fri, 03 Jan 2025 15:37:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjhp-0000000DIwa-32i3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 15:35:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F08B5C6463;
	Fri,  3 Jan 2025 15:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3970C4CECE;
	Fri,  3 Jan 2025 15:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735918520;
	bh=dkuPRC1mSjn4P8CTQpXiKsb9NwR2J22sVbc7YWENjVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O1KuaD0q/TR9Z9VX8BTduZF2dys6lmbAfhAI8bRnES3qkTy3CBDj21H5x/HzoYsBg
	 2t9ZvhpSfHKK9Sic3ctzN1U95spySL9t7KT/0+u4btOxhayr53AR4x5ZA6aPLK58Jv
	 5urJ3Cdw9XADU627FMHClUSdrePUc50OA118G5gDZSEtPAzCIB039F65oWmufeEy8p
	 i7zMeU4m9jHccFKRpQmc9WpV8snU3y1JAHmPLAxrTdcfxMM3HIC+ztdpFV/N13Gnjm
	 OwqD3168y7jsBxUNGK/9dp707yab1SsntJyv+QaM1WnJ8V1jaBBo04vIPzQG27ACY8
	 PkhewEQcNobjg==
Date: Fri, 3 Jan 2025 15:35:13 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	catalin.marinas@arm.com, corbet@lwn.net, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	yangyicong@huawei.com, guohanjun@huawei.com,
	wangkefeng.wang@huawei.com, liaochang1@huawei.com,
	sunnanyong@huawei.com, linuxarm@huawei.com
Subject: Re: [RESEND RFC PATCH v1 2/5] arm64: Add BBM Level 2 cpu feature
Message-ID: <20250103153512.GD3816@willie-the-truck>
References: <20241211160218.41404-3-miko.lenczewski@arm.com>
 <87cyhxs3xq.wl-maz@kernel.org>
 <084c5ada-51af-4c1a-b50a-4401e62ddbd6@arm.com>
 <86ikrprn7w.wl-maz@kernel.org>
 <2b1cc228-a8d5-4383-ab25-abbbcccd2e2c@arm.com>
 <86h678sy00.wl-maz@kernel.org>
 <5c551e43-78e9-4336-ab16-b55c0d6c7f92@arm.com>
 <20241219164528.GH24724@willie-the-truck>
 <20250102120704.00002984@huawei.com>
 <86ed1lpfdh.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ed1lpfdh.wl-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_073521_855129_17E95ED8 
X-CRM114-Status: GOOD (  36.81  )
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

On Thu, Jan 02, 2025 at 12:30:34PM +0000, Marc Zyngier wrote:
> On Thu, 02 Jan 2025 12:07:04 +0000,
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> > On Thu, 19 Dec 2024 16:45:28 +0000
> > Will Deacon <will@kernel.org> wrote:
> > > On Thu, Dec 12, 2024 at 04:03:52PM +0000, Ryan Roberts wrote:
> > > > >>> If anything, this should absolutely check for FAR_EL1 and assert that
> > > > >>> this is indeed caused by such change.  
> > > > >>
> > > > >> I'm not really sure how we would check this reliably? Without patch 5, the
> > > > >> problem is somewhat constrained; we could have as many changes in flight as
> > > > >> there are CPUs so we could keep a list of all the {mm_struct, VA-range} that are
> > > > >> being modified. But if patch 5 is confirmed to be architecturally sound, then
> > > > >> there is no "terminating tlbi" so there is no bound on the set of {mm_struct,
> > > > >> VA-range}'s that could legitimately cause a conflict abort.  
> > > > > 
> > > > > I didn't mean to imply that we should identify the exact cause of the
> > > > > abort. I was hoping to simply check that FAR_EL1 reports a userspace
> > > > > VA. Why wouldn't that work?  
> > > > 
> > > > Ahh gottya! Yes agreed, this sounds like the right approach.  
> > > 
> > > Please, can we just not bother handling conflict aborts at all outside of
> > > KVM? This is all dead code, it's complicated and it doesn't scale to the
> > > in-kernel use-cases that others want. There's also not been any attempt
> > > to add the pKVM support for handling host-side conflict aborts from what
> > > I can tell.
> > > 
> > > For now, I would suggest limiting this series just to the KVM support
> > > for handling a broken/malicious guest. If the contpte performance
> > > improvements are worthwhile (I've asked for data), then let's add support
> > > for the CPUs that handle the conflict in hardware (I believe this is far
> > > more common than reporting the abort) so that the in-kernel users can
> > > benefit whilst keeping the code manageable at the same time.
> > > 
> > 
> > Given direction the discussion is going in time to raise a hand.
> > 
> > Huawei has implementations that support BBML2, and might report TLB conflict
> > abort after changing block size directly until an appropriate TLB invalidation
> > instruction completes and this Implementation Choice is architecturally compliant.
> 
> Compliant, absolutely. That's the letter of the spec. The usefulness
> aspect is, however, more debatable, and this is what Will is pointing
> out.
> 
> Dealing with TLB Conflict aborts is an absolute pain if you need
> to handle it within the same Translation Regime and using the same
> TTBR as the one that has generated the fault. So at least for the time
> being, it might be preferable to only worry about the implementations
> that will promise to never generate such an abort and quietly perform
> an invalidation behind the kernel's back.

Agreed. We're not dropping support for CPUs that don't give us what we'd
like here, we're just not bending over to port and maintain new
optimisations for them. I think that's a reasonable compromise?

That said, thanks for raising this, Jonathan. It's a useful data point
to know that TLB conflict aborts exist in the wild!

Will

