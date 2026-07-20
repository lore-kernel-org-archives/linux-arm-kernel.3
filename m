Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C7AC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfLqgkmTTnDN3IEBTs38dwwB/mzBeqnDPKujVAyIcj8=; b=ycIaxOBCnN0cCNfWYcWE4KbfPF
	0TjPls2LCG0JF7plvNnw6jCHODqXi0hw9WnSnznH9e9ZD7YK0PRV/TnhA4fFK4uxm9yVapEXp9NR5
	zc6mD9V3ColVxIXuBN+6QKbFsuDhRA35qWXU6jCWl0AN9wIxltyDxQ3upEzPoSPE5a1dxLlKujp8T
	YuKZIcAznVydZtwSouDFyNCN2K9W5fcXTxxEQCIaAclDGV76TtnarWk9PeiSsDz94LNc2kMShnWYw
	DeAVVzJzCWDoE71k7WAtBn3FZl7UvA8cPvliCfWZQYKW+/NU1+5wk88jChzb0mi7HQoSd6+0PNmji
	D6DIvsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrFM-00000007RfI-1xuH;
	Mon, 20 Jul 2026 16:53:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrFK-00000007Re8-3SEA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:53:40 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A113270;
	Mon, 20 Jul 2026 18:52:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784566358;
	bh=r69KWif/WluETzLaObyRwXUP59GDiT0sfR5I8jHTQl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSd3YdkKBtHHk+KYSmbdJ9WdF5PChKyzb2dZ3az35o0PUhNDHLqxGQwWlKmrJgeCf
	 uCXbeUnNxoGTYo1v0KDhdPlCav0OKPB8KgJO5IVwqWuJ41ePhqZCQEJmQYNIJ0AWQl
	 e00Zw4kisruOQvhYPA5aT+WVvt3jPruyWgSJVzy0=
Date: Mon, 20 Jul 2026 19:53:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v5 1/2] media: imx8-isi: crossbar: Add get_frame_desc
 operation
Message-ID: <20260720165335.GB42426@killaraus.ideasonboard.com>
References: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
 <20260521-isi_vc-v5-1-a38eb4fcd58e@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-isi_vc-v5-1-a38eb4fcd58e@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_095339_008628_CA601DBB 
X-CRM114-Status: GOOD (  17.08  )
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

On Thu, May 21, 2026 at 05:10:04PM +0800, Guoniu Zhou wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Implement the get_frame_desc pad operation for the crossbar subdev using
> the v4l2_subdev_get_frame_desc_passthrough() helper. This allows the
> crossbar to properly propagate frame descriptors from its sink pads to
> its source pads, which is necessary for proper stream configuration in
> multiplexed streams scenarios.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v5:
> - Use v4l2_subdev_get_frame_desc_passthrough helper
> - Rewrote commit message
> 
> Changes in v4:
> - Use %d instead of %u for ret variable in error messages
> - Fix potential -ENOIOCTLCMD leak by resetting ret to 0 on continue
> 
> Changes in v3:
> - New patch added based on feedback from Laurent Pinchart
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 605a45124103..0b593aed618b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -404,6 +404,7 @@ static const struct v4l2_subdev_pad_ops mxc_isi_crossbar_subdev_pad_ops = {
>  	.enum_mbus_code = mxc_isi_crossbar_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = mxc_isi_crossbar_set_fmt,
> +	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
>  	.set_routing = mxc_isi_crossbar_set_routing,
>  	.enable_streams = mxc_isi_crossbar_enable_streams,
>  	.disable_streams = mxc_isi_crossbar_disable_streams,

-- 
Regards,

Laurent Pinchart

