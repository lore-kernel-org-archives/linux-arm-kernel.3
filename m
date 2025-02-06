Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EED1C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWCoK5Bcd5+DS1TWtGzrPhBx20PKdoTpfltF3CTwAe4=; b=Ij6MMVzAp1hFOVc4TRjcgMd4NI
	jzrWLnVL/auyIXjGL3oWJMP783TRTle4XVQI9YMr/uR1fSAokNbzvOGcjSZq5AVSDwru6OgXRzC7l
	wiZJ1L/VYzg3QOH5+MIhV6vLxq6Xubp3qh9D5AMtRljS8azfmEgouKXP6fpBVwRMPoqMF2H8Ggota
	dU6i0AFdWYYI4PDLd07c5Es9NEoMlSGEwkoWETBIxxxasTIGsh/F8vwfJ+B0ZmqZ9di8/94fLCnqB
	Ro0VyXiKlgf8QOa6ztbzPs/wxbn1h4SOyEvb8fGniwq2FqLBopaJlHJAG0ju+HQ9O8RLec95IDZ1M
	DnVJgbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2QX-00000006VeR-09w7;
	Thu, 06 Feb 2025 14:00:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2Nc-00000006V5W-3UcU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0F3AA442CE;
	Thu,  6 Feb 2025 13:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26496C4CEDD;
	Thu,  6 Feb 2025 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738850239;
	bh=LxYhiBiaZHBVR5Gszv7w/Tef4B8mfeE8hfjbsuT8Pxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dvGXW9vruqA5OZ9jMC8fhfP2uAjPcXoOle4tDfQuEYs4gH0YggZyErKDMfT9Alr2a
	 eM95P7GIGqg7QnFhRRAzE+W4nVFhTG0MPnaMIq0kfrDtDnsTnPnE732p9gp54tbNGq
	 B8Fy4oZMq6EKMb2DCQY0rJwuu832LoI4rM9mSqQBP8zqDnRYLZQbFBTdRG6cm7idVC
	 NJbq4UTsyAWJ4F4uz+8Kvr6LxvoN/6g//lvxu+TR53N9R/rBaHWjuxpk02XLISHd85
	 0eeDmR6aSyIqlu1Id/+TWsuejTLv1d5TUfFWMJU5eZPTzkGYCQ0gbYsx4yMBKghOmc
	 WDErRNAxO1unw==
Date: Thu, 6 Feb 2025 06:57:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Handle .ARM.attributes section in linker
 scripts
Message-ID: <20250206135715.GA180182@ax162>
References: <20250204-arm64-handle-arm-attributes-in-linker-script-v2-1-d684097f5554@kernel.org>
 <20250206130526.GB3204@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206130526.GB3204@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_055721_000651_F27DF056 
X-CRM114-Status: GOOD (  25.52  )
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

Hi Will,

On Thu, Feb 06, 2025 at 01:05:26PM +0000, Will Deacon wrote:
> On Tue, Feb 04, 2025 at 10:48:55AM -0700, Nathan Chancellor wrote:
> > A recent LLVM commit [1] started generating an .ARM.attributes section
> > similar to the one that exists for 32-bit, which results in orphan
> > section warnings (or errors if CONFIG_WERROR is enabled) from the linker
> > because it is not handled in the arm64 linker scripts.
> > 
> >   ld.lld: error: arch/arm64/kernel/vdso/vgettimeofday.o:(.ARM.attributes) is being placed in '.ARM.attributes'
> >   ld.lld: error: arch/arm64/kernel/vdso/vgetrandom.o:(.ARM.attributes) is being placed in '.ARM.attributes'
> > 
> >   ld.lld: error: vmlinux.a(lib/vsprintf.o):(.ARM.attributes) is being placed in '.ARM.attributes'
> >   ld.lld: error: vmlinux.a(lib/win_minmax.o):(.ARM.attributes) is being placed in '.ARM.attributes'
> >   ld.lld: error: vmlinux.a(lib/xarray.o):(.ARM.attributes) is being placed in '.ARM.attributes'
> > 
> > Discard the new sections in the necessary linker scripts to resolve the
> > warnings, as the kernel and vDSO do not need to retain it, similar to
> > the .note.gnu.property section.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: b3e5d80d0c48 ("arm64/build: Warn on orphan section placement")
> > Link: https://github.com/llvm/llvm-project/commit/ee99c4d4845db66c4daa2373352133f4b237c942 [1]
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > Changes in v2:
> > - Discard the section instead of adding it to the final artifacts to
> >   mirror the .note.gnu.property section handling (Will).
> 
> Thanks for the v2. Just a minor nit:
> 
> > - Link to v1: https://lore.kernel.org/r/20250124-arm64-handle-arm-attributes-in-linker-script-v1-1-74135b6cf349@kernel.org
> > ---
> >  arch/arm64/kernel/vdso/vdso.lds.S | 1 +
> >  arch/arm64/kernel/vmlinux.lds.S   | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
> > index 4ec32e86a8da..8095fef66209 100644
> > --- a/arch/arm64/kernel/vdso/vdso.lds.S
> > +++ b/arch/arm64/kernel/vdso/vdso.lds.S
> > @@ -80,6 +80,7 @@ SECTIONS
> >  		*(.data .data.* .gnu.linkonce.d.* .sdata*)
> >  		*(.bss .sbss .dynbss .dynsbss)
> >  		*(.eh_frame .eh_frame_hdr)
> > +		*(.ARM.attributes)
> >  	}
> 
> Can we chuck this in the earlier /DISCARD/ section along with
> .note.gnu.property? i.e.

Sure, I don't see why not. Do you want the comment above it updated to
mention this section or should I leave it as is?

> diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
> index 4ec32e86a8da..47ad6944f9f0 100644
> --- a/arch/arm64/kernel/vdso/vdso.lds.S
> +++ b/arch/arm64/kernel/vdso/vdso.lds.S
> @@ -41,6 +41,7 @@ SECTIONS
>          */
>         /DISCARD/       : {
>                 *(.note.GNU-stack .note.gnu.property)
> +               *(.ARM.attributes)
>         }
>         .note           : { *(.note.*) }                :text   :note
> 
> 
> Will

