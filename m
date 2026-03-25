Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBB8109C024
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1s/oLbJCdbJG+H5bcsLc7QVlHnEEasfd6M2und9S9aM=; b=UaPNUosSuUeYCQxXC575lslypf
	nPTHgWEPyX8mdy2DrinuFOTFySJJcCWsVATLOTw7g3P3V9SNDPPPGQWkpdI+Szv0Yv3pfMJvHqUKl
	tV/ubXz5O7lNwj3HV0F8HK/wBZ+kLy+7JNHnlfstKetJJa6mypU2tQBPc5nNUUieZqS6bJJSos7c7
	mO0wnMMjzxhDNdZRZA5m41tcVqDe+tYjKgCDiSe7rXx0OgF6TJi/9pY9gPZgWdgPDP81Nt+2KI7e3
	DhkNrc4r+CsLC9ip1q8X2I9aSFZ4mzoF0mQ+fYQY6sZZNbsR7xLtR8DRWUXu6hW3vxNMO6bZyIFPa
	2ZCaOc6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PLk-00000003cqi-1g9z;
	Wed, 25 Mar 2026 14:36:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PLj-00000003cq6-3dw2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:36:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04532600C4;
	Wed, 25 Mar 2026 14:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29837C4CEF7;
	Wed, 25 Mar 2026 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774449406;
	bh=1s/oLbJCdbJG+H5bcsLc7QVlHnEEasfd6M2und9S9aM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ehl7K/4rE1asXxBnk+ljYExLi38p1QY5H3JQPyU3Dw1aVS7AlxcjALQupCiBIbhK7
	 1XwxolSPpD2kzFv8Ve62pYgU2ezvRA70PlVSHqhsrj57EqZf26UdWCt+ylLwstzzcj
	 mLAxBQf0BwgyX85q+y4HrWi0HolMOoyrhmhIDebh3oULdo5uid4NYYcdGGJIbXYYq+
	 b8Mdq17b/vt86HPndC0RdwQ26TSEnaW36fYjUJZj6xPEotLJD7x0DHO6L1MHOpTSqB
	 MaBWZPAmmlrmDBl1Wp3uz/Ww7A2eHC5s38FLk4pgAgHm3UsU6SvNS2cGdxjWInlyPr
	 Ir+GgF58W4yQQ==
Date: Wed, 25 Mar 2026 14:36:43 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, dev.jain@arm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm: rmap: support batched checks of the
 references for large folios
Message-ID: <e5cb474a-a84d-4edc-8289-d68378feee7d@lucifer.local>
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
 <12132694536834262062d1fb304f8f8a064b6750.1770645603.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4yEWn3kVZPQZatOJX7NLLv-OK9pAqUDuWz25XxG5hpV=w@mail.gmail.com>
 <a4d7cf56-eab4-431d-886b-a32456e44736@linux.alibaba.com>
 <CAGsJ_4woBVQdYcCbN1Btr2vxOL8OAujaHkNZZ41=S-TdNh-wbw@mail.gmail.com>
 <d6820b1e-52ae-4ef2-8342-11818fdd0cb1@linux.alibaba.com>
 <43831628-a00f-4292-9797-cb96a029bb00@kernel.org>
 <e54e0ec1-b968-4e12-84a3-4e3d331b1c36@linux.alibaba.com>
 <86f611cb-1292-44e4-b629-6503135d33ca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86f611cb-1292-44e4-b629-6503135d33ca@kernel.org>
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

On Mon, Mar 16, 2026 at 03:15:18PM +0100, David Hildenbrand (Arm) wrote:
> On 3/16/26 07:25, Baolin Wang wrote:
> >
> >
> > On 3/10/26 4:17 PM, David Hildenbrand (Arm) wrote:
> >> On 3/10/26 02:37, Baolin Wang wrote:
> >>>
> >>>
> >>>
> >>> I understand your point. I’m concerned that I can’t test this patch on
> >>> every architecture to validate the benefits. Anyway, let me try this on
> >>> my X86 machine first.
> >>
> >> In any case, please make that a follow-up patch :)
> >
> > Sure. However, after investigating RISC‑V and x86, I found that
> > ptep_clear_flush_young() does not flush the TLB on these architectures:
> >
> > int ptep_clear_flush_young(struct vm_area_struct *vma,
> >                unsigned long address, pte_t *ptep)
> > {
> >     /*
> >      * On x86 CPUs, clearing the accessed bit without a TLB flush
> >      * doesn't cause data corruption. [ It could cause incorrect
> >      * page aging and the (mistaken) reclaim of hot pages, but the
> >      * chance of that should be relatively low. ]
> >      *
> >      * So as a performance optimization don't flush the TLB when
> >      * clearing the accessed bit, it will eventually be flushed by
> >      * a context switch or a VM operation anyway. [ In the rare
> >      * event of it not getting flushed for a long time the delay
> >      * shouldn't really matter because there's no real memory
> >      * pressure for swapout to react to. ]
> >      */
> >     return ptep_test_and_clear_young(vma, address, ptep);
> > }
>
> You'd probably want an arch helper then, that tells you whether
> a flush_tlb_range() after ptep_test_and_clear_young() is required.
>
> Or some special flush_tlb_range() helper.
>
> I agree that it requires more work.

Sorry unclear here - does the series need more work or does a follow up patch
need more work?

As this is in mm-stable afaict.

Thanks, Lorenzo

>
> --
> Cheers,
>
> David

