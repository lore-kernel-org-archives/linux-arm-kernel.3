Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E64DC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 22:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JXlYSci0PBdC2H0zJnDExHP8ogwtP2mDptfTEHu4Zc=; b=lpnh29Uwhq3sB0ucgEUwuiSFqk
	6zoeExFHXr3FmVYVDPQzZCAksY7frZQ8Ye1ZV3Oe36hQyZ21zk+apD/0XwDUyQHpFQJz6o8qbCLwk
	RoPJMP72JXtYJTiBDfeJ90hrte9XoQr5sQ0HGak3/nWvkBQez3Zq+pWY3CtuxAC3fC0quZFLBhzoO
	VDb2OqtTPDi5MxDX5sSlFJi/LvswQMx3K0AQQN/Jwq5gjyTZcqfqiP7JvI/ySU7vUBZaYQjaBSMhs
	9iScUqAszfNR5Ju+jEXzgdCr+35LYLZm44xHtQc4CtkLka3R8RbQ578AcV2iVYhq5y4e3/Qa+2dHp
	wEZZOjvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txZWS-00000009jg1-0mc4;
	Wed, 26 Mar 2025 22:46:56 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txZUj-00000009jYh-0YCO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 22:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743029105;
	bh=0JXlYSci0PBdC2H0zJnDExHP8ogwtP2mDptfTEHu4Zc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NqYOkDVfqmMxRxGKkcTgNXTqRTTB8q0/IkvENLocSL+jQOiMOuxuFokvs6Mikd4W/
	 UA3a0dBGg1KCRXPpse2eqhrecDBc3idkKI+xo7PFcnHPpwKNSHAyeFwQMQ2ub2Qv1c
	 m6G0zxEJXVeq0YfE9gOogkxATqxC0R+2zPsIGz3IM94eK6Ar9SvYzEZo2UD6gYlsZt
	 3rpxlHxEofHxTwTgquTqM9svUDw0Ct/VUQq+lbtM+At1Qn69rKjjzGbfcvPS4tAcYY
	 cpwdu0lu6rXU2xy2KrAPozHyK8ZM71QobQMBd3U6pmzvIKH9gtNxPpdIGaly3/dYsp
	 iwhx5B2esGrdg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZNMLS0770z4wbx;
	Thu, 27 Mar 2025 09:45:03 +1100 (AEDT)
Date: Thu, 27 Mar 2025 09:45:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Steven Rostedt
 <rostedt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Konstantin Ryabitsev <mricon@kernel.org>
Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
Message-ID: <20250327094502.6ae56227@canb.auug.org.au>
In-Reply-To: <CAHk-=wiXEvC2r=Sa_tpYjd=g+AxZDxxjSdq1WADTvZYZ9oUi_g@mail.gmail.com>
References: <20250325195322.3243734-1-catalin.marinas@arm.com>
	<CAADWXX-0hMgpyeQw_7Ko14hNMciqSnKJAROEWS5vwAdMKUt_zw@mail.gmail.com>
	<Z-NHugcLdLqkEHFR@arm.com>
	<CAHk-=wg_HipugbtswxFnekQy2g_ksKKXj+yht8naj2FEMtRMgA@mail.gmail.com>
	<20250326124025.1966bf8a@gandalf.local.home>
	<CAHk-=whwmmU+hv1SyMoyr8yAGP2JiAAP+g5BZaMajzAukzrM9w@mail.gmail.com>
	<20250326131200.1c86c657@gandalf.local.home>
	<CAHk-=wiXEvC2r=Sa_tpYjd=g+AxZDxxjSdq1WADTvZYZ9oUi_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I/36lLAiTRXRUsoZiXLI4d=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_154509_587139_2EEC96CB 
X-CRM114-Status: GOOD (  18.77  )
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

--Sig_/I/36lLAiTRXRUsoZiXLI4d=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, 26 Mar 2025 10:25:22 -0700 Linus Torvalds <torvalds@linux-foundatio=
n.org> wrote:
>
> On Wed, 26 Mar 2025 at 10:11, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > So it definitely goes through kernel.org.
> >
> > But it has no DKIM headers. =20
>=20
> Funky.
>=20
> There's definitely something strange going on, because your *previous*
> email to me did have the DKIM signature:
>=20
>   Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF624C4CEE2...
>   DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/simple; d=3Dkernel.o=
rg;[..]
>   [...]
>   Date: Wed, 26 Mar 2025 12:40:25 -0400
>   Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
>   Message-ID: <20250326124025.1966bf8a@gandalf.local.home>
>=20
> and gmail was explicitly happy with it:
>=20
>   ARC-Authentication-Results: i=3D1; mx.google.com;
>        dkim=3Dpass [...]
>=20
> but then this later one didn't:
>=20
>   Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDA5C4CEE2...
>   [...]
>   Date: Wed, 26 Mar 2025 13:12:00 -0400
>   Message-ID: <20250326131200.1c86c657@gandalf.local.home>
>=20
> and for some reason gmail also didn't actually react to the lack of
> DKIM on that second one and only talks about how spf was fine.
>=20
> Konstantin? Can you tell what's going on?

My understanding is this:

for normal SPF checks (i.e. not DMARC's SPF checks) the test is done on
the envelope sender and in Steve's case, goodmis.org DNS SPF record
says that anything from goodmis.org can come from the kernel.org
servers.  DMARC applies the SPF check to the From: header address.

for DKIM checks, the test is against the From: header address.  The
kernel.org servers can only sign emails that have a From header using a
kernel.org email address (or any other domain they have access to the
private DKIM keys for).  So they cannot sign emails that have a From:
header using a goodmis.org email address (presumably).

Presumably the SPF check passing is sufficient for the GMail servers.

DMARC requires that its SPF check or its DKIM check to pass.  (But
goodmis.org has no DMARC DNS record, while kernel.org does)
--=20
Cheers,
Stephen Rothwell

--Sig_/I/36lLAiTRXRUsoZiXLI4d=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfkg24ACgkQAVBC80lX
0GwmmAf/VYJKpukOi/5sN/6Sycd2bzfHpS+AiWJld30LN9ZdTOQva6vhAtO79tHw
+U4f/xMgKjvOlnP1t+900xg2yt4YckB7uZllB61eP10cj1ORSShtowN6loKErkWa
pL5XlgPH2Sk3BZvepM7A2YVDNNEgmWix0oZ4xC8IZ0K5xYlrVaw4yEhaMUTC6/XQ
CeFIzVcNzrEipaBgv3szSbHCYn4fz+SN4SGYJ0UClh5amP2FlUs/svtuUnumhIIO
12DkqB3Auv8QVwD+aqY6TJ8/a441IxvFvuO2EwrhtRxsch2CUqke1CvKcVfu412x
feCSlum+x2a40XC7YRpi59StWyjrPg==
=ow6i
-----END PGP SIGNATURE-----

--Sig_/I/36lLAiTRXRUsoZiXLI4d=--

