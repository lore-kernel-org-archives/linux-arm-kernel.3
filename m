Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A997C3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caXrbM+IErpcuhLJrqj4Tmos5fSW8Ki2R+zotzaxsxg=; b=WgOEZojVgEJoF2h3SqewD7hhAb
	kL3m+Xy8MVWgpsMK48DgpqAEZX/UCjQOhuO1xVFDrvZVlWI/Wt5Er2Rl+iwrKNMlquk+ExFqS3wN7
	yBQ2vmvwTn7SvABMuJTCe7WbLldlBwehj79gnnGotmv+ZE90tfXSsiBXr9WauH4vpptHzlr6rzUDq
	jP8sFUE66yZnUXPqxRM5j/rnyNsd8NbrL/TnAx577G3+SHy9N4xQ0SHyH5nsvSTy5JGyCJp2SfxDl
	UnhjrrBRO5Hcfa2l0Fs4GeyNEqR77iTsbJgBoEBuk9hKxyQoY83V7pX/1GAcgdtu7l0BZQzPTIaoX
	hvx1wb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBP-0000000Ftjm-359c;
	Wed, 14 May 2025 17:46:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDnu-0000000FXmE-0JJg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:13:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B28885C1017;
	Wed, 14 May 2025 15:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0152AC4CEE3;
	Wed, 14 May 2025 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235632;
	bh=O1lz6Q1yfa8CYrEI5GX8mlyJMW/kVMWyCbTcUdCC5eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DW+Lzp9HdPWLoHdkJz7iOn+k+Z1Cetdo1F/t4kgwns9ANb8hZ2oHNjsL6dcpj0nb2
	 TKKuLdr/tyJ4ukjNShLQQ2ZaWdvXybQKk5k0WolzqgvDjiVb+SWQIt4aSKSeo3/S/1
	 crz3L+LskPut0T8BbdoJMAQ689QSTlbYc2AIf+rIR/dEcFcFEHAhKrWKzIKi6JJpMQ
	 OjJNXHtw6YTAZyMJX5OnWmekoc4Oy63ZSvAljoqu9p3m0ZXFtRVmRBPob4IJobVyNv
	 abktZzol5yoSlbzDhCxx4gC/a9SgkkWq9caWAbRKmbe3DlQK3PbRPqFky6OBSYk1Wo
	 +ZdxE+6/cLK7g==
Date: Wed, 14 May 2025 16:13:46 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
Subject: Re: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
Message-ID: <20250514151345.GA10762@willie-the-truck>
References: <20250512102242.4156463-1-ryan.roberts@arm.com>
 <20250513204603.GA9866@willie-the-truck>
 <8d4e66ef-a292-45ff-9c4a-0248aff44fd3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d4e66ef-a292-45ff-9c4a-0248aff44fd3@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_081354_166800_729F2A6F 
X-CRM114-Status: GOOD (  25.24  )
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

On Wed, May 14, 2025 at 10:29:17AM +0100, Ryan Roberts wrote:
> On 13/05/2025 21:46, Will Deacon wrote:
> > On Mon, May 12, 2025 at 11:22:40AM +0100, Ryan Roberts wrote:
> >> Commit 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel
> >> mappings") enabled arm64 kernels to track "lazy mmu mode" using TIF
> >> flags in order to defer barriers until exiting the mode. At the same
> >> time, it added warnings to check that pte manipulations were never
> >> performed in interrupt context, because the tracking implementation
> >> could not deal with nesting.
> >>
> >> But it turns out that some debug features (e.g. KFENCE, DEBUG_PAGEALLOC)
> >> do manipulate ptes in softirq context, which triggered the warnings.
> > 
> > Hmm. Do we also have to worry about the case where a softirq is triggered
> > off the back of a hardirq *and* that hardirq is taken while we're in the
> > middle of e.g. queue_pte_barriers()? In that case, I think we can end
> > up in strange situations, such as having LAZY_MMU_PENDING set when
> > LAZY_MMU is clear, although it looks like things still work even in that
> > case.
> 
> I don't see any problem here. This change ensures that we always behave the
> "old" way in interrupt context. So the interrupt context will never even look at
> those TIF flags, so it doesn't matter that the task context is midway through
> changing the flags when the interrupt comes in.
> 
> (although somehow I feel like I should be bracing for a zinger :)

Ha, for some reason, I was looking at the code _without_ your fix
applied. Although it's quite hard to think about, I couldn't spot any
other issues with nesting beyond the one you call out at the end of the
commit message. Your patch makes all of this a lot simpler, though, so
I'll pick it up (along with the other one).

Thanks,

Will

