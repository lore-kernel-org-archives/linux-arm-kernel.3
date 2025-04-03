Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2968EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 20:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8p7Aws/P9dvI5z+9lQ4DbG5szIWXC+/dyd/6YwbBb4=; b=ryH2r00lKA8qMNgTx+rFeVfLqJ
	6VvKTyajlxaDrI6qz+MYpkD4gHtDi1uE8mn152ht/6Gxlar4bmjOKbecUtBvNL+eLdxIvUB2LYfbf
	TSyOGBmKvhx/dhunqMriYA4eoSlCCkpX1mTJWHMgcXVvUjPjy8p4iQHYvIZQZnOSa8HDc+DZEHeSa
	rGrL2FM8n1aGXItZG0a7yrc7wXGxuPMXQstUkKvu0pxGz6w3GjY6hweiXuDvfZnsWSgXJ91HNm18S
	zdZN10OJ0aWVa87hdIL3S7bWYzZm5jucfZm5q0K4i+WHs60YEQz6T/oQX+KttzG8g3pCfAAEuqpob
	+9+1QAng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RTx-0000000A1dP-30rr;
	Thu, 03 Apr 2025 20:48:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RS9-0000000A1K8-1onN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 20:46:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FF325C59B2;
	Thu,  3 Apr 2025 20:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A795EC4CEE3;
	Thu,  3 Apr 2025 20:46:16 +0000 (UTC)
Date: Thu, 3 Apr 2025 21:46:13 +0100
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
Subject: Re: [PATCH v3 01/11] arm64: hugetlb: Cleanup huge_pte size discovery
 mechanisms
Message-ID: <Z-7zlcVCrsw4SkwX@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-2-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-2-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_134621_513218_BAB8018B 
X-CRM114-Status: GOOD (  19.76  )
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

On Tue, Mar 04, 2025 at 03:04:31PM +0000, Ryan Roberts wrote:
> Not all huge_pte helper APIs explicitly provide the size of the
> huge_pte. So the helpers have to depend on various methods to determine
> the size of the huge_pte. Some of these methods are dubious.
> 
> Let's clean up the code to use preferred methods and retire the dubious
> ones. The options in order of preference:
> 
>  - If size is provided as parameter, use it together with
>    num_contig_ptes(). This is explicit and works for both present and
>    non-present ptes.
> 
>  - If vma is provided as a parameter, retrieve size via
>    huge_page_size(hstate_vma(vma)) and use it together with
>    num_contig_ptes(). This is explicit and works for both present and
>    non-present ptes.
> 
>  - If the pte is present and contiguous, use find_num_contig() to walk
>    the pgtable to find the level and infer the number of ptes from
>    level. Only works for *present* ptes.
> 
>  - If the pte is present and not contiguous and you can infer from this
>    that only 1 pte needs to be operated on. This is ok if you don't care
>    about the absolute size, and just want to know the number of ptes.
> 
>  - NEVER rely on resolving the PFN of a present pte to a folio and
>    getting the folio's size. This is fragile at best, because there is
>    nothing to stop the core-mm from allocating a folio twice as big as
>    the huge_pte then mapping it across 2 consecutive huge_ptes. Or just
>    partially mapping it.
> 
> Where we require that the pte is present, add warnings if not-present.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

