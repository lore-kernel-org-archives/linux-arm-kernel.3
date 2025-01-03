Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033C9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 18:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAbcQhqRNOjAopCtYhHtT/zqyq1ofjlR0720BgGp/lY=; b=lFSX1tUnf6p1L2lHWKT0MbAiG4
	Ju6PGiUPX5m4/6i5BUd5URqDhJKJDKRJG+XIqXRcihqxJ3nGYWYIIK1/4I5hksTcZ+20U1GPok+38
	LoukfE8n3zfWcTEcFCgT2yhn1eF3X/QojkL7swRZ+HhxcjOrSj/NPjj+u61SPnZj18iJAEA5WRNsD
	dv9KFZa7bWWRYYZ/zbIcyqD93HAbfi1XxdSQAT/DC/OKEPq1NfhTkFGkmySclNsc1/BRGbixYKIRP
	kELMoP052DyHLUnQKneNa9eEeLsdKuLArOgisE+Oqyb8I511XKl9ccjGp+qtLkDiOldYttkmw0UCl
	wj40y1DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmMH-0000000Dhba-3aCL;
	Fri, 03 Jan 2025 18:25:17 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmG2-0000000DgbF-0i8v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 18:18:52 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YPsHt0PHNz6K6G1;
	Sat,  4 Jan 2025 02:17:46 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id AD2E71404C4;
	Sat,  4 Jan 2025 02:18:38 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 3 Jan
 2025 19:18:37 +0100
Date: Fri, 3 Jan 2025 18:18:36 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 =?UTF-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	<catalin.marinas@arm.com>, <corbet@lwn.net>, <oliver.upton@linux.dev>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kvmarm@lists.linux.dev>,
	<yangyicong@huawei.com>, <guohanjun@huawei.com>,
	<wangkefeng.wang@huawei.com>, <liaochang1@huawei.com>,
	<sunnanyong@huawei.com>, <linuxarm@huawei.com>
Subject: Re: [RESEND RFC PATCH v1 2/5] arm64: Add BBM Level 2 cpu feature
Message-ID: <20250103181836.000045b1@huawei.com>
In-Reply-To: <2a6448f5-a48b-42fd-9589-acdb434f0a8a@arm.com>
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
	<20250103153512.GD3816@willie-the-truck>
	<2a6448f5-a48b-42fd-9589-acdb434f0a8a@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_101850_507829_811D1EC4 
X-CRM114-Status: GOOD (  47.28  )
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

On Fri, 3 Jan 2025 16:00:59 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 03/01/2025 15:35, Will Deacon wrote:
> > On Thu, Jan 02, 2025 at 12:30:34PM +0000, Marc Zyngier wrote:  
> >> On Thu, 02 Jan 2025 12:07:04 +0000,
> >> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:  
> >>> On Thu, 19 Dec 2024 16:45:28 +0000
> >>> Will Deacon <will@kernel.org> wrote:  
> >>>> On Thu, Dec 12, 2024 at 04:03:52PM +0000, Ryan Roberts wrote:  
> >>>>>>>> If anything, this should absolutely check for FAR_EL1 and assert that
> >>>>>>>> this is indeed caused by such change.    
> >>>>>>>
> >>>>>>> I'm not really sure how we would check this reliably? Without patch 5, the
> >>>>>>> problem is somewhat constrained; we could have as many changes in flight as
> >>>>>>> there are CPUs so we could keep a list of all the {mm_struct, VA-range} that are
> >>>>>>> being modified. But if patch 5 is confirmed to be architecturally sound, then
> >>>>>>> there is no "terminating tlbi" so there is no bound on the set of {mm_struct,
> >>>>>>> VA-range}'s that could legitimately cause a conflict abort.    
> >>>>>>
> >>>>>> I didn't mean to imply that we should identify the exact cause of the
> >>>>>> abort. I was hoping to simply check that FAR_EL1 reports a userspace
> >>>>>> VA. Why wouldn't that work?    
> >>>>>
> >>>>> Ahh gottya! Yes agreed, this sounds like the right approach.    
> >>>>
> >>>> Please, can we just not bother handling conflict aborts at all outside of
> >>>> KVM? This is all dead code, it's complicated and it doesn't scale to the
> >>>> in-kernel use-cases that others want. There's also not been any attempt
> >>>> to add the pKVM support for handling host-side conflict aborts from what
> >>>> I can tell.
> >>>>
> >>>> For now, I would suggest limiting this series just to the KVM support
> >>>> for handling a broken/malicious guest. If the contpte performance
> >>>> improvements are worthwhile (I've asked for data), then let's add support
> >>>> for the CPUs that handle the conflict in hardware (I believe this is far
> >>>> more common than reporting the abort) so that the in-kernel users can
> >>>> benefit whilst keeping the code manageable at the same time.
> >>>>  
> >>>
> >>> Given direction the discussion is going in time to raise a hand.
> >>>
> >>> Huawei has implementations that support BBML2, and might report TLB conflict
> >>> abort after changing block size directly until an appropriate TLB invalidation
> >>> instruction completes and this Implementation Choice is architecturally compliant.  
> >>
> >> Compliant, absolutely. That's the letter of the spec. The usefulness
> >> aspect is, however, more debatable, and this is what Will is pointing
> >> out.
> >>
> >> Dealing with TLB Conflict aborts is an absolute pain if you need
> >> to handle it within the same Translation Regime and using the same
> >> TTBR as the one that has generated the fault. So at least for the time
> >> being, it might be preferable to only worry about the implementations
> >> that will promise to never generate such an abort and quietly perform
> >> an invalidation behind the kernel's back.  
> > 
> > Agreed. We're not dropping support for CPUs that don't give us what we'd
> > like here, we're just not bending over to port and maintain new
> > optimisations for them. I think that's a reasonable compromise?

Subject to usual maintainability vs performance questions sure.
Given we are the ones with the implementation, it's perhaps up to us
to prove the added complexity for a given optimization is worth the hassle
(maybe leaning on Arm to help out ;)  We have some activity going on
around this, but are unfortunately not ready to share.

> > 
> > That said, thanks for raising this, Jonathan. It's a useful data point
> > to know that TLB conflict aborts exist in the wild!  

My work here is done ;)

> 
> Indeed. Just to make it explicit; if we were to support all architecturally
> compliant BBML2 implementations, we would need to drop the final patch in this
> series. But since it sounds like we will be taking the approach of only allowing
> these optimizations for implementations that never raise conflict abort and
> handle it all in HW, it should be safe to keep the optimization in that final
> patch. I'll work with Miko to get this bashed into shape and reposted.

Obviously I'd want perf numbers to justify it (working on that) but I'd like
to keep on the table the option of patch 5 being the only part that is dependent
on being non conflict aborting hardware. I think even that is a performance
question rather than a correctness one - it simply widens the window in which
we might see a fault and have to dump the TLB. (I may well have missed something
though).

As a side note on that last patch, it is easy to conceive of a BBML2
solution that doesn't do conflict aborts, but for which it is still a performance
nightmare to not flush. As a fictional implementation, where our CPUs get a conflict
abort, we could instead have stalled the core and pushed the abort info to a management
controller, and flushed the whole TLB to resolve (plus probably the CPU pipeline).
If sufficiently rare that's not a totally stupid implementation (subject to some
optimizations). It is basically offloading what we are going to do in software on
a conflict abort with somewhat similar performance cost making widening the window
a very bad idea.

So the proposed allow list might need to be rather more nuanced than "can we get
a fault?"  We all love per uarch performance related opt ins.

Jonathan

> 
> Thanks,
> Ryan
> 
> > 
> > Will  
> 
> 


