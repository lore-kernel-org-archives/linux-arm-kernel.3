Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D01C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0V7NkDIEc+/eOQ6W4dZ09XTpw5W6+N3Lcj8PdPlLeM=; b=1KeRWvhXdPoK0JAFUR8AcyvI7v
	nWbOVahQTJO6nVeVN0likSFxcYNPtmCLajSGibI3s2yHPt++TSP087JBP0MwLxl/UnNQHBSTn8t6Q
	urY3y15CTj1HI7NwYFBLzvs1mt+agmq61ZNy/qcHK2yDMpT83o5J8/1PwwEZnngNPs2cKjKHTAERq
	w6fnqdcoc9mZ40nDKwFlr+8ax5nkndA9JT1WGJAWNJ+qh3E+s8FsA1vvGNK0VQAUghLBZwmPqDgUn
	IWYqfEZgolak4aQJYFQ2+YNm/alwK3kFwugXZ8SaZ9QBTRixRqrySbPKDn4o22FvyQhkiCTz6qk0p
	tq5GrKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMnY-0000000Bzkg-1r4a;
	Thu, 03 Jul 2025 16:28:32 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKhm-0000000Bcl4-2zmB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 14:14:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso19678415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 07:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751552065; x=1752156865; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q0V7NkDIEc+/eOQ6W4dZ09XTpw5W6+N3Lcj8PdPlLeM=;
        b=Nj2ZNfe/oYkeb6GdSgXyQ92S7bvsQ9lKEd8+PNyeuICSXOvaQPfnbkTXmipSduWeNO
         R3ToJdGOvj3VClJ4O2vfVlHtD96ncgOVMklPEdoyPUzENcr6MXJDFUd9wufkYmlQxTai
         WuVByB/h/cmwTTwDVjagR3F0ONnrXia6xdciifqNvPvJ78oNMR+9BNSKRtTTuaCupG2J
         GDnwCib7FIzmZJss1xg9VKF5FsVytOQYZz6K1Y/R6pVUCLTZC7yB2ilK7XPDMm7wrR2N
         I8qiYxk9Vb4BSkg8Sy3Vm7Tl30lM9I5Et0y90TJKx1VJfqOIp1pZw4MYtaj3GPL6m5vb
         GWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751552065; x=1752156865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0V7NkDIEc+/eOQ6W4dZ09XTpw5W6+N3Lcj8PdPlLeM=;
        b=POa/2a2iMXRALE0LM7bdf+EbPMfWyCAH+ZDU/EQYUKyfD52wGOhyNSiNabxgbJOAEg
         xMgdw/71W0PYdqY1QyYmGplPkmg2+CZbmG2dHatPH/s5rDYn0+mlo4Gxz0pqdGgcnqtx
         LitozCeEQJemLXzecLF7/cCJs3CWKLr+p3vu+8HlYeUDtEAYvsCwUGbOasSppgZh001F
         /4yWyAfxX6jOf8OE+8cILMg6srMtI+ui7Mn1vST7uknF2W0qzKQGVYj9PCFliqP6+3UE
         r6+PkmvbUA3o1n4uEB+12SDDxEGPnVhRL1RlslD7XI82fMPF4oXZ79wo5P1RI/GwkO8W
         ozMw==
X-Forwarded-Encrypted: i=1; AJvYcCUa2QGdUyxzNiIl20oATvtHEeDl3lFkhQH7V9F4gO0s1w2N7Byk3nMGwqCmtfGCMiUFKinZ6N5/rK0KapK+dyqd@lists.infradead.org
X-Gm-Message-State: AOJu0YzZzUSIDZvuQUhKqG2xA9muolu6x52SGQp4vG+fH3gP6BYcPIA+
	AsKlKUZ1ubmzZ0xUIJl7M+LRGlAWMBeJerCrrqA083BReHGtbAgaIojr
X-Gm-Gg: ASbGncsiPmKLEv4amQuK/XrjRx7lmai7heKgul+kfZ59/a6TuRUwKabPCU4b9FweB5N
	3OeHkGAZLSCsTKvM8Ox+nQOgdSZ/vxlZ5XxnJvxEWX3yJNamiMkYdoLHUAzHhrvK06C0sVM5rOn
	Bg3chyQ7gt9PLYl71BebGeZjUVcvygFkZV5nAZrfYA/V7cnD6tRfA69gfKRLQ41XuopMXRiXoKi
	/gxeAqaKRFCIKgH3vmQfdMlvuTKPEaFlSu9yS35NZM8AJOcyijl1+MwDmVnXdbFs+ZYFZgwQ1hm
	apx357ou9wgcinPwqXhXZ9SJ+oZYZ/8y54rIKPPyVSRwJck4WJlnIABgtcaFbZanAgdv8rarIjN
	Byo0pFeDbqLCFylpz1H/1URjQsGmPIRxweDHilIIfzJI8eMamNqlXxsyHsD0=
