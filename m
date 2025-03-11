Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63249C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 20:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+X7hgr7jF2if8yShSezZxlfQeaoI5V4WeDPLfqIDNcs=; b=w7rjKVgtOFGCF6gK6nOWIqexZi
	7+rlGezr1CuBod48a5SgjRh1+Xyq7Mqmjru+Kgecff/Pt9r8v1OJ59l5KMk+tBg7wvI0FW/vpnzQA
	Eh89TnHxPzYKfZsGMxVYUpQY9WZYJ7v0Xany4k6tIOLAplOeh8PMkGntaJxqOJ3axVQC6vksGi340
	8jkuF+6X6y+bjn5wo3NkoguC21gkmaTki4UdAq8juU4yL3jQZWmCPrYoptN9AWWSObevL7QUicWMd
	KOcT7GVjOBxIFWHIGIoydHciOxgwdUD5MWl0ng9jO2v0drCXAHZnaRXH9oTYWXINJIH3uyZ4Zshm6
	4wXXMpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6av-00000006yCu-0zWp;
	Tue, 11 Mar 2025 20:52:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6ZG-00000006y48-3ZH5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 20:51:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0478CA467B5;
	Tue, 11 Mar 2025 20:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EE5C4CEEA;
	Tue, 11 Mar 2025 20:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741726273;
	bh=+X7hgr7jF2if8yShSezZxlfQeaoI5V4WeDPLfqIDNcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uQ6+6LZ8UwEXAS1h+f6cX3MVwFEGEtxRo99VIVLKzcJN1MFwNcOOi8eoQ38soJjzt
	 ss6UFGhzUPIUqnlb58/VUBhhWxpPSKORACRWj1HTz64GzriG7bSiEfGkwSOVpGL1FP
	 XXsV+Hopn6XSBx3z/44uYFnhmIgz78WT9jA5KiS9TdhFaY8e3NeeXoKtYmP3rqnEk/
	 pmgLhxnseLnwiqua1mvRGzLZgiGeGXadacDsJUisihHnlW/KQ+7RP0NmSYk+fg1Z6S
	 AU+Nzi0OP9NX0fqQMznqSXud+LCGp08xgAyWN+Rc6YtnSR816ES712EzL8+SAV/eFK
	 aGRej0e3PRRqQ==
Date: Tue, 11 Mar 2025 20:51:07 +0000
From: Conor Dooley <conor@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"rui.zhang@intel.com" <rui.zhang@intel.com>,
	"lukasz.luba@arm.com" <lukasz.luba@arm.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the
 TSU unit
Message-ID: <20250311-immature-quit-81066aec062e@spud>
References: <20250227122453.30480-1-john.madieu.xa@bp.renesas.com>
 <20250227122453.30480-4-john.madieu.xa@bp.renesas.com>
 <20250228-shampoo-uprising-44ae0d3bd68b@spud>
 <OSBPR01MB2775DFC184F78E9FB50F28FFFFD52@OSBPR01MB2775.jpnprd01.prod.outlook.com>
 <20250307-everyone-ragweed-e05a10a9646b@spud>
 <OSBPR01MB277531D7C872C9EB0B287069FFD52@OSBPR01MB2775.jpnprd01.prod.outlook.com>
 <20250307-barbell-pretzel-368d6a4d1336@spud>
 <OSBPR01MB2775D121B55A0C543F251BAEFFD72@OSBPR01MB2775.jpnprd01.prod.outlook.com>
 <20250310-blurry-scam-bee8233878bc@spud>
 <OSBPR01MB2775B3826A9FE602AC08172BFFD12@OSBPR01MB2775.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+5vlRAFPk4HzuSfw"
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2775B3826A9FE602AC08172BFFD12@OSBPR01MB2775.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_135115_014899_5509FDE6 
X-CRM114-Status: GOOD (  31.72  )
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


--+5vlRAFPk4HzuSfw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 11:24:59AM +0000, John Madieu wrote:
> Hi Conor,
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Monday, March 10, 2025 5:15 PM
> > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > Subject: Re: [PATCH v2 3/7] dt-bindings: thermal: r9a09g047-tsu: Docume=
nt
> > the TSU unit
> >=20
> > On Sun, Mar 09, 2025 at 10:39:27AM +0000, John Madieu wrote:
> > > Hi Conor,
> > > > > Changes are not possible at runtime. Some customers may want
> > > > > software, while other may want the external trigger, and this is
> > > > > immutable configuration.
> > > >
> > > > What makes it immutable? Set by some wiring on the board? I couldn't
> > > > find the user in your driver patches to better understand how you
> > > > were using it.
> > >
> > > I haven't prototyped ELC trigger yet. Since the hardware manual
> > > describes about ELC trigger, I have documented it in bindings. If you
> > > think, it is not needed at this stage, then I can drop it now and
> > > revisit later.
> >=20
> > Ideally a binding is complete, even if the driver isn't. To me "immutab=
le"
> > would mean something like "the trigger type is determined by hardware or
> > firmware configuration", but if it is determined by register writes (e.=
g.
> > wired up for elc trigger, but you can opt for software trigger in the
> > driver) then it should be a userspace control.
>=20
> It is complete, and I confirm, this can be changed by register writes.
> Apart from defining default to 0, should I implement userspace change
> support now ?
>=20
> Or should I keep it as it is, just setting default to 0 (thus making
> the property optional), and add support for userspace change when I add
> ELC support.
>=20
> My other question is, in case I must add userspace change support now, wo=
uld
> sysfs be Ok ? If yes, is there any path recommendations ?

How to change it from userspace ain't my domain, sorry. Just drop the
property since isn't something determined by the hardware, but rather by
what you put into the registers.

--+5vlRAFPk4HzuSfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9CiOwAKCRB4tDGHoIJi
0rLpAP4nP6wGoxRKYgBDm3VvemmjsSAGmmOqP64lzu3zDlgH6gD/YvTeAmTBk8Zp
oIKYspNwcyW/0MPrFQ7FL7dkEyoCAgM=
=VZy1
-----END PGP SIGNATURE-----

--+5vlRAFPk4HzuSfw--

