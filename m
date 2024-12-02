Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796D3D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcyLzO2YfI2aBdjTvkcbi/dxPFExcki2hqRW5e2wT7Y=; b=up9SloHqPnpzs4RzsHMQHdTBok
	OZw28w83oWwiJ3y0+Hk7/Ss0efhEFbI+dT6VPLh2vVN4X4WVVGqmZFGrfLTZ+46d6uUUKoWsafEZk
	fFR5vSSMggWjOUghkTFeyIQs6uglTHPpDYM4b6xWRSIBY+6IhREyMkg6ACKRaQIcRy4hiNznXi4U0
	QQXHpQdksWPMFvk7lHok8jQ1YPXkamZGU1J+EBLlHGkiA47PWutnMLYSiDZFG3XplFkdfOmd3suGb
	4pOT5VU1gwfHQZGb2KbKUM1XlCFHK+tQPmYE1mVN2C7ZWNFm/Xyr7zHj34/h4YdbArWdjZDvg6bNO
	3SKXpwYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8ML-00000006eoR-34ew;
	Mon, 02 Dec 2024 15:29:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8Hq-00000006dpw-1RkI;
	Mon, 02 Dec 2024 15:24:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4D3E5C674E;
	Mon,  2 Dec 2024 15:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED517C4CED1;
	Mon,  2 Dec 2024 15:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733153073;
	bh=XYQ0z1Uam77lItbs5TmeenkmhhhYCbef5wkE8j7DNxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X6Itpbhg32uZaAfl/yleMRcAyuFbk6hyY6q62CjSVT5ePkBcDTqgCHMQflCRZPk3M
	 mS7yABdBHT0BwG2EFPgBmiZaN+/l2JUlG4zdXhFOD7Ogq4aBLnI7qFXDKJqUIzto9D
	 lATKQwjmIsLNaRhRU+p8KxkOl4cY1wyskRvCZFvvXo0GhKusl62rhNtUAb7LVlHUpH
	 DKjyzFmiu2dAdvHzb2VI8GOOD7gvqGB7E9zcfT7sJwsz/b503QjgNsurAdHPHryYhx
	 fIK9u421jmN5QOPoXjC3innffMfVLT2HiNHnJyDvEGsx9qbKoyXhuBfNdSdbFdbB2c
	 5o7Xfgsz1Bg2w==
Date: Mon, 2 Dec 2024 16:24:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: broadcom: Fix device tree warnings for
 BCM2712 display pipeline
Message-ID: <20241202-goose-of-pragmatic-sympathy-3fbbe7@houat>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
 <20241202-dt-bcm2712-fixes-v1-4-fac67cc2f98a@raspberrypi.com>
 <c8093283-f2c1-4a66-823a-50aeabb3c82b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="u7k2sfuk7gzxc7b7"
Content-Disposition: inline
In-Reply-To: <c8093283-f2c1-4a66-823a-50aeabb3c82b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_072434_470349_B0F56235 
X-CRM114-Status: GOOD (  18.28  )
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


--u7k2sfuk7gzxc7b7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/7] arm64: dts: broadcom: Fix device tree warnings for
 BCM2712 display pipeline
MIME-Version: 1.0

On Mon, Dec 02, 2024 at 04:20:46PM +0100, Krzysztof Kozlowski wrote:
> On 02/12/2024 15:31, Dave Stevenson wrote:
> > Fixes up errors on HDMI and interrupt controllers that weren't
>=20
> What errors? I can't find anything in the commit. Describe the error.
>=20
> > noticed before merging.
> >=20
> > Fixes: de9bc2dba3db ("arm64: dts: broadcom: Add display pipeline suppor=
t to BCM2712")
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boo=
t/dts/broadcom/bcm2712.dtsi
> > index 39305e0869ec..f42fad2d8b37 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > @@ -336,7 +336,7 @@ ddc1: i2c@7d508280 {
> >  			#size-cells =3D <0>;
> >  		};
> > =20
> > -		bsc_irq: intc@7d508380 {
> > +		bsc_irq: interrupt-controller@7d508380 {
>=20
>=20
> Do not mix cleanups with bugfixes.
>=20
> BTW, do not mix DTS to DRM. DRM has its own development style. DTS
> *cannot* be merged there, so combining these series is not welcomed and
> leads to issues (like DRM applying DTS!).

When did that ever happen?

Maxime

--u7k2sfuk7gzxc7b7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ03RLgAKCRAnX84Zoj2+
dgeyAX9OFiJpZFQbio0wgmyjERHOVqZ0QnzuwU8/l4uYS3Js8d451pGqbMSkwSuV
y4TIeoEBf1bUqFd30CrhbLvlNqnr2LgNABbYjWU0AzVWN6SzLXWEYk4U7injMDWQ
ojUpgGixPg==
=czBy
-----END PGP SIGNATURE-----

--u7k2sfuk7gzxc7b7--

