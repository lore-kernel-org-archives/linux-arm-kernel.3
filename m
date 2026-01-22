Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62A5C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 12:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnONHadiHlGxqKbve/p4kfBxT1gNFOR6bKW+t+kxRsI=; b=Kv3r2/7ix2Wy6ILAATx1BryKhl
	Ox0vpmfedER/UaCP/cJUC9O7lhKPzKVNchHCrmSfTrnatTyXsTjNKYDmWj9b6Fic2KUU8kwlXb/DN
	vterX6n0PR64kTO53Fj1kF2XCADjJqJCDRZhDaE8YTtlPzykI4Tm5rSr1JuIgb0dTXQwyEDzVtPo+
	jRW+ZVZIVE0qzmcBip4K8nX1PeV49hvSmuy7v63Fr+a+0spLXfsQ0sID9AsktQ5/+43Ig8exMo/qt
	NkgUap/1oE/dTMrRVhZsvM7S5yc1SLeNMbsyBqwa5eStgnZn6ZPP7Ad3x8sJRLciIC4QJ0S+Ing7g
	u/Xe5hRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitfi-0000000733E-3QK7;
	Thu, 22 Jan 2026 12:20:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitfg-0000000732j-0rJW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 12:20:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4327555464cso592889f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 04:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769084417; x=1769689217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MnONHadiHlGxqKbve/p4kfBxT1gNFOR6bKW+t+kxRsI=;
        b=UygqwqAhECTKsZhDjJ4701FZw4KMaweqUzFzzZTAMpUvdxwx99s53Okqy524VIYeiy
         niTRXuEhnXm07xgD7/XBqMscy4/vDhvkxnfD+YkXLLjvtNCGM04TutuO2EgSlP9sEJKn
         gYq1uC/qc2SheJnvLk5JsfzhckqjsfmLdRymxvtKOPcBUs8qnOqdLhhICNNdclA+hMM/
         fCfu+Dy7IMDZ1RMsupQdJUg9R9FXiVF5Oah72swBW6H9ismFiU/tGLoqtRfS3OfA62in
         SBUvLSD6lJ71dmnaEf/gN8++WFZgJp5o9XATdgC0yB5rarWtY8tRAl84Gp1civuN2OIP
         xpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769084417; x=1769689217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnONHadiHlGxqKbve/p4kfBxT1gNFOR6bKW+t+kxRsI=;
        b=gFvl7Tc9onnNt67betYWYmM9Af6Nq8kzVltQpwc4wXbzPc+LIfdY5FOlZqo9PAsq60
         Zs2dzc2siZSNbOEFLQqSGWX3ElrkOJZKjHohxkBPPd9s+2HdF6Yu27jMzk1QjVpmxpC2
         I5de3tJXE7OiYeVGSfM4QLZ8FsCsDdFgB3K2XWlvVIB7/wrZ2yHkLkE4xhAoPJdf5Kwr
         MV/ypgT4qFv9b38UH1PsrnFr42UFJPVgyt05Q2WUw0vBeeVQNp6AJjgSFPo8pJLT7XYz
         40ysOfHB16/TS77tekbRkifRTgNKk8akvqvZFT8Cq4FTyZ8WD0GpxMnlv/+8u3Yow5Sb
         SbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSrl2iQML2NZpE24LujniODZkn4j/oaZlWrFMQU3ADllaazncsL/9ouf6HNeA2ze9xSL3j0i2HnB0Lhmrgq2wD@lists.infradead.org
X-Gm-Message-State: AOJu0YyoLTaRKMrsbIp2++6tC0OVQ8JZyHY/ccDIUgOwfKveUKaUP2hz
	2LcJ6oxHULvsA0srWLQJOTSN11Piw1MICvLJSTfQKtm5oM62CDpAVqoK
X-Gm-Gg: AZuq6aL99eOKmxApQMw2P0X9KDbTnYrt4i0SlYk9+isiQVbvdOqFQKzStrNnM10mSEx
	UjL/DSQ0b9f/RsvK1Uwnu1nZKcOLyz+WavWeFbXC64Cxos/KuSVhpF2EajIAtf/dvwavOEoYmw6
	D7mRk85Qyldhel7ONnPZvubGHZQ9kKstXqD5Iy7MlB15M7u9FkJKfR7GDIQleYjqF/CLvfoU8Fe
	3B3UufCjCbR3oZwHTdY3hCpQpvfYXxfMEqP9BYcdQ8LsFBvEtEM+rdyltdNis5lWV+J/edEgu3a
	9u4PXKU8C4GDyfcZj+XR57N3bTcpP0LQfQrkG957iIHeGAbqushq8fIalSH2uy6qz/0e9mGc08U
	7RqyYDdO0EaGw1o1pUYSSl9Q1okAMAl1QImTlvtyFclxBn4OBw9lnha7EwirzcLu2qZmAWQg7a+
	ffVC8fszD3fhwZk8tZS06w7d7CCzy49DWf5VnmOwRcjYihIxujxksyWrTTNpP/SMFaZV0z2Shp9
	w==
