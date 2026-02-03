Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56F8E6E80C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vn5xyljVipc8CSnaDct1iDZv5oLfkX4jAtUyU6fNJ5w=; b=31SiKjmFwcOgpg2ceEj/B1y8vA
	aTC2/twVULQfqcJdIIcLZmYeq2/TY1cHsUvE4bvbR68qvii+KKHqrNKAy1t5PYxDbr724ZVa7bZUD
	iffXde9afcsphZL8lzPU575NL8ELYU79UutTEuSKlsj3aP9f3y8Yz76B/SFmEUa1JuIG7roS+EHrY
	jdSovdohJkIScIDAfssP0n15SXRAsLIpoLcwMVuekjTRtR/H7ar4qAn6IiD/YxHoJ0mmll7LWW+Pd
	g/tahnNb+y56WvrmTg/u6aaVINIhkPhzJb2eIi02QOS2aZi8vGmMRmD8qtLCA4lrdzlZb5szhtova
	A/1dF9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnEGI-00000006W3k-1kYx;
	Tue, 03 Feb 2026 11:08:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnEGH-00000006W3Z-0q1l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 11:08:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47F6D60144;
	Tue,  3 Feb 2026 11:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A74C116D0;
	Tue,  3 Feb 2026 11:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770116880;
	bh=wOFMHNOHJ6dIKzGtYWd5tnjFwJ/sMyXesnPiW8hIjn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rGD7rcf1TlmG7XSLcxUOKLuGaSUYiGaigHVe5vzkznRdtKCp2v7sadY8FL5/hEF+2
	 zYxWrk0eFAit7XlyN1foMTyGuaam3Wci+kl8eUNfOqVn7IPEU9W9hc0jLFVhj1SpTo
	 hnU37uVU65c/5uUeT0hh/24O7tPX8grYzIlybseOYoYB+glx5B4SEMcshdlNC+U7py
	 h0p8rY1ZrEa8XQ2xbBUOavTtRGkj6SG9SYXXT00EynP2RZE7cUWjjMpdUjsNADv9FO
	 yUDwyi/1D5jdcl9n7Rq9iBx4KsXSed8ZMYdRNIzJaZfDNf8PPyhalEZIr9NL/JUVYP
	 mhTkqGfiQZyuw==
Date: Tue, 3 Feb 2026 11:07:54 +0000
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexandru Elisei <Alexandru.Elisei@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>, Leo Yan <leo.yan@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: arm_spe: Add barrier before enabling profiling
 buffer
Message-ID: <aYHXCkFZcVm1L_25@willie-the-truck>
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
 <aYD08d42SewAAQCB@willie-the-truck>
 <aebe99ad-1189-4372-83e3-385f33829bd2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aebe99ad-1189-4372-83e3-385f33829bd2@linaro.org>
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

On Tue, Feb 03, 2026 at 10:46:37AM +0000, James Clark wrote:
> 
> 
> On 02/02/2026 7:03 pm, Will Deacon wrote:
> > On Fri, Jan 23, 2026 at 04:03:53PM +0000, James Clark wrote:
> > > The Arm ARM known issues document [1] states that the architecture will
> > > be relaxed so that the profiling buffer must be correctly configured
> > > when ProfilingBufferEnabled() && !SPEProfilingStopped() &&
> > > PMBLIMITR_EL1.FM != DISCARD:
> > > 
> > >    R24557
> > > 
> > >    While the Profiling Buffer is enabled, profiling is not stopped, and
> > >    Discard mode is not enabled, all of the following must be true:
> > > 
> > >    * The current write pointer must be at least one sample record below
> > >      the write limit pointer.
> > > 
> > > The same relaxation also says that writes may be completely ignored:
> > > 
> > >    When the Profiling Buffer is enabled, profiling is not stopped, and
> > >    Discard mode is not enabled, the PE might ignore a direct write to any
> > >    of the following Profiling Buffer registers, other than a direct write
> > >    to PMBLIMITR_EL1 that clears PMBLIMITR_EL1.E from 1 to 0:
> > > 
> > >    * The current write pointer, PMBPTR_EL1.
> > >    * The Limit pointer, PMBLIMITR_EL1.
> > >    * PMBSR_EL1.
> > 
> > Thinking about this some more, does that mean that the direct write to
> > PMBPTR_EL1 performs an indirect read of PMBLIMITR_EL1 so that it can
> > determine the write-ignore semantics? If so, doesn't that mean that
> > we'll get order against a subsequent direct write of PMBLIMITR_EL1
> > without an ISB thanks to table "D24-1 Synchronization requirements"
> > which says that an indirect read followed by a direct write doesn't
> > require synchronisation?
> > 
> > There's also a sentence above the table stating:
> > 
> > "Direct writes to System registers are not allowed to affect any
> >   instructions appearing in program order before the direct write."
> > 
> > so after all that, I'm not really sure why the ISB is required.
> > 
> > Will
> 
> We were under the impression that this was required for the SPU as it is
> treated as a separate entity than the PE.
> 
> In "D17.9 Synchronization and Statistical Profiling" there is:
> 
>   INDWCG
> 
>   A Context Synchronization event guarantees that a direct write to a
>   System register made by the PE in program order before the Context
>   synchronization event are observable by indirect reads and indirect
>   writes of the same System register made by a profiling operation
>   relating to a sampled operation in program order after the Context
>   synchronization event.
> 
> That specifically mentions an indirect read following a direct write, which
> seems to contradict D24-1. Although I thought this is a special case for
> SPE.

My reading of the the text above is that it is covering the direct write
-> indirect read case, whereas I think the case in the SPE driver that
we're considering for your patch is when we have an indirect read
followed by a direct write.

Will

