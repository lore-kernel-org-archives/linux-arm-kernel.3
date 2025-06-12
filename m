Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C483CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icfnPJxQK+6jhDwUzz9Y3fm8tV+truVzDKj2VhFlMo8=; b=xalRIiItdMdHhEz/szGqLdtM/T
	PZhQdIK8/nZ5ECTa7qfZ2Sueu4fjWiFvVZqwSw92gXfSWNwagJBOBebrM1oY5b8pV8REp/Njieijz
	quZo7gt2Q/C8PlK4+60SKAct9Td7pm/OwfQ8qha3mBqDV1BvsaPGpOBs32r5x03B+xex0ZkUXi/IA
	96Qzl9P7cNPMyO0aJd5O6wnmYFOKPuvL13MvurM0sagVrNazy+wvo8eOUQOKpXnj1KDnqFWM9mKPa
	aoyXpf7MrJDS0e8jWAyAF6Cpf/CCzA/8o/kj0Eh+RbAhLDhgzvN7CFza5XaHGi3qXoacSihWlJk4q
	GJCNbBTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnpL-0000000EHE4-1gYj;
	Thu, 12 Jun 2025 19:43:07 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPiwv-0000000Dd0Y-2yhg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 14:30:38 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so891493f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749738636; x=1750343436; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=icfnPJxQK+6jhDwUzz9Y3fm8tV+truVzDKj2VhFlMo8=;
        b=c2WfBAyF3qPjCO3gb2M+qxv+FBs4fmCWCOqPmk/sg1QsbnkAjCTujFK0K+sodi82wy
         e4/8YsbPa03MddvN9jjQrNfsy40ouNVccC8Ni6fRN8ReftREfwT0Xve4Y2+foOOa62YC
         hJ7VLjo7x9mjBgshCTv+nR0CgDofRSoJng5Q9dXVJrjbnkjb2n1ficFcxaAhvIa5YQz4
         qgMfr/tvqCE8san8zmXCMeZGM6raxCy1/DFVi7M8jRgRGMnU0xezZInhiBw0EWVG2mkU
         6IJ0d/lqT1u1rWG9VG6+ZQNKwSJjwIL0Ck64BOtRkaeO0oA+0jCDVOP5BwZrxaDtjsQS
         EqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749738636; x=1750343436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icfnPJxQK+6jhDwUzz9Y3fm8tV+truVzDKj2VhFlMo8=;
        b=YBIO9ctb91yxHvxgeqR7A8nW0U+IlTkE3St5yWQf794KdQdGRUSRngKvoMxyb2nUtg
         FAjosg5oihR3dv3BIILk6wptynf3LuNuK9PrDGTcpTnbzMvUczO/UybOnyFFtDQKgk9U
         zmZRcfsgWcyDLk9jmc1ejDC0q/uxx0NlHtwVS1VVdn9jvI6Wv1OzKW7D5lZkYh/C3v6B
         VNyhEAMriuQBMT7W9VzSzo6g0vtE3u8mW8l/KSUAQgT7HN775afjRCiZ9IVsKG8imNv1
         53OJaoMQAFAazunxOmTJTb5XPt+58DsSgtQuemFwW9fAoV90y40SM8uAQHcemjJwhAus
         Cx4g==
X-Forwarded-Encrypted: i=1; AJvYcCXgYgs47m+TCzTJEOt6fpXeqRUT0wuDyK/yreKAHLzENevZKvqejKS3ROzQOHcYztydvPg62nUtKHw2Z+BRll8b@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu8aIjXRxvU2ZLWiMygt97+AN5FtLeAB5NkmLqU7pKQDHuGKii
	P4IUPcJXUNm3why7mn5KwsElAruWctpn7uUKzEN8NmdEV0tWtBj+CgPQ
X-Gm-Gg: ASbGncsT3hTtDagedrdhJrtBg8UQXl5pN246zWvoTbCYo6w7ykwVvRKepzcoYikn9dc
	OL2HZN17A/2vHomX+VkzpeVPWqWyYACOE+NBivf3LGe9iAJr4kk6GUPbQdydlk6NKeUiQQXkAQs
	ldbYw7GHJ7ccHdURk/WhfOGvx0QAJ6XR/Shs9E0sPdIg/ZiVRobQPt3m3h0FN+EvLPOZ1fJWtSf
	p0RMk/oKAcOm3Jc7deHUtEb2xSUZ0JPnC9XIlp54oB3ZnUEPI1rE20TSm7kKpKs2niGFvOVLgTj
	nH7nTZliABDleUOO/MbpIQpzscInM1seWY4flGS2cywoZEH3W0Iyr57Gu2tPRiyrT1oFtY99HcF
	63ImA3m3G+In+Xl5oog7SzHIy2dn3Fo0SW6gllO1VeVPmXf0Sl+LpZL72YEU=
X-Google-Smtp-Source: AGHT+IGxvolHiwOg3aDkzQdAyMUz7W4ExlIeoU65YP9vh/gmeQMHftNhAqlS1vFT6yBh4YZN7vBDHg==
X-Received: by 2002:a05:6000:248a:b0:3a4:dc2a:924e with SMTP id ffacd0b85a97d-3a5606a3e80mr2745067f8f.6.1749738635664;
        Thu, 12 Jun 2025 07:30:35 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3cdb4sm2156646f8f.54.2025.06.12.07.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:30:34 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:30:32 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
