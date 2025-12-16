Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C58D637B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 21:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoMj7O3JBlKlWKdRq9AgScEk4RkEXLQmYydIZMtYwXk=; b=p4GXkTBgn5/PHidkqVAKsjluBn
	Pd1iYZri+NqP/sBrNsLs/HM/FCZ0caR3BRy6HbE8r1aEgShQM/0uM2ur6XgC0EJlJlrRAh7pHStjK
	cBJsD+WAVyeLDnONi5uKN1+zUM7ZLUilr7XzW629gbP4ZsWBbTK1FKjw5E3c72iN3OQ5liM+ioxZn
	xOE0JdfIu/2XB7n9unE56DyMLKyckIuDx6E+dgRRY202FZGX2zaijTtrFzzh2lsdARapp2BwwF0PX
	Ac+PUMe+VXcNI/aOAZcqHqt7Nr6JgxzrPhtPhrrhdAPgSJjJgborm+YK0MlNjerFSJR5nrLP0jJM9
	hj4ATCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcgH-00000005qVW-0rrl;
	Tue, 16 Dec 2025 21:34:05 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcgE-00000005qUn-2ICR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 21:34:03 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4f1ab2ea5c1so63998841cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765920841; x=1766525641; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yoMj7O3JBlKlWKdRq9AgScEk4RkEXLQmYydIZMtYwXk=;
        b=MbTUq6X+ZvOqKgn/+LX/r0zas7Zdn0oMu+37sDB7F5kNJ8VTdaakaMjhxqtMam5nuB
         NW6d+R99/x6EhoqtHcHXTA9SS+YYpgI/MYqiHDYwOUIEnryRmsgcQMdwCUpcMsCsdy1V
         bcok//PG3TPg0JSsCt0jvoW2zyvhUSBCmSA2z3RgEfyXFsSi5oaCVWmta02e3hhdhjke
         jJf9XgdPQQeeFmt2vweky2gOIKoTlEnADVdT6+T+MhiADd7L7T3rnNwC0BGgBtgUMFG+
         pA8zRFtt3khle0m//esUBsP0IfemdcSsMEjz4lWHFqXnC+FmoIqDcjHirdK6nsJnRNjh
         +jXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765920841; x=1766525641;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yoMj7O3JBlKlWKdRq9AgScEk4RkEXLQmYydIZMtYwXk=;
        b=W3r9SBRASTx8J8/6Dr60Fp8wVULaap8dP/EA4qvzKvXwkFA+6rnwEhmP+x3rEsvh7p
         gd79c1bSaVuiG62nH9pnU3bzQbctdzpu2PW7Ev9czakdqFWp53Sl1ahanv+0uMFMWJ7W
         c4705FcbP2b3GP0tg5HU4BmH2+31J8/zjiLJBFHF1aMptm8s/gIFXnHBS0Qg3D3fcKGU
         q6Zt5s50jtKF58L1tf+8jZjN3krQKK7a0fLHTgItgKWkEJwMkyFts3I5B7RSSp7p4uXp
         dIF0jfOuG1bLNTtMfct/qtOj1efrwVFCBsfeQTiCiCuOLsrVB4+2YCsnkeSuz2/TS7qK
         pWjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXYlfSFbnwlnZCeFmS98XHlARDq2+aRbnXXPWTFlOPUDsQTStBuaz6kNiPbOpb/sKuQwC2HsQt0fhrr/Wam3+s@lists.infradead.org
X-Gm-Message-State: AOJu0YxfKD750rzW3+9GVyFHwiAfuxX1vXR4MQDkeecxdzos9RlDKtoH
	8VWeU2FrWNOighsxjbsmsu9TTdV3pf7OupfpAIx66D11KUAeSxWLLrk5h0zyRgwiaO8=
