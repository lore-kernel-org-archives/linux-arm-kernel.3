Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C11C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UEs0On8LdgTczquU0moZNxa98iW4ahd2cBsmI73D/k=; b=hpK8ZIrmRd0zSnJherhS3VKzfl
	ItgPGXc1S8k/TTu+aCbwy/T6I36avBIcO+4Edjl9zrDLl9paDfzyT7VQIYH9S5SOrEPGsHORW7H+q
	NKzP74CjR0gkWCMBqsxiS/gx5MJC7X7h3+nd+6SRmsM+iSZ7GdhuT8LHoXTIuUGPnuJH+uS9LyJk+
	vULGsdSEbiHzqnBM4Zrmw6nPadH/JVx0Aw+Qf1WOM32lR6aqKfnyVXHhVbPVzEbozAT1LUJNYKa9G
	cgry6CFApE3pqMGG3Vo+g/xWjR51yF2Bz2MyEjz9SQ9LDkivejcYvCFgCCFxJ1Olgz7JmIPNK7ro8
	YjExd45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkORO-00000008Tm7-193y;
	Tue, 18 Feb 2025 14:19:14 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOLu-00000008SVn-0ONO;
	Tue, 18 Feb 2025 14:13:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1739887995; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GvMQldWV3zNgBH0W1WQvTV8ETdM7NjWiixES/hCNbEbWpo78JVr5nrJbPx/dsf/GWa1ud+2Thg1RhhMQ/X4ZmXNHf0Ct+fItEOeT6sdoJLdhVyqTzmIe188zbK6CDHY6oDlr4UyCb4UfyYtyYfo10bAbkLV9ni3Ezw2jgcwyVyY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739887995; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+UEs0On8LdgTczquU0moZNxa98iW4ahd2cBsmI73D/k=; 
	b=MdIgTvEw5k8KrW8JpKdP3ijIX1JKsCNbPxl9vRMfI1dvLGuXK6S4aO2zSHTJuWY7PPKKKQWNf7rxddEZeLPBeK32p5v4IpDxy0H6urK+C3Vm9mJn2iVZl9ata9dCyvTHeB13nrLj6JoXTQh2SSdlz+HiVw8/naPGoRNqsHvhb+Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739887995;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=+UEs0On8LdgTczquU0moZNxa98iW4ahd2cBsmI73D/k=;
	b=PUo5Z3QcF+6AH59D1QNdQe5VkQguLbMqTY9hdzKRFuNNB245eOt/j0+ykI6PrMUn
	lCjpCiwPNdz6h6QC0mLFDBC0E8lEvLJZEO0jHq2Sllmsjgugn4KxE/t33h9t75sujOi
	R9nNN51+10++GajS7Ky2DVvKOfl0db9FLfHyX17I=
Received: by mx.zohomail.com with SMTPS id 173988799275793.35650379360004;
	Tue, 18 Feb 2025 06:13:12 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 6CA8F1807FB; Tue, 18 Feb 2025 15:13:07 +0100 (CET)
Date: Tue, 18 Feb 2025 15:13:07 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: heiko@sntech.de, airlied@gmail.com, andy.yan@rock-chips.com, 
	conor+dt@kernel.org, cristian.ciocaltea@collabora.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, hjc@rock-chips.com, kernel@collabora.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, robh@kernel.org, simona@ffwll.ch, 
	tzimmermann@suse.de
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
Message-ID: <lnuceofdwm6lgibworaghcujp6rrncvn4e2xc2vzltimjw3rqu@jur7x5cxt5ue>
References: <1919367.CQOukoFCf9@diego>
 <20250218121749.1382322-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tg65zwayhilbnpfx"
Content-Disposition: inline
In-Reply-To: <20250218121749.1382322-1-liujianfeng1994@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/239.824.9
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_061334_209763_F7529FBA 
X-CRM114-Status: GOOD (  27.32  )
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


--tg65zwayhilbnpfx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
MIME-Version: 1.0

Hi,

