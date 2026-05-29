Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF2ECD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 05:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BttzE/fX7kpFiyMECta2BQYA4zESLmMgKfBxXAnML3A=; b=czyGRCh74NFpYqjApG1roL35mX
	nOn5g+9XtQDPf9nn3uxSh06X1KJHhoNXVnmYPhhXEZKnenxosPTPMZCtfaFCprYBpPxHeqFpHIfs8
	C82Lq9TK5uVbmEn4Br7f05PoRIXx+/o0rogLZtmOtp9g00pYssYQjhFDkHr+PEXh3kbTCZXuD4Phq
	/Z30idioUL/x6qqWKffEMl4cabVB6Rs3mJVDmGATe+4Acvpe5nh1ydUOt+9hYQIIbZeC2ry8gQzY1
	Xbv+uVe/ogIMQYeEGV96SEkbBRqT4CXvL+sXDXC9u7cG58DwZ1xwJwoSHLQSfRc209z6xp6+gcPej
	ol6MzXZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSpWR-00000006koD-3BcV;
	Fri, 29 May 2026 05:12:39 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSpWO-00000006knm-0QMp;
	Fri, 29 May 2026 05:12:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 740FF3EC79;
	Fri, 29 May 2026 05:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1780031549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BttzE/fX7kpFiyMECta2BQYA4zESLmMgKfBxXAnML3A=;
	b=QTaGrf2pdfrCoV6beJM+TI/zonhCWkPRlcMkodOdAkqZvKCMaPseNOF9hav1WXK0WmGbYD
	Q1jI8xiOEAieDkfiOK/oiCxJDDEZP/Dixi3udWL/pgmmdE5zkS/J1THwSKNDoCTHa5lGWD
	6zXg3AQZf18AF1FzzAGdkN9k6F6ePEegGN8Lf7JLqEozVbzjG6mk/VPwC5qwJ3utbwFWI1
	9OThQzMCLLk/HZp9i7Q5K2YfBRZaH436+mvn8iTUNQ+fnfqxIjPUdHmxRBE3Fr+dsOIeuT
	0EGqyVcbSASU+5VgbraZb3aUY89oTWAqUrrBl1JbZicBEoSxWtgFevn1wE85wQ==
Message-ID: <1ddf8baa-47db-4b9d-9df6-a6075bc94593@yoseli.org>
Date: Fri, 29 May 2026 07:12:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: bcm2835-unicam: Fix log status runtime access
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
References: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
Content-Language: fr-FR, en-US, en-GB
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Cause: dmFkZTFP7v61qAXaDtMJlaPuR+iahK4NnAc5ChdxPN86ogDXQpgj7OFiRtQMgoE0rp8UQzVA9VRBBpOtdM4wiZrwtmFajBw1oHW9V7FcITTffacofi4KIQYotDKuBBXRb1V4OI7LKdgHnWdhls6wf8OBPV1pjQwk3g4G3KSdU4FgelGlv95JAnPOAxu5t7e7RSFosFzOrUpIURGPaH5DwBAhxvxtPVOQdue5Cpq5Q8V3/4ZKLV911UhBTRrwG+WrXqpWq13xJpYX0fRd1h5n5oQ1Bt4hDFx2qCNUcRP2A/cPhYl6yHjExZUkdb6Hf9TeiPCVPIz5nhbNcLoTWx4OTN6Y7k8Xnb5ErLxZJEYMOgOLIH0tJsskaCpRxJecjyVk7XlJVF3Z1JFhs5390Zz6OvI19nXRlHYND8cmQPDR1QUtbA28JTmXoP3GKUYei8oHPyX6kE9+anGwZTn3JI+1+yeOgxrX310gshlTP6QfzpFoFNSVpyEKAzyk0yDgogIye4qyXuPSebyMzE3S7BRDumiOFAJMOyn+aHB8hAvpX/0vaKkr6PNYMTmq4DAh8dKlT7RGxuZF4waEyx6LeSwWfl/7+d/69O5BssSYwNcZ0cAYe+ize5vUlk2RILlgAYkj9hTwP5etaiNqdOLX8OsffT0/S4PDMUeRp4wJ+bK6yCZfstoz0Q
X-GND-State: clean
X-GND-Score: -100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_221236_332336_2D13E0FE 
X-CRM114-Status: GOOD (  19.73  )
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

Le 22/05/2026 à 17:28, Eugen Hristev a écrit :
> When requesting log status, the block might be powered off, but registers
> are being read.
> Avoid reading the registers if the device is not resumed, thus also avoid
> powering up the device just for log status.
> 
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> ---
> Changes in v2:
> - changed to use pm_runtime_get_if_active()
> - add corresponding put()
> - Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045@kernel.org
> 
> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Florian Fainelli <florian.fainelli@broadcom.com>
> To: Ray Jui <rjui@broadcom.com>
> To: Scott Branden <sbranden@broadcom.com>
> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> To: Sakari Ailus <sakari.ailus@linux.intel.com>
> To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Hans Verkuil <hverkuil@kernel.org>
> To: Naushir Patuck <naush@raspberrypi.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   drivers/media/platform/broadcom/bcm2835-unicam.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..93815b8ab930 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2052,6 +2052,13 @@ static int unicam_log_status(struct file *file, void *fh)
>   		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
>   	dev_info(unicam->dev, "V4L2 format:         %08x\n",
>   		 node->fmt.fmt.pix.pixelformat);
> +
> +	if (!pm_runtime_get_if_active(unicam->dev)) {

Well, if I am picky I would say that pm_runtime_get_if_active() can 
return -EINVAL if runtime PM is disabled for the device. It should then 
be tested against '<= 0' ?

I suppose this should not happen really often, as very few drivers 
actually test this case...

With or without this small change:
Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Thanks,
JM

> +		dev_info(unicam->dev,
> +			 "Live data N/A due to device inactive\n");
> +		return 0;
> +	}
> +
>   	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
>   	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
>   		 unicam_get_field(reg, UNICAM_PUM_MASK),
> @@ -2065,6 +2072,8 @@ static int unicam_log_status(struct file *file, void *fh)
>   	dev_info(unicam->dev, "Write pointer:       %08x\n",
>   		 unicam_reg_read(unicam, UNICAM_IBWP));
>   
> +	pm_runtime_put(unicam->dev);
> +
>   	return 0;
>   }
>   
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260521-bcmpipm-6c578e73239c
> 
> Best regards,
> --
> Eugen Hristev <ehristev@kernel.org>
> 


