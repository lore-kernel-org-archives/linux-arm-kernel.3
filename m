Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B50C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aW7Z4UKbxktPS4MaepHxqf+DbrSQTTsdz9FCAgfvEQ=; b=y9+sz86OJwmCJ1O3FzueOPLvoC
	79VAMit1tqr2H4ZOu0Lanb8Feu73DqKJbd08jBdGaBfGAPFb8fhK7NV5YfY7Acl2/jVM0UB5QASlp
	tbFdXARgaerSpIrsTH9qrufiTAz2E98YduTXenJODA1Y1GszbmaRLfthsfLhdCC3M2s93ygSV025l
	Zn4XNRlk5VhqECfisuCodpd7AgnbEq3tdq3hEhHqPpB9Ui4pdIo+Hm8WfyJ6X8ZjBKYnnu62e6bGg
	1niWD41G39JI+xgVEEfyESvWnVnPV6HtcaTsTyuSlaldEwykqyNcb4JBXMnP5XKoJmg9GzOoDsDRq
	23mYl8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xaI-00000008her-3LvG;
	Wed, 16 Apr 2025 07:53:27 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xVO-00000008gWa-3oRH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744789702; x=1776325702;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=7aW7Z4UKbxktPS4MaepHxqf+DbrSQTTsdz9FCAgfvEQ=;
  b=O7I1P1fwtPfcbdNRApX5uLe7b5G/E3Pi4dgvgyBA3rdlegk5HUhA0l8A
   aN5VGEPI4iNZZnxlXuUgmQA5+JCRWA4N17bJ2NqNWXBuPP5JR1ZxB2M2a
   clOmKnjAfYeIpb58KkZcSoHHPWwVr1zCV2ycYsl/UJRl6PUc43JmXtpod
   dDVVF6rsVym4P2HW/uZ/H9yGLWbpynCq5ijUItfCX6Ndjzqt6d57VkEb1
   bj/qkTiNNQw8+kC5ZRErwOWNo/38naPC8jMTzYlqh6sEgHzf5iR4n6Nmi
   noHhOJFKOPw8uZ17A6FCDb4CWyBm/TS11PvYuY4QeLlimvpsqLbTSfrTx
   A==;
X-CSE-ConnectionGUID: 40LsbEOEQRiOB0DgIF7Vtw==
X-CSE-MsgGUID: zhfq6v8tSkSbamkypAuoSA==
X-IronPort-AV: E=Sophos;i="6.15,215,1739833200"; 
   d="scan'208";a="43559241"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 Apr 2025 09:48:19 +0200
X-CheckPoint: {67FF60C3-51-2417938-F0170C2B}
X-MAIL-CPID: C1F86517FBCAB0ED58083B4ED47BF749_2
X-Control-Analysis: str=0001.0A006396.67FF60C0.0053,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEFE7167BA8;
	Wed, 16 Apr 2025 09:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744789695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7aW7Z4UKbxktPS4MaepHxqf+DbrSQTTsdz9FCAgfvEQ=;
	b=Utg1IVm2aLPjKEu3z8TbqZySUXUoHt++UW7xuELrTvjAmmm9tIhos26SKan/GalSkemTOL
	Fk9h5nsoD/wH6jMTzwCBPmqzpNExikWK2RnVW9kY6WXcvvZALAu7F+ptEo5JCMJsdiFGUO
	++Lfssy63Fl7cWgW8vnwmvJZzKjwYdcW9WwigXvLWmVeB+sdZXSdwZgMD4cpBN6L59xJEX
	ZbJ0ISdTOXsQwmCd4jKnVU1LdVA0qHUePTEHqY2UtJo352NuL7OrOGsnoCKmTtRw2rd7aT
	S3Jc6lbVm4iQjHSQYdOhg0RhSmEw/DwIsqKXtp2ePRx1Ez47eixZgLikWDKj8Q==
Message-ID: <800a61d80a2c6cfa4a5a64d904a2127e60eafc29.camel@ew.tq-group.com>
Subject: Re: [PATCH net-next 4/4] checkpatch: check for comment explaining
 rgmii(|-rxid|-txid) PHY modes
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Joe Perches <joe@perches.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,  Siddharth Vadapalli <s-vadapalli@ti.com>,
 Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, Andrew Lunn
 <andrew@lunn.ch>
Date: Wed, 16 Apr 2025 09:48:12 +0200
In-Reply-To: <f3acd53796a44576408a2a14aa5baaed@perches.com>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <16a08c72ec6cf68bbe55b82d6fb2f12879941f16.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <f3acd53796a44576408a2a14aa5baaed@perches.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_004823_304350_F77C214E 
X-CRM114-Status: GOOD (  16.21  )
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

On Tue, 2025-04-15 at 09:11 -0700, Joe Perches wrote:
>=20
> On 2025-04-15 03:18, Matthias Schiffer wrote:
> > Historially, the RGMII PHY modes specified in Device Trees have been
> > used inconsistently, often referring to the usage of delays on the PHY
> > side rather than describing the board; many drivers still implement=20
> > this
> > incorrectly.
> >=20
> > Require a comment in Devices Trees using these modes (usually=20
> > mentioning
> > that the delay is relalized
>=20
> realized
>=20
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 784912f570e9d..57fcbd4b63ede 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3735,6 +3735,17 @@ sub process {
> >  			}
> >  		}
> >=20
> > +# Check for RGMII phy-mode with delay on PCB
> > +		if ($realfile =3D~ /\.dtsi?$/ && $line =3D~=20
> > /^\+\s*(phy-mode|phy-connection-type)\s*=3D\s*"/ &&
> > +		    !ctx_has_comment($first_line, $linenr)) {
>=20
> Not sure where $first_line comes from and unsure if this works on=20
> patches rather than complete files.
>=20
> Does it?

Yes, it works both with patches and full files. I'm using ctx_has_comment()=
 the
same way existing checks do - I think $first_line refers to the start of th=
e
current context for patch files. I have also verified that it only matches =
on
comments directly above the phy-mode line in question.

Best,
Matthias



--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