X-Received: by 2002:a05:6000:402a:b0:435:8d80:1b81 with SMTP id ffacd0b85a97d-4358ff4487emr14838984f8f.21.1769084416943;
        Thu, 22 Jan 2026 04:20:16 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435ab458d85sm4603429f8f.26.2026.01.22.04.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 04:20:15 -0800 (PST)
Date: Thu, 22 Jan 2026 13:20:13 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, arm@kernel.org, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
Message-ID: <aXIVmW_mjb0AdDwe@orome>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
 <20260122-hidden-goat-of-excellence-a43b9f@quoll>
 <CAMuHMdUZqJa3KEWZReA734=ZV98JTD=HPztkszEe6ARFWiuhww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wfu6iycbl7nspgf5"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUZqJa3KEWZReA734=ZV98JTD=HPztkszEe6ARFWiuhww@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_042020_268179_73BADA8F 
X-CRM114-Status: GOOD (  20.68  )
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


--wfu6iycbl7nspgf5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
MIME-Version: 1.0

On Thu, Jan 22, 2026 at 12:02:04PM +0100, Geert Uytterhoeven wrote:
> Hi Krzysztof,
>=20
> On Thu, 22 Jan 2026 at 11:08, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Sun, Jan 18, 2026 at 09:03:00AM +0100, Thierry Reding wrote:
> > > The following changes since commit 8f0b4cce4481fb22653697cced8d0d0402=
7cb1e8:
> > >
> > >   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/=
tegra-for-6.20-dt-bindings
> > >
> > > for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c6=
27:
> > >
> > >   ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 0=
1:58:18 +0100)
> > >
> > > Thanks,
> > > Thierry
> > >
> > > ----------------------------------------------------------------
> > > dt-bindings: Changes for v6.20-rc1
> > >
> > > This series updates various DT bindings for Tegra architecture,
> > > primarily focusing on schema validation fixes and new feature
> > > documentation for Tegra234 and Tegra264 SoCs. Key changes include
> > > correcting realtek,rt5640 audio codec bindings (adding missing ports,
> > > clocks, and jack-detect sources), converting Tegra20 NAND bindings to
> > > YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
> > > (introducing CMDQV and DBB clock support). Additionally, it resolves
> > > legacy warnings for Tegra30/132 display and VI interfaces.
> >
> > Same comment as was for Geert, I am surprised to see DT bindings as
> > separate pull and I see drivers were alerady merged, so I will defer
> > entire Tegra pull to Arnd.
>=20
> The soc tree used to have a separate branch for dt-bindings.
> Hence several soc submaintainers still use that split for their PRs.

Yeah. I usually also only put things in the PR for ARM SoC that have no
related driver changes (fixups, conversions, ...) and therefore nobody
else feels responsible for picking up.

Thierry

--wfu6iycbl7nspgf5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlyFf0ACgkQ3SOs138+
s6Gh5A/5AfOWWZlWQRR6QIPJvWj+TJAELr21m/e0TryGwrAkQJfn8/JzMy7CUVDM
D17V/AYBsq+jqwHbo1jqn8pnHL7ivzFYRBS4j31U93plbm0FowXbS4smlMWAPCbS
jW+PJ5pjoQ3LxSN8LgAAJJxvX8xuMy07prqt+Aj45ZDlVXJ3Ie7FoxwkzsMaK5AJ
6iHcVTYZFVr/kOUbwv9JzxuuRSgV8kFKrZfWyXpNJJN0EYbB3WJd3zz9cJ1jWgOg
JI4O4OvPHZavoRaRIGw6nqQhhIFGiO8HHn9rXppwtYbQ3pZBQkOt5uZBt+e8xfTB
H6Ix2BAdtziymhzCCQNhrUC1V+iBgtZDK2lMKGc5p+fxtNewrT3ilC8zfkyZU4jY
j1hxGXOCTcjYCwtBjxUhE8KlUxRhAYIXcGF9u40BWteZc1r1Ze2ZFAqwYNL0DxU6
cy65ffKqyb9CvUTU406+zydeSJoal7xQ1y9Kd2wn7oGUh8oCGJeLniD24mgKqjuk
XKLNPipq8aqDQ+6dVxI5uiV423FCxphIzx0hNlDt5+CS8feulUYgLVazJYJ3foeB
ezwk0RPmgbh3PTqL32oCGMvvjkK9gtjdjvt9LW4TkePpO62tN7rm3dkI6EofbyZK
7bHIrJGPrUA3QtUrWsU/SoqnM33HOhjDM62NU6BA3EJb6AWZr04=
=8zEd
-----END PGP SIGNATURE-----

--wfu6iycbl7nspgf5--

