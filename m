Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819CEFEC0EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AP49Wml/Qr/wzH3y6BxqbwOt7JtkHcoMn8XiWeebrkI=; b=LxU1/xHngl3Ldrew+du9UDfkE0
	YfrWSOUjAEXSh2p2AD++EiAU0N2OA6UUTxcjTveeRNfcp7MJQVpymMIzkpEiI/4iX62vN1CenzLGJ
	t+tpQPC+YCKhkNCx8CjmHK8UHMnqEVXbofvgdYzPTjT4mRTvvSgw8bdpu62HTUor3f9ea0hV04dVh
	7/aBQsromdyo7Jowo7XJz2XaliPqle0Y7OOJc8oQgrKL3CCCKGDvm0+O4twU7tAgSVY28ci3IkmEb
	NffLtvvyV2S1InO+ATpeu7CW9BF04vtju7h8ZsSokZZspolUQ9GBqHGYKhfL2LMNF7malon9HmiJb
	xB1liwCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55mk-00000002100-0b3p;
	Tue, 24 Mar 2026 17:43:22 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55mg-000000020zN-0th0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 17:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=AP49Wml/Qr/wzH3y6BxqbwOt7JtkHcoMn8XiWeebrkI=; t=1774374198;
	x=1774978998; b=NJ72F+qddA8MiPGDxuP+frRGmzi/uhsV2iGArVGugJvhozlCEXzt/HHfYK6rV
	JnVam7ACI2LumhIDU2KOGfDR4M5QXp340p/arvfXX9X/xO3m0xnGSPVe65mgoU+EeXl4XA+OrUCh7
	4IEtVdy3FNou77lUh48Pn04PgRMcRStid17N6uzdgb+ks6Arvrc5+a2Rz6nkMEWeTDPCfBHy5rd5f
	f3TXdye1tJA8mbnnk8LcV8e8TcnCpTMZczRahNPhNxyj++E6zT/ywQdcQfOIJBzRh9kCW1T06uiru
	CQ1BzUQ8Gn07YWWX3daKoNc9bYDVmTTY1T8PV0sv/4k8Q8Vikw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1w55mW-000000048aG-0PwD; Tue, 24 Mar 2026 18:43:08 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1w55mV-00000001qau-3Gph; Tue, 24 Mar 2026 18:43:07 +0100
Message-ID: <5de97ed9556bfcc3b1f26bd71e09fa4016ae3ff8.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 05/10] am68k/PCI: Remove unnecessary second application
 of align
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Guenter
 Roeck	 <linux@roeck-us.net>, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman	 <mpe@ellerman.id.au>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar	 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen	 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Chris Zankel	 <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Madhavan Srinivasan	 <maddy@linux.ibm.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker	 <dalias@libc.org>,
 linux-kernel@vger.kernel.org
Date: Tue, 24 Mar 2026 18:43:06 +0100
In-Reply-To: <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
	 <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 93.197.95.41
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_104318_433710_0CEC9219 
X-CRM114-Status: GOOD (  14.98  )
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

Hi Ilpo,

On Tue, 2026-03-24 at 18:56 +0200, Ilpo J=C3=A4rvinen wrote:
> Aligning res->start by align inside pcibios_align_resource() is
> unnecessary because caller of pcibios_align_resource() is
> __find_resource_space() that aligns res->start with align before
> calling pcibios_align_resource().
>=20
> Aligning by align in case of IORESOURCE_IO && start & 0x300 cannot ever
> result in changing start either because 0x300 bits would have not
> survived the earlier alignment if align was large enough to have an
> impact.
>=20
> Thus, remove the duplicated aligning from pcibios_align_resource().
>=20
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  arch/m68k/kernel/pcibios.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
> index 1415f6e4e5ce..7e286ee1976b 100644
> --- a/arch/m68k/kernel/pcibios.c
> +++ b/arch/m68k/kernel/pcibios.c
> @@ -36,8 +36,6 @@ resource_size_t pcibios_align_resource(void *data, cons=
t struct resource *res,
>  	if ((res->flags & IORESOURCE_IO) && (start & 0x300))
>  		start =3D (start + 0x3ff) & ~0x3ff;
> =20
> -	start =3D (start + align - 1) & ~(align - 1);
> -
>  	return start;
>  }
>=20

Sorry if it's a stupid question, but what does "am68k" in the subject refer=
 to?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

