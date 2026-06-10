Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3F2CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 21:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ig2OVt3TBv7ddvTUNvfJSFZLo8RWweuoGZlGh1vDWos=; b=zUrXvRtO7yFyBBWFPfQ/k99WXJ
	KJ1VBmErx1D4LEKpIZqdgMiKuue/xzT9TqpqkV7EFLjUMsFA65Mrjgj/gPqa1FWvC9l48oXk5yY4N
	HQS//lnexwl+hUQhP1F4XdChDb89AHM5wBxURm+diqSb9fVMtnESh5admt0f4q6Qst2Cbi5e70lp7
	lp6/z+7q2OXqbeG7AWqf1+MleV+2JaEBL2VNjrnIdrwf3e6h9hgn1PeDU5UNzgzKgD5Tc5kKkl/Gs
	3wIV8U5OdwUmJa8i1WeHzF7sr4pe9rcWV/zmt6Y23RqpUULUDaobAt/eUNjd/5AwWn2C9pgdrRbHK
	vSkkYIXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQAQ-00000008Mwe-1LXO;
	Wed, 10 Jun 2026 21:08:54 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQAN-00000008MwI-11PE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 21:08:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so5482541f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 14:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781125729; x=1781730529; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ig2OVt3TBv7ddvTUNvfJSFZLo8RWweuoGZlGh1vDWos=;
        b=jApY5gdhZ34OcJ0xziGGiux7XNCKLORQpN8HhDkBhLkLiHj5eTMOiddS/1Pi8CN0YT
         KV/3Rdl/Ngy+WzUwf8hgemP/A5cILkAZlU/wizVqwrWasCXtNsuJ5K08AK98sO68w3YU
         aBT9a786Qgq2C6abPcZDMixjTJln8m26r7itMBf0xsOZtEfpju4S9k9FJ2mjIhREno3q
         kHb+blsa/yrhhCjSeg0N3v+3BdhKmFNLcJve8xwx0qPujfB2TTLjjK8Kgp3vIGbwIGRd
         pgWOBpqSzGSliV8e0eUzFzJzbhfmalV6douhyI468OWMap2Po4jm5teHwoQz4v1OWwWd
         VigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781125729; x=1781730529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ig2OVt3TBv7ddvTUNvfJSFZLo8RWweuoGZlGh1vDWos=;
        b=UikCIstMeKdNkMikjilv/uPHk6fK4NiZeeRD72oMtLRcDM2CXI5V+BJoD/k/g0kjyi
         LwNNV0UfXfpA5KvOjP2iiR6YGvKv+jMdUdDdzDSp3hbJMhTnLyfQF78tjSqBfuqqFWLj
         LplCGv6nZs0fQn6gXrETc4v989kNbEra0lQDW/8MrG7E1BRyAjoMM9G8lnDrnBZAhJTi
         rrjeBXOwthQ6lUaIEoWmGx8S4m4aj6Oh//kDILsR0qb3vpGBbMeZY3G0WG6WfmRX8ItB
         fFL/16hZ3RjJbN1yZGym07DCOokFnUEZ30Y9VsCB6A5OQkPz4iljX8lsAqN9lh56F84o
         cBeg==
X-Forwarded-Encrypted: i=1; AFNElJ9AbwXxkLtJ/+dJAW2QfeKWGnrTcBl35mEZU/DFwCBwvZJYYo+4vepvuOxaBlm7vihaS2AUmrrTQ24AqNBeMii0@lists.infradead.org
X-Gm-Message-State: AOJu0YxYxQltmsXNDrwe19LP5d0qjdPaiFVJ7TiqRgYZFsm1Q7UFPdZn
	pRJLoc7xp7Ra6pyHDYvdoT1seREx0awP9Ahyc7X3ElnXadxBA1DJryQBPE3vgGo0vWs=
X-Gm-Gg: Acq92OF/2avBu9c/OlQRtrfGU9vQzRu2u/3g4PryDL/gxhpLaYvatinwD7F/4YeSp9f
	dAIKK/OfxBSKTYdg2yD46SFxpQgeDbAi39Frc68MSj+2bhQVZuUufHET3NXirXR5rMmLOjXCChl
	WnVYi0rSLP8fATOUz742gJM+VhDFgkxJrYIYQXDKwSS2MBF87PG5Fsx2NYcPU7M6uzPuSlwxQ+r
	RvVaE8nRUIzZXdboXfDN+EIbqg7YBSmFXHoZg1TgZGImIyt2X9/xtv36pHTmUli0wTotLnPIkpq
	Jy1ytAlu8FmLmfD5NoQgW7yCL3NdHkWBxHgm2XxDztRDH9q2CDkyJSwCFH6jOJPewWqSiQjZ3XT
	xL/G+qbuAjkLk/cyrF5f81Ii/rJMxRXSYCinrZBP7hIgPm15i+JV3VakYpATDAcMM/vYMOclKzH
	/xoMr9Cx2pBcRNJTZNj2F+X63El5DofaKzjjGg0D0=
