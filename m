Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C2DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 21:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHdxFNcsjqrLxhg7kDKxHfscWotSQgcos0JLeOgQc20=; b=Hw41/jvg4qzuSUhTVZyoTQ2QZY
	s/uP7mifZ2OF5q5qwOsTCfLEvxpNWEkLIczcZnQ04iScgpI2Ask7+2nU3csgKB8VH4DeRdfHQXQ7d
	y9cWCDbagIoGvZ7VSOYGtXskzZfrylvJLe9G6CVxxZDp5bIo9dX8GGxmq2hUY3aInZF5CZ/rkSmVw
	PQa7BVAyuHBYnriMQNwT6rdvIzHyoO++nJArge4C1yBy8uvZVLslpmoHvvYqgOi/5TldvAr1/ywHo
	sX4LGB4/cI8fNprb7ztR2ayJyDbRpOPJ3CuEt9rEHqQuJCrab46ldHQPpIYgNK3F3H3GA4OZAZvTU
	skLYfaQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoAx-00000005npE-0Byn;
	Wed, 20 May 2026 21:09:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoAu-00000005noc-3Juj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 21:09:58 +0000
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3989C42B;
	Wed, 20 May 2026 23:09:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779311379;
	bh=M/vwP21jcgLC8DurVFWWxnYEAEIbfadUhNFk/hn/kaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nc2UvtP58PfVDhFDxdslsowp2jOdItNhfBHHluVARF+YBl/+Q2w+XjIg3AcIkUGT7
	 ZRxO6R+ja0T9tj/xH7hQWOawoJs2ziCVZJCXmbTEQrbngaxcO3L9TLXYXIZwO8Mibe
	 iLWtT67DLIwsqfAubAiVLGAi8nTlAli/LtttYiOQ=
Date: Wed, 20 May 2026 23:09:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 1/2] media: nxp: imx8-isi: Add virtual channel support
Message-ID: <20260520210952.GB9017@killaraus.ideasonboard.com>
References: <20260508-isi_vc-v4-0-feee39c63939@oss.nxp.com>
 <20260508-isi_vc-v4-1-feee39c63939@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260508-isi_vc-v4-1-feee39c63939@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_140956_983282_5621EE7B 
X-CRM114-Status: GOOD (  40.01  )
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

Hello Guoniu,

Thank you for the patch.

On Fri, May 08, 2026 at 11:05:40AM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The ISI supports different numbers of virtual channels depending on the
> platform. i.MX95 supports 8 virtual channels, and i.MX8QXP/QM support 4
> virtual channels. They are used in multiple camera use cases, such as
> surround view. Other platforms (such as i.MX8/MN/MP/ULP/91/93) don't
> support virtual channels, and the VC_ID bits are marked as read-only.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v4:
> - Fix VC boundary check: use num_vc (virtual channels count) instead of
>   num_channels (ISI pipelines count)
> - Set VC to 0 when frame descriptor has no entries
> - Move platform-specific comments to block style to fix line length warnings
> 
> Changes in v3:
> - Add num_vc field to platform data to indicate VC support
> - Clear VC_ID_1 bit after reading CHNL_CTRL for proper VC switching
> - Set VC_ID_1 only on platforms with num_vc > 4
> - Improve mxc_isi_get_vc() error handling
> - Add back CHNL_CTRL_BLANK_PXL and document platform-specific register fields
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  3 ++
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  4 ++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 14 ++++-
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 59 ++++++++++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    | 12 +++--
>  5 files changed, 88 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 4bf8570e1b9e..837ac7046cf2 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -318,6 +318,7 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
>  	.model			= MXC_ISI_IMX95,
>  	.num_ports		= 4,
>  	.num_channels		= 8,
> +	.num_vc			= 8,
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> @@ -329,6 +330,7 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
>  	.model			= MXC_ISI_IMX8QM,
>  	.num_ports		= 5,
>  	.num_channels		= 8,
> +	.num_vc			= 4,
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_qm,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> @@ -340,6 +342,7 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
>  	.model			= MXC_ISI_IMX8QXP,
>  	.num_ports		= 5,
>  	.num_channels		= 6,
> +	.num_vc			= 4,
>  	.reg_offset		= 0x10000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 14d63ec36416..195c28dbd151 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -169,6 +169,7 @@ struct mxc_isi_plat_data {
>  	enum model model;
>  	unsigned int num_ports;
>  	unsigned int num_channels;
> +	unsigned int num_vc;		/* Number of VCs, 0 = no VC support */
>  	unsigned int reg_offset;
>  	const struct mxc_isi_ier_reg  *ier_reg;
>  	const struct mxc_isi_set_thd *set_thd;
> @@ -257,6 +258,9 @@ struct mxc_isi_pipe {
>  	u8				acquired_res;
>  	u8				chained_res;
>  	bool				chained;
> +
> +	/* Virtual channel ID for the ISI channel */
> +	u8				vc;

I try not to store such values in global structures, when the purpose is
to pass them between functions in a direct call stack. You can instead
return the vc value from mxc_isi_get_vc(), pass it to
mxc_isi_channel_config() and from there to
mxc_isi_channel_set_control().

>  };
>  
>  struct mxc_isi_m2m {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 0187d4ab97e8..ecd0c2ef28b6 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -308,6 +308,11 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  	mutex_lock(&pipe->lock);
>  
>  	val = mxc_isi_read(pipe, CHNL_CTRL);
> +
> +	/* Clear the VC_ID_1 bit on platforms supporting more than 4 VCs. */
> +	if (pipe->isi->pdata->num_vc > 4)
> +		val &= ~CHNL_CTRL_VC_ID_1_MASK;
> +

Please move this just after the next statement, we usually start with
generic statements followed by conditional ones.

>  	val &= ~(CHNL_CTRL_CHNL_BYPASS | CHNL_CTRL_CHAIN_BUF_MASK |
>  		 CHNL_CTRL_SRC_TYPE_MASK | CHNL_CTRL_MIPI_VC_ID_MASK |
>  		 CHNL_CTRL_SRC_INPUT_MASK);
> @@ -338,7 +343,14 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  	} else {
>  		val |= CHNL_CTRL_SRC_TYPE(CHNL_CTRL_SRC_TYPE_DEVICE);
>  		val |= CHNL_CTRL_SRC_INPUT(input);
> -		val |= CHNL_CTRL_MIPI_VC_ID(0); /* FIXME: For CSI-2 only */
> +		val |= CHNL_CTRL_MIPI_VC_ID(pipe->vc); /* FIXME: For CSI-2 only */
> +
> +		/*
> +		 * On platforms with more than 4 VCs (i.MX95), the VC ID is
> +		 * split across VC_ID_0 (bits 7:6) and VC_ID_1 (bit 16).
> +		 */
> +		if (pipe->isi->pdata->num_vc > 4)
> +			val |= CHNL_CTRL_VC_ID_1(pipe->vc >> 2);
>  	}
>  
>  	mxc_isi_write(pipe, CHNL_CTRL, val);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0..e6da254a9ef0 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -232,6 +232,61 @@ static inline struct mxc_isi_pipe *to_isi_pipe(struct v4l2_subdev *sd)
>  	return container_of(sd, struct mxc_isi_pipe, sd);
>  }
>  
> +static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
> +{
> +	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
> +	struct device *dev = pipe->isi->dev;
> +	struct v4l2_mbus_frame_desc fd = { };
> +	unsigned int source_pad = xbar->num_sinks + pipe->id;
> +	unsigned int max_vc;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = v4l2_subdev_call(&xbar->sd, pad, get_frame_desc,
> +			       source_pad, &fd);
> +	if (ret == -ENOIOCTLCMD) {

Is this needed ? If we swap patches 1/2 and 2/2, the get_frame_desc
operation should always be available on the source. 

> +		/*
> +		 * If remote subdev doesn't implement get_frame_desc.
> +		 * Assume virtual channel 0.
> +		 */
> +		pipe->vc = 0;
> +		return 0;
> +	}
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get source frame desc from pad %u\n",
> +			source_pad);
> +		return ret;
> +	}
> +
> +	if (!fd.num_entries) {
> +		pipe->vc = 0;
> +		return 0;
> +	}

