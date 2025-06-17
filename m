Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9848EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 07:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yr/0G9QcVKTsH2nCRZsPlndI4/213HWXG/qnBI+qj0g=; b=3HwVoATkg8BdtRCh5UF6gHmoKu
	RhjLFqHwLynZtIqYDT76IxlarRwCpCyDIQ/kQCCpAovWrXjuQ98ulYqevcJq0N5NrAnTD5KK1ftWb
	mZj41DJ9K2c2BBnrmpgcxLr1p444isJVQPYhnyjOcatGd1uiyDq34LB3GtA9tk0V+xkUJbiQ88w1C
	WNTI9W0Z6A7MobCQ+dqz21wsz+WL0aIjmfCXQQXkO1lHGnGilNwECB1h5Ggjm2kcTxZ9E6zApaFDj
	EIKWKop/zEJSYJWlVAkDuD0f17+4rnw4Jv4DOwIo4liW/6Up940PnnWIZoYAELCEdZzmhMZhsciNm
	Aiqz7z5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRR1D-00000006Uz2-0WjZ;
	Tue, 17 Jun 2025 07:46:07 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQyt-00000006UVN-1T2u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 07:43:46 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso5204213f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 00:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750146221; x=1750751021; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yr/0G9QcVKTsH2nCRZsPlndI4/213HWXG/qnBI+qj0g=;
        b=QgKl4u6RVc51izQTfHwtPh6cgC6v1fp/7xMjLd17qkdxBsurLG0jLijMNC5OzX2a4q
         f/acox0RWuIc4oznJ7irY3WCROiOjR59K44/ByPTDTFPz1bZs30u7RXt5BIXck2+haxh
         SpQAVD3a3sxg4kdEGuoddSvIS35w1KzcKyNmc7xz8h53nx+GiavHVYvYmuR8JF91Lktj
         GwXkpKQNcFQXfWEfaIWgXahdlvgb3Mhpejrru3DCZXY+o4U7mEQEz97/AiXuHTwYLVbk
         Y4jRATBEPE1JCBczaI77mTxxUIWQzeOBI/ZInpv+i2DMgYVKC9rfNOnZ0bQ2NsLbMTI+
         xJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750146221; x=1750751021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yr/0G9QcVKTsH2nCRZsPlndI4/213HWXG/qnBI+qj0g=;
        b=j1ko0VZxbNQOE/kuIgFyLlwBM3IM6iSl5w1Faq3CJGrSAl6oIb69/R3CCmTRuhW9kh
         lG9i2k+K0ZvDxR4gk0smvWrjjaO0sbXCnt2bYGuymaNkIKhObkVoByxQweqTZTESjXD6
         aSinlgVAzVJEMrwY2jZjb4pzk4OmczB2X4ITNHOlasr87XuydEPKeALgRuGMwRl2y+sr
         vybgUj7wx8ZcdVx+orcVbZBbt4c1Cr5Rsgcjv5+Im+HabfgJLgkHah+oZTA0Iw60CnaX
         vw1T8zaffO2TVbF7ruZd/9r6Wr4M7PmYydKZffejUqJbCYg0XzvFRNdZC96xm2axLSMj
         k4TA==
X-Forwarded-Encrypted: i=1; AJvYcCUFwUR0YsFVhLTIiFfCWRWjGbpLgiLieYkZ8JhUnI9Qx68A/lk2eIZ4AjtvaFiLiZXHD9O+wt/ANCTtA/zi6CC+@lists.infradead.org
X-Gm-Message-State: AOJu0YyijGmYliQbGNhpLBl4Om2o+c4bejxTJvqtraGzY2CamGjxJ3tg
	3UVFkZedXVRvdPGeERK1BLocedOA0E8+7TAwYwo+x0P9Pa4X1yYEk7lx1lDy4MxzPr4=
X-Gm-Gg: ASbGncsxntIi0NC91slnQ6LpMfsTymHK++VvZPGNfpH0+7bI6UDSvo3VIMDXJ6cztT5
	4KZmOqSvM3Zbtg/BPqU0JLYKh1CFcxI+PlvvcncbBm7yKI0f/cv4KV/pBCIeVH5JENYSuxeGQOo
	ztv0i8RZ2bMpu/eKTDwB1ylzQ7poB84UqDxanNx1ZOo6KGk+HJA/km45pxv5zkf4H8ewQaqeLcw
	Bum+XX15ZauG7cCOmKwsmnNSbml8e2kZe7z8eS73b6JGkPpLlhRuaAhJvRm4/2FN/kLrN/sOFLD
	AFQpIDMKndt0+cueg3UF/WhIKaHZkxmUgU9MW2ppBT11gYLt4W+DV0umUNp/QikpxIC769yvpED
	o4JOYCtEotPcWvJhkehEHx7dGUgO8