X-Gm-Gg: AY/fxX5X1yhmqSqjFqbw1XQzFfv5bONkGa+hxUOVyD+8y4y7uVFMrzlg0ZJ6Bt7j5MM
	l3wBU54M/5VHk/nlr6OsW+t+/CU9TiSnPiqvWzHDWkQxetWTBBZ9iwsquAF8N+T9XP4JyZV6WXM
	S2w6sSH9HPydwxzvWW5q0S16a6yJ9mTZb52A0nmNi4wH0KvsliXcT8T9r0TUjmO60gx+j1CuPmd
	+WBFLVfxCbjCRkSiktnNf1t4f9XndSI5PsMlNGNTU/ICD7Ip8CHKdnFAy+KoRx18mqsBjGIYZyI
	1LjA0RSGX5TGiMOQCNmZT+LQVpi86EVl6XsmrdxqCDl27N54o9914q12FWD2MulaiHKTq+zrQDB
	EEqNVd7jqYC3sjJJWRUU0uOsQFE2IwyAA3gsatuYeRLhWwEU1ShO2e/f3dXOdGCXE3aLmUG7Xm+
	9ih1EloPHT569USM2n
X-Google-Smtp-Source: AGHT+IGciMkKjXhgprAQmCJa8+hd28WD47/DyfWfd2h7PM9Qu46ygLljR/8O6j8oRkaWmFRCqgVd4A==
X-Received: by 2002:a05:622a:4d98:b0:4ed:b25e:a721 with SMTP id d75a77b69052e-4f1d0630b4dmr230302261cf.78.1765920841064;
        Tue, 16 Dec 2025 13:34:01 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f345c31460sm23501851cf.17.2025.12.16.13.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:34:00 -0800 (PST)
Message-ID: <8f985a1b2add6fbcba354a0a3d330447380a6ccb.camel@ndufresne.ca>
Subject: Re: [PATCH v11 05/12] media: mediatek: jpeg: fix multi-core clk
 suspend and resume setting
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:33:59 -0500
In-Reply-To: <20251202094800.6140-6-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-6-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-PGLe9i9hAw1478RVGiJk"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_133402_652195_183C09E4 
X-CRM114-Status: GOOD (  24.20  )
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


