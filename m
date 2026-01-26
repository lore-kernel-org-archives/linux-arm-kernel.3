Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8FDCF65FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUR73fBm5ynj8SVa/MeZHau9RC4xWZERt7lEEMLWI5g=; b=mpaa5CDmlcGLrqeq8AeW3uxMe4
	3IHEjHmqYRrUrFvQJdufG8L9BXaqfq6dyfBplhLQFQfM+RdBgyBzrhE9wPrmMMt9b51gagh5CtXKU
	yC9MizqKM1L8GOCRquB/iv2K1PdVDZircnQoJ9ZSjQ+PUbdud/vzvOE9wrJocgUCBod4GV9ZaaunE
	vz7rCo1jsDIWYvgQj6XAvzdF8p6dcoYPA2Z4FWDrm8NS1qTAaCyovum6NFi87SgpNY5MaK1sgPFX/
	d9kE08fD1WT6M6IXOoqzwYygYEs73MMuNOjb7BwvkHa7iClSKzR359jsugifaXsS8ji7KfHfbVmnj
	xh270Y6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLxd-0000000CZLr-1t70;
	Mon, 26 Jan 2026 12:44:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLxc-0000000CZLl-2bCP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:44:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2BB06012B;
	Mon, 26 Jan 2026 12:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8677C116C6;
	Mon, 26 Jan 2026 12:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769431491;
	bh=QfLOMmD9jtH9CPHGXdUThFo9lSJwhC4/EeuyOAY+LF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z8qb/YXu5oaD948BYwFShGbfPVlb76WJ8hG2OwRrHQILj+eS8z9ryIfesrZEV9wx3
	 UKyTqVCTuZS/nleuzlUX8kEKI4j51Al91sPJbt97RCiAMj84qzVIAbVoF38paqcGys
	 FruiPipYu1vRTQQ1HMTBQHVfMTmUGxPgnHXiw9tC0km1kHM9gHLDIA6U4pHsreZG3w
	 DEf00rd3VaFaA1BVwb/pgjM9AtrlYhyIF+CBu26zwBcwrK1182GkXs74df3qxThM8O
	 H7N7Bkx+jBhCEI9B7Idu496ygSIoqAWqjUy6K6Mdr6Epk2qSGfdeuG5tqlNmrt4GDB
	 CLCQi+L5LmJcw==
Date: Mon, 26 Jan 2026 12:44:47 +0000
From: Will Deacon <will@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com,
	ryan.roberts@arm.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <aXdhvyW1f10YnZx1@willie-the-truck>
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <965a0b46-f32e-40e6-ab71-211f84d6c3cf@arm.com>
 <aXIxYcAsbFZn3ZNU@willie-the-truck>
 <8e9f762f-5933-4e30-ab6d-489a56de4eaf@arm.com>
 <1d9e2eff-c6c9-414d-9e39-e046fc0fdc16@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d9e2eff-c6c9-414d-9e39-e046fc0fdc16@os.amperecomputing.com>
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

On Fri, Jan 23, 2026 at 12:08:07PM -0800, Yang Shi wrote:
> 
> 
> On 1/22/26 6:40 PM, Anshuman Khandual wrote:
> > 
> > On 22/01/26 7:47 PM, Will Deacon wrote:
> > > On Thu, Jan 22, 2026 at 10:39:25AM +0530, Anshuman Khandual wrote:
> > > > Hello Yang,
> > > > 
> > > > On 07/01/26 5:59 AM, Yang Shi wrote:
> > > > > Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
> > > > > rodata=full"), the direct mapping may be split on some machines instead
> > > > > keeping static since boot. It makes more sense to show the direct mapping
> > > > > use in /proc/meminfo than before.
> > > > I guess the direct mapping here refers to linear map ? IIUC it is called
> > > > direct map on x86 and linear map on arm64 platforms. Then should not it
> > > > be renamed as s/DirectMap/LinearMap instead ? This will align with names
> > > > from ptdump as well.
> > > > 
> > > > Before the above mentioned commit, linear could get altered with memory
> > > > hotplug and remove events as well.
> > > > 
> > > > > This patch will make /proc/meminfo show the direct mapping use like the
> > > > > below (4K base page size):
> > > > > DirectMap4K:	   94792 kB
> > > > > DirectMap64K:	  134208 kB
> > > > > DirectMap2M:	 1173504 kB
> > > > > DirectMap32M:	 5636096 kB
> > > > > DirectMap1G:	529530880 kB
> > > > If /proc/meminfo interface is getting updated via  arch_report_meminfo()
> > > > why not add stats for all kernel virtual address space ranges including
> > > > vmemmap, vmalloc etc aka all address range headers in ptdump as many of
> > > > those could change during system runtime. What makes linear mapping any
> > > > special ?
> > > tbh, I think compatability with x86 is a good argument in this case and
> > > so the naming and formatting proposed by this patch makes sense to me.
> > Fair enough. Probably adding a comment above arch_report_meminfo() along
> > with the commit message, explaining the above rationale would be helpful
> > for developers to understand/recollect this equivalence later on.
> > 
> > > I'm also not sure that it's particularly interesting to see these
> > > rolled-up numbers for the vmalloc area. You really want information
> > > about the area, so extending /proc/vmallocinfo to give information
> > > about the granule size for each entry might be useful but I don't think
> > > it should be part of this patch.
> > Agreed - vmalloc has a separate file for its details which can be improved
> > later to accommodate rolled-up numbers. But what about vmemmap ? It always
> > gets updated along with linear map during memory hotplug and remove events.
> > Should that be included here ?
> 
> The granule size of vmemmap should be quite static IIUC. AFAIK kernel
> doesn't modify vmemmap page tables except HVO, but arm64 doesn't support
> HVO. And just 4K page size can have PMD mapped vmemmap. It doesn't use
> contiguous mapping either. The smallest granularity of memory hotplug is
> 128M with 4K page size, so vmemmap for hotplugged memory should be PMD
> mapped as well.
> 
> It might be worth showing the memory consumed by vmemmap for hotplug memory
> so that the users can know where the memory is used. The vmemmap used for
> bootmem is not counted in MemTotal of /proc/meminfo. But it sounds more core
> mm generic and shouldn't be part of this patch IMHO.

Agreed, I don't understand what the granularity of the vmemmap has to do
with this.

Will

