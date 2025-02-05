Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C5EC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 04:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/vdyw/FQJ6z9mXtNHBqHXc9PxNdOkzMlxLRuvd9sik=; b=qFP2kX2WbASJe4nyYWJ1ADZQAU
	dr17qVINKg2mQP2O6+APkCQO0G7E3aoCN9+MW2dMudon0UVyD/spTTG1sLADtohVckv8CD+MBzEPh
	m/zyQScUjge+GTilG52UlmrNlglF5V/2wQFZjirHJcUQD4PK5CIsk/mJbmHox1cKQw8H+K2okt9QS
	BXuxrvHSr8/Yg5cs3+l9MCsfSutDRgd5chG+qsz+JXKvIa0mHTyT3OdU4ikgCQLMrLyvLg+dy5I09
	0Q4kguFzkYHm+mqOtrhDTCWvlUrnAutyyRg3KpjU/uLRL+ogMsfl7ZZ49Khmq63xnucblasfg+1cC
	Qzsb079A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfWb3-00000002Gb0-32dk;
	Wed, 05 Feb 2025 04:01:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVZu-00000002Bap-2MI2;
	Wed, 05 Feb 2025 02:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B7FBA41843;
	Wed,  5 Feb 2025 02:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18A8C4CEDF;
	Wed,  5 Feb 2025 02:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738724149;
	bh=Iy98cYZmlM0zfKAVbhzprR+xN12zDSTDaNyVInZr9pA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zp2t+0QT8fNkRMUZvjHBFUUNdBviJZg+np/oXvDgPQB2Id6m6syhV6Frr1GroNoJ4
	 uoGcXvZooe6z2E8NBDcwL48m5lS3DlFhfRPcrIsU3bhN+0XKfX3CI8s755s77aVDIC
	 j5qhOGfvc7gwTaoMXV96zWvGvu0CB42PLVCNzKgo=
Date: Tue, 4 Feb 2025 18:55:48 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: Barry Song <21cnbao@gmail.com>, linux-mm@kvack.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
Subject: Re: [PATCH v3 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Message-Id: <20250204185548.75d95ac35aacccbc3982e935@linux-foundation.org>
In-Reply-To: <0785a15e-29fb-4801-9743-3d08e381d506@redhat.com>
References: <20250115033808.40641-1-21cnbao@gmail.com>
	<20250115033808.40641-4-21cnbao@gmail.com>
	<0785a15e-29fb-4801-9743-3d08e381d506@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_185550_668769_10188AFA 
X-CRM114-Status: GOOD (  17.87  )
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

On Tue, 4 Feb 2025 12:38:31 +0100 David Hildenbrand <david@redhat.com> wrote:

> Hi,
> 
> >   	unsigned long hsz = 0;
> >   
> > @@ -1780,6 +1800,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
> >   				hugetlb_vma_unlock_write(vma);
> >   			}
> >   			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
> > +		} else if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
> > +				can_batch_unmap_folio_ptes(address, folio, pvmw.pte)) {
> > +			nr_pages = folio_nr_pages(folio);
> > +			flush_cache_range(vma, range.start, range.end);
> > +			pteval = get_and_clear_full_ptes(mm, address, pvmw.pte, nr_pages, 0);
> > +			if (should_defer_flush(mm, flags))
> > +				set_tlb_ubc_flush_pending(mm, pteval, address,
> > +					address + folio_size(folio));
> > +			else
> > +				flush_tlb_range(vma, range.start, range.end);
> >   		} else {
> 
> I have some fixes [1] that will collide with this series. I'm currently 
> preparing a v2, and am not 100% sure when the fixes will get queued+merged.
> 
> I'll base them against mm-stable for now, and send them out based on 
> that, to avoid the conflicts here (should all be fairly easy to resolve 
> from a quick glimpse).
> 
> So we might have to refresh this series here if the fixes go in first.
> 
> [1] https://lkml.kernel.org/r/20250129115411.2077152-1-david@redhat.com

It doesn't look like "mm: fixes for device-exclusive entries (hmm)"
will be backportable(?) but yes, we should aim to stage your fixes
against mainline and ahead of other changes to at least make life
easier for anyone who chooses to backport your fixes into an earlier
kernel.


