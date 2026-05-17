Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99184CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Csc2EOUnK8577Uqh7Gr3ZK6EyQ7a8L8fRxqRpOAL5zY=; b=lwDBI3z1VDkR7Ijl8+vdS6w9R0
	zEqxhstVIqmAd4S/PdABP45RXqsRX+u6dalHKhhwiAqS0MAKzJ5bliRm12i555K0Nf9RbeB3Yr3cM
	KBBwX1Wb1to3gwDaeU8sNUn/y64BmbEcNz/+OhlbL/KCcpo0xRtCxj1eHn+tei166iXXkgtdeSrO9
	FZ6xmKDgxaDbLOvg1iM5xeyMRYPeU+MORzQ4sq+CXPwtv1LrwLFBg/nq5Yh4rB8YKNs7mioDm8Xb5
	qs2Y/YKQnX6+aBa9UZga8X+YDuqPIU8DExIk0hm5sg3WRGw60IRy3kXSHNRgWzfTwiI2ENS30ivad
	/fBHNBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOgho-0000000DHMf-2z3B;
	Sun, 17 May 2026 18:59:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOghm-0000000DHMD-4714
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:59:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3BD441E5A;
	Sun, 17 May 2026 18:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8EDC2BCB0;
	Sun, 17 May 2026 18:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044353;
	bh=TxClM2mdGfWD4Uq8Jpf0PPjMaqVPLXry0mgG8pyL1ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EhLEEUhu8ngvP04rcdO1wJ6msWZdfCnY5xxRLw/j/qz9RmVQey36HjQpIfxu/Nehk
	 44aoIxHUq3YL9Q1/FjhIR53EscyofY3edMGdLKzx4iSJTdnk2Td94s6P3VMXzkLpGP
	 Wf6MIL7TvRBTcvlRAKzVSp5IqVoD97DGt7vgdx9WCppZa2PGwuLEs0nljOljWPwmsk
	 wuApHQCHaO/eGv2m/snfRZ3E+3MOY9lCQTIXOvRKFrcbgtUUEBLKb5OaCwVbc/ZuXr
	 ElqgLB9hZ0K8Bu1QWeTwQznvaCXcxXExxJONawuQuhelSSy303CUlmVDr4Es6VtZKH
	 RYBOog/QFPn1Q==
Date: Sun, 17 May 2026 21:59:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC V2 02/14] mm: Add read-write accessors for vm_page_prot
Message-ID: <agoP-QlSeVgISjCw@kernel.org>
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
 <20260513044547.4128549-3-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513044547.4128549-3-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_115915_038780_6D3250E1 
X-CRM114-Status: GOOD (  14.74  )
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

On Wed, May 13, 2026 at 10:15:35AM +0530, Anshuman Khandual wrote:
> Currently vma->vm_page_prot is safely read from and written to, without any
> locks with READ_ONCE() and WRITE_ONCE(). But with introduction of D128 page
> tables on arm64 platform, vm_page_prot grows to 128 bits which can't safely
> be handled with READ_ONCE() and WRITE_ONCE().
> 
> Add read and write accessors for vm_page_prot like pgprot_[read|write]()
> which any platform can override when required, although still defaulting as
> READ_ONCE() and WRITE_ONCE(), thus preserving the functionality for others.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> Changes in RFC V2:
> 
> - Dropped _once from pgprot_[read|write]() callbacks per Mike
> 
>  include/linux/pgtable.h | 14 ++++++++++++++
>  mm/huge_memory.c        |  4 ++--
>  mm/memory.c             |  2 +-
>  mm/migrate.c            |  2 +-
>  mm/mmap.c               |  2 +-
>  5 files changed, 19 insertions(+), 5 deletions(-)

-- 
Sincerely yours,
Mike.

