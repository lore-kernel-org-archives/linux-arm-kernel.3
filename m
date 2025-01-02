Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC1CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 18:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNYzd1QJqO6EbDeuZbvW7H1KJN74a6Do8DTMy/8tdHw=; b=kk5uFosNqwBPHS0IvU0xePn73a
	LAf06PU5pNKEAdB4p+Mj93x4vr4hpI6kPCMzfHI2Gp80XT03fABVW8imikJeCgdB0Zirxu2igYBT0
	2oNa7OgGJkFivP9W5IAa/RNNjnhbiJKJ/1g1as8b1KVkB5t6W4dE4xDYuTgiAiljLYjaYIGihpiYx
	hNPuA3j1llAqyKji/OMfeIPzKVeLehxmBFaloz9U1QYuN3c1gYPwLkWsyUDin33GKJoXXsnFKBQLM
	58m2IS7OIXJIkyLsDjQybCnc0a3IZLpfdM70vpzMS3kgqaK+rDMf/XCJXUi0iMjZKVqAFgsJs/8Dd
	piutg61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPhy-0000000B5Wt-3em8;
	Thu, 02 Jan 2025 18:14:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPgm-0000000B5Lw-3xM8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 18:12:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5301A5C581B;
	Thu,  2 Jan 2025 18:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8F6C4CED0;
	Thu,  2 Jan 2025 18:12:52 +0000 (UTC)
Date: Thu, 2 Jan 2025 18:12:50 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Zhenhua Huang <quic_zhenhuah@quicinc.com>, will@kernel.org,
	ardb@kernel.org, ryan.roberts@arm.com, mark.rutland@arm.com,
	joey.gouly@arm.com, dave.hansen@linux.intel.com,
	akpm@linux-foundation.org, chenfeiyang@loongson.cn,
	chenhuacai@kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: mm: implement vmemmap_check_pmd for arm64
Message-ID: <Z3bXIjJjEaoOaxbH@arm.com>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-3-quic_zhenhuah@quicinc.com>
 <Z2W5Bs0bZANI6NKv@arm.com>
 <39a85800-47c5-4529-906d-5a40e58ce136@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39a85800-47c5-4529-906d-5a40e58ce136@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_101257_073102_6014FCC3 
X-CRM114-Status: GOOD (  26.50  )
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

On Fri, Dec 27, 2024 at 08:27:18AM +0530, Anshuman Khandual wrote:
> On 12/21/24 00:05, Catalin Marinas wrote:
> > On Mon, Dec 09, 2024 at 05:42:27PM +0800, Zhenhua Huang wrote:
> >> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >> index fd59ee44960e..41c7978a92be 100644
> >> --- a/arch/arm64/mm/mmu.c
> >> +++ b/arch/arm64/mm/mmu.c
> >> @@ -1169,7 +1169,8 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
> >>  				unsigned long addr, unsigned long next)
> >>  {
> >>  	vmemmap_verify((pte_t *)pmdp, node, addr, next);
> >> -	return 1;
> >> +
> >> +	return pmd_sect(*pmdp);
> 
> Please change this as pmd_sect(READ_ONCE(*pmdp)) instead.
> 
> >>  }
> >>  
> >>  int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
> > 
> > Don't we need this patch only if we implement the first one? Please fold
> > it into the other patch.
> 
> Seems like these patches might not be related.
> 
> While creating huge page based vmemmap mapping during vmemmap_populate_hugepages(),
> vmemmap_check_pmd() validates if a populated (i.e pmd_none) PMD already represents
> a huge mapping and can be skipped there after.
> 
> Current implementation for vmemmap_check_pmd() on arm64, unconditionally returns 1
> thus asserting that the given populated PMD entry is a huge one indeed, which will
> be the case unless something is wrong. vmemmap_verify() only ensures that the node
> where the pfn is allocated from is local.
> 
> int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>                                 unsigned long addr, unsigned long next)
> {
>         vmemmap_verify((pte_t *)pmdp, node, addr, next);
>         return 1;
> }
> 
> However it does not really check the entry to be a section mapping which it should.
> Returning pmd_sect(READ_ONCE(*pmdp)) is the right thing, which should have been the
> case from the beginning when vmemmap_check_pmd() was added. I guess because arm64's
> original vmemmap_populate() checked only for vmemmap_verify() as well. So probably
> this does not need a "Fixes: " tag.

I did not say the patch is wrong, only that it wouldn't be needed unless
we have the other patch in this series. However, if we do apply the
other patch, we definitely need this change, so keeping them together
would make it easier to backport.

-- 
Catalin

