Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC94C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 10:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFZ1nhGEZbR6O/VCAicWb32eNrolFHOIlFtmV4ujfk4=; b=xoeNSuwOOQ4yItKRRUvmfXPCA+
	tRHU4fDQCZvN3JbHln/kB9MAvaH9P42s47s/h9mnC7SOAG7g2E7adzRvWrYieCOQY2l8fwOhG0eUU
	RLtSPVmQaXUAtUXrZZ3XIbplwBEoD3wogDOq6VrfeCX5uNx3wJtOKKDKcEhHXyZb8U62lgUGbWtFX
	7Yf279FC7++d3J8hD+lHwALjM/9bYjEkQJ8pMjEN11clIpDo+LKK6OIggED8qUFHylsystPup51Av
	1or91XJr/ivATn+dRWLcf7iKZ6w7TjJKUJCstx4gdu2hmJiAgwyjBNX9dEfxD+gsOgVB0s+sW76Cj
	30YjIWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Gc7-00000006wGE-1Llh;
	Sat, 29 Aug 2026 10:48:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Gc6-00000006wG5-0ekq;
	Sat, 29 Aug 2026 10:48:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15621437B7;
	Sat, 29 Aug 2026 10:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C6B1F000E9;
	Sat, 29 Aug 2026 10:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788000520;
	bh=KFZ1nhGEZbR6O/VCAicWb32eNrolFHOIlFtmV4ujfk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LWRmvwZ5mPls4Z+BaiG1qXwR10+CBxW+bUOShLfZyRmLMeWBsXFZbiPwmkePznqr5
	 RDgCI5JSJI/PnwyJzmrjiTTIt4pQEyHh4ig4dGZIGujt3YWBOXTXM28p4gyqeJwbxf
	 WsaqKftKKe5VsQ0VW/PEX8SxuQhw1GHVsePh+UKddYUexwRXUbdmDfNrJmoD2ZI1v6
	 YA0GuLxzRK2viPxmPZf5a9S7TnaLyvMWbeiiVwoWcOVI5CYLFrXFWBc0Jr3YfAzGPD
	 ENSQxCrpJykei+zA/nljjaxyFx/CEE02iM1psN14xjNoYwJ+aBxdLXjvTaTWkcJoke
	 quOJdXXFQrxWg==
Date: Sat, 29 Aug 2026 13:48:28 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
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
Subject: Re: [PATCH v2 0/6] arch, mm/execmem: resolve confusion about
 set_direct_map_valid_noflush()
Message-ID: <apK4_MgCtPFlDwoc@kernel.org>
References: <20260823-execmem-set-vm-perms-v0-2-v2-0-b013a37d84b3@kernel.org>
 <20260827223947.c773e6a7324eaf3fe0d8362f@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827223947.c773e6a7324eaf3fe0d8362f@linux-foundation.org>
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

On Thu, Aug 27, 2026 at 10:39:47PM -0700, Andrew Morton wrote:
> On Sun, 23 Aug 2026 14:46:11 +0300 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:
> 
> > Recent discussion about implementation of execmem's ROX caches on arm64
> 
> I'm assuming a "[1]" reference was intended here.

Yes :)
 
> > revealed a confusion about how set_direct_map_valid_noflush()
> > implemented on different architectures.
> > 
> > On arm64 it sets or clears the PTE_VALID bit marking a PTE as present or
> > not present.
> > 
> > On other architectures it's a range version of
> > set_direct_map_invalid_noflush() and set_direct_map_default_noflush()
> > 
> > Unlike arm64::set_direct_map_valid_noflush(),
> > set_direct_map_default_noflush() not only marks PTE as present, but also
> > sets its default protection mode.
> > 
> > Other than that, initial design of execmem ROX caches didn't rely on
> > restoration of large mappings that's now available on x86, but
> > completely removed the memory allocated for the ROX cache from the
> > direct map to ensure that large mappings are not split. This precluded
> > usage of VM_FLUSH_RESET_PERMS for the ROX cache allocations and required
> > execmem to implement manipulation of the direct map alias.
> > 
> > Current implementation of ROX caches does not remove the direct map
> > alias but simply calls set_memory_rox() that updates the permissions in
> > both vmalloc address space and the direct map and relies on
> > collapse_large_pages() in x86 CPA to keep large mappings.
> > 
> > This allow using VM_FLUSH_RESET_PERMS for execmem ROX cache allocations
> > with small adjustments to set_direct_map APIs and vmalloc::reset_perms()
> > behaviour: adding number of pages parameter to set_direct_map APIs and
> > making resetting of the direct map permissions in vmalloc VMAP_HUGE
> > friendly.
> > 
> > Implement these adjustments, make execmem always use
> > VM_FLUSH_RESET_PERMS and revert set_direct_map_valid_noflush() changes.
> > 
> > [1] https://lore.kernel.org/all/20260611130144.1385343-4-abarnas@google.com
> 
> The patchset is perhaps a little green but I tossed it in there, thanks.
> 
> I hit a few rejects in arch/x86/mm/pat/set_memory.c, but minor stuff.
> 
> I trust you've seen Sashiko's incidental oh-btw comments.
> 
> 	https://sashiko.dev/#/patchset/20260823-execmem-set-vm-perms-v0-2-v2-0-b013a37d84b3@kernel.org

Yeah, it did discover something fishy with the fallbacks handling.
I'm looking into it.
 

-- 
Sincerely yours,
Mike.

