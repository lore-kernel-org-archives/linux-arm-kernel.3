Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4222DE776F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 19:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZg5eUrmrvQkn5kS5Z5StXMcG2MdDw+ySiCbxKWmi3o=; b=JSK6Jj/EtDjOjzKKp6sEADcRve
	64P1gz8K2+XpPNFOJU3/w508CupX7TRGOI3Cc/+4Hq6/KIlMvDT3MyCKr2svD/AmkHeimhQwsa2xF
	K2LJyJhJyQIg2KEE5KHkmtEo/mOKv0bj/ty4oxhTJef997ofFLAiXPyVwDbjo7QYEkIVYszuj6COt
	OjafflyyoTKXV8H2wgelSy/YYZllu61ftOfSC8L/StsyvkEeOP7VMJQZSwLXm02+96/NbbFIb0ztF
	BHiocIGcALlX0Qx2Jh3dIw2VuQEfWDOc2FYo+mFVekSk44jpg4AUsfBS+tO0zwlVEbyjp2V6h/4U5
	OEZkpEhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUN5-0000000HLhb-2FWC;
	Wed, 24 Dec 2025 19:18:07 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUN3-0000000HLgw-1BoE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 19:18:06 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8b5c81bd953so745121485a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766603884; x=1767208684; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xZg5eUrmrvQkn5kS5Z5StXMcG2MdDw+ySiCbxKWmi3o=;
        b=hmqXLK8DA1uYE9flIi1EGIkLH42pnekliHymY2TTdHgdGg74wcczJ0YWOpLffnow6n
         OMuJnGzBbsBK+aTnN9MPPuDbTg3LmLP6JklTXZxnbgnYN9DpLbszadt2DjripI0OGHM1
         pAGg3nE7fTL5ISRjSICPap4etnJEA/9OYRn8Un9NUtnH/MBaW1RlXPIRUR33+sS9XVqL
         RdOx4Z27ZBT7UoYsR3JkT6nJhoMIgvMd/B5b/BxT/doEIMB0beRjdTzooHDdjCyY3Pnr
         vjeYH7FkopvN77wR9SH/n3wObDndogeixyYhwL5vCCFc0JpED3PzdJUhQzJNkWDwb3bv
         fRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766603884; x=1767208684;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZg5eUrmrvQkn5kS5Z5StXMcG2MdDw+ySiCbxKWmi3o=;
        b=KnF7/BSrWm3OdvrLx7Mhdn49o9JQlvfMmWYAKC5btOCbHQlSjnDG+/E13YfSKfemth
         o0RSeiFUbJ3Z0LTYiP/n/pm5qtyX9R711QCAdC/qHUVQaPZ1cgSdQ2iqlAG/+VjZnvOa
         uGINKuw/FPpyoQ3e0LDOPZtLEOA3tqXKsFv5WFy2HmLb5PexQaWuAX+fpnKiFQDFxoec
         xQkBiY6yPoNKO5GKqSBfX45JkbBUjJn3uyMUYYnkVSp5F5530m5fn+OpDbqamj3ZLjjg
         VqWpKPYXoBhWbLOn9L630HmlM+oM6NZV8kpash45oW+uv06lneRfe0jId4B9Maypfz1y
         5D3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTC5lAM/rHx97cJGFfXQlVf30vV7t3oBXaawLdcI62Bum1QqQ+E7czkCy9DlMNO6bOikiInrL5zSwRfOVRvNOO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+LAZhldtvLshw1Nsd1Lqj7DSPzhcDHdVBhdsLj02ejH5uEzrR
	4/P+ywdGFoyEwzmQVGtzgvH3qXjpW0Kb++UQOi/vZ7R/ECfZWYx4KEg+naMnaXB/nTw=
X-Gm-Gg: AY/fxX7Gdf65TKlpD5/jqF2lyI3k37nWZYQF1QUEFIEO1U/VMXj4CxMfH9oLFBaoMui
	gbRWd5K89D4fZb2fsVTQ4n36V2qIhndYeG6JR7kphqZzrlFJx/0ZsZInis1GXmcGAJbU7Bg1nRL
	aP1+p67gRqdGOCG7GHcT1J7ZFSAB1ap4saHDakmygl4ihGBAZYRrzBJD5FYGbvxd35PL3M8Qtw5
	0nXVglSJMCy5SoE3303FUzEVy6c33gi4cxm7GoWTjoTu86I3GXWvrxndWXunZOv91o0hKV4F2On
	vF9Dxafr/dmo52tQqJ8GnRqB4oqLuQFMofp5JiT613yQeRdUTXErPYv0JZbIDF3bigR9uYN3SgW
	n7CA97Ozoz4Jg3i1MpKDNy4at7hEZCAhirIehUDB95BLngs7xXnDGE5sQM/ks1Y7laODig5vC8/
	xPqd9O9MMWj7rSwf9x
X-Google-Smtp-Source: AGHT+IFE+lwyQ0lBVNQN9AauKUiupd6cPnSEIMOpaIWg/SbEk3o4rIkkKVIUe+K1qw6hZBgNQd+vpA==
X-Received: by 2002:a05:620a:4843:b0:8c0:cca6:8522 with SMTP id af79cd13be357-8c0cca68539mr1707477185a.37.1766603883870;
        Wed, 24 Dec 2025 11:18:03 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623feb0sm136297056d6.2.2025.12.24.11.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:18:03 -0800 (PST)
Message-ID: <b6ae2f157fb6fd0b80602f363b99dab1dc0b1cc6.camel@ndufresne.ca>
Subject: Re: [PATCH v4 1/3] media: docs: dev-decoder: Trigger dynamic source
 change for colorspace
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 24 Dec 2025 14:18:02 -0500
In-Reply-To: <20251217030227.1546-2-ming.qian@oss.nxp.com>
References: <20251217030227.1546-1-ming.qian@oss.nxp.com>
	 <20251217030227.1546-2-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-n17ZtuMY6Flq/RX7bbkp"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_111805_326734_B1090B4E 
X-CRM114-Status: GOOD (  13.79  )
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


--=-n17ZtuMY6Flq/RX7bbkp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 17 d=C3=A9cembre 2025 =C3=A0 11:02 +0800, ming.qian@oss.nxp.com=
 a =C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> If colorspace changes, the client needs to renegotiate the pipeline,
> otherwise the decoded frame may not be displayed correctly.
>=20
> So add colorspace as a trigger parameter for dynamic resolution change.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0Documentation/userspace-api/media/v4l/dev-decoder.rst | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> index eb662ced0ab4..2beb6ba1b3c2 100644
> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> @@ -933,7 +933,10 @@ reflected by corresponding queries):
> =C2=A0
> =C2=A0* the minimum number of buffers needed for decoding,
> =C2=A0
> -* bit-depth of the bitstream has been changed.
> +* bit-depth of the bitstream has been changed,
> +
> +* colorspace of the bitstream has been changed, but it doesn't require
> +=C2=A0 buffer reallocation.
> =C2=A0
> =C2=A0Whenever that happens, the decoder must proceed as follows:
> =C2=A0

--=-n17ZtuMY6Flq/RX7bbkp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUw8agAKCRDZQZRRKWBy
9CHGAP9gEAjecV8PUMv/Zb5o06iitW7EtgLf6x+mn9znVa2a7wEA6gnPxAGouGcD
1gWVb5hh/gTP+c0avA3fnMj4aV97VQc=
=oB75
-----END PGP SIGNATURE-----

--=-n17ZtuMY6Flq/RX7bbkp--

