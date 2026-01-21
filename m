Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C156AD262B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 05:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vg2r2aqj+bKEFxrX6PEqQmNUJg+R0LwggjFHbEypWzA=; b=ObsaNEckMlknx+Xj6xcMoRz8r/
	bVtV/U2AchBpKveGKkQF//J4ZjKTYCv4eE+UdRZDdjKKEICZG9xa2o5amuIO4PefEmDYWZdLjWKvB
	fOwSIal3AHW+BflgUXd80FrCQKQt1nE+XdgjGEQN5lBk03ibwm1HPQSaYF/aNtFCb1LC8R83t2FMp
	4YVmgmf+5fR2VJMKxw7PGzvtSl0ax/ggH7hRh+Qnz9V9bahhD3wXN5QDF1EVrZRRF0BG2uP6+y24E
	cnls58+taKVOaV/rwQ+hOYinkvpvUHsu9qtEhZ5lbH7+lTRvaGtGMC630eq/VUZZAFswJu9c0OTDl
	/khaY3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viR7w-00000004vCK-1SS4;
	Wed, 21 Jan 2026 05:51:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viR7s-00000004vBi-1xAQ;
	Wed, 21 Jan 2026 05:51:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768974680; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y2Qg56bDav42iDsHEi3mFLYNkHMuyAZ7Ztqy0A3VnX1viwnmCu7jSkRQBOVESdwERo+1KbTjvjWyREMvMpb+JhkVtzzj9Y0g2TDmBy6I0EpDdjuvZKKPkiN1kJRA1sTHHhnol8HlCWR6jn+JZkUJ/Tkccv2LVWep2xrSM+PlcAM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768974680; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vg2r2aqj+bKEFxrX6PEqQmNUJg+R0LwggjFHbEypWzA=; 
	b=L4q5uRwn4bUm6+yLtwYsSBIby/Sc96xOChQTGt4lrW1HJHm/+XgUDQnd2adm6Gh5DM/ArMtHfrygJfi+nlt1OCwg0+/kS5BJW4wt5/nc7eJ/VvAeJMPEadQkVrjreCbfXZLRiz6uXBW9SB4P8MFUfsz4AmIDGxUNj3KVgnTzq/k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768974680;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=vg2r2aqj+bKEFxrX6PEqQmNUJg+R0LwggjFHbEypWzA=;
	b=MopltGMFgjIMaYYxz6MGuPbesycT6+DX8rehfOPo8GNz0XCF0Dok9uxtzpQul+7A
	8qe1Kr4fVhYpvG4rnQV3PN1Rdu3lZDEUg0r7oEJcMWVcHu2ChWpbA8aYgQ4JdlV7pfd
	niE0KXZ1iGDieIYKH3RbPXjqO/GFfkNHZcDFMYH0=
Received: by mx.zohomail.com with SMTPS id 1768974679161902.5765053447564;
	Tue, 20 Jan 2026 21:51:19 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 994E5186A24; Wed, 21 Jan 2026 06:51:14 +0100 (CET)
Date: Wed, 21 Jan 2026 06:51:14 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alexey Charkov <alchark@gmail.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, Stephen Chen <stephen@radxa.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Change gmac phy-mode to
 rgmii-id for rk3576 board
Message-ID: <aXBlBHZIPQ6xhykE@venus>
References: <20260121031548.402-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l2x6hmltxgc2qk4r"
Content-Disposition: inline
In-Reply-To: <20260121031548.402-1-kernel@airkyi.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.5.1/268.954.8
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_215132_951999_852EA5EB 
X-CRM114-Status: GOOD (  18.56  )
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


--l2x6hmltxgc2qk4r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Change gmac phy-mode to
 rgmii-id for rk3576 board
MIME-Version: 1.0

Hi,

On Wed, Jan 21, 2026 at 11:15:45AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> According to the description in the net documentation, PHY modes
> "rgmii", "rgmii-rxid" and "rgmii-txid" modes require the clock signal
> to be delayed on the PCB.
>=20
> The Rockchip platform has long used the above mentioned PHY modes and
> private delay prop to describe the internal IO delay settings of the
> chip, which is inconsistent with what is described in the documentation.
>=20
> Some background, for RK3576, you can assume that:
>=20
>         tx_delay_time(ns) =3D 0.0579 * delay_line_count + 0.105
>=20
> For example, tx_delay =3D <0x20> means:
>=20
>         time =3D 0.0579 * 0x20 + 0.105 ns =3D 1.9578 ns
>=20
> Recently, Andrew has often mentioned the problem of phy mode in board
> level configuration. So let's start with the RK3576 to modify this.
>=20
> Please test this series of patches, thanks.

The RTL8211F PHY driver does not use the "tx-internal-delay-ps"
property, which would require using phy_get_internal_delay(). Also
the hardware only seems to support enabling/disabling a fixed delay
of 2ns, so it cannot be implemented as far as I can tell. So unless
I missed something, this series makes no sense as-is.

My suggestion would be to add support for <rx/tx>-internal-delay-ps
to the Rockchip GMAC driver by introducing a new rk_gmac_ops
entry to translate the standard properties into register values:

int rk3576_delay_conversion(unsigned int delay_ps) {
    return (delay_ps*10 - 1050) / 579;
}

That allows using standard properties in DT instead of vendor
specific "rx_delay"/"tx_delay". This results in a much better board
description and shows how far boards derive from the the standard
2ns (which can use rgmii-id without any extra delay specification).

Greetings,

-- Sebastian

--l2x6hmltxgc2qk4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlwaUsACgkQ2O7X88g7
+pr3VQ/+K7upRXGFJh74bDRpfZgOcOTYGsx3gh9TOqe+8BOCo9Les+bNrZr5hEuP
hKfPMARhUrIMnIcPW6LbLgGc1TMctwPbFGt7XoPll8e4CWNBM9oKf44mbIqh38rn
z8LeWa2NUDA/QUkjy6nvtJC41lZJhu4JfVFjU89xbu3jncJFUxNHIeNftZmeFkt4
L9gDdEfnaPcSRN5Lko9iVhZ0dIHpWnQa3EeAJLooPjoyRcmF5c4OLtQEo/bbGjOs
nTg86OLquQwOykB7salQyMc857St6eC/pRAFcRBz02AQ6KGEpYk6s38GadPHhd/x
eCQ0AvdBdvjyn+GZEUpkPefcZKrPqaniy4DywlsSkfUf0nONIXfx09FYoD0pP4TA
Q0R5c+s9s40WVzWahO+9bZBzsLbi5VcmsY3xbCWEW1aE2T/xnR594Nqh/R46oNlN
EjVuCJgnt/foPlJkQ6MGs52wW/FIZ7sl8VxTlUmWLpTmyDBcz7RU0SkMOBN3ZrBM
+MjCtCcfQ2GeJOc0IGagpeKy7FCBiTogPshTG5Zs+k4xHIHLhaNxGu5DiMOiRwRd
BBV1J+GH/b3FADkdxQadcBqegpBE04Si/ZTFCLQHbe0zfa3ggXvmMOhrXsyaaj5C
dR7EeRHh8lS3cBDzAWkfCBCPZWe/24aBHuqrPdbsEUSPT6OK//Y=
=f90W
-----END PGP SIGNATURE-----

--l2x6hmltxgc2qk4r--

