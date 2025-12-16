Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0D9D637B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 20:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NI+fFEGZEuQSR+8e8anlQQzkl/ir4KKuZpATc87A3Nc=; b=LHGrMkNg5moMoqctymXVxVaCu7
	SDUV7UG1kPur0Eb4wWtYX3V6n1fGDWSbYF769+DcRb9vxMf5Ztwa8/ZOULX83jgPK3rc67KiS681o
	2i3JHdRtM930C0EgcjJAUK3aYXqteUsKxDJRB3IVNRSSacIa6XmZW+fQCfA6mpKsNeWsRpFUPXunm
	kPXRipF9eHeQJgNtvE/6D4lQOIpJh3ub+UfKLEJMUJOcKHRk0t1JVwIcVL4vvYYabVAnxJMtrCcHS
	IUaZabiJchkHv75tGXaTWvGjEyuUcdQt8Fue4y0I8XJFO3qTq17Hq4/q8zI2tdEASwJoVsKrgJA0y
	8X7vqQew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVc6w-00000005oaI-2RNQ;
	Tue, 16 Dec 2025 20:57:34 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVc6u-00000005oZC-10ZO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 20:57:33 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-88a2e3bd3cdso36470016d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 12:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765918650; x=1766523450; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NI+fFEGZEuQSR+8e8anlQQzkl/ir4KKuZpATc87A3Nc=;
        b=cm99O4tvr0hxmdB2pSm/tLYOAlm4ZK5dv5Up4cXf5kIyFF+GrYe926XTrZq0+7n7Vb
         mrjEM/cwrBghmVyD6t8mZ/25DmTo0hnj/pSoLWEtlDYYMnUvRARnCTAA8KsX3LQQkvM6
         mIpngM/12yTxL4g25QsIvmfLg3v2DKjI6jQsFRyKiSVz9zex8muBzcMvWgXX+WPKCOcY
         1wElLirKRjx3kqfkDHZRNl8ooLpZJrkFSeJPXCbcpXJ04h+w+/5dyyN8Gt9U3hHHC9W/
         TExsFJJmaRKywLJPP5J6EyMkXbYqy3wy6wXTn7si4JhyM31k72DDMyWQN2Ems0pa0fJ1
         b1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765918650; x=1766523450;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NI+fFEGZEuQSR+8e8anlQQzkl/ir4KKuZpATc87A3Nc=;
        b=Jx0cfy8n1mJG0TIvq6BYN0R6HWvxeZu2GUWADLEyySiJPXaGncsnLGap2vibQQUNvW
         JbLucHIYbbmcfMbhE3ENNND3bG6gbxzOw2K7Xnk5aCNjh4qJwsA9BqVtGObPgKDri7MM
         CzNEgqsM/TQfJIH3f7P8QQeZZ/w3FPepcghriPtoFoL8NmnsqjxN0wV4w23WLM5bXOz5
         aZ2lXRcPWF8FlHnZfdQZcBg6CZ35fGUomsLLtmm1AbT3kY0hg628G5nW4Srr7neiSPre
         /xcyNwNovXkJs1sb51XkoHDgy/eZ7FqHvFCoH1PQajb2wlCYhbetLivNCEf6Uo24v7aX
         Xvjw==
X-Forwarded-Encrypted: i=1; AJvYcCVZKL4zelovfsRbTZ9QaJc5+FWYGEW8c+YnGH+tZNJsLU5qGUcIGOdc/VqPIZnvMuzi47SZuwrakM32T0td1zKO@lists.infradead.org
X-Gm-Message-State: AOJu0YwLjvDQmRh8wLbfnJrXn/VRZPMBXfOV+GtfOivak9sNm93mxwLD
	9hVn7oBbvqeb/430EwrNZGlzMQeP8eQGyk/JT0evr+acRCsN5113ftrWylE2CBHMh6I=
X-Gm-Gg: AY/fxX6Yc+oPmuUYIjwD2jAtAEawywL3rkVOuiSCgRqjr1uF3Y4Mdk2QhqehZcI0Dx/
	TONuQvtfX70ZKUvJ4zv5beQMWCG5cU1mXyAcEtagOiUzX2P/wbVo6f5SLkvBL23UjD/vKnff9mT
	VZXDyfFfqchjdQFXLjGj643NT7LYARSUprM6qkngxjYrxzqlRBPs+V/wZ58soZ80pw2av12VljY
	QoAO+eJt8yv90OW0VI24LOBhEUFETarhivXkGtRr3OwOCPEYyUFDfSrhZYAJ/EWBsBKjxUCOWuP
	cF55ORiugIsfK0BrRDbiIhrxj/2qH793i5xHbch8n0aRkSa2KkVCl/qeFZTRnhlIcr9vrSwrAwr
	+rqADbsJwOkwVne43NS5C9YQG5VJIWmEJPkuo1yX2LhCRGhxXZD6x22K8K7Ne9APQtItp/28oM+
	J/S58zhnhvJOXSvgNb/nsz8b5ruls=