--=-PGLe9i9hAw1478RVGiJk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> The suspend/resume callback function is defined in the dev_pm_ops
> structure, which is defined in platform_driver. For multiple-core
> architecture, each hardware driver will register a platform_driver
> structure, so it is necessary to add a suspend/resume callback
> function for each hardware to support this operation.
>=20
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware"=
)
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 28 +=
++----
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0 | 75 +++++++++++=
+++++++-
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0 | 75 +++++++++++=
+++++++-
> =C2=A03 files changed, 151 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 59fd79c89f88..e45d7e82b8a0 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1122,6 +1122,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jp=
eg)
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> +	if (jpeg->variant->multi_core)
> +		return;
> +
> =C2=A0	ret =3D clk_bulk_prepare_enable(jpeg->variant->num_clks,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jpeg->variant->clks);
> =C2=A0	if (ret)
> @@ -1130,6 +1133,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jp=
eg)
> =C2=A0
> =C2=A0static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
> =C2=A0{
> +	if (jpeg->variant->multi_core)
> +		return;
> +
> =C2=A0	clk_bulk_disable_unprepare(jpeg->variant->num_clks,
> =C2=A0				=C2=A0=C2=A0 jpeg->variant->clks);
> =C2=A0}
> @@ -1658,13 +1664,6 @@ static void mtk_jpegenc_worker(struct work_struct
> *work)
> =C2=A0		goto enc_end;
> =C2=A0	}
> =C2=A0
> -	ret =3D clk_prepare_enable(comp_jpeg[hw_id]->venc_clk.clks->clk);
> -	if (ret) {
> -		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable
> fail\n",
> -			__func__, __LINE__);
> -		goto enc_end;
> -	}
> -
> =C2=A0	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0
> @@ -1762,20 +1761,13 @@ static void mtk_jpegdec_worker(struct work_struct
> *work)
> =C2=A0	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =C2=A0
> =C2=A0	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> -	ret =3D pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
> +	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
> =C2=A0	if (ret < 0) {
> =C2=A0		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail !!!\n",
> =C2=A0			__func__, __LINE__);
> =C2=A0		goto dec_end;
> =C2=A0	}
> =C2=A0
> -	ret =3D clk_prepare_enable(comp_jpeg[hw_id]->jdec_clk.clks->clk);
> -	if (ret) {
> -		dev_err(jpeg->dev, "%s : %d, jpegdec clk_prepare_enable
> fail\n",
> -			__func__, __LINE__);
> -		goto clk_end;
> -	}
> -
> =C2=A0	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0
> @@ -1785,7 +1777,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0				 &dst_buf->vb2_buf, &fb)) {
> =C2=A0		dev_err(jpeg->dev, "%s : %d, mtk_jpeg_set_dec_dst fail\n",
> =C2=A0			__func__, __LINE__);
> -		goto setdst_end;
> +		goto set_dst_fail;
> =C2=A0	}
> =C2=A0
> =C2=A0	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> @@ -1807,9 +1799,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0
> =C2=A0	return;
> =C2=A0
> -setdst_end:
> -	clk_disable_unprepare(comp_jpeg[hw_id]->jdec_clk.clks->clk);
> -clk_end:
> +set_dst_fail:
> =C2=A0	pm_runtime_put(comp_jpeg[hw_id]->dev);
> =C2=A0dec_end:
> =C2=A0	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 84d12eea35f7..5f1557dafad6 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -540,14 +540,13 @@ static void mtk_jpegdec_timeout_work(struct work_st=
ruct
> *work)
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> =C2=A0
> =C2=A0	mtk_jpeg_dec_reset(cjpeg->reg_base);
> -	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
> -	pm_runtime_put(cjpeg->dev);
> =C2=A0	cjpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> =C2=A0	atomic_inc(&master_jpeg->hw_rdy);
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegdec_put_buf(cjpeg);
> =C2=A0	jpeg_buf_queue_dec(ctx);
> +	pm_runtime_put(cjpeg->dev);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
> @@ -589,12 +588,11 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int i=
rq,
> void *priv)
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegdec_put_buf(jpeg);
> =C2=A0	jpeg_buf_queue_dec(ctx);
> -	pm_runtime_put(ctx->jpeg->dev);
> -	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
> =C2=A0
> =C2=A0	jpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	atomic_inc(&master_jpeg->hw_rdy);
> +	pm_runtime_put(jpeg->dev);
> =C2=A0
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> @@ -677,15 +675,84 @@ static int mtk_jpegdec_hw_probe(struct platform_dev=
ice
> *pdev)
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_clk_bulk_get(dev->dev,
> +				jpegdec_clk->clk_num,
> +				jpegdec_clk->clks);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to init clk\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mtk_jpeg_clk_on(struct mtk_jpegdec_comp_dev *jpeg)
> +{
> +	int ret;
> +
> +	ret =3D clk_bulk_prepare_enable(jpeg->jdec_clk.clk_num,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jpeg->jdec_clk.clks);
> +	if (ret)
> +		dev_err(jpeg->dev, "%s : %d, jpegdec clk_prepare_enable
> fail\n",
> +			__func__, __LINE__);
> +}
> +
> +static void mtk_jpeg_clk_off(struct mtk_jpegdec_comp_dev *jpeg)
> +{
> +	clk_bulk_disable_unprepare(jpeg->jdec_clk.clk_num,
> +				=C2=A0=C2=A0 jpeg->jdec_clk.clks);
> +}
> +
> +static __maybe_unused int mtk_jpegdec_pm_suspend(struct device *dev)

Its used its passed to mtk_jpegdec_pm_ops structure. Same below. Unless you=
 had
the intention to ifdef that structure and you forgot.

> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	mtk_jpeg_clk_off(jpeg);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static __maybe_unused int mtk_jpegdec_pm_resume(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	mtk_jpeg_clk_on(jpeg);
> +
> +	return 0;
> +}
> +
> +static __maybe_unused int mtk_jpegdec_suspend(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static __maybe_unused int mtk_jpegdec_resume(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops mtk_jpegdec_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(mtk_jpegdec_suspend, mtk_jpegdec_resume)
> +	SET_RUNTIME_PM_OPS(mtk_jpegdec_pm_suspend, mtk_jpegdec_pm_resume,
> NULL)
> +};
> +
> =C2=A0static struct platform_driver mtk_jpegdec_hw_driver =3D {
> =C2=A0	.probe =3D mtk_jpegdec_hw_probe,
> =C2=A0	.driver =3D {
> =C2=A0		.name =3D "mtk-jpegdec-hw",
> =C2=A0		.of_match_table =3D mtk_jpegdec_hw_ids,
> +		.pm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D &mtk_jpegdec_pm_ops,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 1862444f35f5..785db5ba4770 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -271,14 +271,13 @@ static void mtk_jpegenc_timeout_work(struct work_st=
ruct
> *work)
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> =C2=A0
> =C2=A0	mtk_jpeg_enc_reset(cjpeg->reg_base);
> -	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
> -	pm_runtime_put(cjpeg->dev);
> =C2=A0	cjpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> =C2=A0	atomic_inc(&master_jpeg->hw_rdy);
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(cjpeg);
> =C2=A0	jpeg_buf_queue_enc(ctx);
> +	pm_runtime_put(cjpeg->dev);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> @@ -313,12 +312,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int i=
rq,
> void *priv)
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(jpeg);
> =C2=A0	jpeg_buf_queue_enc(ctx);
> -	pm_runtime_put(ctx->jpeg->dev);
> -	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
> =C2=A0
> =C2=A0	jpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	atomic_inc(&master_jpeg->hw_rdy);
> +	pm_runtime_put(jpeg->dev);
> =C2=A0
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> @@ -399,15 +397,84 @@ static int mtk_jpegenc_hw_probe(struct platform_dev=
ice
> *pdev)
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_clk_bulk_get(dev->dev,
> +				jpegenc_clk->clk_num,
> +				jpegenc_clk->clks);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to init clk\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mtk_jpeg_clk_on(struct mtk_jpegenc_comp_dev *jpeg)
> +{
> +	int ret;
> +
> +	ret =3D clk_bulk_prepare_enable(jpeg->venc_clk.clk_num,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jpeg->venc_clk.clks);
> +	if (ret)
> +		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable
> fail\n",
> +			__func__, __LINE__);
> +}
> +
> +static void mtk_jpeg_clk_off(struct mtk_jpegenc_comp_dev *jpeg)
> +{
> +	clk_bulk_disable_unprepare(jpeg->venc_clk.clk_num,
> +				=C2=A0=C2=A0 jpeg->venc_clk.clks);
> +}
> +
> +static __maybe_unused int mtk_jpegenc_pm_suspend(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	mtk_jpeg_clk_off(jpeg);

This is the only call to that function, move the code here.

> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static __maybe_unused int mtk_jpegenc_pm_resume(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	mtk_jpeg_clk_on(jpeg);

This is the only call to that function, move the code here. Decides if the =
ret
value should be passed or not too, add a comment if not.

Its worrying not too, since usually if the clock are not running, we risk
hanging the CPU writing to registers.

> +
> +	return 0;
> +}
> +
> +static __maybe_unused int mtk_jpegenc_suspend(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static __maybe_unused int mtk_jpegenc_resume(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops mtk_jpegenc_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(mtk_jpegenc_suspend, mtk_jpegenc_resume)
> +	SET_RUNTIME_PM_OPS(mtk_jpegenc_pm_suspend, mtk_jpegenc_pm_resume,
> NULL)
> +};
> +
> =C2=A0static struct platform_driver mtk_jpegenc_hw_driver =3D {
> =C2=A0	.probe =3D mtk_jpegenc_hw_probe,
> =C2=A0	.driver =3D {
> =C2=A0		.name =3D "mtk-jpegenc-hw",
> =C2=A0		.of_match_table =3D mtk_jpegenc_drv_ids,
> +		.pm =3D &mtk_jpegenc_pm_ops,
> =C2=A0	},
> =C2=A0};
> =C2=A0

Looks like the right way though,looking forward an update.

Nicolas

--=-PGLe9i9hAw1478RVGiJk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHQRwAKCRDZQZRRKWBy
9BzFAQCRlmwKSJ3LHJANyH5FKarZdW91H3WPUx26AqkqlPJTwgEA37oenqoP550F
u67JsH0+OTBoRQlh3aeaZ/J692kRBww=
=3uNs
-----END PGP SIGNATURE-----

--=-PGLe9i9hAw1478RVGiJk--