X-Received: by 2002:a05:600d:640f:10b0:490:b7e6:bd1d with SMTP id 5b1f17b1804b1-490c25e30a2mr298781385e9.16.1781125729131;
        Wed, 10 Jun 2026 14:08:49 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46028a6dce6sm67341274f8f.30.2026.06.10.14.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:08:47 -0700 (PDT)
Date: Wed, 10 Jun 2026 23:08:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Marcel Holtmann <marcel@holtmann.org>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
Message-ID: <ainSCcYroJUIAuwr@monoceros>
References: <20260504160940.2168650-2-u.kleine-koenig@baylibre.com>
 <aimXkX4FC4JVxt6q@monoceros>
 <CABBYNZKuOdtxa8ksEZM1FyjYJCQ22H6NzaX31t6LcZuvn0LMNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xqdkuhrraxjetghb"
Content-Disposition: inline
In-Reply-To: <CABBYNZKuOdtxa8ksEZM1FyjYJCQ22H6NzaX31t6LcZuvn0LMNg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_140851_305167_B3B011BB 
X-CRM114-Status: GOOD (  27.09  )
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


--xqdkuhrraxjetghb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
MIME-Version: 1.0

Hello,

On Wed, Jun 10, 2026 at 01:13:44PM -0400, Luiz Augusto von Dentz wrote:
> On Wed, Jun 10, 2026 at 12:59=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capab=
le Hub)
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > On Mon, May 04, 2026 at 06:09:40PM +0200, Uwe Kleine-K=C3=B6nig (The Ca=
pable Hub) wrote:
> > > Initializing a struct using list initializers is hard to read, compar=
ed
> > > to that using named initializers is more ideomatic. Convert the macro
> > > used to assign values in the driver's pci_device_id array accordingly.
> > >
> > > This change doesn't introduce any changes to the compiled array on an
> > > x86 and an arm64 build.
> > >
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koen=
ig@baylibre.com>
> > > ---
> > > Hello,
> > >
> > > this is a preparing change for making struct pci_device_id::driver_da=
ta an
> > > anonymous union (similar to
> > > https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@bayl=
ibre.com/).
> > > This requires named initializers for .driver_data. But even without t=
hat
> > > this is a nice cleanup making the macro better readable.
> > >
> > > Gcc is happy with simplifying the assignment further using
> > > PCI_VDEVICE(BROADCOM, BCM ## id ## _DEVICE_ID), but this is a bit fis=
hy
> > > because PCI_VDEVICE also assigns .class and .class_mask (using list
> > > initializers), so I didn't convert that.
> >
> > In the meantime I learned that doing that would break W=3D1 builds, so =
it
> > was a good choice to not go that path.
> >
> > > Once all pci_device_id use
> > > named initializers, the two zeros can be dropped from PCI_VDEVICE and
> > > this entry simplified accordingly.
> >
> > Is this patch still on someone's radar? Ideally for application in time
> > for 7.2-rc1?
>=20
> It is no longer in patchwork so if you really want to get in please resen=
d.

Instead I unarchived the patch, so it appears in the patch list again. I
hope this is easier for everyone (it is for me).

Best regards
Uwe

--xqdkuhrraxjetghb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmop0loACgkQj4D7WH0S
/k5XeQgAoTcuZnjClD8CBiVzulCVvCVSkCfgQKHapo9L6hikgCrhNsvTOvHMFU6S
XDZ2dot5rGjM/KAYI0h8FHaXTdH36OKmbjykaiP+DIFuHS7VkpWcSc2EM7hAvZha
uGcJCF4xyc5CyNPElG/wDPHJdL2fJPJkKUjMeDiFSnU5qRg4spodg9e2dD03Hrap
0D0yH2F9jcYbHNC851gjYuJ3NvrJEHijOc8vg1Ylw8+9LsQDrt76yI2uffzB8/6n
/CFEgnnByMZObzRw6oaxYc9jXkjK+e7oiquz56xyx0c3SqFOlMrBPo3Zj2G9LIRM
UFLkgNRU51FxahnG5mJuKv98enwHMw==
=zDmy
-----END PGP SIGNATURE-----

--xqdkuhrraxjetghb--

