Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230F2CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 21:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+905VpPWFNsqdN9ZNh4c2Xt4scACgjmcpfbxIJWGn8g=; b=eGlgNs2oip1uJYRKTRYkTSyjGa
	83MLwE4LfzENfBiyNhNn4UopSB366Oo9OTQlyABdAx/QsSDBl6tt0efogOI9cCuYV7qJzJrjIq86p
	FOLJ/W4Jmr8QJFKGQ7U79zN62e5qWpgJ4oanCcE8Jrq7pYsdIZPiTeMJo/4cq9lqEgt4o3WnFVpLG
	/4TzJt/lA4dEVues5dj/6IdFc+GA6pBJdZ/2vzT3SzqkjWBPEc2ldGuvXkLRG2umcxbaIs8cp1XdY
	PTbaxmFHjYrS+GmpCAeTYfXL2ukIN7fu6LUKMUMRLQb+xHBF/eBQ9ALsQtIM5tKum/bBeNv5lz2Ze
	dyOD7SFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIql-00000001fVt-05tw;
	Mon, 28 Sep 2026 21:25:27 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIqh-00000001fUX-1UOA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 21:25:25 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-9105d241693so30616126d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 14:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790630722; x=1791235522; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+905VpPWFNsqdN9ZNh4c2Xt4scACgjmcpfbxIJWGn8g=;
        b=ycxVg3ybS0fVfOrpvUVASUwlyOgzIL+0nGKiZNFlc7ls1oAleQBr6QLCfNWh4eiVtZ
         tPKv+iKJDBCWEE3dw7us28hf+DJr8vjXeKwbCu2O247gshUkS7qVCVRc3qSW5+I5QXLf
         Ei06gkAP4OUXwK+3qvUec4Xzb6O3UpPiVFW1oNWPaxeGaBKVUAFt228C/IFf1hFSJsyv
         UNhWDKdlwNx7aS6YJZ2QeZkeUrpMzOPjLPLZrrg68jBZbvEIDhD5HLn0xaZFaHzepfo9
         POGH+92a36Zk5/yUFWVgZ7nprv3FLLds3B+KPJK2AayvhnYPk3ounKWQE1IsFrgwVPvY
         Hfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790630722; x=1791235522;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+905VpPWFNsqdN9ZNh4c2Xt4scACgjmcpfbxIJWGn8g=;
        b=vFeD9w9TDljbQGF+eIKnfBJi1HVTqKmdaCAsdVO9vYhLGKTKn4ZXz3mIBejK6ekyRy
         ShvXsox17kWoHi8kgHAiG0aONmQjHdORaYfy5QQ9BNJD2o6iiVZZOOon5f1l28dJpjoV
         wxFZMpUDvEixCZIBfg0JNIf3rRoyTIV1rkR7DOwf34QBZvhgjp6g+CfS3T0w3TXg0uHw
         bOovzXbEAW316NjeoG4r9Bl2G7Ffm2pbYBAkk2Ohx9myoj0z3w/+HxUO6V5Na8Er3kaq
         u//A1OWW2ilWY2IJJ6EoiLvMlWzA3VY9WxWIP5TRLcTzdTUJD0RNEWUqgHtSCz9RQdkS
         p8Gg==
X-Forwarded-Encrypted: i=1; AKwUvBzASzrv2ria1o362W219roz1ybroOPgzK+Xt0EaQ/S/1DpC7rTB3fDxNU22+wjv8YSrXhnwVnS+AiAjYoFvqpEm@lists.infradead.org
X-Gm-Message-State: AFq9FYK+FHq/vZUvlgI0nw8ScGYVRD+tYIAHYTtQKI1c/bBd8l1RWmRq
	500kkizxuorEJ9rl1+BdZubx7DXAMRBcArpyYOG9UCX9UEBuxp2Az21XeVwQuKEz54U=
X-Gm-Gg: AYBFou2XNjkVOUOSSWvMd8xo+YghuOeki3TlWQzyT0Bk+FT1kSxpgqGbloInOdH9ZKB
	9n1V7Q5Zn/8OE7XlPqFOlSf5ZHxi+9cHbvpsDIt1+D+QHnSqk1zeZLkYhkbqGtBmd33o2IzgESr
	+fYFficfRiIZ2HYhGVhHxOoOeWkMTwJkInxWItQgJKrnTL96jkEiSgbJR/+QBUfXontgaTK94p1
	swzKUXq7fFjRmluTg5je+bBz/XWaiLFn1+6lgcldQlAQiTncEOuvzQOgA4SUv8/B0dVNPNwL3I9
	dMnoIaS2m9n7I9eTLXN2fZ4pXgRqrlxMuVooX0kDPQNenmF9+zcKLWRNCT9ueYfK9VVxxhB5OIN
	75O93y+mYJIG7wv3X1fAqbEwBUUmSdMiKQK8MKcvhALkSz74BfHurNAFrZDKvQkk6CbyIEy+8es
	sBUuazEtYmxgJ37VaCw1Y/Su010lH6Asasmi+3A4PG84ScEDjSgcv9SgJEqkFvRUdVh0G/bHxZb
	MJdWvblaUizMQ==
X-Received: by 2002:a05:6214:8409:b0:915:ebf7:34ad with SMTP id 6a1803df08f44-915ebf735a9mr45816036d6.12.1790630721868;
        Mon, 28 Sep 2026 14:25:21 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-915e759a989sm35062676d6.31.2026.09.28.14.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:25:21 -0700 (PDT)
