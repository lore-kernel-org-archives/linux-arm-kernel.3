Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA7DCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpVjroXVisHfj83brLQUbqEhnPiyl/yiKfc5znuepio=; b=kthy0WnsC7D1dj9wwzFN0i1bWh
	QbsVdXkalyWQ0za9xSalOcdaK8YfUzho09gKFPASfhNAZA3qjLzehr6FZcqGnitgs9akPCB6vOk7M
	mSkm6Dp4sAxqBFYhv3bEhicyHpY7AR5l3FUvZdvUZJD6pxDpElnrOqc7j1Tn5qZeGdK4kCVqR2hPg
	N+/Unchi8G/JC3GmZWlMzoUutfK7uUJGqjHiCZbJorIuHP+UbzGzKhkLvqTTIcw6gbo2c4V9HdTFV
	5yorEnYBrNzX6+Z8ny/cL6VNt0NnpQ/g4MGQBvkRna2tzF/drshemNVF7dOYKsDGIzC1f4/rxapw4
	13+hBtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTK-0000000GGi9-2h6o;
	Mon, 05 Oct 2026 11:03:06 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTI-0000000GGhD-1aI2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:05 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4887840c529so530944f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791198182; x=1791802982; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wpVjroXVisHfj83brLQUbqEhnPiyl/yiKfc5znuepio=;
        b=r+qMIni+N2InQYEDFoNLyJSVTd1Ui2dLWY/CIKGWpvhZdYF2U3f8Yz+2oVH/b3+fn0
         zNGrunJ+H8qCZC6iJRt+4/OmTBiEik3h25OSwpwduF6zT8VwBf/txXBZRgtLC9XfkARi
         bS+TR2hA5e0coYV7R6RCZ/STtIXp/UYyWKaOCHxCo1P8J13O0Lbc5k+S+0JfbBvdiDJh
         WZmRmcs/pa4tlGeBXKU7vt7jjCYIkH+/0AJEHzNxUx8Awptm+MHKqmG1V6YDiL49zm5d
         37MRILetMPJN1959xbxdG88lPwGR/91+EnBlWRPGHkOXXoUt3RTyMwGC+oFJ0nQnf8uL
         TuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198182; x=1791802982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpVjroXVisHfj83brLQUbqEhnPiyl/yiKfc5znuepio=;
        b=0b+TctD3dqsf57FqogCCp0u/i0ev5p5faIqdSQhbQo6c9DKbckPaSD8KotT5PgmAwG
         RwllmgJj/q0HEGKur6yJCC+We9onOkzvDrwe5HTEe/eGpk+DRq7HvW87ncAMzNRLr5GV
         ybiWWr4cq7gGS3+LzsCQEkzkPXpz2qY0Stg0870o78yaj1R8U/XPxgHMrrWh/3aD2BAr
         KdxRZBKIgE/z5ZKau0XmyhIrOaaca2gw3753CAnJKKOzDinRi3VcEPWyoR+I8qRjNIol
         unzVK4yi9L4Ffd18lJgw29rrbygZet0/4lf2Qv7UT1QX7SbyNOTy4K3X0QfoRKWdnX4S
         9Auw==
X-Forwarded-Encrypted: i=1; AKwUvBycwxPYGne2mUQa2cQjAsH9Cdhk7IFrX+Si4X2B3cd453bYKcAPrVnbXsweyRb1pwpPbImqd7l4b1KgFX8PynYa@lists.infradead.org
X-Gm-Message-State: AFq9FYK8XuNZuHnpiFzk7OoJt6mD4ieRhzEZQmtpM20DUCSEvSr1iAPc
	PbYms1A//S3e2ukKuYNd3+1wr8IdWxG3PhkpKlXTfh7FVAfKNZ7QyCxxVLxPAn2Y8Q==
X-Gm-Gg: AYBFou0YUij93nIT8cbT9LHuUcRPirb6euzr2BX0F1Q3AozHD1sifmGgbk3wN26t+6b
	wVVDOODKA1k/7FnwP2qd5EYG8qhjtWbBwlUIldMGExbB+3NVC9vZa4TaYBwjsamXSsM4LdV8z+D
	tMm08zVJtdt4u1HgPikvJTyBI4SrC1Tz5wQrkD+2x0dUkLb4SbK/aEZGRoYHJdj28nZ8bDtlC1K
	5piwc4+BkCVfWbmDC6IIyqeZqB2/syp8hWuxPBLBjrDkK3c90tJkyZBYrFxJua1Qy78S9rzO36p
	YZYDbEzXNMZl5uoJ/9bcbH8hYZer8TGyAoTAU0hCvMDi5Y6RE4cma0PYmo8Nsgm/nwL9AwE/HMa
	5GIOua3LTq4kaOjBxEw45jZXq7cIA02KiSUKTDW4tIg3hzk7+1nbSNHqJG/TZyMEY+8oiNYrUSD
	f20UV5IG5RVpKWP1IfaQ9qUupc8VWvL19WcqY8iDhZcOeN8rLi3EJHMB0yCyIyzLpunxXA3o6nJ
	qffJUw4rf4a4ggeHpyUI6pr/u6hL6351pgaqicov1s=
X-Received: by 2002:a05:6000:2906:b0:487:13a9:80d with SMTP id ffacd0b85a97d-48b12733c50mr18086704f8f.10.1791198180653;
        Mon, 05 Oct 2026 04:03:00 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6227fa65sm2880630f8f.16.2026.10.05.04.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:02:58 -0700 (PDT)
