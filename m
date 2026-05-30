Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2E3CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 00:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phE+1KnkEhHdS8v+BaZX4wBrkzOdQkb7o4Dl2ar1Vuk=; b=m8wx8x0CHbuzDC/ChTNrOomVEc
	zeD6++iNOasq9PJLCi4i+T2P5s2XYpYVYjx1r2EsQrglN/Hx/miciY2Hp3bxh5vRiTaP7M+4cMRDl
	sdXOKH7JS2+MS3+Dq2pxUJMu141RFWC04kV7LpLLlhOek+MkVRBMKJW0KyhbXO+MYZSs3crierEUL
	ZP/RHlERj0YCRP9typHMtU+HCUsBo8LBjw29wNB2rZd2NYxXativqt/2aMGd85Ojvrfc658Q/P9u1
	bJP3USphlUdDjrMQoYy2mtqCSUxKc0axHEVoOLl+8zN9tOM+2IVdSWEHq9/tho9R3bVjhztd0+/yu
	rsVTqjrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT7Y5-00000008Ka8-1dhm;
	Sat, 30 May 2026 00:27:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT7Y1-00000008KZd-3jx5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 00:27:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9374F2379;
	Fri, 29 May 2026 17:27:20 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE6EB3F632;
	Fri, 29 May 2026 17:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780100845; bh=3u91ek+mgurxIUzlX/F4MMk2CTrpEqTFfAJpfXkzi8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=magV8yMhbydlP6Mzekf8LceE5Yfv+ta9AcsS8GqoRsbr5tqgSdKHDKMQ9CIYWD4qq
	 oszU2C9MNDJNtw+OYiYv8opsv5eKbNe4BAcGo4LbaV+V6OX7/JW5znzc/yCJB+N46U
	 bnGE8u0LsuHQBSK5mbJo/p9oomt+WQ9xldJXcl+A=
Date: Sat, 30 May 2026 01:27:11 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Subject: Re: [PATCH 09/17] KVM: arm64: Move VMA-related information to
 kvm_s2_fault_vma_info
Message-ID: <mt5aqxlrtoosxbtqcchrzhxm5eitbq3dygvynivd4vza7ffppm@rl56r2yi5qqe>
References: <20260316175451.1866175-1-maz@kernel.org>
 <20260316175451.1866175-10-maz@kernel.org>
 <20260318142215.GB3915656@e124191.cambridge.arm.com>
 <CA+EHjTwbxTHr_fzSFD38cG4ZMj6XKr3L=o+=8T13XDQF0n6Raw@mail.gmail.com>
 <87ecldcxzj.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecldcxzj.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_172730_335709_376DE68F 
X-CRM114-Status: GOOD (  30.32  )
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

Hi,

On Sat, Mar 21, 2026 at 09:50:40AM +0000, Marc Zyngier wrote:
> On Wed, 18 Mar 2026 16:14:19 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> > 
> > Hi Joey,
> > 
> > First, thanks for the reviews and the comments on my series. You're
> > right about my changes wrongly editing "page". I wanted it to be as
> > mechanical as possible to make it easy to review, but it ended up
> > being too mechanical.
> > 
> > <snip>
> > 
> > > > -     /* Mark the fault->page dirty only if the fault is handled successfully */
> > > > -     if (fault->writable && !ret)
> > > > -             mark_page_dirty_in_slot(kvm, s2fd->memslot, get_canonical_gfn(s2fd, fault));
> > > > +     /* Mark the page dirty only if the fault is handled successfully */
> > > > +     if (fault->writable && !ret) {
> > > > +             phys_addr_t ipa = gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
> > > > +             ipa &= ~(mapping_size - 1);
> > > > +             mark_page_dirty_in_slot(kvm, s2fd->memslot, gpa_to_gfn(ipa));
> > >
> > > I don't understand this change, why do we need to mask stuff now?
> > 
> > Let me see if _I_ understand it (Marc, please correct me if I'm wrong).
> > 
> > Before this patch, fault->gfn and fault->vma_pagesize were mutable,
> > and transparent_hugepage_adjust() modified both directly. In addition
> > to this being confusing (which gfn is this: the host /canonical or the
> > nested one?), it made it more difficult to separate the logic.
> > 
> > So, to mark a dirty page, it did this:
> > -             mark_page_dirty_in_slot(kvm, s2fd->memslot,
> > get_canonical_gfn(s2fd, fault));
> > 
> > which relied on the old struct fault to calculate the canonical gfn
> > using the (magically) THP adjusted fault->vma_pagesize.
> > 
> > Now that fault (or s2vi, its successor in this case) isn't mutable, we
> > need to get the canonical gfn using the host mapping size.
> 
> It's exactly that, and it is slightly clearer if you look at how
> mapping_size is updated:
> 
> 	mapping_size = transparent_hugepage_adjust(kvm, s2fd->memslot,
> 						   s2fd->hva, &fault->pfn,
> 						   &gfn);
> 
> The faulting IPA is represented by 'gfn', and gets correctly updated
> by the helper. But that doesn't adjust the 'canonical' IPA, which is
> used for any memslot related update.
> 
> So if we need to call into mark_page_dirty_in_slot(), we really need
> to pick the base of the region we are actually marking dirty, hence
> the masking of the bottom bits.
> 
> Does this make sense? This is one of the area where the constification
> results in slightly more complicated code, as we can't update things
> in place anymore.

Sorry for being late, I think I am missing something:
If dirty logging is enabled, then the mapping size would be capped at
PAGE_SIZE, and THP adjust wouldn't happen. Why do we still need to align
the canonical IPA down?

Thanks,
Wei-Lin Chang

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Jazz isn't dead. It just smells funny.

