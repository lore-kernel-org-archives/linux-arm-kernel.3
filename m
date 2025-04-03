Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E40C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 20:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1J/xQeuQJQCDdWxejSFAvAdNpDigM6iFULX7XMOzsQ=; b=aSxyQbPQxH1pzfW0LkJTfCXY+o
	vAcGv5nsVjQEg8CvWch949CwkT404gU7I3mO7jPm5abtKv0EKDxCdA3BW5b9V8fRXMBJJyMiMG/pg
	biHhSfUBChd9Y1kCnkiU93crfb8CnPBZ7MBsvgpW/Mdvda6bhw53JBnENaorFTlcvtjU6rPqT0idw
	xn7hDjPKfXnMYO5bKRtYLYYIljcj8FIau+svlZbdv8HN3jAUejoQw02cVbThETy8c6342dZgOQKSR
	I/VzZl8zWMtYqoouhIwjh8GU0Gwy+hvAoraS9Sznxbv+4id0FGMicjiUaP67Qgza7Yu3aBHmS2n7L
	sBM4mufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Rb2-0000000A39f-2fK0;
	Thu, 03 Apr 2025 20:55:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RTM-0000000A1X6-1PWu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 20:47:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF9A85C5A2E;
	Thu,  3 Apr 2025 20:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFFAC4CEE3;
	Thu,  3 Apr 2025 20:47:31 +0000 (UTC)
Date: Thu, 3 Apr 2025 21:47:29 +0100
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
Subject: Re: [PATCH v3 05/11] arm64: hugetlb: Use set_ptes_anysz() and
 ptep_get_and_clear_anysz()
Message-ID: <Z-7z4ZFGIZCrNq6h@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-6-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-6-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_134736_434385_71DF618A 
X-CRM114-Status: GOOD (  16.71  )
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

On Tue, Mar 04, 2025 at 03:04:35PM +0000, Ryan Roberts wrote:
> Refactor the huge_pte helpers to use the new common set_ptes_anysz() and
> ptep_get_and_clear_anysz() APIs.

Nitpick: maybe add underscores to this new API to suggest it's private.
Up to you.

> This provides 2 benefits; First, when page_table_check=on, hugetlb is
> now properly/fully checked. Previously only the first page of a hugetlb
> folio was checked. Second, instead of having to call __set_ptes(nr=1)
> for each pte in a loop, the whole contiguous batch can now be set in one
> go, which enables some efficiencies and cleans up the code.
> 
> One detail to note is that huge_ptep_clear_flush() was previously
> calling ptep_clear_flush() for a non-contiguous pte (i.e. a pud or pmd
> block mapping). This has a couple of disadvantages; first
> ptep_clear_flush() calls ptep_get_and_clear() which transparently
> handles contpte. Given we only call for non-contiguous ptes, it would be
> safe, but a waste of effort. It's preferable to go straight to the layer
> below. However, more problematic is that ptep_get_and_clear() is for
> PAGE_SIZE entries so it calls page_table_check_pte_clear() and would not
> clear the whole hugetlb folio. So let's stop special-casing the non-cont
> case and just rely on get_clear_contig_flush() to do the right thing for
> non-cont entries.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

