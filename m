Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0A9C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dd/5Px/F9IuikFlpnjP8bxiqM2ZSWPgSpxK2sGkLbZ8=; b=i8eYWMobCYZwMXBsjJTfzYh5or
	IxI3ufegndDfVLZjev68Ze33tUODrjMdJkd5AcaUjmsPi8SA3iiyjnEgORRQcqGyk6zt9AWAZ180v
	Qc3bIoVm+sMfZoBpez3vOPsTUmEyZNqan5DIDEsTx1Q57xlOkTJkw80WnErrtgpaKxnkB2cP8cMud
	HA60zmikWgbgKG92FgnEMt/8Hz8SE+7j4osYhVyvIG55ATPRcBIcDQJzIxLkO/YKID0CYmuhz7nRE
	C4dCqu7SmJScvpmTXXbSTYE+2XcIkj84ea3VtpY4PJYAIJM9nznU+kuyVX3mfj8281ZrBn8WMLY6B
	erF+pSPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gen-00000005yTD-3L6Q;
	Tue, 15 Apr 2025 13:48:57 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gUJ-00000005wef-3t0S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744724288; x=1776260288;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=dd/5Px/F9IuikFlpnjP8bxiqM2ZSWPgSpxK2sGkLbZ8=;
  b=LG9AvwlV4zHxz2OwrD6d3WW2EZKaJ501uE85sRLnOCral5RBAOHM6Rcp
   nO2vQuUY0IRUW4f1zTWm4Zld3H0Xm/32S5NNM7il70ImuRXIm/UpIBlOB
   8EIj1TdHDfSsga2yvaFS0aNvGZ555i6jPiMoy1YL1hc+uCL1KJxrSnU3s
   sFoyGibfyJbORWUNNv/XA6iPFrLiovOsdfDRqkwDPpzvfc8/iBV2wMoTR
   rjiYY/1q23rnMy2b66oWramrJT0hIvnPhARZOuf9W4qlQAXO3xYnwd+MT
   L3tsEp+V/KxHQ/CD0xmipSax7aYeE0Sai+TgkhOIVnE7FWfVq0CbIIqdt
   A==;
X-CSE-ConnectionGUID: 7CG+LNsBTBavByIdzUta9A==
X-CSE-MsgGUID: tHp09WNSSFWLPaU8u9Z0jQ==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43544216"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 15:38:06 +0200
X-CheckPoint: {67FE613D-31-2417938-F0170C2B}
X-MAIL-CPID: CB4D6A87F8E3381F1E4D34D623E7452D_2
X-Control-Analysis: str=0001.0A006370.67FE614B.000C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1AB21661B1;
	Tue, 15 Apr 2025 15:37:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744724281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dd/5Px/F9IuikFlpnjP8bxiqM2ZSWPgSpxK2sGkLbZ8=;
	b=e7+PfyrZ/AJ3fizvjDeYO41owEVjehzE44DjCMmbjQuHWldP5IfQhoBf/9Jw8Ks+ex1Ykw
	eW5KSMjdZTKSzEP2UzETo8inbTMFu4clfBW2Uwt7Mt9IDD9rmsDHIUtz+iG0r1EuOr9HrS
	Wj9DNc/wwwF+FRzfnpYD5wxVBwIwbxUR3advPXTXqHNRjjkeYXAFdJHzOjY57YOkl6sBYL
	upyvE7oROOy6MbhSQAdXhV5zNKMbOYbehKl02OKTNvA8rXKO80W2o/q+FDZnEX21ycGtXw
	l+wJA99dax0jjBVW5LBZgr4VQVkMMU7nKimucF6WtPmfbGkjMgYT6aOoYqNr8Q==
Message-ID: <9e0e6365a2c0151c819e442775ece37353468d91.camel@ew.tq-group.com>
Subject: Re: [PATCH net-next 4/4] checkpatch: check for comment explaining
 rgmii(|-rxid|-txid) PHY modes
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andy Whitcroft
 <apw@canonical.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, Jonathan Corbet
 <corbet@lwn.net>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros
 <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
 linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Date: Tue, 15 Apr 2025 15:37:59 +0200
In-Reply-To: <659d6affd7c58474c4bca5c92fc762925591d0d9.camel@ew.tq-group.com>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <16a08c72ec6cf68bbe55b82d6fb2f12879941f16.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <9d73f6ac-9fee-446b-b011-e664a7311eca@lunn.ch>
	 <659d6affd7c58474c4bca5c92fc762925591d0d9.camel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_063808_260942_24B58BCE 
X-CRM114-Status: GOOD (  24.58  )
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

On Tue, 2025-04-15 at 15:36 +0200, Matthias Schiffer wrote:
> On Tue, 2025-04-15 at 15:20 +0200, Andrew Lunn wrote:
> >=20
> > > +  **UNCOMMENTED_RGMII_MODE**
> > > +    Historially, the RGMII PHY modes specified in Device Trees have =
been
> > > +    used inconsistently, often referring to the usage of delays on t=
he PHY
> > > +    side rather than describing the board.
> > > +
> > > +    PHY modes "rgmii", "rgmii-rxid" and "rgmii-txid" modes require t=
he clock
> > > +    signal to be delayed on the PCB; this unusual configuration shou=
ld be
> > > +    described in a comment. If they are not (meaning that the delay =
is realized
> > > +    internally in the MAC or PHY), "rgmii-id" is the correct PHY mod=
e.
> >=20
> > It is unclear to me how much ctx_has_comment() will return. Maybe
> > include an example here of how it should look. I'm assuming:
> >=20
> > /* RGMII delays added via PCB traces */
> > &enet2 {
> >     phy-mode =3D "rgmii";
> >     status =3D "okay";
> >=20
> > fails, but
> >=20
> > &enet2 {
> >     /* RGMII delays added via PCB traces */
> >     phy-mode =3D "rgmii";
> >     status =3D "okay";
> >=20
> > passes?
>=20
> Yes, it works like that. I can't claim to fully understand the checkpatch=
 code
> handling comments, but I copied it from other similar checks and tested i=
t on a
> few test patches.
>=20
> One thing to note is that I implemented it as a CHK() and not a WARN() be=
cause
> that's what is used for other comment checks like DATA_RACE - meaning it =
will
> only trigger with --strict.

Oops, DATA_RACE is actually a WARN(). I must have copied it from some other
comment check that uses CHK(). Let me know which you want me to use.

>=20
>=20
> >=20
> > > =20
> > >  Commit message
> > >  --------------
> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > index 784912f570e9d..57fcbd4b63ede 100755
> > > --- a/scripts/checkpatch.pl
> > > +++ b/scripts/checkpatch.pl
> > > @@ -3735,6 +3735,17 @@ sub process {
> > >  			}
> > >  		}
> > > =20
> > > +# Check for RGMII phy-mode with delay on PCB
> > > +		if ($realfile =3D~ /\.dtsi?$/ && $line =3D~ /^\+\s*(phy-mode|phy-c=
onnection-type)\s*=3D\s*"/ &&
> >=20
> > I don't grok perl. Is this only looking a dtsi files? .dts files
> > should also be checked.
>=20
> It is a regular expression - the ? makes the previous character optional,
> matching both .dts and .dtsi files.
>=20
> Best,
> Matthias
>=20
>=20
> >=20
> > Thanks for working on this, it will be very useful.
> >=20
> > 	Andrew
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

