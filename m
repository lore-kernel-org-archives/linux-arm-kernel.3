Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6043CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzSvFLGXXhDhvscc/9MFlHIrUkWd1NO5NFV4BtnVy4A=; b=NYHnBnMu/LbUx6KYi7DOkIzJtZ
	Tv2T/LiK8V2R+q0vxJs36eE+ovbi6HgPLT9RcjU4ZkUSLOaAsQXE6tYtwsT0+byrVn6HaR21WgQ/W
	A2sk8QvpLyQ8L4zcGYiVidgiDmbudApglS2B+ZWECuKPDvQedH6mGy/SFRG6zNojbJCSpkT2plIgY
	nkxH8gNWDZFQ8hL8Auw30nRxNnUYYQBQZ/6xiAsu5YdRXhd5Zpob+87kIwHi42FcTeh5ISEjr4gwZ
	fcp2X1iKHHUkJMLFvX4S8bEpBczygimFrrAQjVg7K5BM1Xo60W0J+lBSjTEP3u684I3eAk72KxLDo
	ZGDCvUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFzN-0000000947n-1H2c;
	Thu, 01 Oct 2026 12:34:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFzM-0000000947e-1n8V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:34:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3DEA401C2;
	Thu,  1 Oct 2026 12:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FD81F00898;
	Thu,  1 Oct 2026 12:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790858055;
	bh=PzSvFLGXXhDhvscc/9MFlHIrUkWd1NO5NFV4BtnVy4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=if4SvAJ18eHheJNDIHcxsy7TV/obUhX+e28ofec1ugv6Qzf1xWPauEKNX2d5q4tTp
	 lqIuMR+qdhIvYgLNPo+Xu71RRG2jvwkgCBw9d0spl9LBDZYsQtwcfML4ZVgiSM96eu
	 NziDpTlnYQuD6PZdYxCPJL8kHi9knoo5gRcjO9s2i9wA9xfxVdbp6Yvnr/0AAd0qde
	 D8UclBqsHY5y39KB5plqsT63o4jWH8xj6VEW4Hu89PvcGeID+lsA7y6rvKVYZ9Xbb6
	 3yejC5BjkVY3QrY5fE+q8ahCPjh/bI+RcEG2FarJLbEFB9YnZ35RB5mMH9dP/3yAwJ
	 NiIHnfgpTOdfw==
Date: Thu, 1 Oct 2026 18:04:06 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: brendan.jackman@linux.dev, Vincent Donnefort <vdonnefort@google.com>,
	catalin.marinas@arm.com, rppt@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, ardb@kernel.org, thierry.reding@kernel.org,
	david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <ar5TPvANFUoosxGW@sumit-xelite>
Mail-Followup-To: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev,
	Vincent Donnefort <vdonnefort@google.com>, catalin.marinas@arm.com,
	rppt@kernel.org, akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <arIYtjmSKCs14SqO@sumit-xelite>
 <arKW_91EeKA-w96m@willie-the-truck>
 <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aruh86rd5FMv2i9G@willie-the-truck>
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

On Tue, 29 Sep 2026 at 12:33:07 +0100, Will Deacon wrote:
>On Sat, Sep 26, 2026 at 05:43:08PM +0530, Sumit Garg wrote:
>> Looks like you dropped me from your reply.
>
>Huh, that's weird. If I hit reply-all ('g') in mutt, it moves the entire
>CC list to To: and drops you. I suspect the same thing happened to Thierry
>when he replied here:
>
>https://lore.kernel.org/all/arJcN60nagFKXj2Q@orome/
>
>I can't figure out why that's happening :/
>I manually tried to fix the To: and Cc: lines in this message.

Thanks.

>
>> On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
>> > I spoke to Brendan at LPC (?) last year but this doesn't really work
>> > for arm64 because it relies on being able to unmap arbitrary parts of
>> > the linear map, which isn't generally possible unless you force pte-level
>> > mappings for everything, which is prohibitive for perf/power.
>>
>> As per the cover letter it's about allocating pages that are not present
>> in the direct map. This essentially fits the protected DMABufs use-case
>> where we don't want any kernel mapping to exist at any time. Bufers
>> allocated from protected DMABufs are only meant to be accessed by the
>> TEE implementation or HW accelerators like in the secure media pipeline.
>
>That sounds like it should probably build on top of this series, then.

The main problem I see with this series is it tries to move from the generic
CMA allocator to a reserved FF-A CMA pool which again comes from the
DT. We already support reserved pool allocations via "no-map" which are
discovered dynamically from OP-TEE.

If we can rather support a generic CMA like allocator for arm64 which
can support unmapped allocations then I am all for it. These platform
specific reserved pools isn't a scalable solution.

>You could allocate the DMABufs from a CMA region that has no linear alias.

Allocation from generic CMA pool is already the case here:

tee_shm_alloc_dma_mem() ->
   dma_alloc_pages()

Do you mean it's just fine to unmap buffers allocated from generic CMA
region since it doesn't have any linear alias?

>
>> > Vincent's series tackles that by using a pool so that only that part of
>> > memory requires the pte-level mappings in the linear map. That's the
>> > whole point of it, so I don't think it makes sense to drop it in favour
>> > of Brendan's approach (which doesn't work).
>> >
>>
>> For protected DMABufs, we even don't require any pte-level mappings in
>> linear map. The whole idea of mapping and unmapping is just a bottleneck
>> for performance sensitive secure media pipeline use-cases. That's why if
>> we can support __GFP_UNMAPPED with the memory allocator on arm64 would
>> be the best fit for this use-case.
>
>The point is that you will require pte-level mappings for the linear map
>if you want to unmap from it at runtime on arm64. If you don't, then you
>can end up needing to split a block mapping (e.g. pmd-level) when you
>decide to unmap only part of it and there isn't a safe way to do that on
>arm64 without transiently unmapping the entire block, which can lead to
>fatal translation faults during that window.

I agree with you here, what I am rather trying to find if on arm64 there
is any possibilty to have a generic allocator for unmapped pages. That's
the use-case here as well as what Brendan't patch-set was trying to address.

>
>> Now the question is why arm64 can't support __GFP_UNMAPPED similar to
>> how Brendan is doing it for x86?
>
>Because arm64 != x86? Presumably x86 doesn't have the strict
>break-before-make requirements we have on arm64.
>

Sure, sounds like you are eluding to that the generic MM flag
__GFP_UNMAPPED being proposed can't be supported on arm64, right?

-Sumit

