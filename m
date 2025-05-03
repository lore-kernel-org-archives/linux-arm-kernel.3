Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1D7C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 14:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyzC4D2biGwGo5WMxDymlo4xVwtiiKFQOKdRmA5WIG4=; b=qsUCfAM7g921fdsVV1oIN2raru
	nB+Qw/kvZqCZAtI2nMsoh26atlKZFTvJrlN0nc4mJbKjuhQSbnFAAaPD9m7A3wxP+YszzYDLc7bX6
	Bl4mX+f3lKbdK+dV4T6WPSSfnoRkXwiPoAb2z0jJAYdwcDDxCd6XoWq0y1G4NGNhjdS69NWdQk4mm
	Fc7hPqYtBxgWxXf9eKxEAHfBV/UJBJty6cPL1r76HL90BvsZTPh68xAa5PT0gMe/+WiKb9EnrjTr0
	o2jR5MJRFA0ZQGkTeLDat1XRi3ezVrSHyZ2uQtXSsz89cbD8TCPUDm7fEdncevEbdoPE8EjNr/AvV
	ruDWJ7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBDe0-00000003xFI-3COz;
	Sat, 03 May 2025 14:15:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBDag-00000003wqG-3TI2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 14:11:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 518F1A4B58B;
	Sat,  3 May 2025 14:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FD2C4CEE3;
	Sat,  3 May 2025 14:11:38 +0000 (UTC)
Date: Sat, 3 May 2025 15:11:36 +0100
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
Message-ID: <aBYkGJmfWDZHBEzp@arm.com>
References: <20250502180412.3774883-1-yeoreum.yun@arm.com>
 <174626735218.2189871.10298017577558632540.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174626735218.2189871.10298017577558632540.b4-ty@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_071142_929164_56AFEB70 
X-CRM114-Status: GOOD (  12.47  )
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

On Sat, May 03, 2025 at 11:16:12AM +0100, Catalin Marinas wrote:
> On Fri, 02 May 2025 19:04:12 +0100, Yeoreum Yun wrote:
> > create_init_idmap() could be called before .bss section initialization
> > which is done in early_map_kernel().
> > Therefore, data/test_prot could be set incorrectly by PTE_MAYBE_NG macro.
> > 
> > PTE_MAYBE_NG macro set NG bit according to value of "arm64_use_ng_mappings".
> > and this variable places in .bss section.
> > 
> > [...]
> 
> Applied to arm64 (for-next/fixes), with some slight tweaking of the
> comment, thanks!
> 
> [1/1] arm64/cpufeature: annotate arm64_use_ng_mappings with ro_after_init to prevent wrong idmap generation
>       https://git.kernel.org/arm64/c/12657bcd1835

I'm going to drop this for now. The kernel compiled with a clang 19.1.5
version I have around (Debian sid) fails to boot, gets stuck early on:

$ clang --version
Debian clang version 19.1.5 (1)
Target: aarch64-unknown-linux-gnu
Thread model: posix
InstalledDir: /usr/lib/llvm-19/bin

I didn't have time to investigate, disassemble etc. I'll have a look
next week.

-- 
Catalin

