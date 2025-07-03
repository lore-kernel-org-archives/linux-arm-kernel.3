Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FC0C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 13:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WaqC49F51IOyelBTQXhzsOxCLazmLYXNHOkK7Ky7AY=; b=F9IL7kUN6grnhle3P01Grba63a
	QTm8dePS45arf9sY3ip3HaDRIhwd8Jirer8w6vTzaQQLQb11JCwiZ42dMlp86yLXgDR6EnExQ8XT0
	W0s+dWZVxUEPyfH13MAvLJQgcrrInRGb0TTrlM+6SnnI5IHOuuyibuIPdBm5L3baaGSysY/cPwhXP
	7f8iCr2b+qjvIJ9j6wwkO99aJ1lKfv1IGfRt6xi93e2nIPIwgAC36yMpFJjztIyYBnNE5inBLl4Do
	t3qrmZdldkmAPpMlwwu+tAKZmwPpO9AHWCJG01Q+N0Bne6uJ7jTETgUVfJgAJf1cvSOfTGX/nzlEI
	VxM8QlSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJqq-0000000BT0W-0eJf;
	Thu, 03 Jul 2025 13:19:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIhZ-0000000BGLH-0jh8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 12:06:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4531e146a24so47160385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 05:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751544364; x=1752149164; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6WaqC49F51IOyelBTQXhzsOxCLazmLYXNHOkK7Ky7AY=;
        b=AAG0zwK5QkAnTRnhLg5KeLTZhgS82K/P+75/R42B+UHCTqHb6c/RTGP65RKrLISk4H
         wZYkNFBPi/KjxkcnJHdZVVlpkWYWKNwngcRK72a+zgv5wjoISgNqHcWre14Fq2GDFcwQ
         s5/ZfGz/5wueh6RDU+2RgBt+aRBywRKpHq1RJDvLPtiijo+YLZ58MXu280rYhoXrXxyI
         V12CEQrG550m1G/Gj8z5jgVPx3MxpG5oMY3Ea/JOcOZg/a9rSu78Mg+GKdLq4TRELuay
         y0hKwi8a5zeW9iVtgT61k4oy19g+Kn/er6eP1bkPxkyTuS6EDPGe4cLOeLH869UXRdqa
         dTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751544364; x=1752149164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WaqC49F51IOyelBTQXhzsOxCLazmLYXNHOkK7Ky7AY=;
        b=qCI/OwLPplicqKKT2pxWjxKZJeuwnet4lhM967sFaPEzI2/g0qr5vjkYeGpPodGN+h
         JnVo8EKs1zi7L4tPN42iNkf7o/Tt7f6npd8rNl76qSy1+V835rurJULCre8LNJoXBw3G
         iyTTwkC2NkZt8daCjjwcRh4TXBNz7jFUBJkZ5qwDk/81EB1vFiDtO94tG59lupDu3Drz
         f3sHzCd1/N2s2dlsxs87DBwnBQ0WvojTeJhU7JXJqczJGgvBmJ7yfcFxpIufxhQFjVr8
         OdqWWj9bmd/pYM14nNb5HlLEsJaNxKWJtKv/MQF0pbzefmNS8w4nKhkSfoVYdfOlb+9G
         79gg==
X-Forwarded-Encrypted: i=1; AJvYcCX89+sQz+77biPETJj6kvbgdG3Su4ukhIMkhoczxTGaeoM5psk5wS56l/k3z5qhdplYQBhZ550SE/vlQhTFdDR0@lists.infradead.org
X-Gm-Message-State: AOJu0YybWeom4iwrXXeqM0Xq9DAsClukV8HZbORg92dxNpP6HKntlFbN
	Fx4WENIl9QXjrjAKmG4akvCZ5X3vqQD6Lu6kY28PKP/tpOYVooHjauEH
X-Gm-Gg: ASbGncs7kxnkON0H4PWSF1JatiF9kyXKDqIiltYzNi3kFwB0Hx2vff7K2ghDZhaXmaJ
	OGXS1Ne1mHYFbBBbuVOUfP18Erle5HGMP/SB+xSEWnSuI1atipQLDHFwc70vrz1LUmkioNiHh2+
	OuiogVhn+fM3iUzf4deaDA2bhBW7+nvH+MflEDcrDXGhCqGgEDkpsHmTfHr/zW+z+gYAw781jXy
	lM9Wu1vPmhfbJhE8Jl2fKH1Z22v/GfXadaUVZZ2/IAMCFnmfBWWSam65UD4mQV9kVbzc2rmIL/n
	ZaozzzXVLgjuQMY6uraomE/nXqh5+i/G4F347ACwPvVdghuRUa9qtN48iHVsKWJ4jRBJDnv9IUV
	W07v8cherAXj1CaIlUwIRTGVNQtkz1PCAOgsuP3oYHrnQthVD