Date: Mon, 5 Oct 2026 12:02:55 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev,
	catalin.marinas@arm.com, rppt@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, ardb@kernel.org, thierry.reding@kernel.org,
	david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: sumit.garg@kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <asOD31rTX6dNfD1o@google.com>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <arIYtjmSKCs14SqO@sumit-xelite>
 <arKW_91EeKA-w96m@willie-the-truck>
 <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
 <asOAYODGZa-7EIV1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asOAYODGZa-7EIV1@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040304_443796_A4D17AAB 
X-CRM114-Status: GOOD (  54.96  )
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

Sorry, not sure why Sumit's email was dropped...

On Mon, Oct 05, 2026 at 11:48:00AM +0100, Vincent Donnefort wrote:
> On Thu, Oct 01, 2026 at 06:04:06PM +0530, Sumit Garg wrote:
> > On Tue, 29 Sep 2026 at 12:33:07 +0100, Will Deacon wrote:
> > > On Sat, Sep 26, 2026 at 05:43:08PM +0530, Sumit Garg wrote:
> > > > Looks like you dropped me from your reply.
> > > 
> > > Huh, that's weird. If I hit reply-all ('g') in mutt, it moves the entire
> > > CC list to To: and drops you. I suspect the same thing happened to Thierry
> > > when he replied here:
> > > 
> > > https://lore.kernel.org/all/arJcN60nagFKXj2Q@orome/
> > > 
> > > I can't figure out why that's happening :/
> > > I manually tried to fix the To: and Cc: lines in this message.
> > 
> > Thanks.
> > 
> > > 
> > > > On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
> > > > > I spoke to Brendan at LPC (?) last year but this doesn't really work
> > > > > for arm64 because it relies on being able to unmap arbitrary parts of
> > > > > the linear map, which isn't generally possible unless you force pte-level
> > > > > mappings for everything, which is prohibitive for perf/power.
> > > > 
> > > > As per the cover letter it's about allocating pages that are not present
> > > > in the direct map. This essentially fits the protected DMABufs use-case
> > > > where we don't want any kernel mapping to exist at any time. Bufers
> > > > allocated from protected DMABufs are only meant to be accessed by the
> > > > TEE implementation or HW accelerators like in the secure media pipeline.
> > > 
> > > That sounds like it should probably build on top of this series, then.
> > 
> > The main problem I see with this series is it tries to move from the generic
> > CMA allocator to a reserved FF-A CMA pool which again comes from the
> > DT. We already support reserved pool allocations via "no-map" which are
> > discovered dynamically from OP-TEE.
> 
> I can't think of a way around a DT declaration. We need to know what region is
> PTE-level before the direct map is installed and of_reserved_mem is very handy
> for that purpose. And as this PTE-level mapping is costly we certainly only want
> to enable it for platforms that absolutely need it.
> 
> > 
> > If we can rather support a generic CMA like allocator for arm64 which
> > can support unmapped allocations then I am all for it. These platform
> > specific reserved pools isn't a scalable solution.
> 
> What do you mean by generic CMA allocator here? An extension to
> shared-dma-pool? Or having the CMA automatically doing the unmap/map on
> cma_alloc() cma_release()?
> 
> Right now I have created an API for the unmapping/remapping part. It adds a
> burden on the caller, but the alternative solution is introducing post-alloc
> pre-dealloc callbacks in the CMA, which looked a bit overkilled to me when
> the users of that "ffa-pool" are only optee and the nvidia video dma-buf heap.
> 
> -- 
> Vincent
> 
> > 
> > > You could allocate the DMABufs from a CMA region that has no linear alias.
> > 
> > Allocation from generic CMA pool is already the case here:
> > 
> > tee_shm_alloc_dma_mem() ->
> >   dma_alloc_pages()
> > 
> > Do you mean it's just fine to unmap buffers allocated from generic CMA
> > region since it doesn't have any linear alias?
> > 
> > > 
> > > > > Vincent's series tackles that by using a pool so that only that part of
> > > > > memory requires the pte-level mappings in the linear map. That's the
> > > > > whole point of it, so I don't think it makes sense to drop it in favour
> > > > > of Brendan's approach (which doesn't work).
> > > > >
> > > > 
> > > > For protected DMABufs, we even don't require any pte-level mappings in
> > > > linear map. The whole idea of mapping and unmapping is just a bottleneck
> > > > for performance sensitive secure media pipeline use-cases. That's why if
> > > > we can support __GFP_UNMAPPED with the memory allocator on arm64 would
> > > > be the best fit for this use-case.
> > > 
> > > The point is that you will require pte-level mappings for the linear map
> > > if you want to unmap from it at runtime on arm64. If you don't, then you
> > > can end up needing to split a block mapping (e.g. pmd-level) when you
> > > decide to unmap only part of it and there isn't a safe way to do that on
> > > arm64 without transiently unmapping the entire block, which can lead to
> > > fatal translation faults during that window.
> > 
> > I agree with you here, what I am rather trying to find if on arm64 there
> > is any possibilty to have a generic allocator for unmapped pages. That's
> > the use-case here as well as what Brendan't patch-set was trying to address.
> > 
> > > 
> > > > Now the question is why arm64 can't support __GFP_UNMAPPED similar to
> > > > how Brendan is doing it for x86?
> > > 
> > > Because arm64 != x86? Presumably x86 doesn't have the strict
> > > break-before-make requirements we have on arm64.
> > > 
> > 
> > Sure, sounds like you are eluding to that the generic MM flag
> > __GFP_UNMAPPED being proposed can't be supported on arm64, right?
> > 
> > -Sumit

-- 
Vincent

