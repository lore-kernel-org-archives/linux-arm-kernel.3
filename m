Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6CC1061B0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgAlqHBLxVt+bbtsMHOdr72p5pVTzNF5liMp4UeZYTQ=; b=bNtH0e8o1BYud+ivewAGYLPd2r
	jNdRfI0CFEMTfT94ZyeaPY/bT4OJrLA/r/fygj8ELz0WqL7tIs0eU/VnznqZafVH9d3goBfcO64YC
	0oWXBSogJRvufB2GAhzVyYWe+Oe7edavplVK7eheGWP+dD2rbdsazmI8A+EgEAo9uqfM1+tq8vpU1
	V9ekRTIWs0rglXa8peeoNeKCsU+VOjB356cmXBwvoFi8NaTf79WjoBRflnWO2BBaRPECBRJPA+MWQ
	Nm2BCzWqdDo044QkqzVaSKnGpBWsshZtHiy/XPqUGuRhoVfEhKXUFHwlHgdJW5+HJw3IZyOnr9BO2
	iJWQvRfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7EwT-0000000Bb4r-1kQL;
	Mon, 30 Mar 2026 15:54:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7EwQ-0000000Bb4T-47U3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 15:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774886052;
	bh=evRfJZ2H0f5w7cEuYrRalerBqdAFDdmPvV3Byn5zcKk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=fLMVzIO0WL+sc0qyr1bmUKPIeRxe5LGIhn01XN65Tdy4jP0Mbk93NzcokPLqcbb6g
	 Jw8Vef2vcRCoDEeEHmQMdEk+jzWy4PfbHSNdiJQRp+dllic3Jt0vONpxJRSAsoYXQZ
	 a8/34zeO0Qlfm/boSMeJiwrib/bcX3BLBId3CXAMdwAj9zPa4ZvAabKtbPYKrnOmOU
	 7PQN7uJdT+2/5Zi9Peg8rknUiCTsblsLtQ0KZTvrlV0ggTgAipAUPtI8qwo8HVcpL+
	 RJQTAFEulEKowN2/Uy333hWFXgye6g8tnk2TIsc/ad5nWcdTRhT0OrS3xjhBBg6Xl1
	 0It6wdX6YaP2g==
Received: from [IPv6:2606:6d00:15:e06b::c41] (unknown [IPv6:2606:6d00:15:e06b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC9FA17E4884;
	Mon, 30 Mar 2026 17:54:10 +0200 (CEST)
Message-ID: <ac0caac393dbc7dabe6e0fd530a6a2f9d2742f00.camel@collabora.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, mripard@kernel.org
Cc: paulk@sys-base.io, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 30 Mar 2026 11:54:08 -0400
In-Reply-To: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-kv04JgWUz8A1UA6gWqGA"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_085415_196362_74695BEE 
X-CRM114-Status: GOOD (  15.00  )
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


--=-kv04JgWUz8A1UA6gWqGA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 mars 2026 =C3=A0 16:08 +0800, Pengpeng Hou a =C3=A9crit=C2=A0:
> Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> stateless slice control and later uses their indices to look up
> decode->dpb[] in _cedrus_write_ref_list().
>=20
> Rejecting such controls in cedrus_try_ctrl() would break existing
> userspace, since stateless H.264 reference lists may legitimately carry
> out-of-range indices for missing references. Instead, guard the actual
> DPB lookup in Cedrus and skip entries whose indices do not fit the fixed
> V4L2_H264_NUM_DPB_ENTRIES array.
>=20
> This keeps the fix local to the driver use site and avoids out-of-bounds
> reads from malformed or unsupported reference list entries.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> =C2=A0drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -210,6 +210,9 @@ static void _cedrus_write_ref_list(struct cedrus_ctx =
*ctx,
> =C2=A0		u8 dpb_idx;
> =C2=A0
> =C2=A0		dpb_idx =3D ref_list[i].index;
> +		if (dpb_idx >=3D V4L2_H264_NUM_DPB_ENTRIES)
> +			continue;

Matches how we skip inactive references (in this diff, though most userspac=
e
just don't pass them). Now, if I looked lower, we set a position for each
references. My understanding is that if no bits are set, it means "no posit=
ion".
How much testing have you done to confirm the HW behaves properly ?

Despite this question, I think this is going to work better then doing memo=
ry
overrun:

	Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Nicolas

> +
> =C2=A0		dpb =3D &decode->dpb[dpb_idx];
> =C2=A0
> =C2=A0		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))

--=-kv04JgWUz8A1UA6gWqGA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacqcoQAKCRDZQZRRKWBy
9DAQAPwKkG9KdjJow+AAJHKaPq3Zeel97DZlNnHZBVd/Ag0xRAEAs7QtX42z2jd5
4nollgoY5CGJnkjx9RVSHq+m86uwcgU=
=/FV6
-----END PGP SIGNATURE-----

--=-kv04JgWUz8A1UA6gWqGA--

