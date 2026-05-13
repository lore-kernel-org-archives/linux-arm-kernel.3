Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B41CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 05:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+doqOq5qahrITQTt42Vk0H3M5xERwzM2ccixxL3hjQo=; b=rq8gmEtJDdp9XDhLlKKjbisHRf
	y33KVVrJnnS0oaTK2BmBFvc76uI69Bm0dw2pYXfXzPVuOGlLIZ+yZcmdJvbxIl4kHJb3nTXmNJPY1
	GwVIuk3x83qpv9/AvUNf5mouy6iRySCMRTNooemXb1jwOCOrPXb4xTMbZHS0p1fDG1PcSfM/hCJoY
	BpmadS3R4pZQHczQlUHf+r14psEf+PExGei0wc9qzyvuhGSlbIcBzOB5cNJCqIrj5woJYcQSLdcU3
	jX0iBTxhiJI93+uBnFw9REZscqZdZfWkgZLLLG4r2JLH3tP4lWBmtkZVUX/p4TVd0wgDAyC2e9x28
	MWrbyEDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2Rm-00000001MhT-26fX;
	Wed, 13 May 2026 05:47:54 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2Ri-00000001MgA-0qbk;
	Wed, 13 May 2026 05:47:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id B404568B05; Wed, 13 May 2026 07:47:42 +0200 (CEST)
Date: Wed, 13 May 2026 07:47:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Sterba <dsterba@suse.cz>
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
	"H. Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: Re: [PATCH 01/19] btrfs: require at least 4 devices for RAID 6
Message-ID: <20260513054742.GA1018@lst.de>
References: <20260512052230.2947683-1-hch@lst.de> <20260512052230.2947683-2-hch@lst.de> <20260512114231.GG2558453@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512114231.GG2558453@suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_224750_380222_6E63D641 
X-CRM114-Status: GOOD (  22.48  )
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

On Tue, May 12, 2026 at 01:42:31PM +0200, David Sterba wrote:
> On Tue, May 12, 2026 at 07:20:41AM +0200, Christoph Hellwig wrote:
> > While the RAID6 algorithm could in theory support 3 devices by just
> > copying the data disk to the two parity disks, this version is not only
> > useless because it is a suboptimal version of 3-way mirroring, but also
> > broken with various crashes and incorrect parity generation in various
> > architecture-optimized implementations.  Disallow it similar to mdraid
> > which requires at least 4 devices for RAID 6.
> > 
> > Fixes: 53b381b3abeb ("Btrfs: RAID5 and RAID6")
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> This patch should have been sent separately as it has user visible
> impact and can potentially break some setups.

It _is_ sent out separate.

> The degenerate modes of
> raid0, 5, or 6 are explicit as a possible middle step when converting
> profiles.  We can use a fallback implementation for this case if the
> accelerated implementations cannot do it.

This is not about a degenerated mode.  For a degenerated RAID 6, parity
generation uses the RAID 5 XOR routines as the second parity will be
missing.  This is about generating two parities for a single data disk,
which must be explicitly selected.

