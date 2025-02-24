Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100E9C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 12:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLszEU23HGDAY7L9Om5/cPmM/j0KOfXexqqjf1oqMUM=; b=RzVbKi4NZoLFGMznSjtm3SZJSn
	H6vSFkB8jqeu8fwkks8LT0RIWaxUFH4WqwWmAIVCY7LuSN8Nz3HZahNos+HZJJPRxE2ywIfA9VLAw
	2oBnbiuvC6VVPrKIowh0NHQsaAiRJScobb2NbbQadgaxcehsWQC22W8yHY7CHah6Q7KiSzeNdxkdf
	arVTE/fW7t5I/cduhcMbSSp+bu4wZpy2EsegZgZrvC0W1pl0R8nYTKr616jp/ujukpFOjCsz/zX+O
	y32z6bVHUzLMs/OKH2fZR+gLRvreLIzM1lyyJvUGrnuPh4hQ8yJVjG1mteaRDuDL3YQLXwflFa4NR
	jVUi9EMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXQB-0000000DfPM-2jEc;
	Mon, 24 Feb 2025 12:18:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXCZ-0000000DbKz-2fQr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:04:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A49C5C6309;
	Mon, 24 Feb 2025 12:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492DBC4CED6;
	Mon, 24 Feb 2025 12:04:44 +0000 (UTC)
Date: Mon, 24 Feb 2025 12:04:42 +0000
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
Subject: Re: [PATCH v2 09/14] mm/vmalloc: Gracefully unmap huge ptes
Message-ID: <Z7xgWtgxWg3BvaYz@arm.com>
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
 <20250217140809.1702789-10-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217140809.1702789-10-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_040447_715523_DC5151D6 
X-CRM114-Status: GOOD (  15.59  )
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

On Mon, Feb 17, 2025 at 02:08:01PM +0000, Ryan Roberts wrote:
> Commit f7ee1f13d606 ("mm/vmalloc: enable mapping of huge pages at pte
> level in vmap") added its support by reusing the set_huge_pte_at() API,
> which is otherwise only used for user mappings. But when unmapping those
> huge ptes, it continued to call ptep_get_and_clear(), which is a
> layering violation. To date, the only arch to implement this support is
> powerpc and it all happens to work ok for it.
> 
> But arm64's implementation of ptep_get_and_clear() can not be safely
> used to clear a previous set_huge_pte_at(). So let's introduce a new
> arch opt-in function, arch_vmap_pte_range_unmap_size(), which can
> provide the size of a (present) pte. Then we can call
> huge_ptep_get_and_clear() to tear it down properly.
> 
> Note that if vunmap_range() is called with a range that starts in the
> middle of a huge pte-mapped page, we must unmap the entire huge page so
> the behaviour is consistent with pmd and pud block mappings. In this
> case emit a warning just like we do for pmd/pud mappings.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

