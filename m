Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06182D59D84
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 18:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hC+VbzvpZ2LTYDtZmbPaq4rRUoU4513BbRvhtFR3GW0=; b=f88EoVPQr4K9CR+UQRNmLEZ5Ja
	2Ee+s6Ohwz8o5BzAMD0aBgS7MNZvAHNeqC9UbQyxXkBA2j+eFBjdEo6zpoajQXas9dcZB1kB/xqI4
	4C2x2EWQbSTfLlMRUEYkhciellc7kRdxjciHRbAQCBp3LV42a0gwPJu9Q9DvLOXz+cK5/LBy0sDCa
	MNeM8R2uZopZl8h//j8TnYrRSpnLYfCoUDRuUCR6vmsErjGwgRzl3I4wOcx8yEK2L0gVTKbs56Bd3
	a9vOMX4jUFfQeKNzoZ6NPh0U8pgWd9bETABsJnkEnpvCsGnLDS8x8dL+6GpOIISQmtWf864MKjNlG
	p/GMTVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU832-00000000wwP-0yeg;
	Fri, 12 Dec 2025 18:39:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU82z-00000000wvj-2Uew;
	Fri, 12 Dec 2025 18:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765564756;
	bh=oxzIUH2ZwNSj3M0nzkdtjbq20VP+3f+HE0zTNH4hVKo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=F+HlQZbmFigoNGWOJ6/fcq+PsU/dHh+pPPi4vYvN78J7vh+n3fCxc1hHsDWC3Eww8
	 6hPBn7gJTMS9/AqqgyHhpSSDNWjKz45utOBJxYghZgBemm0X4Wnhc3iHHuFCDXeVJT
	 vb6FStrYhZPAyfM3TlmxbQ+HqJ8yQA1n52Y+f/5xPmCWam6LGVO898KEQZupbE19XN
	 kCSM0JHvAZXxHqP+t3tqEuWYOhHrU+CE9n8RL3EA3iikYD/uZMqiCJBTtBwvlf8luI
	 d0sycpQ8OfHrklgFN63CXQoar35T//LMVzjFEqPpW1d5kx+O7MRn2IgYnm0MKUNUsE
	 SjlPRqIFa/UbQ==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A43D17E0458;
	Fri, 12 Dec 2025 19:39:15 +0100 (CET)
Message-ID: <687cc16deaeb93e696952e563663478ed889834c.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: vp9: Fix probs struct alignment
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, kernel test
 robot	 <lkp@intel.com>
Date: Fri, 12 Dec 2025 13:39:13 -0500
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
	protocol="application/pgp-signature"; boundary="=-ZyLv75oI4qcKGniOcmXP"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_103921_822908_2D7D957A 
X-CRM114-Status: GOOD (  18.42  )
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


--=-ZyLv75oI4qcKGniOcmXP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 12 d=C3=A9cembre 2025 =C3=A0 11:01 -0500, Detlev Casanova a =C3=
=A9crit=C2=A0:
> When building for arm 32 bits, the struct alignment changes and the compi=
ler
> adds 3 padding bits to the anonymous mv struct in
> rkvdec_vp9_inter_frame_probs.
>=20
> Therefore, the BUILD_BUG_ON used to check that the struct size is aligned
> to 128 bits (hardware requirement) fails.
>=20
> As that mv struct is at the end of the global rkvdec_vp9_probs struct
> and is followed by 11 padding bits, the 3 padding bits can be explicitely
> set in the mv struct and removed from the 11 following it.
>=20
> This makes sure that the mv struct is 32 bits aligned.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes:
> https://lore.kernel.org/oe-kbuild-all/202512110229.R6YCf1Le-lkp@intel.com=
/
> Fixes: d968e50b5c26 ("media: rkvdec: Unstage the driver")
> Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
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

--=-ZyLv75oI4qcKGniOcmXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTxhUQAKCRDZQZRRKWBy
9KwmAP9W3XXuSsHllA3UT4YOrlku35Qk+xAlvxxwkp6DVxtqWAD/SyCvlb48F9q2
ByiCsG1zqo5tziLDbXtpzmdp1y6gAgI=
=xvKs
-----END PGP SIGNATURE-----

--=-ZyLv75oI4qcKGniOcmXP--

