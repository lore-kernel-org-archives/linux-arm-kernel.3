Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2FBCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SG9cWBSZb9cdd+VlAraK/YpIY6mnUEYNs9cGzZP020I=; b=r/89isyELnH3RXEAF26RmIjVow
	1hYjbqGSwEUU/+6Y16mNOKNqyvCXsZMsiSq7ym4/QeZfG2uh+V/eMoqEyaLZjhFRHH7mk3Vsr4M6f
	suc2Gj3NnJwhdx64eT+4OH6eNrtmDwQYSvf9YjJYeNQmCl1yBj/61Vtthojst7lLNWzF3JV0pz9hC
	jCXgtQLiEdHB8MU50M0wfEw7sctsg8tyEIampe14yIMiuOx4UwHdwMhQhxtus/fKnXk0Y6uN0adP6
	BKwWGp/nheGOBZ8dqU8f1g9djF0I7AS1l/vf4qMXeY1RaEvuocDUjM36MtwY7y5Dkt7/+xGr9XF7+
	3EKgqGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfFT-00000004TGY-19i1;
	Wed, 20 May 2026 11:38:03 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfFP-00000004TFV-0CvQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 11:38:01 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260520113753euoutp02ea9765547154aedae8a8c9a7fdf022eb~xQxJEw4Ed2401224012euoutp02a
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 11:37:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260520113753euoutp02ea9765547154aedae8a8c9a7fdf022eb~xQxJEw4Ed2401224012euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779277073;
	bh=SG9cWBSZb9cdd+VlAraK/YpIY6mnUEYNs9cGzZP020I=;
	h=Date:Subject:To:From:In-Reply-To:References:From;
	b=TLbV+TrO0ve40xVIbU3CDLvlCx/euTpF2uyKURmcl7945pCSrJLNAHIZu2cNxBstE
	 4OJabsrUUEsqWE9pgcEul8y4Qn/ucg3UDRrV4Z0PaTOOZ9mF+I+/RjM1mKh2UAUbD+
	 +5bg40zPnUetqiE+gXa/02mbU6pfUQ7vT1RCpug8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260520113753eucas1p2c43f91f695c1c83ec66e640e0ab08243~xQxIwuV303060030600eucas1p2g;
	Wed, 20 May 2026 11:37:53 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260520113752eusmtip1e23f1848fcf7dc1931f89596120192a4~xQxIb8m6J1923419234eusmtip1t;
	Wed, 20 May 2026 11:37:52 +0000 (GMT)
Message-ID: <38f2ff7f-ee5b-44e8-972b-107b73dccd31@samsung.com>
Date: Wed, 20 May 2026 13:37:52 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] media: s5p-mfc: avoid double free on video register
 failure
To: Guangshuo Li <lgs201920130244@gmail.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260518130929.1003652-1-lgs201920130244@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260520113753eucas1p2c43f91f695c1c83ec66e640e0ab08243
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260518130946eucas1p1a8e6673355aa1b2f7bb35f9070f289ce
X-EPHeader: CA
X-CMS-RootMailID: 20260518130946eucas1p1a8e6673355aa1b2f7bb35f9070f289ce
References: <CGME20260518130946eucas1p1a8e6673355aa1b2f7bb35f9070f289ce@eucas1p1.samsung.com>
	<20260518130929.1003652-1-lgs201920130244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_043759_692868_B4FEBF10 
X-CRM114-Status: GOOD (  20.01  )
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

On 18.05.2026 15:09, Guangshuo Li wrote:
> s5p_mfc_probe() allocates video_device instances for both the decoder
> and encoder and releases them from the probe error paths if
> video_register_device() fails.
>
> This can double free a video_device when __video_register_device()
> reaches device_register() and that call fails:
>
>   video_register_device()
>     -> __video_register_device()
>        -> device_register() fails
>           -> put_device(&vdev->dev)
>              -> v4l2_device_release()
>                 -> vdev->release(vdev)
>                    -> video_device_release(vdev)
>
>   s5p_mfc_probe()
>     -> err_dec_reg or err_enc_reg
>        -> video_device_release(vdev)
>
> Use video_device_release_empty() while registering the decoder and encoder
> video devices so that registration failure paths do not free them through
> vdev->release(). s5p_mfc_probe() then releases each video_device exactly
> once from its error path. Restore video_device_release() after successful
> registration so the registered devices keep their normal lifetime
> handling.
>
> This issue was found by a static analysis tool I am developing.
>
> Fixes: d0ce898c39bf ("[media] s5p-mfc: Replaced commas with semicolons")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
Frankly speaking I don't like this dancing with video_device_release_empty() and
video_device_release(). I would rather make video_device struct a part of device
state and use common release function.

> ---
>  drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> index 32eb402d439c..75abb0a8b7a9 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> @@ -1376,7 +1376,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
>  	}
>  	vfd->fops	= &s5p_mfc_fops;
>  	vfd->ioctl_ops	= get_dec_v4l2_ioctl_ops();
> -	vfd->release	= video_device_release;
> +	vfd->release	= video_device_release_empty;
>  	vfd->lock	= &dev->mfc_mutex;
>  	vfd->v4l2_dev	= &dev->v4l2_dev;
>  	vfd->vfl_dir	= VFL_DIR_M2M;
> @@ -1395,7 +1395,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
>  	}
>  	vfd->fops	= &s5p_mfc_fops;
>  	vfd->ioctl_ops	= get_enc_v4l2_ioctl_ops();
> -	vfd->release	= video_device_release;
> +	vfd->release	= video_device_release_empty;
>  	vfd->lock	= &dev->mfc_mutex;
>  	vfd->v4l2_dev	= &dev->v4l2_dev;
>  	vfd->vfl_dir	= VFL_DIR_M2M;
> @@ -1416,6 +1416,8 @@ static int s5p_mfc_probe(struct platform_device *pdev)
>  		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
>  		goto err_dec_reg;
>  	}
> +
> +	dev->vfd_dec->release = video_device_release;
>  	v4l2_info(&dev->v4l2_dev,
>  		  "decoder registered as /dev/video%d\n", dev->vfd_dec->num);
>  
> @@ -1424,6 +1426,8 @@ static int s5p_mfc_probe(struct platform_device *pdev)
>  		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
>  		goto err_enc_reg;
>  	}
> +
> +	dev->vfd_enc->release = video_device_release;
>  	v4l2_info(&dev->v4l2_dev,
>  		  "encoder registered as /dev/video%d\n", dev->vfd_enc->num);
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


