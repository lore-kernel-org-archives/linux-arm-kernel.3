Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF7AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 11:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUWq4hbbLYmJEqMCHxgFxp0FOO2Wr6bianiqlQZahxQ=; b=v9AYs//mBfSjNQikadruCEZWqH
	qDiCtPsbI+VtqTEbOKZBDGNEDijDM+UA7D6d/12R2t9NI9Y/Qm/9LYTWTc1DR+HsRiwGba2+OxI9w
	GqNE0yirLYa4D/FjY2qy1/ai/hsrvMbTLI3gUT0As4mw2XSf44/uaNA/vtd2x/Wrv9ujTz9kpGfPu
	bpVo2oBFUjorzidxOKxdO+l7xzXw1M7FxJY41hvCMUqhPj96sVdh6HE7QVAcfhw58RKQoUNkG2uKc
	AHlWtR4Ie/vDXIzvtCboh4hdHIGVCZI3uNMtroHd2RZMwlC2ov85TvZKRB1DhLSwz83vy0pWVNG/c
	h5Pq61Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eba-00000005ZlU-1R3i;
	Tue, 15 Apr 2025 11:37:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dtP-00000005PpN-3ZNn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 10:51:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 920B86112C;
	Tue, 15 Apr 2025 10:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C28DC4CEE7;
	Tue, 15 Apr 2025 10:51:48 +0000 (UTC)
Date: Tue, 15 Apr 2025 11:51:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/11] arm64/mm: Batch barriers when updating kernel
 mappings
Message-ID: <Z_46QUFXVI69zRZR@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-12-ryan.roberts@arm.com>
 <Z_1IC-_Fp-yGLRSc@arm.com>
 <aabc9fb1-4e74-409a-b25b-8e844e65c502@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aabc9fb1-4e74-409a-b25b-8e844e65c502@arm.com>
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

On Mon, Apr 14, 2025 at 07:28:46PM +0100, Ryan Roberts wrote:
> On 14/04/2025 18:38, Catalin Marinas wrote:
> > On Tue, Mar 04, 2025 at 03:04:41PM +0000, Ryan Roberts wrote:
> >> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> >> index 1898c3069c43..149df945c1ab 100644
> >> --- a/arch/arm64/include/asm/pgtable.h
> >> +++ b/arch/arm64/include/asm/pgtable.h
> >> @@ -40,6 +40,55 @@
> >>  #include <linux/sched.h>
> >>  #include <linux/page_table_check.h>
> >>  
> >> +static inline void emit_pte_barriers(void)
> >> +{
> >> +	/*
> >> +	 * These barriers are emitted under certain conditions after a pte entry
> >> +	 * was modified (see e.g. __set_pte_complete()). The dsb makes the store
> >> +	 * visible to the table walker. The isb ensures that any previous
> >> +	 * speculative "invalid translation" marker that is in the CPU's
> >> +	 * pipeline gets cleared, so that any access to that address after
> >> +	 * setting the pte to valid won't cause a spurious fault. If the thread
> >> +	 * gets preempted after storing to the pgtable but before emitting these
> >> +	 * barriers, __switch_to() emits a dsb which ensure the walker gets to
> >> +	 * see the store. There is no guarrantee of an isb being issued though.
> >> +	 * This is safe because it will still get issued (albeit on a
> >> +	 * potentially different CPU) when the thread starts running again,
> >> +	 * before any access to the address.
> >> +	 */
> >> +	dsb(ishst);
> >> +	isb();
> >> +}
> >> +
> >> +static inline void queue_pte_barriers(void)
> >> +{
> >> +	if (test_thread_flag(TIF_LAZY_MMU))
> >> +		set_thread_flag(TIF_LAZY_MMU_PENDING);
> > 
> > As we can have lots of calls here, it might be slightly cheaper to test
> > TIF_LAZY_MMU_PENDING and avoid setting it unnecessarily.
> 
> Yes, good point.
> 
> > I haven't checked - does the compiler generate multiple mrs from sp_el0
> > for subsequent test_thread_flag()?
> 
> It emits a single mrs but it loads from the pointer twice.

It's not that bad if only do the set_thread_flag() once.

> I think v3 is the version we want?
> 
> 
> void TEST_queue_pte_barriers_v1(void)
> {
> 	if (test_thread_flag(TIF_LAZY_MMU))
> 		set_thread_flag(TIF_LAZY_MMU_PENDING);
> 	else
> 		emit_pte_barriers();
> }
> 
> void TEST_queue_pte_barriers_v2(void)
> {
> 	if (test_thread_flag(TIF_LAZY_MMU) &&
> 	    !test_thread_flag(TIF_LAZY_MMU_PENDING))
> 		set_thread_flag(TIF_LAZY_MMU_PENDING);
> 	else
> 		emit_pte_barriers();
> }
> 
> void TEST_queue_pte_barriers_v3(void)
> {
> 	unsigned long flags = read_thread_flags();
> 
> 	if ((flags & (_TIF_LAZY_MMU | _TIF_LAZY_MMU_PENDING)) == _TIF_LAZY_MMU)
> 		set_thread_flag(TIF_LAZY_MMU_PENDING);
> 	else
> 		emit_pte_barriers();
> }

Doesn't v3 emit barriers once _TIF_LAZY_MMU_PENDING has been set? We
need something like:

	if (flags & _TIF_LAZY_MMU) {
		if (!(flags & _TIF_LAZY_MMU_PENDING))
			set_thread_flag(TIF_LAZY_MMU_PENDING);
	} else {
		emit_pte_barriers();
	}

-- 
Catalin