Message-ID: <1b837fecc1992e94bbe77229a2529c9eb1ac0c60.camel@ndufresne.ca>
Subject: Re: [PATCH v10 0/3] Mediatek MT8189 JPEG support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 sirius.wang@mediatek.com, 	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Date: Mon, 28 Sep 2026 17:25:19 -0400
In-Reply-To: <20260720062829.7343-1-jianhua.lin@mediatek.com>
References: <20260720062829.7343-1-jianhua.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-SM45MfqXGrobY1wEGs0I"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_142524_353295_7A8ECF52 
X-CRM114-Status: GOOD (  23.55  )
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


--=-SM45MfqXGrobY1wEGs0I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

picked, ty

Le lundi 20 juillet 2026 =C3=A0 14:28 +0800, Jianhua Lin a =C3=A9crit=C2=A0=
:
> This series is based on linux-next tag next-20260707.
>=20
> This series depends on commit 7560349ee0d9 ("media: mediatek: jpeg:
> support 34bits"), which introduced the `support_34bit` field in struct
> mtk_jpeg_variant. That commit has already been merged via the media
> tree and is present in linux-next as of next-20260707.
>=20
> Changes compared with v9:
> - Patches 1/3 & 2/3 (dt-bindings: decoder & encoder):
>   - Explicitly set `mediatek,larb: false` in the `else` branch of
>     the `allOf` block for older SoCs to prevent incorrect configuration
>     and ensure backward compatibility.
>=20
> Changes compared with v8:
> - Patches 1/3 & 2/3 (dt-bindings: decoder & encoder):
>   - Expand the description of the `mediatek,larb` property to explicitly
>     explain its necessity for accurately describing the hardware topology
>     (SMI LARB connection for memory bandwidth arbitration), independent
>     of the IOMMU driver's implicit handling.
>=20
> Changes compared with v7:
> - Patches 1/3 (dt-bindings: decoder):
>   - In the allOf constraints, only keep maxItems: 1 in the then=20
>     branch and minItems: 2 in the else branch; remove duplicated
>     constraints already defined at the top level
>=20
> Changes compared with v6:
> - Patches 1/3 (dt-bindings: decoder):
>   update the existing `allOf` condition for mediatek,mt8189-jpgdec to
>   make the 'mediatek,larb' property strictly required for MT8189 SoC.
> - Patches 2/3 (dt-bindings: encoder):
>   Add an `allOf` condition to enforce that the `mediatek,larb` property
>   is strictly required when the compatible string contains
>   mediatek,mt8189-jpgenc.
>=20
> Changes compared with v5:
> - Patches 1/3 (dt-bindings: decoder):
>   - Drop top-level minItems/maxItems for clock-names per Krzysztof's
>     review.
>   - Refine allOf block to strictly enforce clock constraints.
>=20
> Changes compared with v4:
> - Refines the device tree bindings for JPEG decoder and encoder.
>   - Patches 1/3 (dt-bindings: decoder):
>     Moved the standalone compatible string mediatek,mt8189-jpgdec
>     into the first oneOf entry along with mt2701 and mt8173, as
>     suggested by Rob Herring. This correctly groups all independent
>     ICs and removes the redundant items wrapper.
>   - Patches 2/3 (dt-bindings: encoder):
>     Applied the same logic suggested by Rob Herring to the encoder
>     binding. Restructured the compatible property to clearly
>     distinguish between the standalone IC (mediatek,mt8189-jpgenc)
>     and the ICs that must fallback to mediatek,mtk-jpgenc.
>=20
> Changes compared with v3:
> - The v4 is resending the cover-letter, because the v3 cover-letter was
>   not sent successfully.
>=20
> Changes compared with v2:
> - Dropped the dts patch (arm64: dts: mt8188: update JPEG encoder/decoder
>   compatible) as it belongs to a different tree/series.
> - Patches 1/3 (dt-bindings: decoder):
>   - Changed the MT8189 compatible to be a standalone `const` instead of
>     an `enum`.
>   - Added an `allOf` block with conditional checks to enforce the single
>     clock ("jpgdec") requirement for MT8189, while preserving the
>     two-clock requirement for older SoCs.
>   - Updated commit message to reflect the schema structure changes and
>     hardware differences.
> - Patches 2/3 (dt-bindings: encoder):
>   - Changed the MT8189 compatible to be a standalone `const` instead of
>     an `enum` inside the `items` list, as it does not fallback to
>     "mediatek,mtk-jpgenc" due to 34-bit IOVA requirements.
>   - Updated commit message to explain the standalone compatible design.
> - Patches 3/3 (media: mediatek: jpeg):
>   - Refined commit message for better clarity regarding 34-bit IOVA and
>     single clock configuration.
>=20
> Changes compared with v1:
> - Patches 1/4:
>   - Updating commit message
> - Patches 2/4, 3/4:=20
>   - Updating commit message
>   - Adjusted property descriptions acorrding to hardware requirements
>   - Improved formatting for better readability and consistency
> - Patches 4/4:
>   - Updating commit message
>=20
> Jianhua Lin (3):
>   dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible
>     string
>   dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible
>     string
>   media: mediatek: jpeg: add compatible for MT8189 SoC
>=20
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 50 ++++++++++++++++---
>  .../bindings/media/mediatek-jpeg-encoder.yaml | 38 +++++++++++---
>  .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 ++++++++++++++++
>  3 files changed, 118 insertions(+), 14 deletions(-)

--=-SM45MfqXGrobY1wEGs0I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrbPwAKCRDZQZRRKWBy
9PnDAQCv7TgjjF2tq0hzFvsEpdGPWatoaiOzm0hk0reRJRopnQD9HmGDrTgAlCm0
1lNiRF/hRw9t61kIcl0mv3QOQl05PQo=
=A3bH
-----END PGP SIGNATURE-----

--=-SM45MfqXGrobY1wEGs0I--

