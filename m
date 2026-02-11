Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C44BEB597B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXjw/O+uX2CXVpNEfA/L/HJ33sI0vnH/Bk/UaN91F4Q=; b=l64yMJiXUrwVCD+2nb9lFDbSqv
	zd6mSvtza0d4myuVBXOr6dmFI33MT4Dl1MtSRhK+uiKmd5bfFfidLMzd38jLh5nDF5MFvrVKJ1muW
	8r71PR90POABi5UXsqJ0PBBacs8ZP4GOyiGyvKnWtv2ungqW+nGa5hkdXIga3/SsGPOi41UAR4aYa
	Yxy1aTSceav67eOe6RpdukrlJOoPPttkCEuKD43ITJJxkaPx3jSmalSCqRhCjqcXdGeHRz4dnb/pN
	hHtKg9AAh360NRnNIYUuBvYOHqFSxq9d06J86atn7auRmS5KKTlUPkahieHJyw0tuFyOo54uzcTlZ
	kNaUlj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq5Ns-00000000NSw-21UY;
	Wed, 11 Feb 2026 08:15:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq5Np-00000000NS7-1iJ4;
	Wed, 11 Feb 2026 08:15:39 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B1A5912D6;
	Wed, 11 Feb 2026 09:14:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770797684;
	bh=S9Nngd5Ci9bMCWrJoyP4sJg8P5P3CQre1ZbUDiRpvZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mGwYWPigmx0VdBS6cJ/3BU3eujbykhWplrGRhfHhbcS27MQWTDKnGAYvaa/+wyGpQ
	 h2M4jryw0SnLwAiD/H2tTUsrH3oZ1cuCLXx9vBh0ufkcRR5Xu9XgWeUGoMDUGzfFMM
	 Ny+RfNy4P9ShnDbMutXWAUEcZaH+fhfHo9G/eWJc=
Date: Wed, 11 Feb 2026 10:15:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: tomi.valkeinen@ideasonboard.com, kernel-list@raspberrypi.com,
	mchehab@kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, hverkuil@xs4all.nl,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rp1-cfe: Fix double-free on video device
 re-registration
Message-ID: <20260211081530.GB2553356@killaraus.ideasonboard.com>
References: <20260211034501.1815035-1-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211034501.1815035-1-xiaolei.wang@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_001537_912743_BF643FCC 
X-CRM114-Status: GOOD (  22.68  )
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

Hi Xiaolei,

On Wed, Feb 11, 2026 at 11:45:01AM +0800, Xiaolei Wang wrote:
> When a sensor driver is unloaded and reloaded (e.g., rmmod/insmod ov5647),
> the cfe_async_complete callback is invoked again, attempting to re-register
> video nodes that are still registered. This causes multiple issues:
> 
> 1. KASAN double-free in kfree_const when dev_set_name tries to free the
>    kobject name that was already freed during video_unregister_device
> 2. "tried to init an initialized object" warnings because the video_device
>    kobject is re-initialized before being fully released
> 
> Fix this by:
> - Adding a check in cfe_probe_complete() to skip nodes already in
>   NODE_REGISTERED state, preventing duplicate registration attempts
> - Implementing cfe_async_unbind() callback to properly clear the
>   source_sd pointer when the subdevice is unbound

I think a better fix would be to register video nodes at probe time, not
when sensors are bound.

> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 62dca76b468d..d3813c79316d 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -2152,6 +2152,9 @@ static int cfe_probe_complete(struct cfe_device *cfe)
>  	cfe->v4l2_dev.notify = cfe_notify;
>  
>  	for (unsigned int i = 0; i < NUM_NODES; i++) {
> +		if (check_state(cfe, NODE_REGISTERED, i))
> +			continue;
> +
>  		ret = cfe_register_node(cfe, i);
>  		if (ret) {
>  			cfe_err(cfe, "Unable to register video node %u.\n", i);
> @@ -2204,8 +2207,19 @@ static int cfe_async_complete(struct v4l2_async_notifier *notifier)
>  	return cfe_probe_complete(cfe);
>  }
>  
> +static void cfe_async_unbind(struct v4l2_async_notifier *notifier,
> +			     struct v4l2_subdev *subdev,
> +			     struct v4l2_async_connection *asd)
> +{
> +	struct cfe_device *cfe = to_cfe_device(notifier->v4l2_dev);
> +
> +	cfe->source_sd = NULL;
> +	cfe_info(cfe, "Unbinding subdev %s\n", subdev->name);
> +}
> +
>  static const struct v4l2_async_notifier_operations cfe_async_ops = {
>  	.bound = cfe_async_bound,
> +	.unbind = cfe_async_unbind,
>  	.complete = cfe_async_complete,
>  };
>  

-- 
Regards,

Laurent Pinchart

