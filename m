Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B753CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 08:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uS43xLoRfhTODKTKwo15Svv0trKosxXMBeI5sE6g/Iw=; b=1A0kL2Xmd7VRQ2oa3GlPzXxrOv
	SMZouk5NHCw8wdhKDC9/3g1cNvq+G5LXr/oATuNSqJsykDcKy/wIQAucfFGkplBnSWTeSS39VlL0O
	mbd6Rbr24DzoXd00YL89VBodkhaI+DS66ee3JEgdT9W3nVtv2rsP7uJqy9kNnb1CrWikNConRNL1N
	tcWsnuKmOYuQQMJSsoySCXByKExtnqi6seg2kSv+AfgFP1aANTjBRGONJgptHIAh9B8Q2a5dd/Jos
	ODJC2Tb3GdmSf5aThXfOx6b62GDhiIOiZLbtEwd6dl85x8d5Jz2G/RL+//7AGbCrSFiDjwsAtKgDN
	kNCnke7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLIb-0000000ACin-0EOW;
	Fri, 22 May 2026 08:32:05 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLIX-0000000AChl-2qyb;
	Fri, 22 May 2026 08:32:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E574E3E949;
	Fri, 22 May 2026 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1779438714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uS43xLoRfhTODKTKwo15Svv0trKosxXMBeI5sE6g/Iw=;
	b=ZkEk9Nwi9jCbB1sSuaSyR93+XO/vzUoyLiAGubnfT2HH6jNXeFpDvLujh2m9pmeaBxFZm2
	UJyRCW5JDM6A9chxo/kwSLbrougQGj2XbEsf6YINjOQTnHYgp/oUcxxyG0yFv/ZWuO2g06
	GY4t4mDzcjcVmEtxuZToS07klzxS65JQdNyYHXLB+MSlvdpdcSI/1qHVzMGs/F2INtHvuk
	5EKA7Zh4Vkg5wcSoqdT85ZS/EdQiK92Sn4z5F72VVx1uARND4Dc1/BShL6jjKD67iGlZ9R
	+JOGbrAIYkcn4rLdXlKZFEg7vqIDoY9I8YhoIZ7rTXQRRpoAOmEtJQNTcPm2Hw==
Message-ID: <4d7deb19-d384-497e-8139-c977a9f3679d@yoseli.org>
Date: Fri, 22 May 2026 10:31:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: bcm2835-unicam: Fix log status runtime access
To: Eugen Hristev <ehristev@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260521-bcmpipm-v1-1-3eba88d88045@kernel.org>
Content-Language: fr-FR, en-US, en-GB
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20260521-bcmpipm-v1-1-3eba88d88045@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Score: -100
X-GND-Cause: dmFkZTFFsxZdjDYbGI/O5qas+S55Zs7dmoPxVtmp+czXqra4L2sIv8wbpaqEtn1bOdK8KIN2ag1M2Q3dKtTl6m6zi8wlIyQrykWZEM4aYNI25pd/9DorWT+QpvMcEZc0jjss4u4gDMz8fCc+WAYO8okFbwrlALjGvVzEe7zo6X6WNQMqcR4FWl52A1LvT3nIiQLHNZJ0uTzeKwDQopHDwUV9nocaPfGc/zWA/QdiIBibW+qj6GkJSfKIryIbWEJcu28gmS7LvHKWEQ+1LKh9PVc1fITB1iPcgUSxZrAZm8yQGUCvnTpg7zfjUQliYzawmk1GAOfe7mI9UpE4aVdV1CvdMrYzG3sRPfHYzQwuhIH9XK6a3u12kc94cutk+nBxm7f9P2vbyBvHO6b58ZLAfNZ3HzaJuaoYxFeCsutS8PyxcW4l5ykBUIX1shlvsDsVEBGWjhpKyqP8JyrV7PeEOsDJ0B2JQhEO4AOU33va4etuD1D3nZtFXgjVM5Z4xqhUMDufUqPBE1mr1cKZV74PuC9nYjHbBFALavonlq38lBJh0+gUowbmwMV9vBUOcbvMYgt78nACsTTGYRIJGIWlVZk/1FE+oWWbN5Taz5ANT1Et4k79BxeTfYV6xsjNgEj2NCacwVKO9y/Aw5tfACN1DyQbGkVzOD+7tT0HjJ3XQQYc5X037A
X-GND-State: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_013201_880977_C931B4C4 
X-CRM114-Status: GOOD (  18.38  )
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

Hi Eugen,

Thanks for the fix, the issue is real, but I think the patch leaks a 
runtime PM reference.

Le 21/05/2026 à 20:09, Eugen Hristev a écrit :
> When requesting log status, the block might be powered
> off, but registers are being read.
> Avoid reading the registers if the device is not
> resumed, thus also avoid powering up the device just
> for log status.
> 
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> ---
>   drivers/media/platform/broadcom/bcm2835-unicam.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..818694f007e2 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2052,6 +2052,10 @@ static int unicam_log_status(struct file *file, void *fh)
>   		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
>   	dev_info(unicam->dev, "V4L2 format:         %08x\n",
>   		 node->fmt.fmt.pix.pixelformat);
> +
> +	if (!pm_runtime_get_if_in_use(unicam->dev))
> +		return 0;
> +

pm_runtime_get_if_in_use() returns 1 and increments the usage counter is 
active and in use.

I think we need to add:
pm_runtime_put(unicam->dev);

Just before the return 0;

BTW, we may miss a dev_info explaining why the live data is skipped when 
the device is suspended ?

Thanks,
JM

>   	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
>   	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
>   		 unicam_get_field(reg, UNICAM_PUM_MASK),
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260521-bcmpipm-6c578e73239c
> 
> Best regards,
> --
> Eugen Hristev <ehristev@kernel.org>
> 


