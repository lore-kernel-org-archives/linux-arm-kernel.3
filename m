Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089E9C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUdwiuHEFhVhO1itwdFrGoQBICFLjmpZRLXi65Mix+Y=; b=x1KV9wNk4C9d9GfQjcqjevMbkw
	UGYLHeuXuoISl2nOL+LX6dQoEXZ6OnOty5WX/NJ7XtwBcRhJGjyBtp3EkeiDKTvc3MRRQS3rhlcqr
	RmrDeX2FrrlE3oGNCfJ4XN/No269TvC6x00DhPrrT67ITw5HtbpxxR4O5G6YaURFGXusXH5VSv+GK
	HtlKOlYqw0qM4ig42wWS48hC47kJjF58bIRtVrWySCubY2v39vj3IKjbrOmkAqjL9TGJkB4b3MldA
	NGHcuRE+6QpOtln5LuJ3lSx3gz205Cfax0H8Xhl+OhMjGUp1YIbTOqXsLLG/aLxS8NeME118E9AED
	Fxk7Up3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxNf-00000006Dof-1QZU;
	Mon, 17 Aug 2026 13:27:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxNe-00000006DoO-1OJX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:27:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5626B43548;
	Mon, 17 Aug 2026 13:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8351F000E9;
	Mon, 17 Aug 2026 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786973277;
	bh=KUdwiuHEFhVhO1itwdFrGoQBICFLjmpZRLXi65Mix+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bc5HyQYM1Yl/eP6xwJH4ZarKDSSbpcsoeD1ioi6wDfndS/hS1Y9Zk+yG5UxwQ7np1
	 Zurmh0Uv5ewUTABnmQfBUt/J12Nvb3TiNWBEMpnht3T2IMsivhk6iFBl0LdQpD7AK4
	 PvCSblTa9E8CKeZbODLUvw6SsbsSUklbZUe2wPKbJnxEi9q2q3dIi/v7hwG4RdsGEF
	 WJigU2caH1PkHisw6MfOGlinm5qZK9uEn5TTthzJcLwMjyQl/QMzfWsAPNu0SK34wr
	 kc2MK9xKx6rui4tK0p8jfX8Z+07eRXq2ySrauSloWjItE5oe4PjhcG0sBJs9y5WsPl
	 Ogqtz5AlvOzBQ==
Date: Mon, 17 Aug 2026 15:27:54 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v10 2/5] dt-bindings: pci: tegra264: Switch to PCIe root
 port bindings
Message-ID: <aoMMInqEdS4MGUfU@orome>
References: <20260814-tegra264-pcie-v10-0-05d08c592b05@nvidia.com>
 <20260814-tegra264-pcie-v10-2-05d08c592b05@nvidia.com>
 <f2wdbxqudd7kice4fcee4skgwektcftgqvccihi6l47ztwlssg@ufehmcwfwjh7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kwhhjrimcwx56o2n"
Content-Disposition: inline
In-Reply-To: <f2wdbxqudd7kice4fcee4skgwektcftgqvccihi6l47ztwlssg@ufehmcwfwjh7>
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


--kwhhjrimcwx56o2n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 2/5] dt-bindings: pci: tegra264: Switch to PCIe root
 port bindings
MIME-Version: 1.0

On Sat, Aug 15, 2026 at 08:28:31AM +0200, Manivannan Sadhasivam wrote:
> On Fri, Aug 14, 2026 at 05:38:56PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Switch to using the PCIe root port bindings in preparation for using the
> > standard WAKE# handling.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> For some reason, you just keep missing Rob's R-b tag for this patch:
> https://lore.kernel.org/all/178594272722.905042.3804777775947567354.robh@=
kernel.org
>=20
> I'll add it while applying, but please ensure that tags are not missed in=
 the
> future.

Understood, I'll pay more attention to this.

Thierry

--kwhhjrimcwx56o2n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqDDFoACgkQ3SOs138+
s6HZvxAAuhRhI5oheC9XaqEXYpnP1hc7i+bmTmMgHx3tBcBUww6zCs+JMeL2cY7F
kJ7m82I/7kFU30Ttyk+HouyfcPyZ1uj6aiP7PHwSty+N+KJRhgMy4/+kUKc3MxZk
CWO10DCTO6kFdWGmrBI82o6TJ/VPVGkAN46PvKsi5FZE+TDTa5IGfRtRZmMVKTXO
8qCjR1KK92sc1Tibu95ByDCA3uzLoGtkoj32AqOMfVNRcCTpf/GDWy0/ZCTfPryg
jzGFCiRIRV3//FAsbQFh2xRrLydUUT1gpDGXOSsKmu/+fyvXTSoP/Q7hJ3nMYEje
v4GFbgclY3+BR33QPzAIon5Fp/gepYO4w5bha4F+acvKO+ImwMfVLH21lOs1d9Iv
YSo8c4kNUsnVhgL4XdgIpRhAZGMgPxog7GmGatqf71QLqq6n6DPlNLK7OEt+1uI5
LbSflXOFlRS4xGTi1SpUnqhS3DwIAhTpubTEqslZkejtktLKRr66z3A9D7TdhOoh
ZDcePOLZUqEoOHg//GJGfvzVJtYcgTq+v4aruVtFDHD61UMTNNqc5Iy9XsfWtyVQ
2AAfHOIO/g+zKC16JtXgye1GyOP8BWqe3VA3f48GnDYGYP0rEloqTjIoBDgY3T+U
14EN7Fw3wPZN4JDKysXD9rq8owQJrj3S3ZfIIAeUbAV28uIRQr8=
=Cjmd
-----END PGP SIGNATURE-----

--kwhhjrimcwx56o2n--

