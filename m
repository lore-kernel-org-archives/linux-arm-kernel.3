Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15534C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G046fTzq88sck8KR6YfGTXkooubDb0hnHxEcuTcuA5k=; b=aKwonm40lwHhMZlAmUmp078Ur3
	NL9fKDist4YOqR5kqqJ2fxLCtqCzEvzSW9C/PWyxh4S7RiAiqCV15eXIylUHooo4L++HbU3Kdsep2
	Gnj3lnHhC9+KByV37hS7PLjGcNAPytMla2QSL2IRd+yewJxNGoxF/XRGzHZii3uNul3OneSNtGZSm
	4lYl08REL3is6FmO6+NILaQVcq79u6UxEhKHqeZSlAYULVzixhMDkPhJ47vnCDUYD6RdectB33ic6
	qIuHVbeKbyNUWM4zgKJgwtBwQSr7LxG7OPsKfvRHJxED1pCp+JSMKJuUMyDBEmKBmAo9EyqawF/HD
	HK1dm8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQDt-00000008uXH-1dDD;
	Tue, 18 Feb 2025 16:13:25 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQ6w-00000008sju-0PSe;
	Tue, 18 Feb 2025 16:06:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1739894756; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QeE1UnGpkKUhFcjiTUMcgglbMPdzh955L6Mi2jIgD9tKNIPn26QzzWlV7f2y01eoxZSYkPLCGhcOpaKPojXRbtmGgdqIgS1zfN36bpC/hRjB+jcE9koavgWBAfY/sonHzKAQRSXZxLIXWMgspqrApuhGdX1IRJXN1+GCHmGNFq4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739894756; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G046fTzq88sck8KR6YfGTXkooubDb0hnHxEcuTcuA5k=; 
	b=M7LcLdJQJVTN3G8u1bPUrNdYseFDG0lZMGBgvh9/yidSYURnFwX6TSOKl42NFCJ8wNXPsXNX82FsLDrvkAPh8tdcU7amdyHvWpLtHPOnfEcI13WO9WZC43QpsVSSfANAl3+jyjn0ShAo4rke8ei77214gfqIW2G+3wiiPX72fDs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739894756;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=G046fTzq88sck8KR6YfGTXkooubDb0hnHxEcuTcuA5k=;
	b=FgA4+xS4u3LMbTIIyv5qrJ6nnZmCprKCSG6FW+rUMiJXrIv136LF1qPiqpNhHi7N
	gQTLKgLNW6DXedADhp8GDjgB+ZMLON6NZRfxYc3YNyshrOByqG5h6AGKiLfXPNbAJmR
	Ftn4+eWXOqdOxSn99vfv2v0JP8kGRp5qh40qA+Cs=
Received: by mx.zohomail.com with SMTPS id 1739894753650443.23063731499315;
	Tue, 18 Feb 2025 08:05:53 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 4B7381807FB; Tue, 18 Feb 2025 17:05:48 +0100 (CET)
Date: Tue, 18 Feb 2025 17:05:48 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, airlied@gmail.com, 
	andy.yan@rock-chips.com, conor+dt@kernel.org, cristian.ciocaltea@collabora.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, hjc@rock-chips.com, 
	kernel@collabora.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, robh@kernel.org, simona@ffwll.ch, 
	tzimmermann@suse.de
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
Message-ID: <ldgdrytto5y2xf3ois23j4ymtajtwmqlxjr2zyqhwbbxcx6f6y@gzb37fntx2x6>
References: <1919367.CQOukoFCf9@diego>
 <20250218121749.1382322-1-liujianfeng1994@gmail.com>
 <lnuceofdwm6lgibworaghcujp6rrncvn4e2xc2vzltimjw3rqu@jur7x5cxt5ue>
 <2425191.NG923GbCHz@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o5rdl6ozldbywqxd"
Content-Disposition: inline
In-Reply-To: <2425191.NG923GbCHz@diego>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/239.824.9
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_080614_190671_8A6623B4 
X-CRM114-Status: GOOD (  39.85  )
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


--o5rdl6ozldbywqxd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
MIME-Version: 1.0

Hi,

