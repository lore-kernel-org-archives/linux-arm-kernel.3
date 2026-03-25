Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6960106B50C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 12:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUg0TZE02i0OBp5PS3uAaiZ2fcbewL1haWJ/BT+KAlo=; b=WKSKgNjz79msbDr7D6MZUclipm
	+Q5MJ6DHn67PpOHbdyqctMZliIVZ/UtVIq1rz1BBFvDninqwijA0kVcBDTvOCj6D1XM8+zdqVMqux
	UN2ut/Aq+pTpAXAeJ10wLDmqc2r628w/jqHp1aB8CCO6Tsv6DhqaMx4024Zs0Hy9Kzn9Hh5oo59nU
	VYiPc8Xuw9tf81Nuk1MrE8VByL/Z9SZDcyh+mJbTqrBq8EZev0y4gFCo6pKBUikxioc+k8qwzn6Ns
	Y9rusIJ0KpVYpn5fCB9X2NOyNzoo98SKuc5rrd0VmygjHvcPx6lYBefIcWxa8Z/V6yZ21yC8MpwND
	rqHyDbyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MyC-00000003LMU-0vbV;
	Wed, 25 Mar 2026 12:04:20 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5My9-00000003LM2-0QnQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 12:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774440257; x=1805976257;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pthnvpb4bRgKrgjRM/7gqeUF0giUw3hMBAx3mtd0Tfk=;
  b=J7tmz/eaTd05OL5Uk7c6f1Kz8pD8vJdRkgQWOqDIGV0pFDBcdRBCkn5L
   CHF0T6xDxbbPlkkMcFQ5srdSF3zl6wg/kncaLmsQAOzReECtzOOSn9tHA
   inEXGYEhqWoW7sxM7rBars5x1z7pJHS9y2ujTi3YG6RW47526m7HdSFNK
   uc0J5+6qPA05S8bFz5l0rUjFhsYQD3Q+EHHd1TdX9Z5/Rrb4XBiLBqEu/
   u5yJRH0WjjoSCRThOZjnWjA2bPXqdVGwbajeUIsS5WETRkPM/TElJxRS3
   1xKJJYjeyEjD9TvZy6SnkpcjaF94s7DRIOuUW23s462znQhMdhy7V+6hw
   g==;
X-CSE-ConnectionGUID: MvRzsJmwREi/hpAQpsoVVw==
X-CSE-MsgGUID: KM0vsLhdR12P1/I29tWAKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79381350"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79381350"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:04:16 -0700
X-CSE-ConnectionGUID: GDVCGG5yQPG4XMQBFBjvAw==
X-CSE-MsgGUID: 2mzDZ70tTHGJhYkLqZAkRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="255160046"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:04:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Mar 2026 14:04:03 +0200 (EET)
To: linux-pci@vger.kernel.org
cc: Bjorn Helgaas <bhelgaas@google.com>, Guenter Roeck <linux@roeck-us.net>, 
    linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
    Russell King <linux@armlinux.org.uk>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
    Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
    Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Nicholas Piggin <npiggin@gmail.com>, 
    "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, x86@kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 09/10] PCI: Align head space better
In-Reply-To: <20260324165633.4583-10-ilpo.jarvinen@linux.intel.com>
Message-ID: <3a51ad39-558f-860d-4920-9f757b7d5131@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com> <20260324165633.4583-10-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1062646629-1774440243=:976"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_050417_177535_090CFEB5 
X-CRM114-Status: GOOD (  25.86  )
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

--8323328-1062646629-1774440243=:976
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 24 Mar 2026, Ilpo J=C3=A4rvinen wrote:

> When a bridge window contains big and small resource(s), the small
> resource(s) may not amount to the half of the size of the big resource
> which would allow calculate_head_align() to shrink the head alignment.
> This results in always placing the small resource(s) after the big
> resource.
>=20
> In general, it would be good to be able to place the small resource(s)
> before the big resource to achieve better utilization of the address
> space. In the cases where the large resource can only fit at the end
> of the window, it is even required.
>=20
> However, carrying the information over from pbus_size_mem() and
> calculate_head_align() to __pci_assign_resource() and
> pcibios_align_resource() is not easy with the current data structures.
>=20
> A somewhat hacky way to move the non-aligning tail part to the head is
> possible within pcibios_align_resource(). The free space between the
> start of the free space span and the aligned start address can be
> compared with the non-aligning remainder of the size. If the free space
> is larger than the remainder, placing the remainder before the start
> address is possible. This relocation should generally work, because PCI
> resources consist only power-of-2 atoms.
>=20
> Various arch requirements may still need to override the relocation, so
> the relocation is only applied selectively in such cases.
>=20
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D221205
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  arch/arm/kernel/bios32.c         |  3 +++
>  arch/m68k/kernel/pcibios.c       |  4 ++++
>  arch/mips/pci/pci-generic.c      |  3 +++
>  arch/mips/pci/pci-legacy.c       |  2 ++
>  arch/parisc/kernel/pci.c         |  3 +++
>  arch/powerpc/kernel/pci-common.c |  2 ++
>  arch/sh/drivers/pci/pci.c        |  2 ++
>  arch/x86/pci/i386.c              |  2 ++
>  arch/xtensa/kernel/pci.c         |  2 ++
>  drivers/pci/setup-res.c          | 39 +++++++++++++++++++++++++++++++-
>  include/linux/pci.h              |  5 ++++
>  kernel/resource.c                |  2 +-
>  12 files changed, 67 insertions(+), 2 deletions(-)

> diff --git a/arch/sh/drivers/pci/pci.c b/arch/sh/drivers/pci/pci.c
> index 7a0522316ee3..994c3bd36ef2 100644
> --- a/arch/sh/drivers/pci/pci.c
> +++ b/arch/sh/drivers/pci/pci.c
> @@ -185,6 +185,8 @@ resource_size_t pcibios_align_resource(void *data, co=
nst struct resource *res,
>  =09=09 */
>  =09=09if (start & 0x300)
>  =09=09=09start =3D (start + 0x3ff) & ~0x3ff;
> +=09} else (res->flags & IORESOURCE_MEM) {

I'll be adding the missing if into this in v2 (found by sashiko). It seems=
=20
lkp didn't test this so it was not caught earlier.

> +=09=09start =3D pci_align_resource(dev, res, empty_res, size, align);
>  =09}
> =20
>  =09return start;

--=20
 i.

--8323328-1062646629-1774440243=:976--

