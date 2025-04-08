Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E1FC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 16:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8c5kGuEjzUrixCQz8SJfmiMTtSSZ6M/pup07QMbIZo=; b=GP6us4E919p8Nfny3DpqtQWZbO
	lDgPS3dZwYIqz8qDKDDbqaU7yE5dNrJtnD9krx0h+Ko2YKPwYF9MHs7OQEXt1s7aKXxElVrBhFO2K
	aZlClUha5IivHd2Piti4Zs9U8J1coEFj9Mz3V8QQlm9oLaKyJxXlbEdKbTtDJzO7/ODtI2UHTRQ/h
	7+nLALDtJU7H8SIvqJfwZNLuJ26c0g/4Fs3kP5JMRAB6NDDTTXYdxgGugfDtJhnACui0gw/fCJNxL
	RKZm33AhwOh6hoEqAMiFofFp8eBT1Y/IYTA+k1iBxyc/NiVj3CQV1BxE/hfhMWeU8TNGmmnbYXDfs
	M7aqim3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BzZ-00000004q4o-0CWC;
	Tue, 08 Apr 2025 16:40:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Bxn-00000004pni-3DJB;
	Tue, 08 Apr 2025 16:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=q8c5kGuEjzUrixCQz8SJfmiMTtSSZ6M/pup07QMbIZo=; b=t9QSCPFKWRX+IEXLLTG7nFPvtv
	qDrwtyW8ndHz9ADtdBvDwK9R1/b7GawfLb9Ry+HoJokPfkHZsWEY8kmm+jpBlq6UtOttGJYiUw7RR
	YQcU45qxxKziWZ2wo5RrV8K7L++OSyA0Pg6W4VCgKFlOrXroMKnLYbVxn6C0iXMlaNBqc55NZ+7ry
	DAQLC5cv7ugIBp7R5NUNcrnkv6P4QXcnyZrwaQNIPaFmW3FgZted7FwYDS5UBdqKAJDVf5IQeUvr3
	Gezyf9Lp+/2LMaVmh9DL4kYQDtD4GOp47bbpeRMV5gu/qNM87gpbm6R4yQ33Abl/XS2ElP+tzf6AO
	XyawnGVw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Bx2-0000000GpOB-0hye;
	Tue, 08 Apr 2025 16:37:28 +0000
Date: Tue, 8 Apr 2025 17:37:27 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 02/12] x86: pgtable: Always use pte_free_kernel()
Message-ID: <Z_VQxyqkU8DV7QGy@casper.infradead.org>
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
 <20250408095222.860601-3-kevin.brodsky@arm.com>
 <409d2019-a409-4e97-a16f-6b345b0f5a38@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <409d2019-a409-4e97-a16f-6b345b0f5a38@intel.com>
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

On Tue, Apr 08, 2025 at 08:22:47AM -0700, Dave Hansen wrote:
> Are there any tests for folio_test_pgtable() at free_page() time? If we
> had that, it would make it less likely that another free_page() user
> could sneak in without calling the destructor.

It's hidden, but yes:

static inline bool page_expected_state(struct page *page,
                                        unsigned long check_flags)
{
        if (unlikely(atomic_read(&page->_mapcount) != -1))
                return false;

PageTable uses page_type which aliases with mapcount, so this check
covers "PageTable is still set when the last refcount to it is put".

I don't think we really use the page refcount when allocating/freeing
page tables.  Anyone want to try switching it over to using
alloc_frozen_pages() / free_frozen_pages()?  Might need to move that API
out of mm/internal.h ...

