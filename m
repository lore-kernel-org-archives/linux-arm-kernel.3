Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A48109E54B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 05:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0Mm08aIFiF5zpq4bYNO01/wtBzLMMKeGfZKZE1A0Y8=; b=lRjDUGH3NWezuKVaAVbWkJyPpN
	ZxJ+Ju7C7nNjASMo+bGGeHoVtBZOyE0c8HB/4gBIh4AdRxE3YZZRmV/5DTyLLdKZRSCzrOtwdpeCX
	Gp29+QmufHVKeHCHyDn/0kYlhR0v3ZKwAY1Ojx8kzDpgKHBS26dizLSl3WD55YBOY/LBB0CPuzeeR
	EeI9yXVnP6aTba6F7OXMHoEH6fuHhG8/ac4t5NYJiT+EA92u+pTOokhJ9VxJAXBQLPjBi57j19RyG
	Q3Ic+Jcr8g42SKDQDSIUnZS/o4MDs5yPni91EQsz7ZjIUm9YMBLazv3VcpJv5paSKHUY3UYAnW8XU
	lxW8tWtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dE3-00000004jmJ-02ay;
	Thu, 26 Mar 2026 05:25:47 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dE0-00000004jls-2qfX;
	Thu, 26 Mar 2026 05:25:46 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2636068BEB; Thu, 26 Mar 2026 06:25:38 +0100 (CET)
Date: Thu, 26 Mar 2026 06:25:37 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Christoph Hellwig <hch@lst.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@alb-78bjiv52429oh8qptp.cn-shenzhen.alb.aliyuncs.com>,
	Li Nan <linan122@huawei.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: Re: [PATCH 02/17] raid6: remove __KERNEL__ ifdefs
Message-ID: <20260326052537.GA23044@lst.de>
References: <20260324064115.3217136-1-hch@lst.de> <20260324064115.3217136-3-hch@lst.de> <59d1d178-c141-4229-81e9-a6c23fa81f2f@zytor.com> <fa11e4d3-1c70-4fa7-9f03-8772c002be6a@zytor.com> <20260325195821.GD2305@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325195821.GD2305@quark>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_222545_012096_DC19DD96 
X-CRM114-Status: GOOD (  28.86  )
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

On Wed, Mar 25, 2026 at 12:58:21PM -0700, Eric Biggers wrote:
> While I do like developing code in userspace as well, I've been doing it
> less over time as the kernel's tests and benchmarks have been improved.
> Running the KUnit tests is pretty straightforward and fast.

Yes.  I would have totally subscribed to hpa's position when he initially
wrote the code, but 20+ years later things look different.  In fact these
days I often write code intended for userspace in the kernel first to
benefit from lockdep primarily, but also other checkers that are in theory
available in userspace but as easy to use.  Now of course lockdep doesn't
really matter for the algorithms here, but the rest still stands.

I also find the point of developing new code for new platforms
interesting: in this decade we had two new platforms added: loongarch
and riscv and all other changes were to the wiring up and not the
algorithms.  And of those riscv only had the compile in userspace
support added 8 month after the algorithm, so it doesn't really look
like development was aided by it.  We also plan to add new optimized
code, and getting the library in shape and dropping the hard to
maintain userspace code is actually prep work for making that not
painful.

> 
> The issues with providing userspace build support in the tree are that:
> 
> - It has to be maintained.
> - It's fundamentally a bit of a hack that is used only by developers
>   (who always have the option of doing something locally that is
>   tailored to the specific function they're working on)
> - It diverts effort from the kernel's actual test and benchmark.
> 
> So while the faster iteration speed that userspace development enables
> is definitely nice, I do think we should be cautious with committing to
> maintain it in the kernel tree.  If it's causing problems for the
> ongoing refactoring, dropping it for now seems reasonable to me.
> 
> I would suggest adding a benchmark to the KUnit test similar to the
> crypto and CRC ones, though.

The code already has a benchmark used for runtime selection, although
that could be improved on and run for bigger data sets from kunit.


