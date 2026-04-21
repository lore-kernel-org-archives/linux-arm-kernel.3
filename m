Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ADCF89248
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8i26WnvEzqtjggoSSbd+ZCeLOG6Y3DS7nQqRJJ4EJQ=; b=TH/3Vd+P1Bgum12VKnvcee6Lsv
	HpciTC5Qn9hXvcXtL3wfpzKr868ksJ9J1TpFL1L9OHgxS41ee+8sEfs+6nBbig9wS2AFa5+IDcjDx
	ArYxiqm7zijwr/gUPoa++Bq29B7qbTFSbPf5a3o0gywtYe4SyPU/OtUYB4E+HMiAEsJneJDghDSjH
	mArA50ywiro5AU/JzXKZo0RrRTq4qUBbnMvem4EwS5csFBkdmUB7btM6GqFtyiNSzHcwmUmkRbp/B
	Ix0O1KuoC+8nTSa1PJ1T15UQDxA4z5prfdG54x8f71LFwkCG9VSPkdBIeQ5if249aZpLhLzJYeo0n
	QPV9RUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF842-00000008P9q-0Sfv;
	Tue, 21 Apr 2026 10:10:42 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF83z-00000008P9V-1aeI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:10:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so35859655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776766237; x=1777371037; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8i26WnvEzqtjggoSSbd+ZCeLOG6Y3DS7nQqRJJ4EJQ=;
        b=K/SX/P5mUs0hMocD1G/uKwSZ8FXC1BX00UAE/T0MOMot6i2ZbnspSRfxxjKkOwse+w
         E71xNmLElw/4E/Bf0cIQij+j1AFR4e0BgdKAt68kITkiVdnREyEJIIHW00pfSLNYPVeP
         2W7Kr88hnfAdfpGw5gFjNAwsdnYaDiwXanTRqlfl98WKxx4lLPZU0wCRETw1Oz3jOlti
         8ZPLPVdJEhnGfFv3Jnkv3IqROvXa9F0Cx7X80gE3MUsBkGt9XuLGZbYmF1+Y81ej3CRn
         eW7EXch+3Bez0TVpdrp3hcX572+FXXUJSnoAcJ/YQU3Kc4HnBSPMyOBV6X3620lhYgii
         EMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776766237; x=1777371037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8i26WnvEzqtjggoSSbd+ZCeLOG6Y3DS7nQqRJJ4EJQ=;
        b=l9PvybfstGnhpczzmFGyKrwSxOCQX4L8gUtM3tD23ljd3xbERWeSx8X6ykT3GwakA+
         zD9nSnT2TGJlcGTc7hgQwsrzq4ka3VtGDuVZb9hliCrQCBHhkYFqdPTcmgav2kI7EL0w
         puWMYS1Cy34U+Uj2u2Phsf7noSBeYbZujvuklrKjVxxtEPJsrleS8j/tJJBexnF/9N4o
         ZtJ55qbL+idzRUvueWGgr654PNGCYGe208Z712QmL7bItP7W5UrY5lQ8AVU3ze24VgtF
         1IBuV8Lpcjs2rfkELfCqoz4F7QmgWsoWZdtkWfPV+Lalv+1jFc9jmAeAxQhgIZuaHsP3
         bMFA==
X-Forwarded-Encrypted: i=1; AFNElJ+BHxQ7Z2IglQT16tnZ1ndPxZdsRZ7wMRhplj3DTrold7tMvW45g1g32NG6BK96qrQPvWTS1H462dxSx1o4N43C@lists.infradead.org
X-Gm-Message-State: AOJu0YzTa3ycP36prisRwIMVAANdKhh0wxvBHNA/uwYsMCGObKJWP4Mt
	3OoCklpMj/ctnTM3qq6g6b9phKwhAPm7Uf5aY60HRlCSnKUNPt+7IW/k84BMMw==
X-Gm-Gg: AeBDieuoN52siv1VHt4VsovaxUR292leNWwAG3d+JbnIb7ZK4Ifvj+2lwQcu3rEdNQV
	SYPgYfX1n2JAjuYWkYJKMfip86ctbmEmmNLDpXhUVCENvwMensb8/QHqwPd0L/j6NZVlbTQieWk
	J5thjmmwW37NFZMtD59xuJ3Cp4sUDJEpxmLBYFjOTCSgQLo3bVevnj1Xm384hCT7g3EVuVDFhle
	DaAQOM36mP94Cgf9c9oW+gRYZvefR6TyG7agp5VeDZofwmtiRFnu6GyyyrXsMMAQWkkRmYvDr6S
	4IxKhQD5O62PA10Xidujp3xtCsdC2v06lZAlb+CulaUr1N0AQTVrGgYneRLECBdNr33WUkagZ5F
	GoVMZBaGHjapl7OpoMV149Kh9CuFKk+OkiqIk0DZKwrMSOS/JiWR5Kq1FnAMUXQR+Jv0Jat5+Tx
	2cXYx3YbHLavEtE729T7VMekvp1ZAZa4z2DzLRr+ZDJwEj2NKohdbUdKkWaekKyzWtaVOpbyHci
	RCUs0uRBlOmw2o6c15w9AaP
