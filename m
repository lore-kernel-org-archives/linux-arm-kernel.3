Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F35EEA85A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 21:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uI0DWSxvm6NFySyRZeE8NYakt+hMKZcgOA3uk/TYi0k=; b=J5Wmc2C1WjNsIsvrZouVm9AxlU
	E25eav7mYfjh+LQsD0EwACk2649vThYtHtiUe2EBWzfmRovsj4ASOI5dUa7dQwxlGsT8nvv2fFgI0
	ntKCl69wPS8F9mtICrv1YHQ3PrrtsBr2Kgm+3gXuUTg7r1ykbyxAacD565tXa0pkbqB9wopeXKl0+
	TAF5bC7VOdrVxFq4haIqaCqW6G+aOZNwE1pFIVwKiQsTvm2hvGBFYVUbPBtpmBkWAhFb7sKv2ZyWJ
	XePvRtyqiqysPLlEcm+HlepDcl69oEal6NIAwBr/oCydSf8CghoNtGTmq8IUtEzJof1lbQ9EY90do
	lnbEai5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqeXL-00000002fOh-0hNg;
	Thu, 12 Feb 2026 21:47:47 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqeXI-00000002fOI-2fbS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 21:47:45 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-385bc6910eeso1985441fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 13:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770932862; x=1771537662; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uI0DWSxvm6NFySyRZeE8NYakt+hMKZcgOA3uk/TYi0k=;
        b=WqfdeeKTK68zU5owtuj6AueZZt6lt5vIsHAbFiaj/rmNHi+deiHwChOS6Ewvd+AUjk
         JMMkInB2ednB14a2kFsG4lwj7hVRr+WktAczg3jTxqMbC1LcAvl2JlzPjavQRTa/xIdy
         D7308U6VOKku7NOwDeMCmt4AU40ca9o6ofCrx7m/lrjcYiCufx93I1gpFx+fRcpbM0oa
         XLwmDrnxC4pGy0naoIkp30+W4OOgjufHUG5bdRCWlEkrbwiDWnEanbUJT3YzyMSZDuNK
         FIJT8qRYd8ZthYcpXUM6YXJX02gFL/uh5l15BKi3izP4AUQyafWnP2QiqPxu58BxvZvq
         Kn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770932862; x=1771537662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uI0DWSxvm6NFySyRZeE8NYakt+hMKZcgOA3uk/TYi0k=;
        b=fGriqd1IhOHTlCe/v91Z0XwfSLhLGC2edsuFF2thR6uOOoMEZF2Ap2RlMY3C9VcErt
         2iDuSMdgx5vaBPJwkqRkXkcqlfUc8I/rSwWaF3S6zcq9hypgdurnITr9281P4s/CPiwq
         F16ccmgXKTmS3rxiGy6gD3Z0ssF3J/ey6B5USvN58iAq/01j/7Xos7vOLrB7c6EmKQQQ
         gC73G9mW454/j2ke/GDzxHA/lzb/gEnrgUEL9dFEvlT0DYUkm7a4EiR0uUcu4uGUdlMk
         a1/XksR5B2vAZqpSqB3s8wpdSyxnGHN1YHqcuofVaZ8Rq2ei4pnub9I14QRMVrl1UB6z
         9LaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2YwF/4/Rh54jaHVQ7XWzAPLtBffaHHAkIIJ4X0v13LF4lsymYOB1rs81hrMe7OKCSY8fjeCHSftrJ3mUdDwbM@lists.infradead.org
X-Gm-Message-State: AOJu0YyVUR/aQu9WqYLlzWiZ0kF6SnSAIdHd/hm+4ZZT96pRFb0HZlcM
	35p3jtOhOxw/Axdjl30YtlXLv4shAcrrabCvT4epmXAq4kFjfC+KmntL
X-Gm-Gg: AZuq6aKvJy6vgLqqcuO+dGIELkEjZPPjyTHcJZQ6D8+Kjrv052UheDBvp6pETIpSwCu
	+MWG7MzUVgtf1F8SA8uhClbmG7HTe4qIGAVYKHRwInqLBV0iYPDTOK5JMICuJRANzcawQC7pLC3
	4MfFuZSUKc6wiFK4yw1povpuac7ONnhXeirSu1V8q2Acwaqy2EynHyEO976P+24mZVI5F/eZzqh
	I9k3VORXZFJq+X83GXDqI4M4eIS8En1tAuABVL+Vu3wrgit3bqSSYJipyP4MDShFarn98sfiXZZ
	pyL1t2sHriEsLrs41QvcERsNtyv/Vy6kSXzVT57SMQP64eP3rleJ9XG6qtSYtncJyrXZaGiri+T
	L2+GGkgnr4W/+1d2b9Nbm9JI3zPygvkPjKWt5KpR3SLtSmQNm4HRx2ChpIxfZJW/QOzSRWdbZNj
	1jBeZfVEGayosDyYrPJ/hvrNvN1uKuCyEdawtUGOvYzDqhu1L9IyS0itXkFgVr
