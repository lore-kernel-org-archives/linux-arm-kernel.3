Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805D1D75E29
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pf+pjVRx2zfoFHNdWaqAWPB37bdtznUkTMFag3i3yUw=; b=jHD+L1Zc/4O0YayODmH2Q8c6Bb
	HcKx3o2hOdaX1V56AVSSsdJEXCi2bqj3K8J9dNMNjSjaJ1HklhZWWG/9ALzk6VyHMqaoIenNQFdaA
	iZodaRFev2ord3OrqUDTfevcKdGM//bQEPLAhvJuAEM7LPAoCR0I+I4/IME5bcoGoLh/GKUy/6t/l
	J3JihxR7MK2kqtgaj+q7TKZgUNENioZ+Tb2TEzBnDWzgyI9nsMv964tVIzoD7hoKid+pkE1yYshL5
	GnEpwb6GXAg4raah+SuQiic8Yi9H95e2nEHj+DbKNPBBnHTndsA9IGk2AtLhrwgykuYX3O5YFuXyE
	oqwkk5JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERiQ-00000002LoM-2jse;
	Fri, 22 Nov 2024 11:20:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERel-00000002L9B-2sCC;
	Fri, 22 Nov 2024 11:17:00 +0000
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F8054C9;
	Fri, 22 Nov 2024 12:16:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732274198;
	bh=NVK6/CsUYwiqYc0OPINVnd5BflobHg/wmw5JJWAnOoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oaqu1ELiiNPLnKRxxPoLzabtNZZaoIGchzZjiBmDBmYzHpKkE1HpOSQFAXHWa5JBK
	 0pTnp1dRar/jTin5ZbKlo7Apv5E2P+IMxPgT6oheT6QzD4tBiSD3wdQEZt4uGW8SC6
	 o7xgUqHOw/yhr/rB6QyIt7lPgsg/IKMzOOjGdMdY=
Date: Fri, 22 Nov 2024 12:16:54 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jacopo.mondi@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 2/5] drivers: media: bcm2835-unicam: Allow setting of
 unpacked formats
Message-ID: <ax22djd5jqiqsjjzl7qmfajpfvyryqwmmfeufwx6kh3orehimq@2kq4jriiboye>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-3-naush@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122084152.1841419-3-naush@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_031659_858983_EAA8E634 
X-CRM114-Status: GOOD (  14.74  )
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

Hi Naush

On Fri, Nov 22, 2024 at 08:41:49AM +0000, Naushir Patuck wrote:
> When matching formats via try_fmt/set_fmt ioctls, test for the unpacked
> formats as well as packed formats. This allows userland clients setup
> unpacking to 16-bits from the 10/12/14-packed CSI2 formats.
>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 36fb186a0421..d573d4d89881 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -547,7 +547,8 @@ unicam_find_format_by_fourcc(u32 fourcc, u32 pad)
>  	}
>
>  	for (i = 0; i < num_formats; ++i) {
> -		if (formats[i].fourcc == fourcc)
> +		if (formats[i].fourcc == fourcc ||
> +		    formats[i].unpacked_fourcc == fourcc)
>  			return &formats[i];
>  	}
>
> --
> 2.34.1
>
>

