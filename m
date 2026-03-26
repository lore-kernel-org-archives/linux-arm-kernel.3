Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8F410AB807
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0xj7Y0QmYs5cqSXPJGx4SaxlDzojtOp5fFgQUNPONN8=; b=yW1XkisUCBPLYDcEKkvttQ80si
	IM4ztoRzM/QHH5+kLpVvNIGEKC2m15sk+0ww0R8LAPI2D+ASQOUDQ3jwPh3bY/aBmL5SFvu2t/PJK
	/FTKQx1IjSXNFkrCGBJ5vD6BW+tbR6chG1xuOtoSIfQF2Nm9NFHPtkxIFgT2MyVX/XsppARWbBFyz
	B3PLXUggq6Rd1IzTg8mrxRx4s3jDzhrC2hTdg1dh9CSDh8RMGk4zHTgGWjuhBoX+n88Ixs49Q2ULz
	U+oxqesNU4+KzVQFQ8+YuBSPOkJJ4pFkM4ooD8RUzBkNRTjdYvxPcoVc7mb0QXXJU9Kt+K51D47gw
	RjeHNQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qKb-000000066n0-0W9g;
	Thu, 26 Mar 2026 19:25:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qKZ-000000066mu-3hjt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 19:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8191C60054;
	Thu, 26 Mar 2026 19:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA1EC116C6;
	Thu, 26 Mar 2026 19:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774553122;
	bh=A++szeKtnjRSEovDyZxLISgC62LFBBAIhs/d9OMRhfE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NfJ/oEz0LRYInVcrSbNN88ZD+MdyZe+E5wpkqpNyM7Ggrd+87xrTGdb2eRZTy87DI
	 3AEY3FowNt2dLBx5bUv4EG4eu546MewpNXZGCLDHkBfe8g3LZwJ102n7t7khlBaszz
	 Lx4TnfZYWvuNCDHMwl+tUFBLw2zV1Ngq0Csg3zwt51tFeRwFrtv1uYON4+pXGzeX8B
	 iMHKIRiCjG9dp3POhWU/XzfbitypWNW1N1GDKkwoAv/NyKcEekZl9lBiRmYoXapScF
	 rKV+yPTbfY8C2bHC3ckb0AISfTndYlJ7pwkpyfMvmqNf9+9J1OGvYPuntH/jG+z1Hp
	 YXvuT6LOCwG0g==
Date: Thu, 26 Mar 2026 14:25:20 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-kernel@vger.kernel.org, Xifer <xiferdev@gmail.com>
Subject: Re: [PATCH 00/10] PCI: Improve head free space usage
Message-ID: <20260326192520.GA1337681@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
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

[+cc Xifer; thanks very much for reporting and testing!]

On Tue, Mar 24, 2026 at 06:56:23PM +0200, Ilpo Järvinen wrote:
> Hi all,
> 
> This series attempts to take advantage of free head space (the free
> space before the aligned start address) in order to generally produce a
> tighter packing of the resources/bridge windows.
> 
> The recent changes to the resource fitting algorithm caused resource
> allocation failures in some cases where a bridge window that is sized
> to be gapless could no longer be assigned. The previous algorithm left
> a huge gaps which allowed it to place the remainder (non-aligning part
> of the size) before the start address of used for the gapless fit,
> whereas the new gapless approach always had to place the remainder
> after the aligning part of the resources. There is not always space
> for the remainder triggering those failures (e.g., when the aligning
> part must be placed at the top of the window).
> 
> This series attempts to allow placing the remainder once again before
> the aligning part, but now without leaving huge gaps to retain the
> benefits of the gapless bridge windows. The approach is somewhat hacky
> but should work thanks to PCI resources fundamentally consisting only
> power-of-two atoms.
> 
> There maybe cases where architecture would not want to do such
> relocation. This series adds the relocation to arch
> pcibios_align_resource() functions to allow all of them taking
> advantage of the better resource packing but if somebody objects doing
> this relocation for a particular arch, I can remove it, please just let
> me know (this relocation doesn't seem critical unless there are
> regressions).
> 
> Ilpo Järvinen (10):
>   resource: Add __resource_contains_unbound() for internal contains
>     checks
>   resource: Pass full extent of empty space to resource_alignf CB
>   resource: Rename 'tmp' variable to 'full_avail'
>   ARM/PCI: Remove unnecessary second application of align
>   am68k/PCI: Remove unnecessary second application of align
>   MIPS: PCI: Remove unnecessary second application of align
>   parisc/PCI: Cleanup align handling
>   PCI: Rename window_alignment() to pci_min_window_alignment()
>   PCI: Align head space better
>   PCI: Fix alignment calculation for resource size larger than align
> 
>  arch/alpha/kernel/pci.c          |  1 +
>  arch/arm/kernel/bios32.c         |  9 ++++---
>  arch/m68k/kernel/pcibios.c       |  8 +++++--
>  arch/mips/pci/pci-generic.c      |  8 ++++---
>  arch/mips/pci/pci-legacy.c       |  3 +++
>  arch/parisc/kernel/pci.c         | 17 ++++++++------
>  arch/powerpc/kernel/pci-common.c |  6 ++++-
>  arch/s390/pci/pci.c              |  1 +
>  arch/sh/drivers/pci/pci.c        |  6 ++++-
>  arch/x86/pci/i386.c              |  5 +++-
>  arch/xtensa/kernel/pci.c         |  3 +++
>  drivers/pci/pci.h                |  3 +++
>  drivers/pci/setup-bus.c          | 15 ++++++++----
>  drivers/pci/setup-res.c          | 40 +++++++++++++++++++++++++++++++-
>  drivers/pcmcia/rsrc_nonstatic.c  |  3 ++-
>  include/linux/ioport.h           | 22 +++++++++++++++---
>  include/linux/pci.h              | 12 +++++++---
>  kernel/resource.c                | 33 +++++++++++++-------------
>  18 files changed, 149 insertions(+), 46 deletions(-)

I added Xifer's tested-by, fixed the "am68k" and missing "if"
typos, and applied these to pci/resource for v7.1.

Ilpo, if you post a v2 with more changes, I'll update to it.  I
applied the series now to get a head start on 0-day building and into
next.

