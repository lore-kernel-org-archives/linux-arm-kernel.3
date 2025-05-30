Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E501C5B555
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 17:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CugiFgaF8cV3/dThOCPe5O8k9DqeJCQ4MP4Ml/URQdU=; b=FFyF24Px3Dj6ycckY3BfibH1CS
	CS+wHyPRFiokGT+Uk5QjvPb+wIuoSB1JbiPy67aEYNql6ycmkqZEnAsrI+gHLt6N5OsEAlWalyWk7
	xZQcXP/JncOnN7pa+kwXY3QKctQXmCKOmlKjbfSedVEmChoO6eQsJCja3eZPKjX4ALXrlAfDJZTwH
	eNwuaTHwqpvbJgMgF8QVtXc2rAgMSOH7aaJq8VOwYdTEnBfrXqiqRiN5U/K9GXVo5Wu1MDEn3LxcX
	YhU/8Ol/zPe9chrXkMjdKgbALFk5VstEvNaXYlJhOL5eXkvnd9tlcOcXyT+ZObyWxmA+Pn9Ob+gmN
	Ih+eD+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3sH-00000001SFV-2yCf;
	Fri, 30 May 2025 17:50:33 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3lR-00000001QnQ-0D04
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 17:43:30 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so173311885a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 10:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748627008; x=1749231808; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CugiFgaF8cV3/dThOCPe5O8k9DqeJCQ4MP4Ml/URQdU=;
        b=h9vB5aITQPZfL8jYadXsMee9Wm9va7Cm6uG9yM9MITw+K32XHBvjjarY225Kz/AS9+
         sre3wIVD+Uv+4QqgzJKBAhRvF++m/zGdmzgC7l2n3/X1Rxb+qj1arAmPVUz7fIB8rfy3
         eWDZdD3TwzVSJnRvxL2Evx06R7HButq1Gf52c0BOXdaljaKPMTEaA8lVODBWj5ibR1mG
         rG6jyNMcXk9J77AwOkXmZIx+SU4KZqDOREgxCvowRw54KKji5r64uYPmgYoWi0noI3KQ
         vkwrj8/gMuuYLnQ6F+MG4BoU31v+JLVeoX397Y2b4FFUzfXfu+XMeLsgDzocaAdNgznI
         XRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627008; x=1749231808;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CugiFgaF8cV3/dThOCPe5O8k9DqeJCQ4MP4Ml/URQdU=;
        b=I8LS3TViiIpaMqrEdqGnsVcJZlqCOxX2sQ3qsiIEipijMHo5pZ5E9Gmsk4EozPvrEK
         KFwgeZIY3qchoIPx3qZgET4R5WaUiPe43kDEnyW/naDot4kuQMBVDjB6QO4x8ueIEpht
         ajKlRE7UYBgGxrU+cNUjgH4DPaGqit2h1JGWiMURPWNpz6yGjrSjpHZe6ghk+k+b2ZfR
         stS2Xb1tLtPvUejdjM5Wn+TqjQlDFp4xYIPJRrdsGXuQgsnQ9CxC17Jj0PAkBAVfK8RC
         pbOr/GKt4hrE880JRFXGpXKxl1LbfGfPf7ozjJRk7GTHUPpgNldnWkfMGT0evbAVtYeQ
         xDZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYvU11CGJBSy7W7CNGZuk30DGxdcAxSJMTAfairoXzbbwA2BQdu8dCQ2lxyaF5l4LqVsqQR9KXb8WNQAYQDuIb@lists.infradead.org
X-Gm-Message-State: AOJu0YwUaaS+TiGiZdlV8e7hedrJ8zNtJ4fOQOPQHqTzoguKgf2bL4zv
	a7YtQZOaVu44ix+J/XBUfyy+8/npjQ188Bl+Tltqt66NJiEFdZUx2hU//l6JuoZBCL0=
