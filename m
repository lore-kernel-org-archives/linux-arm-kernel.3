Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1F2C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 18:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tE/97qDLNInhrSv41O24hz6k5it7lrWx1B8nzMlNNY=; b=uD9DmFyzNzCWRaxgAp9WGsFzvE
	fH7fuPU9zdGCAeAJHs26r585vgkZPzQwZWzdcAMHCEv6FsIl0736SjxEFuXr/Z6wS+fARPA92ryTK
	qyozSlyTKvT4/HvWtjJydKTu8eQhv4Lf1UTDY2ujPBNrj2osG/86cCrj03/9bO2siJkYLXY8ZP6AB
	DA3t9ZAD+lzva4cSJMKgZBRIlSrUccM7ZXmlqbucZZhL4Ka8LRUn6MAoYSt0MDig5Pzxc4FIvx4Pe
	JOsru/+8xKkjLqGnpotX1wt4QKECpCBPSQmfNLuoGDvRoZluo6y3B3coKdnGcwZic80FHRONoy8Tf
	tzndxdgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DL8-000000053iS-2KaR;
	Tue, 08 Apr 2025 18:06:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Cvm-0000000509b-3htb;
	Tue, 08 Apr 2025 17:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5tE/97qDLNInhrSv41O24hz6k5it7lrWx1B8nzMlNNY=; b=KOx/f5UyipuUZDxVD5jHE+qtD2
	eu74DLpYFMC1h+xs/K+Yc3/IGk3Plq8aRYPYtEobrVYMeFJvoXpTOtoRRqrUJBUPtc/oY9cvtp/lD
	gKRIIV5K3Ay5rO73pxFfgDEaeM4l+kvMJBV/UxCy4LKTUvAXPVBmtE0chmbr9c2fpSmrm4V1I0bvt
	qVHlSwz6Tx3BeDuT4Zh7G7fi3wuMGEI1XTtoz+ESpsT2mM38529r1gpY1IKCfBTHF7RDItD5mxBJ7
	Wah2MxhHtGeY0sW+tFM+xPtnysJSl7HjGpXBzLxKQwN1mbRbcboMHLNFuI3tvLHMlCUzQg23htLGm
	jl0FA5PQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Cvg-00000000Iq7-25G6;
	Tue, 08 Apr 2025 17:40:08 +0000
Date: Tue, 8 Apr 2025 18:40:08 +0100
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
Message-ID: <Z_VfeFgrj23Oa0fX@casper.infradead.org>
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
 <20250408095222.860601-3-kevin.brodsky@arm.com>
 <409d2019-a409-4e97-a16f-6b345b0f5a38@intel.com>
 <Z_VQxyqkU8DV7QGy@casper.infradead.org>
 <9247436d-ae01-4eb8-bd5d-370b2fb2eebc@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9247436d-ae01-4eb8-bd5d-370b2fb2eebc@intel.com>
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

On Tue, Apr 08, 2025 at 09:54:42AM -0700, Dave Hansen wrote:
> On 4/8/25 09:37, Matthew Wilcox wrote:
> > On Tue, Apr 08, 2025 at 08:22:47AM -0700, Dave Hansen wrote:
> >> Are there any tests for folio_test_pgtable() at free_page() time? If we
> >> had that, it would make it less likely that another free_page() user
> >> could sneak in without calling the destructor.
> > It's hidden, but yes:
> > 
> > static inline bool page_expected_state(struct page *page,
> >                                         unsigned long check_flags)
> > {
> >         if (unlikely(atomic_read(&page->_mapcount) != -1))
> >                 return false;
> > 
> > PageTable uses page_type which aliases with mapcount, so this check
> > covers "PageTable is still set when the last refcount to it is put".
> 
> Huh, so shouldn't we have ended up in bad_page() for these, other than:
> 
>         pagetable_dtor(virt_to_ptdesc(pmd));
>         free_page((unsigned long)pmd);

I think at this point in Kevin's series, we don't call the ctor for
these pages, so we never set PageTable() on them.  I could be wrong;
as Kevin says, this is all very twisty and confusing with exceptions and
exceptions to exceptions.  This series should reduce the confusion.

