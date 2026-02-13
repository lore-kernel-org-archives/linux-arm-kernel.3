Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB51EDF16E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EhD5ARQ8TNV7FJPQTkx5mhW0z5ojGhz+tn+MBPMaXs=; b=ZUoNAO2dnfREHjKMAiPzouoV/F
	cd+1lUt2D9RxSAQmzuJ5QtEstrLYnMpqExZpb6FYKxXllE8jPNSKSmrXxz0h0RiVsQTp/etSqTeLY
	gG1r4w4goOHdVV9hq4NeyZAupjAd5F+XXRIHvYA1/n12JDFtu/j7QeC/htkTsn1dhZbnVw16XtPQW
	XeXpGPfnXWZQBGtSWiHKzSBpWam5Eck1i8iAZVkEwYXAlx3wrM5XJHiFOep8Qt3bMWpYwxJTE3U9t
	2RXNObVIEq1ot7Z/GtwZM+9Ab1mqDkEg3vyEV9PNjvLkPYGwGFWFcChCYGEG/rJkBNmMGRXcP8lPS
	DYZ9DpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquIS-00000003Xjw-2jKq;
	Fri, 13 Feb 2026 14:37:28 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquIQ-00000003XjF-0Ecl;
	Fri, 13 Feb 2026 14:37:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770993431; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NVCxn5dkyb5CqLLEY73qeZN+f2AqZndkyy09kpUGozULkqUpln17vdvx+aRlLN56b+oppXd8ZdIMSbd+GTp1FjdLt7fO9SRKRdTrz8AlEmlpZQNacYMbyOsSythICJpnNgkxF+MGIBbvEKPLQ5cPTJMA6hfMFhEUN0svO5G3uSQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770993431; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2EhD5ARQ8TNV7FJPQTkx5mhW0z5ojGhz+tn+MBPMaXs=; 
	b=YsuhunsD70pLhylOzSl2JxIWckbRiXlLobgGa9DubriF4sf87y3zklMZ8G7aNlfLOBpUV3Nx+XlOuVB5J4lV3P+jkiiGu8gWkCZeNJVfjF3XO+Qh1rewUgmxwXj8oSBeAl3Z6z7XUPeRu5zLZ2w/69pcZ7AZ6JJby30FJHmlD4E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770993431;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=2EhD5ARQ8TNV7FJPQTkx5mhW0z5ojGhz+tn+MBPMaXs=;
	b=TiiKj1YWqbnZYGQUfCXekYux2PEx3HUPTB8myE09Bf25xmVMMenSEJpDIbtlCg/C
	Dswds/yHPFUc6QqvngTiKXxCosXvDbi7quUk6HUkcN7yWpI36C8txyeu5qhVNYH04Pw
	ukq6pRqQESjMBSgIyufeEbMTBwsEj3BGjyZeh2y8=
Received: by mx.zohomail.com with SMTPS id 1770993430367305.83315708574753;
	Fri, 13 Feb 2026 06:37:10 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 2883D180716; Fri, 13 Feb 2026 15:37:06 +0100 (CET)
Date: Fri, 13 Feb 2026 15:37:06 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Frank Wang <frank.wang@rock-chips.com>, William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH 0/7] phy: rockchip: usbdp: Fixes, DP 1-lane support and
 cleanups
Message-ID: <aY82Lv1rth6fiTJE@venus>
References: <20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com>
 <4a7a30c4.8848.19c288ea1f3.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pyai57wb77urqxjr"
Content-Disposition: inline
In-Reply-To: <4a7a30c4.8848.19c288ea1f3.Coremail.andyshrk@163.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.1.0.1.4.3/270.955.72
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063726_120026_1B317701 
X-CRM114-Status: GOOD (  23.40  )
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


--pyai57wb77urqxjr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/7] phy: rockchip: usbdp: Fixes, DP 1-lane support and
 cleanups
MIME-Version: 1.0

Hi,

