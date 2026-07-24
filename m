Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FBEC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 14:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqQq2Owm1obwOGEA9eotW/m1MLzuoJQfAmp5HBaVcd8=; b=wJSUgJk+L8OT6ko+sGpDT7cQk9
	JZSf/kqUkgkEK+9ASOoUx6uohSh2iEbZcQ5qPgGxHzovh7nBaFLeZ4o2Z77j9DqEwzJsafplpfsiF
	SdT2smRC0IBlYaEhB1IMBU/zBtopdpN/79WcStcsCvU8qK8P4fheFHIMTsrC6Loj2Y+SytcSqvD9s
	5LMLKyyO1e/TiMEZTzS1x/Y4yKo62B476Gofb7QbY4TtI+ygmE4Jmg+Vri0fufzjjycZblRmoqHjj
	qbYYnQBeofDB488cqjASHBOYzacWExrFvJHrsBAU8E+NVYAHkZ22qSQrdZ4xGewtl5EVA4X/Mx5Gx
	DjcFLfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGfD-0000000GXdO-3ZXD;
	Fri, 24 Jul 2026 14:14:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGfD-0000000GXd2-0rvY;
	Fri, 24 Jul 2026 14:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sqQq2Owm1obwOGEA9eotW/m1MLzuoJQfAmp5HBaVcd8=; b=b3FaE/15gGHycdVRSEH7kk8gXg
	ziED/cLtyY3G9U83si7GAn5Ol84senjYN1m4jLjO0UtBZIPJDA8wUFOchOARYzauL2VUm0k7nZpzN
	K07SPvCGF24b8xDHwesu9/XXFOC/xHyVYN0uSucmDm+HCF3RUQvxf7WqMkuuVnzM1qoNRsMjxDcj9
	uhiGquYmGmqrNAnYWz2mPt+rVVhLzVIZYA3vpLT1TxNs0sooD2gummR7OMhrl7SLQIfux9q544RXB
	8pK5bJXka726CjSXoWptNMLW0fFoYyvvcYKrkavP6fm72xKjr3YlkbnKKrHXHEs0HDQz3K+4Q60X8
	AYR/0EFw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGf7-00000003fU1-11AE;
	Fri, 24 Jul 2026 14:14:05 +0000
Date: Fri, 24 Jul 2026 15:14:05 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Pedro Falcato <pfalcato@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 3/5] mm/parisc: constify ptep_get() argument
Message-ID: <amNzLXuwflIZFKtI@casper.infradead.org>
References: <20260724102017.141532-1-pfalcato@suse.de>
 <20260724102017.141532-4-pfalcato@suse.de>
 <0fd713a8-e4ab-4c07-b36e-79dd138b4a86@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fd713a8-e4ab-4c07-b36e-79dd138b4a86@linux.dev>
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

On Fri, Jul 24, 2026 at 02:36:59PM +0100, Usama Arif wrote:
> 
> 
> On 24/07/2026 11:20, Pedro Falcato wrote:
> > ptep_get() does not need write access to the PTE.
> > 
> > Signed-off-by: Pedro Falcato <pfalcato@suse.de>
> > ---
> >  arch/parisc/include/asm/pgtable.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> hmm I think you might break build bisectibility if
> you separate out the patches, you should squash patch 3 and 4,
> with patch 1.

I don't see how this breaks bisectability.  Can you elaborate on what
you think would break?