X-Google-Smtp-Source: AGHT+IFebuDiAx1fQCJ1bJ+HCUvcn2MaYOSV8hypD23tenWABYQbV3BpMm8itf3ay4PR1vwFnMW/dA==
X-Received: by 2002:a05:6214:328c:b0:882:36d6:e5c1 with SMTP id 6a1803df08f44-8887f30ac93mr209640086d6.29.1765918650452;
        Tue, 16 Dec 2025 12:57:30 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88993b4204asm81707196d6.7.2025.12.16.12.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 12:57:29 -0800 (PST)
Message-ID: <cd4c9c6f89d2ad506113745f4273ff6e6b65c75a.camel@ndufresne.ca>
Subject: Re: [PATCH v11 01/12] media: mediatek: jpeg: fix jpeg hw count
 setting
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 15:57:27 -0500
In-Reply-To: <20251202094800.6140-2-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-2-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-aSUcQgXs1+0RJXU1/VOk"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_125732_584304_784A7140 
X-CRM114-Status: GOOD (  21.98  )
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


--=-aSUcQgXs1+0RJXU1/VOk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> Different ICs have different amounts of hardware,
> use a variable to set the amount of hardware.

Did you mean different amount of cores ? The use of "hardware" is strange i=
n
this description.

>=20
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware"=
)

Its not clear from your description if this is in preparation of MT8196 or =
an
actual fix. If its in preparation of, drop this, if it fixes some existing =
SoC,
please tell use which one. And tell us how it breaks without this fix.

regards,
Nicolas

>=20
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
> index 6268d651bdcf..6a7e01130f1c 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1467,7 +1467,7 @@ static int mtk_jpegenc_get_hw(struct mtk_jpeg_ctx *=
ctx)
> =C2=A0	int i;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	for (i =3D 0; i < MTK_JPEGENC_HW_MAX; i++) {
> +	for (i =3D 0; i < jpeg->max_hw_count; i++) {
> =C2=A0		comp_jpeg =3D jpeg->enc_hw_dev[i];
> =C2=A0		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {
> =C2=A0			hw_id =3D i;
> @@ -1514,7 +1514,7 @@ static int mtk_jpegdec_get_hw(struct mtk_jpeg_ctx *=
ctx)
> =C2=A0	int i;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	for (i =3D 0; i < MTK_JPEGDEC_HW_MAX; i++) {
> +	for (i =3D 0; i < jpeg->max_hw_count; i++) {
> =C2=A0		comp_jpeg =3D jpeg->dec_hw_dev[i];
> =C2=A0		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {
> =C2=A0			hw_id =3D i;
> @@ -1597,7 +1597,7 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0		jpeg_work);
> =C2=A0	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =C2=A0
> -	for (i =3D 0; i < MTK_JPEGENC_HW_MAX; i++)
> +	for (i =3D 0; i < jpeg->max_hw_count; i++)
> =C2=A0		comp_jpeg[i] =3D jpeg->enc_hw_dev[i];
> =C2=A0	i =3D 0;
> =C2=A0
> @@ -1692,7 +1692,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
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
> index e78e1d11093c..a1e54715cb7e 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -664,6 +664,7 @@ static int mtk_jpegdec_hw_probe(struct platform_devic=
e *pdev)
> =C2=A0	master_dev->dec_hw_dev[i] =3D dev;
> =C2=A0	master_dev->reg_decbase[i] =3D dev->reg_base;
> =C2=A0	dev->master_dev =3D master_dev;
> +	master_dev->max_hw_count++;
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 9ab27aee302a..28d05909c96f 100644
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

--=-aSUcQgXs1+0RJXU1/VOk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHHtwAKCRDZQZRRKWBy
9NdGAP4tOcZwNQQTymlNx94MWUKA4PjZ+mQqLOMHCXr7idoEXAD4zKTg2quujgCl
TfD03rQO+Y+ho+zj5A3QHmGFpNjmCg==
=sWoq
-----END PGP SIGNATURE-----

--=-aSUcQgXs1+0RJXU1/VOk--

