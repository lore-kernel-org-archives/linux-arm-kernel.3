Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB6FD43346
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 20:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CB8QSWCSwPoqbc+AWXqdpHuGqo2I7rvOZb4N4gm1d20=; b=RBpyF3hyvIbS6wtrvU6iAze3UJ
	Q8yc4iEikzDNksy1aANghw0Hi0PV4mQC49HBFyenul9DnF9Hl7d/61w5r48lyHfvqWc/gklP8B4Lh
	SxqaElYu2Y1YRr0iSg74qDnHoYYoHJ2wZqnYm1bep6oEwebcSnjneFhrj6uY5bVc8lZOhHoIylDJW
	eiR7cYfh8p8uO5pJ6kbArPAJe1SJhOZNa+sf1pAo3gJIXHEp8R4AOCCS9v4ZhXYDzhAiMVnBkWX1T
	QycuV1w9VjOKYpfH/Nui9xsT8nXu/7n/7LF7KzPJ+2UNVhylOABDc7u8L3dnOAZyPvML78XWd6394
	XHRw2+XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnL5-0000000HEiB-2dmy;
	Thu, 11 Dec 2025 20:32:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnL2-0000000HEhN-2kRo;
	Thu, 11 Dec 2025 20:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765485154;
	bh=G7q1JEkkHwrsqhqOlDvPl2Tn67bvGyBMMPrfM/9YkWc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hljhZx4+40EmFAPe40tkyy69L4LXOwZ8Zt+CstL7MneCO2B4OX2icxx+Afr+AFr5t
	 HJyqOcePX/DI0GuB86JVUAmQGTQzEwoJcdQZEp30O/kG6ZxV4F/6J003FCkZfS77Uj
	 AAkloLCfPGriaAVxR2It+UIlEOVH5tQTkxCdS6AuacdBpj605DAnUW5aGoUCn+tGqo
	 PvMLWyNvwy6LwD8a9Nz+4pjJ2Akr+d6fGJ5/xWVAFneOhvrbxGdTHKvZshd4UNc4ai
	 E3JVnuJhU9FvtTJna8ffAUAO54ViGtmxsBFmKWD3xS9Sml6xdbpEFr179ZSS0t0mnE
	 xGJhUOSkEdllw==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 280F917E110C;
	Thu, 11 Dec 2025 21:32:32 +0100 (CET)
Message-ID: <03d3228206dbeb7f3fdb9466f84511f598ae9d65.camel@collabora.com>
Subject: Re: [PATCH v6 07/10] media: mediatek: vcodec: Fix vp9 4096x2176
 fail for profile2
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
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Date: Thu, 11 Dec 2025 15:32:30 -0500
In-Reply-To: <20251202074038.3173-8-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
	 <20251202074038.3173-8-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-6GO17q2aWDuQ7cn4Ze+O"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_123236_846002_DA3C6C98 
X-CRM114-Status: GOOD (  16.90  )
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


--=-6GO17q2aWDuQ7cn4Ze+O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 15:40 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> The DRAM address of the VP9 decoder tile info buffers may require
> as much as 36bits for 4096x2176 resolution. Fold the 4 most significant
> bits into the lower (padding) four bits of address.
>=20
> Fixes: 5d418351ca8f1 ("media: mediatek: vcodec: support stateless VP9 dec=
oding")
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 10 +++++++=
++-
> =C2=A01 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index 36a87b455d11..eca6280098be 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -1134,9 +1134,17 @@ static int vdec_vp9_slice_setup_tile_buffer(struct=
 vdec_vp9_slice_instance *inst
> =C2=A0					return -EINVAL;
> =C2=A0			}
> =C2=A0			tiles->size[i][j] =3D size;
> +			/*
> +			 * If the system supports 64-bit DMA addresses, the upper 4 bits
> +			 * of the address are also encoded into the buffer entry.
> +			 * The buffer pointer (tb) is incremented after each entry is written=
.
> +			 */
> =C2=A0			if (tiles->mi_rows[i]) {
> =C2=A0				*tb++ =3D (size << 3) + ((offset << 3) & 0x7f);
> -				*tb++ =3D pa & ~0xf;
> +				*tb =3D pa & GENMASK(31, 4);
> +				if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
> +					*tb |=3D (pa >> 32) & GENMASK(3, 0);
> +				tb++;
> =C2=A0				*tb++ =3D (pa << 3) & 0x7f;
> =C2=A0				mi_row =3D (tiles->mi_rows[i] - 1) & 0x1ff;
> =C2=A0				mi_col =3D (tiles->mi_cols[j] - 1) & 0x3f;

--=-6GO17q2aWDuQ7cn4Ze+O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTsqXgAKCRDZQZRRKWBy
9AHCAQCIL2oKUruDOqqd+Tp2NG/Cqh8AXUPiefAumbjS9hhj7gD/d+bv4U9ehbuM
LT9GLyjqJT5Gx1XLLI5owiSgEEcaUAs=
=/hjj
-----END PGP SIGNATURE-----

--=-6GO17q2aWDuQ7cn4Ze+O--

