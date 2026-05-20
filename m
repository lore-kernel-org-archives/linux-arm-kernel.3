Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACE1CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 21:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wu7BYcpdKEhy5UQgW642CFskRoCZsZvWAmVlK7nXB84=; b=UUeVwiLzijqwSq3fOx98BaCGSg
	Mcrf/cAPqG0XfnV59q5keIc38fkxc+uU1Edo7bXu8SKl3B06Ff1OTigMTMbStLP3GleGSo1W+mpRg
	vxATTQDE7CpNcCH4vQdvKW+oCukVYHsqYmQFf/+LRbSgIzPQBNGgtNQqUE42lt3sqP7eMAgFZfo6A
	YPL883p5Q44d6gAalu7ICyVXBYPKSGtxMGVPDM7mzjFERL1i/nHJG48U+1XDyVbaFQh/Esa7yzqv7
	TcZItL7N+4pUki0kRL459NFWGX3NAGSE1r6y1kRU4nAg9M9i3tMR6nnCkWbqYn9jcpgPdJxjPCUUy
	i66IK1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoMg-00000005pC2-2FTa;
	Wed, 20 May 2026 21:22:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoMe-00000005pBH-04Qt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 21:22:05 +0000
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9607642B;
	Wed, 20 May 2026 23:21:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779312108;
	bh=Y1rMEzlaiUJ1fqWI8kiFvjdxUfnUCtEhmT0b78R7Io8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RTzdR8+KDBxDyElJVu8oBC2z5QLYgeD3vaVIDqGEx6VjXeojnOaxldKOm/0p1JZ47
	 XyKKljc2WLcRBhbSmGk35C4DXFzY37rvnIqjuLVNao+NEp0xwKB1CwNuU91zrnSS0m
	 /KC2l5BZ4EMItojYybETV1GlaY4ouGprNRHBzBw8=
Date: Wed, 20 May 2026 23:22:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 2/2] media: nxp: imx8-isi: Implement get_frame_desc
 for crossbar subdev
Message-ID: <20260520212201.GC9017@killaraus.ideasonboard.com>
References: <20260508-isi_vc-v4-0-feee39c63939@oss.nxp.com>
 <20260508-isi_vc-v4-2-feee39c63939@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260508-isi_vc-v4-2-feee39c63939@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_142204_200719_3B084C20 
X-CRM114-Status: GOOD (  32.31  )
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

On Fri, May 08, 2026 at 11:05:41AM +0800, Guoniu Zhou wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Implement the get_frame_desc pad operation for the crossbar subdevice
> to propagate frame descriptor information from the source subdevice to
> downstream ISI channels.
> 
> This allows the ISI driver to retrieve virtual channel information and
> other stream parameters from the connected upstream, which is required
> for proper virtual channel routing on platforms supporting multiple VCs.

Have you looked at v4l2_subdev_get_frame_desc_passthrough(), could it be
used instead of a manual implementation ? This could be either direct
usage of v4l2_subdev_get_frame_desc_passthrough(), or with minor
additional customization (first calling the unlocked helper
__v4l2_subdev_get_frame_desc_passthrough() and updating the descriptors.

> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v4:
> - Use %d instead of %u for ret variable in error messages
> - Fix potential -ENOIOCTLCMD leak by resetting ret to 0 on continue
> 
> Changes in v3:
> - New patch added based on feedback from Laurent Pinchart
> ---
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 605a45124103..b5eff191b2d5 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -306,6 +306,103 @@ static int mxc_isi_crossbar_set_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int mxc_isi_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				  struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
> +	struct device *dev = xbar->isi->dev;
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev_state *state;
> +	int ret = 0;
> +
> +	if (pad < xbar->num_sinks)
> +		return -EINVAL;
> +
> +	memset(fd, 0, sizeof(*fd));
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	/*
> +	 * Iterate over all active routes. For each route going through the
> +	 * requested source pad, get the frame descriptor from the connected
> +	 * source subdev, find the corresponding stream entry, and add it to
> +	 * the output frame descriptor with the routed stream ID.
> +	 */
> +	for_each_active_route(&state->routing, route) {
> +		struct v4l2_mbus_frame_desc source_fd;
> +		struct v4l2_subdev *remote_sd;
> +		struct media_pad *remote_pad;
> +		unsigned int i;
> +
> +		if (route->source_pad != pad)
> +			continue;
> +
> +		/* Find the remote subdev connected to this sink pad */
> +		remote_pad = media_pad_remote_pad_first(&xbar->pads[route->sink_pad]);
> +		if (!remote_pad) {
> +			dev_dbg(dev, "no remote pad connected to crossbar input %u\n",
> +				route->sink_pad);
> +			continue;
> +		}
> +
> +		remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +		if (!remote_sd) {
> +			dev_err(dev, "no subdev connected to crossbar input %u\n",
> +				route->sink_pad);
> +			ret = -EPIPE;
> +			goto out_unlock;
> +		}
> +
> +		/* Get frame descriptor from the remote subdev */
> +		ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
> +				       remote_pad->index, &source_fd);
> +		if (ret == -ENOIOCTLCMD) {
> +			dev_dbg(dev, "%s:%u does not support frame descriptors\n",
> +				remote_sd->entity.name, remote_pad->index);
> +			ret = 0;
> +			continue;
> +		}
> +		if (ret < 0) {
> +			dev_err(dev, "failed to get frame desc from %s:%u: %d\n",
> +				remote_sd->entity.name, remote_pad->index, ret);
> +			goto out_unlock;
> +		}
> +
> +		if (fd->num_entries == 0)
> +			fd->type = source_fd.type;
> +
> +		/* Find the source frame descriptor entry matching the sink stream */
> +		for (i = 0; i < source_fd.num_entries; i++) {
> +			if (source_fd.entry[i].stream == route->sink_stream)
> +				break;
> +		}
> +
> +		if (i == source_fd.num_entries) {
> +			dev_err(dev, "stream %u not found in frame desc from %s:%u\n",
> +				route->sink_stream, remote_sd->entity.name,
> +				remote_pad->index);
> +			ret = -EPIPE;
> +			goto out_unlock;
> +		}
> +
> +		if (fd->num_entries >= ARRAY_SIZE(fd->entry)) {
> +			dev_err(dev, "frame descriptor is full\n");
> +			ret = -ENOSPC;
> +			goto out_unlock;
> +		}
> +
> +		/* Copy the entry and update the stream ID */
> +		fd->entry[fd->num_entries] = source_fd.entry[i];
> +		fd->entry[fd->num_entries].stream = route->source_stream;
> +		fd->num_entries++;
> +	}
> +
> +out_unlock:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
>  static int mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
>  					struct v4l2_subdev_state *state,
>  					enum v4l2_subdev_format_whence which,
> @@ -404,6 +501,7 @@ static const struct v4l2_subdev_pad_ops mxc_isi_crossbar_subdev_pad_ops = {
>  	.enum_mbus_code = mxc_isi_crossbar_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = mxc_isi_crossbar_set_fmt,
> +	.get_frame_desc = mxc_isi_get_frame_desc,
>  	.set_routing = mxc_isi_crossbar_set_routing,
>  	.enable_streams = mxc_isi_crossbar_enable_streams,
>  	.disable_streams = mxc_isi_crossbar_disable_streams,

-- 
Regards,

Laurent Pinchart

