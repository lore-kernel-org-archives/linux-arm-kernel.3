Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4A9CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 00:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DLf4jUFDQ0+3J0PbkbCIaeM3GNZZYntr0oWsTns52g=; b=X0eD1IvX23XuMsOO1PpDq6VdhX
	ljNK5w52wT87gTWQCWjV/EKLryqA9sFPuR9WPuKOE++RuAt6bw4dNwaGUyfePHdFRJ49gDSezBZCv
	wHwkIiS0/DWCVhpBxYL+RvlUDLVU1CxCxbZRyVd/PQFMvvNw/TsnqzYZN5YKWLA8+ZNtsYQvKfxBj
	5tuXzPYorcHfkkErRdQV1rGg3WU8f9eKh8Shqzlr3Yy3oj0Z+4wjH3JbCbvGDNW/nUvda3Anyz/hX
	VNESLYQn6+98x7sGdZVc/+QHMXhmtvuO8OmyKjvRLpxR/cZ3UqQdvkTxtk0Scsgb70wcgoBgUlJuN
	kGRv3s5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDAeg-0000000CsO7-42pK;
	Mon, 27 Oct 2025 00:00:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDAed-0000000CsNT-2BgT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 00:00:10 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4411CE9B;
	Mon, 27 Oct 2025 00:58:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761523098;
	bh=2LEzP3txFu5ErcmDdC5BABECgcH7F5vf2cMFAPsu270=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLxxpakxqUgpog66O8G7I2uQM4WUbF4UeXljNud5eTWUlQ6iKLdaBfmzHzaKUwiVl
	 H4P8o1LyEeFyV7zungjl6PzoY5UWYmO5oFgR2RQ2RK2K//LcBk7qyiBTKtjKbFKlcw
	 WkMGRjfcHurfqs+cBb8VXdXbF0raanqgkLPbSgSs=
Date: Mon, 27 Oct 2025 01:59:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] media: imx8mq-mipi-csi2: Implement
 .get_frame_desc subdev callback
Message-ID: <20251026235951.GL13023@pendragon.ideasonboard.com>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
 <20250820-csi2_imx8mq-v5-4-e04a6fc593bd@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820-csi2_imx8mq-v5-4-e04a6fc593bd@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_170009_169904_185D67AF 
X-CRM114-Status: GOOD (  18.32  )
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

On Wed, Aug 20, 2025 at 07:04:59PM +0800, Guoniu Zhou wrote:
> Implement .get_frame_desc subdev callback since downstream subdev
> need to get frame description.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 529928b94a193e02177f8773a0e68375b59b0a08..a28ccdeef8521c0e00d13b1860eadef5f2118651 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -648,6 +648,37 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int imx8mq_mipi_csi_get_frame_desc(struct v4l2_subdev *sd,
> +					  unsigned int pad,
> +					  struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
> +	const struct csi2_pix_format *csi2_fmt;
> +	const struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;
> +
> +	if (pad != MIPI_CSI2_PAD_SOURCE)
> +		return -EINVAL;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SOURCE);
> +	csi2_fmt = find_csi2_format(fmt->code);
> +	v4l2_subdev_unlock_state(state);
> +
> +	if (!csi2_fmt)
> +		return -EPIPE;
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->num_entries = 1;
> +
> +	entry->flags = 0;
> +	entry->pixelcode = csi2_fmt->code;
> +	entry->bus.csi2.vc = 0;
> +	entry->bus.csi2.dt = media_bus_fmt_to_csi2_dt(csi2_fmt->code);
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_subdev_video_ops imx8mq_mipi_csi_video_ops = {
>  	.s_stream	= imx8mq_mipi_csi_s_stream,
>  };
> @@ -656,6 +687,7 @@ static const struct v4l2_subdev_pad_ops imx8mq_mipi_csi_pad_ops = {
>  	.enum_mbus_code		= imx8mq_mipi_csi_enum_mbus_code,
>  	.get_fmt		= v4l2_subdev_get_fmt,
>  	.set_fmt		= imx8mq_mipi_csi_set_fmt,
> +	.get_frame_desc		= imx8mq_mipi_csi_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_ops imx8mq_mipi_csi_subdev_ops = {

-- 
Regards,

Laurent Pinchart

