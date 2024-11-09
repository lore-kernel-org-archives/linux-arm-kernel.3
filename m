Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8076BD5E379
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 17:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ID0U4v8IJwDheWM1GMjMt6YDBO95xzj8yHE+CefJD7M=; b=WdNBIJAupQbONDQUEksEbkDit9
	nUPh2kw8vvsrLeudt/NHHEpJfbo2+TGXRDs5LXIj+UGdDpNU/ju4yUra8JAa9r74aByOBlry9bLST
	rIXjkhlNGE4zrJR5xikvO/19xZ5GS/tOYZ7tIESzNdfKHPgdhoVU2j0nUrBewGe0Z7JcZ175OTfKy
	xUWjZBc/4Rs1SjNzS4xYRQiuzCK/dp9GJzqxoFc1lZMKRYtfauWvdd6vYmWxwqGvYRrz4BWfK90rd
	3PT0D7kytZbYIdeD5u2BxR51qkjunpA/WKTSHICXtxZAUCwOZ9faJO4tWkup0AcnhjQR/21a5cvDg
	f1L/MLBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9pRe-0000000DkHb-1qq6;
	Sat, 09 Nov 2024 17:40:22 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9pOl-0000000Dk1S-3WJd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 17:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1731173829; x=1731778629; i=wahrenst@gmx.net;
	bh=ID0U4v8IJwDheWM1GMjMt6YDBO95xzj8yHE+CefJD7M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=koVjcZPAN3TgN0vh/aNhAnQeeko+NkgKFJ4h1F4VtB8yBykyhdHKYHV+tU/tMiZ9
	 tlB9xVpOcO1GutBKUxVA1sY96xww15lbA18nMLnD5QUYIzSUJ9CNd+xnaz3SMXTg7
	 z5DAAWZhHlt4fh+L/OjI98iWmSSOD/cCesYnRhJOwHsA5KdAsMbQ4DKsQ4PBn+oZx
	 Hzfxfwrvve8xeDUAhY4MzVNml7KLvDmkrnnHDuD8kMmGmHiapmWdkLoXD8SrtydZC
	 J4ZktRIFIgZhaWTGsGc754NV+yv+yxHXDY+2KcHYK2a2yptXaXi2agTTJLHfGFuzM
	 JOTecv9qMEEvoqwcbQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfUe-1syr2z1s5Y-0097Bl; Sat, 09
 Nov 2024 18:37:09 +0100
Message-ID: <83a0282c-0263-46ba-8eba-78f6a81e7c98@gmx.net>
Date: Sat, 9 Nov 2024 18:37:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 2/9] dmaengine: bcm2835-dma: add suspend/resume pm
 support
To: Russell King <linux@armlinux.org.uk>, Lukas Wunner <lukas@wunner.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: Peter Robinson <pbrobinson@gmail.com>, "Ivan T . Ivanov"
 <iivanov@suse.de>, linux-arm-kernel@lists.infradead.org,
 Ulf Hansson <ulf.hansson@linaro.org>, kernel-list@raspberrypi.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Minas Harutyunyan <hminas@synopsys.com>,
 bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org
References: <20241025103621.4780-1-wahrenst@gmx.net>
 <20241025103621.4780-3-wahrenst@gmx.net>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241025103621.4780-3-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hN71PDERMZiyLGnEBo4kzNeGRlc5kNE3RE8MVnKiOzxG8c1bGzU
 +go8AsrMPQugllh1JPxfyvkavCbZpNtALQi2JaZW1jrV1lYo03gLh0t/tS2SoAI/bDQKmW3
 DdKWANT5sJm8Gyt2TuMUt0QEHrnmeqU1KGb145iQVlIVG9pddn+PPicibpIXDhYA/O8yDiK
 cBnHsrnKR37Xz1+5GPWRg==
