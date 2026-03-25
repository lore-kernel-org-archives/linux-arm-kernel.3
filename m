Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A041109C02F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 15:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnnlSk5FC62h+SQFH8Nxu8sIUC1RcsZVRgl9S0CLkWY=; b=MxuQqs5EUudlkKRSepemH3sgjb
	GzCJjQwL+3FM5OHz08psPZfRWitEa2vs0xBtJEBYPuD3cnep5Y10e0DUxIC7f1W0WTcjvatm7ZHCN
	x99mPJDFUT/91aK53WwppHuPj3eTwS1ZXbMgIateWnK181RyG9h2WkCPe7xCqYk3/Kn4nbSAZ4fME
	jyFfje2QFDw7s6tTDtpgjWY0GVf/HzJZp2LWd5fP4upHmeGxeFZE1e65TeCFewZWE7+DlbsJJxTHS
	YqHhw+zPc8SNXxmKQC85mjZFebZPmaz7s8lCvDlfu7+sZ3gF+lDuMruzPpP9pn9k8lUA4CGOzFLed
	n8XudfHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Poa-00000003kBq-3p1x;
	Wed, 25 Mar 2026 15:06:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PoY-00000003kBR-1TrZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 15:06:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C20A9442D9;
	Wed, 25 Mar 2026 15:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD1FC4CEF7;
	Wed, 25 Mar 2026 15:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774451193;
	bh=lnnlSk5FC62h+SQFH8Nxu8sIUC1RcsZVRgl9S0CLkWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BnD9gwi0VQwGVJZwxlZQSOLmSOral2e3j++2mIQTX80noalI4x2J+rOnTVVsPd5ua
	 bijGBS4S+PN15GS2dwJyCXUcUl1+I4PSqcUyBG4KMCANZt9ucF/XE1bBdhJZFUXPrB
	 pmR3QfTDBIoNgVHkDUSxRCCuwFFvYbo0ARFItqVTCM999NZ04o69nLKszndiNSCW/o
	 TGVS2SyH8n2FSXZNGDFHnW9gJal76Pf4kPiku88kYtICDUCIpfRbQJnZ1nNG+WqI7L
	 2xKtn/qdYmPNFLV6GbRerLsyg16lm2w2zUDlrMOn94GiYGx3bPLRGnrwyMZZpk5ata
	 jBo6ZVd/Hp3iw==
Date: Wed, 25 Mar 2026 15:06:26 +0000
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
Message-ID: <e227a7f7-0186-4d10-b7b4-c84ca8424bdd@lucifer.local>
References: <12132694536834262062d1fb304f8f8a064b6750.1770645603.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4yEWn3kVZPQZatOJX7NLLv-OK9pAqUDuWz25XxG5hpV=w@mail.gmail.com>
 <a4d7cf56-eab4-431d-886b-a32456e44736@linux.alibaba.com>
 <CAGsJ_4woBVQdYcCbN1Btr2vxOL8OAujaHkNZZ41=S-TdNh-wbw@mail.gmail.com>
 <d6820b1e-52ae-4ef2-8342-11818fdd0cb1@linux.alibaba.com>
 <43831628-a00f-4292-9797-cb96a029bb00@kernel.org>
 <e54e0ec1-b968-4e12-84a3-4e3d331b1c36@linux.alibaba.com>
 <86f611cb-1292-44e4-b629-6503135d33ca@kernel.org>
 <e5cb474a-a84d-4edc-8289-d68378feee7d@lucifer.local>
 <e3e374cc-ddf2-4112-b063-6cb1839ea566@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3e374cc-ddf2-4112-b063-6cb1839ea566@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_080634_453003_992FBBD4 
X-CRM114-Status: GOOD (  19.86  )
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

On Wed, Mar 25, 2026 at 03:58:36PM +0100, David Hildenbrand (Arm) wrote:
> On 3/25/26 15:36, Lorenzo Stoakes (Oracle) wrote:
> > On Mon, Mar 16, 2026 at 03:15:18PM +0100, David Hildenbrand (Arm) wrote:
> >> On 3/16/26 07:25, Baolin Wang wrote:
> >>>
> >>>
> >>>
> >>> Sure. However, after investigating RISC‑V and x86, I found that
> >>> ptep_clear_flush_young() does not flush the TLB on these architectures:
> >>>
> >>> int ptep_clear_flush_young(struct vm_area_struct *vma,
> >>>                unsigned long address, pte_t *ptep)
> >>> {
> >>>     /*
> >>>      * On x86 CPUs, clearing the accessed bit without a TLB flush
> >>>      * doesn't cause data corruption. [ It could cause incorrect
> >>>      * page aging and the (mistaken) reclaim of hot pages, but the
> >>>      * chance of that should be relatively low. ]
> >>>      *
> >>>      * So as a performance optimization don't flush the TLB when
> >>>      * clearing the accessed bit, it will eventually be flushed by
> >>>      * a context switch or a VM operation anyway. [ In the rare
> >>>      * event of it not getting flushed for a long time the delay
> >>>      * shouldn't really matter because there's no real memory
> >>>      * pressure for swapout to react to. ]
> >>>      */
> >>>     return ptep_test_and_clear_young(vma, address, ptep);
> >>> }
> >>
> >> You'd probably want an arch helper then, that tells you whether
> >> a flush_tlb_range() after ptep_test_and_clear_young() is required.
> >>
> >> Or some special flush_tlb_range() helper.
> >>
> >> I agree that it requires more work.
> >
> > Sorry unclear here - does the series need more work or does a follow up patch
> > need more work?
>
> Follow up!

Ok good as in mm-stable now. Sadly means I don't get to review it but there we
go.

>
> --
> Cheers,
>
> David

Thanks, Lorenzo

