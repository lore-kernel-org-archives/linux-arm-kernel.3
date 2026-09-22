Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CD5C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yt8ieiinKfug5u2SJJoPuvDw8CK+6jqbQq45dSO26eU=; b=L5s9eULe/mwRo5sfDKV932iFBO
	74Ln5fiEexukXNdVBapqgPb3rRP6yoT2Bfet9YLOd3sitJJ7MIkKOtKX2rVvztVUVzrTfFGE0PMxd
	AJuj9ha244WSwoFuuvk/QHQEfL+Xk9m2u88qrz3YC9HGbsZWAWJ3blFruOB2NOTuRslr2mPhTFYU4
	O4UuP20VQSvS+zXKdFl9iQBjdyc+UrHo3A0w/8ukKM0P+LHphWg1fwqagnyAiSFHzPBbIBpWeMXnr
	ucGNFedbqd4XYgJW/r3fBlIksfLpguoJNhvCzdT9fuBAFyQnAyitZ9Ut4cSPfSuIcoH+eSy17ONGh
	PIrskr5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yr0-00000005CBB-3bFU;
	Tue, 22 Sep 2026 11:40:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yqu-00000005C5S-0rdz;
	Tue, 22 Sep 2026 11:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077198;
	bh=jU0zivh/mWkMF+ZUOXtIeerMJHXs/5HODo04g72cDis=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=RywuT+5WXwDhxSWe6NYpXkLtjgVrhB1MFQC4nPw/itrqeqndtcWNCpB0vbAID6dTB
	 XMlEIkhyJNZdPjz/MQ6q1v0XfLQjNO0a46gUnvHP421piHrfID8tz1t//GhgZpuBcR
	 r/eijk/O+le7/iJiqPL3nTunrzIurPYk6E00fWmhzAk2XyMWaKYpuLgYdNPBOdqAjT
	 g634sRC7RCJtZM60KFT54n3RjMjoNmXoJ+neDLONxdL79l4toMSU1I4wEH3D/ls0Mx
	 KEXQ735/FhsjYqZhrDG1MGwDX19MmT6TpuHjT4+vUTOpXCJmZwNmzSSvMQUMNT3pV0
	 zc/85o1BibmqA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9551217E0DF0;
	Tue, 22 Sep 2026 13:39:57 +0200 (CEST)
Message-ID: <8df54405-811e-47ac-94a2-7cf0873c066a@collabora.com>
Date: Tue, 22 Sep 2026 13:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 05/12] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
To: Kyrie Wu <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-6-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_044000_408164_08B3AD1E 
X-CRM114-Status: GOOD (  25.78  )
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

On 9/22/26 11:15, Kyrie Wu wrote:
> The suspend/resume callback function is defined in the dev_pm_ops
> structure, which is defined in platform_driver. For multiple-core
> architecture, each hardware driver will register a platform_driver
> structure, so it is necessary to add a suspend/resume callback
> function for each hardware to support this operation.
> 
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>   .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 28 +++-------
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 55 +++++++++++++++++--
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 53 ++++++++++++++++--
>   3 files changed, 107 insertions(+), 29 deletions(-)
> 

..snip..

> @@ -673,11 +669,58 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static int mtk_jpegdec_pm_suspend(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(jpeg->jdec_clk.clk_num,
> +				   jpeg->jdec_clk.clks);
> +
> +	return 0;
> +}
> +
> +static int mtk_jpegdec_pm_resume(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(jpeg->jdec_clk.clk_num,
> +				       jpeg->jdec_clk.clks);
> +}
> +
> +static int mtk_jpegdec_suspend(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
> +
> +	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
> +
> +	return pm_runtime_force_suspend(dev);

Uhm, are you validating that the JPEG decoder IP is actually idle, or that
the job actually stopped, before forcing clk-off suspend?

I don't see that done anywhere... am I missing anything?

Also, can't we unify single and multicore suspend strategies?
That'd be nice for maintainability.

Cheers,
Angelo

> +}
> +
> +static int mtk_jpegdec_resume(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_jpegdec_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(mtk_jpegdec_suspend, mtk_jpegdec_resume)
> +	RUNTIME_PM_OPS(mtk_jpegdec_pm_suspend, mtk_jpegdec_pm_resume, NULL)
> +};
> +
>   static struct platform_driver mtk_jpegdec_hw_driver = {
>   	.probe = mtk_jpegdec_hw_probe,
>   	.driver = {
>   		.name = "mtk-jpegdec-hw",
>   		.of_match_table = mtk_jpegdec_hw_ids,
> +		.pm             = &mtk_jpegdec_pm_ops,
>   	},
>   };
>   
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 44a064dc7..4a8559c35 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -263,13 +263,12 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
>   	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   
>   	mtk_jpeg_enc_reset(cjpeg->reg_base);
> -	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
> -	pm_runtime_put(cjpeg->dev);
>   	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
>   	atomic_inc(&master_jpeg->hw_rdy);
>   	wake_up(&master_jpeg->hw_wq);
>   	v4l2_m2m_buf_done(src_buf, buf_state);
>   	mtk_jpegenc_put_buf(cjpeg);
> +	pm_runtime_put(cjpeg->dev);
>   }
>   
>   static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> @@ -303,12 +302,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
>   	buf_state = VB2_BUF_STATE_DONE;
>   	v4l2_m2m_buf_done(src_buf, buf_state);
>   	mtk_jpegenc_put_buf(jpeg);
> -	pm_runtime_put(ctx->jpeg->dev);
> -	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
>   
>   	jpeg->hw_state = MTK_JPEG_HW_IDLE;
>   	wake_up(&master_jpeg->hw_wq);
>   	atomic_inc(&master_jpeg->hw_rdy);
> +	pm_runtime_put(jpeg->dev);
>   
>   	return IRQ_HANDLED;
>   }
> @@ -394,11 +392,58 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static int mtk_jpegenc_pm_suspend(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(jpeg->venc_clk.clk_num,
> +				   jpeg->venc_clk.clks);
> +
> +	return 0;
> +}
> +
> +static int mtk_jpegenc_pm_resume(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(jpeg->venc_clk.clk_num,
> +				       jpeg->venc_clk.clks);
> +}
> +
> +static int mtk_jpegenc_suspend(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
> +
> +	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int mtk_jpegenc_resume(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_jpegenc_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(mtk_jpegenc_suspend, mtk_jpegenc_resume)
> +	RUNTIME_PM_OPS(mtk_jpegenc_pm_suspend, mtk_jpegenc_pm_resume, NULL)
> +};
> +
>   static struct platform_driver mtk_jpegenc_hw_driver = {
>   	.probe = mtk_jpegenc_hw_probe,
>   	.driver = {
>   		.name = "mtk-jpegenc-hw",
>   		.of_match_table = mtk_jpegenc_drv_ids,
> +		.pm = &mtk_jpegenc_pm_ops,
>   	},
>   };
>   

