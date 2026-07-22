Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D98AC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NL9MUSMjOXzXO0PG+O0B+B7O9GtJJNG0e80cL1Tza4=; b=xR9cmzR1OJKBLmBLh8waLBKh10
	GsXf8wUINgbFmlFHEmYzKQdxi1KhyfoYQRhLtRHIsK1enAcx8IJhs31euuAzD5/sieWFltiIpLX3O
	J0p/MqDVr9NhDr9b6cqN3omKzKbhE5dMwd1TNi72UNtP6vJCnyPiHt3Lto/a4CFf9UZNUbJt9QQ85
	PPsuDDF5toTWqaQpsNkzVn6bIpCyLOfMpuV7z0ThTC6cFRJmnQ01asOWHrBfDJv04byjMU6sT5McL
	WOQnogJmqXKTpxQTlSYoCgMHrq4ilHALh9W+bsUrpS/bEwyOgdOJ/LxcnN3siD3EiThVnGYfEMhiL
	mS+qy6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVAc-0000000BedL-22R9;
	Wed, 22 Jul 2026 11:31:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVAa-0000000BecV-1lAz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:31:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D77D3600DA;
	Wed, 22 Jul 2026 11:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB051F000E9;
	Wed, 22 Jul 2026 11:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784719883;
	bh=6NL9MUSMjOXzXO0PG+O0B+B7O9GtJJNG0e80cL1Tza4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QFsM7cyW63ZHox9yTKsiFzo8dFp8bdo2Fa5APdElwVCoMrDNKWGoBmp1Gx1syXMjA
	 CzHFgDbh6mpJ9ry70GgnCl0GNxZ/QpTNKuvOVogWVAMPh97SCFafJNwXmnkVJJmP7y
	 t6SGz6lgQ1qIbuThkQpnqUpI0kiUGHSnODv17c24AzKvvv0wDPWBIW9XL7OTTl5ttf
	 +jjcRZtag9E3w2IAtcAfHyK+S8BsUY8GMci0GKocwsGmVcNwKUM8/tpzz4Ov89pyvw
	 RyC9zh/MCK/3kpizPUKEljf+2fgwj7y2qUw2tJj9+Cgf5sb3cyedQF7zoPrWzkMzSy
	 J3ZHE5x4Kk1pw==
Date: Wed, 22 Jul 2026 12:31:19 +0100
From: Will Deacon <will@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ljs@kernel.org
Subject: Re: [v8 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <amCqBzwIYDOvRI1S@willie-the-truck>
References: <20260609214205.1260279-1-yang@os.amperecomputing.com>
 <255744ec-2a58-492c-a69a-850357440183@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <255744ec-2a58-492c-a69a-850357440183@os.amperecomputing.com>
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

On Tue, Jun 09, 2026 at 05:06:31PM -0700, Yang Shi wrote:
> 
> 
> On 6/9/26 2:42 PM, Yang Shi wrote:
> > Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
> > rodata=full"), the direct mapping may be split on some machines instead
> > keeping static since boot. It makes more sense to show the direct mapping
> > use in /proc/meminfo than before.
> > This patch will make /proc/meminfo show the direct mapping use like the
> > below (4K base page size):
> > DirectMap4K:       94792 kB
> > DirectMap64K:     134208 kB
> > DirectMap2M:     1173504 kB
> > DirectMap32M:    5636096 kB
> > DirectMap1G:    529530880 kB
> > 
> > Although just the machines which support BBML2_NOABORT can split the
> > direct mapping, show it on all machines regardless of BBML2_NOABORT so
> > that the users have consistent view in order to avoid confusion.
> > 
> > Although ptdump also can tell the direct map use, but it needs to dump
> > the whole kernel page table. It is costly and overkilling. It is also
> > in debugfs which may not be enabled by all distros. So showing direct
> > map use in /proc/meminfo seems more convenient and has less overhead.
> > 
> > Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> > ---
> >   arch/arm64/mm/mmu.c | 200 +++++++++++++++++++++++++++++++++++++++-----
> >   1 file changed, 179 insertions(+), 21 deletions(-)
> > 
> > v8: * Fixed the double accounting per Sashiko
> >      * Responded the review comments from Sashiko
> > v7: * Rebased to v7.1-rc4
> >      * Changed "dm" to "lm" to follow ARM convention per Will
> >      * Used __is_lm_alias() instead of reinventing a new helper per Will
> > v6: * Rebased to v7.0-rc3
> >      * Rebased on top of Anshuman's v5 "arm64/mm: Enable batched TLB flush
> >        in unmap_hotplug_range()"
> >      * Used const for direct map type array per Will
> >      * Defined PUD size for 16K/64K even though it is not used per Will
> >      * Removed the misleading comment in init_pmd() per Will
> > v5: * Rebased to v6.19-rc4
> >      * Fixed the build error for !CONFIG_PROC_FS
> > v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
> >      * Used shorter name for the helpers and variables per Ryan
> >      * Fixed accounting for memory hotunplug
> > v3: * Fixed the over-accounting problems per Ryan
> >      * Introduced helpers for add/sub direct map use and #ifdef them with
> >        CONFIG_PROC_FS per Ryan
> >      * v3 is a fix patch on top of v2
> > v2: * Counted in size instead of the number of entries per Ryan
> >      * Removed shift array per Ryan
> >      * Use lower case "k" per Ryan
> >      * Fixed a couple of build warnings reported by kernel test robot
> >      * Fixed a couple of poential miscounts
> 
> Aha, Sashiko is so fast. 2 comments this time.
> 
> #1
> > Will these updates suffer from data races?
> > The lm_meminfo array tracks direct mapping statistics and is updated using
> > non-atomic += and -= operations. These updates are invoked from multiple
> > independent code paths that do not share a common lock.
> > For example, runtime page permission changes call
> > split_kernel_leaf_mapping_locked() which executes under
> > pgtable_split_lock,
> > while memory hotplug operations like arch_remove_memory() execute under
> > mem_hotplug_lock. Because these paths can run concurrently on different
> > CPUs,
> > the non-atomic arithmetic could result in data races and lost updates.
> 
> Yes, it may race with memory hotplug. I missed memory hotplug for v7
> Sashiko. Two options to solve it:
> 
> 1. Use atomic variables. Make lm_meminfo[NR_LM_TYPE] atomic_long_t, then
> manipulate it with atomic ops.
> 2. Protect it with a spin lock.
> 
> The contention for the cache line or the spin lock should be rare since
> memory hotplug should happen rarely. Any preference?

I'd vote for keeping it simple and using a lock. Might be worth looking
at the ongoing work from Lorenzo:

https://lore.kernel.org/all/20260717-series-vmap-race-fix-v5-0-606a0ac6d3e5@kernel.org/

Will

