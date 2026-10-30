Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5F4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ekAyHXDr;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJXR4YGe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4JFYFF+XVqmPJXdW9AOcrcS6NT5ie/xJlSuvhelbXCs=; b=ekAyHXDrcb0pWXN6aR5JuNhE57
	KSLP5WdzB6lT3gKIKXyLr+NHnnA9xrWQrNqc0XWNNB5iZPhor0Bn+BKClKX5+N193sa4NdqIhQufn
	bx11v+vcRDLyf+tF14SCtB3dgSDsWMPE77FElnPJLgd02+IPm0NAk9zn0n5d2dqjJ/LWIJBMwSGCZ
	qka/PzKLHvOLbK4Y4lIdkR3Knb50CQWHRPtu2duAQUKw0oaz3uMgBNNMLJHAO44q5Hdvg6cxuQVS9
	xjXV8qO1x0diI7KGckcjP9JstdFOj7v3vF7rNP1HqrzqzkziH9M51vOAzUDnu7PWerPtENySP3WW+
	Wd2XyUVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMng5-0000000BrtP-0LVl;
	Fri, 30 Oct 2026 14:33:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMng3-0000000BrtH-0zP8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:33:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56C3940987;
	Fri, 30 Oct 2026 14:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E3E1F000C1;
	Fri, 30 Oct 2026 14:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793370834;
	bh=4JFYFF+XVqmPJXdW9AOcrcS6NT5ie/xJlSuvhelbXCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JJXR4YGeMIsV8u/Etct0mCvf4yMo7V6OVh7Ci1ML8Bg3oxb2WuWNHhHpLkR4ZyoKp
	 qS9ynCkTW2BAJGEBM4upnkFvoYiw3ZwkIwYXV2G9s57/vWCu7LAmnqdHPx0+5sy7LX
	 4MsZbYhquDQfvSz74E6k24KF5pW/vZ10wa+3sPWyj8yiA3vKUHQ08NyUFBJUaI37sc
	 ZBVz9A8zEc1C8I4Ff0wtJP0QFAHuOMXxMUcK4aJvb6A4sKevlDkrwe/92xNfLl1r54
	 BY62xoFCo9MQ7YYizD/5FdtuBXKofnRVB7VjTzs7OU03Oi0adZI80mFS2B7tN0T14k
	 PWOvrQL+AzBIQ==
Date: Fri, 30 Oct 2026 14:33:48 +0000
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
Message-ID: <auSqzHVKRktkrtQC@willie-the-truck>
References: <20260901131823.15799-1-kmehltretter@gmail.com>
 <551663b9-d031-4755-af7f-dc6c22524b35@arm.com>
 <aplP1oUjx96O_I69@willie-the-truck>
 <78638e8a-4919-4c2b-b6d8-dadc7a981709@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78638e8a-4919-4c2b-b6d8-dadc7a981709@arm.com>
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

Hi Ryan,

Sorry for the slow reply here.

On Fri, Sep 04, 2026 at 11:56:25AM +0100, Ryan Roberts wrote:
> On 03/09/2026 11:45, Will Deacon wrote:
> > On Wed, Sep 02, 2026 at 08:16:36PM +0530, Dev Jain wrote:
> >> The transition happening here is:
> >>
> >> old_prot+cont -> zero -> new_prot+cont ... (i)
> >> and then TLB flush.
> >>
> >> Arm Arm rule R_JQQTC says:
> >> "For a TLB lookup in a contiguous region mapped by translation table entries
> >> that have consistent values for the Contiguous bit, but have the OA, attributes,
> >> or permissions misprogrammed, that TLB lookup is permitted to produce an OA,
> >> access permissions, and memory attributes that are consistent with any one
> >> of the programmed translation table values."
> >>
> >> This implies that a live update like
> >> old_prot+cont -> new_prot+cont then TLB flush ... (ii)
> >>
> >> is safe. Which should also imply that the transition (i) is safe,
> >> since the configurations the PE can observe for (ii) is the same
> >> for (i), except that in (ii) the PE can fault too, which is fine.
> > 
> > I'm not sure I agree. As written, the text above says that if the
> > permissions are misprogrammed (which they are in this case) then the TLB
> > can produce an OA consistent with any of the entries. Hopefully it just
> > needs some further clarification.
> 
> I'm not sure I understand your concern here. Is your concern that the OA could
> be pulled from one of the invalid entries? The intent is that any entry that
> does not have the VALID bit set is not considered an "entry" within the
> "contiguous range" for the purposes of this. (because it is invalid).

Not invalid, no, but from the old_prot+cont. There hasn't been an
invalidation, so that could still be reachable.

> That's implied (if you squint) from:
> 
> IPGVGZ: The Contiguous bit is present only in valid Block and Page translation
> table descriptors, and therefore neither of the following configurations are
> considered as misprogramming of the Contiguous bit:
>   - A contiguous range of descriptors that are each either invalid, or valid
>     with Contiguous set to 1.
>   - A contiguous range of descriptors that are each either invalid, or valid
>     with Contiguous set to 0.
> 
> In general I am of the opinion that the rules around contiguous mappings are not
> as clear as they could be and the VMSA architect has indicated that he hopes to
> clean them up over time. Bit I don't quite see your concern in this case.

I'm happy to review any proposed cleanups to the wording, fwiw.

> > There are probably also cases where we're changing the attributes and the
> > permissions at the same time, so it's not clear to me that it's safe to
> > allow those to be inconsistent (e.g. tagged/guarded vs read/write). If
> > I was going from untagged read/write -> tagged read-only then I presumably
> > wouldn't expect to see a tag check fault on a write?
> 
> Again, I'm not sure I follow, but I'll take a stab. I think you're implying that
> a write permission fault should take precedence over a tag check fault? (I have
> no idea off the top of my head). And you're further implying that with this
> transition the HW might see an intermediate "tagged read/write" entry, and if it
> does then it will raise a tag check fault, not a write fault for an attempted
> write. But I don't see how R_JQQTC permits that because it says "consistent with
> any one of the programmed translation table values" so the HW can't pick
> attributes from one entry and permissions from another. It will either see the
> old "untagged read/write" or the new "tagged read-only".

ah, I think that's where we read it differently. You're interpreting "ANY
any one of the programmed translation table values" as "EXACTLY one of the
programmed translation table value"; i.e. OA, perms and attrs are read
atomically from the same pte. Maybe (hopefully!) that's the intention,
but it's not how I read it. Now that I see how you're reading it, I can
convince myself either way!

Will

