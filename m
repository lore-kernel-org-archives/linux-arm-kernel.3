Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3562D68BFD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 17:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMGp3lzuXceQsNxZbsaPx8NKItaA3xtwNOX6BhkrcTA=; b=fmmkh13BVsSTpbuBOG0AlkYD+e
	N3CYJ5lNIp5UPWX4TBR2IkVM9f39yS9TCRAzNyMeLeHwjIRNd7C0rgwZ6zX8h8SWHiRZLzgNoeg5e
	5UkHoQ+gcyLmSOxNmv2fYsFbihAbcMwyZh8/eAhDEYkeYT3GefqHMoKK2GQSg1s6fqgf0HmygZU2+
	+hNvzJlDxqcvK8WehBbBbaXzGffplvCOuqmzzuCHCBMNAa1065cKEw9SghhV5KaNIOIjG23q9kCOv
	3rWW8Laxbjz9jsmgZdScdBv9goK2Qm4feV/WEBeGOI2dB3nEGlzbWqSZjL+D6bSADK+AHprdCFNnF
	tyIx/o6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGBz-00000006Ocb-3bZs;
	Sun, 24 Nov 2024 17:14:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGB1-00000006OY4-4391
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 17:13:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDFE75C564A
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 17:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313AAC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 17:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732468419;
	bh=VgLddvcIzz9+UK7Lv/jyucFoeBwfZMeb43hwR1RLZaY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EUFfFS7sVLUJ9Fg6T2pG975BnYsLEKXW9mSOgNaBnKvpYpQo0oUd1U52ALHZN4oY4
	 kB2xVPOZk9YYFq3xxuxSGfHxnlV07NR/NuPzAujvYQ4IqdB3G/h6I0RRMxRZWo68IR
	 hGBGfvsoq/zXt6LfHx5donsXlKzdTiw7IDNFfDsvV4JG7MhfTVwyrjH7W6RV1xuw98
	 CbloiF87k4GMLib+jKC3VttPezl7dOEZhjLZfqqmPKkUtV+L284NnmS3SQwMQJIrpR
	 yA5+GHD+gLpD7k50HO7RQVTy0N9WlQF/0qhSRjJNjIrcPOyohTUM+Rvh0BYR/exZtk
	 bK0Ho8XkNY2ZQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53dde9acbb0so1064017e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 09:13:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVG6jXZrYUvwliPWQ44gEBpD0cgXhBdOYBkX4q0z+ddRi6PTKiRgD/ZjlKNNuvU/8IEnv5TyzM/deRaYrpjY3F/@lists.infradead.org
X-Gm-Message-State: AOJu0YzsqGkzhga8lgA9hrEAEJx2pkGj2YfVJBMrG35T1xVQI/gx7crb
	t+oHjL4idcQIXcpza+3R/Qrrn7ZTGBkbFPvv/TvBUaBMWZK5gXmIatGjdXCRSEsCoNO98oA2IBg
	kz3m1l+56f76iY+gTabWi5h5ajFA=
X-Google-Smtp-Source: AGHT+IGvr5lmwfakmqlIkJcu6XwxF2gNioqukRxVSZG7xd4plRNby6TC62vi+qXjmI0oWhBEiwO+HWPIenKZ0FJ8oBE=
X-Received: by 2002:a05:6512:158f:b0:53d:e50a:7046 with SMTP id
 2adb3069b0e04-53de50a7236mr32923e87.9.1732468417494; Sun, 24 Nov 2024
 09:13:37 -0800 (PST)
MIME-Version: 1.0
References: <90667b2b7f773308318261f96ebefd1a67133c4c.1732464395.git.lukas@wunner.de>
 <CAMj1kXFvJGHr_iv6bFQfb89XqPFrNWH7-rV7SFy4QBSWXYC4RA@mail.gmail.com>
In-Reply-To: <CAMj1kXFvJGHr_iv6bFQfb89XqPFrNWH7-rV7SFy4QBSWXYC4RA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 24 Nov 2024 18:13:26 +0100
X-Gmail-Original-Message-ID: <CAMj1kXER7AbNyUDjtij6Ni0jVRMg11xvyhkCMKAxaKbx=dsgcQ@mail.gmail.com>
Message-ID: <CAMj1kXER7AbNyUDjtij6Ni0jVRMg11xvyhkCMKAxaKbx=dsgcQ@mail.gmail.com>
Subject: Re: [PATCH for-next/fixes] arm64/mm: Fix false-positive
 !virt_addr_valid() for kernel image