X-Google-Smtp-Source: AGHT+IHTxdrOhvQwD9mAm+OYtxuX4BGPWcT02Tytvb0U2VzogK8kd5aZKkz6G1E20h9EBpsbmYKSvQ==
X-Received: by 2002:a05:600c:4f87:b0:450:d012:df85 with SMTP id 5b1f17b1804b1-454a9c9fc7cmr41407445e9.18.1751552064802;
        Thu, 03 Jul 2025 07:14:24 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bac51bsm28466365e9.39.2025.07.03.07.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:14:23 -0700 (PDT)
Date: Thu, 3 Jul 2025 16:14:21 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: Forcing devices into idle
Message-ID: <lhqjjycgtiap37ckghkyovdyosxxo5ugdep6t7jjtxidk3rws4@re2x2rom7chc>
References: <rlzpjdsg6cbgxc553j6m25ysb6tyldy4lnxsjjn4hdzv7rszpp@y6rfcrbjfook>
 <fbfc6bf9-d7c6-4df5-85d0-b1d357159d88@suse.com>
 <CAJZ5v0hPh19h9uVRVHSXiLaHxm3PR9A3W5+j=2=-B-YCyBr=uw@mail.gmail.com>
 <hjkm55hus3ctueydf7ebfb25hbdw6w3spdzx7maauzlzmnakas@noqexx2pxxtj>
 <e635l6gfpg7amck2hnu4l47tnc54lr6e26v7y3ohaywil6pjwr@4trxzfdigo62>
 <CAJZ5v0gsLCpGnA5fNSSVLOoPL6Qinw=o_fBGG-0iFKeWyQtFZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fidxxisyxhzeepwx"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gsLCpGnA5fNSSVLOoPL6Qinw=o_fBGG-0iFKeWyQtFZQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_071426_757476_1266A78D 
X-CRM114-Status: GOOD (  56.77  )
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


--fidxxisyxhzeepwx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Forcing devices into idle
MIME-Version: 1.0

On Thu, Jul 03, 2025 at 03:46:03PM +0200, Rafael J. Wysocki wrote:
> On Thu, Jul 3, 2025 at 3:32=E2=80=AFPM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Thu, Jul 03, 2025 at 02:06:00PM +0200, Thierry Reding wrote:
> > > On Thu, Jul 03, 2025 at 01:12:15PM +0200, Rafael J. Wysocki wrote:
> > > > On Thu, Jul 3, 2025 at 12:33=E2=80=AFPM Oliver Neukum <oneukum@suse=
=2Ecom> wrote:
> > > > >
> > > > > On 03.07.25 12:08, Thierry Reding wrote:
> > > > >
> > > > > > Any thoughts on how to solve this? Is the pm_runtime_{put,get}_=
sync()
> > > > > > method acceptable? If not, are there other alternatives to achi=
eve the
> > > > > > same thing that I'm not aware of? Would it be useful to add a n=
ew set of
> > > > > > APIs to force devices into an idle state (which could be semant=
ically
> > > > > > different from runtime suspend)? Or is this all too specific fo=
r any
> > > > > > kind of generic API?
> > > > >
> > > > > Basically what you need is what happens when the system prepares =
to
> > > > > do a snapshot for S4. However, if you just perform FREEZE and the=
n THAW,
> > > > > devices will assume that user space has been frozen. You need a w=
ay
> > > > > to substitute for that assumption.
> > > >
> > > > Well, you just need to freeze user space beforehand.
> > >
> > > Freezing userspace seems a bit heavy-handed. There's only a very few
> > > devices that need to be put into reset (such as the GPU), so most of
> > > userspace should be fine to continue to run. For the GPU the idea is
> > > to block all incoming requests while the device is forced into idle,
> > > and then to resume processing these requests after the VPR resize.
> > >
> > > But maybe freezing userspace isn't the heavy operation that I think it
> > > is. Ideally we do not want to suspend things for too long to avoid
> > > stuttering on the userspace side.
> > >
> > > Also, I think we'd want the freezing to be triggered by the VPR driver
> > > because userspace ideally doesn't know when the resizing happens. The
> > > DMA BUF heap API that I'm trying to use is too simple for that, and
> > > only the VPR driver knows when a resize needs to happen.
> > >
> > > Is it possible to trigger the freeze from a kernel driver? Or localize
> > > the freezing of userspace to only the processes that are accessing a
> > > given device?
> > >
> > > Other than that, freeze() and thaw() seem like the right callbacks for
> > > this.
> >
> > I've prototyped this using the sledgehammer freeze_processes() and
> > thaw_processes() functions and the entire process seems to be pretty
> > quick. I can get through most of it in ~30 ms. This is on a mostly
> > idle test system, so I expect this to go up significantly if there
> > is a high load.
> >
> > On the other hand, this will drastically simplify the GPU driver
> > implementation, because by the time ->freeze() is called, all userspace
> > will be frozen, so there's no need to do any blocking on the kernel
> > side.
> >
> > What I have now is roughly this:
> >
> >         freeze_processes();
> >
> >         for each VPR device dev:
> >                 pm_generic_freeze(dev);
> >
> >         resize_vpr();
> >
> >         for each VPR device dev:
> >                 pm_generic_thaw(dev);
> >
> >         thaw_processes()
> >
> > I still can't shake the feeling that this is sketchy, but it seems to
> > work. Is there anything blatantly wrong about this?
>=20
> There are a few things to take into consideration.
>=20
> First, there are 4 tiers of "freeze" callbacks (->prepare, ->freeze,
> ->freeze_late, ->freeze_noirq), and analogously for "thaw" callbacks,
> but you only use one of them.  This may be fine in a particular case,
> but you need to ensure that the other tiers are not needed and, in
> particular, the _noirq ones need not be involved.  Also ensure that
> they don't assume that PM notifiers have run (or that they will run on
> the resume side).

