Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C30C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AW+6C3mGxyqjIQ6odBPzE1BnbGtadF5GPXL3aQwcacU=; b=1iT9W66STiWbTVAGOJBaiRz+Va
	LJ+WGLGaiVk67qpE5AmVzjJTDeuZGrW7hgxqxvkdwEXwcODoiXgFF8x3C3PLu3V88c5xn5Jc2hKmG
	XOkyRr7IWSopE2Gp+HLuCTsnSb/yLDptfyUfKGthrF7FOyg8Wwp98qyCJFG0l7kTcd6UzRMmIT80p
	w4gQ820G66pBTSjroBYfnPT6iWifKgdzqefDsTIsvAUTq8QmSBt8pRXLUgci9rEoJuvcvtKiLmGeV
	ySVHRamDDUJN57jFTu8rFdIh3servC6Tz7CtsOrcqzONiv7kzSb2CKNnO9zRmwVHq7MB6zXltpiEO
	w0+88nKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIhe-00000009oWY-2R1r;
	Mon, 13 Jul 2026 15:36:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIhd-00000009oW3-2hG6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:36:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 039D4600AE;
	Mon, 13 Jul 2026 15:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C151F000E9;
	Mon, 13 Jul 2026 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783956976;
	bh=AW+6C3mGxyqjIQ6odBPzE1BnbGtadF5GPXL3aQwcacU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hcBWmpIpn+USM69JwOJ3+RqVZbOYAGf+EYQjngjkeq4BYj8hxL1uKmyGUqx18TFGC
	 3m4rP2TpCm8j+RKUdqQY+D3X8tPa4585hFmEjnZsr5967DvgIE4WidFgDZxQDErcyQ
	 8dqcYkMnzM2Q+FxTDmpnpF6Ho+jM4qyE5mChnba+B4lB7b97OEerjj1AeCxaQaO7pM
	 Hu6wCRjCe/P5sSPoMWe72SxqxUtjZQYdgYrpc9+bZi6FESwdRTbKYnsQZ8bj7UUT//
	 fge7UcGqSnHg/o1Ap7UwI6z6pUlLYSiOrQc/75e3De9K3IdVLC2+kyEVBTPLbo8kKq
	 ZcVQ+O+7tt3vg==
Date: Mon, 13 Jul 2026 16:36:13 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, Jonathan Corbet <corbet@lwn.net>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Message-ID: <20260713-comical-iguana-of-drizzle-befa6d@sudeepholla>
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
 <22ba1b98-ddc8-4fff-a372-6e4aa2b59c7c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22ba1b98-ddc8-4fff-a372-6e4aa2b59c7c@arm.com>
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

On Mon, Jul 13, 2026 at 05:54:16PM +0530, Anshuman Khandual wrote:
> On 13/07/26 3:27 PM, Sudeep Holla wrote:
> > On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
> >> Overriding the idle mechanism might be useful for debugging and performance
> >> testing. Add a cmdline parameter for it, similar to the existing idle=
> >> parameter already present for the x86 and ppc architectures.
> >>
> >> It is also useful on platforms where the WFI instruction misbehaves,
> >> such as Apple Silicon SoCs. Generally, a misbehaving instruction should
> >> be treated as an erratum and patched using the alternatives framework.
> >> However, in the Apple Silicon case we need more flexibility because it is
> >> difficult to detect whether the erratum applies. For example, Linux VMs
> >> inside macOS have the same MIDR and may even seem like they're running
> >> in EL2 in the case of NV, but should continue using WFI (it's trapped and
> >> handled correctly by the hypervisor there). Thus, we prefer to
> >> let the m1n1 bootloader add the idle=nop parameter[1].
> >>
> >> Link[1]: https://lore.kernel.org/all/99b69262-e54b-424e-baa2-96ef7013b87a@kernel.org/
> >> Suggested-by: Will Deacon <will@kernel.org>
> >> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> >> ---
> >> Changes in v2:
> >> - Applied suggestions by Anshuman Khandual (Thanks!)
> >> - Link to v1: https://patch.msgid.link/20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev
> >> ---
> >>  Documentation/admin-guide/kernel-parameters.txt | 23 +++++++++++++++++++
> >>  arch/arm64/kernel/idle.c                        | 30 +++++++++++++++++++++++--
> >>  arch/arm64/kernel/idle.h                        | 13 +++++++++++
> >>  arch/arm64/lib/delay.c                          |  5 ++++-
> >>  4 files changed, 68 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> >> index b2d7d3540ded..d7f5471edf8f 100644
> >> --- a/Documentation/admin-guide/kernel-parameters.txt
> >> +++ b/Documentation/admin-guide/kernel-parameters.txt
> >> @@ -2239,6 +2239,29 @@ Kernel parameters
> >>  
> >>  			idle=nomwait: Disable mwait for CPU C-states
> >>  
> >> +			[ARM64,EARLY]
> >> +			Format: idle=wfi, idle=yield, idle=nop
> >> +
> >> +			idle=wfi: Use the WFI (Wait For Interrupt) hint
> >> +			instruction in the idle loop. This is the default and
> >> +			allows the CPU to enter a low-power state until an
> >> +			interrupt arrives.
> > 
> > Just curious as when and why one would need to use idle=wfi if that is the
> > default behaviour. I am missing the need to have it.
> 
> I guess once there is a list to chose options from in the command line,
> should not the default option be listed there as well ?
> 

I don't know if it is a requirement or just a practice. But for reasons
Will mentioned, it becomes a requirement.

-- 
Regards,
Sudeep