On Tue, Feb 18, 2025 at 03:53:06PM +0100, Heiko St=FCbner wrote:
> Am Dienstag, 18. Februar 2025, 15:13:07 MEZ schrieb Sebastian Reichel:
> > On Tue, Feb 18, 2025 at 08:17:46PM +0800, Jianfeng Liu wrote:
> > > On Tue, 18 Feb 2025 11:00:57 +0100, Heiko St=FCbnerwrote:
> > > >So I guess step1, check what error is actually returned.
> > >=20
> > > I have checked that the return value is -517:
> > >=20
> > > rockchip-drm display-subsystem: [drm] *ERROR* failed to get pll_hdmip=
hy1 with -517
> > >=20
> > > >Step2 check if clk_get_optional need to be adapted or alternatively
> > > >catch the error in the vop2 and set the clock to NULL ourself in tha=
t case.
> > >=20
> > > I tried the following patch to set the clock to NULL when clk_get_opt=
ional
> > > failed with value -517, and hdmi0 is working now. There are also some
> > > boards like rock 5 itx which only use hdmi1, I think we should also a=
dd
> > > this logic to vop2->pll_hdmiphy0.
> > >=20
> > > @@ -3733,6 +3751,15 @@ static int vop2_bind(struct device *dev, struc=
t device *master, void *data)
> > >  		return PTR_ERR(vop2->pll_hdmiphy0);
> > >  	}
> > > =20
> > > +	vop2->pll_hdmiphy1 =3D devm_clk_get_optional(vop2->dev, "pll_hdmiph=
y1");
> > > +	if (IS_ERR(vop2->pll_hdmiphy1)) {
> > > +		drm_err(vop2->drm, "failed to get pll_hdmiphy1 with %d\n", vop2->p=
ll_hdmiphy1);
> > > +		if (vop2->pll_hdmiphy1 =3D=3D -EPROBE_DEFER)
> > > +			vop2->pll_hdmiphy1 =3D NULL;
> > > +		else
> > > +			return PTR_ERR(vop2->pll_hdmiphy1);
> > > +	}
> > > +
> >=20
> > This first of all shows, that we should replace drm_err in this
> > place with dev_err_probe(), which hides -EPROBE_DEFER errors by
> > default and instead captures the reason for /sys/kernel/debug/devices_d=
eferred.
> >=20
> > Second what you are doing in the above suggestion will break kernel
> > configurations where VOP is built-in and the HDMI PHY is build as a
> > module.
> >=20
> > But I also think it would be better to have the clocks defined in the
> > SoC level DT. I suppose that means vop2_bind would have to check if
> > the HDMI controller <ID> is enabled and only requests pll_hdmiphy<ID>
> > based on that. Considering there is the OF graph pointing from VOP
> > to the enabled HDMI controllers, it should be able to do that.
>=20
>=20
> I was more thinking about fixing the correct thing, with something like:
>=20
> ----------- 8< ----------
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index cf7720b9172f..50faafbf5dda 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5258,6 +5258,10 @@ of_clk_get_hw_from_clkspec(struct of_phandle_args =
*clkspec)
>         if (!clkspec)
>                 return ERR_PTR(-EINVAL);
>=20
> +       /* Check if node in clkspec is in disabled/fail state */
> +       if (!of_device_is_available(clkspec->np))
> +               return ERR_PTR(-ENOENT);
> +
>         mutex_lock(&of_clk_mutex);
>         list_for_each_entry(provider, &of_clk_providers, link) {
>                 if (provider->node =3D=3D clkspec->np) {
> ----------- 8< ----------
>=20
> Because right now the clk framework does not handle nodes in
> failed/disabled state and would defer indefinitly.

Also LGTM.

Greetings,

-- Sebastian

--o5rdl6ozldbywqxd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAme0r9AACgkQ2O7X88g7
+prEJw//b+Nw+9Nf9WpI627qaO/nkDdYe5KdSqZ5AJLbh3YYVOCDhT/NZaj0hLmr
vhxexWcqOxpnDMvC2+85z8Zvlkh5/4WVYfOb1e2ffacSFKlA63hKr6/icLbn/ID4
MMtySrVG96k07/4Z33vjoLj8Hp/CHb/g8R0H3Kkre7CMBF8QLCbQFyMV9EwuCMQN
V2uLFkhfuK1iuAQtoIkTeI5ayDNYEcA+iOyTNdcNenKL1iAuFqpBDZpsvWQArMm6
W4mGQos4IbyoQs2eaT/+oj1BYpbCAmjAoD4lpWyhj/UzNgDnX35Q49cRrJk3zAfS
dLl5gy1zWl1H/L0zCYEAw6ug+3ZtFRHAlGiHDJytGTIQHNBD5oYXabVqKaJtdZU3
iqfqEA7DmJHQ0wUE1yn/Z96bkJ/caCrKwzVMCNmJnFh4FMm6Mn4C38rZBbPp5qov
HmZiCDyegmHk91Le38hY1aa+Hme0YIkAm2pHUAzuvbNXShnydKIETQh/K+kv1XEb
0Ox82DOWJnavmrRxBv/O8RfsMJG7PArEOekq/bHVRl0Z4e0fpOkRKC3bF1M0VaGj
2djV6h+zLemt/Oy1RtzVot7yL5nI5EwIAzpZgzF5HZikFWLsoy3EjNLKXnLRwwTA
le9kWno3wn2Ycy6E+wfMLIi3nULqcz1pXJqlxg3cTh2ZLqiugLs=
=91vC
-----END PGP SIGNATURE-----

--o5rdl6ozldbywqxd--

