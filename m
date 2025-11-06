Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D957CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcNZQMxQxGFlCfiKbpzNvU1lNDrDH87wY/iGFyjNd28=; b=ueHroLUzfWYIIxLAnHC/QF8Ujk
	BDv7U2dm1rhjJjfxfeu40LwSG1Z5vW6cMPSQ1A7SawSYQNe3XIfwND+Ifo3KgVP680nU4d0QZA/ew
	Kk6xGbUfOuKtSg6X1XXWBCzG/61BxACL450bY6gSt9NmGDVW2ZqL1k/0zRrJjky5NXvU/I1hnJBag
	QcYCLCsCQAGre1zyMN8vYnE0BGuuVQz87tJiai/wZVsCzdGfNe9iiyz7tqUlcdSAxfMyr58TJCwci
	DMgzScpb8XlB2lZf1CLQNqZ2oOUPoO7xuCT8L87ePLstkEsXV3KkyvY79vi/B2kdFyNJy9D4NuCia
	mtxV2n7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0tp-0000000Fh41-0S00;
	Thu, 06 Nov 2025 14:23:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0tm-0000000Fh3Y-3XY7;
	Thu, 06 Nov 2025 14:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762439016;
	bh=lbvG7apBTU01DmFiJ5pQJMotoKQvfUuEd42+VAzjllY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WlkdRfaThTmQ5vALbmN2tsccBhZ5y++BNDlJ8tiQgzWN70PkaWxB+BxTDkBPN8/Le
	 lRxbl2OjYq7/3Lfd6VX6vaTXdaz6DZrY91a0FAUvusHGaidzEFGNxbZ2dobccQThAJ
	 XE2FU7DC/q8UY/Sg170ztacS4DCgUC+48vw2OJP+qHUapP9nsIeJq/Ke3gXdcJ7K0H
	 T7wzR0MVrteYgTFNE/3e0m2BwbvpUhT2B2ISNRapbQI3C1jm01OQuifXqRllY1E8nA
	 FSY+HIbbexDC635nLn46kyhP6Ae2jo1QOFPyVh20FAdHAeq0HaJWJvjmLMKm98bO65
	 JB4siQxtnb19w==
Received: from [IPv6:2606:6d00:11:ef24::c41] (unknown [IPv6:2606:6d00:11:ef24::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B69D317E0CA1;
	Thu,  6 Nov 2025 15:23:33 +0100 (CET)
Message-ID: <8408b589db4c31e32dafb6cf7c80a80c94b488c7.camel@collabora.com>
Subject: Re: [PATCH v5 3/8] media: mediatek: vcodec: add profile and level
 supporting for MT8189
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
Date: Thu, 06 Nov 2025 09:23:32 -0500
In-Reply-To: <20251106061323.2193-4-kyrie.wu@mediatek.com>
References: <20251106061323.2193-1-kyrie.wu@mediatek.com>
	 <20251106061323.2193-4-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-oN0nrYRIFHsUPQUtneGT"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_062339_081124_2C33FD92 
X-CRM114-Status: GOOD (  13.40  )
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


--=-oN0nrYRIFHsUPQUtneGT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 06 novembre 2025 =C3=A0 14:13 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> add profile and level supporting for H264 and vp9 of MT8189
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index c1cef78471a9..0a9bdc5316f9 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -552,6 +552,7 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l=
2_ctrl_config *cfg,
> =C2=A0	switch (ctx->dev->chip_name) {
> =C2=A0	case MTK_VDEC_MT8192:
> =C2=A0	case MTK_VDEC_MT8188:
> +	case MTK_VDEC_MT8189:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2;

Please consider my suggestion in 2/8, you could then move all of this into =
the
static compatible data structure.

Nicolas

> =C2=A0		break;
> =C2=A0	case MTK_VDEC_MT8195:
> @@ -573,6 +574,7 @@ static void mtk_vcodec_dec_fill_h264_profile(struct v=
4l2_ctrl_config *cfg,
> =C2=A0{
> =C2=A0	switch (ctx->dev->chip_name) {
> =C2=A0	case MTK_VDEC_MT8188:
> +	case MTK_VDEC_MT8189:
> =C2=A0	case MTK_VDEC_MT8195:
> =C2=A0	case MTK_VDEC_MT8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
> @@ -623,6 +625,7 @@ static void mtk_vcodec_dec_fill_vp9_level(struct v4l2=
_ctrl_config *cfg,
> =C2=A0	case MTK_VDEC_MT8188:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
> =C2=A0		break;
> +	case MTK_VDEC_MT8189:
> =C2=A0	case MTK_VDEC_MT8195:
> =C2=A0	case MTK_VDEC_MT8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
> @@ -641,6 +644,7 @@ static void mtk_vcodec_dec_fill_vp9_profile(struct v4=
l2_ctrl_config *cfg,
> =C2=A0{
> =C2=A0	switch (ctx->dev->chip_name) {
> =C2=A0	case MTK_VDEC_MT8188:
> +	case MTK_VDEC_MT8189:
> =C2=A0	case MTK_VDEC_MT8195:
> =C2=A0	case MTK_VDEC_MT8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2;

--=-oN0nrYRIFHsUPQUtneGT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQyvZAAKCRDZQZRRKWBy
9HgOAQCcOPqEipHaLaMrsEybD4wMnGsF5eIZwMZBS7s8CI99yQD/WfKVqeU7qjJN
qGe3ad5qCAZQWikimukLeXwioptSOw8=
=F5b3
-----END PGP SIGNATURE-----

--=-oN0nrYRIFHsUPQUtneGT--

