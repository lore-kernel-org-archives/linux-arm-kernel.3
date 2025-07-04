Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D0EC83F0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jj5JylNmFwfLTubOnUVLQb6eBqH+M0WGeYNzsak8L/Y=; b=DLXe4yix397SFMSUWNMWzuYL9Y
	+XD+gGaY3vlJvkhqj5MH3NpkNzW+hPlqWq0YHEP9IBDd7SlOdOUrYhF2FFg3gKjR0aghBWH4AFMF3
	9EhBF4XpLYm5a5Ff4LvRa7oMaYIxAJUo31CLe1rTh4OtKklqFueUuI+yJvTihQgl0lmPWnWkVSLSt
	0najqGiDEJhqa8fn67D+DQ7zqgAWw41XZdLElLLguIPueEF0uksOlQNwSGTP8PbsuUN0qUoSIQOI7
	Rh0EJAwBMyQM1sVr3Di6LKc01vljFfOpag2SkjgUIbgOw/hJSSpYB6S1YoDJIsTVorGyuLtnOdQvm
	GGrWGOOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeUT-0000000ECXc-3k9Z;
	Fri, 04 Jul 2025 11:22:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcDk-0000000DpLk-1N8P;
	Fri, 04 Jul 2025 08:56:37 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E1409667;
	Fri,  4 Jul 2025 10:56:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751619369;
	bh=y1j/5Cpk8bPb641kRnAZ7hwtcYIwzQznPTALWGJ9fVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/+JdCFcyFuFUjl0QTjLej9Xh05699NjSblVGkEA7NTpLykJbK7wfxC4CUjBACvZU
	 vcOGW37478l7BW/3U6xRbSAt7++pBYugym6uc+1NYHApNY6oCyads4kSY9QdMAFwUi
	 D2owJvVj3WhBx3sQowso2QN7Oy4LeQlR1UdwX6KY=
Date: Fri, 4 Jul 2025 11:56:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <mhecht73@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Matt Ranostay <matt@ranostay.sg>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Matthias Fend <matthias.fend@emfend.at>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 41/80] media: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <20250704085604.GC14736@pendragon.ideasonboard.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_015636_524133_C0B540B8 
X-CRM114-Status: GOOD (  17.62  )
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

Hi Sakari,

On Fri, Jul 04, 2025 at 10:54:31AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/media/i2c/alvium-csi2.c                          | 1 -
>  drivers/media/i2c/ccs/ccs-core.c                         | 4 ----
>  drivers/media/i2c/dw9768.c                               | 1 -
>  drivers/media/i2c/gc0308.c                               | 3 ---
>  drivers/media/i2c/gc2145.c                               | 3 ---
>  drivers/media/i2c/imx219.c                               | 2 --
>  drivers/media/i2c/imx283.c                               | 3 ---
>  drivers/media/i2c/imx290.c                               | 3 ---
>  drivers/media/i2c/imx296.c                               | 1 -
>  drivers/media/i2c/imx415.c                               | 1 -
>  drivers/media/i2c/mt9m114.c                              | 6 ------
>  drivers/media/i2c/ov4689.c                               | 3 ---
>  drivers/media/i2c/ov5640.c                               | 4 ----
>  drivers/media/i2c/ov5645.c                               | 3 ---
>  drivers/media/i2c/ov64a40.c                              | 4 ----
>  drivers/media/i2c/ov8858.c                               | 2 --
>  drivers/media/i2c/st-mipid02.c                           | 2 --
>  drivers/media/i2c/tc358746.c                             | 5 -----
>  drivers/media/i2c/thp7312.c                              | 4 ----
>  drivers/media/i2c/vd55g1.c                               | 4 ----
>  drivers/media/i2c/vd56g3.c                               | 4 ----
>  drivers/media/i2c/video-i2c.c                            | 4 ----
>  drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 4 ----
>  drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 5 -----
>  drivers/media/platform/nvidia/tegra-vde/h264.c           | 2 --
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c        | 1 -
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c     | 2 --
>  drivers/media/platform/verisilicon/hantro_drv.c          | 1 -
>  drivers/media/rc/gpio-ir-recv.c                          | 1 -
>  29 files changed, 83 deletions(-)

[snip]

> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 487bcabb4a19..3316639b695e 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -788,7 +788,6 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>  	}
>  
>  	if (pm_status > 0) {
> -		pm_runtime_mark_last_busy(&client->dev);
>  		pm_runtime_put_autosuspend(&client->dev);
>  	}

You can now drop the curly braces.

>  

[snip]

> diff --git a/drivers/media/i2c/ov64a40.c b/drivers/media/i2c/ov64a40.c
> index a5da4fe47e0b..15912ecb8d26 100644
> --- a/drivers/media/i2c/ov64a40.c
> +++ b/drivers/media/i2c/ov64a40.c

[snip]

> @@ -3330,7 +3328,6 @@ static int ov64a40_set_ctrl(struct v4l2_ctrl *ctrl)
>  	}
>  
>  	if (pm_status > 0) {
> -		pm_runtime_mark_last_busy(ov64a40->dev);
>  		pm_runtime_put_autosuspend(ov64a40->dev);
>  	}

Same here.

>  

[snip]

> diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
> index bf6d8fa983bf..161f8919022c 100644
> --- a/drivers/media/rc/gpio-ir-recv.c
> +++ b/drivers/media/rc/gpio-ir-recv.c
> @@ -49,7 +49,6 @@ static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
>  		ir_raw_event_store_edge(gpio_dev->rcdev, val == 1);
>  
>  	if (pmdev) {
> -		pm_runtime_mark_last_busy(pmdev);
>  		pm_runtime_put_autosuspend(pmdev);
>  	}

And here too.

With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  

-- 
Regards,

Laurent Pinchart

