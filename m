Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E60C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 08:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scJh8d+O+EnR5/uIkek0nD2hCc6IGYE1UTUEZv0y62o=; b=VluUNkn2ptftj64NY9N+f7DCet
	My/DQmUEAtMjG9ve52MJRAISMpdAPRkEVWZAlAyA6HiEhCymTGbKvGAP8bQv5c2DLpIzh+ytWzm+X
	zbJEr6XbCgRuRqXqe6GKm6mB7wS86TR7aTQNv0tkM5t5q53OzsHTaxuTH22MmJPMGC0Uy+Uv9bdEo
	2g+MWyh7B19ot3ru6GJmTwEep/Ml5uWt8xgqHGFpg7x/KE5PCdL/rifh/KRX8AmmYT7r1b3MlWUFb
	s6wqtr30iT6bBNn//Vmx8kt5i9dzPwixqnpIrzp1mjruyUbVWo8NUKZyVcBEdPk0PvkMXmEo1xcO+
	ZmgEAPvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzRS-0000000Fj1h-2COY;
	Fri, 13 Jun 2025 08:07:14 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzLO-0000000FiUG-3y44
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 08:01:00 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-4e7cf73ffb1so41203137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749801657; x=1750406457; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=scJh8d+O+EnR5/uIkek0nD2hCc6IGYE1UTUEZv0y62o=;
        b=VbRMxsgYr2T7dnv0ZNQ1bJ1q+ItTWufXs5RZvvRFhxYMBYOgk7cZje0d4Nn67s4yhS
         xWH3D0KMC4w9u8GE32ARnm/zb6bgn3tsManyYhRxC+rKxA6UbUKNcfWvQGPem7kgDpmc
         /LaYSRs/uqfVo0fajBPeByxFYBRqNIZk0q0XcKH1EAOV54oCkPpAZiEvfDCLpTcN/W0S
         anhdHn6Vik5w2K8c0NYHKvNWz3CYo+Jnp+PempSNuyYzeRXk4FX1JKHREKdrkoLjHwy2
         H1JXGD01XQYTtLhWFemRvT0Nc6sSPuJ0rotogsSvr9NFTOSfdhscs5GrKLgC8mbvNC+x
         MCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749801657; x=1750406457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scJh8d+O+EnR5/uIkek0nD2hCc6IGYE1UTUEZv0y62o=;
        b=FGYnEa/tin+YJQgccij3d5bBMSqNJTjKs+hZX27xUH+u4NHaArx78t9PIdpeuSVG7d
         U4R+pVFvIi0n1xVNniUIptVEkYJoWLSQp+LiN0DKyBnV/tZZxIdBt+l+B4noiTAyrfGk
         xmdyxvM8FCNp8LuNZgiXcGUAuay5l/6fk7azX2Y1FnlLrMhIAAh+y89weSFeTkbE3mBt
         d2NK9nS2BkOAbx/ax0oczUoOc7Y8pNdIch7dM3hzHw5n2Bd+cz6iikXIN05G635ux7U/
         +5Widk3pc9IUkFsp8AN1jLYlbTYIM4RwcsqRXltjEQex7j1hqIy91L+KSIkNpC+Q/lp1
         FW4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQrRPN2RDj4Y6CjCFAxJQmJV7a1iC4zozS4EPGYeCuHMxISkVmWSzCFNNnM/VUqMqYQhafdeTVBJl5zd7GUfpz@lists.infradead.org
X-Gm-Message-State: AOJu0YwmO0VNY1cz3/5k4LeHSv+FU/0RQh7uMMNJFS3aVVPKi/o7J4IS
	yCvwtuY+wRfU61jBO37vSxhXuWQn1X/rUVr7aUC1PHaZnjcQfVlEXREL6MtlcRzY3FPpiZpG0ph
	WsZbb1AxTbA2S0kUJuMl1U/Cm2mDm0+Jtbx9dg3z4sQ==
X-Gm-Gg: ASbGncuXzPBQYMQhHBWc5FOEGUDFlRp+OyyR5KLwbbZIrKIsktMgg2pSMsIp3g+5GAH
	irStumUcybXWbG/R7jP1PlzrygDmBVF/gKey2H7fumHvkRlkrngL2lLWbDdi/Vyy+vilGulaiZ+
	T4i+F0i8uu6dTT6vdZbpuJTZwj8FZBCE7BOkhihJ3i4V4=
X-Google-Smtp-Source: AGHT+IEZWUu8qgwgkkTm+CsEr8/FtKkNy57Yjq6xd1uwQZiobmrafqc2LqOzs6ELakL2gDMWs9lVgnozIjy/ssY7uWE=
X-Received: by 2002:a05:6102:80a8:b0:4cd:6339:36a1 with SMTP id
 ada2fe7eead31-4e7e360e5c2mr419047137.0.1749801657328; Fri, 13 Jun 2025
 01:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
 <20250606-pispbe-mainline-split-jobs-handling-v6-v7-1-46169f0622b7@ideasonboard.com>
In-Reply-To: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-1-46169f0622b7@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Fri, 13 Jun 2025 09:00:23 +0100
X-Gm-Features: AX0GCFskqlJzEMkB9GaVu-uc5hw9nEwjPjnaSfW8bP-WdW4AyG8urU3mzC4FJLI
Message-ID: <CAEmqJPp+jG7tX+urwPdCs=Nxi54v4j0_hxaeYUB6GUzB6F3JCg@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] media: pisp_be: Drop reference to non-existing function
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_010058_983983_E5494C81 
X-CRM114-Status: GOOD (  19.01  )
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

Hi Jacopo,

Thank you for tidying this up!

On Fri, 6 Jun 2025 at 11:29, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> A comment in the pisp_be driver references the
> pispbe_schedule_internal() function which doesn't exist.
>
> Drop it.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Naushir Patuck <naush@raspberrypi.com>

> ---
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index 7596ae1f7de6..b1449245f394 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -368,10 +368,7 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
>         ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
>                                      &pispbe->node[MAIN_INPUT_NODE]);
>         if (ret <= 0) {
> -               /*
> -                * This shouldn't happen; pispbe_schedule_internal should insist
> -                * on an input.
> -                */
> +               /* Shouldn't happen, we have validated an input is available. */
>                 dev_warn(pispbe->dev, "ISP-BE missing input\n");
>                 hw_en->bayer_enables = 0;
>                 hw_en->rgb_enables = 0;
>
> --
> 2.49.0
>

