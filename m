Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD79FCDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 19:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FZIYbi55Lf9jwBrrHH8gAJ9aVH4Nm97rDvFWfiCGps=; b=ZDVqdnIIXSwl0mEIp0agEpHcRA
	w5j/WQrjHFTDwdgwHgZZqpKIB3/Faf7B8upR7S7/hRamz90yXI0B+mwdGZK8c/zAQNYfzjcMAQbkh
	6Np/gjGeXjHeE0kCqk3x3I4QpEsQ3OwLTI+MZSxnML1BCiFK/FvxZo4OgeWrXJI9mGM3eyOZYeVlY
	erVY+UHcXc0zqv5SnrHBmM+gF6v27VoM/I7ewumlEAivRvBR7VQ85QqIV634DtBzn7vxCixhDXUVe
	FGlE+G11uzNdRGS21Gow0OhE9NtNWvote+jPPZcgDt7xFUcScQGNGWjqJ6TmWACipZWGb2n5XkYkX
	4O058wQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcT58-00000008FsQ-3zxx;
	Wed, 24 Jun 2026 19:16:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcT56-00000008Frl-0pzy;
	Wed, 24 Jun 2026 19:16:17 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11BA6E9C;
	Wed, 24 Jun 2026 21:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782328535;
	bh=QiPILnKlLuOHtaJpr6jjLy6flwPX2L0FxIacScwZD7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T5vfv449pdBSSpldMnnTgRtmlKEuGS7xR/QqdoAmSDsipINNJfQM0aDOJmupDXynL
	 M1S1ZTMK4NSbJrwB7EcA5PGPwIV6rfyYmW3jWieV4wOCQKyZmUsf/aZUAVuEMyriDg
	 RlLsCTwdXzjMK9kwP/uDjrrb4QgNUF25wIXIdvoM=
Date: Wed, 24 Jun 2026 22:16:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 3/4] media: rkisp1: use
 fwnode_graph_for_each_endpoint_scoped() to simplify code
Message-ID: <20260624191613.GE851255@killaraus.ideasonboard.com>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
 <20260624-fw_scoped-v2-3-0a8db472af4a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624-fw_scoped-v2-3-0a8db472af4a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_121616_388901_E963B13E 
X-CRM114-Status: GOOD (  17.32  )
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

On Wed, Jun 24, 2026 at 01:00:11PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Use fwnode_graph_for_each_endpoint_scoped() to simplify code.
> 
> No functional changes.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Andy: Keep original code because too much break. and I am working on more
> generally solution, so the whole function can be replaced.
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 1791c02a40ae1..f90e01301943c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -187,7 +187,6 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>  {
>  	struct v4l2_async_notifier *ntf = &rkisp1->notifier;
>  	struct fwnode_handle *fwnode = dev_fwnode(rkisp1->dev);
> -	struct fwnode_handle *ep;
>  	unsigned int index = 0;
>  	int ret = 0;
>  
> @@ -195,7 +194,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>  
>  	ntf->ops = &rkisp1_subdev_notifier_ops;
>  
> -	fwnode_graph_for_each_endpoint(fwnode, ep) {
> +	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>  		struct fwnode_handle *port;
>  		struct v4l2_fwnode_endpoint vep = { };
>  		struct rkisp1_sensor_async *rk_asd;
> @@ -286,7 +285,6 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>  	}
>  
>  	if (ret) {
> -		fwnode_handle_put(ep);
>  		v4l2_async_nf_cleanup(ntf);
>  		return ret;
>  	}

-- 
Regards,

Laurent Pinchart

