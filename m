Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620F6D44D58
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CWv4ZrN6M3umim2LLfIUNFU4R1eAAmA4QqWSrrVLmg=; b=0wVQaBRwFyqwkrJ9aDfIMXb39V
	/B8wWrjD6che5HHedLRQyPeivawOeEYAU6+jiYBY6yG7TdwH3Oof0QzLTNTS9OtDYnzSnVvX/DTGw
	EI5D2L/P6NTAWIAt8SPHtAaKbPVhG9sEOUdy/k/WiyLLSJ8siFDHH6Qa0iTxUZpzeZX8Ao4ZdmD36
	pCwL/V7JuEuc5jpwNn0zHWs/sf4gsw6QR7Mv9W/nGChk4GNmFuHSCUp0quZHFjIERbo/+H4oFf4NK
	KN9Rl8mIVlX/JYxS5+MLabpN+VBCgaeFNknAohpbWrtTwgzFqq3C2rVhY/rGnpnTiujlgJD0qHZPb
	/Ae77Tqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fu7-00000003NP9-1dGi;
	Wed, 06 Nov 2024 13:16:59 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ekq-000000035W1-1I8T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 12:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730894600; x=1762430600;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1CWv4ZrN6M3umim2LLfIUNFU4R1eAAmA4QqWSrrVLmg=;
  b=cnHr74encH/Jnexjg6nI9YPIvfrWNv9k1xUhZXtAY4OyMV6R1foHsHxz
   Vi21V1K1ZCenjQ9LK2o8SSX228ifFEzKPZ6MO395A2gqbhNEswYnCGUuZ
   QEpdUjPejmI1Cj1k3910Z/3TrvX1VPcshNIdqN8IsxKM83j1fhcsoq9s9
   OSBpvYQdS1oP/jPMdfHhFlgaKFs4XrHcr/nXrf27pafA/8IhX+uW4oBww
   hFfOsTxS1wCVb8m2XqIypT2WmOTJOFBA8qofqBMhU+ts6y5H45Xgy2cUb
   VsmiwwYV8dc7bnMhG9O6A36ta2MpIblMEVD4/yflAtIkC+mEywD65b4Ed
   Q==;
X-CSE-ConnectionGUID: pieM1AbNRD6bZ+HIIGuvjQ==
X-CSE-MsgGUID: 1wL/Ebm/RdSAD34uMIIljQ==
X-IronPort-AV: E=Sophos;i="6.11,262,1725314400"; 
   d="scan'208";a="39884327"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 06 Nov 2024 13:03:15 +0100
X-CheckPoint: {672B5B03-9-F5DC7025-F79421CB}
X-MAIL-CPID: B8FDA72FF4EEA00CCDDAD8EBC4F3B464_0
X-Control-Analysis: str=0001.0A682F15.672B5B03.0084,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4631160A4D;
	Wed,  6 Nov 2024 13:03:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730894590;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1CWv4ZrN6M3umim2LLfIUNFU4R1eAAmA4QqWSrrVLmg=;
	b=MyqruMMCwaAn1/83WQVkFqBBlZ1w8xmo0WnnBSJnD7J4C0rko59siM7kzBf59ilTvHN9+G
	cV/4oFPHvjr3iBu/MQXsr4YrhXWnaQ1bFfQjN/aIGXgFF1ModNW+G9f+6XFw+YNrBXN+8a
	IUnleI+sDdPKmbFxR8KyOIcZwO7LoPZha5x2dpyDPlRB+1ebpk3j4U/s/o8zJ45zxSXuWi
	jupDOroZj1O1onje3FOuBTiYFIKbu2A8EbYxx62wKbGocRBVHD5gRrH3CpoyR1zeFED1MO
	t/5njui1invUIQxBVKECokbIZby+fzf4m8dQXmpucYI1MnMAvFLiV8d/falphw==
Message-ID: <7286141141fe4930cd2581dac7a1fb36a98e62c4.camel@ew.tq-group.com>
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
Date: Wed, 06 Nov 2024 13:03:08 +0100
In-Reply-To: <20241105-tinsmith-countable-fbb51045bc98@spud>
References: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
	 <4f5ad877f44df35a3b2c7f336647f057c4e6377d.1730299760.git.matthias.schiffer@ew.tq-group.com>
	 <20241104-floral-dexterous-7d3fee2ff616@spud>
	 <c73cac598788ccabd1791b1232e8fd9d7ce23ac6.camel@ew.tq-group.com>
	 <20241105-tinsmith-countable-fbb51045bc98@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_040320_924409_C5CBBB04 
X-CRM114-Status: GOOD (  17.85  )
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

On Tue, 2024-11-05 at 18:55 +0000, Conor Dooley wrote:
> On Tue, Nov 05, 2024 at 11:40:20AM +0100, Matthias Schiffer wrote:
> > On Mon, 2024-11-04 at 18:47 +0000, Conor Dooley wrote:
> > > On Mon, Nov 04, 2024 at 10:47:25AM +0100, Matthias Schiffer wrote:
> > > > The TQMa62xx is a SoM family with a pluggable connector. The MBa62x=
x is
> > > > the matching reference/starterkit carrier board.
> > >=20
> > > Why all the wildcards? Why isn't there a compatible per device in the
> > > family?

Because all variants use the same Device Tree. There is also only one compa=
tible and one (main) DTSI
for the AM62 SoC family, which our Device Trees are based on.

> >=20
> > For the compatible string we've chosen the TQMa6254 as the representati=
ve for the TQMa62xx family.
>=20
> And all the boards in the family are the exact same?

There is a single TQMa62xx PCB, which has some AM62 family SoC installed (A=
M6254 in the case of the
TQMa6254, but all AM62 are possible). TQMa62xx is also the name used for ma=
rketing when not talking
about a specific SoC variant:
https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma62xx/

Some SoM variants with different RAM/eMMC/SPI-NOR/... do exist, but they do=
n't have separate device
trees (firmware may patch some variant information into the DTB however, li=
ke the correct RAM size).

Choosing one representative for the family including the SoC variant number=
, but not distinguishing
minor variants matches the level of detail used for our other SOMs already =
supported by mainline
Linux (like the TQMa64xxL and various i.MX-based platforms).

Best,
Matthias



>=20
> >=20
> > MBa62xx is the proper name of the baseboard; this board can be combined=
 with any TQMa62xx family
> > SOM.
>=20
> Then that one is fine.
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

