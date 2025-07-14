Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2132C83F28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 10:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKlfhggKlOIGxvSFvIANQzO+iVOz60Z2guplptlzY1Y=; b=Quv3xlkgJkzXWCpUSJbUFKFShB
	IGjiAmKm0u0KsvEXlvm9ONC96Wha4CDfuoSn6tm+gyMRu/srpsGLCT/Y7MSVGgSbaPsIoMG24Cj8q
	0fMljq0XxrHg//RNGMcPh40YfLcZGOkj043IvzUn+TNqDfEJxdAnJPw6n4TZzX//Np+sL7UTUyMB8
	gTtmWXnk/dynGq8qSAtYMVaRnrctMXtoOTzngJc8rFCqhBqMDZ8zfYCIgT1enrEg9Kbv4FSzz/yLl
	HmUfVIQF4GmXPQEOKiLVNZdwoODDlZDKXu+nZwuPrYp9nuojCE3EJ3gG0mZrt0xg4QPl0sTahCRhg
	wLeJ7XEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGFG-00000001ta8-2o6j;
	Mon, 14 Jul 2025 10:17:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubG06-00000001sEP-2hO5
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Jul 2025 10:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Content-Type:Sender:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZKlfhggKlOIGxvSFvIANQzO+iVOz60Z2guplptlzY1Y=; b=QmGU/rL6HRPZBxmK/wYMmr9beO
	TRoL9kwdeG74N+W5oYqRt3gp4e1VxF1TLH4X4ukH9MAIUGyGA6jyljQ6ZqhI0B8ZRF0pSk6ZH2f5H
	5Y8/Afibe5x9y7YYh9dj/B85SjCsl13mul1MaiLTOvi2Vrqo7V6EBFdtsMrLT2Q+nRQsZSa5SXDQ+
	lgSz1T97FPDFq9GnstjYIetlrdli/4m5WjsDMGGodyW28MdhnxBcuhda+hKVfVuri+iN9mWSplu9e
	MX23cguomMpXI/J0PUv/1OV4KmCa1FFfq1arvbaU4N5W5A47zwerLe2gZab8yJmYK/nxB1C1P+a53
	a66sMDJw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubG03-00000009kAu-1Rul
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 10:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D4BC5C5B0A;
	Mon, 14 Jul 2025 10:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6BDC4CEF4;
	Mon, 14 Jul 2025 10:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752487286;
	bh=ZKlfhggKlOIGxvSFvIANQzO+iVOz60Z2guplptlzY1Y=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=XPUYUyDOrK0FSN+4dyPJeGlrPyYOJM7q09+vkQofRG/pj1O/veGZ2pE7Aq/f6GD9K
	 Etix9fjIL6c4HjGLCnxWZb+nIRtWPEkKoxW4PYLiA56idW3NyRaL7XGp/tKApXJnKQ
	 jA8mhnSMgU1HCd8LU5pD0WCKGBWHyNbh3MizHMfo718GIH5xcssUlo05sn7Fk9RVwp
	 OEkjr2KWuVYsyiqp2nG3CwVvaSUaOnm7qQlcBxE9vS8roE4DWWUs3CU+wO29blpmSU
	 lRCSlV52P95O2ztQVwZ316rHSNmQU5v/SEDZ8ofHZ/mMjvY9H75YxIJaawN4dqY3Hg
	 p9sOf52nUeBYw==
Content-Type: multipart/signed;
 boundary=387ade367386a6356486f6ee7b635420fbf56ee5ca28a94e7e0254cdeefb;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 14 Jul 2025 12:01:22 +0200
Message-Id: <DBBOW776RS0Z.1UZDHR9MGX26P@kernel.org>
Subject: Re: [PATCH net-next v2 2/3] net: ethernet: ti: am65-cpsw: fixup PHY
 mode for fixed RGMII TX delay
Cc: "Dwaipayan Ray" <dwaipayanray1@gmail.com>, "Lukas Bulwahn"
 <lukas.bulwahn@gmail.com>, "Joe Perches" <joe@perches.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Nishanth Menon" <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Siddharth Vadapalli" <s-vadapalli@ti.com>,
 "Roger Quadros" <rogerq@kernel.org>, "Tero Kristo" <kristo@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux@ew.tq-group.com>, "Maxime
 Chevallier" <maxime.chevallier@bootlin.com>, "Andrew Lunn" <andrew@lunn.ch>
From: "Michael Walle" <mwalle@kernel.org>
To: "Matthias Schiffer" <matthias.schiffer@ew.tq-group.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Andy Whitcroft" <apw@canonical.com>
X-Mailer: aerc 0.16.0
References: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
 <9b3fb1fbf719bef30702192155c6413cd5de5dcf.1750756583.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <9b3fb1fbf719bef30702192155c6413cd5de5dcf.1750756583.git.matthias.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_110131_764028_A23C66FC 
X-CRM114-Status: GOOD (  11.58  )
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

--387ade367386a6356486f6ee7b635420fbf56ee5ca28a94e7e0254cdeefb
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue Jun 24, 2025 at 12:53 PM CEST, Matthias Schiffer wrote:
> All am65-cpsw controllers have a fixed TX delay, so the PHY interface
> mode must be fixed up to account for this.
>
> Modes that claim to a delay on the PCB can't actually work. Warn people
> to update their Device Trees if one of the unsupported modes is specified=
.
>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

For whatever reason, this patch is breaking network on our board
(just transmission). We have rgmii-id in our devicetree which is now
modified to be just rgmii-rxid. The board has a TI AM67A (J722S) with a
Broadcom BCM54210E PHY. I'm not sure, if AM67A MAC doesn't add any
delay or if it's too small. I'll need to ask around if there are any
measurements but my colleague doing the measurements is on holiday
at the moment.

-michael

--387ade367386a6356486f6ee7b635420fbf56ee5ca28a94e7e0254cdeefb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaHTVchIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hHLwF9E9ztKCoOYS0RHC6gA9ZJQpIMkhGKEO9j
1KseN/0Iehs3rgSim31YE3mtYR6pufKrAX9dE6aY41tiyR4+KV9wg5ozGle9rDLz
8veF90sPBa1PQS56tKbBI4rDvyOKhE7FUtM=
=BTle
-----END PGP SIGNATURE-----

--387ade367386a6356486f6ee7b635420fbf56ee5ca28a94e7e0254cdeefb--

