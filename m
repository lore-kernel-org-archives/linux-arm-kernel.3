Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109F8CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sN4TFCft2/wZSXIELr5RHWTzLUBfhTJlV5b+crUf6Vc=; b=TOSFkgUvqF/8YcJqQUYIZDshUG
	zxwIiLfWfWhnPdPjurxy1SZGIXtZqigRbO5YNnR/VnPehEpu3OtuRx5TZUfRP4/8UTynRvn8MXB66
	w8M72TYJ+P82n5QjBCB3jtmJmo2G47y9SyMpf5oz6gSRcsNZ9f+A20ZDX/X07WoQufjIABBnt15i1
	ulEfQfB07gv7g8ER7KgQTRyKYJj+9re6CS3Z2z89tYw3UFfHmKFLrroo3BxUIUn8DjLkFAm/yrkG9
	GvFCiWDS/cJwdzr8OJQ8R1kJDiJZIlp7N2AIEv7E28XLQWV51iBm9Vwu45xazJeybJ3wh7g+Q+7OQ
	ZMr5rPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MKR-0000000GIg7-3XC5;
	Wed, 24 Sep 2025 10:02:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MKQ-0000000GIem-0OJP;
	Wed, 24 Sep 2025 10:02:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 717B6600AA;
	Wed, 24 Sep 2025 10:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36D5C4CEE7;
	Wed, 24 Sep 2025 09:59:49 +0000 (UTC)
Date: Wed, 24 Sep 2025 10:59:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com, usamaarif642@gmail.com,
	yuzhao@google.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	baohua@kernel.org, voidice@gmail.com, Liam.Howlett@oracle.com,
	cerasuolodomenico@gmail.com, hannes@cmpxchg.org,
	kaleshsingh@google.com, npache@redhat.com, riel@surriel.com,
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com,
	dev.jain@arm.com, ryncsn@gmail.com, shakeel.butt@linux.dev,
	surenb@google.com, hughd@google.com, willy@infradead.org,
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
	apopple@nvidia.com, qun-wei.lin@mediatek.com,
	Andrew.Yang@mediatek.com, casper.li@mediatek.com,
	chinwen.chang@mediatek.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-mm@kvack.org, ioworker0@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
Message-ID: <aNPA--5AcqeFd6nl@arm.com>
References: <20250922021458.68123-1-lance.yang@linux.dev>
 <aNGGUXLCn_bWlne5@arm.com>
 <a3412715-6d9d-4809-9588-ba08da450d16@redhat.com>
 <aNKJ5glToE4hMhWA@arm.com>
 <aNLHexcNI53HQ46A@arm.com>
 <f2fe9c01-2a8d-4de9-abd5-dbb86d15a37b@linux.dev>
 <aNOwuKmbAaMaEMb7@arm.com>
 <17dabd83-0849-44c9-b4a2-196af60d9676@redhat.com>
 <aNO7MrQt9oPT8Hic@arm.com>
 <791e0d59-0eb2-481f-bf8b-ba4b413d5ebd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <791e0d59-0eb2-481f-bf8b-ba4b413d5ebd@redhat.com>
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

On Wed, Sep 24, 2025 at 11:44:19AM +0200, David Hildenbrand wrote:
> On 24.09.25 11:34, Catalin Marinas wrote:
> > On Wed, Sep 24, 2025 at 11:13:18AM +0200, David Hildenbrand wrote:
> > > On 24.09.25 10:50, Catalin Marinas wrote:
> > > > On Wed, Sep 24, 2025 at 10:49:27AM +0800, Lance Yang wrote:
> > > > > On 2025/9/24 00:14, Catalin Marinas wrote:
> > > > > > So alternative patch that also fixes the deferred struct page init (on
> > > > > > the assumptions that the zero page is always mapped as pte_special():
> > > > > 
> > > > > I can confirm that this alternative patch also works correctly; my tests
> > > > > for MTE all pass ;)
> > > > 
> > > > Thanks Lance for testing. I'll post one of the variants today.
> > > > 
> > > > > This looks like a better fix since it solves the boot hang issue too.
> > > > 
> > > > In principle, yes, until I tracked down why I changed it in the first
> > > > place - 68d54ceeec0e ("arm64: mte: Allow PTRACE_PEEKMTETAGS access to
> > > > the zero page"). ptrace() can read tags from PROT_MTE mappings and we
> > > > want to allow reading zeroes as well if the page points to the zero
> > > > page. Not flagging the page as PG_mte_tagged caused issues.
> > > > 
> > > > I can change the logic in the ptrace() code, I just need to figure out
> > > > what happens to the huge zero page. Ideally we should treat both in the
> > > > same way but, AFAICT, we don't use pmd_mkspecial() on the huge zero
> > > > page, so it gets flagged with PG_mte_tagged.
> > > 
> > > I changed that recently :) The huge zero folio will now always have
> > > pmd_special() set.
> > 
> > Oh, which commit was this? It means that we can end up with
> > uninitialised tags if we have a PROT_MTE huge zero page since
> > set_pmd_at/set_pte_at() skips mte_sync_tags().
> 
> This one:
> 
> commit d82d09e482199e6bbc204df10b2082f764cbe1f4
> Author: David Hildenbrand <david@redhat.com>
> Date:   Mon Aug 11 13:26:25 2025 +0200
> 
>     mm/huge_memory: mark PMD mappings of the huge zero folio special
> 
>     The huge zero folio is refcounted (+mapcounted -- is that a word?)
>     differently than "normal" folios, similarly (but different) to the
>     ordinary shared zeropage.
> 
> 
> It should be in mm-stable, to go upstream in the upcoming merge window. It's
> been lurking in -next for a while now.

Thanks. At least it's something to address in the next kernel version. I
need to improve the MTE kselftests to catch the zero page scenarios.

> As it behaves just like the ordinary shared zeropage now, would we have to
> zero/initialize the tags after allocating it?

Yes. Before pmd_special(), it was be done lazily via set_pmd_at(). I
think it just needs a __GFP_ZEROTAGS. The only other place we use this
flag is in vma_alloc_zeroed_movable_folio(), as an optimisation to avoid
a separate loop for zeroing the tags after data.

-- 
Catalin

