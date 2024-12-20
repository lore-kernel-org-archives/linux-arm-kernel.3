Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E907BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 18:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Or7RhWZH9ux8BupbvWUzAXHn5vBgFkWtRwg9wCItkF4=; b=1Es7YgR3bPSOF9qCRCBYiMqbLS
	HPy3XtsAvfUBesoEJA0XaurvLiJg2E+wpZMUvVHO9qyzAYfKlWTgzS5DU9eTIp3htDUN/AQU9SN5b
	gbKCkO8O+fr7HPcv/vGT2Gt73W55D0Cu7F+M83wPBIU7NcnzleXsPXmWwcoXORa0Ml1ZrUW5wGtKg
	2HhlQ5PuYm1xccAwDzWqhlH1fYA/BHsAFHhh51rL2H69jNzj/zGTdMDXCVHzoxNkIi9dfc7XzGHAW
	SvrqFjCtgvcWULx2tvAYtHXyGh6DT+8IhAUzhC20uO2oItThY2nGqNn8JekRpJHHImLaM45f3u795
	LGDWdZUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhmv-00000005oZQ-2VRn;
	Fri, 20 Dec 2024 18:31:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhlF-00000005oGC-4AZH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 18:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A0863A42156;
	Fri, 20 Dec 2024 18:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620A9C4CECD;
	Fri, 20 Dec 2024 18:30:02 +0000 (UTC)
Date: Fri, 20 Dec 2024 18:30:00 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
	mark.rutland@arm.com, joey.gouly@arm.com,
	dave.hansen@linux.intel.com, akpm@linux-foundation.org,
	chenfeiyang@loongson.cn, chenhuacai@kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v2 1/2] arm64: mm: vmemmap populate to page level if not
 section aligned
Message-ID: <Z2W3qA7wbBTaq6DQ@arm.com>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-2-quic_zhenhuah@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209094227.1529977-2-quic_zhenhuah@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_103006_161645_4AB1E716 
X-CRM114-Status: GOOD (  23.92  )
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

On Mon, Dec 09, 2024 at 05:42:26PM +0800, Zhenhua Huang wrote:
> Commit c1cc1552616d ("arm64: MMU initialisation")
> optimizes the vmemmap to populate at the PMD section level. However, if
> start or end is not aligned to a section boundary, such as when a
> subsection is hot added, populating the entire section is wasteful. For
> instance, if only one subsection hot-added, the entire section's struct
> page metadata will still be populated.In such cases, it is more effective
> to populate at page granularity.

OK, so from the vmemmap perspective, we waste up to 2MB memory that has
been allocated even if a 2MB hot-plugged subsection required only 32KB
of struct page. I don't mind this much really. I hope all those
subsections are not scattered around to amplify this waste.

> This change also addresses mismatch issues during vmemmap_free(): When
> pmd_sect() is true, the entire PMD section is cleared, even if there is
> other effective subsection. For example, pagemap1 and pagemap2 are part
> of a single PMD entry and they are hot-added sequentially. Then pagemap1
> is removed, vmemmap_free() will clear the entire PMD entry, freeing the
> struct page metadata for the whole section, even though pagemap2 is still
> active.

I think that's the bigger issue. We can't unplug a subsection only.
Looking at unmap_hotplug_pmd_range(), it frees a 2MB vmemmap section but
that may hold struct page for the equivalent of 128MB of memory. So any
struct page accesses for the other subsections will fault.

> Fixes: c1cc1552616d ("arm64: MMU initialisation")

I wouldn't add a fix for the first commit adding arm64 support, we did
not even have memory hotplug at the time (added later in 5.7 by commit
bbd6ec605c0f ("arm64/mm: Enable memory hot remove")). IIUC, this hasn't
been a problem until commit ba72b4c8cf60 ("mm/sparsemem: support
sub-section hotplug"). That commit broke some arm64 assumptions.

> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> ---
>  arch/arm64/mm/mmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index e2739b69e11b..fd59ee44960e 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1177,7 +1177,9 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>  {
>  	WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>  
> -	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
> +	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
> +	!IS_ALIGNED(page_to_pfn((struct page *)start), PAGES_PER_SECTION) ||
> +	!IS_ALIGNED(page_to_pfn((struct page *)end), PAGES_PER_SECTION))
>  		return vmemmap_populate_basepages(start, end, node, altmap);
>  	else
>  		return vmemmap_populate_hugepages(start, end, node, altmap);

An alternative would be to fix unmap_hotplug_pmd_range() etc. to avoid
nuking the whole vmemmap pmd section if it's not empty. Not sure how
easy that is, whether we have the necessary information (I haven't
looked in detail).

A potential issue - can we hotplug 128MB of RAM and only unplug 2MB? If
that's possible, the problem isn't solved by this patch.

-- 
Catalin

