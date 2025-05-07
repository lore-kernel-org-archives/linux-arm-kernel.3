Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DD3C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cK2GR+MTIxCdrAVL3u30qal7MJPY3+v+RkxSo+dm/A=; b=vQVM2wNgr3QUGMzqK85Kyjgbk7
	yOGJfHMqTFT0EJfr0Q+YpSd443kJhygz8C+u3R0sr0DMUNlP/5oekBmOpnN1rAhaOTd7Pgac+AcWh
	tpzUE7inVms7mJb52S4bwK4dNXZom7MmFWoXILSpIOgqLwLqvpSb2snhpOtvGzV0zS6NRsWBiG0kb
	kNfT3AsCyXQLsAw2SAvwenXndwGzdRF549dC9z5UgCC13qw/HzhtoPDGymB2RyMxJlH12N2hQjKTT
	zsV3b6kqjBhD9cLTilAkXTJhA/k6Usa2cgF+hibF/IZL4cpiFzrvdV+mWie5uohXmZNbaeX4/8cG9
	yR19twxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgIb-0000000FsxK-2bbu;
	Wed, 07 May 2025 15:03:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfpI-0000000Fmsa-0nxq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:32:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso16227515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628367; x=1747233167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4cK2GR+MTIxCdrAVL3u30qal7MJPY3+v+RkxSo+dm/A=;
        b=HYSX4Yq5+tjQXIsYcSKaNKcmCHBgdN91zAyKxawut0T0PT8XVW77lwKb4RgwKETv1C
         TXPD2D1tuL6ArW5DZNydWyL8mufM4WIQViY5+SlsPFy7fkhIz7Y5bBRtPqZvDdp7az6y
         IXqofOidhAyLFBlKVoAcOz+s91kgAlUJqfRBwUTJeEnyD0R7YLfmQYiApV72JDT8uhnl
         3ts/Y5zRhe5/4fve0n6OyCWZg4oUJygsl+MBJHAbUkGdubT+8Beuwtqw6lDaGU3JS8w8
         +eXeLOgveU9IXqWDAtWzsi8P5hs6aDRrs+0w6+6BHcek+SDPduF99ei0fT3VsNLrQBaC
         uh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628367; x=1747233167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cK2GR+MTIxCdrAVL3u30qal7MJPY3+v+RkxSo+dm/A=;
        b=gFpFFj8tnLSyExSeBueUFVBMC9sg1rt0/1kvAyYnSDjeSAehXlbYyM8I2CLsPRtw6r
         cZM48+O4sqjkEYfPa+CzUKQvPqMLDIupwkc01mPgkysXcg5yvsBGMPIJwpiCbU4qlci+
         2ZTbXo5ZsQh8SGAwLMsE8IrIx0s/1tOmuGUp6B+t4pEUim9wXYpTNw1WS21DOrnS5BPm
         2MSGtHe3IJlR21O3cgIYu2Ag17kMM0FKH+eKyW5xjo2WYQHqnDmNXeu0+llfLp4RW6ke
         nE2bsAgY2ysvSGPdy8qA/OOsDGnG8/Yh4aZf8y9D1Km5uIZrZuXVsHx0RfIqf6028OsP
         EFrg==
X-Forwarded-Encrypted: i=1; AJvYcCWtYAw/P2ZAwB9Vb7wOf5bKaXhYs3/mbYlkLMUQKCYwxNn/2eFO20kSnE6hGCx69nupnicSIb7kDMrAE8EpvJ3M@lists.infradead.org
X-Gm-Message-State: AOJu0YzU4v6k5DS0x2hSkgWQpBtH9qmtWWAPP3HGeQd9qc9Rb5p43PeX
	hfstcI+6xetUqkaxQguzAfRrH6KXQRMAa3SnxZRc4AVB2PwxMC7q
X-Gm-Gg: ASbGncv1Kn1TCwE+CQ1PhdJnT8n9q05MtBxmksMayCE0MB4s6xNEm8fkzbfIm8VO19D
	U/VdIA64GjIEEllKmZqaFCfUqVlmnFwdXjrEV26OhxiJXExOlVRo82ygwid+Y0D9ubo+WUAk7nf
	SXzSmyWYrwZAshTLzIJ6TDj17fU4/wRO3IfiCVARUue7IH8yphE5t5CrpuTtet/+CpxlcheFil9
	63EuK08P5imM9M1Chn+FRpoSBxvItThg5um4JGnrAWGA+0am3i6btPYk2JhMFVHRamsLjTmYbMC
	lXb32HAPlIK7HhkcE7nb6GtBDv6c7qp58LlERLN33ZhyY5Y5p6eQNCbUInN5PObX6BelX+ShSwn
	XHV0quC5j76KiUhVNlJTMFPujVmw=
