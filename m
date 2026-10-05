Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C05CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0E0kZNEEosSgGH99aMOAH+blyCZGVgX/b9FbaeaxoPo=; b=FmyO4l7Y9LglzZz5f7J9z7i4Le
	5xxeoqKywYU7s+01sLg58qKzt6FE0B/lak6JjoKq6W+VORZnTbpXyieZvmu6rj2B3+tFUsEv6V1CL
	2i5lLetYpguekbq+VOenrOxKpa8Hhst0r/xkg5aJA/9dtIlB0Tqn4diFetaSFJrHhft1zP0JXN64U
	i04J8Qb3pt9UU4ehKyO7S5EN7u1Bc2coQFWbj6sdwZ0p1Z1JOHZQtpfifMXSyDzl0PQewWEUgAjuY
	YtB3jKEHfkJUOsaow6eYKkyxggxAAntt6VLmU8Cf1I+6iAgOofRXinjq6inQMKWQIm43iJ3qCwaPv
	0f8TCcHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgEv-0000000GDlY-3lRV;
	Mon, 05 Oct 2026 10:48:13 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgEq-0000000GDjZ-44Pj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:48:10 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d8239so13768745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 03:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791197287; x=1791802087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0E0kZNEEosSgGH99aMOAH+blyCZGVgX/b9FbaeaxoPo=;
        b=tlr59VDknuC5iL5f4FsaeIDnVUEXt4sf3GXtrSpLNZvDEUpeACsdg+ilReES5ekCbs
         vqy50L5r+MHftwLxEzgickEmI17yfEueOL2lHIwcyBv6jY4Rxr1R9BqoBfbSkryBTglV
         AxYj2jbAvzOGQphIbmhPh5ChI3UBpQ4CpYINmvunfbkV8jZhdUDHlKvTNSViggfGP9Oh
         aeeIufDaPnUcG874f+0bJZR8ROA965J+5CvOJVJz+ZVt9478jHUEboMrAz0VvTu8fuEA
         1+aIowgZuri3AUj6wEulJfH8FoHPDgCC2lLkDDnadGOPFodtHqX1IFRnKymhTWmCpdEv
         0JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197287; x=1791802087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0E0kZNEEosSgGH99aMOAH+blyCZGVgX/b9FbaeaxoPo=;
        b=Cvu0a9ipyY0zIeHWRMaQ44rGGxz+i41OeFTyWgvcCeRc+FQLHF2nPolt3Qu1Cofb1a
         KQrCUadf/0ovSx1/I7ZPpoMF1JoEKN3e1JplPL15WwJSnLWu4VtNnW452KVt5ib3Z088
         Al8xID7OwniFoKlO7USmLVAU7HTJB5P+Ek4Qu9O9N0S3SvWLtMRd4euI5iEqA2AR64wZ
         0rBa1mU5HDxpj72DyAAQllHiBD9hTJbrI7uroOTYVVuYNp0CHt5ovlRCea0ayOEF3m2X
         Ua9NdUyHR73Ha0vn1b9pHo3kD0oo+WLzXA7s1FfYySs1lNUvIRvSjihKRysUsYoseb2m
         +iJw==
X-Forwarded-Encrypted: i=1; AKwUvBzODhDgMrTZLK2Hiju4R3Pk2V/03RvWipDZBnn5iCiIcdsqcRE0E0BeBleLLdKC1UklXZXIHx6xltS6WkVogh2W@lists.infradead.org
X-Gm-Message-State: AFuF++niKU+KZNWAKEDKLbpH2fptkDSZAu2Z0DQrSwIQmHwAMtutll/S
	yykYnY21w3ZF3b2zVGkUWSJe0gbQtJbT+sdqDfJq0p79EVak1UZSra8zq9SZf0YOwQ==
X-Gm-Gg: AYBFou1ldkfIXA+0U6qCW49mpYd5kd7vbJFD8CSlS7URFC5/ShzFKGf//w1u0YW9UWl
	jbXwJJEdOEqDkXWi+p+Bt2wR6jj1k5D8BiAPGXYKK9uEPx+YHg02dIFDBbXA3HHj29EXmSmnixb
	btSoOcbyZ5Gnp/sl5FGulMlbmNm7oxOd2rTnD4CDhHULVyLD+vE3QwR++EDahwx/lL/VdN9aWaF
	04EPT/EDbhi+UV+rNEbVjbdD8Ijpup2m6mNyXLwf/vY+VDusKH6elCUjcAtvfShF3a+TKBrWopz
	/0dHxlCXx3xStwJOs+/xARxhCIxb4vn2taLtyP/Mrh26S6qHIVSGLmgVEn4l+RU4gcQ9hedCBSl
	PN/Z2ndT+reAWF1Ca87IKj46vgAvWhdGHUNoTHV3JwqHCmCOc5DvThNNg8jf7WDDxnCIGs+NFx5
	G+q8BJbp/I1Q9uXan6ogagwLSczoGpSRLjJZOl4oy/XXMojg0KBVzgVkX+9eUDdzsPcSbD95Joy
	+BJqWAJNQ9Ffg6a2MOSYqjoPzBlYwSyOun7M/ViJvE=