X-Google-Smtp-Source: AGHT+IHjO2Se+CNiFhQkijyy0zThy6btDct+3FCrSMJqJK2Ek1zZ0kq2x91GfZpIV9vpmdDOKsNMTg==
X-Received: by 2002:a05:6000:2302:b0:3a5:2cf3:d6ab with SMTP id ffacd0b85a97d-3a5723aeae3mr10062193f8f.39.1750146221186;
        Tue, 17 Jun 2025 00:43:41 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b18f96sm13293332f8f.66.2025.06.17.00.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:43:40 -0700 (PDT)
Date: Tue, 17 Jun 2025 09:43:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Abin Joseph <abin.joseph@amd.com>, michal.simek@amd.com, 
	yanzhen@vivo.com, radhey.shyam.pandey@amd.com, palmer@rivosinc.com, git@amd.com, 
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: zynqmp_dma: Add shutdown operation support
Message-ID: <rgjc7ujikyznrri27u6v3zst2m44423g46rlfnkfncr24jwx6z@mfwwvhe3upby>
References: <20250612162144.3294953-1-abin.joseph@amd.com>
 <aFENfW0v0gmtY2Gu@vaman>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pas4lfeknrusfsyc"
Content-Disposition: inline
In-Reply-To: <aFENfW0v0gmtY2Gu@vaman>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_004343_630475_F5258C7A 
X-CRM114-Status: GOOD (  22.76  )
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


--pas4lfeknrusfsyc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dmaengine: zynqmp_dma: Add shutdown operation support
MIME-Version: 1.0

Hello Vinod,

On Tue, Jun 17, 2025 at 12:08:53PM +0530, Vinod Koul wrote:
> On 12-06-25, 21:51, Abin Joseph wrote:
> > Implement shutdown hook to ensure dmaengine could be stopped inorder for
> > kexec to restart the new kernel.
> >=20
> > Signed-off-by: Abin Joseph <abin.joseph@amd.com>
> > ---
> >  drivers/dma/xilinx/zynqmp_dma.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >=20
> > diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqm=
p_dma.c
> > index d05fc5fcc77d..8f9f1ef4f0bf 100644
> > --- a/drivers/dma/xilinx/zynqmp_dma.c
> > +++ b/drivers/dma/xilinx/zynqmp_dma.c
> > @@ -1178,6 +1178,18 @@ static void zynqmp_dma_remove(struct platform_de=
vice *pdev)
> >  		zynqmp_dma_runtime_suspend(zdev->dev);
> >  }
> > =20
> > +/**
> > + * zynqmp_dma_shutdown - Driver shutdown function
> > + * @pdev: Pointer to the platform_device structure
> > + */
> > +static void zynqmp_dma_shutdown(struct platform_device *pdev)
> > +{
> > +	struct zynqmp_dma_device *zdev =3D platform_get_drvdata(pdev);
> > +
> > +	zynqmp_dma_chan_remove(zdev->chan);
> > +	pm_runtime_disable(zdev->dev);
> > +}
> > +
> >  static const struct of_device_id zynqmp_dma_of_match[] =3D {
> >  	{ .compatible =3D "amd,versal2-dma-1.0", .data =3D &versal2_dma_confi=
g },
> >  	{ .compatible =3D "xlnx,zynqmp-dma-1.0", },
> > @@ -1193,6 +1205,7 @@ static struct platform_driver zynqmp_dma_driver =
=3D {
> >  	},
> >  	.probe =3D zynqmp_dma_probe,
> >  	.remove =3D zynqmp_dma_remove,
> > +	.shutdown =3D zynqmp_dma_shutdown,
>=20
> Why not do all operations performed in remove..?

=2Eremove() isn't called on shutdown.

Having said that, most other drivers also don't handle .shutdown(). IMHO
this is special enough that this warrants a comment. Or is kexec a
reason to silence *all* DMA and most drivers should have a .shutdown
callback?

Best regards
Uwe

--pas4lfeknrusfsyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhRHJ4ACgkQj4D7WH0S
/k6fcwf/ZARJglob++15lJ5FJZx+lpM9MqpTeUGMKnMzw6B014DEmMpCveShyVjN
pyGyLhkwI9RHVm9w0L3Gw5tRsEk6gD228K8xE/8hLk+HYNPYqsXlE/B+2AM+Y50/
Taac6eUG7W9ZGdz6nQxSvROz5tqT5r4WpYvN+TC6hyb7H4KVB963oWjZtwONnBJH
/bsc2E3kw4J+wctryB6wce6W3ajZEkpaMyyMdzAWTcJ+DFQICD+vb5lJM8Ob8iyH
RSdhNesjl2KzAFDd75PCPRrUuD08Ndu1Wq35d1+du85WP4vLoiBR7mrW4YSjW5iI
cu529KsUImojosD6g6IMeCKHknJMqw==
=Lai6
-----END PGP SIGNATURE-----

--pas4lfeknrusfsyc--