X-Google-Smtp-Source: AGHT+IEd1QJ3UGhkjXTiuM6IWrT+bURzxPWFWLEi/P7RC8gos+sLg4dyG+3f7M+cmEZydt7eQ6bD3A==
X-Received: by 2002:a05:600c:528c:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-441d44e32cfmr34862855e9.31.1746628366474;
        Wed, 07 May 2025 07:32:46 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3af15bsm2800915e9.30.2025.05.07.07.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:32:45 -0700 (PDT)
Date: Wed, 7 May 2025 16:32:43 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/11] soc/tegra: pmc: Add Tegra264 support
Message-ID: <fknux7o27tbcykml6ze4rcuwkkfxuiv7uvbdkejf5ikermr6h7@57jse3b45wsz>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
 <20250506133118.1011777-8-thierry.reding@gmail.com>
 <964d8b07-aeb1-437b-ac8e-c129c49b2a78@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wmguxf7cc2ndw7cd"
Content-Disposition: inline
In-Reply-To: <964d8b07-aeb1-437b-ac8e-c129c49b2a78@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_073248_228846_4563EF01 
X-CRM114-Status: GOOD (  27.13  )
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


--wmguxf7cc2ndw7cd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 07/11] soc/tegra: pmc: Add Tegra264 support
MIME-Version: 1.0

On Wed, May 07, 2025 at 12:03:39PM +0100, Jon Hunter wrote:
>=20
> On 06/05/2025 14:31, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The PMC block on Tegra264 has undergone a few small changes since it's
> > Tegra234 predecessor. Match on the new compatible string to select the
> > updated SoC-specific data.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   drivers/soc/tegra/pmc.c | 132 +++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 129 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> > index 51b9d852bb6a..6f1ea5b6b9db 100644
> > --- a/drivers/soc/tegra/pmc.c
> > +++ b/drivers/soc/tegra/pmc.c
> > @@ -2892,9 +2892,14 @@ static int tegra_pmc_probe(struct platform_devic=
e *pdev)
> >   		if (IS_ERR(pmc->wake))
> >   			return PTR_ERR(pmc->wake);
> > -		pmc->aotag =3D devm_platform_ioremap_resource_byname(pdev, "aotag");
> > -		if (IS_ERR(pmc->aotag))
> > -			return PTR_ERR(pmc->aotag);
> > +		res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "aotag");
> > +		if (res) {
> > +			pmc->aotag =3D devm_ioremap_resource(&pdev->dev, res);
> > +			if (IS_ERR(pmc->aotag))
> > +				return PTR_ERR(pmc->aotag);
> > +		} else {
> > +			pmc->aotag =3D NULL;
> > +		}
>=20
> This part make aotag optional, if I understand this correctly. This is not
> mentioned above and probably should be. Also, I believe that currently
> dt-binding has this as required and so we should update the dt-binding doc
> to make this optional too.

Good catch. I actually noticed earlier, as I was going over the next set
of patches once more, that there's actually an AOTAG region in the PMC's
address space, so I'm leaning towards dropping the above hunk and leave
the DT bindings as they are.

When it comes to these AOTAG registers, it's a bit difficult to tell
because we don't ever use them after mapping them, even on older Tegra
generations. Keeping it for now should be fine, and we can subsequently
drop them (and the driver could always just continue ignoring them) if
there's a good reason.

Thierry

--wmguxf7cc2ndw7cd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbbwsACgkQ3SOs138+
s6GdBQ/+PXZtw/PwLe1C1WBwkC4dYdLtKOFbwk1qXEFlf+QhwRhwz1DHrNmutqFS
Hc11IeCLgNnUdawS7IvX8PJWvw4voRcT6YHKgjyV1hHcGitARgYnVGEJ4nLyXjj0
ThGzWWDpMhgoivYAuQxyfbAkTCYv8ef96LhdigB7v6xsvTYsWCago/S4miXVxQGd
8FR6GXgckq1WLGoOh+scMF0TOoXDF3XRtX/A+okCt2+9MDwhhg6dKwaQXOn6fH0P
eDOdholwnsNdji0oXviRybo8Beiku5YLX4/NBU51l+OZqWBhkb4GQIdEQBTzzTsz
qLkbr/nsOvyALrS4gtGQQeatGx7Q9709OO2huURY8bk5EyNNfjFvH1YTDjSqdVJQ
6jkipWcafg2JwlmtmMduR/c1mGVLyypK/9Vb6cFCOGyXHAi8YPtCrygT3jCpD+H+
+WGoBAENxSeqk4BhlEcTwlgqAqMgNJCzEx/3UZMjA9YO7wBxFjymtRwwpmQ7mYKO
gMamMUL34Geyt08WEzZHuEIME1v4IL7W7t42D4/eBXp29ugxoUKXMJ7uKmzNCdRl
ZDLc0BmTVujtP40ywIbN1EMwsWwbJXggovmxcEoYJyqBm9zUb9QP35yZba7+AbIj
Ctno5Cfm3923b7Xsr7x9UwHD1rZy5EV3ksPO9bZrxSuUQDJBxdQ=
=r/81
-----END PGP SIGNATURE-----

--wmguxf7cc2ndw7cd--