X-Received: by 2002:a05:600c:a112:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a17690d93emr7713595e9.17.1791197286488;
        Mon, 05 Oct 2026 03:48:06 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm329471285e9.4.2026.10.05.03.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:48:04 -0700 (PDT)
Date: Mon, 5 Oct 2026 11:48:00 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev,
	catalin.marinas@arm.com, rppt@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, ardb@kernel.org, thierry.reding@kernel.org,
	david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <asOAYODGZa-7EIV1@google.com>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <arIYtjmSKCs14SqO@sumit-xelite>
 <arKW_91EeKA-w96m@willie-the-truck>
 <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar5TPvANFUoosxGW@sumit-xelite>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_034809_034339_6FB6C068 
X-CRM114-Status: GOOD (  51.27  )
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

On Thu, Oct 01, 2026 at 06:04:06PM +0530, Sumit Garg wrote:
> On Tue, 29 Sep 2026 at 12:33:07 +0100, Will Deacon wrote:
> > On Sat, Sep 26, 2026 at 05:43:08PM +0530, Sumit Garg wrote:
> > > Looks like you dropped me from your reply.
> > 
> > Huh, that's weird. If I hit reply-all ('g') in mutt, it moves the entire
> > CC list to To: and drops you. I suspect the same thing happened to Thierry
> > when he replied here:
> > 
> > https://lore.kernel.org/all/arJcN60nagFKXj2Q@orome/
> > 
> > I can't figure out why that's happening :/
> > I manually tried to fix the To: and Cc: lines in this message.
> 
> Thanks.
> 
> > 
> > > On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
> > > > I spoke to Brendan at LPC (?) last year but this doesn't really work
> > > > for arm64 because it relies on being able to unmap arbitrary parts of
> > > > the linear map, which isn't generally possible unless you force pte-level
> > > > mappings for everything, which is prohibitive for perf/power.
> > > 
> > > As per the cover letter it's about allocating pages that are not present
> > > in the direct map. This essentially fits the protected DMABufs use-case
> > > where we don't want any kernel mapping to exist at any time. Bufers
> > > allocated from protected DMABufs are only meant to be accessed by the
> > > TEE implementation or HW accelerators like in the secure media pipeline.
> > 
> > That sounds like it should probably build on top of this series, then.
> 
> The main problem I see with this series is it tries to move from the generic
> CMA allocator to a reserved FF-A CMA pool which again comes from the
> DT. We already support reserved pool allocations via "no-map" which are
> discovered dynamically from OP-TEE.

I can't think of a way around a DT declaration. We need to know what region is
PTE-level before the direct map is installed and of_reserved_mem is very handy
for that purpose. And as this PTE-level mapping is costly we certainly only want
to enable it for platforms that absolutely need it.

> 
> If we can rather support a generic CMA like allocator for arm64 which
> can support unmapped allocations then I am all for it. These platform
> specific reserved pools isn't a scalable solution.

What do you mean by generic CMA allocator here? An extension to
shared-dma-pool? Or having the CMA automatically doing the unmap/map on
cma_alloc() cma_release()?

Right now I have created an API for the unmapping/remapping part. It adds a
burden on the caller, but the alternative solution is introducing post-alloc
pre-dealloc callbacks in the CMA, which looked a bit overkilled to me when
the users of that "ffa-pool" are only optee and the nvidia video dma-buf heap.

-- 
Vincent

> 
> > You could allocate the DMABufs from a CMA region that has no linear alias.
> 
> Allocation from generic CMA pool is already the case here:
> 
> tee_shm_alloc_dma_mem() ->
>   dma_alloc_pages()
> 
> Do you mean it's just fine to unmap buffers allocated from generic CMA
> region since it doesn't have any linear alias?
> 
> > 
> > > > Vincent's series tackles that by using a pool so that only that part of
> > > > memory requires the pte-level mappings in the linear map. That's the
> > > > whole point of it, so I don't think it makes sense to drop it in favour
> > > > of Brendan's approach (which doesn't work).
> > > >
> > > 
> > > For protected DMABufs, we even don't require any pte-level mappings in
> > > linear map. The whole idea of mapping and unmapping is just a bottleneck
> > > for performance sensitive secure media pipeline use-cases. That's why if
> > > we can support __GFP_UNMAPPED with the memory allocator on arm64 would
> > > be the best fit for this use-case.
> > 
> > The point is that you will require pte-level mappings for the linear map
> > if you want to unmap from it at runtime on arm64. If you don't, then you
> > can end up needing to split a block mapping (e.g. pmd-level) when you
> > decide to unmap only part of it and there isn't a safe way to do that on
> > arm64 without transiently unmapping the entire block, which can lead to
> > fatal translation faults during that window.
> 
> I agree with you here, what I am rather trying to find if on arm64 there
> is any possibilty to have a generic allocator for unmapped pages. That's
> the use-case here as well as what Brendan't patch-set was trying to address.
> 
> > 
> > > Now the question is why arm64 can't support __GFP_UNMAPPED similar to
> > > how Brendan is doing it for x86?
> > 
> > Because arm64 != x86? Presumably x86 doesn't have the strict
> > break-before-make requirements we have on arm64.
> > 
> 
> Sure, sounds like you are eluding to that the generic MM flag
> __GFP_UNMAPPED being proposed can't be supported on arm64, right?
> 
> -Sumit

