Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936DFCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4faCkAArvXRFWP/BvJT3qCkXJoGOkTL/9xvSBBThwwA=; b=hDJzknwV+AaMEWt3LW1rmdT10v
	nDJzY/AkBponYQ2VXV/+wouJEc32eTuG++Seq1q6I1IVaAcCTN8Uh4ekAgZq9b61fLUYyE74aEm9Q
	1z4eKedBCYymdjOetI22AYldahsOAxbYGpUhO3eE/x8tAtZQYinR3Mr7tNVsZ81NDDnYRvyJpdNzW
	dp7Y2ZS3FjnGnSyVCubF7P3cClfaOSp3nzuFPl5/E7Xanfa+rQqskH0+FacKFios0mx0kc5Gg2Pv2
	iu5UYguj3NXbRyasSrSuYYbCAM7GMuw9AlHrwh/IvG4jMxVW3fjKfcAN2tX3ltg6Mdri9NkugVczs
	D/h14aZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERlE-000000047Lj-2LBv;
	Thu, 30 Oct 2025 12:28:12 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERlC-000000047Ke-0Mot
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:28:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42421b1514fso612401f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 05:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761827288; x=1762432088; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4faCkAArvXRFWP/BvJT3qCkXJoGOkTL/9xvSBBThwwA=;
        b=j7D/M6xWUEPfU8IefZ8rhyGsbG70Qul+ZBNtYVkeGGB7SfnP1zKxnqfj+AHWEytLEX
         jbXfYuklnYtpA9nhSFaCGrD/UGd+Ph2Wg/Em2EDY+YeM4ItLV7Eya/LVsdUcRJ9f4Nz2
         U9IdF7+1gBuIRgSi/Kq8aQC7h1kGDgL5UaxA2B4Lz7RCKvHMojJiOtgo1lQrn4QKsUoi
         2m8LkgG0gfgrvmOLFWXwndp56Mb33lxW1YgRqcRZmtRNtIzr4X9QA97LJV6G2PvY5GyX
         makHInk73+MdYjKtJCxFCmnW0AgyaKtcMQ8vFyOinmW6sOIaPcn0i/NpDYENhON4DnMj
         trHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761827288; x=1762432088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4faCkAArvXRFWP/BvJT3qCkXJoGOkTL/9xvSBBThwwA=;
        b=iG+K1JInAjNbu9ak5pnb/w0aGhxynl0wxTp4PGiGkYWlLVWCh53i+Uqx0y+jeGtqTA
         LR1GrKkfG7JLGj1sL9tt89GyutBACKAcG1KpKHiOH4k2rkgnLsMkiV0z0Tp9tZNVooCc
         dvelg/deqhxwy4FSjFmaG0rRT2/CYy03jCVGNkY1hoX53YxNsG5jcBWvYIT+p7Rzj8Hj
         6JDZbWF4uXvvzmZ/wBIx+aQU7KzrMU/pQWME4lCFqTtXr4vAbiSnRuRFox7N4qwyi7Bt
         RLOxQ6b6rKuC/g+kwIO0Sy4idujswE3maHC3panE7iy2FMfmvjQU1xzyn4SVm+Wc45Ol
         D94w==
X-Forwarded-Encrypted: i=1; AJvYcCUxI3HBwB0Ecze80FQiN+l2VmAaCpFpWDklYo4wVym+vGcFObkx9eGUO3++sgIk8WIj9bpWc8N55uRGjnfyeuMa@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+ZVPrx3O/MddsnixHo8QXAszlLklbgJbEziuaZBuyeobThGlq
	XykB4h4dYJ4saw9NwzX9io0cl6jCcJLgo+7rf4TYvmfH/66IqQ9WCiRH
X-Gm-Gg: ASbGnctavFctGPa/GNyKmGklwvIG756xyHOIKbivI+573Ros1Uj1U+gQO6mrm/30d4I
	QoKII54CLf0ZR0+Pi22YsBXSxxhZ3qU0ugRKFcHI6O9ISI45xTVfDS8Y2HAqObitebak6P6/ZeC
	hpd3ivV2fc1BtGz0Sv28oxn288fF5BZWgpmWKQKs6HqUCc6p34R+FikpyEVDjCOBaIURGyYDez3
	ySw4sfMFKuSgCLqQTxa7VvPc30ZPvBGczZuayY9fW/Ayz8bnJMKj/7eg0Y4M7tQ9R+YAUDDrp0K
	9B2wRo55okPYzkTcagQRuxccqn3XFalitkvJA0IjlgFadELLLpk7RoP2FWTEKraTz1eGYlY4PNi
	nkUzpzuuaYIB1/HDbj43Th80zjUMPy3Xcn0xnNDYXr3sGq8glxU/HxU3diH9FP4/unaNddd7m8P
	snPym/MmEtnAEKYOKborkDa8Oz3pIC8Db1c1ZT3bS/bVFaiYSoJZeXT0B+0flMG7O/vAQke6WNR
	Q==
