Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E302CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xxs58C2WtFJ0KGp6PCanbZVXzvtIrGauHJD1iwcYKoI=; b=0x65BwjXHKn/wMZLvxfeNs/frg
	K3M/zfiPFJnRAyXnvWPDZ632VpOyA84Dj9HWwAHG7E7iLlK+0HOLrwB1qi2/Ojaw+nxODCbfKtuzx
	Zd0Aw7BZDYtzkDzYzfKwDEx71gkdAQ8Z5AtJv9r+SxVTHthi1p4bOgN4gOKbONsuSBL9QfJwII8Jy
	NHZFtTr/xhUpGGiMKvsEO7EydKUsmrMDFWTj3SBz9PdYSncW/rGOxQA0NF9jeaIDbNBm7iQtaShB4
	ECbA25D3UbJrLZkTAGX0ETk26XLJFb0lZaXuonGFj5DwVmUgP8Ce8ut608g8AwDkDNBFMd4CL94Sp
	MnEBoxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBde-0000000GzMo-3PLv;
	Thu, 18 Sep 2025 10:13:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBdd-0000000GzLl-0Wbt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:13:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E9726020B;
	Thu, 18 Sep 2025 10:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86177C4CEE7;
	Thu, 18 Sep 2025 10:13:12 +0000 (UTC)
Date: Thu, 18 Sep 2025 11:13:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Yin Fengwei <fengwei_yin@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
Message-ID: <aMvbNvCsSxQjA2rq@arm.com>
References: <20250915032946.33203-1-ying.huang@linux.alibaba.com>
 <20250915032946.33203-3-ying.huang@linux.alibaba.com>
 <46dcddec-88a9-4b22-920c-8a3edeb2f027@arm.com>
 <87o6r833li.fsf@DESKTOP-5N7EMDA>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6r833li.fsf@DESKTOP-5N7EMDA>
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

On Thu, Sep 18, 2025 at 10:18:49AM +0800, Huang, Ying wrote:
> Ryan Roberts <ryan.roberts@arm.com> writes:
> > contpte_ptep_set_access_flags() currently does a (broadcast) __flush_tlb_range()
> > on the (pte_write(orig_pte) == pte_write(entry)) path. I think that should be
> > changed to a local range invalidation to be consistent with this change.
> 
> Yes.  This should be changed too.  However, it means we need a local
> variant of __flush_tlb_range() and flush_tlb_mm().  Is it OK to
> introduce them first and tidy up later?

If it's just for contpte, we'd never take the flush_tlb_mm() path. So we
could instead add a specific local_flush_tlb_contpte_range().

-- 
Catalin

