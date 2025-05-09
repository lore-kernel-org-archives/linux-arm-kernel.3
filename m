Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C01C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Kz7Sxbv9pao/1StwTgsThhEeMqeH0uwXWYJNk57XQM=; b=Jbni+kmN010bJIWFVwk15b3X69
	+W5wzfUlgDSNOX2K3Z//3fLNidb1FmuvRQ6RbBstiFIuaHYFSu2eD1Q45raZnRbRvjE9CL0FEao1F
	DHWakgvpSJPdirIbJnIZ3waLsOLio+RE7LPohLj7gb56TUc/+/DMC7feAsBH5vrY7i/+A6JUsMLqw
	M5ygwTiRvzs5HjegcG1OyULtujDWBPUCXz21P/Fy87Kh2+BTfBnEvuLY14xij0L6uEnne+VjOHYrO
	ckCX20WgiRa8kS3Ur5jGCtUYH5Xfewx5vDqwpHWJqS3Qq1sZi0XXcZHjPPf6XzqQGe/MbP47Yc2Fh
	iS0I+Mvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOIQ-00000003sVL-3rCZ;
	Fri, 09 May 2025 14:01:50 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNSu-00000003hZF-3fPL;
	Fri, 09 May 2025 13:08:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746796103; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=US+g2AF4fHzrvIDc/kGreBKVpYykSlAQw+i81SVOM8t3XRHp/DTvF47vLta7Gtqm5IeegZEzesYKWppuRgy//TlWSsQeodNbuZlX3FLFIa/qravgRm5Nv0HBs1TCVgrw4/EZuUUR3Fd5YO0709fxa/NziavgnVpxTkPx2HUKlqs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746796103; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0Kz7Sxbv9pao/1StwTgsThhEeMqeH0uwXWYJNk57XQM=; 
	b=E/EzH8mafujlLSVWB10hzO0PlFoY8H/nZp8M2OS9L6L911TrY6WA8kMPjhwBzSl5JdO1SsNyaz8YZhBzktkOF6aUxMfGD7abUVrbe84VH+5JrolRn/raVjrAcH/QB+nQb3caF3yjh8JyLQNmWym2bUvn3YF+80CSY7tYHcSZZBY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746796103;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=0Kz7Sxbv9pao/1StwTgsThhEeMqeH0uwXWYJNk57XQM=;
	b=b3Hwe487YYLirPwGQjIJ3ByPsgGz18eYwgMkzqfbNIpaKtHkDwX0gOTktnSy/m+K
	bsg3i0zYMt3LFzFPcqbeWaNB3vfo132Roup6ZKc3P2WSJbISQlCLv9l+W6GI6alOLeH
	CRYXSNqddG0NLGOrApxSzWAQ9wbvyOmbVQqaOW9k=
Received: by mx.zohomail.com with SMTPS id 1746796101912648.0880381486586;
	Fri, 9 May 2025 06:08:21 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 1C3DA18072E; Fri, 09 May 2025 15:08:18 +0200 (CEST)
Date: Fri, 9 May 2025 15:08:18 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Diederik de Haas <didi.debian@cknow.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/5] arm64: dts: rockchip: move rock 5b to include file
Message-ID: <dbwzgqfzc4ax6skthp4bkyhhixcm4fohzbcr4px3ugbx7ntmwx@ipncpit75fau>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
 <20250508-rock5bp-for-upstream-v2-2-677033cc1ac2@kernel.org>
 <D9RN1HZAXH1M.3H228KWQJ9CR0@cknow.org>
 <2653568.Lt9SDvczpP@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iqik5rtwwzfpqten"
Content-Disposition: inline
In-Reply-To: <2653568.Lt9SDvczpP@diego>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/244.214.33
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_060836_983443_6B9AB772 
X-CRM114-Status: GOOD (  37.01  )
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


--iqik5rtwwzfpqten
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/5] arm64: dts: rockchip: move rock 5b to include file
MIME-Version: 1.0

Hi,