On Tue, Feb 18, 2025 at 08:17:46PM +0800, Jianfeng Liu wrote:
> On Tue, 18 Feb 2025 11:00:57 +0100, Heiko St=FCbnerwrote:
> >So I guess step1, check what error is actually returned.
>=20
> I have checked that the return value is -517:
>=20
> rockchip-drm display-subsystem: [drm] *ERROR* failed to get pll_hdmiphy1 =
with -517
>=20
> >Step2 check if clk_get_optional need to be adapted or alternatively
> >catch the error in the vop2 and set the clock to NULL ourself in that ca=
se.
>=20
> I tried the following patch to set the clock to NULL when clk_get_optional
> failed with value -517, and hdmi0 is working now. There are also some
> boards like rock 5 itx which only use hdmi1, I think we should also add
> this logic to vop2->pll_hdmiphy0.
>=20
> @@ -3733,6 +3751,15 @@ static int vop2_bind(struct device *dev, struct de=
vice *master, void *data)
>  		return PTR_ERR(vop2->pll_hdmiphy0);
>  	}
> =20
> +	vop2->pll_hdmiphy1 =3D devm_clk_get_optional(vop2->dev, "pll_hdmiphy1");
> +	if (IS_ERR(vop2->pll_hdmiphy1)) {
> +		drm_err(vop2->drm, "failed to get pll_hdmiphy1 with %d\n", vop2->pll_h=
dmiphy1);
> +		if (vop2->pll_hdmiphy1 =3D=3D -EPROBE_DEFER)
> +			vop2->pll_hdmiphy1 =3D NULL;
> +		else
> +			return PTR_ERR(vop2->pll_hdmiphy1);
> +	}
> +

This first of all shows, that we should replace drm_err in this
place with dev_err_probe(), which hides -EPROBE_DEFER errors by
default and instead captures the reason for /sys/kernel/debug/devices_defer=
red.

Second what you are doing in the above suggestion will break kernel
configurations where VOP is built-in and the HDMI PHY is build as a
module.

But I also think it would be better to have the clocks defined in the
SoC level DT. I suppose that means vop2_bind would have to check if
the HDMI controller <ID> is enabled and only requests pll_hdmiphy<ID>
based on that. Considering there is the OF graph pointing from VOP
to the enabled HDMI controllers, it should be able to do that.

Greetings,

-- Sebastian

>  	vop2->irq =3D platform_get_irq(pdev, 0);
>  	if (vop2->irq < 0) {
>  		drm_err(vop2->drm, "cannot find irq for vop2\n");
>=20
> Best regards,
> Jianfeng

--tg65zwayhilbnpfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAme0lWwACgkQ2O7X88g7
+prO+w//ckt6/RZRkNYrf65IAuN+VTaPRXyXi81rOGKz/OB7Tk8bKiD1vzLkzwJ6
r0gE1W3oFIcW+mk1nCDf+CdUGqZIi1Fg/j3AmMkeRmrjW6goOpQUfpYtv0kTO696
/Ft3oL45Bw9IozPVM3rUhVyVjBjjXT2I+Hzh5FdAzv1QV1yju6gHViAIumtc8qoW
GZIvTy5Yr9w5+p3c7+r3CVwN/BboYDNcHka9L43y6MHN3sZownPoOYWEqrHJs7YU
jgPKjceBbJQkgy6vaX/TtrZVRP7Z6KLz4/EBSVcjDeR5lpWLEQ2M5UjiYJfbSPPl
nn0Edm40uNUAvmCe1Z/stz1Uym8IRZbCJetJix7FNWiPjMCyf1a4cQVq9ymOamWN
xc0DjB/pMg4tdf4v0bJ14HgaGxhJbm8InMNWLDMDCx/BqRptN+8xbuC4V4Oqh8GX
CVayUBfL2xRVE0M7z0zcvKvWiMD0wvuAEABKrxxlptEAJ4Di/uDnKNkrb0Em8FMk
0iDe4iIQBoZpPraGzH7vhvpBbQZhHjl6jIdIJiGPsat4H0/Yl2lZI26yXktinw5C
ae5U9Ez4zN29o51A4cuGeoJDBFRsl5xqALCfzp/LCe+Hf5hua8V6HIx564WsRcpA
WFzh3h3S0QuRmhRw0kPbRKXE9MdXykY8WkevvyFm4gGDLQ7gDrI=
=Pg8x
-----END PGP SIGNATURE-----

--tg65zwayhilbnpfx--

