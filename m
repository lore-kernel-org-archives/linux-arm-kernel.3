Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D085CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 11:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+gknYVW9XCp81xeC0RXx9vcOUHAJigZEtqY/xe8b6c=; b=f1mXTmqMDXEx/75RtgL74rmzK/
	52qCVNNWEg5rUn98+WaBFzkw3qP/W1ClSLhH/u8HFFaEsvGNfMcAVX4PPr/D8A+5WhxhkT5bkyc8X
	abf0BGbpQcRhMylX3GhkPO4QCbm+FGQsP+O5EWYKh4J/cTuCiVAi3p57NskT0KPLN6JbMuTOUm31y
	f6FQlnimiSfluntPQ/KLxssSRKA12ffD44bfmZWm3tLgUFflT+6i2gPgkfmZcF83Bu6kU6Qlk7kMx
	a6GyZFQOuM5yBhim/k6NxYINDurKhxIa5WfuXM1lUggJzVrhqyzOU4rS+yax0cQmCeKUKhMdxJCxy
	Bmyu9kxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBW5G-00000003QDW-1S8f;
	Tue, 29 Sep 2026 11:33:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBW5E-00000003QD5-0DM7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 11:33:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5955860008;
	Tue, 29 Sep 2026 11:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998C31F000FF;
	Tue, 29 Sep 2026 11:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790681595;
	bh=e+gknYVW9XCp81xeC0RXx9vcOUHAJigZEtqY/xe8b6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eDfq3ESVa10xLkpSv+CeI5FF1JUQktUhny83NdvHPN+F/Gsl0SORQ8nYLanhlRObL
	 3rtdxQBVjPAYI6hiVUnHd2NqzqZjFK+DdiO30XeURd23enxO2BENrhbozvNTo5RMYo
	 MYRqeYSyedXYG4xB4W19ElcDnoU1dp5FvngYHL6+vLcL7hF3RwBnN7qcbNHBTDS8zJ
	 G4jFmbmUNbbCax96iFWSepuDD2HCv4SUjvmjwVLpy5ix5REIGjVm+psvkgOeJbOSOT
	 dtC2VTT9NqBZqFMgmDJbtzbdP8r2tD9CXrS2Vf0OI6pkF21ISs5ROETw/aW89lfLlc
	 xH4NbBNe8Tgjg==
Date: Tue, 29 Sep 2026 12:33:07 +0100
From: Will Deacon <will@kernel.org>
To: sumit.garg@kernel.org
Cc: brendan.jackman@linux.dev, Vincent Donnefort <vdonnefort@google.com>,
	catalin.marinas@arm.com, rppt@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, ardb@kernel.org, thierry.reding@kernel.org,
	david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <aruh86rd5FMv2i9G@willie-the-truck>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <arIYtjmSKCs14SqO@sumit-xelite>
 <arKW_91EeKA-w96m@willie-the-truck>
 <are21BjeS1O3RYE3@sumit-xelite>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <are21BjeS1O3RYE3@sumit-xelite>
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

On Sat, Sep 26, 2026 at 05:43:08PM +0530, Sumit Garg wrote:
> Looks like you dropped me from your reply.

Huh, that's weird. If I hit reply-all ('g') in mutt, it moves the entire
CC list to To: and drops you. I suspect the same thing happened to Thierry
when he replied here:

https://lore.kernel.org/all/arJcN60nagFKXj2Q@orome/

I can't figure out why that's happening :/
I manually tried to fix the To: and Cc: lines in this message.

> On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
> > I spoke to Brendan at LPC (?) last year but this doesn't really work
> > for arm64 because it relies on being able to unmap arbitrary parts of
> > the linear map, which isn't generally possible unless you force pte-level
> > mappings for everything, which is prohibitive for perf/power.
> 
> As per the cover letter it's about allocating pages that are not present
> in the direct map. This essentially fits the protected DMABufs use-case
> where we don't want any kernel mapping to exist at any time. Bufers
> allocated from protected DMABufs are only meant to be accessed by the
> TEE implementation or HW accelerators like in the secure media pipeline.

That sounds like it should probably build on top of this series, then.
You could allocate the DMABufs from a CMA region that has no linear alias.

> > Vincent's series tackles that by using a pool so that only that part of
> > memory requires the pte-level mappings in the linear map. That's the
> > whole point of it, so I don't think it makes sense to drop it in favour
> > of Brendan's approach (which doesn't work).
> > 
> 
> For protected DMABufs, we even don't require any pte-level mappings in
> linear map. The whole idea of mapping and unmapping is just a bottleneck
> for performance sensitive secure media pipeline use-cases. That's why if
> we can support __GFP_UNMAPPED with the memory allocator on arm64 would
> be the best fit for this use-case.

The point is that you will require pte-level mappings for the linear map
if you want to unmap from it at runtime on arm64. If you don't, then you
can end up needing to split a block mapping (e.g. pmd-level) when you
decide to unmap only part of it and there isn't a safe way to do that on
arm64 without transiently unmapping the entire block, which can lead to
fatal translation faults during that window.

> Now the question is why arm64 can't support __GFP_UNMAPPED similar to
> how Brendan is doing it for x86?

Because arm64 != x86? Presumably x86 doesn't have the strict
break-before-make requirements we have on arm64.

Will

