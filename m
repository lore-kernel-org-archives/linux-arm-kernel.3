Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F65C71150
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drjDvrrw4mJFoILdSf7D8mtW8M84pvZBDvAYOC3Fxds=; b=kyuygl193GiG6doGCtC4o2cmDI
	xi3QrfnGOsxf4FQ7OQ/usL2cjIT/NAGUTWad371zv7ih0ubhL73Sdb86qzQuRW+aPweKJRf7aY1SA
	vG9YkyMffajNsARoj4wKX1J6VLvUIdtGHNCHMpgtXH2PNDHWf1RJxQisTvLhmmPLLC35Zy0i8mr1A
	Tr5XWJz7Ba2Hm8wegCTZEkBJDBmTlXAznc4A7rYqU+0zXWn5ssVw2bseV7o5LjmRysMJlGskpOMJQ
	LF1CVewI6QLvew40nEXWvhcCSbfJCtOAov/GSnJr1j/L5d8iyWUKYG1B2Cm8pU68M1mcaDv6503Qs
	dSU0MZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq73-0000000EjIe-4AKO;
	Thu, 12 Jun 2025 22:09:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjjm-0000000Dlld-2ejm;
	Thu, 12 Jun 2025 15:21:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 622CB44805;
	Thu, 12 Jun 2025 15:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89ACBC4CEEA;
	Thu, 12 Jun 2025 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749741666;
	bh=wshbG/vQ6UX9QKzvPFllw/wGW4HRGOaCAzXepA4wqWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XaiYzB2Af7RXh0Twpx+T1OBL4I2ke8snzfvGviZYp+JvsI80bLXqv1VwQ7/bZvCAB
	 jizLTAUq6IHMdMIAuO0x67PXluwMf2ftZJNMOparAc6c+UshciGzVnPEpDNw/sVwkR
	 ZPBrUrcdppmPGKgeJQHc9UkW8StOvC7G/0cn8iK+2eVUWiLznnW74BA+2oAQ89O/Gy
	 2W0appmJNEt1/IrH8cz1kMuoc9pMa4Dl/JJPtYNlNMUDF4IZ+ek/ZgGGrjwzsj6Vzi
	 ROXQfNq1C0bDEhqoDOPCn6t75lY9Th9OUowpOVsmqGOVfe00p/d12aL3fiTFh/yqgA
	 fIK6za3tIWq5A==
Date: Thu, 12 Jun 2025 16:20:59 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Rik van Riel <riel@surriel.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v1] mm: Remove arch_flush_tlb_batched_pending() arch
 helper
Message-ID: <20250612152058.GE12912@willie-the-truck>
References: <20250609103132.447370-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609103132.447370-1-ryan.roberts@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_082106_688257_B7A21F94 
X-CRM114-Status: GOOD (  12.22  )
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

On Mon, Jun 09, 2025 at 11:31:30AM +0100, Ryan Roberts wrote:
> Since commit 4b634918384c ("arm64/mm: Close theoretical race where stale
> TLB entry remains valid"), all arches that use tlbbatch for reclaim
> (arm64, riscv, x86) implement arch_flush_tlb_batched_pending() with a
> flush_tlb_mm().
> 
> So let's simplify by removing the unnecessary abstraction and doing the
> flush_tlb_mm() directly in flush_tlb_batched_pending(). This effectively
> reverts commit db6c1f6f236d ("mm/tlbbatch: introduce
> arch_flush_tlb_batched_pending()").
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 11 -----------
>  arch/riscv/include/asm/tlbflush.h |  1 -
>  arch/riscv/mm/tlbflush.c          |  5 -----
>  arch/x86/include/asm/tlbflush.h   |  5 -----
>  mm/rmap.c                         |  2 +-
>  5 files changed, 1 insertion(+), 23 deletions(-)

Thank you, Ryan!

Acked-by: Will Deacon <will@kernel.org>

I assume this will go via akpm rather than the arch tree?

Will

