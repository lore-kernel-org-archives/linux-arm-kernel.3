Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B716C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptcf15T7N0yk5xmOn3kxF9EB3V59MLenGb73Dr3nZMA=; b=RWywrOE9B2pFnSW71Qau5HD2us
	rVllnNbtk5m1khOQrdkkItzOPOteFHZIJtpTYoCW0p302bcf+xsxp+9VdA2WA+t7b6M1uolLOtrjv
	LeRmLSgcKhgFZFzk/udBDT9ZkSctUmhJCzzo8w1I1wxpqAw3v3+IJIGD7PuAlBNBhxOoOaQ7WdMq2
	r3Zzdr9WeuYELFxi11DBAYQeCudbLAqSVX983V6XKUJBy3R4yrSLvBABZhzbexVQFVyKkGUXX+ru/
	C5pGrvZyybN3CUM+H+cJKmZrPVUW3NX1q6OiJ59G5AAxuecOBglbTWPHQ51aLX8lGZHgm397HXldB
	vx7karbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHat-0000000BwsK-30SY;
	Tue, 06 May 2025 12:40:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFXw-0000000BZad-3rAP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:29:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 674EF44A2E;
	Tue,  6 May 2025 10:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1012FC4CEE4;
	Tue,  6 May 2025 10:29:04 +0000 (UTC)
Date: Tue, 6 May 2025 11:29:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
	will@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	morbo@google.com, justinstitt@google.com, broonie@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64/cpufeature: annotate arm64_use_ng_mappings with
 ro_after_init to prevent wrong idmap generation
Message-ID: <aBnkbkVMEAQsYIpJ@arm.com>
References: <20250502180412.3774883-1-yeoreum.yun@arm.com>
 <174626735218.2189871.10298017577558632540.b4-ty@arm.com>
 <aBYkGJmfWDZHBEzp@arm.com>
 <aBZ7P3/dUfSjB0oV@e129823.arm.com>
 <aBkL-zUpbg7_gCEp@arm.com>
 <aBnDqvY5c6a3qQ4H@e129823.arm.com>
 <fbfded61-cfe2-4416-9098-ef39ef3e2b62@arm.com>
 <CAMj1kXFAYDeCgtPspQubkY688tcqwCMzCD+jEXb6Ea=9mBcdcQ@mail.gmail.com>
 <aBnhwZKInFEiPkhz@arm.com>
 <3cfcd0c5-79a2-45de-8497-fb95ef834dc1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cfcd0c5-79a2-45de-8497-fb95ef834dc1@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_032909_005930_7CDED4B9 
X-CRM114-Status: GOOD (  33.36  )
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

On Tue, May 06, 2025 at 11:22:47AM +0100, Ryan Roberts wrote:
> On 06/05/2025 11:17, Catalin Marinas wrote:
> > On Tue, May 06, 2025 at 11:41:05AM +0200, Ard Biesheuvel wrote:
> >> On Tue, 6 May 2025 at 10:16, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>> On 06/05/2025 09:09, Yeoreum Yun wrote:
> >>>>> On Sat, May 03, 2025 at 09:23:27PM +0100, Yeoreum Yun wrote:
> >>>>>>> On Sat, May 03, 2025 at 11:16:12AM +0100, Catalin Marinas wrote:
> >>>>>>>> On Fri, 02 May 2025 19:04:12 +0100, Yeoreum Yun wrote:
> >>>>>>>>> create_init_idmap() could be called before .bss section initialization
> >>>>>>>>> which is done in early_map_kernel().
> >>>>>>>>> Therefore, data/test_prot could be set incorrectly by PTE_MAYBE_NG macro.
> >>>>>>>>>
> >>>>>>>>> PTE_MAYBE_NG macro set NG bit according to value of "arm64_use_ng_mappings".
> >>>>>>>>> and this variable places in .bss section.
> >>>>>>>>>
> >>>>>>>>> [...]
> >>>>>>>>
> >>>>>>>> Applied to arm64 (for-next/fixes), with some slight tweaking of the
> >>>>>>>> comment, thanks!
> >>>>>>>>
> >>>>>>>> [1/1] arm64/cpufeature: annotate arm64_use_ng_mappings with ro_after_init to prevent wrong idmap generation
> >>>>>>>>       https://git.kernel.org/arm64/c/12657bcd1835
> >>>>>>>
> >>>>>>> I'm going to drop this for now. The kernel compiled with a clang 19.1.5
> >>>>>>> version I have around (Debian sid) fails to boot, gets stuck early on:
> >>>>>>>
> >>>>>>> $ clang --version
> >>>>>>> Debian clang version 19.1.5 (1)
> >>>>>>> Target: aarch64-unknown-linux-gnu
> >>>>>>> Thread model: posix
> >>>>>>> InstalledDir: /usr/lib/llvm-19/bin
> >>>>>>>
> >>>>>>> I didn't have time to investigate, disassemble etc. I'll have a look
> >>>>>>> next week.
> >>>>>>
> >>>>>> Just for your information.
> >>>>>> When I see the debian package, clang 19.1.5-1 doesn't supply anymore:
> >>>>>>  - https://ftp.debian.org/debian/pool/main/l/llvm-toolchain-19/
> >>>>>>
> >>>>>> and the default version for sid is below:
> >>>>>>
> >>>>>> $ clang-19 --version
> >>>>>> Debian clang version 19.1.7 (3)
> >>>>>> Target: aarch64-unknown-linux-gnu
> >>>>>> Thread model: posix
> >>>>>> InstalledDir: /usr/lib/llvm-19/bin
> >>>>>>
> >>>>>> When I tested with above version with arm64-linux's for-next/fixes
> >>>>>> including this patch. it works well.
> >>>>>
> >>>>> It doesn't seem to be toolchain related. It fails with gcc as well from
> >>>>> Debian stable but you'd need some older CPU (even if emulated, e.g.
> >>>>> qemu). It fails with Cortex-A72 (guest on Raspberry Pi 4) but not
> >>>>> Neoverse-N2. Also changing the annotation from __ro_after_init to
> >>>>> __read_mostly also works.
> >>>
> >>> I think this is likely because __ro_after_init is also "ro before init" - i.e.
> >>> if you try to write to it in the PI code an exception is generated due to it
> >>> being mapped RO. Looks like early_map_kernel() is writiing to it.
> >>
> >> Indeed.
> >>
> >>> I've noticed a similar problem in the past and it would be nice to fix it so
> >>> that PI code maps __ro_after_init RW.
> >>
> >> The issue is that the store occurs via the ID map, which only consists
> >> of one R-X and one RW- section. I'm not convinced that it's worth the
> >> hassle to relax this.
> >>
> >> If moving the variable to .data works, then let's just do that.
> > 
> > Good to know there's no other more serious issue. I'll move this
> > variable to __read_mostly.
> > 
> > It seems to fail in early_map_kernel() if RANDOMIZE_BASE is enabled.
> 
> Ahh that explains why Yeoreum Yun can't see the issue:
> 
> 	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
> 		u64 kaslr_seed = kaslr_early_init(fdt, chosen);
> 
> 		if (kaslr_seed && kaslr_requires_kpti())
> 			arm64_use_ng_mappings = true;
> 
> 		kaslr_offset |= kaslr_seed & ~(MIN_KIMG_ALIGN - 1);
> 	}

Yeah, you may need this as well for qemu:

	-object rng-random,filename=/dev/urandom,id=rng0 \
	-device virtio-rng-pci,rng=rng0 \

BTW, some architectures have RO_DATA immediately after _sdata but for us
it messes up some of the contig mappings, so the safest is to move the
variable to the .data section.

-- 
Catalin