On Wed, Feb 04, 2026 at 08:09:22PM +0800, Andy Yan wrote:
> Hello Sebastian=EF=BC=8C
>=20
> At 2026-02-04 02:41:26, "Sebastian Reichel" <sebastian.reichel@collabora.=
com> wrote:
> >As there are some issues with the DisplayPort support, I went
> >though Rockchip's BSP kernel tree and looked for fixes. I found
> >two small changes for the initial register setup, which do not
> >help with the DP issue but seem sensible in general. Afterwards
> >I added one more fix, which corrects an issue that effectively
> >results in USB-C adapters with combined USB3+DP capabilities
> >not being able to use the DP part.
> >
> >Afterwards I added one more patch adding single-lane DP support
> >(found in Rockchip BSP kernel) and a couple of cleanups from my
> >side. These are logically independent from the fixes, but I put
> >all together in a single series because they need to be applied
> >in the right order to avoid conflicts.
> >
> >Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> >---
> >Frank Wang (1):
> >      phy: rockchip: usbdp: Amend SSC modulation deviation
> >
> >Sebastian Reichel (4):
> >      phy: rockchip: usbdp: Add missing mode_change update
> >      phy: rockchip: usbdp: Rename DP lane functions
> >      phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
> >      phy: rockchip: usbdp: Cleanup DP lane selection function
> >
> >William Wu (1):
> >      phy: rockchip: usbdp: Fix LFPS detect threshold control
> >
> >Zhang Yubing (1):
> >      phy: rockchip: usbdp: Support single-lane DP
> >
> > drivers/phy/rockchip/phy-rockchip-usbdp.c | 114 +++++++++++++----------=
-------
> > 1 file changed, 48 insertions(+), 66 deletions(-)
>=20
> After applying this series of patches, the hub that previously
> couldn=E2=80=99t recognize Alt Mode can now detect it and work properly,
> but it also triggers a USB-related SERR =E2=80=94 did I miss something=EF=
=BC=9F

I thought this was from a different patch that I needed to get DP
working. I've spent the last week debugging this and I'm just about
to send v2 with a workaround. FWIW the SError is not introduced by
this series, but before it was much harder to run into it.

Greetings,

-- Sebastian

--pyai57wb77urqxjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmmPNwoACgkQ2O7X88g7
+ppjZg/7ByGTasj1iMKoHN/SsfWXN5HMjVWOI9LP5Mnk6WWAq75c5fQsRbN5pGXf
N4amUcoJQMdqtscF1nBL7Zr7VpMuckiaznIMtVZ5tJADKmGiZYFOVmX9pYrEtyBZ
gBbDlwbGeSLGuyqRfIT5Qwk6yfRCp28UBI1TMDGZ9Tmpr1bXRrerxhQA4nmNgO8/
PVbC+o708Jq/wA6N94wUuiSWfO8E2uoXT34jxxXlpafyd5CjRjig9YhTy8Hlx4FG
74gJh6E+60pjd97VTYyHGQCUEeGfpdhssoXqMyKu/2PyKMq0IlOxA5+rfmy1fBrB
LOn19SocAf8tvvHRYfxPy/ZAsITDPyaHNaDJXVm5ncy/zms7HxcXAj9BRcEhhmt+
nQKoJHtO55H7ujYlFHFDNtHhTArE65KiE2N2vSpy5hj4aTfSf7bYKrpjBA7OKrDU
eF6kGsnLU2zYbeC+gMnSH3KShJeX9oHljmLbb1UGNbhK065FdTcZfrRw0WPJFi5T
s6tQeoUvrNB6Fcu3eGgx1itGLsyJtSKyIA+VA6NJuM5mlQqIeCHq+DjSQFAPRqpc
RwoNmYmbVmoFIu80Zs21UAANl4AUdLPrkUBix7WA2pUrsaqCZz7ER1vt9FadYF7A
ASn0UsvDpe0c/r+I2Kr2uNBRyY62qfRDBIHxK0nv68imoGOrE1o=
=h3lh
-----END PGP SIGNATURE-----

--pyai57wb77urqxjr--

