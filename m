Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702CA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i5/3P+0C;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SF2VKtXy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jXsG3Bm3ThhpjhFlxafNV8M+YNu9Kp2OePgNmcC2wD4=; b=i5/3P+0CoXC6L/6KN3FGdVD3v3
	fM9DrY9pMebjP0USMfkIV5uMu0vblVD7ATFrlo+s1F98kuDWGH6wQzCnvaWkZaAiIUHsMYvPl36kE
	3/QZI8SPpOW2Kuu42XYl3cnCCxMBAiX/pbrMSojK3wKccUfUgUztBFpjAz2QRml5+vx2oQUhfy9UO
	wbSRzvPolb14WhGjxr1a29AZwjUuMKjw/bvGm4RlqVoYlf0PKAAChBDffvVlYZbiQ1YJi0qDnqDKr
	xdh/ssZdwCA9dd+vtlt+wFE8oKEaglR7xrPySQ/I1LMz2K8fKbVyIsC9dVLTEY299Tll1WVxYEyTk
	GQCtSicw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMg8N-0000000AtT9-44sO;
	Fri, 30 Oct 2026 06:30:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMg8N-0000000AtT3-0fOO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 06:30:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 129A3601EE;
	Fri, 30 Oct 2026 06:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930F41F000C1;
	Fri, 30 Oct 2026 06:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793341837;
	bh=jXsG3Bm3ThhpjhFlxafNV8M+YNu9Kp2OePgNmcC2wD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SF2VKtXy3Tcav//c/ZbiM7OBFszrk22o0EfYrTQOXgc3yuzSEPUeMvqpEgyM+6kiu
	 vkWNPmsnBCiMVDKDhXLQ4FuFBe9DazZdJPo1ZnhamUejtRdhoakYpeqK6gGJp14Ge5
	 wGUPngb1zKG/kCp9c3MVxPX6skQwFQBNXioGeqguSTfF+7x7tPxJQxMog8AII+uOns
	 OCcOBwrD1lIPEshFbgi2zObUOUnZtQMauzHpKG5irl2bPydGurZFua+X5r5AfL0qJj
	 xqeYFe+rnEQYIKF73VtFQ4bIz+2hx5En9sRSkt5azOfeLobIDBjXGwc/LvUrsgY8sA
	 iIzvAH2F3T8tA==
Date: Fri, 30 Oct 2026 12:00:28 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Will Deacon <will@kernel.org>,
	brendan.jackman@linux.dev, catalin.marinas@arm.com, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <auQ5hCdPFz0BmvDG@sumit-xelite>
References: <arKW_91EeKA-w96m@willie-the-truck>
 <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
 <asOAYODGZa-7EIV1@google.com>
 <asOD31rTX6dNfD1o@google.com>
 <aszdnInyJxLhSQRp@sumit-xelite>
 <as3798SFCfKFirag@google.com>
 <as4ATqhp0bPI03PA@sumit-xelite>
 <auILvMVSXk9pZh6M@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auILvMVSXk9pZh6M@google.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 at 14:50:36 +0000, Vincent Donnefort wrote:
