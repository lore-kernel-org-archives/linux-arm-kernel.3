Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00896C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 22:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZO2XUavc0L7m5udbs78sYa29349pafumHXfuQ1QHuGg=; b=hqmL8Ul+c5gtCaiuV6Bsr7rO9x
	P2zvrCm9Q/iZ1AmnR+1rxxmn2pQ4HwUVNutspo/s3MfcUPLWktATC09CJIv3rzsedOv33sXxN6GRR
	DwjPfs9yTJQ1GY/o/Z6h3xuH/bblqmx/fIWgmT11XMWH0fEA2wDPZMEVivOSohjQghQg9WRToTFgQ
	hkCAFOm9YWj8G6VzSnw5Unu+nyQRUK9P1Yw93+U+8nDL1kmCRRei9axWaDvs2TTsDzW7J55JXbz6+
	OExtVbKdSjiXgnWbX3tTuYMDz5BU/OROJan08KtSUrFsecMivL8OOsaNHVfL3xuBtr24mYRY5qSQk
	UmAndvEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKAd-0000000FAqc-0yQH;
	Wed, 13 Aug 2025 22:42:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umK84-0000000FANP-1HPF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 22:39:33 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8B0387E0;
	Thu, 14 Aug 2025 00:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755124715;
	bh=RSzrbNuZ/ezGEZBB5B8+3JnfSmbDh3D2Pjh9jwrpZrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lsCbZ1TfT/ZSYGrS6tdKV3bjyuKkyZgskNkXTZz1Av7msvcZTLQVnPzvjnek8ekzm
	 Tqb/7L3l623lYEhQB8f+Ng4P0g6XSuMBaACdp2E5GmhvG0EqVfDZ+bUUp8d/8H1HFN
	 c0cOLrQyJLjh+mk106bnhM1i2OyXJaREbnud0ZR0=
Date: Thu, 14 Aug 2025 01:39:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: guoniu.zhou@oss.nxp.com
Cc: rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm, mchehab@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: Add suspend/resume support for ISI
 mem2mem
Message-ID: <20250813223910.GA11412@pendragon.ideasonboard.com>
References: <20250717024353.1811576-1-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250717024353.1811576-1-guoniu.zhou@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_153932_488199_6CFCF844 
X-CRM114-Status: GOOD (  25.08  )
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

Hi Guoniu,

Thank you for the patch.

On Thu, Jul 17, 2025 at 10:43:54AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Add suspend/resume support for ISI when work at memory to memory mode.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     |  8 ++++
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     | 11 +++++
>  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 48 +++++++++++++++++++
>  3 files changed, 67 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 981648a03113..6eef45302e6c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -372,6 +372,7 @@ static int mxc_isi_pm_suspend(struct device *dev)
>  		struct mxc_isi_pipe *pipe = &isi->pipes[i];
>  
>  		mxc_isi_video_suspend(pipe);
> +		mxc_isi_m2m_suspend(pipe);
>  	}

Given that only the first pipe can be used for M2M, I would move the
mxc_isi_m2m_suspend() call after the loop, and pass it a &isi->m2m
argument.

>  
>  	return pm_runtime_force_suspend(dev);
> @@ -401,6 +402,13 @@ static int mxc_isi_pm_resume(struct device *dev)
>  			 */
>  			err = ret;
>  		}
> +
> +		ret = mxc_isi_m2m_resume(pipe);
> +		if (ret) {
> +			dev_err(dev, "Failed to resume ISI%u (%d) for m2m\n", i,
> +				ret);
> +			err = ret;
> +		}

Same here, that can be moved after the loop.

>  	}
>  
>  	return err;
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 206995bedca4..b979b79b5525 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -343,6 +343,8 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
>  #ifdef CONFIG_VIDEO_IMX8_ISI_M2M
>  int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev);
>  int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi);
> +void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe);
> +int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe);
>  #else
>  static inline int mxc_isi_m2m_register(struct mxc_isi_dev *isi,
>  				       struct v4l2_device *v4l2_dev)
> @@ -353,6 +355,15 @@ static inline int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi)
>  {
>  	return 0;
>  }
> +
> +static inline void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe)
> +{
> +}
> +
> +static inline int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe)
> +{
> +	return 0;
> +}
>  #endif
>  
>  int mxc_isi_channel_acquire(struct mxc_isi_pipe *pipe,
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 22e49d3a1287..fe9d85335b6c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -732,6 +732,54 @@ static const struct v4l2_file_operations mxc_isi_m2m_fops = {
>  	.mmap		= v4l2_m2m_fop_mmap,
>  };
>  
> +/* -----------------------------------------------------------------------------
> + * Suspend & resume
> + */
> +
> +void mxc_isi_m2m_suspend(struct mxc_isi_pipe *pipe)
> +{
> +	struct mxc_isi_m2m *m2m = &pipe->isi->m2m;
> +	struct mxc_isi_m2m_ctx *ctx = m2m->last_ctx;
> +
> +	/*
> +	 * Check pipe for ISI memory to memory since only
> +	 * channel 0 support this feature.
> +	 */
> +	if (m2m->pipe != pipe || m2m->usage_count == 0)

If we pass the mxc_isi_m2m pointer to the function, you can drop the
comment and the first part of the condition. Same in
mxc_isi_m2m_resume().

> +		return;
> +
> +	v4l2_m2m_suspend(m2m->m2m_dev);
> +
> +	if (ctx->chained)

Shouldn't you check m2m->chained_count instead ? Same in
mxc_isi_m2m_resume().

> +		mxc_isi_channel_unchain(pipe);
> +
> +	mxc_isi_channel_disable(pipe);
> +	mxc_isi_channel_put(pipe);
> +}
> +
> +int mxc_isi_m2m_resume(struct mxc_isi_pipe *pipe)
> +{
> +	struct mxc_isi_m2m *m2m = &pipe->isi->m2m;
> +	struct mxc_isi_m2m_ctx *ctx = m2m->last_ctx;
> +
> +	/*
> +	 * Check pipe for ISI memory to memory since only
> +	 * channel 0 support this feature.
> +	 */
> +	if (m2m->pipe != pipe || m2m->usage_count == 0)
> +		return 0;
> +
> +	mxc_isi_channel_get(pipe);
> +
> +	if (ctx->chained)
> +		mxc_isi_channel_chain(pipe, false);
> +
> +	m2m->last_ctx = NULL;
> +	v4l2_m2m_resume(m2m->m2m_dev);
> +
> +	return 0;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Registration
>   */

-- 
Regards,

Laurent Pinchart

