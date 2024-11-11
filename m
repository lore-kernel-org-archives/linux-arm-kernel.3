Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39887D2E9D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 10:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqchIAOV+ujAuuqGpj2VFndIG4Bf4mSoSDUOyVmgWy0=; b=RmLdAt1dPRxMC2WhHQ1fm/tCuT
	n/e56M7BeeutIIg6sO+jvlG87U0t/RG7GETp5QgMzO8iUAAkzyXOzoSQHcopDvre7RPAH5Cz2FaKz
	bNmvkFH0J9g4LYMxVxZ2P8oeYoUseU8T0o5pppbD1nOgt7j8jrArTCA/vZlHCKgtQw5jjfxXGyFf7
	U7vumvJpakEVh82tgmSmOSEsiOTHOBzJhExjA7tHLUazaoV5BzmELpXzi1qawG67nVrstd3ZebLtD
	lM1Um+69Ebpq7dpJiBciG8BM4/a0KTWJK+sIrBTHJwjNcBuvc+BYN7GhXgGrcuhvFSCVh2N4FSmqd
	Cx9VEqBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARLk-0000000HEMm-1nuF;
	Mon, 11 Nov 2024 10:08:48 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARCQ-0000000HCAy-2GCw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731319150; x=1762855150;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=oqchIAOV+ujAuuqGpj2VFndIG4Bf4mSoSDUOyVmgWy0=;
  b=Cj7+tD/ht2NYYofEPj96DOxzHKZgREtl6o0/xW+EZKV26ZmKL/LsI5lD
   M+QQRQLlIJC8qiAlkJipyy0SkztSjSOHWd8iYCW0iicrLWOHibLwfudv2
   Odd2Z+F25IHrU9c7IKddNY/LxBwlpr8Jv9x9TMZXlfrOaA9ON4NCOMFBX
   2rM4kSfjdMG4MMkFm7myVU4OlkSfePeT7eXOxAXM3VxwVVdquKLr094Hp
   +rKMvxex3OWrvKEGKnDDBOTcn9+LlTOmAF4e2tR+Qotzm7fmzOAGNdu8R
   oPCHCjoUqn/IASi3haUCPqS2CzgnLMnbNgiQyeXbKRXFg1flfv+pTkBUx
   g==;
X-CSE-ConnectionGUID: bLzZoMNiTlC78uJSz6rOag==
X-CSE-MsgGUID: fLtsWKQiRT+AHbmP2bbOBQ==
X-IronPort-AV: E=Sophos;i="6.12,144,1728943200"; 
   d="scan'208";a="39960460"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 11 Nov 2024 10:59:04 +0100
X-CheckPoint: {6731D568-30-D31EDE1A-D52D6119}
X-MAIL-CPID: 072718E0F89994E832C944FEBBA3E4C7_5
X-Control-Analysis: str=0001.0A682F25.6731D569.005A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01EFA165700;
	Mon, 11 Nov 2024 10:58:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731319140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oqchIAOV+ujAuuqGpj2VFndIG4Bf4mSoSDUOyVmgWy0=;
	b=K2zNtideaFnscstKqfITpwJxPHlZA+t9kTzTL9KSiI52w4VBrqmDKo1sX/5+uHpgJMPpGi
	/KJV7gskuxM30VoCmQSkQEA3Ou/4t3wdza8k8GL2qQVfyBFSVPuIASlfHaIhBve4siYqcu
	o8Fe86VdngGAsIuOIqMy+NWrg+Ycj0tCDAMplZP8KRMjXOooVjmxHPt4QLUQF4uGR4fW33
	Z0ycB9lqfIxhALVFWdHv6iNmmzcRKCGcSVEF89XxYZN35jJwpi+Wd/ExWPGdLjKRHfGagp
	d8XRWCbP7Zi94OJhOHMIgoXCtGZ8iWiyfwV53JxTFOQyARUUaJDOMbSWV9Qdgg==
Message-ID: <068c22af19c07a7c79bb4abb0366a2505b4b1aae.camel@ew.tq-group.com>
Subject: Re: [PATCH 2/5] dt-bindings: arm: ti: Add compatible for
 AM625-based TQMa62xx SOM family and carrier board
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Conor Dooley <conor@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Felipe Balbi <balbi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>, Hari
 Nagalla <hnagalla@ti.com>, linux@ew.tq-group.com