UI-OutboundReport: notjunk:1;M01:P0:LUbR2To7WhQ=;ZEsSZRvxT7/lz0VEiqxCjoC1+0h
 4KFN2gZhUGHQpVKGN1Ks1Xos/+D2k6uhiF9v01JDs3Ov9unVOR632WPrldf3A9pauhU+nr9eh
 t1OexOzAH+JCIotdNQMlIgiV+FDmuX0e/9yfkUDfGdgIRnuy8WPZoz8bzKdNn6y802PS54gTt
 zcBmmTAmQq9OlkUe9TvwaNNeMighOIhiyHLy8SjkHopw9Vf8r1Hof1kLQDhiwMmqs7MLlpswa
 h1YrV1nSPYepF3MGZ15disZWtKE8PGqN5CyMDBdqJ2yQArP7LzmGRAnGt0Xl3r8mwA2gtlxLl
 E32MnPLxNhkz9tcJJ1lQx07TvdKdDj79ynm6i3UTT0S3xq0bMIlttlaeTupwFSCeeLLr45QcZ
 /LBriAnID8R3VJAQT8Ht7AUvVRpregZLNbsEm548eoYsFdU3x+U9gU/WTduEc1/lH8fU9yTBe
 r+qd1sXRlSfyv7Z4WDeQU/stPDdrb3aP3vJGZQhBvyP/9kaxbhMerh7+IuyeeymwzlyvXQL/A
 fesWLW4tVgsQPRT1/hmUWKKQ37BJUxuQEUGK/RjHMLTRKNpZlj7/3pHYtvU4fNQ+DnvJbhilT
 X8C8HxTA8k4ycQ7Mjfr2luOKquBPkSb51qOMSPjsSV0qMylqklOuV1EELzklXBmvvv084jMG9
 AyBk8NFSm21Ufuf8Tpo6UnkXPGn1Z7blB0/7NlCKUtoODr0QSGQVbejSyCYHtZWO0SyzutvS+
 KEyMeLACCXnnjZi0bbEcD1jiY0EzuDwkjchooLE2Pf9FkRKb4EpHKNN2u2u5ZpTQiyp9lia/1
 TpE8gtz3MKLj90BbMY8wUeX88aFWG1/c3XndRfKf5MtTCB70gQgpcZzolQXygHmDOQNRI4YSN
 KwmuxcrdGUltKdMouqKebAH44mwJsXnokO/1BB2xkJYgre0YAPudawPQl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_093724_273325_10A2C838 
X-CRM114-Status: GOOD (  20.19  )
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

Am 25.10.24 um 12:36 schrieb Stefan Wahren:
> bcm2835-dma provides the service to others, so it should
> suspend late and resume early.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Since there wasn't any feedback for this patch, i want to send a gentle
ping ...

Regards

> ---
>   drivers/dma/bcm2835-dma.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
>
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index e1b92b4d7b05..647dda9f3376 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -875,6 +875,35 @@ static struct dma_chan *bcm2835_dma_xlate(struct of=
_phandle_args *spec,
>   	return chan;
>   }
>
> +static int bcm2835_dma_suspend_late(struct device *dev)
> +{
> +	struct bcm2835_dmadev *od =3D dev_get_drvdata(dev);
> +	struct bcm2835_chan *c, *next;
> +
> +	list_for_each_entry_safe(c, next, &od->ddev.channels,
> +				 vc.chan.device_node) {
> +		void __iomem *chan_base =3D c->chan_base;
> +
> +		if (readl(chan_base + BCM2835_DMA_ADDR)) {
> +			dev_warn(dev, "Suspend is prevented by chan %d\n",
> +				 c->ch);
> +			return -EBUSY;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int bcm2835_dma_resume_early(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops bcm2835_dma_pm_ops =3D {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(bcm2835_dma_suspend_late,
> +				     bcm2835_dma_resume_early)
> +};
> +
>   static int bcm2835_dma_probe(struct platform_device *pdev)
>   {
>   	struct bcm2835_dmadev *od;
> @@ -1033,6 +1062,7 @@ static struct platform_driver bcm2835_dma_driver =
=3D {
>   	.driver =3D {
>   		.name =3D "bcm2835-dma",
>   		.of_match_table =3D of_match_ptr(bcm2835_dma_of_match),
> +		.pm =3D pm_ptr(&bcm2835_dma_pm_ops),
>   	},
>   };
>
> --
> 2.34.1
>

