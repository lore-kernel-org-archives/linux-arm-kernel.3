Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692B6E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 14:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lu38HyVOUlMWCVz6NqZSynwvREdzttKmjnylYmzgMgs=; b=b+urcoWRz3Ljk16VRFee8Cd304
	R771ICBwMBTCVw9eo/B5J3bwlCqv6q+Dk9cuIIOoIZ4ScoKHrgvEHXCuJpAnwRl/wjt/6j6/PZAwa
	JHCGhpiBIvTUIdfG8cJrvZeXkppaLZq+nbc4bgZI22Edpmu68o0u1rH0DsN689WuBkzpHpi2LMYWA
	AfmoMMdvNoEpI/tr5dyhMP8pWA9gaCDOqzGckb4oDb+azz5MG03Nsk2vqwj3pcQmouV97gIdCkVBj
	ae5n9QGeTfJcKEDgLNYaUpfC600qIeomMJOgW1de1+1bOTuJ4NXVSAgf+kg9q/oMxlpVl98IiT8JX
	Y8g50Fig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5cv-0000000C7AQ-28SY;
	Tue, 24 Dec 2024 14:11:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5bi-0000000C700-1ZLm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 14:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CF16CA41585;
	Tue, 24 Dec 2024 14:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36591C4CED0;
	Tue, 24 Dec 2024 14:09:54 +0000 (UTC)
Date: Tue, 24 Dec 2024 14:09:51 +0000
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
Message-ID: <Z2rAr9APkgpkwOl8@arm.com>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-2-quic_zhenhuah@quicinc.com>
 <Z2W3qA7wbBTaq6DQ@arm.com>
 <a720aaa5-a75e-481e-b396-a5f2b50ed362@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a720aaa5-a75e-481e-b396-a5f2b50ed362@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_060958_551710_1AC6027C 
X-CRM114-Status: GOOD (  30.91  )
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

On Tue, Dec 24, 2024 at 05:32:06PM +0800, Zhenhua Huang wrote:
> Thanks Catalin for review!
> Merry Christmas.

Merry Christmas to you too!

> On 2024/12/21 2:30, Catalin Marinas wrote:
> > On Mon, Dec 09, 2024 at 05:42:26PM +0800, Zhenhua Huang wrote:
> > > Fixes: c1cc1552616d ("arm64: MMU initialisation")
> > 
> > I wouldn't add a fix for the first commit adding arm64 support, we did
> > not even have memory hotplug at the time (added later in 5.7 by commit
> > bbd6ec605c0f ("arm64/mm: Enable memory hot remove")). IIUC, this hasn't
> > been a problem until commit ba72b4c8cf60 ("mm/sparsemem: support
> > sub-section hotplug"). That commit broke some arm64 assumptions.
> 
> Shall we add ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> because it broke arm64 assumptions ?

Yes, I think that would be better. And a cc stable to 5.4 (the above
commit appeared in 5.3).

> > > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > > index e2739b69e11b..fd59ee44960e 100644
> > > --- a/arch/arm64/mm/mmu.c
> > > +++ b/arch/arm64/mm/mmu.c
> > > @@ -1177,7 +1177,9 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
> > >   {
> > >   	WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
> > > -	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
> > > +	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
> > > +	!IS_ALIGNED(page_to_pfn((struct page *)start), PAGES_PER_SECTION) ||
> > > +	!IS_ALIGNED(page_to_pfn((struct page *)end), PAGES_PER_SECTION))
> > >   		return vmemmap_populate_basepages(start, end, node, altmap);
> > >   	else
> > >   		return vmemmap_populate_hugepages(start, end, node, altmap);
> > 
> > An alternative would be to fix unmap_hotplug_pmd_range() etc. to avoid
> > nuking the whole vmemmap pmd section if it's not empty. Not sure how
> > easy that is, whether we have the necessary information (I haven't
> > looked in detail).
> > 
> > A potential issue - can we hotplug 128MB of RAM and only unplug 2MB? If
> > that's possible, the problem isn't solved by this patch.
> 
> Indeed, seems there is no guarantee that plug size must be equal to unplug
> size...
> 
> I have two ideas:
> 1. Completely disable this PMD mapping optimization since there is no
> guarantee we must align 128M memory for hotplug ..

I'd be in favour of this, at least if CONFIG_MEMORY_HOTPLUG is enabled.
I think the only advantage here is that we don't allocate a full 2MB
block for vmemmap when only plugging in a sub-section.

> 2. If we want to take this optimization.
> I propose adding one argument to vmemmap_free to indicate if the entire
> section is freed(based on subsection map). Vmemmap_free is a common function
> and might affect other architectures... The process would be:
> vmemmap_free
> 	unmap_hotplug_range //In unmap_hotplug_pmd_range() as you mentioned：if
> whole section is freed, proceed as usual. Otherwise, *just clear out struct
> page content but do not free*.
> 	free_empty_tables // will be called only if entire section is freed
> 
> On the populate side,
> else if (vmemmap_check_pmd(pmd, node, addr, next)) //implement this function
> 	continue;	//Buffer still exists, just abort..
> 
> Could you please comment further whether #2 is feasible ?

vmemmap_free() already gets start/end, so it could at least check the
alignment and avoid freeing if it's not unplugging a full section. It
does leave a 2MB vmemmap block in place when freeing the last subsection
but it's safer than freeing valid struct page entries. In addition, it
could query the memory hotplug state with something like
find_memory_block() and figure out whether the section is empty.

Anyway, I'll be off until the new year, maybe I get other ideas by then.

-- 
Catalin

