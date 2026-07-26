Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD452C53209
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 20:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVrF/WcVVZ6+v7wqKFeILjJoF/YGRxyXfn/mOdZFJus=; b=dHh7tQl3N6JTBG0MhVNAoDQnUn
	+IJL9rRXLoXune9jFnLzanPi49yhoYX66A5SwgVJMVMrG4o7rNt6TQbcDQC5BB840Fmh1coiaQq12
	VGurKD1Sm37uUk6rdb18GlZ5rA2MpLNRwop/WmsJ8cvBwEc/1/i3DHS+5pjUV1M/2EThC1tt4yacM
	tLmxtUdaVIQjnqR3U5PyjgrldjxTA/SOaAJGz3u+a6hW6lOug0ZKL02SrPazDtfLDrjusRol7PYHb
	TORTD1bdwmY7BliFQxk1qMOY+Xqb02y8GpPkrKRnjQrqetghCfWCep8N38MWdOTAC71IDXhj2u7gq
	WEQ4SAMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo54a-00000001Z75-0Qpk;
	Sun, 26 Jul 2026 20:03:44 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo54W-00000001Z6b-3Bh8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 20:03:42 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8C4B67A002D;
	Sun, 26 Jul 2026 16:03:37 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Sun, 26 Jul 2026 16:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785096217;
	 x=1785182617; bh=VVrF/WcVVZ6+v7wqKFeILjJoF/YGRxyXfn/mOdZFJus=; b=
	XkxxV9mFw14sPwww+AXYOzGTDXiU2FG/xXfUMyGOIeNiWuOit952+S6T63RzMFdx
	cAW6CBC6Gybz8mgyq9vl5x0aU+aF/pMOAzBXpd3nxOSIMGInYJvY2h4ZXevDTH+2
	7LZ5BRnRBA+p8UD6Bp+7yX5CHaeVk2IuH/oeYtaiKFrVrwhdsSOgwHfMAKRPFR6Z
	IFOGaOCAoA7bPqj44/hJWH6Vxhsj7sc0JK7P4xS/FrQMB8DLWA1k+QLhltQ2AOF8
	YrHK9NoWsip3nYfOBh5F+wLbELR+e/65L7FliNhhiuBHZP+2PmH9ueP3p9xBpuSa
	zbJ8WjjG5anx6LYE0qh2fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785096217; x=
	1785182617; bh=VVrF/WcVVZ6+v7wqKFeILjJoF/YGRxyXfn/mOdZFJus=; b=g
	b01p+dvMbIpbo8kGFoA+8ThL3WU6zwOhA7eFqSETa81IUFJUQpW08tHg6+46O+N8
	cb8kuDJcIXSGFlnr5IXPzvEtatO/OdkppiV2RSaFMVwzOnBEgUBHOrZETYLZp1sf
	z8FLQ9thAbLlcMJcKEGCbnnBc70q18K+1oYYPj9r2gK0zMHOL3q7PhTyS113nXiJ
	ObH/8DbYJ1D8NqtJm9liJZi04nne6Ugcj/8FxUj/GBru35U6va6UV9FymYpOxB/h
	+QWf4oSZWvx3Mg11xVGZwBQw2WfW9XKHjhkkE61mCbkhKfphY3t7n2tIInnuOX9V
	thI2htVW6e12+taBstdQQ==
X-ME-Sender: <xms:GGhmaowu8APsaM7tFc2t9E1qwPL_-1ZwHQktypSRccTjZiWqIdU3iQ>
    <xme:GGhmanFttKPTFGiUTgiyKIKQdpNOCOChqFG4FjwJ7sBAXC8ACLZ2b-1Iw0nR1NbID
    FPTzAYcBsq33TVU0vlsFGntpdatTFGAmpnyCQehJb01rgrmmD0Q>
X-ME-Proxy-Cause: dmFkZTEXenZwlDACLMPgygtizijP1LOmWZQsQztgOX/mYCZrFqCyy4p7y03I3+V0oqHh9U
    kcReqmbJ49H+fM2oa9xdc0cDXmFb35GobU8RGDDg3Hxxs2nqp9L4RSFC1U6zIar7WbcsB0
    UtsNYhPv+JZfHRJ4udRkPA4gZhd7iUq6rz8aB/PK3MHhz3E24jF366+NrWUQTgs70KK7lg
    7CoEOX1NhQvyCjy0+1GkmE6HwAI58mjCrrFdqU2s6sadHr2pH1JaNmUm6IDnvHmegRJQiN
    wyaY3T3ZXuANZNZbQazO/fSdCeCwvSOGEk2Rc3WbCuRjRJhIv1Z1f7vYqG3OLbaqrBfXST
    hwwtq4aDWKjlVYKJa6ovc5PYxzVGd9rOaSG2V1Cj8KQlHU2U34eCoZDIBdhhpslq95z1ZF
    k+UgqyIfjLPZ/uh4iK6iciMyo0hwLJK910wcAZrAm+DvttDl4yqr2i/7A41D4EYGGCIQhT
    C4fXor9CP/uDASDpVxrk6VwWfMDiokG48qBMAvjoIUSMwFnqbre3v9QY9zf7+mV10l7YH5
    0ArSQp5ejlRSQ2GYe6/u0YgdySIt1mFIa33/sXHokFBekcPMoGx4XsoLli/VaWPNqBM/h4
    lJu2KpvLga2NNps9CGfeGa/J+vf73wA2ChBN+40TMw4Obt6GdPIcSJbMr30g
