Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE2AC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 20:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/quf11TP5DQgl9OoNlHgCgBQHgJEF0iW7Gqz5VJqgoY=; b=ho9YXbAQlddNvfsKuRKgnzpQEE
	W4engnK8wFYI0OrECe3r+35atdYPrnCs8zz00oGZEd45G3TWalwzjevLFUknmU3J53ghO1+cV3VeW
	Nd4iOiI/vlH7Q86NJWvAaELuNNiLXEr0BYh2tDNYQZs0/Pf0ygFpaY1Z3Jmr1s5JFxwnGec9Xjl8l
	TZ1WSva8uM6vLyyMbIFa9LGmIoy28XsGNo/1Vx2TxqEkM8y8LmnS+Vv+9izCYIM/9SCw6RnsXc3tb
	q0TaRC9DOek7+DUKubuQgfai97MLLvbjuxoD/fCmgszhsFMRkuaW/pkh6C6Pmh35iipwz6lE6JWC3
	Dqz11xlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RZG-0000000A2mY-3t9i;
	Thu, 03 Apr 2025 20:53:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RT3-0000000A1TR-2q4t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 20:47:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7ABF3445BD;
	Thu,  3 Apr 2025 20:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C91C4CEE3;
	Thu,  3 Apr 2025 20:47:13 +0000 (UTC)
Date: Thu, 3 Apr 2025 21:47:10 +0100
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
Subject: Re: [PATCH v3 02/11] arm64: hugetlb: Refine tlb maintenance scope
Message-ID: <Z-7zznsJ91ZCCTeS@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-3-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-3-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_134717_732975_176D0ECF 
X-CRM114-Status: GOOD (  14.14  )
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

On Tue, Mar 04, 2025 at 03:04:32PM +0000, Ryan Roberts wrote:
> When operating on contiguous blocks of ptes (or pmds) for some hugetlb
> sizes, we must honour break-before-make requirements and clear down the
> block to invalid state in the pgtable then invalidate the relevant tlb
> entries before making the pgtable entries valid again.
> 
> However, the tlb maintenance is currently always done assuming the worst
> case stride (PAGE_SIZE), last_level (false) and tlb_level
> (TLBI_TTL_UNKNOWN). We can do much better with the hinting; In reality,
> we know the stride from the huge_pte pgsize, we are always operating
> only on the last level, and we always know the tlb_level, again based on
> pgsize. So let's start providing these hints.
> 
> Additionally, avoid tlb maintenace in set_huge_pte_at().
> Break-before-make is only required if we are transitioning the
> contiguous pte block from valid -> valid. So let's elide the
> clear-and-flush ("break") if the pte range was previously invalid.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

