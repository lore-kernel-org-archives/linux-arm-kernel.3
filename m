Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBFA106F315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mz+6nG47ilX3A59NTc4OGIJD2EZY+ExfhHZBUxFJ8hI=; b=FhWrKHZFCEXxDuGofqJ35rb+r2
	s+eFoo8TBFuSiQDbY0vm9n1Aacxo38EuDOAV2/NcN+u14qR3sQxxiNhsMRuVzGKInmLmvxSp/2nbn
	z4Ko8ctjSnwVhJLvOgvI4zhqUpEKoeMkacyyyTEzGzoVdc5X8XE0zAM1kjTepFasFVWYWn53L1qLz
	WwEu0P1TQ5mSwWT5ZDyy1PzyYSpUfiPlCmMpTeH22+N8waxy0W70gCrA4/nl/gxOQ6vyZnhGsNZ66
	DpE9ck4jRrrKAtecU/Z8r4fR3RJ0AAZmLexyRRNnW3b6LvJgv2BeUWXYibE0hJZDOvJamfCynVKMy
	1Vg7Cphw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hU7-00000005CVM-09h5;
	Thu, 26 Mar 2026 09:58:39 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hU5-00000005CUy-0bJT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:58:38 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-439b9b190easo493922f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774519115; x=1775123915; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mz+6nG47ilX3A59NTc4OGIJD2EZY+ExfhHZBUxFJ8hI=;
        b=Y8nfHIFaoJridKcyIFIi9hrGphgLS2/stApGHCL1ET223TGH/s/Alwhtv57TjaTDRO
         pHfmkPwAZVLAyyolQHzQK7hYqbvB5mdgyE9n7KmVHALXo48s/Ujxwknb3YznwUNzyM7Z
         wMS75wGhL3/Uv5sgliufstpM6xykofPf9anfAbElBmnjHwOJtbr0JoxCQ9YrEp5m6Jg8
         xc+GnHYOMnwN7C7txYuBlBMDnI9iWNlSYI8i9/g3jTxUDiTZak0kEuUYe2yVROY1SzHd
         oknda0hZ7B2c3Yiq96MbjWFRJZlgWKFASc2goaNbnZgbW9y/SwE5EX0IfjmGvwuvP1wG
         YVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519115; x=1775123915;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mz+6nG47ilX3A59NTc4OGIJD2EZY+ExfhHZBUxFJ8hI=;
        b=X8oifpJlHejM3vs/eAXrqR0/UvmA8jveSmYhUYbFDwk7Puc3zQMUeTkXqiEWvUovOH
         m8JllKY3AFHmXMPpl8io1hj/hgVQ6Pr+qE66j+sxNGwRh+Wf7hWFJy97jVHoR3S0xLz9
         0M7bh2A3AlfB0bSI8SC62HEW/HMxokzcZ0UKGbze7PDagHIJavDhjKOMdZnd4V/akCMe
         Rzx4xJgsuGKsCQWhxhVHSFmNM1SJE/pJQ86sYW2LJjPBofgYnyWwDKr0mz3mwklWjn+A
         RoHzq9uwoNodu7UAKs3Bx+FNipSvFEW7btpqS82Ae6f/LJw4sD0UWOilfL7Vz43617pr
         EvRA==
X-Forwarded-Encrypted: i=1; AJvYcCWBdLsUPs8tYA4vAk0fdg17Dc6hS4FaBhlc/Rlcl406Lgt3qAu+L+DM2EopkTwBdCYiAz90v78EK2EQq4d7wBNN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9vcmqawr6OIhdzTs5lAr8WxEkC/3w1xyTDoZzi7orwNtXXHpP
	fxnReRaC1fJTX5PVCSJDmX9qRgNZD5AZR4aaK+gp4yerQkQLwkDEy+eu
X-Gm-Gg: ATEYQzyQRAMoqduAHYZAYMrxdALaYH4OTpcHQ3Z6y+cV0tfV5MWipcuXImVpNmUjPpA
	RRFJGew6c9KR2q8PcxlKNTCApwCMu5NVQuriQdSLMenAgJ/zrOBih/r2FQZOk+XlYF5YeizWm3X
	yVE3ZmoW4jkv0jbDmZMTcLDYWtrAG0JASycBxM6JXwhEVBKwS6pCsVmqq5SPiyfMRGXvBpbfgOm
	NfItoWlTVvct98AhN9F9algthlHkfwLnf5AXP5TqnJprAMr7im2YLJwI1OlH/KRlX4Fdc4wXv3h
	IpN4VY9p3gwf90YfPLh+vZYS4+uHwJ6nWaHMLa+qqiEWtsaD9vOAbXhCLndyZdrkDEtVGAx0HQs
	QrPD56t+Dy5AoWdUXUTlBfG+eyVT+C0lEAqN9/vlQIJ0ZriApvlGdiPzmMDE6BFKSi6JZWJYMrz
	Bwhwu9kcgznqFHQ9qXo3N6NQ5prWRlq31R3/1gHb+IscDTqbWheTdHs2LFry0zl5FPjzYpz8Hld
	0qePtZ8Zef7aL0hRw==
