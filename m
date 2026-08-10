Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D44EC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 07:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gyrSdskpslfusFBBfR73eDcHeyV8yjI2Q/eXGOuFuo=; b=5BDeVu/iG1Yhaa9qPBlT99S1nS
	y3bETH8is4RWVnVXLCEoM/df+AgrO3iK0WsKu2FCK/nssEPwuJELGuopU8XEj4pH8u8kBMwAEuo3v
	4kfXiZ7HxVzx10vty9lGXCbiHCwzW4H1kAqyLL49+/5zC+A+YTDzIOX45+7ptqRU5dLfpHqq/djis
	Dar7ivv4DCCkgBtAXwpVm+xAN5ST7nbs488uWLLRed7NDwv62hiraR7fkDa3TVgMgDT7Pjo0gxE3n
	iYD6kITP1knLursvcKBHUghB1OvaYBk60ixl31M4vY13tvmns0S+c1/P5SZjC9pCUjny2thjvYOcQ
	m2LQuMSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKGz-0000000BBbT-1RbM;
	Mon, 10 Aug 2026 07:18:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKGx-0000000BBbK-46FI;
	Mon, 10 Aug 2026 07:18:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id B926043723;
	Mon, 10 Aug 2026 07:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 213421F000E9;
	Mon, 10 Aug 2026 07:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346291;
	bh=/gyrSdskpslfusFBBfR73eDcHeyV8yjI2Q/eXGOuFuo=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=ht7YkR4ZQMhiuJVCRJDn0duFNcD4TJCESMzgU32zZNHz5zMYvtuzErso08vh2v8sx
	 8xWTpcfN2kH+IgvxBmvJ/EG2LH41Ka3wqwoKtheX+fo4h5fjD2lME6m4w/nCwMml3P
	 3QUXwU/Z7S2xwnTmSfQr5VfIItWmNjd7+0XoGo3Cv/R1PUJr5f+Zdtz7qINbg6hAOH
	 ePttNkTC+3+98yR/CRhEXVU4xMBmqSzErHdPdkdZDrRN4daIHuiX0lpigo7izzHvdZ
	 eLZgSsHsbgs2+e+eCn3mw7ieaTw1JDbyD8nixj7IMkuIDuUHk6WoN2sEBi229DPcT7
	 KuipZFu+QyocA==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=13a01c95f75a3546217a7a3c753d9f94743043e10445b018a7b3a2b035cd;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 10 Aug 2026 09:18:07 +0200
Message-Id: <DKL2WROHNLXJ.3239EBUTVXRQL@kernel.org>
Subject: Re: [PATCH 1/5] mtd: spi-nor: Refactor Read Status/Write Status
 support
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi
 Wang" <hsinyi@chromium.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com> <20260529-winbond-v7-1-spi-nor-rv-addition-v1-1-f3ae18502d5a@bootlin.com> <DJS8PQ5HZZG5.2YT956NCDX8MG@kernel.org> <87mrv2exwp.fsf@bootlin.com> <87se4rem0l.fsf@bootlin.com>
In-Reply-To: <87se4rem0l.fsf@bootlin.com>
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

--13a01c95f75a3546217a7a3c753d9f94743043e10445b018a7b3a2b035cd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 6, 2026 at 9:38 AM CEST, Miquel Raynal wrote:
> Hello Michael,
>
>>> One thing that comes to mind is hardware write protection. If
>>> there's nothing before that code which checks it, the verify might
>>> fail if the hardware write protection is enabled. So we should
>>> somehow check for that and drop the verify here.
>>
>> But how do you think we should handle it? Will the QE bit writing
>> verification fail if HW WP is enabled?

It should, because you cannot alter the SR.

> Looking into this further: we shall return an error if the QE bit is not
> set. It just tells the caller that quad mode cannot be used. Then up to
> the caller to either hard fail or just degrade into single mode (maybe
> because of a strapped WP). What we should do is to propose a DT property
> to flag when WP is strapped in hardware, this would make the content of
> the status registers immutable and we would just skip the entire write
> operation in the first place, instead of deliberately trying and get a
> 100% failure rate. Nevertheless, the changes introduced here are kind of
> orthogonal and do not alter the current behaviour; we shall however
> listen if people start complaining about this and perhaps implement the
> solution proposed above.

There is already a property in the DT, where you almost certainly
know that quad mode is impossible. Iff there are four rx/tx lines
(spi-{rx,tx}-bus-width). I haven't seen a flash (even in larger
packages) where there is a dedicated WP# pin.

What do you mean by a dt property? If (1) the flash is using the WP#
pin? Or (2) if it is using the WP# pin and it's tied to low?

For (1) you have the QE bit, if it's set, WP is turned off and vice
versa.

For (2), that doesn't make sense, because that pin could be tied
to some kind of logic which can change during runtime.

FWIW, I don't care too much, you've asked why there is a
verification step, I've just answered :)

-michael

--13a01c95f75a3546217a7a3c753d9f94743043e10445b018a7b3a2b035cd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCanl7MBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ivEAGAsMkVRKvJLObfxSZr5iJJESQ9dSKn9XvY
wPyG4uJZ60myy/AbG9iEgj1buZdMkYJDAYCEDIatGObn8EIuLcPWWQ17E+4Kn79A
cn+VR068w1SOOat7Rz4UnYgMaQO4wLqYArE=
=AWWR
-----END PGP SIGNATURE-----

--13a01c95f75a3546217a7a3c753d9f94743043e10445b018a7b3a2b035cd--

