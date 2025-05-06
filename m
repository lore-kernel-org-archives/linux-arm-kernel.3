Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E17C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+h6p1wpnnCDh2dOFaWJ4cKzFK/0rKmd/zwxGrfPtyh4=; b=HMNXBdNtdzdMOLkh+XKrdJr5Dy
	hfKXAhVeDpU/URvza8u25EdCZPV9Cem2m+HeIiD97fdnNU2Oque545OWFW4utmfa1qPPEPUieGKJG
	oj3pJVwQckhuAqfpW0a6Ix6ZEv9OXQiEQXBR+kGWrL6DTwspHSiZdbnpfSf0oRGpyfO2q0ICAnzEs
	IQYllf0jZMFAfKduQPYb+V0rODp4LRGMjEfkNq1H1FG/qqUuLAEbOGetntjdLgbtOr0D52W9wtYYL
	PQVD8DoGjf2ZouU0sQvhX9McTCKG3dETwMXj9A6f5o/WIHhK2Y80noVzS8dZ5cKch62IZWfq1qe2P
	a59Q2RQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIBC-0000000C4Lf-23bs;
	Tue, 06 May 2025 13:17:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFrX-0000000Bck9-1lfR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:49:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 39DDAA4C524;
	Tue,  6 May 2025 10:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06F1C4CEE4;
	Tue,  6 May 2025 10:49:18 +0000 (UTC)
Date: Tue, 6 May 2025 11:49:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	morbo@google.com, justinstitt@google.com, broonie@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io, ardb@kernel.org,
	ryan.roberts@arm.com, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64/cpufeature: annotate arm64_use_ng_mappings with
 ro_after_init to prevent wrong idmap generation
Message-ID: <aBnpLP1b4Wl3krg8@arm.com>
References: <20250502180412.3774883-1-yeoreum.yun@arm.com>
 <174626735218.2189871.10298017577558632540.b4-ty@arm.com>
 <aBYkGJmfWDZHBEzp@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBYkGJmfWDZHBEzp@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_034923_524249_E530F2D1 
X-CRM114-Status: GOOD (  16.12  )
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

On Sat, May 03, 2025 at 03:11:36PM +0100, Catalin Marinas wrote:
> On Sat, May 03, 2025 at 11:16:12AM +0100, Catalin Marinas wrote:
> > On Fri, 02 May 2025 19:04:12 +0100, Yeoreum Yun wrote:
> > > create_init_idmap() could be called before .bss section initialization
> > > which is done in early_map_kernel().
> > > Therefore, data/test_prot could be set incorrectly by PTE_MAYBE_NG macro.
> > > 
> > > PTE_MAYBE_NG macro set NG bit according to value of "arm64_use_ng_mappings".
> > > and this variable places in .bss section.
> > > 
> > > [...]
> > 
> > Applied to arm64 (for-next/fixes), with some slight tweaking of the
> > comment, thanks!
> > 
> > [1/1] arm64/cpufeature: annotate arm64_use_ng_mappings with ro_after_init to prevent wrong idmap generation
> >       https://git.kernel.org/arm64/c/12657bcd1835
> 
> I'm going to drop this for now. The kernel compiled with a clang 19.1.5
> version I have around (Debian sid) fails to boot, gets stuck early on:
> 
> $ clang --version
> Debian clang version 19.1.5 (1)
> Target: aarch64-unknown-linux-gnu
> Thread model: posix
> InstalledDir: /usr/lib/llvm-19/bin

I reinstated the patch with __read_mostly and some rewriting of the
commit message (I left out the gcc code generation, it's just luck that
we have not hit it before). That's the new commit on the arm64
for-next/fixes branch:

[1/1] arm64: cpufeature: Move arm64_use_ng_mappings to the .data section to prevent wrong idmap generation
      https://git.kernel.org/arm64/c/363cd2b81cfd

I kept the original tested-by from Nathan, I reckon the patch still
works ;).

Thanks.

-- 
Catalin

