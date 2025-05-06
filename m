Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF66BC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qY1tWugvpY/LEhES813bVpXxEcFn3EhGrY/z1egeAfA=; b=uh7yilyX4hfg6XC9u/oyOESwAo
	9QJN9Son9khZgpJKyW1T0qNOs4xcZ4rHVPHxcjwnuIBS2jVtREtD/b26iTION85hZ/zgvFcHcA3JA
	dSIv1SSt4jqZ8ITipFYBUkgt/TKx8fS5wlTqoKU/xGECmxTPhD5ibrG11HRWCUIAU0H7jORSnhL8g
	JCf+FcXosJyJF4oWJ4+GVF6Gs1AhEIHeESqBA7lkXrtnQDvHyBIs/a872t2tiIuS4Fk/6Mzr/4CU2
	CRzPoMLysglm6csCOdC2JDjOWSCnuFIZ9OVUFmpUqc4kBas/Z2RLIz7LILXkf+brg4kXAVCwWuY6W
	0iOF49Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHLX-0000000BtJs-069A;
	Tue, 06 May 2025 12:24:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFMu-0000000BXmX-0GdY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:17:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EC4DAA4C495;
	Tue,  6 May 2025 10:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8494CC4CEE4;
	Tue,  6 May 2025 10:17:39 +0000 (UTC)
Date: Tue, 6 May 2025 11:17:37 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
	will@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	morbo@google.com, justinstitt@google.com, broonie@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64/cpufeature: annotate arm64_use_ng_mappings with
 ro_after_init to prevent wrong idmap generation
Message-ID: <aBnhwZKInFEiPkhz@arm.com>
References: <20250502180412.3774883-1-yeoreum.yun@arm.com>
 <174626735218.2189871.10298017577558632540.b4-ty@arm.com>
 <aBYkGJmfWDZHBEzp@arm.com>
 <aBZ7P3/dUfSjB0oV@e129823.arm.com>
 <aBkL-zUpbg7_gCEp@arm.com>
 <aBnDqvY5c6a3qQ4H@e129823.arm.com>
 <fbfded61-cfe2-4416-9098-ef39ef3e2b62@arm.com>
 <CAMj1kXFAYDeCgtPspQubkY688tcqwCMzCD+jEXb6Ea=9mBcdcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFAYDeCgtPspQubkY688tcqwCMzCD+jEXb6Ea=9mBcdcQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_031744_243061_BB5220E5 
X-CRM114-Status: GOOD (  32.70  )
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

On Tue, May 06, 2025 at 11:41:05AM +0200, Ard Biesheuvel wrote:
> On Tue, 6 May 2025 at 10:16, Ryan Roberts <ryan.roberts@arm.com> wrote:
> > On 06/05/2025 09:09, Yeoreum Yun wrote:
> > >> On Sat, May 03, 2025 at 09:23:27PM +0100, Yeoreum Yun wrote:
> > >>>> On Sat, May 03, 2025 at 11:16:12AM +0100, Catalin Marinas wrote:
> > >>>>> On Fri, 02 May 2025 19:04:12 +0100, Yeoreum Yun wrote:
> > >>>>>> create_init_idmap() could be called before .bss section initialization
> > >>>>>> which is done in early_map_kernel().
> > >>>>>> Therefore, data/test_prot could be set incorrectly by PTE_MAYBE_NG macro.
> > >>>>>>
> > >>>>>> PTE_MAYBE_NG macro set NG bit according to value of "arm64_use_ng_mappings".
> > >>>>>> and this variable places in .bss section.
> > >>>>>>
> > >>>>>> [...]
> > >>>>>
> > >>>>> Applied to arm64 (for-next/fixes), with some slight tweaking of the
> > >>>>> comment, thanks!
> > >>>>>
> > >>>>> [1/1] arm64/cpufeature: annotate arm64_use_ng_mappings with ro_after_init to prevent wrong idmap generation
> > >>>>>       https://git.kernel.org/arm64/c/12657bcd1835
> > >>>>
> > >>>> I'm going to drop this for now. The kernel compiled with a clang 19.1.5
> > >>>> version I have around (Debian sid) fails to boot, gets stuck early on:
> > >>>>
> > >>>> $ clang --version
> > >>>> Debian clang version 19.1.5 (1)
> > >>>> Target: aarch64-unknown-linux-gnu
> > >>>> Thread model: posix
> > >>>> InstalledDir: /usr/lib/llvm-19/bin
> > >>>>
> > >>>> I didn't have time to investigate, disassemble etc. I'll have a look
> > >>>> next week.
> > >>>
> > >>> Just for your information.
> > >>> When I see the debian package, clang 19.1.5-1 doesn't supply anymore:
> > >>>  - https://ftp.debian.org/debian/pool/main/l/llvm-toolchain-19/
> > >>>
> > >>> and the default version for sid is below:
> > >>>
> > >>> $ clang-19 --version
> > >>> Debian clang version 19.1.7 (3)
> > >>> Target: aarch64-unknown-linux-gnu
> > >>> Thread model: posix
> > >>> InstalledDir: /usr/lib/llvm-19/bin
> > >>>
> > >>> When I tested with above version with arm64-linux's for-next/fixes
> > >>> including this patch. it works well.
> > >>
> > >> It doesn't seem to be toolchain related. It fails with gcc as well from
> > >> Debian stable but you'd need some older CPU (even if emulated, e.g.
> > >> qemu). It fails with Cortex-A72 (guest on Raspberry Pi 4) but not
> > >> Neoverse-N2. Also changing the annotation from __ro_after_init to
> > >> __read_mostly also works.
> >
> > I think this is likely because __ro_after_init is also "ro before init" - i.e.
> > if you try to write to it in the PI code an exception is generated due to it
> > being mapped RO. Looks like early_map_kernel() is writiing to it.
> 
> Indeed.
> 
> > I've noticed a similar problem in the past and it would be nice to fix it so
> > that PI code maps __ro_after_init RW.
> 
> The issue is that the store occurs via the ID map, which only consists
> of one R-X and one RW- section. I'm not convinced that it's worth the
> hassle to relax this.
> 
> If moving the variable to .data works, then let's just do that.

Good to know there's no other more serious issue. I'll move this
variable to __read_mostly.

It seems to fail in early_map_kernel() if RANDOMIZE_BASE is enabled.

-- 
Catalin

