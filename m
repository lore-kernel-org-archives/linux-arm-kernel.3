Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611E6FEC0EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4Skp0d0PaeQO+3Y+N+lz2SpTD1JG+jzc8wIlPQ0pik=; b=oc5vQ6mfs7w72TCyNCre3NUvFg
	Kan8kLiwN4f/muECVHbOu7nYja0e3gxlEqGtcbofdXAARqjgoTwT7E85gAUxJF/2JcmFKr/GFVq/C
	bVQh4mZVpCPL9PtTbQbD8TOqAGpEoyQWjr1jJfWD5jYLk2c1MXrG5hCG9E0hR2ow58TPTwiqRONLi
	VZSClOEwTvujmjJ47lyoEAJRT0avWVpRnJnjrHhY8iw98UnI7POYAn5MyJwTwmHoLGLEz0UuPO0vW
	jkhqNXSYdoPccUChxn1VKfXmW3pXO/J/xlLLWPuuTE63Y0WKXdeMg2/bmKu1fxRnYV/tN/53LdBCL
	0bGhbIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55zG-000000021wk-1lmK;
	Tue, 24 Mar 2026 17:56:18 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55zD-000000021wA-0PJI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 17:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774374975; x=1805910975;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NL1mcB9ozeqOSsqCkkguLMRCIYPAgFUo0JaJzh10URc=;
  b=ep2DoyF328mh2z86YBnm/yHIhjokaj2zOS9UoRxUg1LasWw9EwACtzr9
   RTGxH/i8RPpJoR5lp2e20q2s1Q98r8wabxRMaHo5+neXFxAKO+nkTHw1t
   0zazBX05FVJrc47+ThP+37zS45BOYkVa4MlsDRu9+4gT7o80iN4fIonRH
   P9NHqEjz/iz8Huefrlmb+N0B3VTatR2bb+VraqBiz/OYc7UCpagIuslLd
   ym3HZR+5swx/yxBFlLRf8iwZBBvVJ6djSezb+lCbZbOroSKbioHI4wCas
   Om7WVOABxxue4P7WAjMtifiZoGW2P1SO1O51B3jjaDnSbjQ/xhfZM9IKn
   Q==;
X-CSE-ConnectionGUID: DeTG1KCiTKCMGg56tPG8BA==
X-CSE-MsgGUID: l59x3/FATNqf9zVIVgFByg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75307424"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75307424"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:55:45 -0700
X-CSE-ConnectionGUID: mUXuAQFLRnadhyMeGmty4g==
X-CSE-MsgGUID: bujbx+8xS52CYl9LobjFjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="220002724"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:55:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Mar 2026 19:55:32 +0200 (EET)
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
    Guenter Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
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
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/10] am68k/PCI: Remove unnecessary second application
 of align
In-Reply-To: <5de97ed9556bfcc3b1f26bd71e09fa4016ae3ff8.camel@physik.fu-berlin.de>
Message-ID: <1c08efcd-25e8-6436-52ab-ac3d50dcf58f@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>  <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com> <5de97ed9556bfcc3b1f26bd71e09fa4016ae3ff8.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-641337346-1774374932=:1055"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_105615_181753_E62FD5B4 
X-CRM114-Status: GOOD (  19.52  )
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

--8323328-641337346-1774374932=:1055
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 24 Mar 2026, John Paul Adrian Glaubitz wrote:

> Hi Ilpo,
>=20
> On Tue, 2026-03-24 at 18:56 +0200, Ilpo J=C3=A4rvinen wrote:
> > Aligning res->start by align inside pcibios_align_resource() is
> > unnecessary because caller of pcibios_align_resource() is
> > __find_resource_space() that aligns res->start with align before
> > calling pcibios_align_resource().
> >=20
> > Aligning by align in case of IORESOURCE_IO && start & 0x300 cannot ever
> > result in changing start either because 0x300 bits would have not
> > survived the earlier alignment if align was large enough to have an
> > impact.
> >=20
> > Thus, remove the duplicated aligning from pcibios_align_resource().
> >=20
> > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> >  arch/m68k/kernel/pcibios.c | 2 --
> >  1 file changed, 2 deletions(-)
> >=20
> > diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
> > index 1415f6e4e5ce..7e286ee1976b 100644
> > --- a/arch/m68k/kernel/pcibios.c
> > +++ b/arch/m68k/kernel/pcibios.c
> > @@ -36,8 +36,6 @@ resource_size_t pcibios_align_resource(void *data, co=
nst struct resource *res,
> >  =09if ((res->flags & IORESOURCE_IO) && (start & 0x300))
> >  =09=09start =3D (start + 0x3ff) & ~0x3ff;
> > =20
> > -=09start =3D (start + align - 1) & ~(align - 1);
> > -
> >  =09return start;
> >  }
> >=20
>=20
> Sorry if it's a stupid question, but what does "am68k" in the subject ref=
er to?

The extra "a" is a typo. I'm sorry about that.

--=20
 i.

--8323328-641337346-1774374932=:1055--