X-Received: by 2002:a05:651c:41c7:b0:385:f7ce:f322 with SMTP id 38308e7fff4ca-387f80ded45mr477031fa.35.1770932861977;
        Thu, 12 Feb 2026 13:47:41 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38706928d9esm10989251fa.42.2026.02.12.13.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 13:47:39 -0800 (PST)
Date: Thu, 12 Feb 2026 22:47:36 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/5] i2c: mux: add support for per channel bus
 frequency
Message-ID: <aY5KeH3Z1S3MswHI@gmail.com>
References: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
 <20260128-i2c-mux-v4-2-dee49ce276c0@gmail.com>
 <2ecbebd8-0842-34fa-a593-25168c91aa6b@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+EwcLp+XXXrhpKBe"
Content-Disposition: inline
In-Reply-To: <2ecbebd8-0842-34fa-a593-25168c91aa6b@axentia.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_134744_722628_018078CA 
X-CRM114-Status: GOOD (  23.17  )
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


--+EwcLp+XXXrhpKBe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter!

Thank you so much for your thoughs!

On Thu, Feb 12, 2026 at 04:02:16PM +0100, Peter Rosin wrote:
> Hi!
>=20

[...]

> > +static int i2c_mux_select_chan(struct i2c_adapter *adap, u32 chan_id)
> > +{
> > +	struct i2c_mux_priv *priv =3D adap->algo_data;
> > +	struct i2c_mux_core *muxc =3D priv->muxc;
> > +	struct i2c_adapter *parent =3D muxc->parent;
> > +	struct i2c_adapter *root;
> > +	int ret;
> > +
> > +	if (priv->adap.clock_hz && priv->adap.clock_hz !=3D parent->clock_hz)=
 {
> > +		root =3D i2c_root_adapter(&adap->dev);
> > +
> > +		/* if we are parent-locked and the root adapter is our parent,
> > +		 * we already have the lock we need. Otherwise take the bus lock for=
 the root
> > +		 * adapter before changing bus clock.
> > +		 */
>=20
> The assumptions made for the "otherwise" case is wrong, I think.

I think you are right.

> Consider e.g. the case where we are parent-locket, our parent is
> another parent-locked mux and our grand-parent is the root adapter.
> In that case we also have all the locks we need. Trying to grab
> them again will be a deadlock.
>=20
> The more correct approach is to do the parent walk in search of
> the first ancestor mux that is not parent-locked and then call

Hrm, does it not apply for all mutex-locked ancestors?

Consider the following chain:
Root - P1 - M1 - M2 - P2 - D1

P - Parent locked
M - Mux locked
D - Device

In this case we need to lock both M1 and M2, not just M2 ?
I'm not completely sure though, I need to refresh myself on the code
base.

>=20
> 	i2c_lock_bus(ancestor->parent, I2C_LOCK_ROOT_ADAPTER);
>=20
> for it.
>=20
> Again, I think. Famous last words. Handwaving...
>=20
> Cheers,
> Peter


Best regards,
Marcus Folkesson

--+EwcLp+XXXrhpKBe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmmOSnMACgkQiIBOb1ld
UjJJuxAAry/YKUutgdQpqDwjHcLxJ8g9+h48FnCkvCuZYOtcjYn9DnGyzNEHJFRU
QHHwGWr5YkH1I+mxO33fLPHDPcrvXiUeyPNaMbtzc5TJoLPa+3ijYKO0reKvQ2ky
gg66PjR9X1GYAwCbObk7fuBjkMQvsOEG0z8nfT/1EMOMFBgnnkGB8rV/JajjsScT
iek1dWSsdogCaaeC9HBMDrJtiybreMtIVpd6AyKSP4BZJ3SoCxnSzEfmUNsRbkTR
FiekVhRCzE4x/ENnUAffaiPJJ85jkiAh/oiFCGXTbhaVrX3ECmuKBzXgwMG/KfUH
A4Wkn2N/0XmO5DwlBgZjJgoPM+3jEBGmdxtR/8Els3/sbJeopKRJj/K+ugDX+sOi
/aRgqSQSlbXfEGjCFdofLekKmHgu15IxqX6yMjKCVkF1nlUtSKlOyXwunSEwhTXd
rPLJFXTFDd9VyEZt6kPD1QbaAyTqlXGmqD539T9vr/fOB9lYZRUxgS6J729XbWFg
JDjkeEBsZZ+ET5mdGEboFzJY+Mdy5Pgt9sYv/MWsGuvAG4tdilD/EkCCueypcxt3
syAtReFNlgkJCQkV0OI0pS1ttYdom3yzhdNH7GylSbERUTuCpsFX21fgWlgYsiaP
OS+t0KqO4nCKaTEYkS28ZhUBmkgj41PN1vTFsRawGBrCntIfSDI=
=NZ95
-----END PGP SIGNATURE-----

--+EwcLp+XXXrhpKBe--

