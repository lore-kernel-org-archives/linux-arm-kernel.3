Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEBED59D84
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 18:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OiPEYs9MAq1GW/oouHmd8DhcbuqlT3uRXYdrMuffOw=; b=TKZxjwzwzL6MrSOWStVotyvWD0
	xOrO4C2tMWCbGqcTnhMbKTSSaLCiSZEpxmAIQf8AUYj7gIqOn9EAR5GGI2ITtX0d5SIgmEIz/swXk
	LUeaWvSx8pxNzGh6706lXZSeNsCUI/XaUZN7KYocvFDOmBjm1FB8WjwyCCGpMAh5nAURsvFc//Zeu
	rPAr87TzyWPGqZ2KvXZPCnTRzrbShtTvAdrlW/UvA5vpvpdRjGgjQFsUQqONT5K7KplfugQv4A1cg
	+RdbCb6+QwSXTvW02cbXdFmLzvrEzefAG0gU1oOcKiyVwtaQZaMUhfeOyjKOipuslzZFjToGWLquh
	CPvIy2dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU89P-00000000xEE-3LwJ;
	Fri, 12 Dec 2025 18:45:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU89N-00000000xDo-1muH;
	Fri, 12 Dec 2025 18:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765565152;
	bh=ry5upCu6sImJyvpBdsRHrwsdIRdM8Q9U+hsEz/JOm+0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jHyRn2QbNfYAagQLO1Es0vKEdklQiL6Kra9hCqpLbShDNOuJ2DILt8MvFXSQsn9Bo
	 Psf8+HUrUxX+2uA6O6q7Jp5Jan8BwzzEtaCvfIpZuk5aZyY3oVRX90nBdaa5bylGJb
	 6PKPcyyluCRMsPZnYHiu2MTD3R1+yYD3sR2Ow+CNZRwZ9vYTN3tkXzYH8kwzmdjDin
	 j8J6r4DvFFOGn7u8RA/aEF9sNaGgSidMa2F52Pe1jEdZrjw4a950HUTBiiA4NOB4Gg
	 dUBsbhc15TRlMMz/G54Ky2i3myIj3Yb0Y6y5OfXIomH98qE9fshkGe1uz4JsBiVEPg
	 +QJ/NHyZXj0cQ==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A274117E0458;
	Fri, 12 Dec 2025 19:45:51 +0100 (CET)
Message-ID: <0f697c71f73e54a5a9e1306a06ed883e56d8bc89.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: vp9: Fix probs struct alignment
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, kernel test
 robot	 <lkp@intel.com>
Date: Fri, 12 Dec 2025 13:45:49 -0500
In-Reply-To: <20251212160101.146684-1-detlev.casanova@collabora.com>
References: <20251212160101.146684-1-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-v3ENlB5ZsArKoVTuSSTw"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_104557_624195_921C822E 
X-CRM114-Status: GOOD (  19.65  )
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


--=-v3ENlB5ZsArKoVTuSSTw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 12 d=C3=A9cembre 2025 =C3=A0 11:01 -0500, Detlev Casanova a =C3=
=A9crit=C2=A0:
> When building for arm 32 bits, the struct alignment changes and the compi=
ler

Reported by checkpatch [0], this needs a reflow, it exceeds 75 chars.

> adds 3 padding bits to the anonymous mv struct in
> rkvdec_vp9_inter_frame_probs.
>=20
> Therefore, the BUILD_BUG_ON used to check that the struct size is aligned
> to 128 bits (hardware requirement) fails.
>=20
> As that mv struct is at the end of the global rkvdec_vp9_probs struct
> and is followed by 11 padding bits, the 3 padding bits can be explicitely

Also from checkpatch:

explicitely -> explicitly


> set in the mv struct and removed from the 11 following it.
>=20
> This makes sure that the mv struct is 32 bits aligned.

Unless someone request a change, I will be able to apply these fixes while
picking it up.

cheers,
Nicolas


[0]https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/89677=
987/artifacts/junit/0001-media-rkvdec-vp9-Fix-probs-struct-alignment.patch%=
20checkpatch.err.txt

>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512110229.R6YCf1Le-lkp@i=
ntel.com/
> Fixes: d968e50b5c26 ("media: rkvdec: Unstage the driver")
> Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> index b4bf01e839ef..23c733ca2e8e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> @@ -66,6 +66,8 @@ struct rkvdec_vp9_inter_frame_probs {
> =C2=A0		u8 fr[2][3];
> =C2=A0		u8 class0_hp[2];
> =C2=A0		u8 hp[2];
> +		/* 32 bit alignment */
> +		u8 padding6[3];
> =C2=A0	} mv;
> =C2=A0};
> =C2=A0
> @@ -85,7 +87,7 @@ struct rkvdec_vp9_probs {
> =C2=A0		struct rkvdec_vp9_intra_only_frame_probs intra_only;
> =C2=A0	};
> =C2=A0	/* 128 bit alignment */
> -	u8 padding1[11];
> +	u8 padding1[8];
> =C2=A0};
> =C2=A0
> =C2=A0/* Data structure describing auxiliary buffer format. */

--=-v3ENlB5ZsArKoVTuSSTw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTxi3QAKCRDZQZRRKWBy
9D9TAP9Rg/1BlXZVvLFqQ+qVsoSdshEjyLf5j10caSZcDsATKAD/beT+Jc2J2IbK
px7A3XalvmwjjtoZS5wEx6RBRW+b+wY=
=V59C
-----END PGP SIGNATURE-----

--=-v3ENlB5ZsArKoVTuSSTw--