X-Gm-Gg: ASbGnct2cjKcWLsdYho5Kvw0SYEplqmCexUX54+N1oocHNmUeqjWD3cyENj/DukXlZO
	bBTwtcjglxzOnFtEph3XQe2/iAQ2vKbSGrqL6mmU9vl8pUVpicF1xITFQtPUjrFTtVmaPWUH0VV
	/8y/E3m8CFvXW0duKx4q202Y6KRaoUt0St8r9oxcOdCpcBBFQSk1FG7zd0R1oR//9svOY/3xBBK
	uy5SMBKZLffraRAE8KqJDYmp1thS3Mxkxic4txSCpBV8RVMqSGMPFK58HEPQz+QWP6dfNIHfrTU
	4t6AURRp+RBAnhhQ88NoLJn9+4nhKINPKNx8MQEyjX/jbDrg7A7YxFQg
X-Google-Smtp-Source: AGHT+IEqVszFCVyM2GhwMbXsI8xtVBtEFkmw/qP0M9bEN5pAdb7NtRmnfyG1MEJy5baKQoLnMuV0cQ==
X-Received: by 2002:a05:620a:172a:b0:7ce:b782:8931 with SMTP id af79cd13be357-7d0a2387041mr603525985a.2.1748627007702;
        Fri, 30 May 2025 10:43:27 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0e3fdfsm268588685a.9.2025.05.30.10.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:43:27 -0700 (PDT)
Message-ID: <8ab1b3166cbb972dbd5984fa591b42dbf984fc3b.camel@ndufresne.ca>
Subject: Re: [PATCH v5 09/12] media: mediatek: jpeg: refactor multi-core clk
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
Cc: srv_heupstream@mediatek.com
Date: Fri, 30 May 2025 13:43:26 -0400
In-Reply-To: <20250530074537.26338-10-kyrie.wu@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
	 <20250530074537.26338-10-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_104329_092052_56E33C97 
X-CRM114-Status: GOOD (  21.48  )
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

Hi,

Le vendredi 30 mai 2025 =C3=A0 15:45 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> refactor jpeg clk suspend and resume setting for multi-core

You'll have to write a lot more to support such a large and I
must say slightly convoluted change. Why do you need a special
case for 1 core in the first place ? What about multi-core
design that support from 1 to N cores without using different
code path ?

Nicolas

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
> index 1d3df1230191..c1d2de92f125 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1126,6 +1126,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jp=
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
> @@ -1134,6 +1137,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jp=
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
> @@ -1677,13 +1683,6 @@ static void mtk_jpegenc_worker(struct work_struct =
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
> @@ -1798,20 +1797,13 @@ static void mtk_jpegdec_worker(struct work_struct=
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
> @@ -1821,7 +1813,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0				 &dst_buf->vb2_buf, &fb)) {
> =C2=A0		dev_err(jpeg->dev, "%s : %d, mtk_jpeg_set_dec_dst fail\n",
> =C2=A0			__func__, __LINE__);
> -		goto setdst_end;
> +		goto set_dst_fail;
> =C2=A0	}
> =C2=A0
> =C2=A0	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> @@ -1846,9 +1838,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
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
> index 2e6da8617484..db2afc5151ad 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -543,14 +543,13 @@ static void mtk_jpegdec_timeout_work(struct work_st=
ruct *work)
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
> @@ -592,12 +591,11 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int i=
rq, void *priv)
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
> @@ -703,15 +701,84 @@ static int mtk_jpegdec_hw_probe(struct platform_dev=
ice *pdev)
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
> +		dev_err(jpeg->dev, "%s : %d, jpegdec clk_prepare_enable fail\n",
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
> +	SET_RUNTIME_PM_OPS(mtk_jpegdec_pm_suspend, mtk_jpegdec_pm_resume, NULL)
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
> index ff73393a2417..27da2a9922a6 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -274,14 +274,13 @@ static void mtk_jpegenc_timeout_work(struct work_st=
ruct *work)
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
> =C2=A0	jpeg_buf_queue_dec(ctx);
> +	pm_runtime_put(cjpeg->dev);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> @@ -316,12 +315,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int i=
rq, void *priv)
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(jpeg);
> =C2=A0	jpeg_buf_queue_dec(ctx);
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
> @@ -425,15 +423,84 @@ static int mtk_jpegenc_hw_probe(struct platform_dev=
ice *pdev)
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
> +		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable fail\n",
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
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static __maybe_unused int mtk_jpegenc_pm_resume(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	mtk_jpeg_clk_on(jpeg);
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
> +	SET_RUNTIME_PM_OPS(mtk_jpegenc_pm_suspend, mtk_jpegenc_pm_resume, NULL)
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

