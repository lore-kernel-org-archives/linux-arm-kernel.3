Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44129C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJtCxr6SsmG+7oqPAO3/fjLakFwcn/sSc05iILsC2RU=; b=nCM4PembjZriD0ZsbqB5dgL+V9
	7s5FungbjynkxBC2inQUYkKNq8ggkARh0WYvMaNEIOB8rgs0+2STLq006u4S6vzaEYcbLaMoxAmgo
	I5OVpnQ1mgpi1yYcRSqsKbsgD0yVjHtK/rvWho7vsDkX7YP3cC2DmDnhfzgnHp5N2I+5JGW69sOih
	Cv05A9wqxM8/Khcsk+jnjNSeJTxi7ySpuGm2z1mdh1xglWmBtBMGH0pShze8/CrpqGOITIgmRmcD5
	cecykZnKbvAxjJbV4Bon2rCB79ztBYMscX4UWHcii0MKEyT0Br0vZJSEioxAtyTQXcYsMoKHghCDz
	lLGAd/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24x4-0000000H7kH-2TRe;
	Thu, 03 Sep 2026 10:45:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24x3-0000000H7kA-3t46
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:45:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C422600C8;
	Thu,  3 Sep 2026 10:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621DC1F000E9;
	Thu,  3 Sep 2026 10:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788432348;
	bh=KJtCxr6SsmG+7oqPAO3/fjLakFwcn/sSc05iILsC2RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oGh3WhUToaQ5eeaXV1j2TAW1tA+oR/lSfzzF+1AQPmatJDqSYxP+bvGRp+w+NpWt5
	 78mjd3UYllWUZ/OiCqark7/aQmfpiprMWu61PvYCxedV45JUjvOdl/OD3GOAJFk35K
	 BHLHxoDosBmZ+b8042lQDw2C6ZvwYEgt1gpfrKIxP/zZglsAHR3JoVdPeCSfBvQQwu
	 Te/fNBfGKwOL7PzqhdfYGQHDLJDsRnntRlDJLRDODBTVKA0r1BGfgBoNL5u/v9Umeh
	 BRDFpmTPMobmUQMehL1zRLUWObxFxaCwQ+fklPJxkVSYazAvDG0AqA+XpIVbxxoy3T
	 KcP6xVcG0N0dA==
Date: Thu, 3 Sep 2026 11:45:42 +0100
From: Will Deacon <will@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
Message-ID: <aplP1oUjx96O_I69@willie-the-truck>
References: <20260901131823.15799-1-kmehltretter@gmail.com>
 <551663b9-d031-4755-af7f-dc6c22524b35@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <551663b9-d031-4755-af7f-dc6c22524b35@arm.com>
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

On Wed, Sep 02, 2026 at 08:16:36PM +0530, Dev Jain wrote:
> 
> 
> On 01/09/26 6:48 pm, Karl Mehltretter wrote:
> > huge_ptep_modify_prot_start() clears a hugetlb entry before changing its
> > permissions. For contiguous PTE mappings, break-before-make (BBM)
> > requires a TLB invalidation after clearing the set and before making any
> > entry valid again.
> > 
> > Commit fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from
> > get_clear_flush()") removed this invalidation, relying on the deferred
> > flush from the core code. Commit 410982303772 ("arm64: hugetlb: Restore
> > TLB invalidation for BBM on contiguous ptes") restored it for
> > huge_ptep_set_{access_flags,wrprotect}(), since a deferred flush is too
> > late for the break step. The modify-prot path has the same problem.
> > 
> > Use huge_ptep_clear_flush() for contiguous entries so that the TLB is
> > invalidated during the break step. Leave huge_ptep_get_and_clear()
> > unchanged because it is also used by teardown paths, where the deferred
> > flush is sufficient.
> > 
> > Fixes: fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from get_clear_flush()")
> > Assisted-by: LLM
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> > ---
> 
> The transition happening here is:
> 
> old_prot+cont -> zero -> new_prot+cont ... (i)
> and then TLB flush.
> 
> Arm Arm rule R_JQQTC says:
> "For a TLB lookup in a contiguous region mapped by translation table entries
> that have consistent values for the Contiguous bit, but have the OA, attributes,
> or permissions misprogrammed, that TLB lookup is permitted to produce an OA,
> access permissions, and memory attributes that are consistent with any one
> of the programmed translation table values."
> 
> This implies that a live update like
> old_prot+cont -> new_prot+cont then TLB flush ... (ii)
> 
> is safe. Which should also imply that the transition (i) is safe,
> since the configurations the PE can observe for (ii) is the same
> for (i), except that in (ii) the PE can fault too, which is fine.

I'm not sure I agree. As written, the text above says that if the
permissions are misprogrammed (which they are in this case) then the TLB
can produce an OA consistent with any of the entries. Hopefully it just
needs some further clarification.

There are probably also cases where we're changing the attributes and the
permissions at the same time, so it's not clear to me that it's safe to
allow those to be inconsistent (e.g. tagged/guarded vs read/write). If
I was going from untagged read/write -> tagged read-only then I presumably
wouldn't expect to see a tag check fault on a write?

Will