>On Tue, Oct 13, 2026 at 03:26:30PM +0530, Sumit Garg wrote:
>> On Tue, 13 Oct 2026 at 10:37:59 +0100, Vincent Donnefort wrote:
>> > On Mon, Oct 12, 2026 at 06:46:12PM +0530, Sumit Garg wrote:
>> > > On Mon, 05 Oct 2026 at 12:02:55 +0100, Vincent Donnefort wrote:
>> > > > Sorry, not sure why Sumit's email was dropped...
>> > >
>> > > The problem was with my mutt config, it should be fixed now.
>> > >
>> > > >
>> > > > On Mon, Oct 05, 2026 at 11:48:00AM +0100, Vincent Donnefort wrote:
>> > > > > On Thu, Oct 01, 2026 at 06:04:06PM +0530, Sumit Garg wrote:
>> > > > > > On Tue, 29 Sep 2026 at 12:33:07 +0100, Will Deacon wrote:
>> > > > > > > On Sat, Sep 26, 2026 at 05:43:08PM +0530, Sumit Garg wrote:
>> > > > > > > > Looks like you dropped me from your reply.
>> > > > > > >
>> > > > > > > Huh, that's weird. If I hit reply-all ('g') in mutt, it moves the entire
>> > > > > > > CC list to To: and drops you. I suspect the same thing happened to Thierry
>> > > > > > > when he replied here:
>> > > > > > >
>> > > > > > > https://lore.kernel.org/all/arJcN60nagFKXj2Q@orome/
>> > > > > > >
>> > > > > > > I can't figure out why that's happening :/
>> > > > > > > I manually tried to fix the To: and Cc: lines in this message.
>> > > > > >
>> > > > > > Thanks.
>> > > > > >
>> > > > > > >
>> > > > > > > > On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
>> > > > > > > > > I spoke to Brendan at LPC (?) last year but this doesn't really work
>> > > > > > > > > for arm64 because it relies on being able to unmap arbitrary parts of
>> > > > > > > > > the linear map, which isn't generally possible unless you force pte-level
>> > > > > > > > > mappings for everything, which is prohibitive for perf/power.
>> > > > > > > >
>> > > > > > > > As per the cover letter it's about allocating pages that are not present
>> > > > > > > > in the direct map. This essentially fits the protected DMABufs use-case
>> > > > > > > > where we don't want any kernel mapping to exist at any time. Bufers
>> > > > > > > > allocated from protected DMABufs are only meant to be accessed by the
>> > > > > > > > TEE implementation or HW accelerators like in the secure media pipeline.
>> > > > > > >
>> > > > > > > That sounds like it should probably build on top of this series, then.
>> > > > > >
>> > > > > > The main problem I see with this series is it tries to move from the generic
>> > > > > > CMA allocator to a reserved FF-A CMA pool which again comes from the
>> > > > > > DT. We already support reserved pool allocations via "no-map" which are
>> > > > > > discovered dynamically from OP-TEE.
>> > > > >
>> > > > > I can't think of a way around a DT declaration. We need to know what region is
>> > > > > PTE-level before the direct map is installed and of_reserved_mem is very handy
>> > > > > for that purpose. And as this PTE-level mapping is costly we certainly only want
>> > > > > to enable it for platforms that absolutely need it.
>> > > > >
>> > >
>> > > I am rather thinking of a way to turn the default CMA allocator to be
>> > > PTE-level mapped. Since the overall idea for this dynamic protected
>> > > buffers was to reuse memory efficiently, otherwise the reserved buffer
>> > > approach is already there to use as "no-map" via DT.
>> >
>> > When the default CMA allocator is setup, it is already too late
>> > (dma_contiguous_reserve() is called after map_mem()). I am not sure this can be
>> > reordered easily due to the dependency on dma_limits_init().
>>
>> Yeah I saw that constraint too, let's leave it for future extension
>> then although having this reordering dependency fixed will be ideal.
>>
>> >
>> > So the only case it would work would be when a reserved memory has set
>> > "linux,cma-default".
>> >
>>
>> Let's rather just turn DT based default CMA pool to support PTE-level
>> mapping and keep it configurable via Kconfig or cmdline or DT.
>
>If we need a DT declaration anyway, a Kconfig and a cmdline option aren't really
>necessary.

Agree, it rather makes sense for DT independent generic CMA pool.

>
>Also, Rob wasn't very keen on having a DT option for the reserved memory and
>suggested to have a compatible string instead [1]. So perhaps we could have a
>a separate driver that handles the unmapping.
>
>	linux,cma {
>		compatible = "shared-dma-pool", "unmap-on-alloc";
>		reusable;
>		linux,cma-default;
>		...
> 	}
>
>That "unmap-on-alloc" driver sets the memblock flags and register some cma hooks
>(to be defined) for cma_alloc/cma_free where it unmaps/re-maps into the linear
>map.
>
>The nice property is optee won't need to be modified anymore. The downside is
>the entire pool is now mapped at PTE-level.

Sounds reasonable to me. If folks are really worried about performance
with generic CMA PTE-level map then OP-TEE already supports no-map based
reserved carveouts for protected DMABufs too.

-Sumit

