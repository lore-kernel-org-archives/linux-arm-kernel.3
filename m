Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B794A10ED656
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 10:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLijcu1fUO48QXHdB65tn3LL9j0JNLmqgKL8ts8akEg=; b=UoQy4J4nmjaPMA4AD+rbVsgSlh
	/3m17pBsGhj3gWHpqcWmNfDvRyV1wDRLRk1lbDSTEaW2pbavDShZqD7aL8jbkDlW/UMthi85RUwP8
	zZ+bciWzg+QkCWEzKMMFdm5C0Sui8TvVssf/GfDeapTSwzpQwDGWM7EtVPpZt91yw9+9PFC3JZdbD
	4jwpCBggbKwU7kpAhWWOEIA8cbHVPFCTtOC5dkruaJu+4uveMrIIeEcfb6PGPOVlBj0v+jEmG8cY8
	aiENR+WhyxR6ws9H/A05tCmB3wbAKxBNUfyQfEF1A26gGZ9atZPUbc9gC2OF6bNNScJkeVGRalzOe
	V7KK13xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w64RT-000000079pr-1bmG;
	Fri, 27 Mar 2026 10:29:27 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w64RF-000000079ow-0qQ0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 10:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774607353; x=1806143353;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AQrZsYS87uRLSAUzR2yt6e8HOvPMEsktxMC+0rqw0oY=;
  b=SX0nzWlZIY0Lg4fyXJy1hem2uUevSvI1nbx91bp0jZYYqRr93GaLksaE
   L6XLJWuLACGbs/Obo0LLfiusLKSxmX5HOfj2BR/OfzI5RUmPnAEbJxWGx
   H8arvWKQ7iOn+koxe3/GEJt4fFT8S6HWH9xg10wBXdgqPJanVKkEt1Qyx
   /7B2xb2jl7faADXEGMBpdI28tH79/++kh/ol8X0TPBLWYG1sA2mCqBcZa
   QJQsSA1iMaFdyaMsTkz2wpp39pZGfRPODNn6QqAM5cXjkgXj8CJ1e7gn9
   0Li0W7WV2EDfk6lWNjEzVO4kFjsRIUYdrV6xXvg6gkCesf5RAzv+5UkW8
   Q==;
X-CSE-ConnectionGUID: eyE/4EHhTqSDSq8w4JZb5Q==
X-CSE-MsgGUID: xn9u+vplS3aXPtgUY2vXHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="93259323"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="93259323"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:29:12 -0700
X-CSE-ConnectionGUID: tBARr7F7SaCXrVZYlacT+g==
X-CSE-MsgGUID: 6iZuzsYWQBOngO/GpRvA3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="263218208"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.186])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:29:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 27 Mar 2026 12:28:56 +0200 (EET)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
    Guenter Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
    Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
    Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    LKML <linux-kernel@vger.kernel.org>, Xifer <xiferdev@gmail.com>
Subject: Re: [PATCH 00/10] PCI: Improve head free space usage
In-Reply-To: <20260326192520.GA1337681@bhelgaas>
Message-ID: <7207cde7-d47e-f79c-afe9-9b1daa79140c@linux.intel.com>
References: <20260326192520.GA1337681@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-307680389-1774607336=:1037"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_032913_250834_B20CC356 
X-CRM114-Status: GOOD (  30.12  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-307680389-1774607336=:1037
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 26 Mar 2026, Bjorn Helgaas wrote:

> [+cc Xifer; thanks very much for reporting and testing!]
>=20
> On Tue, Mar 24, 2026 at 06:56:23PM +0200, Ilpo J=C3=A4rvinen wrote:
> > Hi all,
> >=20
> > This series attempts to take advantage of free head space (the free
> > space before the aligned start address) in order to generally produce a
> > tighter packing of the resources/bridge windows.
> >=20
> > The recent changes to the resource fitting algorithm caused resource
> > allocation failures in some cases where a bridge window that is sized
> > to be gapless could no longer be assigned. The previous algorithm left
> > a huge gaps which allowed it to place the remainder (non-aligning part
> > of the size) before the start address of used for the gapless fit,
> > whereas the new gapless approach always had to place the remainder
> > after the aligning part of the resources. There is not always space
> > for the remainder triggering those failures (e.g., when the aligning
> > part must be placed at the top of the window).
> >=20
> > This series attempts to allow placing the remainder once again before
> > the aligning part, but now without leaving huge gaps to retain the
> > benefits of the gapless bridge windows. The approach is somewhat hacky
> > but should work thanks to PCI resources fundamentally consisting only
> > power-of-two atoms.
> >=20
> > There maybe cases where architecture would not want to do such
> > relocation. This series adds the relocation to arch
> > pcibios_align_resource() functions to allow all of them taking
> > advantage of the better resource packing but if somebody objects doing
> > this relocation for a particular arch, I can remove it, please just let
> > me know (this relocation doesn't seem critical unless there are
> > regressions).
> >=20
> > Ilpo J=C3=A4rvinen (10):
> >   resource: Add __resource_contains_unbound() for internal contains
> >     checks
> >   resource: Pass full extent of empty space to resource_alignf CB
> >   resource: Rename 'tmp' variable to 'full_avail'
> >   ARM/PCI: Remove unnecessary second application of align
> >   am68k/PCI: Remove unnecessary second application of align
> >   MIPS: PCI: Remove unnecessary second application of align
> >   parisc/PCI: Cleanup align handling
> >   PCI: Rename window_alignment() to pci_min_window_alignment()
> >   PCI: Align head space better
> >   PCI: Fix alignment calculation for resource size larger than align
> >=20
> >  arch/alpha/kernel/pci.c          |  1 +
> >  arch/arm/kernel/bios32.c         |  9 ++++---
> >  arch/m68k/kernel/pcibios.c       |  8 +++++--
> >  arch/mips/pci/pci-generic.c      |  8 ++++---
> >  arch/mips/pci/pci-legacy.c       |  3 +++
> >  arch/parisc/kernel/pci.c         | 17 ++++++++------
> >  arch/powerpc/kernel/pci-common.c |  6 ++++-
> >  arch/s390/pci/pci.c              |  1 +
> >  arch/sh/drivers/pci/pci.c        |  6 ++++-
> >  arch/x86/pci/i386.c              |  5 +++-
> >  arch/xtensa/kernel/pci.c         |  3 +++
> >  drivers/pci/pci.h                |  3 +++
> >  drivers/pci/setup-bus.c          | 15 ++++++++----
> >  drivers/pci/setup-res.c          | 40 +++++++++++++++++++++++++++++++-
> >  drivers/pcmcia/rsrc_nonstatic.c  |  3 ++-
> >  include/linux/ioport.h           | 22 +++++++++++++++---
> >  include/linux/pci.h              | 12 +++++++---
> >  kernel/resource.c                | 33 +++++++++++++-------------
> >  18 files changed, 149 insertions(+), 46 deletions(-)
>=20
> I added Xifer's tested-by, fixed the "am68k" and missing "if"
> typos, and applied these to pci/resource for v7.1.
>=20
> Ilpo, if you post a v2 with more changes, I'll update to it.  I
> applied the series now to get a head start on 0-day building and into
> next.

Thanks.

I don't have anything in addition to those.

--=20
 i.

--8323328-307680389-1774607336=:1037--