On Fri, May 09, 2025 at 02:54:00PM +0200, Heiko St=FCbner wrote:
> Am Freitag, 9. Mai 2025, 14:44:57 Mitteleurop=E4ische Sommerzeit schrieb =
Diederik de Haas:
> > Hi,
> >=20
> > On Thu May 8, 2025 at 7:48 PM CEST, Sebastian Reichel wrote:
> > > Radxa released some more boards, which are based on the original
> > > Rock 5B. Move its board description into an include file to avoid
> > > unnecessary duplication.
> >=20
> > Aren't you moving it *out of* an/the include file?
> > If so, the patch Subject and the above line should be updated so that
> > they correctly reflect what is changed in this patch.
> >=20
> > The above text is correct (and the same ...) as patch 1, but in this
> > patch you move things out of the dtsi which are unique per board.
> >=20
> > > NOTE: this should be merged with the previous commit to ensure
> > > bisectability. The rename happens in a separete commit during
> > > development because git does not properly detect the rename when
> > > the original filename is reused in the same commit. This means
> > >
> > > 1. it's a lot harder to review the changes
> > > 2. it's a lot harder to rebase the patch series
> >=20
> > Or did I fall prey to the exact thing you described here?
>=20
> I think Sebastian's idea  is, that I squash both patches when applying.
> This split makes it easy(er) to review because patch1 is just a rename.
>=20
> And merging them when applying then makes it again not break bisectabilit=
y.

Correct. This is a lot easier to review than what git generates when
having these two patches squashed together, which is a huge diff of
all 1000+ lines in the file (I tried really hard to convince it that
this is mostly a rename with --find-renames and --find-copies). You
can see this kind of mess in patch 2 of the ROCK 5T series that
Nicolas just send (I will comment on that and suggest to do the same
thing I did to ease review. In his case it should even be possible
to do it in a bisectable way without needing a squash :)).

Greetings,

-- Sebastian