X-Google-Smtp-Source: AGHT+IFohGfPrMB+gEC0PPjeDu6wKsKn5Xw4tnoTnVq6JsR15gq4re74GuIZTwiApDmgxJjGG1cQpQ==
X-Received: by 2002:a5d:5d06:0:b0:3ec:d78d:8fcc with SMTP id ffacd0b85a97d-429aef82ae4mr6294449f8f.14.1761827288007;
        Thu, 30 Oct 2025 05:28:08 -0700 (PDT)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429ba445463sm2028625f8f.10.2025.10.30.05.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:28:06 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:28:04 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of
 global variable
Message-ID: <5psq67p7ozmfz6mbi626q2uixqtbtfpejkhud5fv6wqr66xasz@ksiokkf5qsgr>
References: <20251029163336.2785270-5-thierry.reding@gmail.com>
 <20251029175647.GA1572736@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ob5xm6zi76m7ppm"
Content-Disposition: inline
In-Reply-To: <20251029175647.GA1572736@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_052810_141935_04D32340 
X-CRM114-Status: GOOD (  22.74  )
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


--6ob5xm6zi76m7ppm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of
 global variable
MIME-Version: 1.0

On Wed, Oct 29, 2025 at 12:56:47PM -0500, Bjorn Helgaas wrote:
> On Wed, Oct 29, 2025 at 05:33:33PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Pass the driver-specific data via the syscore struct and use it in the
> > syscore ops.
>=20
> Some of these things in drivers/clk/ are also platform_device drivers
> (though not this one) and use generic power management, e.g.,
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/clk/qcom/q6sstop-qcs404.c?id=3Dv6.17#n209
>=20
> I have no idea if that's desirable or practical here, but using the
> platform_device model instead of syscore could have advantages in
> terms of modeling device dependencies and ordering.

Similar to the MIPS/Alchemy PCI driver, although there's no git log
reference in this case, I suspect this was not in driver PM on purpose.
The pattern I've seen quite often is very low-level device driver code
doing this using syscore_ops because they run very late/early during
suspend/resume, respectively, so the driver PM callbacks often aren't
sufficient.

In recent years, some of the issues have been alleviated by things such
as device links, so a conversion may work now.

However, often these are also exotic and/or old devices that are
difficult to find testers for, so I've been trying to keep the changes
in this series as minimal as possible, so that we can be reasonably sure
things will continue to work just by reviewing the code.

The most important bit in the series is patch 1, which lays the
groundwork for avoiding these global variables for new code. Also, in
particular I have a concrete case where the global variable approach
doesn't work because an IP block that used to be a guaranteed singleton
now no longer is.

I have looked at various drivers that I ended up not converting because
they use a global variable not only for syscore but also for other
things and fixing that up would've been way out of scope of this series.

Thierry

--6ob5xm6zi76m7ppm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkDWcwACgkQ3SOs138+
s6Hg1w//bfwZK2UyWYgH0DjUdLRkw/JLbu/3memPliSQO+SxPOEf7uwnD1QnAiQ3
AaL3UiueXsnj30IkhBnqYoPaFQRz3G5Ag/PFIKX3kireFrAExwZP/9AKWiJflD1I
gh+QOfqgZ1HpJr3QSmmjosBmkm5T7a/J5dUNuCcZoRcya8QmACQqg3sWy8gj4BdT
Hy/aq2/JWEEJs1pLE5SvCexBqTP5gxTj8MTuNgqm3hRDtZc4TQnKNZIcJwgOruMX
Wy4rrgBPQiASKxxP7ksI7iXCTOYM61AlEm39RUFNcGKI9iOw1YxFn2LuVIPoFJc6
H92dgYcRmcEgy/oWPc8yTs9iX2POH5p/40/nb53U3sj6iQVhEMoVIGmIuxEX9RHL
VHkn3RNfYCZlwqDtwCCoN6DWBW2PNUAX3dsD1ng3ZZHuDH2lbQaQudKRi7MGhAxm
ADqiAfq1HO8Fk6uo5BFMtpieue14jJFHaQs21TkOlurf/LH9GT2qO52/8KtcxYx8
F8pXjAM4Ps+sj+Er6h1Tb6PpXrpJ1lvGqagYTEJpWQuWyjXLGeseMpif2ucjdzjp
4qfcE13QtePpLlbO8kklfDMdo6+uClFAMgWMM0jWWFtczIaUWmwRYcDGUbW4RbHt
H6TJJVsDtuaQNx9wfo+vq3oMZviuttJPzFqYefIOL7oACIZD6sk=
=0K07
-----END PGP SIGNATURE-----

--6ob5xm6zi76m7ppm--