Message-ID: <kjotbgwqlvl4uv4bcynqsiynf4dsoplw3szaqlcfd7rm7k633p@64c552v3llz2>
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
 <bdd989b4-a572-44c2-ae7b-2c445c09fd7a@linaro.org>
 <d05f2c03-fa86-4fc6-9b81-1a7b5592c2e8@nvidia.com>
 <CAMuHMdX9NzFvsOv9eT0t4KVNufHSqVEht7yRbrt0qE49WgHpGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dkf5kmp4veftageg"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX9NzFvsOv9eT0t4KVNufHSqVEht7yRbrt0qE49WgHpGg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_073037_757499_B92B4F7F 
X-CRM114-Status: GOOD (  36.44  )
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


--dkf5kmp4veftageg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
MIME-Version: 1.0

On Thu, Jun 12, 2025 at 02:34:32PM +0200, Geert Uytterhoeven wrote:
> Hi Jon,
>=20
> CC Arnd
>=20
> On Thu, 12 Jun 2025 at 14:20, Jon Hunter <jonathanh@nvidia.com> wrote:
> > On 23/05/2025 12:54, Krzysztof Kozlowski wrote:
> > > On 23/05/2025 13:39, Geert Uytterhoeven wrote:
> > >> On Tue, 6 May 2025 at 12:47, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >>>
> > >>> Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`=
m`) to
> > >>> ensure the Ethernet driver is available early in the boot process. =
This
> > >>> is necessary for platforms mounting the root filesystem via NFS, as=
 the
> > >>> driver must be available before the root filesystem is accessed.
> > >>>
> > >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >>> ---
> > >>> With this change, the Renesas RZ/V2H EVK board can boot from NFS
> > >>> which has the DWMAC IP.
> > >>
> > >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >> i.e. will queue in renesas-devel for v6.17.
> > >
> > > With my Nacked, please.
> >
> > I was surprised to see this change in -next. We also use NFS for testing
> > and we use the dwmac drivers. To date we are explictly building these
> > drivers into the initramfs but I noticed that that is now failing
> > because this driver is no longer a module by default. This is easy for
>=20
> Oops, sorry for that...
>=20
> > us to fix.
>=20
> Good ;-)
>=20
> > I do agree that if we start to build every networking driver into the
> > kernel it is going to bloat. Yes I do see the kernel image growing
> > regardless of this, but nonetheless it seems better to just build as a
> > module IMO.
>=20
> Not _every_ networking driver, of course.  AFAIK, making network
> drivers built-in for systems where development is done using nfsroot
> has always been acceptable for the arm64 defconfig before.  For things
> not critical for booting, modular is indeed the preferred way.

Last time I tried to merge something like this I was told that we
shouldn't bloat the kernel for everyone just for our own convenience. I
tend to agree with this now. It's trivial to make local adjustments for
things like this. In fact, that's what I do all the time. I will use
defconfig as a base line and if I want the convenience of having network
drivers included because I don't want to update the initramfs every time
I update the kernel, I'll just change the driver to built-in in my local
=2Econfig.

I think of the defconfig as more of a reference for what a typical
development system would need. So it gives you reasonable build coverage
and such for a wide variety of boards.

If we start building too many things into the kernel, then at some point
it's going to become uselessly large for everyone. That's essentially
trading everyone's convenience for your own.

> BTW, we have other low-hanging fruit to fix, though:
>=20
> CONFIG_SOUND=3Dy
> CONFIG_SND=3Dy
> CONFIG_SND_SOC=3Dy
> CONFIG_SND_SOC_SAMSUNG=3Dy (Krzysztof? ;-)
> CONFIG_USB=3Dy

Yeah, there's probably a lot of options that could be changed to modules
to improve things. But perhaps we can start by not making things worse.

Thierry

--dkf5kmp4veftageg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhK5IUACgkQ3SOs138+
s6E0Tg/+IGLRD8EtHHbSTM+B0SarrqyRAXrUqz9kqwBFfy9hmBgPVV77MW1w4S6d
bt5j5/QZyPgujqrjttC7a9q0KkTgI+xlSgd5+3J9Ilp3F3IMsysomotJqRol0xNb
ANq8ob8PBvArENT9WdsTrYq439BaB0H6iCZafvtMwEeSJ/fuLOuOv9gYMHJUyEIm
yLdfUKBkP1kJwc0Ke1YJCDWL12WRSJA2F8ZlqhpL5M9+juNRN0AMwbsPf1w4ZU50
0H2h6Zzdhroe6sdzi1ln8hBYehYJEt073YaN7DYV2tkVmXOlgGwBLox+digiiSZH
rktx5n3f/c9vUco2+omNs4Otj5I4vW3zslU+cf7skWbmEAApgjgrGoSVG/fTk0dO
SNYPTQdCP49eNHmXWYfHnp9xno3ceetfzEGKIShqdqk+IoonBE8VRruZq3l7kFk/
eZ+ZYE4z8oaueb+FQoRdJBkpM+Np/6wvXduH85nlTL253JMScqt5e1q/L0tBPvwa
cpwDkzyyY7756xGD+HW8aSfBwyX8LbkZZXk7G8N056TsrVqIACRRqy19a150G5Nz
ZLL2tMtRuN9FAeZacQNQd8zVnojS+ewm79IyaDl7vN/sxwhQQTdDxiVHa6S57uke
/Vt5CLR2HH86TGWNoQK3afycP0toYFIF6hU+gTTMyrgi9epkZA4=
=Qw4a
-----END PGP SIGNATURE-----

--dkf5kmp4veftageg--