X-Received: by 2002:a05:600c:890c:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-488fb739cd9mr198783905e9.1.1776766237036;
        Tue, 21 Apr 2026 03:10:37 -0700 (PDT)
Received: from orome (p200300e41f131500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f13:1500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm149377755e9.9.2026.04.21.03.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:10:35 -0700 (PDT)
Date: Tue, 21 Apr 2026 12:10:32 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH v2 1/3] MAINTAINERS: Move Peter De Schrijver to CREDITS
Message-ID: <aedM9A5vZSpg2ejS@orome>
References: <20260417131549.3154534-1-thierry.reding@kernel.org>
 <CAMuHMdWeXS3ytgozp-mSrW4jcMRCW7_tbDTbMoEdXdbVj0dqJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iljpeusu54227slh"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWeXS3ytgozp-mSrW4jcMRCW7_tbDTbMoEdXdbVj0dqJA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_031039_563057_43F57B15 
X-CRM114-Status: GOOD (  15.02  )
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


--iljpeusu54227slh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] MAINTAINERS: Move Peter De Schrijver to CREDITS
MIME-Version: 1.0

On Mon, Apr 20, 2026 at 08:50:06AM +0200, Geert Uytterhoeven wrote:
> Hi Thierry,
>=20
> On Fri, 17 Apr 2026 at 15:15, Thierry Reding <thierry.reding@kernel.org> =
wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Peter sadly passed away a while back. Paul did a much better job at
> > finding the right words to mourn this loss than I ever could, so I will
> > leave this link here:
> >
> >   https://lore.kernel.org/lkml/alpine.DEB.2.21.999.2407240345480.11116@=
utopia.booyaka.com/T/#u
> >
> > Co-developed-by: Paul Walmsley <pjw@kernel.org>
> > Co-developed-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> > Co-developed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>=20
>    "every Co-developed-by: must be immediately
>     followed by a Signed-off-by: of the associated co-author."
>=20
> https://elixir.bootlin.com/linux/v7.0/source/Documentation/process/submit=
ting-patches.rst#L506
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Good point. Thanks, I'll add that to the patch.

Thierry

--iljpeusu54227slh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnnTRUACgkQ3SOs138+
s6FtNA/+IOGgvf2lEqydkdm2yLiSq9mf9BZV7RmX1tRK5PKD53tIx45Jr6VhFbsA
lUfLPKoMJaUJvC+a4SglqYSgjVTR/OXgqWIN8PkWlF7DedUL2pFsF68A8RY0Zz9H
INvSyIIKld2hbW6rMvclNX9G3NKbYoGjNdO/+iBZ5Yg1rNN9fG6BP+QUFmA3TrCy
5x45YruOqPkCcE6/9JslSP8F3xibDt30ZrR01QyBL3GawSrlR24+EpN9WxTlOT+M
eo74keyH71q6J3tT2EiBXJXkB28XSh9ZSlEe0nfcERy0xxFFu9BoGrwCQaLIOGQR
QWMu4eX/U58VInPR6ltYCv7prkAZf9bcrVE25ym3A8TtsdmK27KYbwWKND5Sjlhd
R3p5/Hrtkjuyg1c06co4BUc+vu73LJ6hktpY9Iu2KLOIPRCC+Oh9TOcpkhmPrSK2
JUpmvDinXx6XjUNVGrkfzcdbm6JUGMQiX4i0YEtR6uAb7zfi9VS5Ow5cfoQJu5ZP
OvlcJt0vPbSUhNP4Sqg7xdvqU6g2/soQuh9Kf6Wt0MJPQQrtr0C20HhRxfDwNcId
SIuS8X8BqPv63mRwVSAu0ENlqs4X3qD0059UV+cK+JhLf89cz51OgAFwguzBDX5p
KS2X4VY3cTIEvF3AKA5/ZjcCPYtkJOkXqheTUcfvQuhuy9rHR4g=
=YfYq
-----END PGP SIGNATURE-----

--iljpeusu54227slh--