Date: Mon, 11 Nov 2024 10:58:57 +0100
In-Reply-To: <20241106-happy-anything-46f7293f6aca@spud>
References: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
	 <4f5ad877f44df35a3b2c7f336647f057c4e6377d.1730299760.git.matthias.schiffer@ew.tq-group.com>
	 <20241104-floral-dexterous-7d3fee2ff616@spud>
	 <c73cac598788ccabd1791b1232e8fd9d7ce23ac6.camel@ew.tq-group.com>
	 <20241105-tinsmith-countable-fbb51045bc98@spud>
	 <7286141141fe4930cd2581dac7a1fb36a98e62c4.camel@ew.tq-group.com>
	 <20241106-happy-anything-46f7293f6aca@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_015911_102373_E304C6AC 
X-CRM114-Status: GOOD (  27.86  )
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

On Wed, 2024-11-06 at 16:40 +0000, Conor Dooley wrote:
> On Wed, Nov 06, 2024 at 01:03:08PM +0100, Matthias Schiffer wrote:
> > On Tue, 2024-11-05 at 18:55 +0000, Conor Dooley wrote:
> > > On Tue, Nov 05, 2024 at 11:40:20AM +0100, Matthias Schiffer wrote:
> > > > On Mon, 2024-11-04 at 18:47 +0000, Conor Dooley wrote:
> > > > > On Mon, Nov 04, 2024 at 10:47:25AM +0100, Matthias Schiffer wrote=
:
> > > > > > The TQMa62xx is a SoM family with a pluggable connector. The MB=
a62xx is
> > > > > > the matching reference/starterkit carrier board.
> > > > >=20
> > > > > Why all the wildcards? Why isn't there a compatible per device in=
 the
> > > > > family?
> >=20
> > Because all variants use the same Device Tree. There is also only one c=
ompatible and one (main) DTSI
> > for the AM62 SoC family, which our Device Trees are based on.
>=20
> So what varies between the members of the family?

There are currently 6 SoCs in the family:
- AM6254
- AM6252
- AM6251
- AM6234
- AM6232
- AM6231

They differ in:
- Existence of GPU (AM625 vs AM623)
- Number of Cortex-A53 cores (last digit)
=20
All of these use ti,am625 as their SoC-level compatible. The differences ar=
e currently handled by U-
Boot, which checks various feature flags in the SoC registers and patches t=
he OS DTB accordingly by
removing CPU nodes and disabling the GPU node if necessary.

>=20
> > > > For the compatible string we've chosen the TQMa6254 as the represen=
tative for the TQMa62xx family.
> > >=20
> > > And all the boards in the family are the exact same?
> >=20
> > There is a single TQMa62xx PCB, which has some AM62 family SoC installe=
d (AM6254 in the case of the
> > TQMa6254, but all AM62 are possible). TQMa62xx is also the name used fo=
r marketing when not talking
> > about a specific SoC variant:
> > https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma6=
2xx/
> >=20
> > Some SoM variants with different RAM/eMMC/SPI-NOR/... do exist, but the=
y don't have separate device
> > trees (firmware may patch some variant information into the DTB however=
, like the correct RAM size).
> >=20
> > Choosing one representative for the family including the SoC variant nu=
mber, but not distinguishing
> > minor variants matches the level of detail used for our other SOMs alre=
ady supported by mainline
> > Linux (like the TQMa64xxL and various i.MX-based platforms).
>=20
> I don't like any of this wildcard stuff at all, who is to say that the
> next soc you put on your SoM won't be an am62a7, which has a specific
> compatible in the kernel? Your fallback then would be ti,am62a7 not
> ti,am625. Probably someone will say "that's the am62a family not the
> am62 family" - but that exact thing is why I hate all of this
> wildcarding. It's barely any more effort to have a tqm6231 and a tqm6254
> compatible than what you're doing with wildcard but it is unambiguous.

Our intention here is to have one SOM compatible string for each SoC compat=
ible string. As all SoC
variants use the same compatible ti,am625, we've chosen to do the same (usi=
ng tq,am625-tqma6254 as
the representative.) A hypothetical SOM using a ti,am62a7 would obviously n=
ot use the
tq,am625-tqma6254 compatible string.

At no point we're including wildcards in our compatible strings - we're reu=
sing a specific
compatible string for multiple compatible variants. Or is what you're takin=
g issue with the wildcard
in the description string in the YAML? That one I don't have much of an opi=
nion on.

Best,
Matthias


>=20
>=20
> =C2=A0

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