X-Google-Smtp-Source: AGHT+IGrBlPl4cRrJmgRU179mhSMUlfqSodkLrix516bOaydIFPSh5W7HlkBnUI4slm7YJjOXnlyYA==
X-Received: by 2002:a05:600c:c0cc:b0:453:8a62:df34 with SMTP id 5b1f17b1804b1-454a3708ec2mr43553745e9.21.1751544363158;
        Thu, 03 Jul 2025 05:06:03 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e6214fsm18693068f8f.98.2025.07.03.05.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:06:01 -0700 (PDT)
Date: Thu, 3 Jul 2025 14:06:00 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: Forcing devices into idle
Message-ID: <hjkm55hus3ctueydf7ebfb25hbdw6w3spdzx7maauzlzmnakas@noqexx2pxxtj>
References: <rlzpjdsg6cbgxc553j6m25ysb6tyldy4lnxsjjn4hdzv7rszpp@y6rfcrbjfook>
 <fbfc6bf9-d7c6-4df5-85d0-b1d357159d88@suse.com>
 <CAJZ5v0hPh19h9uVRVHSXiLaHxm3PR9A3W5+j=2=-B-YCyBr=uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c3trq7oliwem474c"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hPh19h9uVRVHSXiLaHxm3PR9A3W5+j=2=-B-YCyBr=uw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_050605_213723_D6DB61CF 
X-CRM114-Status: GOOD (  28.92  )
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


--c3trq7oliwem474c
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Forcing devices into idle
MIME-Version: 1.0

On Thu, Jul 03, 2025 at 01:12:15PM +0200, Rafael J. Wysocki wrote:
> On Thu, Jul 3, 2025 at 12:33=E2=80=AFPM Oliver Neukum <oneukum@suse.com> =
wrote:
> >
> > On 03.07.25 12:08, Thierry Reding wrote:
> >
> > > Any thoughts on how to solve this? Is the pm_runtime_{put,get}_sync()
> > > method acceptable? If not, are there other alternatives to achieve the
> > > same thing that I'm not aware of? Would it be useful to add a new set=
 of
> > > APIs to force devices into an idle state (which could be semantically
> > > different from runtime suspend)? Or is this all too specific for any
> > > kind of generic API?
> >
> > Basically what you need is what happens when the system prepares to
> > do a snapshot for S4. However, if you just perform FREEZE and then THAW,
> > devices will assume that user space has been frozen. You need a way
> > to substitute for that assumption.
>=20
> Well, you just need to freeze user space beforehand.

Freezing userspace seems a bit heavy-handed. There's only a very few
devices that need to be put into reset (such as the GPU), so most of
userspace should be fine to continue to run. For the GPU the idea is
to block all incoming requests while the device is forced into idle,
and then to resume processing these requests after the VPR resize.

But maybe freezing userspace isn't the heavy operation that I think it
is. Ideally we do not want to suspend things for too long to avoid
stuttering on the userspace side.

Also, I think we'd want the freezing to be triggered by the VPR driver
because userspace ideally doesn't know when the resizing happens. The
DMA BUF heap API that I'm trying to use is too simple for that, and
only the VPR driver knows when a resize needs to happen.

Is it possible to trigger the freeze from a kernel driver? Or localize
the freezing of userspace to only the processes that are accessing a
given device?

Other than that, freeze() and thaw() seem like the right callbacks for
this.

Thierry

--c3trq7oliwem474c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmciQACgkQ3SOs138+
s6FrWRAArTr2+v5/RiI52gbOtblSZZHd0u8bRWvZc9eKsca1KbnLFzZqLR3EtWTj
LR3Iulq6+bbV7R3mxRltaDyZMzW8PzHy0/TO4pRV0sX/N3DUGDx9HkXHyGxCmfl2
zqRoWKvHvyX27BNImb/pk5HwxD6FgDyc8uRb71jR1/Ur7Wrs5wh9w/RCPU1ffOvD
54n1HVluWCJN38tDM05fsTdmBErnMbN+TkDxXusbmtOdAZBWLtkHxSH/3b9k5O/y
yokK4UfzVDVR3S97p5Q+hMi93fHztgR7rtDQjvMjELghNxO5cKfUrYRuqUYQASAC
VnuccLKZd5g/h05WcJaCScnxxA6yndutfVIh/okQc/g0P5ZY9obdtZ4e089D0jql
om7njxOFxVC0Dmr4dIePDlN19oStPGf3m2C9ZhqNQLKksarWF4rG9uX+ZIalIUN3
PrN1bGSr//mBuL0vAyj1VkrtIajFp1HqMfb1l9VGxvA0XVGPxuwn4+8X/i1G99rX
AJt7FzFfHHricO2SdmbpTpQPDOoTJa8YEKcaj6cuzFr7eb4yVrob7NqtIqhZ92/z
dk50CNH35WHeUToip/P8Fg499IcjMJEzHgqnTISOP89p5+gdKYLVhEpJX0eo0TkX
1eZ1EPawFYKUyscLynI6MhmoXcGLwo7/06bQ0KkGU9sVKal4Xx4=
=EP0t
-----END PGP SIGNATURE-----

--c3trq7oliwem474c--