>
>[1] http://lore.kernel.org/all/20260902172436.GB1440252-robh@kernel.org/
>
>-- 
>Vincent
>
>>
>> -Sumit
>>
>> > >
>> > > If we can have "cma_unmap" cmdline option alongside "cma" then it can
>> > > turn the existing default CMA allocator to support unmapping buffers.
>> > > Not requiring a DT change at all, although we can have the DT property
>> > > for the default pool too if platforms want to opt for.
>> > >
>> > > > > >
>> > > > > > If we can rather support a generic CMA like allocator for arm64 which
>> > > > > > can support unmapped allocations then I am all for it. These platform
>> > > > > > specific reserved pools isn't a scalable solution.
>> > > > >
>> > > > > What do you mean by generic CMA allocator here? An extension to
>> > > > > shared-dma-pool? Or having the CMA automatically doing the unmap/map on
>> > > > > cma_alloc() cma_release()?
>> > > > >
>> > > > > Right now I have created an API for the unmapping/remapping part. It adds a
>> > > > > burden on the caller, but the alternative solution is introducing post-alloc
>> > > > > pre-dealloc callbacks in the CMA, which looked a bit overkilled to me when
>> > > > > the users of that "ffa-pool" are only optee and the nvidia video dma-buf heap.
>> > > > >
>> > >
>> > > I am not too worried about where the actual implementation lives but
>> > > looks like CMA driver to be the better place. I think use-cases like
>> > > guest_memfd proposed as a user for __GFP_UNMAPPED on arm64 will also be
>> > > looking for this feature.
>> > >
>> > > -Sumit
>> > >
>> > > > >
>> > > > > >
>> > > > > > > You could allocate the DMABufs from a CMA region that has no linear alias.
>> > > > > >
>> > > > > > Allocation from generic CMA pool is already the case here:
>> > > > > >
>> > > > > > tee_shm_alloc_dma_mem() ->
>> > > > > >   dma_alloc_pages()
>> > > > > >
>> > > > > > Do you mean it's just fine to unmap buffers allocated from generic CMA
>> > > > > > region since it doesn't have any linear alias?
>> > > > > >
>> > > > > > >
>> > > > > > > > > Vincent's series tackles that by using a pool so that only that part of
>> > > > > > > > > memory requires the pte-level mappings in the linear map. That's the
>> > > > > > > > > whole point of it, so I don't think it makes sense to drop it in favour
>> > > > > > > > > of Brendan's approach (which doesn't work).
>> > > > > > > > >
>> > > > > > > >
>> > > > > > > > For protected DMABufs, we even don't require any pte-level mappings in
>> > > > > > > > linear map. The whole idea of mapping and unmapping is just a bottleneck
>> > > > > > > > for performance sensitive secure media pipeline use-cases. That's why if
>> > > > > > > > we can support __GFP_UNMAPPED with the memory allocator on arm64 would
>> > > > > > > > be the best fit for this use-case.
>> > > > > > >
>> > > > > > > The point is that you will require pte-level mappings for the linear map
>> > > > > > > if you want to unmap from it at runtime on arm64. If you don't, then you
>> > > > > > > can end up needing to split a block mapping (e.g. pmd-level) when you
>> > > > > > > decide to unmap only part of it and there isn't a safe way to do that on
>> > > > > > > arm64 without transiently unmapping the entire block, which can lead to
>> > > > > > > fatal translation faults during that window.
>> > > > > >
>> > > > > > I agree with you here, what I am rather trying to find if on arm64 there
>> > > > > > is any possibilty to have a generic allocator for unmapped pages. That's
>> > > > > > the use-case here as well as what Brendan't patch-set was trying to address.
>> > > > > >
>> > > > > > >
>> > > > > > > > Now the question is why arm64 can't support __GFP_UNMAPPED similar to
>> > > > > > > > how Brendan is doing it for x86?
>> > > > > > >
>> > > > > > > Because arm64 != x86? Presumably x86 doesn't have the strict
>> > > > > > > break-before-make requirements we have on arm64.
>> > > > > > >
>> > > > > >
>> > > > > > Sure, sounds like you are eluding to that the generic MM flag
>> > > > > > __GFP_UNMAPPED being proposed can't be supported on arm64, right?
>> > > > > >
>> > > > > > -Sumit
>> > > >
>> > > > --
>> > > > Vincent
>> >
>

