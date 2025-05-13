Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8105CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 20:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kzLQIa8+PCGRcMRmx7ZVRk+OjI2k2fuayPHKN+v+eE=; b=PWYKX07ujjpT8MRwZidP4O4l14
	JL2ztW8LaSu6wfpfv3EbfEp0Cf8rwmBnA5evi0UCfkBt34144Qc2Qh3kA8rcHXwjvFen5VqMhKBKy
	0sA1HiOf1zUwddGWNSsUP0pj6cuxxVuhmpkIqlDp5I2P1Uc3kTJVvTHQ7KzIfbj+OcDi2q/ZE2w6v
	LtpAWWX/XfVBcbHv5pz2voVXGn50b3lNpP6TJ6EXkZ4gAagxwY53+/N7CZXkLi7eZJCCv9mpfrB16
	GKlibwbCnNlD4ACFj1KP9OV7ynPdhi7Q7J055QjKU0qB6h8fuERXCVDlN6Umy4Uy81dwAu8n51hD7
	eJJoXUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEwY2-0000000DWHx-0Ip2;
	Tue, 13 May 2025 20:48:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEwVv-0000000DVvb-2H0P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 20:46:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC834614B6;
	Tue, 13 May 2025 20:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A873AC4CEE4;
	Tue, 13 May 2025 20:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747169170;
	bh=ZrGG0MGjPQ9M+KHJmiU49QaFHPMxAGixxDOvTmXKeQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nmR4Y/kfmtn0Wmed73+zC6gl9p+RgdyAlq7iOw/eanf+Cq4YGxcOntSUAUlrVrkD5
	 /JTdTmJBH8ducDgUDNbg0eR0HP1wSy/cdADfacMkChwWXjmgBDWrcYjgVHWwdhh2Uo
	 xkF6a3gTPxK9Jbio4tKD5k/Sfryr+KE+SAWvRneJ+AgOTTlCUA8r/MMuRFacp3R8TE
	 ZxyFwU/yZDiTSDkyqGSli2izvVpe8HjQlQbTRfoAFvSHjMaNKJ0oqpVgTkpNvPl15p
	 A5FNDAsUrZ9cHAPB5JTK7YZe6vHkD4j/ikMO4P2DXzyeOW5TfaDOUQfJMw5nxsOklg
	 iXmEkqWlbBbQA==
Date: Tue, 13 May 2025 21:46:04 +0100
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
Message-ID: <20250513204603.GA9866@willie-the-truck>
References: <20250512102242.4156463-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512102242.4156463-1-ryan.roberts@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, May 12, 2025 at 11:22:40AM +0100, Ryan Roberts wrote:
> Commit 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel
> mappings") enabled arm64 kernels to track "lazy mmu mode" using TIF
> flags in order to defer barriers until exiting the mode. At the same
> time, it added warnings to check that pte manipulations were never
> performed in interrupt context, because the tracking implementation
> could not deal with nesting.
> 
> But it turns out that some debug features (e.g. KFENCE, DEBUG_PAGEALLOC)
> do manipulate ptes in softirq context, which triggered the warnings.

Hmm. Do we also have to worry about the case where a softirq is triggered
off the back of a hardirq *and* that hardirq is taken while we're in the
middle of e.g. queue_pte_barriers()? In that case, I think we can end
up in strange situations, such as having LAZY_MMU_PENDING set when
LAZY_MMU is clear, although it looks like things still work even in that
case.

Will

