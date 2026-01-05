Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587F7C79FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 19:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eYBqoUzN2+h4HGky8/6reMdv+vWNLooxMBisEuv9uw=; b=V2BFvaHC0wlx12xPK9cJb7GfkE
	P30cKmIjIFdfvOGi2Av3TGFFreBT79lEl1BGzjlyyUHPPPgGiXnHPl2QHzZVly6QjUaXkV0oFTnYP
	IIYrqRgfU66X//4SrGn/EdcpU5bcubDfCgYs9fgcKO7Rx4CCwW0zse4RfKyGELJ7wCp6sFMxlsGze
	Fxwf8X1cShqQ3N2yPJ85riwhV9SEp1dUCBS0zOjyMH47a/Ao89IjfXR4LXQ2n1cdyhQ/fSbfXUdrI
	IDREY3oqBmmS8OI7iHPQZAo/PTJBoFvdka/ce+wSlimxIjA1r1iTQrqwNvlXaayyJBH/O9Jl6JXON
	cewToQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqCI-0000000ByUR-3sHx;
	Mon, 05 Jan 2026 19:24:58 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqCG-0000000ByTo-0XId;
	Mon, 05 Jan 2026 19:24:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767641089; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CottjbLhr1z6jC7i7Flp+v+5LhDl6uS+YVZbNw2ld2JfPW7E1jZGFhN4ADezeT5riWanf1Us9kdXtzLjBvqJ3+eNbm74FfTlLPMyuHEtNwmJ0KVnloLaKIIbGMb+n+5PYvRVd2NSq3vSzEKctz+iyTuG0PzXLqTMDPawzaaPKFw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767641089; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+eYBqoUzN2+h4HGky8/6reMdv+vWNLooxMBisEuv9uw=; 
	b=ZDTo/tCXQ7PAp1toucD2qN20Uh2H8bUa2vslbjsByc3pnuHoTG5AbiUssw4g3HoJYYHdkkuT3WBQjfl0l2FkuCj2erOIfTcH6fYMtkhNBV7djSV19Kl4frOuvsKPdm1yBRDVbQQ41oBKLXmgPyLf47metArVee0qrT9D+IiyKFg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767641089;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=+eYBqoUzN2+h4HGky8/6reMdv+vWNLooxMBisEuv9uw=;
	b=QlP/7MylbzSI4cx96KIuR91JZT+dHf3eGfwqJDoJd9mbvnCEwS8rTZXxqqllByz4
	WI9Y7XF1UtxKj/w+w1QFx543Bzq0CyIh82su6mbzQAEK+QOwl/w6RtdaT31LXowKKRG
	NF2cnox2UNz07hkP0Wd+OUpEU+El+kXTZEVceUoA=
Received: by mx.zohomail.com with SMTPS id 1767641086980433.82009734349515;
	Mon, 5 Jan 2026 11:24:46 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id B1861181D56; Mon, 05 Jan 2026 20:24:42 +0100 (CET)
Date: Mon, 5 Jan 2026 20:24:42 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Frank Wang <frank.wang@rock-chips.com>, 
	Alexey Charkov <alchark@gmail.com>, Liang Chen <cl@rock-chips.com>, 
	Finley Xiao <finley.xiao@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, 
	Yifeng Zhao <yifeng.zhao@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix wrong register range of rk3576
 gpu
Message-ID: <aVwIukddZTukxH_8@venus>
References: <20251230090246.46-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gh72f5z6wmtbfhva"
Content-Disposition: inline
In-Reply-To: <20251230090246.46-1-kernel@airkyi.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/267.599.44
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_112456_246602_03D2DEA3 
X-CRM114-Status: GOOD (  20.40  )
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


--gh72f5z6wmtbfhva
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: dts: rockchip: Fix wrong register range of rk3576
 gpu
MIME-Version: 1.0

Hi,

On Tue, Dec 30, 2025 at 05:02:46PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> According to RK3576 TRM part1 page13, the size of the GPU registers
> is 128 KB.

RK3576 TRM V1.2 has the address mapping on page 15. Maybe just
reference "Table 1-1 Address Mapping" instead of giving a page
number?

I think it makes sense to add the following extra text:

The current mapping incorrectly includes the addresses of multiple
following IP like the eInk interface at 0x27900000. This has not
been detected by the DT tooling as none of the extra mapped IP is
described in the upstream RK3576 DT so far.

> Fixes: 57b1ce903966 ("arm64: dts: rockchip: Add rk3576 SoC base DT")
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3576.dtsi
> index 6284e7bdc442..b375015f0662 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1271,7 +1271,7 @@ power-domain@RK3576_PD_VO1 {
> =20
>  		gpu: gpu@27800000 {
>  			compatible =3D "rockchip,rk3576-mali", "arm,mali-bifrost";
> -			reg =3D <0x0 0x27800000 0x0 0x200000>;
> +			reg =3D <0x0 0x27800000 0x0 0x20000>;
>  			assigned-clocks =3D <&scmi_clk SCMI_CLK_GPU>;
>  			assigned-clock-rates =3D <198000000>;
>  			clocks =3D <&cru CLK_GPU>;
> --=20
> 2.51.1
>=20

--gh72f5z6wmtbfhva
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlcD+sACgkQ2O7X88g7
+prTtQ//dy/wZmBaqUEGaS9zX4E6AXNwW8NHd8I6RwQHDHAbbbkPNkI66IxfKeBo
nWasz2zmeCym7reEoKvRwNw9h2sofpHJzvPV/EMEOdgaBo4ene8LeTQ1wfBnXNZi
KsTX4cYGDK5YcHeXK5eCPGAZO7ihGRY8vYy9U5xeT91nKbcBGFdG6dLfYsnwbaBf
5CpTmk3RPsDqtXr02hd5d+5/ZSkDE0dD1bLRrYhA14sP0UG3j3UciLlhCMi0DOaU
eljF7vne4wbqpAPYmiqvpEYxhjfeS50WuWqjFBdBQhzUq5788dvh59WS7jPylx9X
0e2No3O3uWHN7s9+hcj070dAOJlxPIqVhoofsqeqHh49KUKFu8MHvzrA//iorxg+
G36wh9A5YTKehH1MBZGDvMz4qpRPWiaPRsqB6/BS+iBXZoFBnp5S8aKjG34xWebK
rXXCE9Nt3TVFJhe55ng42Xl9vLWQZ39vzy1ycNt4KV8wRWFAhKcBvLGOhztoClRV
m7iAHBFkXmNAQZHA6vSkM0a2hZjau2sYXTzDMUQjoiVXA2mYGq6iholyVGwQz4MZ
n+Lcsj+CnBLt7UvxwCXnyzrkf4YIF18F0adMrkl6Ff9IjOnGxJRs3GYRiT5A+9vZ
p+u6xmCBl5IdWMq/q3RB2bYfP3kh5hbDbGHkfJvhslCfkCjM8RQ=
=jLgq
-----END PGP SIGNATURE-----

--gh72f5z6wmtbfhva--

