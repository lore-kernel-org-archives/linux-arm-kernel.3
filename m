Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F504CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGQ/GpRO6vnxq7fb84hh6aj2KXsZIXY1TgeovdND5Hc=; b=uXUVd9AH59ydes03et2cHM2a7Q
	cAfd8Eevtfdq1+B9/y/9Z5e2dMa9Nh3Mro5HEzza8vKkiCrGOaMyHNEZYIJcE32SEBd5C5I4aDq4p
	78GozKWJrd3wCVH4QbGTdAsMo7s7SqVfslCoOUSyV//15KEIZmaB/VdLMzjcND94L+kkZ7FU2coBy
	YuifQFPxrZW4tASv+/4Zij+s/sCoCfE8HROWD5uf8glqDwo3kNcNl/I58SzPZ9jgy5xkns7UpMr2o
	3gTEpty3+OS/jeheYqG5ZgP9JVZl/Z9rEbqH7a7/GCbOaMma05SObuZslAMmc33+dTuQhTlFqIpif
	j5p/BNXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZgM-0000000CYe8-2ptg;
	Tue, 13 Oct 2026 10:24:30 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZgK-0000000CYdj-28wq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:24:29 +0000
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-988bb309c2bso1380253241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 03:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887067; x=1792491867;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mGQ/GpRO6vnxq7fb84hh6aj2KXsZIXY1TgeovdND5Hc=;
        b=LHm1Za5dSGRzZRFJm4ZmTswZGvQlwvLldcbo9VdaY8OlF7maATXI7/Z5agGoRqpydA
         mTm4ZOFh7bADQmqrGSTPKSe0T6TTw9EjAy7MZTJyGwHeABIuPRl3DYbjEWlbi4hjAFpT
         smREwnNof5C21c13xLDnk66HstAnK+QrkrW1tLjPGnMQmSK5pse453DqttpgARG9tolP
         x3wSTsQEOw+Qx5awb2bLxC24LxHnJt8Ady6Aw/qrTEJoYZpOK/Qz4lOHJeKSiuGv+U3I
         Liup3hWltbhR6SHcqFvtcSuLUI4QUGkS1+Yc0By7bn/aupow9vF6C4fWMvCoBeksyIfV
         2NOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZSTGw3gjGrjxWiTQNJLhpbt7wLqvep3MSo1kmaAqAuxQwEbIYiTHjiZDqOPaQkmE3EWNa7XBI0G0CSSQYTtjm@lists.infradead.org
X-Gm-Message-State: AFq9FYIcrnhD8P1Z6+KmPldDIC8fnrfvLyWUo0WjJe0brJ6UBaR+C82v
	OmG+Bzq1caeVP1EAx56ZvuoeWZbvOAKD7V5iwDsJ1ZbBBsQoLxNXRlddhBViv73G
X-Gm-Gg: AYBFou0+OXsHLrcsm0iu6hZ5I6MlOUx4OEejxkZqcPCixBVdCEDbLw8M9pfEChAp1lR
	m5BmvjFPBwPCDW9k+SFGQowi0GKw1B5TA9JqFjmz4KRHL5WTy5ZIv24J1f5ZAGODISM4CK/4EHZ
	9huB6jrZCeT6BBZdude6poSYnFIwkp3zwK/lcHEaaEXJTYt/lCyGAACqblEPYQBVRPcrLkbTH0V
	VuLSQnepPgr6i6GbBzloqgjfE2ZewLPVD7wLULFK24fNnHTMungYhLlQfbWPvqDLaNoFYdDBTXc
	W5m+fLTSDl7hbfeM5b5S9LT/pa6s12qrU3dHGxnOGEuz08IiOl0DrEbX5K9RXiRnL3H/7GSPH+6
	PPdoMCtyZzAm13rhrMNGuAdIeF5vl7VlOFy3h577LFqL9UA7T0AnCuaC7d2Acensg2ANvrYgXBM
	I6wIBmvQZvIofGSXgSnmpifhEqUaqwMMbDgbqjJey3FGjYvsSzyDRpYwvH0eRLE4ECVkIkGKCwo
	76qWrd8m+0TrWoWtK78CV6YlRzL55jp2BTO
X-Received: by 2002:a05:6102:41cd:b0:7cb:393d:d264 with SMTP id ada2fe7eead31-7cb393dddb3mr2697585137.11.1791887066933;
        Tue, 13 Oct 2026 03:24:26 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003ee6ce3sm7941137241.4.2026.10.13.03.24.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:24:26 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7c3cecbda48so261443137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 03:24:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzkkUB/2pNb0rJVPiMFlZEyEKqj7w3hm8O3nfN+xmZfO7vFXHDzVDBDBjm4+J+TFZd6kzQjy4qPQK3UXXB5NyiM@lists.infradead.org
X-Received: by 2002:a05:6102:149d:b0:7a7:ad9f:53e2 with SMTP id
 ada2fe7eead31-7cb36987a53mr4125862137.1.1791887065725; Tue, 13 Oct 2026
 03:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250718152500.2656391-1-demonsingur@gmail.com> <20250718152500.2656391-22-demonsingur@gmail.com>
In-Reply-To: <20250718152500.2656391-22-demonsingur@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Oct 2026 12:24:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXA83Dm=Mf9MFdGNH+-J6dPrZJGS0R_6hPNgC0x1suBHw@mail.gmail.com>
X-Gm-Features: AclHuK9EzHrMNGZ9VqEt7mZlsF4wljWQ4a5mjitwSzx9DSYBvOK99D8Xhx8xmLo
Message-ID: <CAMuHMdXA83Dm=Mf9MFdGNH+-J6dPrZJGS0R_6hPNgC0x1suBHw@mail.gmail.com>
Subject: Re: [PATCH v7 21/24] arm64: defconfig: disable deprecated MAX96712 driver
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_032428_562345_901898BD 
X-CRM114-Status: GOOD (  20.23  )
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

Hi Cosmin,

On Fri, 18 Jul 2025 at 17:33, Cosmin Tanislav <demonsingur@gmail.com> wrote:
> The staging MAX96712 driver will be removed as its functionality has
> been moved to the MAX96724 driver which makes use of the Maxim
> GMSL2/3 deserializer framework.
>
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>

Thanks for your patch, which is now commit e8d5a57e6d0ce827 ("arm64:
defconfig: disable deprecated MAX96712 driver") in media/master.

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
>  CONFIG_GREYBUS_BEAGLEPLAY=m
>  CONFIG_STAGING=y
>  CONFIG_STAGING_MEDIA=y
> -CONFIG_VIDEO_MAX96712=m

As Niklas has already pointed out in a reply to v5, you forgot to enable
the replacement CONFIG_VIDEO_MAX96724, thus breaking operation.

>  CONFIG_VIDEO_MESON_VDEC=m
>  CONFIG_SND_BCM2835=m
>  CONFIG_CHROME_PLATFORMS=y

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

