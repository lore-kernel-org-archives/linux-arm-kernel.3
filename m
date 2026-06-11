Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B486CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 06:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Uq0BRqmbq18//RGzp9MNbSv0I/ZSh0cbswuoceC+fk=; b=bAnYfsGHYS8yWBvXjUcaNbh7f5
	gQObfdNzLjidcfHJrRKQL+RDx6pUnZUlOzCfZiSF+KExa+yi3k/m6TdQpeA3/f0F/qoV2N9nxrsru
	ay5PLCenvL5Nh5E51SwRV0YmtCYof7hIWCaXDYgFGWBf7aBUlr0IEbRfxl7tiTv16F39lcmVw1UOC
	YcwAMx7LEOT+mPrSM1ubLFJ3+vd2ETyyO75xB/how9yONYLwSpScUqn4+bVvCKkFOLhxn81Hkd7+g
	W2/S4hHXw9bOU2K+7hN2k4Xv7UWre2fimkPHnev4qQ8kAhCufm3fheVfZXafNleMN9lbBvlW/1cz9
	1Qe0U+tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZG1-00000008pi9-2k9x;
	Thu, 11 Jun 2026 06:51:17 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZFy-00000008phK-3hUU;
	Thu, 11 Jun 2026 06:51:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09B5C3F6CB;
	Thu, 11 Jun 2026 06:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1781160667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Uq0BRqmbq18//RGzp9MNbSv0I/ZSh0cbswuoceC+fk=;
	b=ROm1fvS1dHwc7yD4AhVaXyPqF8H23bEv52OsVLFlWpAnTdroJyZ/AR5cDcp3tXSmx/etUI
	/r4YkrgJ3PnHaVWx0XouQUXbDWCqVADcamcFp4qW4rB3N0WNINgWDAowOkNQHIaf+C6b20
	svwB1OZ4bYDTR89ReA1Fpd8mgw160N9zRAF3XOi9D7DZ91fONLV8iPoPiMuZzb9ZLoMnJI
	LafDsgkxZPqtomuEK5Hujcgv109F3GGUMoKrk1cOyrwf247Fq8AzepmH1ZA52zFEhIwLbh
	++9x/8NFYg/1FhqQJyLYWgTTMUiZpvnAIh4PSsdFGch3L4qjN1tRQYC0w8heKA==
Message-ID: <b549ea8a-76cc-4a7a-bab6-710fddeaeebd@yoseli.org>
Date: Thu, 11 Jun 2026 08:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: bcm2835-unicam: Fix querycap multiple caps
To: Eugen Hristev <ehristev@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Naushir Patuck <naush@raspberrypi.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
Content-Language: fr-FR, en-US, en-GB
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTGn5wHXK1VYWY8unJ7pC8r27C+e1eBVncIQmL0NGz/4mZdGeqBFX705gEgXmLdXnHC3S5ttEVNfp1gfXfdH4eM347xOyJxbMqD6/89/wGoOWtQXxgpoOr2bJi9qN7bswAN4ojWPsuHqmVilsUSXkSJYPlAoLAp/KvbQbYSxC/KGzEGXWPeyABXvD8566W41PUhvVFXJXmAK8xgaHbUfzA0DFyr5rpRdI1iepTMloTOJmg1D7a08DWMhpzSAkNAPdOyYWKnfS0i+tMhJbarTV1OSb1d2bqCqGckxzlbmmAjtG7sFY2z+eZbTmQqS8+3qRL6Fl+fENvyV/cwMC8n3csvgT3HytwqnxbopGsnv6VTX/zp3Ewdw4QCxJRXICsp9CjdnLoi9MKKVAmn6QeN/ETrfQCzXxSPzHB/zW6fisNEDqxiR9r+zVSTawf5oLn3NlzQCXVTQT+liHkGdf0r8BChAwvyDNm5lO6YTJtlHWp1mEXJkxbYVn1SgWAkoHGVGhVz83bI+HnQwobb0JrD43Wvg65m2eqxw754BNMNNW+Rnmc3gJENfTC84ZFsk43LmaDGJ2bzEt0fR507TVAeb/GzY27R4G6UQ6YjPdIfZ1PeLhz/zBZo8HPKlNk4N/e2yayPAQT6Cv4ze3mhLveD74+kun+EaKqXuDaCtoQQpbSADtw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_235115_128836_4FC9A415 
X-CRM114-Status: GOOD (  18.31  )
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

Thank you for the patch.

Two issues with this one, I'm afraid.

Le 11/06/2026 à 08:09, Eugen Hristev a écrit :
> The unicam exposes two video nodes, one for image, another for metadata.
> Querycap should return the right caps for the respective node, not both.
> 
> video0:
> 
> Capabilities     : 0xa4200001
>          Video Capture
>          I/O MC
>          Streaming
>          Extended Pix Format
>          Device Capabilities
> Device Caps      : 0x24200001
>          Video Capture
>          I/O MC
>          Streaming
>          Extended Pix Format
> 
> video1:
> 
> Capabilities     : 0xa4a00000
>          Metadata Capture
>          I/O MC
>          Streaming
>          Extended Pix Format
>          Device Capabilities
> Device Caps      : 0x24a00000
>          Metadata Capture
>          I/O MC
>          Streaming
>          Extended Pix Format
> 
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> ---
>   drivers/media/platform/broadcom/bcm2835-unicam.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..4bf36ce80047 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -1833,7 +1833,10 @@ static int unicam_querycap(struct file *file, void *priv,
>   	strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
>   	strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
>   
> -	cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE;
> +	if (is_image_node(node))

First, it does not compile, as node is not declared here.
'struct unicam_node *node = video_drvdata(file);' would be needed.

> +		cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE;
> +	else
> +		cap->capabilities |= V4L2_CAP_META_CAPTURE;
>   
>   	return 0;
>   }
> 

Second, and more important,  I don't think the current behaviour is a bug.
Documentation/userspace-api/media/v4l/vidioc-querycap.rst states about 
the 'capabilities' field:

"The capabilities field should contain a union of all capabilities 
available around the several V4L2 devices exported to userspace.
For all those devices the capabilities field returns the same set of 
capabilities."

Per-node differentiation is the job of 'device_caps', which unicam
already sets correctly when registering each video device (your
v4l2-ctl output shows the Device Caps are already right).

So this looks like working as intended to me, and the patch should be
dropped.

Thanks,
JM

> ---
> base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
> change-id: 20260611-bcmpiqcap-f893a9ea2da9
> 
> Best regards,
> --
> Eugen Hristev <ehristev@kernel.org>
> 


