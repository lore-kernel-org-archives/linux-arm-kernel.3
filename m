Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B84C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 21:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7COH0HfGmcr8iU2Gk/Btx58QJz615VuS+nf2+Lx7ys=; b=z4vT4nraIrAPeF6AOLAH+H7UsL
	UX2M0qK396My2MJ3d/UjpMBlwUVf+sxaM3b4D5TAzWfbIGKz6e9qFSlSnx73kdmHwgt1Oohe6Cgw6
	pCb2v8eOflGFs5DB+0aLSTfm4Kafn2UdG/agUovA9Dcp+/mhJCKRv4NHWUqUIpwIeyLSQ7yhIXaSL
	V/3C7CmCWIe1lODdim6sORBJVsRW0mv3N4yOiB36LgTXUzJPa1pixMZJ7H5E3rB61oIu4Lwxr4glr
	xv0PbHmwp/vk8m7A7j2+C7azcvb3fF+nctbe3Hmk6aUqCsletiOoK2Pi+fXBI/JOi9cltSnRrZ32X
	8GVdPGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wifTt-00000006vFs-01bB;
	Sat, 11 Jul 2026 21:43:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wifTp-00000006vFN-1dI0;
	Sat, 11 Jul 2026 21:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783806200;
	bh=5iyh145oPbVi0/Y2eokUBvMwzT4NqhE95qIzSK3Ghxs=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=oLHqB8gTjFdC6EVn3NxVA+q6ljo4sR9yi82DgznHeWf9j8SzbVfu4kWfaSclB+y84
	 DmEdssphelKp5fsUdXW5RXK6pxJXgVYt+L/qBs5NiOKR+z/+jAbNBwzoP2V17+b2hF
	 k076x491QnSa/FX4bc6yL4sX5BhAMYGLqhwRMZAB226sr0txLCgJVAo3IKMKeL8ENg
	 +YmihcA8k1NaErlLRW4/p7UHYkD1wkWGBI0U4vTQZqsS8BI/l+1GdO7PmN4iIr6G4w
	 QbagbQ+VTKXOcz9OMTPTI7v8q5wCXo/6RWnlgOoGU4VlAVJ6LcK6vERnwBgvvGCZnE
	 U+wMGUAV5zr/A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD82217E0076;
	Sat, 11 Jul 2026 23:43:18 +0200 (CEST)
Message-ID: <29b98aee357ea1ff49939c47eaca3cb4a01c8d72.camel@collabora.com>
Subject: Re: [PATCH v15 01/12] media: mediatek: jpeg: fix jpeg cores'
 amounts setting
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Sat, 11 Jul 2026 17:43:16 -0400
In-Reply-To: <20260702072614.10373-2-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
	 <20260702072614.10373-2-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-SowlojmCUCUWFxgrmrfW"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_144325_595836_F15FD123 
X-CRM114-Status: GOOD (  18.86  )
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


--=-SowlojmCUCUWFxgrmrfW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 02 juillet 2026 =C3=A0 15:26 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> Different ICs have different amounts of cores,
> use a variable to set the cores' amounts.
>=20
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware"=
)
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0 | =
8 ++++----
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h=C2=A0=C2=A0 | =
2 ++
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 1 +
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 1 +
> =C2=A04 files changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec483081..1e014fd698ae 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1462,7 +1462,7 @@ static int mtk_jpegenc_get_hw(struct mtk_jpeg_ctx *=
ctx)
> =C2=A0	int i;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	for (i =3D 0; i < MTK_JPEGENC_HW_MAX; i++) {
> +	for (i =3D 0; i < jpeg->max_hw_count; i++) {
> =C2=A0		comp_jpeg =3D jpeg->enc_hw_dev[i];
> =C2=A0		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {
> =C2=A0			hw_id =3D i;
> @@ -1509,7 +1509,7 @@ static int mtk_jpegdec_get_hw(struct mtk_jpeg_ctx *=
ctx)
> =C2=A0	int i;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	for (i =3D 0; i < MTK_JPEGDEC_HW_MAX; i++) {
> +	for (i =3D 0; i < jpeg->max_hw_count; i++) {
> =C2=A0		comp_jpeg =3D jpeg->dec_hw_dev[i];
> =C2=A0		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {
> =C2=A0			hw_id =3D i;
> @@ -1592,7 +1592,7 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0		jpeg_work);
> =C2=A0	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =C2=A0
> -	for (i =3D 0; i < MTK_JPEGENC_HW_MAX; i++)
> +	for (i =3D 0; i < jpeg->max_hw_count; i++)
> =C2=A0		comp_jpeg[i] =3D jpeg->enc_hw_dev[i];
> =C2=A0	i =3D 0;
> =C2=A0
> @@ -1687,7 +1687,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0	struct mtk_jpeg_fb fb;
> =C2=A0	unsigned long flags;
> =C2=A0
> -	for (i =3D 0; i < MTK_JPEGDEC_HW_MAX; i++)
> +	for (i =3D 0; i < jpeg->max_hw_count; i++)
> =C2=A0		comp_jpeg[i] =3D jpeg->dec_hw_dev[i];
> =C2=A0	i =3D 0;
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 02ed0ed5b736..6be5cf30dea1 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -212,6 +212,7 @@ struct mtk_jpegdec_comp_dev {
> =C2=A0 * @reg_decbase:	jpg decode register base addr
> =C2=A0 * @dec_hw_dev:	jpg decode hardware device
> =C2=A0 * @hw_index:		jpg hw index
> + * @max_hw_count:	jpeg hw-core count
> =C2=A0 */
> =C2=A0struct mtk_jpeg_dev {
> =C2=A0	struct mutex		lock;
> @@ -234,6 +235,7 @@ struct mtk_jpeg_dev {
> =C2=A0	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
> =C2=A0	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
> =C2=A0	atomic_t hw_index;
> +	u32 max_hw_count;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 32372781daf5..4534caeb104f 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -664,6 +664,7 @@ static int mtk_jpegdec_hw_probe(struct platform_devic=
e *pdev)
> =C2=A0	master_dev->dec_hw_dev[i] =3D dev;
> =C2=A0	master_dev->reg_decbase[i] =3D dev->reg_base;
> =C2=A0	dev->master_dev =3D master_dev;
> +	master_dev->max_hw_count++;

Just one question, can the mtk_jpegenc_worker() starts before all cores hav=
e
been probed ?

Nicolas

> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index b6f5b2249f1f..2765dafab4ad 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -386,6 +386,7 @@ static int mtk_jpegenc_hw_probe(struct platform_devic=
e *pdev)
> =C2=A0	master_dev->enc_hw_dev[i] =3D dev;
> =C2=A0	master_dev->reg_encbase[i] =3D dev->reg_base;
> =C2=A0	dev->master_dev =3D master_dev;
> +	master_dev->max_hw_count++;
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);

--=-SowlojmCUCUWFxgrmrfW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalK49AAKCRDZQZRRKWBy
9HWWAQDDsuWnz7IVhMvOVrf9+q+gNoZaKZHoJS1aycgNmMVL6wEAnR9zNR4HqAgV
y7qMxsxMRmPkPjtDJs09kLp3SKauxAY=
=nWlY
-----END PGP SIGNATURE-----

--=-SowlojmCUCUWFxgrmrfW--

