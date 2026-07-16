Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E78C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPC4/bkySYuEIDm7sSNDHaTK4nJg9WPIz/TBHjyeJK0=; b=sKtQFsBkbCCcinoyGTN9HDgEnU
	y+q9ps1iEm6gdOmYvXAheRUUWsdz7GANNU3XIQbs+pmyYdEIWYxMrZm5W0BnQ3rrngatdrEZks1S8
	Fz3J5dlEa3om4o3wiGCp+7AYRPElQ5gQMXUIfw9ohTQCLwsAww5/VeEJnIv2jXBIR+qdGyoDc8SR+
	D2BJ0p0blA7LKQ+N+RGFibiyGU1oo4/YIImkBDobBZBU9ir243u3KXVpaJ6lEFNBDVCN0O0WH0sS4
	F+6y1VOLEFa7SGU1HejvNBVWnYF+V4CCuwajmZoyUlMS3dmbFd8ywgaUiLMJXQnNENBGy1YlEVd0L
	XmRH/hRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLWm-0000000HLV6-1nCq;
	Thu, 16 Jul 2026 12:49:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLWl-0000000HLUv-0MxC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:49:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 75DC0438DB;
	Thu, 16 Jul 2026 12:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8401F000E9;
	Thu, 16 Jul 2026 12:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784206162;
	bh=hPC4/bkySYuEIDm7sSNDHaTK4nJg9WPIz/TBHjyeJK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EBTnCvJ9LBKnvWT6txkoqJfPx80j2qmCPPgtys2eexys61AqRBL/PikdcJ6hRJAu9
	 N/7/eAlmSuk+e3pdfg1br9QTOhJW2GGB9kHXTsWQFNTHz0JCZ97PbPUW/LdJ4+wRy/
	 +XTaRU6ByVV8cgDQ/Y8URNaE9ixhEq3zlBP78l090NnAF3jztLYymQ9AP81piPIYAS
	 +eLW/SudvgS/2t8T899cAQ7pEdr9DwlUjvvFQEk6oEwv3wdptotD0TLRa6MM1FffAR
	 YHD2d42XYxRErp70skW71CAatVzJVw6VUlhs8jh9r8ff+ImW/liW57cAnWmulaWueU
	 l0WsUaQ0QduBw==
Date: Thu, 16 Jul 2026 13:49:12 +0100
From: Will Deacon <will@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: Dev Jain <dev.jain@arm.com>, muchun.song@linux.dev, osalvador@suse.de,
	ljs@kernel.org, liam@infradead.org, riel@surriel.com,
	vbabka@kernel.org, harry@kernel.org, jannh@google.com,
	lance.yang@linux.dev, kas@kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, apopple@nvidia.com,
	rcampbell@nvidia.com, ziy@nvidia.com, matthew.brost@intel.com,
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
	gourry@gourry.net, ying.huang@linux.alibaba.com, ak@linux.intel.com,
	nao.horiguchi@gmail.com, mel@csn.ul.ie, j-nomura@ce.jp.nec.com,
	pfalcato@suse.de, tglx@kernel.org, dave.hansen@intel.com,
	jpoimboe@kernel.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/6] arm64: make huge_ptep_get handled unaligned
 addresses
Message-ID: <aljTSN3yGRv1OoUN@willie-the-truck>
References: <20260703114202.365553-1-dev.jain@arm.com>
 <20260703114202.365553-2-dev.jain@arm.com>
 <20260705003559.8b124d2b94b685cc2e4e77ae@linux-foundation.org>
 <8fdbe0d6-87fd-441c-b6d2-baac380f6fb3@arm.com>
 <4b4e8007-3747-457a-85cc-d1003e1c8fe2@kernel.org>
 <39a13445-dc6f-4a75-92b8-f4a122c63b89@arm.com>
 <7ac558fd-1081-456b-b997-c7321241cf8c@arm.com>
 <2b9d60a2-8698-46b0-80ae-b8747a66a85b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b9d60a2-8698-46b0-80ae-b8747a66a85b@kernel.org>
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

On Mon, Jul 06, 2026 at 04:04:40PM +0200, David Hildenbrand (Arm) wrote:
> On 7/6/26 12:54, Dev Jain wrote:
> > 
> > 
> > On 06/07/26 4:22 pm, Dev Jain wrote:
> >>
> >>
> >> On 06/07/26 2:15 pm, David Hildenbrand (Arm) wrote:
> >>>
> >>> Even worse, right? We could walk 128 entries, when we really should just walk 16
> >>> (IIRC) entries, possibly reading garbage or even worse, into a memory hole at
> >>> the end of memory?
> >>
> >> Hmm I was thinking that the checks pte_dirty() and pte_young() wouldn't care whether
> >> the pte is garbage. But, we could actually dereference a ptep pointer not having
> >> backing memory at all.
> >>
> >> Does the following sound good?
> >>
> >> "On systems where CONT_PTES != CONT_PMDS (meaning page size is 16K), we could collect
> >> excess a/d bit state, meaning extra work for the kernel. Even worse, we may iterate
> >> beyond the PTE table and dereference a garbage ptep pointer to access physical
> >> memory we don't own. Since the ptep pointer is a linear map address, we may run off
> >> the end of the linear map, dereference a VA not mapped into the kernel pgtables and
> >> cause kernel panic."
> >>
> >> Although I checked on arm64, there is no case in which there is a hole after the
> >> linear map, but still that assumption shouldn't be made.
> > 
> > Oh but we could access a linear map address which corresponds to a DRAM hole, meaning
> > there is no entry in the kernel pgtable.
> 
> Yes, exactly. With debug-pagealloc and things like that we might have many holes
> in the direct map.

I think this one patch should go in as a fix.

Andrew, do you mind if I pick it via arm64? If you'd rather manage the
whole lot, please can you send just this one as a fix for this cycle?

Thanks,

Will

