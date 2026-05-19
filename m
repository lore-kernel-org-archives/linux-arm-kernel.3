Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C094CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqRGIKoiXWbmeXBHEq1fvqzZYieolD7YjRd/s5Lkrag=; b=qWwxCvewmG/FQmet/2GDPnVR7a
	db1o8Ru6Y84ULRutSC4aPJy60g0oPdsmCSDvIev1XpACp1Nh9VUx7YWz/BdhMjVy5bk+vIbQjg+p6
	pPjGJqBa7Vb6yQzeT+5F82OSaDZPDmGOUMJ64fTlIrW6LgoOIGs71W7HJGHpFdT8JrGcbPs1J+Nc4
	JeNJN6MD9sjNeA6A745eJ9FP/otrqFatJMB5bEpU6wbZreWgeOCDdXfFtl/oCST90XrFnU32zSG/X
	ntWlD4sdMukCP54G1xP4iBfxsWJtbLgogjG1Ui/VoQicWQXjwgm6p1aCO+rsxrruAX9VlbVKfCkOa
	zCTuK3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFks-00000000f2j-2Jmu;
	Tue, 19 May 2026 08:24:46 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFkp-00000000f17-3VcY;
	Tue, 19 May 2026 08:24:45 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id C9A0568D0D; Tue, 19 May 2026 10:24:33 +0200 (CEST)
Date: Tue, 19 May 2026 10:24:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
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
Subject: Re: cleanup the RAID6 P/Q library v3
Message-ID: <20260519082432.GA14956@lst.de>
References: <20260518051804.462141-1-hch@lst.de> <20260518141205.c100f76eec5f58e78bbbf7af@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518141205.c100f76eec5f58e78bbbf7af@linux-foundation.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_012444_154080_BF6AFAAE 
X-CRM114-Status: GOOD (  17.77  )
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

On Mon, May 18, 2026 at 02:12:05PM -0700, Andrew Morton wrote:
> Cool, I'll add this to mm.git's mm-nonmm-unstable branch for some
> linux-next testing.
> 
> AI review found quite a lot to talk about:
> 	https://sashiko.dev/#/patchset/20260518051804.462141-1-hch@lst.de

Not a lot of it is very useful, though:

raid6: turn the userspace test harness into a kunit test

 - complains about basically adding need_resched, which we've decided
   we won't do now that we have lazy preempt.  This is probably going
   to come up in lots of places because of the old training data

raid6: use named initializers for struct raid6_calls

 - whining about keeping totally pointless comments
 
raid6: warn when using less than four devices

 - complains about warning for btrfs which is clearly documented as the
   outcome in the commit log
 - and also complaining that the enforcement isn't hard enough, but the
   WARN_ON is the best we can do here

raid6: rework registration of optimized algorithms

 - less registration causing less kunit coverage:  that's intentional
   as it keeps testing time down and similar to other arch optimized
   tests in crc and crypto code.  It also doesn't really reduce
   coverage as before this series there was none.

raid6: use static_call for gen_syndrom and xor_syndrom

 - doesn't seem to know that bool fails when an initcall fails

raid6_kunit: use KUNIT_CASE_PARAM

 - whining about the code style.  I don't really like it either,
   but the kunit case stuff is a mess

There are a few somewhat useful things, though.

raid6: hide internals

 - yes, the -I is duplicate and should be fixed

raid6: rework registration of optimized algorithms

 - avx2 instead of avx512 is probably the right thing for no
   benchmarking, but if it was intentional (it wasn't), that should
   be document.  So I'll just switch back to the previous version to
   keep the state of the art

