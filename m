Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9712CA5FA6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eqac1h8irF+zeWRR8Dm7dn5WwgpsnMLx6CDzc6fVO0=; b=FDLfYUfjawD6S1weJsh/ksaxIN
	gaNYP47HJqpX+RHM78/9zBr1ppQb96uAam3bv7oMBTUM8F0FG/XI5zhM8dHCfAR6T45OGAEO7eJyP
	e7kaoyhheamy+SItv0defOui8InpDIS6TkBKz6IAK8gy3TmMTVvN7ZbI78clqBrTD9s+wzBpyAFzK
	vojk0ZMpYeNLavJQXUuxuKKkeDYW9aZSAPXIq6NPrhCJDp6Rywk66tmFYaJRMTKM5gvIBxx7N7iR6
	gG2xNChaIQYG+jTkvzTiFfjvyor3fubz55fNDPYbr0nTmSUryUzln8P7FrYTZV3CGgUbbsCfWE0w4
	JTApl0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH7s-00000001SoK-0Lwx;
	Mon, 28 Sep 2026 19:35:00 +0000
Received: from mail-vs2-x29.google.com ([2a00:1450:4864:3a::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH7T-00000001Sc3-3Wsl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:34:37 +0000
Received: by mail-vs2-x29.google.com with SMTP id ada2fe7eead31-7b47bba7c88so980901137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 12:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790624074; x=1791228874; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6eqac1h8irF+zeWRR8Dm7dn5WwgpsnMLx6CDzc6fVO0=;
        b=FxfAAuyTJm7vcAPE48uoGdf5MMYeZQP55kRmeCCBXbbfrTSf7x57V7JDepn3/VXF1m
         3JrnP2176v1gVHz/L32v65mUjqL5xFV7InG7eRHusQpyMhTmhne3kClI46+YMc/cWxry
         iGM+abe9amcMTnzKEXAlS7LeZxBjmFhryEk2lOYoSuIyh8I+GxUu5cCdC9x9yMQ+0zHY
         XxsccwKDBD++UpVf6Ey1yLDRS4Pn2P/BK+gJrftSbwhdTGKhz852th6PaX99FonW5vZm
         yQUnItxf54GxiQtLKNwiebhC07JjiFzQGeA31zB9seH3G0P9bTmqRqbD/zHKth12tVhx
         eGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624074; x=1791228874;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eqac1h8irF+zeWRR8Dm7dn5WwgpsnMLx6CDzc6fVO0=;
        b=Xbnh4hEMnTbL57s3VKwx+Y1Uhq5STQwuWRG8XS43NoghWX1fk6U3fcUSZMQWQsAPnW
         uPMJJpgaDsGpunizYtsV0vjCyL1g9a5vBPA6nf+dkFg5yEVGETrpKI3O/f21/JTNfRg4
         c14tWrYkBt1yJMXjQZDR1ywTt97wTDXQ2u1HTICIYIELq1C6PQB9rkq2Mu5hHmvpBNlv
         Sf45/Mk8ZBcvZNpvVLAuW/jrC35OGz48U8jULWM+VfRWWMoqswD2RScDHObYdGKAW7/4
         U7I8++Qwg2ksQFFuEkJYgBPgPxm97W2U4x8Ru8mrMeRVGocDWX+03s1lbEvFfdez8alS
         kxJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwORoXny7GZe1vkMph3friQux5Kh6aUXD7mMsvecG1tij/baMgg/ZHSI867vRXZy9bu6DwkwePZJwtFI+2BpusW@lists.infradead.org
X-Gm-Message-State: AFq9FYITxfnDcscNixs1DVvA27xVhgAbp2Hh8+qzxABh7ZsF4axFEw8o
	QBv7fTmZLs6W8s3J3rIndm0TkZeKydi9Mkwk2CuX9pfR6qo3/+pfk6OpixPSTMfjRAM=
X-Gm-Gg: AYBFou0hND9Ws9AzWunZ42LChO4XfXK2xdcK3woNQZMp2QpOSwMdgSYC5jPl3iXjyQC
	+ZEn9KCLf0GKwmA9YGjLOy4WMuURxU4+FOjsyajied4e2013KG9OBbaGQGNvayy6jZM+EsK3uo7
	hdDpjvSDpIPthZjfjXqrbfzFFEeyq/zexi/jP6iNogznrMRBxOTctdw1L55aiH6cd26f3+wKAyF
	OZs1IAQ/4yNLB7WpNSdnxHjrDHT6+yE8P5ND4rk5JXmeH4bJeEA90UJs+0EoAPtfJw/zJIVvjRU
	rytjzug24Xvh9tSHCKaL4ecjZw0LOXiTaOCRRwV3J7yfDw3X4JX7fduokc+6rpojKB8a6c7x8bo
	Bzjg5aYBoYKSCQ4gfKVJ5nArQ9hxEqMe4qrSaqPFJjeip+jVBwITsM8DmJXb4j0Pvy43La1xncX
	HJ2Ot4CA9rdx8qSjAxCetl0gNfKiJE5qAvzL1j6+lW0gt0VvWGa4U75KhKmH+HAEvlpz7VjmDlB
	8tdEnbPsHgFxQ==
X-Received: by 2002:a05:6102:c94:b0:7b5:4700:3a5e with SMTP id ada2fe7eead31-7b547006f20mr1391763137.11.1790624073763;
        Mon, 28 Sep 2026 12:34:33 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde6b43916sm10558755e0c.18.2026.09.28.12.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:34:33 -0700 (PDT)
Message-ID: <4f6f3ba03cc3520505a3af8a259bb1db4fc68e19.camel@ndufresne.ca>
Subject: Re: [PATCH] staging: media: meson: fix typo in codec files
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>, 
	neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: mchehab@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	hverkuil+cisco@kernel.org
Date: Mon, 28 Sep 2026 15:34:31 -0400
In-Reply-To: <20260508055731.19784-1-mahamaryamjavaid@gmail.com>
References: <20260508055731.19784-1-mahamaryamjavaid@gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ioRvVvCQ5XFlC4aqFG8O"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_123435_901626_5DDAD809 
X-CRM114-Status: GOOD (  17.16  )
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


--=-ioRvVvCQ5XFlC4aqFG8O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

subject should have been "[PATCH v3] ...", already picked but wanted you kn=
ow
know.

Nicolas

Le vendredi 08 mai 2026 =C3=A0 10:57 +0500, Maha Maryam Javaid a =C3=A9crit=
=C2=A0:
> Fix spelling mistake: substracted -> subtracted
>=20
> Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
> ---
> Changes in v2:
> - Combined both meson typo fixes into a single patch
>=20
>  drivers/staging/media/meson/vdec/codec_h264.c   | 2 +-
>  drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/stag=
ing/media/meson/vdec/codec_h264.c
> index 89e0f8624e5b..a6074de15118 100644
> --- a/drivers/staging/media/meson/vdec/codec_h264.c
> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> @@ -16,7 +16,7 @@
>  #define SIZE_SEI	(8 * SZ_1K)
> =20
>  /*
> - * Offset added by the firmware which must be substracted
> + * Offset added by the firmware which must be subtracted
>   * from the workspace phyaddr
>   */
>  #define WORKSPACE_BUF_OFFSET	0x1000000
> diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/st=
aging/media/meson/vdec/codec_mpeg12.c
> index 76e9ca7191ab..ab4374e3b2ef 100644
> --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> @@ -12,7 +12,7 @@
>  #include "vdec_helpers.h"
> =20
>  #define SIZE_WORKSPACE		SZ_128K
> -/* Offset substracted by the firmware from the workspace paddr */
> +/* Offset subtracted by the firmware from the workspace paddr */
>  #define WORKSPACE_OFFSET	(5 * SZ_1K)
> =20
>  /* map firmware registers to known MPEG1/2 functions */

--=-ioRvVvCQ5XFlC4aqFG8O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrBRwAKCRDZQZRRKWBy
9LQxAQDbhfzAoaDPMzDhwB/2BfSnHFrathZiFBRY73XPw8V60wD/cj3/gXBOsU2H
IXhvc2D00xxNhwhw9hEzo1JUkC370Ak=
=AYIv
-----END PGP SIGNATURE-----

--=-ioRvVvCQ5XFlC4aqFG8O--

