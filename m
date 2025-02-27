Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2B6C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muEbYcOtgESIdK/ueApirxv++T+6f8ymycqJPO0wsZk=; b=CRy5dw/O5RktPHd8rGcjgDD6BY
	koUAZ+fMJvszl+kRcvsB9NoHGj4ey0tn+IGR1dEED8WVAworrI+AWdppGpGLf+KhY8Iw3edezVZje
	+BVJRUQTEZFnrbEvqtMgJ8M6txvf9SOxb4kRiNGZiWtZRbJ2TV5MjktEDac/yi44iW6Nnf/c0gzun
	1cr4nN/c8EcotyE9AYcHS7Cb7xs3tYoD8zAtEwpGrli/hsZzbK5ZPCMPU+/xT/fxa1edszR3F2ad8
	hk91+Bq08PO73KTgqDCvvmUVhG5Pd0yHGkgVk8quO+99ByL45gLJmQBhuMCsv5g/XQki/hUwcMO5F
	TT4PMZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjmq-00000008eDk-22r9;
	Thu, 27 Feb 2025 19:43:12 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tniy2-00000008MzJ-0wRr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D9C061F52;
	Thu, 27 Feb 2025 18:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A358EC4CEE5;
	Thu, 27 Feb 2025 18:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740682241;
	bh=11uRd/PwHiz7z8o9Mh2WCAHrRhiDeHVGyk7lTrv19SE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uhUuAJsM1Rw0k7NFX05vRIoNGFUZuuDZoMkSNz8+BkYNh2LZZyXGXOM/wRi+ixU/v
	 gK+n1YqCmnHBw3Hs8KO+9RNifwKlBIX/vnUFpfRdV2r1XQKIdLmcjasRZs2SWIkQsN
	 /lcTqksiNaLZD5YEr6TcDM9I023ot9TKBvOdyWOk+vo2oC9bjfX/Z2gcRhyROsrFCv
	 glOu2bt09L2xuSdz+8sVMvTl38mihfBrV9R2ccvbpNB6KyUxw0xO72L0YPaGn4hTkS
	 5H1opyUk2ty3Ci2YDXCqUqssDSTaZVdFhn9Bu129hp60mSC3mwxP5UgChUTvLRliA7
	 3huzQdriFgFPQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Fixes for hugetlb on arm64
Date: Thu, 27 Feb 2025 18:50:28 +0000
Message-Id: <174067805978.3571552.16163970723385377562.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250226120656.2400136-1-ryan.roberts@arm.com>
References: <20250226120656.2400136-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 26 Feb 2025 12:06:50 +0000, Ryan Roberts wrote:
> This series contains some fixes for hugetlb on arm64. It turns out that I will
> need to rework the companion performance improvement series a bit and as a
> result won't be relying on the purely mm fix that was patch 4 in v2. So I've
> dropped that patch and will send it to mm separately.
> 
> I think this should be ready for merge now.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/3] mm: hugetlb: Add huge page size param to huge_ptep_get_and_clear()
      https://git.kernel.org/arm64/c/02410ac72ac3
[2/3] arm64: hugetlb: Fix huge_ptep_get_and_clear() for non-present ptes
      https://git.kernel.org/arm64/c/49c87f767774
[3/3] arm64: hugetlb: Fix flush_hugetlb_tlb_range() invalidation level
      https://git.kernel.org/arm64/c/eed6bfa8b282

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