To: Lukas Wunner <lukas@wunner.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Zorro Lang <zlang@redhat.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, Joey Gouly <joey.gouly@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_091340_090418_CF1E6587 
X-CRM114-Status: GOOD (  30.98  )
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

On Sun, 24 Nov 2024 at 17:38, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Sun, 24 Nov 2024 at 17:16, Lukas Wunner <lukas@wunner.de> wrote:
> >
> > Zorro reports a false-positive BUG_ON() when running crypto selftests on
> > boot:  Since commit 1e562deacecc ("crypto: rsassa-pkcs1 - Migrate to
> > sig_alg backend"), test_sig_one() invokes an RSA verify operation with a
> > test vector in the kernel's .rodata section.  The test vector is passed
> > to sg_set_buf(), which performs a virt_addr_valid() check.
> >
> > On arm64, virt_addr_valid() returns false for kernel image addresses
> > such as this one, even though they're valid virtual addresses.
> > x86 returns true for kernel image addresses, so the BUG_ON() does not
> > occur there.  In fact, x86 has been doing so for 16 years, i.e. since
> > commit af5c2bd16ac2 ("x86: fix virt_addr_valid() with
> > CONFIG_DEBUG_VIRTUAL=y, v2").
> >
> > Do the same on arm64 to avoid the false-positive BUG_ON() and to achieve
> > consistent virt_addr_valid() behavior across arches.
> >
> > Silence a WARN splat in __virt_to_phys() which occurs once the BUG_ON()
> > is avoided.
> >
> > The is_kernel_address() helper introduced herein cannot be put directly
> > in the virt_addr_valid() macro:  It has to be part of the kernel proper
> > so that it has visibility of the _text and _end symbols (referenced
> > through KERNEL_START and KERNEL_END).  These symbols are not exported,
> > so modules expanding the virt_addr_valid() macro could not access them.
> > For almost all invocations of virt_addr_valid(), __is_lm_address()
> > returns true, so jumping to the is_kernel_address() helper hardly ever
> > occurs and its performance impact is thus negligible.
> >
> > Likewise, calling is_kernel_address() from the functions in physaddr.c
> > ought to be fine as they depend on CONFIG_DEBUG_VIRTUAL=y, which is
> > explicitly described as "costly" in the Kconfig help text.  (And this
> > doesn't add much cost really.)
> >
> > Abridged stack trace:
> >
> >   kernel BUG at include/linux/scatterlist.h:187!
> >   sg_init_one()
> >   rsassa_pkcs1_verify()
> >   test_sig_one()
> >   alg_test_sig()
> >   alg_test()
> >   cryptomgr_test()
> >
> > Fixes: 1e562deacecc ("crypto: rsassa-pkcs1 - Migrate to sig_alg backend")
> > Reported-by: Zorro Lang <zlang@redhat.com>
> > Closes: https://lore.kernel.org/r/20241122045106.tzhvm2wrqvttub6k@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com/
> > Signed-off-by: Lukas Wunner <lukas@wunner.de>
> > ---
> > Just from looking at the code it seems arm's virt_addr_valid() returns
> > true for kernel image addresses, so apparently arm64 is the odd man out.
> >
>
> That is because ARM maps the kernel in the linear map, whereas arm64
> maps the kernel in the vmalloc space.
>
> vmalloc addresses cannot be used for DMA, which is why
> virt_addr_valid() rejects them. On arm64, the same applies to the
> kernel image, as well as the vmap'ed stack.
>
> > Note that this fix would have obviated the need for commit c02e7c5c6da8
> > ("arm64/mm: use lm_alias() with addresses passed to memblock_free()").
> >
>
> Your 'fix' will break other stuff: it is used, e.g., to decide whether
> __pa() may be used on the input VA, which applies a fixed translation
> on the input, rather than walk the page tables to obtain the physical
> address.
>

Apologies, I replied a little too quickly.

__pa() on arm64 permits linear addresses and kernel image addresses,
and so the kernel image is treated differently from the vmap'ed stack
and other vmalloc addresses.

However, that doesn't mean doing DMA from the kernel image is a great
idea. Allocations in the linear map are rounded up to cacheline size
to ensure that they are safe for non-coherent DMA, but this does not
apply to the kernel image. .rodata should still be safe in this
regard, but the general idea of allowing kernel image addresses in
places where DMA'able virtual addresses are expected is something we
should consider with care.

