Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D0BC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 20:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69WM9SOk/3eNzipFXtI2xEOwiMHIyGtSPuEbz3PDrOU=; b=2iMVXOUibLK2FjP4ptYPERAByY
	zep+kR4tFh73AswtRpdYf5/5jGAgouKnh1WKa4WKSLWHxNP5Mvwl38I6DBLFk/LQUj8XNUWpvBdyU
	wJtN13ygPzBJpVeImSKnobXjCwDsFpWBZ1H2aZy+keYO/br3n+Ux5mIvNiDW2KABTmHzG6Fl78Ls5
	hZBzHc7AS3IFaXyiELUO+3KRBNxBiuBedrMxwv3P2cZWkEkuqwLcmWLU78FTaie6uRl7nFT28yjAT
	m2x4QyccwF6zWp6izHJzAGmKF32XIVPKb7C+nj/Y2MG2FvUicbX8HWwRhdtthXwo+kE31IxH6Z/nV
	IGu+XD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC2EW-00000008TxL-1oMO;
	Mon, 05 May 2025 20:16:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC18E-00000008Mqz-1RSw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 19:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1958761F1A;
	Mon,  5 May 2025 19:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C264C4CEE4;
	Mon,  5 May 2025 19:05:34 +0000 (UTC)
Date: Mon, 5 May 2025 20:05:31 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	morbo@google.com, justinstitt@google.com, broonie@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io, ardb@kernel.org,
	ryan.roberts@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64/cpufeature: annotate arm64_use_ng_mappings with
 ro_after_init to prevent wrong idmap generation
Message-ID: <aBkL-zUpbg7_gCEp@arm.com>
References: <20250502180412.3774883-1-yeoreum.yun@arm.com>
 <174626735218.2189871.10298017577558632540.b4-ty@arm.com>
 <aBYkGJmfWDZHBEzp@arm.com>
 <aBZ7P3/dUfSjB0oV@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBZ7P3/dUfSjB0oV@e129823.arm.com>
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

On Sat, May 03, 2025 at 09:23:27PM +0100, Yeoreum Yun wrote:
> Hi Catalin,
> 
> > On Sat, May 03, 2025 at 11:16:12AM +0100, Catalin Marinas wrote:
> > > On Fri, 02 May 2025 19:04:12 +0100, Yeoreum Yun wrote:
> > > > create_init_idmap() could be called before .bss section initialization
> > > > which is done in early_map_kernel().
> > > > Therefore, data/test_prot could be set incorrectly by PTE_MAYBE_NG macro.
> > > >
> > > > PTE_MAYBE_NG macro set NG bit according to value of "arm64_use_ng_mappings".
> > > > and this variable places in .bss section.
> > > >
> > > > [...]
> > >
> > > Applied to arm64 (for-next/fixes), with some slight tweaking of the
> > > comment, thanks!
> > >
> > > [1/1] arm64/cpufeature: annotate arm64_use_ng_mappings with ro_after_init to prevent wrong idmap generation
> > >       https://git.kernel.org/arm64/c/12657bcd1835
> >
> > I'm going to drop this for now. The kernel compiled with a clang 19.1.5
> > version I have around (Debian sid) fails to boot, gets stuck early on:
> >
> > $ clang --version
> > Debian clang version 19.1.5 (1)
> > Target: aarch64-unknown-linux-gnu
> > Thread model: posix
> > InstalledDir: /usr/lib/llvm-19/bin
> >
> > I didn't have time to investigate, disassemble etc. I'll have a look
> > next week.
> 
> Just for your information.
> When I see the debian package, clang 19.1.5-1 doesn't supply anymore:
>  - https://ftp.debian.org/debian/pool/main/l/llvm-toolchain-19/
> 
> and the default version for sid is below:
> 
> $ clang-19 --version
> Debian clang version 19.1.7 (3)
> Target: aarch64-unknown-linux-gnu
> Thread model: posix
> InstalledDir: /usr/lib/llvm-19/bin
> 
> When I tested with above version with arm64-linux's for-next/fixes
> including this patch. it works well.

It doesn't seem to be toolchain related. It fails with gcc as well from
Debian stable but you'd need some older CPU (even if emulated, e.g.
qemu). It fails with Cortex-A72 (guest on Raspberry Pi 4) but not
Neoverse-N2. Also changing the annotation from __ro_after_init to
__read_mostly also works.

I haven't debugged it yet but I wonder whether something wants to write
this variable after it was made read-only (well, I couldn't find any by
grep'ing the code, so it needs some step-by-step debugging).

-- 
Catalin

