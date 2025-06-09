Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA6DC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 19:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8A4kfNqCpnvhSbBzTBjtE+VJ2L30xs4Ao8ewlm8dEvs=; b=HNEApPXSPXXLqtuGSa+uB2OEeu
	+t3tTxtSGreN6ALa7iTYp1aKYmle9XUJCIucSBnuTfjIBgJ9aqXrQmwl2zpsLu9eOT4y9209GG6TH
	jw8Umzq4PEg1akPd4hAauTt1UjuJM/Vy2khT63gkhWnet8MnxqRX+uwJvWBWtuFGJ171yGJ1ZWDP4
	26iR1nsYAztRE8193bxrzbpVJ2rP/FPI3fZtDlMLwCrZYxddDqJT7Ymkp1svCT8eFJDFwrJ16pbW5
	KN/yLZYq2LEHPdEVDMTpCFTVDiD0dkejF0KNR9ZS6cuKgDWn7WDQyDzZSHX0NymWFklKuDJdLMtES
	BQNSeNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOiQH-0000000547t-0VLl;
	Mon, 09 Jun 2025 19:44:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOheA-00000004xU9-1uMV;
	Mon, 09 Jun 2025 18:55:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 290694ACCA;
	Mon,  9 Jun 2025 18:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDEAC4CEEF;
	Mon,  9 Jun 2025 18:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749495302;
	bh=i03d00nCfUWfOdFAfB3hz6pL/gDpm+GCWlrY8GYnNSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cOGXtZ0bxE5c/cKVjIahkTcrKCRAsE2Gfxn3UIhlFlFiZLaC+zKdF7VWxfKm8/ETS
	 6AhGs0umiRMCJ5JgdBhNOOkRxSsFWAtxF3SJIcO4BKZGFJs1ZQtGYfS9ZJ9KjnFtXu
	 CoUuDzdDeoQNA3IJviIlNiJi7ydg2ehdcQ5OXBzI0xl+XsUGv/gmofveqW1cZVJlxj
	 7S5NNv/e7xF0C/H29trUyZ+4svuZFkbjIOhn5nXwrlL711gYmP+gm6Ewk+tz2CReoY
	 NFWzzRmLR5sYfJufJHFK1j4djDnBCF+UiHFg8rnM/mFlrhQ4MNaEJcQxnaEuTEhFf3
	 PK9kqt1NEZKGw==
Date: Mon, 9 Jun 2025 11:54:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <20250609185439.GB1255@sol>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <aEaP-A21IB4ufbZT@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEaP-A21IB4ufbZT@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_115502_536876_51DEAE07 
X-CRM114-Status: GOOD (  33.48  )
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

On Mon, Jun 09, 2025 at 09:40:40AM +0200, Ingo Molnar wrote:
> 
> * Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > This series is also available at:
> > 
> >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git lib-crc-arch-v2
> > 
> > This series improves how lib/crc supports arch-optimized code.  First,
> > instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
> > will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> > crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> > functions (e.g. crc32c_base()) will now be part of a single module for
> > each CRC type, allowing better inlining and dead code elimination.  The
> > second change is made possible by the first.
> > 
> > As an example, consider CONFIG_CRC32=m on x86.  We'll now have just
> > crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> > were already coupled together and always both got loaded together via
> > direct symbol dependency, so the separation provided no benefit.
> > 
> > Note: later I'd like to apply the same design to lib/crypto/ too, where
> > often the API functions are out-of-line so this will work even better.
> > In those cases, for each algorithm we currently have 3 modules all
> > coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> > sha256-x86.ko.  We should have just one, inline things properly, and
> > rely on the compiler's dead code elimination to decide the inclusion of
> > the generic code instead of manually setting it via kconfig.
> > 
> > Having arch-specific code outside arch/ was somewhat controversial when
> > Zinc proposed it back in 2018.  But I don't think the concerns are
> > warranted.  It's better from a technical perspective, as it enables the
> > improvements mentioned above.  This model is already successfully used
> > in other places in the kernel such as lib/raid6/.  The community of each
> > architecture still remains free to work on the code, even if it's not in
> > arch/.  At the time there was also a desire to put the library code in
> > the same files as the old-school crypto API, but that was a mistake; now
> > that the library is separate, that's no longer a constraint either.
> > 
> > Changed in v2:
> >    - Fixed build warning on architectures without any optimized CRC code
> >    - Fixed build warning in sparc/crc32.h by removing pr_fmt
> >    - Moved fallback definitions of crc32*_arch back into arch files
> >    - Remove ARCH_HAS_CRC* symbols at end of series instead of beginning,
> >      so that they're not removed until they're no longer being selected
> >    - Slightly improved some commit messages
> >    - Rebased onto other pending lib/crc changes
> > 
> > Eric Biggers (12):
> >   lib/crc: move files into lib/crc/
> >   lib/crc: prepare for arch-optimized code in subdirs of lib/crc/
> >   lib/crc/arm: migrate arm-optimized CRC code into lib/crc/
> >   lib/crc/arm64: migrate arm64-optimized CRC code into lib/crc/
> >   lib/crc/loongarch: migrate loongarch-optimized CRC code into lib/crc/
> >   lib/crc/mips: migrate mips-optimized CRC code into lib/crc/
> >   lib/crc/powerpc: migrate powerpc-optimized CRC code into lib/crc/
> >   lib/crc/riscv: migrate riscv-optimized CRC code into lib/crc/
> >   lib/crc/s390: migrate s390-optimized CRC code into lib/crc/
> >   lib/crc/sparc: migrate sparc-optimized CRC code into lib/crc/
> >   lib/crc/x86: migrate x86-optimized CRC code into lib/crc/
> >   lib/crc: remove ARCH_HAS_* kconfig symbols
> 
> For the movement of the x86 bits:
> 
>   Acked-by: Ingo Molnar <mingo@kernel.org>
> 
> >  rename {arch/s390/lib => lib/crc/s390}/crc32be-vx.c (100%)
> >  rename {arch/s390/lib => lib/crc/s390}/crc32le-vx.c (100%)
> >  rename arch/sparc/lib/crc32.c => lib/crc/sparc/crc32.h (60%)
> >  rename {arch/sparc/lib => lib/crc/sparc}/crc32c_asm.S (100%)
> >  create mode 100644 lib/crc/tests/Makefile
> >  rename lib/{ => crc}/tests/crc_kunit.c (100%)
> >  rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-consts.h (100%)
> >  rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-template.S (100%)
> >  rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-template.h (100%)
> >  rename arch/x86/lib/crc-t10dif.c => lib/crc/x86/crc-t10dif.h (56%)
> >  rename {arch/x86/lib => lib/crc/x86}/crc16-msb-pclmul.S (100%)
> >  rename {arch/x86/lib => lib/crc/x86}/crc32-pclmul.S (100%)
> 
> One small namespace suggestion: wouldn't it be better to move the arch 
> support code to lib/crc/arch/, instead of lib/crc/? That way any 
> generic code will stand out better and architecture directories don't 
> crowd out what is supposed to be generic code.

I don't think that yet another level of directories would provide much value
here.  The only non-arch subdirectory of lib/crc/ is "tests", so it's not like
there are a lot of subdirectories that could be confused with arch names.

- Eric

