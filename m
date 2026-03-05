Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201B6F47CA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 18:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pnxoz4idCuWp1cjgR8NlXKfgMViTDq/5rJxjecRq6R4=; b=454+sJXWxIm6sGqVWz4sYIted8
	KTo35JFsM/6tqI2xENBS5DOE74gDeceAfvjtq+/bknDzRKR6PbFsQRRpXPLGSTE2FGkxu89vxTx2r
	rHK0TunlWZA5jUt50zJkRECqLovKxf0Fxv5S0cmRlIARBU6r9c/7A8z+N9XhgxCu4Vu0iBs0OHitZ
	ewogMTSkPhXVzEpEN2pDHWtneLoL6zQY+d68EcXskUiZwYEeROPSGkGsOAG0Ukod2hwhlRaounbX5
	R1CTkCuNO/g+K1NgxrSC5fPHtQRXhi1mW5uLeuSXAlNnd41E9hQ54n3sywevZ0dqGRe7a0zHGNyFL
	9dk5yaPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDfM-00000002P6v-39hq;
	Thu, 05 Mar 2026 18:43:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDfJ-00000002P4w-1QYb;
	Thu, 05 Mar 2026 18:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772736193;
	bh=pnxoz4idCuWp1cjgR8NlXKfgMViTDq/5rJxjecRq6R4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FvICW1C+Vlwk7C4+2b7hZrZ1qiKUEWLbPrLCzWapdyHqHilwja7f51Mk42/bd4IYS
	 46BIFvCXXiNaJ+Pja4y+Td9egZ0+ZSeEqthkmqAaA6UmT6YKxhSOOUAl5zJ+z0lf6L
	 +gNsej+g6pk4/aVVfERQGjaQDW6nYi4DP1BoZchf9c/ktfYhxP4IDNld2oUW2mwAje
	 4z4UBZdkfg2o4bnQPQSPmnvp7NKwbrYfQkybUPREENsRddcAfsHou8u37b2Y05X2Gu
	 Y6h1RKLmnJ/1GhWcvkZ+jgbJ5atxN4V5Sw9Hh1RH1DGMSmHwKTlZ/DWOTnUy4wEVzq
	 baOMHLDz9YL3g==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB81F17E026C;
	Thu,  5 Mar 2026 19:43:11 +0100 (CET)
Message-ID: <5c8e5f38af10f44f366629e1e7c948ae9af2a196.camel@collabora.com>
Subject: Re: [PATCH 1/2] [RESEND] media: rkvdec: reduce excessive stack
 usage in assemble_hw_pps()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Detlev
 Casanova <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Nathan Chancellor	 <nathan@kernel.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Kees Cook
	 <kees@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Thu, 05 Mar 2026 13:43:09 -0500
In-Reply-To: <e907e900-073f-4aa6-b4fe-36b87e312f62@app.fastmail.com>
References: <20260305152644.791897-1-arnd@kernel.org>
	 <1621b56864cb186f1e5433b73b56afc00aa83452.camel@collabora.com>
	 <e907e900-073f-4aa6-b4fe-36b87e312f62@app.fastmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2kH2WREimXA5rID0isEA"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_104317_565069_FFE5E074 
X-CRM114-Status: GOOD (  29.05  )
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


--=-2kH2WREimXA5rID0isEA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 05 mars 2026 =C3=A0 18:10 +0100, Arnd Bergmann a =C3=A9crit=C2=A0:
> On Thu, Mar 5, 2026, at 17:37, Nicolas Dufresne wrote:
> >=20
> > Le jeudi 05 mars 2026 =C3=A0 16:26 +0100, Arnd Bergmann a =C3=A9crit=C2=
=A0:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >=20
> > > The rkvdec_pps had a large set of bitfields, all of which
> > > as misaligned. This causes clang-21 and likely other versions to
> > > produce absolutely awful object code and a warning about very
> > > large stack usage, on targets without unaligned access:
> >=20
> > I'm a bit surprised you felt the need for resend. Perhaps you can help =
us
> > understand what made you think your patch wasn't being processed ?
>=20
> I updated the second patch today after I found a corner case that
> wasn't addressed by the first version. As I had sent both as a series
> a month ago, and neither was in linux-next yet, it seemed more helpful
> to send an updated series rather than replace only one of the two.

If you updated the code I'd prefer if it is sent as a new version, not a re=
send.
As for the media merge window, its been about a week since rc1 got merged i=
nto
media tree, with couple of weeks before that waiting for rc1 to land. I bel=
ieve
your month gap is there and accurate. I did also took a small break on revi=
ew
and PR concurrently.

>=20
> > My PR:
> > https://patchwork.linuxtv.org/project/linux-media/patch/2074ba5a5d05e23=
9f432d176eb051105f7e692f9.camel@collabora.com/
> >=20
> > And Hans/Mauro did logistic on the #linux-maint IRC channel this mornin=
g. I
> > believe I've marked all the relevant patches on patchwork our of "New" =
state
> > and
> > you have my Rb. What else would help you ?
>=20
> That's fine then, I did not mean to seem impatient. I assume
> the original patches will be in linux-next then, and [v2 2/2]
> will conflict. I'll let you review that one first, but can
> send a rebased version if you think we should merge it on top.

It will first reach media media-fixes (and not media-next, to avoid duplica=
ting
the patches), but I have no idea if someone picks from media-fixes into lin=
ux-
next. I recall there was a gap to be fixed in this "pre-integration" proces=
s.
Though, patch from fixes reaches RCs quickly, which are linux-next base.

Now, concurrently, Detlev is working on removing the bitfield for the RPS, =
and
the SPS will come later. Perhaps you want to sync to make sure we don't jus=
t
cancel out the work.

To solve the patch conflict issue, you can work on top of your existing ser=
ies
(just put a comment in the cover). I'll request a merge of rc2 / rc3 into m=
edia-
next, before I pick it up.

regards,
Nicolas

--=-2kH2WREimXA5rID0isEA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaanOvQAKCRDZQZRRKWBy
9HEEAP9SxgfNdzeWxoTFoO7BIW/dGlPesVcMOtlIL7jliydbcgD+IVKhK0U8Xtik
CKB7l0ZE/DrTnjCzPM7uHg1CaqNjXwM=
=SWbL
-----END PGP SIGNATURE-----

--=-2kH2WREimXA5rID0isEA--

