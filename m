Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71581C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoqTyL+G5O6+fLL3cVLfgraMEyoqxgqBpPotfBdVQqw=; b=KEOWijWo3toLOxXho4O3yuhORb
	sZW60uqfmSqUFSIj7lOOARVPSskgyo8JaPkC2qVqFwvlaAakvXFbIH2UQ3Bj3zrav8m1B7e/dprVl
	/M3JUsZSPVg4q1XixC9g1wPpsKghwbhfYm1Uh9edaEZXaH6XE7+sOzkuW0ucrdQyBKXBVLcyFxkFD
	zIzc+ziE/8eFKXYoc2zdi+JQlYKLj5js+n43Mv+QhryyD/ndqdaGqWIFrFwvF8yFk68gCPCSQ+iKZ
	OaFqy8b7PVx0gxjb2lqp4N/Dxxa1WGLkIYM7otAevyGxb/3Jqg04wDnQu51xyyFR+eQ4Mrzntn8Gs
	sKQ5o+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tsv-00000008sEg-3uBw;
	Tue, 08 Sep 2026 11:21:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tst-00000008sEB-49ij;
	Tue, 08 Sep 2026 11:21:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46295404EE;
	Tue,  8 Sep 2026 11:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB5F1F00A3A;
	Tue,  8 Sep 2026 11:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788866463;
	bh=IoqTyL+G5O6+fLL3cVLfgraMEyoqxgqBpPotfBdVQqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GrB21XYOLGrBo6gxEF8O+VDQ8P6Z7IJTIEyPD1wG1Gw99Ip3jQphLMVskjjJ/q1Ia
	 NbKynFOkclfWFGjzL/ZGOj6A9B0MpoII6bIk2IMQMeQDRYFtKMRU9tUxJ1xQ8R6XhN
	 wy+hJ5Tgq+0qcKo/HXlbIKH3KURAlURNS462V+YZ3LJlrToDIY9DtyC4wV64/AhYYL
	 F15CVr74IcEypm11lfsqKgyCfH6d29iy96Wyv6dN/8FLMchUrk+YzXSYPL0GlxRixZ
	 hhPGyoW5IRAxaXfGXElFzqrAoW5JwJ8z3PYtqX0rXQUBb6XRR5zCWyXaB9s0M98V+f
	 qbnt/MWTQnd1Q==
Date: Tue, 8 Sep 2026 14:20:49 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Len Brown <lenb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v3 1/6] set_memory: add number of pages parameter to
 set_direct_map APIs
Message-ID: <ap_vkSK_efv7ab90@kernel.org>
References: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
 <20260903-execmem-set-vm-perms-v0-2-v3-1-949b64a9f755@kernel.org>
 <a98df077-3e97-4eea-8bfe-470bad9ff9e0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a98df077-3e97-4eea-8bfe-470bad9ff9e0@kernel.org>
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

On Tue, Sep 08, 2026 at 12:38:44PM +0200, David Hildenbrand (Arm) wrote:
> On 9/3/26 11:28, Mike Rapoport (Microsoft) wrote:
> > When set_direct_map APIs were introduced by the commit d253ca0c3865
> > ("x86/mm/cpa: Add set_direct_map_*() functions") the single page
> > parameter made sense because the initial callers (vmalloc and
> > hibernation) had sets of unsorted struct pages that required changes of
> > their mappings in the direct map.
> > 
> > Since there is an increasing demand for direct map manipulation and it
> > is also desirable to be able to update larger physically contiguous
> > mappings, for example an entire large folio, extend set_direct_map APIs
> > to receive number of pages parameter.
> > 
> > As there is still only a handful of callers, change the existing
> > functions directly and update all the call sites rather than adding
> > wrappers for single page case.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> In general, LGTM.
> 
> But regarding semantics, is it well defined what happens when an update fails
> halfway through an operation?

Just like other set_memory, it bails out in the middle if anything bad
happens.
 
> I'd assume such a case cannot currently get triggered, but there is no
> documentation on what's supported and what's not. Or is there?
> 
> Imagine someone performing an update on an area that partially spans two PMDs.
> While splitting and updating the first PMD could succeed, splitting the second
> PMD could fail. What would be the end result? Rollback? Does the caller have to
> clean up?

There is no rollback in any of set_memory implementations. It's up to the
callers to cleanup the mess afterwards.
 
> I'd appreciate if we could add proper documentation with expected semantics.

I believe it's more in the scope of  "arch, mm: create a generic
set_memory/change_page_attr core" [1] work than this patchset.

I can write (or maybe even slop ;) ) a doc about set_memory/set_direct_map,
but I wouldn't want to hold this because there's not set_memory
documentation.

[1] https://lore.kernel.org/all/20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org
 
> -- 
> Cheers,
> 
> David

-- 
Sincerely yours,
Mike.

