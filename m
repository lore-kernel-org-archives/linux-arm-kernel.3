Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7093ACCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tlnHBwLOV+7xxht9xDo/WQz9BuB9weliyu9uQ3vhws=; b=NXz5j4WTnHj8sScgdv/RuQWoFO
	pquaDnE9nkHBlgE1WGKlnw258ncVL0xovYMVa921FHwq8j4z7CXteYkykJORwcA+mj12ySIeS5yZX
	HF4QGTSxTSsvURrM/CwhlTdyehtwT1c6Ap0yEjCFd2e9PFjAN+fmhT+FL/GGpSjy22WSzLd/PfQbk
	/Myd4aISF5aFFfjcBGKTfGOVFtZxnPdn3B94e0vwiq4ZDY4nlT8YE0lwGWR2mqedIqRqBnOD2c1Ia
	eLzt8My13LVHiXImDOUDMxF/DyePWavv3DIl6cdq6eB1T8xYdUioMfoaUYS7ge7B8xgz3nPCxKtl7
	EAolrkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1kG-0000000Fn5Q-0bSD;
	Thu, 06 Nov 2025 15:17:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1kD-0000000Fn4I-1TJS;
	Thu, 06 Nov 2025 15:17:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762442266;
	bh=DRgu+1zEiLJzFvpqNcYywnec1hhXYCa75y4/TrlRBwg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=H3PJOxvtqbQ72kA29/dtPRySRy3X/JZY1JnX8vB8mMpkAnGTDMeazey1oWJ2Ho9bt
	 zeyRgpkd6g8h6igHZu13qSn79r4sGm7JHTfoDCk8iAX1CHOFL+AxPlO4inD6jJ1QqB
	 uPQrJdaTa1qv33cFL6/UrVxby54yqTFa+ngnn6rQ5plXOROKyynfxGemVj56YAIDCt
	 D/evrmMFyB4XrDTUjJMYmLQiugeCmw2UdOWrpJPgLxqjgs5wRcuGmlmi52GRaxxVHg
	 8LUUNLXrhQl8bSoRw4FfLkKQW4xHjNzNSlBQJ/s523TL00QFWSRe4L5hYjAft+T3LG
	 eXeZ4etQ4nneA==
Received: from [IPv6:2606:6d00:11:ef24::c41] (unknown [IPv6:2606:6d00:11:ef24::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CFAF817E090D;
	Thu,  6 Nov 2025 16:17:43 +0100 (CET)
Message-ID: <bd2f63265df829ec9bb3498c83126827415c2ebf.camel@collabora.com>
Subject: Re: [PATCH v5 5/8] media: mediatek: vcodec: fix vp9 4096x2176 fail
 for profile2
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann
 <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>,  George Sun
 <george.sun@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 Yilong Zhou <yilong.zhou@mediatek.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>
Date: Thu, 06 Nov 2025 10:17:42 -0500
In-Reply-To: <20251106061323.2193-6-kyrie.wu@mediatek.com>
References: <20251106061323.2193-1-kyrie.wu@mediatek.com>
	 <20251106061323.2193-6-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-p4Bu9/Ayloxs70Y/YXH1"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_071749_567221_9CC51295 
X-CRM114-Status: GOOD (  16.85  )
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


--=-p4Bu9/Ayloxs70Y/YXH1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 06 novembre 2025 =C3=A0 14:13 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> The dram addr of vp9 decoder tile number, which use dram mode
> to set tile information, may reach to 36bits for 4096x2176.
> It needs to get the highest 4bit of tile buffer address to
> set tile buffer address.

An after thought, I don't see any call to vb2_dma_contig_set_max_seg_size()=
 or
dma_set_coherent_mask() with DMA_BIT_MASK(32)/DMA_BIT_MASK(36) in this driv=
er.
How do you control this ?

Nicolas

>=20
> Fixes: 5d418351ca8f1 ("media: mediatek: vcodec: support stateless VP9
> decoding")
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> index d966914db4b9..91c563c049bd 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> @@ -1156,7 +1156,10 @@ static int vdec_vp9_slice_setup_tile_buffer(struct
> vdec_vp9_slice_instance *inst
> =C2=A0			tiles->size[i][j] =3D size;
> =C2=A0			if (tiles->mi_rows[i]) {
> =C2=A0				*tb++ =3D (size << 3) + ((offset << 3) & 0x7f);
> -				*tb++ =3D pa & ~0xf;
> +				*tb =3D pa & ~0xf;
> +				if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
> +					*tb |=3D (pa >> 32) & 0xf;
> +				tb++;
> =C2=A0				*tb++ =3D (pa << 3) & 0x7f;
> =C2=A0				mi_row =3D (tiles->mi_rows[i] - 1) & 0x1ff;
> =C2=A0				mi_col =3D (tiles->mi_cols[j] - 1) & 0x3f;

--=-p4Bu9/Ayloxs70Y/YXH1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQy8FgAKCRDZQZRRKWBy
9NPSAP4g8gTapYL8m2LxcUUuZCeWMhCOGTCX8BR5UqAbTL8qfwD/WKrYbiY+6bxl
DWa6+3ECPDXoTJi+A2WmiP1MGLhfOQc=
=PEsx
-----END PGP SIGNATURE-----

--=-p4Bu9/Ayloxs70Y/YXH1--