X-ME-Proxy: <xmx:GGhmatVBHIahSYD97kv2BsQXgOgSd9s4KbfzCiZ1CtBvCez-PEvevg>
    <xmx:GGhmavKiNxYI7P3SD29k7FtiOP21xnusTmVLQG_X0as3i0l9YL99Hg>
    <xmx:GGhmaopjuMscxaJyJ63iVD1rKwTuj_u9cMuWwK7-lSGO0g9rIS78zA>
    <xmx:GGhmamwvJwGRWLxq5ojBbxCO6ANJ6VO-Kk__oLvPtgS8kt6JyaUdGg>
    <xmx:GWhmai67qWwIPVfpPCYfZLvYXnOESklWQesING18WXtbCHS0pxBS-FLa>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 653BA182007E; Sun, 26 Jul 2026 16:03:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AqIEd3yLRNSR
Date: Sun, 26 Jul 2026 22:03:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org,
 "Dan Williams" <djbw@kernel.org>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 linux-kernel@vger.kernel.org, "Kevin Cernekee" <cernekee@gmail.com>,
 "Gregory Fong" <gregory.0xf0@gmail.com>
Message-Id: <9f7fb591-3d56-4354-afa6-8d1fdf5a038f@app.fastmail.com>
In-Reply-To: <20260725133122.2723-1-kmehltretter@gmail.com>
References: <20260725133122.2723-1-kmehltretter@gmail.com>
Subject: Re: [PATCH v3] ARM: set !LPAE MAX_PHYSMEM_BITS to 32 and remove supersection
 mappings
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_130341_114502_821418A3 
X-CRM114-Status: GOOD (  16.86  )
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

On Sat, Jul 25, 2026, at 15:31, Karl Mehltretter wrote:
> An ARM randconfig with CONFIG_GET_FREE_REGION=y and CONFIG_WERROR=y
> fails to build:
>
>   include/linux/minmax.h:86:37: error: conversion from 'long long
>   unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes
>   value from '68719476735' to '4294967295' [-Werror=overflow]
>
> Commit 14b80582c43e ("resource: Introduce alloc_free_mem_region()")
> made kernel/resource.c clamp against
> (1ULL << MAX_PHYSMEM_BITS) - 1.  resource_size_t is 32-bit without
> LPAE, but ARM's default MAX_PHYSMEM_BITS is 36.
>
> That default was added by commit db57f88e4ccb ("ARM: 8411/1: Add
> default SPARSEMEM settings") because several platforms needed at
> least 36 physical address bits.  !LPAE could map addresses above
> 32 bits only through supersections.
>
> CONFIG_IO_36, added by commit 23bdf86aa06e ("[ARM] 3377/2: add
> support for intel xsc3 core"), enabled these for XSC3 I/O.  IXP23xx
> placed static I/O mappings above 4GiB until its removal in 2012, and
> IOP13xx ioremap()ed its PCIe windows there until its removal in 2019.
> The only remaining XSC3 platform, PXA3xx, has nothing above 4GiB.
>
> Supersection address bits overlap the descriptor domain field, so
> IO_36 also renumbered the domains to make DOMAIN_IO zero.  Remove
> IO_36, the alternate domain numbering, and ioremap()'s supersection
> path.  Reject !LPAE ioremap ranges extending past 4GiB before
> phys_addr_t truncation, drop the now-unneeded high static-mapping
> exclusion, and reduce ioremap alignment from 16MiB to the 2MiB
> covered by a PMD's pair of sections.
>
> The other supersection user, create_36bit_mapping(), was added by
> commit 0b7cd62ecdc1 ("[ARM] 3017/1: Add support for 36-bit addresses
> to create_mapping()") for IXP2350 and carried IXP23xx's high static
> mappings.  Before this change, its only remaining call path was
> efi_create_mapping() -> create_mapping_late(), for an EFI runtime
> region above 4GiB.
>
> No real-world user of this !LPAE path is known.  AArch32 UEFI
> requires RAM described by its memory map to be identity-mapped
> during boot services, which a 32-bit virtual address space cannot
> provide above 4GiB.  Systems needing wider physical addressing are
> expected to use LPAE.
>
> Remove create_36bit_mapping() and the supersection definitions.  If
> firmware nevertheless advertises such a region on !LPAE,
> efi_create_mapping() rejects it before __pfn_to_phys() truncates its
> address to a low alias.  EFI runtime services remain disabled, but
> the kernel continues to boot.  LPAE kernels are unaffected.
>
> With no remaining !LPAE mappings above 4GiB, set MAX_PHYSMEM_BITS to
> 32 for !LPAE and retain 36 for LPAE, where phys_addr_t is 64-bit.
>
> Link: 
> https://lore.kernel.org/all/3c79d2dc-8fbd-40fc-8b2d-9d1b4f8ed34e@app.fastmail.com/
> Link: 
> https://lore.kernel.org/all/CAK8P3a2MCdUbN0QSb+M3g5_6HjPsaQwtKxFjADMZWomdry4-Ww@mail.gmail.com/
> Fixes: 14b80582c43e ("resource: Introduce alloc_free_mem_region()")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Let's give others a few more workdays to comment, if nobody
has any concerns please add this to Russell's patch tracker
at https://www.arm.linux.org.uk/developer/patches/info.php

     Arnd

