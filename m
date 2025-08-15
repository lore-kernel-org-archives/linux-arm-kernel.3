Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC0BCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 13:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJze5C9lDTBIwC49h9q7OfVUXEhPFkEHTan94Jr4v1c=; b=u92ymboIAhR/wAF4Bn2h1VBboq
	ClMx6A6FfaXnFxo7DU+N/9N55OSMC0INsOsWgj22FgwjQWDhfLHzayKs/KMJ0iwj9gGJp5fMmjDNZ
	c12IlRuc+v7EEAp/8xe1RhqegvQ+zGyA/nhxvScmJFpaCzXncz2uz/uJ1hYyKSWG8piQ5tRz37HY4
	NFyrvLfUPw8EGi8qoeiMAlzUu7cjFtrAfbN0OSTzTDYQDqQ+v/DycJ4Lo0yy7z1uO3mXikVOMsjlp
	Vd4i4XPE8nNR9GT1SxXfN7g9GQ1NsqGZfCkhxmFOF4WLV08kYPsazz3LmWdEzU/1Q0G7FmMHyGnVL
	Fz0gC6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuUa-00000002aX4-0JiV;
	Fri, 15 Aug 2025 13:29:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsA1-00000002HGf-3ma5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 10:59:51 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 88BF556D;
	Fri, 15 Aug 2025 12:58:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755255533;
	bh=NzWbvAg9ULrtbOcYxkB5gPQ39IzaRkhd+Wm2Y2RmPCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gp3CfCSAa6INwM6KYAHJw54juTrynWOk78+YmthMNvgNydks071tCmBydEvA1qgjc
	 BH6HfjIFpFZMUu1kcR3o04XgXzAqnzKAFmQbFkV3cqe/npe9SFMylPkBtdMQkcyTUS
	 D3SWFQqAbJPhz9C1Z7csqDDBjfIgIHwSwwKXvI+E=
Date: Fri, 15 Aug 2025 13:59:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: nxp: imx8-isi: Add suspend/resume support for
 ISI mem2mem
Message-ID: <20250815105928.GL6201@pendragon.ideasonboard.com>
References: <20250815-isi_m2m-v2-1-32e3720880cc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250815-isi_m2m-v2-1-32e3720880cc@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_035950_084242_873DCED5 
X-CRM114-Status: GOOD (  21.72  )
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

On Fri, Aug 15, 2025 at 05:28:51PM +0800, Guoniu Zhou wrote:
> Add suspend/resume support for ISI when work at memory to memory mode.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
>   - Move mxc_isi_m2m_suspend()/resume() out of loop.
>   - Replace ctx->chained with m2m->chained_count.
>   - Link to v1: https://lore.kernel.org/all/20250717024353.1811576-1-guoniu.zhou@oss.nxp.com/
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  9 ++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    | 11 +++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 34 ++++++++++++++++++++++
>  3 files changed, 54 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 981648a0311374597a033a7ecbf39f7b0b252cb0..408e9cb61554d05ac92562c322d6a728080bb9e5 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -374,6 +374,8 @@ static int mxc_isi_pm_suspend(struct device *dev)
>  		mxc_isi_video_suspend(pipe);
>  	}
>  
> +	mxc_isi_m2m_suspend(&isi->m2m);
> +
>  	return pm_runtime_force_suspend(dev);
>  }
>  
> @@ -403,6 +405,13 @@ static int mxc_isi_pm_resume(struct device *dev)
>  		}
>  	}
>  
> +	ret = mxc_isi_m2m_resume(&isi->m2m);
> +	if (ret) {
> +		dev_err(dev, "Failed to resume ISI%u (%d) for m2m\n", i,

Drop %u and i.

No need to resubmit, I'll make the change locally.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			ret);
> +		err = ret;
> +	}
> +
>  	return err;
>  }
>  
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 206995bedca4a4c5d7873f3bc872fbae18b3cb75..6493eef907010934217d9f14a0d6d56acdc59ee0 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -343,6 +343,8 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
>  #ifdef CONFIG_VIDEO_IMX8_ISI_M2M
>  int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev);
>  int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi);
> +void mxc_isi_m2m_suspend(struct mxc_isi_m2m *m2m);
> +int mxc_isi_m2m_resume(struct mxc_isi_m2m *m2m);
>  #else
>  static inline int mxc_isi_m2m_register(struct mxc_isi_dev *isi,
>  				       struct v4l2_device *v4l2_dev)
> @@ -353,6 +355,15 @@ static inline int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi)
>  {
>  	return 0;
>  }
> +
> +static inline void mxc_isi_m2m_suspend(struct mxc_isi_m2m *m2m)
> +{
> +}
> +
> +static inline int mxc_isi_m2m_resume(struct mxc_isi_m2m *m2m)
> +{
> +	return 0;
> +}
>  #endif
>  
>  int mxc_isi_channel_acquire(struct mxc_isi_pipe *pipe,
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 22e49d3a128732c077beb7ac2e2f688e0899f8e2..26361fe2ca858098d907d4a0719b0fdacc6becd2 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -732,6 +732,40 @@ static const struct v4l2_file_operations mxc_isi_m2m_fops = {
>  	.mmap		= v4l2_m2m_fop_mmap,
>  };
>  
> +/* -----------------------------------------------------------------------------
> + * Suspend & resume
> + */
> +
> +void mxc_isi_m2m_suspend(struct mxc_isi_m2m *m2m)
> +{
> +	if (m2m->usage_count == 0)
> +		return;
> +
> +	v4l2_m2m_suspend(m2m->m2m_dev);
> +
> +	if (m2m->chained_count > 0)
> +		mxc_isi_channel_unchain(m2m->pipe);
> +
> +	mxc_isi_channel_disable(m2m->pipe);
> +	mxc_isi_channel_put(m2m->pipe);
> +}
> +
> +int mxc_isi_m2m_resume(struct mxc_isi_m2m *m2m)
> +{
> +	if (m2m->usage_count == 0)
> +		return 0;
> +
> +	mxc_isi_channel_get(m2m->pipe);
> +
> +	if (m2m->chained_count > 0)
> +		mxc_isi_channel_chain(m2m->pipe, false);
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
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250815-isi_m2m-3db166a97969

-- 
Regards,

Laurent Pinchart