I think that's something we can accomodate in this case. The primary
device that needs this in the integrated GPU on Tegra, so it's very a
narrow set.

> Second, if there are dependencies between the devices being frozen and
> other devices, they will have to be taken into account.

Fortunately, as far as I know the only dependency, if any, would be via
the userspace. There's no relationship between the devices from a PM
point of view.

There might be a video decoder that decodes images into the VPR and the
GPU would then read data out of the VPR and composite onto the screen.
So as long as userspace is frozen, there should be no issue.

> Also note that kernel threads are generally not affected by
> freeze_processes(), but I guess this is not a problem in your use
> case.

I had read through some of the documentation around this, and yes, the
kernel threads shouldn't be an issue.

In any case I'll make sure to add comments where necessary to point out
the peculiarities of the whole thing.

So this sounds like a workable solution. If for whatever reason freezing
the entire userspace doesn't work out, would it still be possible to
"abuse" the freeze() and thaw() callbacks like this? The way I imagine
this would be for freeze() to include code that effectively suspends all
userspace submissions to the GPU (i.e. effectively suspend all GPU
related operations).

Thierry

--fidxxisyxhzeepwx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmkDgACgkQ3SOs138+
s6GXohAAijEUZWwb7m4k0LLH2s01oyPFu0nC9B7LXWNKpAxcChnSkul3zLAU5SjK
UChG1XJURudu5GwbW+6sVoZVsvmyF7tfrhizcrUi0jZMvFP9TfzgxPRHDRwaGQky
p6OmEDPSl8q9JEMzqSfJdFmAdRB2f7Y1+zstAp9nSb/kxyPYw0/5ihCfNZmiLd6/
/D/9Bz3D1EzqZeXVq7JTcbmnWGG/WdqwsDJXSzPEbr9ecQPDZ2CoWyBznDDIwisV
plYOZmtBlwp9p3Y19+c7QtkmNVurXu3gglFpKoIUz2SLBG5AP9WtAhrjnbEagqrW
h36uLAsEa3uuF6q6xw3Qmwbd3gWWfCMF5/A/w/6S9skPLda4fANoYykQP1IBc47r
cPPoPNotQLPLerMaHZr0M251yUK9ZRERhfEilK7ZxHHrDxaZhjfup8edIm2dUy6D
trPYt7lNpa+tMaWYHpmKROoUIMIWlRAbzjRzXeVv6jm/ThPfuHnLyv+QiH7qCL4w
+Yju0ZDl/t0gdi37qVpKNIm4RJmr3n6OEBhqEtonAIYdd76Eaoa0tuUUPg9EwrpF
UFOrEDX4OCg1UFbyfjMruL295rHRbtL7cxEYRv3iu3D7NZKRe+fnGQfW3mvAPIoN
isqQFsM9i7tls2P6TGT2uq5tCzBkbTL+FtuPenH6AfIjxLZvVII=
=dpfT
-----END PGP SIGNATURE-----

--fidxxisyxhzeepwx--