X-Received: by 2002:a05:6000:2902:b0:439:bc2b:cb57 with SMTP id ffacd0b85a97d-43b8899d2d2mr10957682f8f.6.1774519114620;
        Thu, 26 Mar 2026 02:58:34 -0700 (PDT)
Received: from dell.localnet (2a01-114f-4a05-91c0-0000-0000-0000-0540.ea.ipv6.supernova.orange.pl. [2a01:114f:4a05:91c0::540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91943184sm6132528f8f.14.2026.03.26.02.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:58:34 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Hans de Goede <hansg@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of GPIOs on
 Nokia 770
Date: Thu, 26 Mar 2026 10:58:32 +0100
Message-ID: <6058205.DvuYhMxLoT@dell>
In-Reply-To: <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com>
References: <20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com>
 <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
 <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6331700.lOV4Wx5bFT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_025837_218403_327AE793 
X-CRM114-Status: GOOD (  23.06  )
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

--nextPart6331700.lOV4Wx5bFT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Date: Thu, 26 Mar 2026 10:58:32 +0100
Message-ID: <6058205.DvuYhMxLoT@dell>
MIME-Version: 1.0

Hi Bart,

On Thursday, 26 March 2026 09:57:31 CET Bartosz Golaszewski wrote:
> On Mon, Mar 16, 2026 at 9:50=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
> >
> > On Fri, Mar 6, 2026 at 1:31=E2=80=AFAM Kevin Hilman <khilman@kernel.org=
> wrote:
> > >
> > > Bartosz Golaszewski <brgl@kernel.org> writes:
> > >
> > > > On Thu, Feb 12, 2026 at 12:46=E2=80=AFPM Arnd Bergmann <arnd@kernel=
=2Eorg> wrote:
> > > >>
> > > >> On Thu, Feb 12, 2026, at 12:25, Bartosz Golaszewski wrote:
> > > >> > Currently the board file for Nokia 770 creates dummy software no=
des not
> > > >> > attached in any way to the actual GPIO controller devices and us=
es the
> > > >> > fact that GPIOLIB matching swnode's name to the GPIO chip's labe=
l during
> > > >> > software node lookup. This behavior is wrong and we want to remo=
ve it.
> > > >> > To that end, we need to first convert all existing users to crea=
ting
> > > >> > actual fwnode links.
> > > >> >
> > > >> > Create real software nodes for GPIO controllers on OMAP16xx and
> > > >> > reference them from the software nodes in the nokia board file.
> > > >> >
> > > >> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qual=
comm.com>
> > > >>
> > > >> Acked-by: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > Aaro, Janusz: Can you please pick it up for v7.1?
> > >
> > > I can take this via the OMAP tree once I have confirmation from
> > > Aaro/Janusz that they've tested.
> > >
> > > Kevin
> >
> > Gentle ping.
> >
> > Bart
>=20
> Hi again! Any chance we could get this queued? Janusz, Aaro: any objectio=
ns?

I'm not able to restore my test environment right now, sorry.
However, the change looks harmless to me.

Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Thanks,
Janusz

>=20
> Bart
>=20


--nextPart6331700.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmnFA0gACgkQ2WqSnlts
jBq7zwf/SlUujvOszUgmmL7ZvRqg7N4thVWbxI4Fs2PxRX4HUkTwGpHaL3K9YOlv
bnhkhThw7SVDAm7RzZtrsQqhrYiH3eeszxX6IcR4U/KOOvSbzJWwiZiuI4XDHe+R
EE9OT+H66KCMg+BNdWDZrf3d3otqCSTtY9Qe+qJjLGqKfb+tCUo2Qs9HVaU9ZACA
f30YOKOXbXi/D9OkdRmvex8EyIOXa2RKm06eUeuDHgEr65jT0yK/k1QprDj3U8fu
XRhL5LIA2OcPsVeGHN+n/2v0cGdZseTMD8ztneitzcGLOIk1ZHDLY3hJMXpxui2M
9dN0uqYVqv4dLykMTv+4a2QSm1aERA==
=XRf9
-----END PGP SIGNATURE-----

--nextPart6331700.lOV4Wx5bFT--




