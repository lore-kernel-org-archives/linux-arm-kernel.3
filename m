Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579D0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRXTcWkp2R/zJYHIR6r6tJshee7QnSwisIQmpMltqMI=; b=rsPxMpCmZyqzv/LmluGuhMzT35
	ASOjiFkztD/iNwVQJWGu1lxE7SD/OMYO8vPEIHQl7kI4MjgfGWcWN9hI8OiUU9xR69b3usouGsiwu
	IONWiNY+ndse3aQ7GcMSHJQpx2hv1RsiMnjY94bW3vpbyuPvgksTmVab8i+zbuK2qMOinnlA1QSeO
	8nQtsqlVuODtBONDaIcZSGmU/Qgm5mfJOmh4++SOjPUQzdFUoI6sk4IyJgA3dLZ8Mi8UosWWNh316
	GW4QyFZknoeaDQM6ygYQeuF/6tZofSVKekdEYGXzzOsACEEo7wpMTU+jBBWyJHZKSdzDCbda20Ieg
	vgV1sGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMYm-0000000AJW7-3K65;
	Mon, 13 Jul 2026 19:43:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMYk-0000000AJVg-0lV5;
	Mon, 13 Jul 2026 19:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783971799;
	bh=ORKrp2apu4uI4yF4r9MjF5WOFCY4SwCjKAksybb1N14=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=oMQMsVqE8LhMKyC476GoOvqojvnCeyvjot7GnEcYmHu3lHE1y42Puh0RRcszwyXjI
	 uQF6oZLUZ62eZA5pZLZ2t1QwwmYyD4F0iZPwqehsIdQjOgcs0MpV4JUpkOMoaVs+cz
	 80Ju7NiVvQDlPrb2UNOcceeHE8o/Xx7IE+z/lxYUQ/06/+mjH/ujDN+cq6VK0C2I6d
	 qVGwwogfsvjhKtIxv7hSwFhlwSCNa6DUpHkooC0TGlsGZ8tw5ojDtQMZLZmiePBUyh
	 CylYPSQq9WgmDpsBEZlAcVqVFS2mCmVGKvdtVEgCUHLMHkA3vYrslgLPDxu9qvmPPG
	 s1PjmYJUBX0HA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 886FF17E07A2;
	Mon, 13 Jul 2026 21:43:16 +0200 (CEST)
Message-ID: <30e207833eb9ed55bf1fb924d9c5e8bb3302c2e6.camel@collabora.com>
Subject: Re: [PATCH v15 05/12] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Mon, 13 Jul 2026 15:43:14 -0400
In-Reply-To: <20260702072614.10373-6-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
	 <20260702072614.10373-6-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-MsJEsU/3g1tPPkLip8P2"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_124322_554411_6FEC5D1C 
X-CRM114-Status: GOOD (  24.35  )
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


--=-MsJEsU/3g1tPPkLip8P2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 02 juillet 2026 =C3=A0 15:26 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> The suspend/resume callback function is defined in the dev_pm_ops
> structure, which is defined in platform_driver. For multiple-core
> architecture, each hardware driver will register a platform_driver
> structure, so it is necessary to add a suspend/resume callback
> function for each hardware to support this operation.
>=20
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware"=
)
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 28 +=
++------
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0 | 62 +++++++++++=
++++++--
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0 | 60 +++++++++++=
+++++--
> =C2=A03 files changed, 121 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 76a5b49b7f43..89048aba8dca 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1115,6 +1115,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jp=
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
> @@ -1123,6 +1126,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jp=
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
> @@ -1647,13 +1653,6 @@ static void mtk_jpegenc_worker(struct work_struct =
*work)
> =C2=A0		goto enc_end;
> =C2=A0	}
> =C2=A0
> -	ret =3D clk_prepare_enable(comp_jpeg[hw_id]->venc_clk.clks->clk);
> -	if (ret) {
> -		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable fail\n",
> -			__func__, __LINE__);
> -		goto enc_end;
> -	}
> -
> =C2=A0	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0
> @@ -1750,20 +1749,13 @@ static void mtk_jpegdec_worker(struct work_struct=
 *work)
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
> -		dev_err(jpeg->dev, "%s : %d, jpegdec clk_prepare_enable fail\n",
> -			__func__, __LINE__);
> -		goto clk_end;
> -	}
> -
> =C2=A0	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0
> @@ -1773,7 +1765,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0				 &dst_buf->vb2_buf, &fb)) {
> =C2=A0		dev_err(jpeg->dev, "%s : %d, mtk_jpeg_set_dec_dst fail\n",
> =C2=A0			__func__, __LINE__);
> -		goto setdst_end;
> +		goto set_dst_fail;
> =C2=A0	}
> =C2=A0
> =C2=A0	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> @@ -1794,9 +1786,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
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
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 4534caeb104f..9a8dbca6af00 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -533,13 +533,12 @@ static void mtk_jpegdec_timeout_work(struct work_st=
ruct *work)
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> =C2=A0
> =C2=A0	mtk_jpeg_dec_reset(cjpeg->reg_base);
> -	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
> -	pm_runtime_put(cjpeg->dev);
> =C2=A0	cjpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> =C2=A0	atomic_inc(&master_jpeg->hw_rdy);
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegdec_put_buf(cjpeg);
> +	pm_runtime_put(cjpeg->dev);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
> @@ -547,7 +546,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq=
, void *priv)
> =C2=A0	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> =C2=A0	struct mtk_jpeg_src_buf *jpeg_src_buf;
> =C2=A0	enum vb2_buffer_state buf_state;
> -	struct mtk_jpeg_ctx *ctx;
> =C2=A0	u32 dec_irq_ret;
> =C2=A0	u32 irq_status;
> =C2=A0	int i;
> @@ -557,7 +555,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq=
, void *priv)
> =C2=A0
> =C2=A0	cancel_delayed_work(&jpeg->job_timeout_work);
> =C2=A0
> -	ctx =3D jpeg->hw_param.curr_ctx;
> =C2=A0	src_buf =3D jpeg->hw_param.src_buffer;
> =C2=A0	dst_buf =3D jpeg->hw_param.dst_buffer;
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> @@ -580,12 +577,11 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int i=
rq, void *priv)
> =C2=A0	buf_state =3D VB2_BUF_STATE_DONE;
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegdec_put_buf(jpeg);
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
> @@ -668,15 +664,69 @@ static int mtk_jpegdec_hw_probe(struct platform_dev=
ice *pdev)
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_clk_bulk_get(dev->dev,
> +				jpegdec_clk->clk_num,
> +				jpegdec_clk->clks);

