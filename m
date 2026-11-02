Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5BA60804BA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 15:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UyaWIBOX;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=P6WLKQUF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ar1uWTj3IJ9tEnHxn97KponzoGGyMBUmz+xZ4dUR9+c=; b=UyaWIBOXa1negFyhWoqn1m4PKI
	SkPtzhHCu5zJ7aM7WWVJsKqcgnbcOgLBdrYHFGI1FPqR/bNV624ZYy6Se5CApsWWpE4kkWuNQgiz2
	f6MG9UHRFVQ7kFjMsuA7u4pEga7smv0aikCxAXCKjxNIi2cLtJDoXRwmpvamOCAILT1xFoI7hjxBr
	qamS2PJOcmz4yFUMtDdgFcYCdNMB5AX7XognzKHVB4QLVlqLYmBt0z9H7+hd02B6qskK4HBKbVx/x
	sjz5PR6xOudwz/YCzPX4ClUYSD3BVGGyshh4x+w6nfzxABBJbI1VfJcpd8BJjuryUm4BWULuYDwOd
	8T0WrxxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtqk-0000000H3fE-0H58;
	Mon, 02 Nov 2026 15:21:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtqh-0000000H3eH-00mW;
	Mon, 02 Nov 2026 15:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793632884;
	bh=Ar1uWTj3IJ9tEnHxn97KponzoGGyMBUmz+xZ4dUR9+c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=P6WLKQUFiubdMDE0OEw1poZ6yEA4wkfMqqhvYPHCAAmlMNL+ctJOISpnAkne2oTKe
	 4AudCORZvnveIWShv5rOYfq1hG3s66mEc8ESXvREckIHK3RR6dxlnqpyrma43bfm6d
	 KgWGXnIRg1479oYEq82uad35CqqRXQZKyaHujEoUnwZX/anoqcxlAHyX6DOuyPIINz
	 /DZQr55svI9G9pmzFQfC3ruwNw+nPsW8cWVWe2dPVt+rHaRzx0GpEhtIz7lJqnVtzy
	 50X/ewlusJVTQxlE3uiR/DwkC+5l0zTjIdkzCPQ3mhxVksz9koofPR7/wFaGzR1ggi
	 SBPALVcGjeLSA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5DCCA17E038E;
	Mon, 02 Nov 2026 16:21:22 +0100 (CET)
Message-ID: <8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: Do not keep the clocks enabled from probe
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Igor Velkov <iav@iav.lv>, Detlev Casanova
 <detlev.casanova@collabora.com>,  Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Diederik de Haas	
 <diederik@cknow-tech.com>, Jonas Karlman <jonas@kwiboo.se>, Francesco
 Saverio Pavone <pavone.lawyer@gmail.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	stable@vger.kernel.org
Date: Mon, 02 Nov 2026 10:21:20 -0500
In-Reply-To: <20261030-rkvdec-runtime-pm-clocks-nicolas-reply-1@iav.lv>
References: <20261030-rkvdec-runtime-pm-clocks-v1-1-fb2c5b629e79@iav.lv>
	 <76e2e993fa5a8fd054bad97505907d3c4e88e11c.camel@collabora.com>
	 <20261030-rkvdec-runtime-pm-clocks-nicolas-reply-1@iav.lv>
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
	protocol="application/pgp-signature"; boundary="=-Hy9+b3DoQgbhz4pK6YIj"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_072127_197922_9D8932AA 
X-CRM114-Status: GOOD (  14.41  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--=-Hy9+b3DoQgbhz4pK6YIj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 30 octobre 2026 =C3=A0 20:05 +0200, Igor Velkov a =C3=A9crit=C2=
=A0:
> On Fri, 30 Oct 2026 08:49:03 -0400, Nicolas Dufresne wrote:
> > So if CONFIG_PM is not set, the initial resume will never occur, and fi=
rst mmio
> > access will likely hang the CPU. We need a clean pattern to handle this=
, and
> > perhaps review other similar drivers while at it.
>=20
> PM=3Dn only happens with COMPILE_TEST: ARCH_ROCKCHIP selects PM on arm64 =
and
> arm. rkvdec had the same gap until 6a846f7d72c7; rga and rkisp1 have it t=
oday.
> v2 keeps the clocks enabled from probe when PM is off, as etnaviv and v3d=
 do:
> https://lore.kernel.org/r/20261030-rkvdec-runtime-pm-clocks-v2-1-8ff510a2=
31de@iav.lv
> rga and rkisp1 as separate patches?

Thanks for v2, and yes, best to send0 independent patches per driver assumi=
ng
you have time to do so.

regards,
Nicolas

>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

--=-Hy9+b3DoQgbhz4pK6YIj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauiqcAAKCRDZQZRRKWBy
9KSfAP9Nfn/3c2GIjb7SxlVxK+rFOQ/ctwy9o9h5pMp7BSlPvwEA8+Vc93Ax4Ube
2Xd1IZcCaTchUxJf8yNfTlcW8z70FA4=
=wPZr
-----END PGP SIGNATURE-----

--=-Hy9+b3DoQgbhz4pK6YIj--