Similarly, can this happen ?

> +
> +	/* Find stream 0 in the frame descriptor */
> +	for (i = 0; i < fd.num_entries; i++) {
> +		if (fd.entry[i].stream == 0)
> +			break;
> +	}
> +
> +	if (i == fd.num_entries) {
> +		dev_err(dev, "Failed to find stream from source frame desc\n");
> +		return -EINVAL;

I think -EPIPE would be more appropriate, this indicates the pipeline
isn't correctly configured.

> +	}
> +
> +	max_vc = pipe->isi->pdata->num_vc ? : 1;
> +
> +	/* Check virtual channel range */
> +	if (fd.entry[i].bus.csi2.vc >= max_vc) {
> +		dev_err(dev, "Virtual channel %u exceeds maximum %u\n",
> +			fd.entry[i].bus.csi2.vc, max_vc - 1);
> +		return -EINVAL;

Same here.

> +	}
> +
> +	pipe->vc = fd.entry[i].bus.csi2.vc;
> +	return 0;
> +}
> +
>  int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
>  {
>  	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
> @@ -280,6 +335,10 @@ int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
>  
>  	v4l2_subdev_unlock_state(state);
>  
> +	ret = mxc_isi_get_vc(pipe);
> +	if (ret)
> +		return ret;
> +
>  	/* Configure the ISI channel. */
>  	mxc_isi_channel_config(pipe, input, &in_size, &scale, &crop,
>  			       sink_info->encoding, src_info->encoding);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 1b65eccdf0da..e795f4daf3ff 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -6,6 +6,7 @@
>  #ifndef __IMX8_ISI_REGS_H__
>  #define __IMX8_ISI_REGS_H__
>  
> +#include <linux/bitfield.h>
>  #include <linux/bits.h>
>  
>  /* ISI Registers Define  */
> @@ -19,9 +20,14 @@
>  #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
>  #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
>  #define CHNL_CTRL_SW_RST					BIT(24)
> -#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)
> -#define CHNL_CTRL_BLANK_PXL_MASK				GENMASK(23, 16)
> -#define CHNL_CTRL_MIPI_VC_ID(n)					((n) << 6)
> +/*
> + * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
> + * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
> + */
> +#define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))
> +#define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))
> +#define CHNL_CTRL_VC_ID_1_MASK					BIT(16)
> +#define CHNL_CTRL_MIPI_VC_ID(n)					FIELD_PREP(GENMASK(7, 6), (n))
>  #define CHNL_CTRL_MIPI_VC_ID_MASK				GENMASK(7, 6)
>  #define CHNL_CTRL_SRC_TYPE(n)					((n) << 4)
>  #define CHNL_CTRL_SRC_TYPE_MASK					BIT(4)

-- 
Regards,

Laurent Pinchart