clk_num and clks have been set by a call to devm_clk_bulk_get_all() few lin=
es
above. So this seem both redundant, and possibly take one too many referenc=
e on
the clock.

> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to init clk\n");
> +		return ret;
> +	}
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int mtk_jpegdec_pm_suspend(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(jpeg->jdec_clk.clk_num,
> +				=C2=A0=C2=A0 jpeg->jdec_clk.clks);
> +
> +	return 0;
> +}
> +
> +static int mtk_jpegdec_pm_resume(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(jpeg->jdec_clk.clk_num,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jpeg->jdec_clk.clks);
> +}
> +
> +static int mtk_jpegdec_suspend(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int mtk_jpegdec_resume(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_jpegdec_pm_ops =3D {
> +	SYSTEM_SLEEP_PM_OPS(mtk_jpegdec_suspend, mtk_jpegdec_resume)
> +	RUNTIME_PM_OPS(mtk_jpegdec_pm_suspend, mtk_jpegdec_pm_resume, NULL)
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
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 2765dafab4ad..5d1c217fea0f 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -264,13 +264,12 @@ static void mtk_jpegenc_timeout_work(struct work_st=
ruct *work)
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> =C2=A0
> =C2=A0	mtk_jpeg_enc_reset(cjpeg->reg_base);
> -	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
> -	pm_runtime_put(cjpeg->dev);
> =C2=A0	cjpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> =C2=A0	atomic_inc(&master_jpeg->hw_rdy);
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(cjpeg);
> +	pm_runtime_put(cjpeg->dev);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> @@ -304,12 +303,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int i=
rq, void *priv)
> =C2=A0	buf_state =3D VB2_BUF_STATE_DONE;
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(jpeg);
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
> @@ -390,15 +388,69 @@ static int mtk_jpegenc_hw_probe(struct platform_dev=
ice *pdev)
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_clk_bulk_get(dev->dev,
> +				jpegenc_clk->clk_num,
> +				jpegenc_clk->clks);

Same.

> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to init clk\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_jpegenc_pm_suspend(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(jpeg->venc_clk.clk_num,
> +				=C2=A0=C2=A0 jpeg->venc_clk.clks);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int mtk_jpegenc_pm_resume(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(jpeg->venc_clk.clk_num,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jpeg->venc_clk.clks);
> +}
> +
> +static int mtk_jpegenc_suspend(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int mtk_jpegenc_resume(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_jpegenc_pm_ops =3D {
> +	SYSTEM_SLEEP_PM_OPS(mtk_jpegenc_suspend, mtk_jpegenc_resume)
> +	RUNTIME_PM_OPS(mtk_jpegenc_pm_suspend, mtk_jpegenc_pm_resume, NULL)
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

Nicolas

--=-MsJEsU/3g1tPPkLip8P2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalU/0gAKCRDZQZRRKWBy
9FSSAQCKCUjM+JlpkKmot4q1SiwPxzw55mwNt61fkiPPhdo6DgEAyWp1h/38fon9
X+MwCSNNkNWGGooneIgGf5vD1Tf2gwI=
=58nN
-----END PGP SIGNATURE-----

--=-MsJEsU/3g1tPPkLip8P2--