>=20
>=20
> Heiko
>=20
>=20
> > Cheers,
> >   Diederik
> >=20
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts  | 52 ++++++++++++++=
++++++++++
> > >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi | 40 --------------=
----
> > >  2 files changed, 52 insertions(+), 40 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/a=
rm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..9407a7c9910ada1f6c803=
d2e15785a9cbd9bd655
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > > @@ -0,0 +1,52 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "rk3588-rock-5b.dtsi"
> > > +
> > > +/ {
> > > +	model =3D "Radxa ROCK 5B";
> > > +	compatible =3D "radxa,rock-5b", "rockchip,rk3588";
> > > +};
> > > +
> > > +&sdio {
> > > +	max-frequency =3D <200000000>;
> > > +	no-sd;
> > > +	no-mmc;
> > > +	non-removable;
> > > +	bus-width =3D <4>;
> > > +	cap-sdio-irq;
> > > +	disable-wp;
> > > +	keep-power-in-suspend;
> > > +	wakeup-source;
> > > +	sd-uhs-sdr12;
> > > +	sd-uhs-sdr25;
> > > +	sd-uhs-sdr50;
> > > +	sd-uhs-sdr104;
> > > +	vmmc-supply =3D <&vcc3v3_pcie2x1l0>;
> > > +	vqmmc-supply =3D <&vcc_1v8_s3>;
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&sdiom0_pins>;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&uart6 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&pinctrl {
> > > +	usb {
> > > +		vcc5v0_host_en: vcc5v0-host-en {
> > > +			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&vcc5v0_host {
> > > +	enable-active-high;
> > > +	gpio =3D <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&vcc5v0_host_en>;
> > > +};
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/=
arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> > > index 17f4fd054cd3d1c4e23ccfe014a9c4b9d7ad1a06..6052787d2560978d2bae6=
cfbeea5fc1d419d583a 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> > > @@ -8,9 +8,6 @@
> > >  #include "rk3588.dtsi"
> > > =20
> > >  / {
> > > -	model =3D "Radxa ROCK 5B";
> > > -	compatible =3D "radxa,rock-5b", "rockchip,rk3588";
> > > -
> > >  	aliases {
> > >  		mmc0 =3D &sdhci;
> > >  		mmc1 =3D &sdmmc;
> > > @@ -139,10 +136,6 @@ vcc5v0_host: regulator-vcc5v0-host {
> > >  		regulator-always-on;
> > >  		regulator-min-microvolt =3D <5000000>;
> > >  		regulator-max-microvolt =3D <5000000>;
> > > -		enable-active-high;
> > > -		gpio =3D <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
> > > -		pinctrl-names =3D "default";
> > > -		pinctrl-0 =3D <&vcc5v0_host_en>;
> > >  		vin-supply =3D <&vcc5v0_sys>;
> > >  	};
> > > =20
> > > @@ -488,12 +481,6 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
> > >  			rockchip,pins =3D <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
> > >  		};
> > >  	};
> > > -
> > > -	usb {
> > > -		vcc5v0_host_en: vcc5v0-host-en {
> > > -			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> > > -		};
> > > -	};
> > >  };
> > > =20
> > >  &pwm1 {
> > > @@ -530,27 +517,6 @@ &sdmmc {
> > >  	status =3D "okay";
> > >  };
> > > =20
> > > -&sdio {
> > > -	max-frequency =3D <200000000>;
> > > -	no-sd;
> > > -	no-mmc;
> > > -	non-removable;
> > > -	bus-width =3D <4>;
> > > -	cap-sdio-irq;
> > > -	disable-wp;
> > > -	keep-power-in-suspend;
> > > -	wakeup-source;
> > > -	sd-uhs-sdr12;
> > > -	sd-uhs-sdr25;
> > > -	sd-uhs-sdr50;
> > > -	sd-uhs-sdr104;
> > > -	vmmc-supply =3D <&vcc3v3_pcie2x1l0>;
> > > -	vqmmc-supply =3D <&vcc_1v8_s3>;
> > > -	pinctrl-names =3D "default";
> > > -	pinctrl-0 =3D <&sdiom0_pins>;
> > > -	status =3D "okay";
> > > -};
> > > -
> > >  &sfc {
> > >  	pinctrl-names =3D "default";
> > >  	pinctrl-0 =3D <&fspim2_pins>;
> > > @@ -566,12 +532,6 @@ flash@0 {
> > >  	};
> > >  };
> > > =20
> > > -&uart6 {
> > > -	pinctrl-names =3D "default";
> > > -	pinctrl-0 =3D <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
> > > -	status =3D "okay";
> > > -};
> > > -
> > >  &spi2 {
> > >  	status =3D "okay";
> > >  	assigned-clocks =3D <&cru CLK_SPI2>;
> >=20
> >=20
>=20
>=20
>=20
>=20

--iqik5rtwwzfpqten
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmgd/jkACgkQ2O7X88g7
+pqFOg/9EbNnhPC/WiMi/qXyXGffru2bWrd2fN92qsOSJXAa/oqXiZ39WCMHXWoy
beHRT8UD9EMTgDT0BzlYkBt4gmqHC2prGNwc98J4VIraW+99L5Ue7Fl34RkiGebx
Etqu+ap2aYsFC7DEKTAD4Zf6/ndzmd6K/BqObMm+gWpZnlpC0K4ibYzDPSkuyX+o
b3G07C9GT3oJ2sQ/m7FabbTN8muiBluVrgHsCeCyGUXZLnHtBFRq8xiLhDdFYz4P
SIQ/4av19tCJC6tRaKF6rJ3HSTqvTmehrbj6SUCIYxgXuWW5t/P4nkw/5gikke/O
jmN04Aom769SNOzMtqAFFPOMVWcwiHXNSxoCX1OyUAWBoZS2eElXUOtCvdK/Ovxr
c7OM8VdJCCG7c2fewv0EGBofEBdquyklGqQ+4yRNcAKjdeEJJuxqYn+wgyrdIUH5
tYuQ8wb2C7JtkD1fYNpunQdSBP+TwR9NWWlECTrj6zvv4bnjcqyvNlH2VrXHJmav
Q9Cwghm8YUcjZNL7S6D4tNKf39nVCG3Dy4hLYwZYn9shjr7tmgdIuCKE311y9KKx
McB4cU3ZjxegO/WgnSLIwf5cLOHXfi7vwZ/0PneO87+pIid777Xc1fOJg6/E1VEI
67cq7Ftf+v7SottG50/HGk/u1SPBe9yKLS6TxS0TmgTWUIg720I=
=C+4K
-----END PGP SIGNATURE-----

--iqik5rtwwzfpqten--

