Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E972109C059
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 19:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nONzcx8W390CboKOO06vi2+gLPQClQqV0TNZoiEU8YQ=; b=QQ8MuuQ5wbV/2qrcQZNpp8dRZv
	bAffOR26j9VzXKQwJx8TAvsgCGkH0P51sqil7PG5NHMYM+tXEuNe2wiz0lbSeO8IX2BG3M9BBFqT8
	InGFxIaQyzhTFThkr2imd5bv2QmT0Y6PY9rN8h/A21fV4wlB+BODAzavKGGkSX/oOPlq3TcT26Lm7
	Uy3+dCcstKLSErah2ll07ZMg9H28JKlM6wRGFg28vgBGn7DzhWeCkEi6P3Qtmd97WZ+DUfZlGTemm
	7erfKMMC6vQmh2e1eQgkjixpzEzC4UVFgJ81+uxekmZnBGyy/H0CAtpniUz2IhjaJhwBS1gIzQWL5
	8kWpOOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5UN4-00000004BUg-2BzX;
	Wed, 25 Mar 2026 19:58:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5UN1-00000004BTr-0msN;
	Wed, 25 Mar 2026 19:58:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8107B43A4A;
	Wed, 25 Mar 2026 19:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D017C4CEF7;
	Wed, 25 Mar 2026 19:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774468705;
	bh=sejDKf3P8sESG5dibTCxwy1iyZIw53jwzdWcE7qNmpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ge5aalabCqZpp2QV5kqs/vYycoJuqkRoa8OBOAkbF709CENIyaMYwhDvGA5ZmhPZt
	 uwKdRiC3Cl5ZK3d5Un9FUbs9cKXxNKCY6gkKzPEXJOUXDaqwkeVNlPxvdAJwqG7YKW
	 lIYxvZcgfmDmflgygmhJEUImKL9vwBOfEzSiOFGHgfj3Klvy6w4NQMdlJgbR9hMqrG
	 H4++cneHOvL+Ujzn+CcEgc7qA05317D8Q9rBGN3xJLw1p1s1oXuLQklwmmcYGJXV2A
	 FM+3W2mqWxh2TwuA4BQio+NeDp+0q0ezZAW3u3LQYmFQINgb4M2bbIWWEdcCh46Isa
	 Z617FMBDSIq2Q==
Date: Wed, 25 Mar 2026 12:58:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Christoph Hellwig <hch@lst.de>,
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
Message-ID: <20260325195821.GD2305@quark>
References: <20260324064115.3217136-1-hch@lst.de>
 <20260324064115.3217136-3-hch@lst.de>
 <59d1d178-c141-4229-81e9-a6c23fa81f2f@zytor.com>
 <fa11e4d3-1c70-4fa7-9f03-8772c002be6a@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa11e4d3-1c70-4fa7-9f03-8772c002be6a@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_125827_266990_D32AF34C 
X-CRM114-Status: GOOD (  26.47  )
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

On Wed, Mar 25, 2026 at 09:13:16AM -0700, H. Peter Anvin wrote:
> On 2026-03-25 08:13, H. Peter Anvin wrote:
> > On 2026-03-23 23:40, Christoph Hellwig wrote:
> >> With the test code ported to kernel space, none of this is required.
> > 
> > I really *really* don't like this.
> > 
> > The ability of running in user space is really useful when it comes to
> > developing new code for new platforms, which happens often enough for this code.
> > 
> 
> That being said -- and I do say this as the original author of this code --
> this should be reduced to the maximum extent possible to a (minimal) set of
> #ifndef __KERNEL__, which should be localized as much as possible. The actual
> user space components, even such a thing as a simple #include, should be moved
> to a separate user space header.
> 
> But pretty please do leave the ability to debug the algorithms in user space.
> This is hard code to write and debug; it is not just about regression testing.

While I do like developing code in userspace as well, I've been doing it
less over time as the kernel's tests and benchmarks have been improved.
Running the KUnit tests is pretty straightforward and fast.

The issues with providing userspace build support in the tree are that:

- It has to be maintained.
- It's fundamentally a bit of a hack that is used only by developers
  (who always have the option of doing something locally that is
  tailored to the specific function they're working on)
- It diverts effort from the kernel's actual test and benchmark.

So while the faster iteration speed that userspace development enables
is definitely nice, I do think we should be cautious with committing to
maintain it in the kernel tree.  If it's causing problems for the
ongoing refactoring, dropping it for now seems reasonable to me.

I would suggest adding a benchmark to the KUnit test similar to the
crypto and CRC ones, though.

- Eric

