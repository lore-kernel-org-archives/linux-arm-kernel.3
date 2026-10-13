Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3756BCC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 16:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjjAyjBU3ZHFg4z47azZ/Od4tQNOANc9AyJ546IQj+E=; b=HhAS1bjmjpgYOcCLfd0hXvzQgd
	4uPhCkPPFOlK/qvo6nIHasswHhrQhLdKs/aJoCVI+H95SLnDFvvck2MHHt6sQiOha6GOU2nIqReVV
	OygDj9DwnMGJvP/joMbfsmg/ssHK66Rf5B6MuVqT+D/e9M9W3yZlRN1IHZXgpf/XQWXEG4ahlp3PW
	Vco/JOW8i5kTcYol/pi2KHC77IJQ+aQdOrMRDFKFCNi+ajTDMIHvnsVmUUjCHrWVdHMpUfQ4jhBRL
	m0Zq9ddxbtVZqqQ8/UzpQPdJCdn9oNUhpe+g/qKyOFEd0H9NdcsMeb5x7v8WQmFfM/oK4ULqcLFvM
	67JD2UlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfk8-0000000DbBS-1WDU;
	Tue, 13 Oct 2026 16:52:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfk3-0000000Db9T-0M0H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 16:52:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D170A43E05;
	Tue, 13 Oct 2026 16:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146A91F000FF;
	Tue, 13 Oct 2026 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910362;
	bh=EjjAyjBU3ZHFg4z47azZ/Od4tQNOANc9AyJ546IQj+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MRPfkvSgsYreau+FlHK4l6TZdXeSqfxnlgeH9mTyZ9Tdhh/jUk7nIuHdL5nWMD6dL
	 xIKpbWEVPRTEGIOLFJDOlY13m9j7GcE4j74wOihgmaYupV5Bf4NgDk+6185bis5igm
	 ddUoR6y297V6TZBDvPVXDjCSrdyKGjpPDMXjeMTzmKcMEHSQJZQXG8TMV0VL98K3cL
	 iRzm+WGF1GOuTevubpBPove9gRDCwSDOXlgCCX9vHR8m6RBQZICTlmgTMVKlHk5dsW
	 mdrSrGflAyn1USuBrRaCGDmxPgvwe/wZX6mew2neQm9cIuAD+cEprS4j4kLiykr3iN
	 6FQLVdx7Jrx6w==
Date: Tue, 13 Oct 2026 17:52:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 00/11] Cortina Systems CS75xx: interrupt controller,
 GPIO, I2C and TWD watchdog
Message-ID: <20261013-plastic-dragging-8232efb058ef@spud>
References: <20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com>
 <20261012-dreamlike-hazily-19bb60326f0a@spud>
 <179187542217.3247897.4323160442877168450@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9WsB/PUlVzPaxjR8"
Content-Disposition: inline
In-Reply-To: <179187542217.3247897.4323160442877168450@gmail.com>
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

--9WsB/PUlVzPaxjR8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 10:10:22AM +0300, Fil Dunsky wrote:
> Hi Conor,
>=20
> Sorry for the late reply, and for sending v2 and v3 without addressing
> this - I missed your mail.
>=20
> On Mon, Oct 12, 2026 at 07:48:00PM +0100, Conor Dooley wrote:
> > I think what's here looks really suspect - regions of two registers
> > wide, interlaced between devices etc.
> > You mention syscons here, and really that's where I think that this
> > should go. The region at 0xf007_0000 looks exactly like a syscon to me
> > and should be modelled as one.
>=20
> Understood. The block at 0xf007_0000 is the "peripheral" register block
> of the vendor kernel: the interrupt status/enable pairs, the UARTs, GPIO
> banks, the I2C (BIW), SPI, MDIO and timer registers are all packed into
> it. Would you be fine with a "cortina,cs7542-peripheral", "syscon",
> "simple-mfd" node covering it, with the interrupt controller as a child
> node without its own reg that gets a regmap from the parent? The UART,
> GPIO and I2C nodes would stay separate devices with their own reg, as
> you suggest below.

If things are just tightly packed, that's fine and you don't need to
make it a syscon. Just because something looks suspect doesn't mean that
it is actually wrong.

In your shoes, I think what I would do is leave i2c/interrupt
controller/gpios etc all as independent nodes.

I would however model the pinctrl as a single node, with
reg =3D <0xf000001c 0x14>
I think, rather than 5 instances 0x4 wide.

>=20
> > I think it's fine to make a GPIO controller at this point, and leave
> > pinctrl to later, but I don't think that it is acceptable to pretend
> > that the mux registers are part of the GPIO controller. The pinctrl-less
> > GPIO controller would have to either rely on something else (e.g.
> > firmware) setting the mux registers or be not entirely functional until
> > the pinctrl arrives
>=20
> Agreed. The next version drops the mux register from the GPIO binding
> and driver and relies on the boot loader's pin mux. A line that the
> boot loader leaves muxed to a peripheral then stays unusable as a GPIO
> until the pin controller exists; I will check which of the Almond+
> lines (reset button, touchscreen interrupt) that affects before
> sending, and leave those out of the dts if needed.
>=20
> I will not send it before the interrupt controller question is settled,
> and not before 48 hours have passed in any case.

My take would probably be not sending new versions until at least 48h
has passed since the last reply on the current version, rather than 48h
or w/e from time of posting. Of course, exceptions apply, and you can
use common sense to guide you.

--9WsB/PUlVzPaxjR8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5h1AAKCRB4tDGHoIJi
0udqAP0WM0sBTq4yEA+F6vKgUmE8ocwVivM3NUIF83HuZso3pgEAivB/61eJBing
IjaFuZ7tEIoxs6shBuwSTj5im/+qbQk=
=Hfgz
-----END PGP SIGNATURE-----

--9WsB/PUlVzPaxjR8--

