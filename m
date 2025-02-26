Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74556C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yd4Q4hVeUYOM1ue+qUfzWNg9Q9i3oT/9A9AYIFfGkUc=; b=luNrsZmXdEA+SQ5MCKDiRQvG5s
	5ZN0TPxhxzYzMBmGJWwAKdU03yMQ9kw3dcKnDVcahxZlFeyYeYrZnxFOujRcUOhXguz/E9Yb3L3Gb
	OK7wMytpiA2j5mNIybto+gtFl8yGEFHY1ui27A3M9ZzgZoEQWnTA3sJ6keTotcRN93JKhrSUw/IWS
	Y/gRZRlMCUl5qRLx/sAk+WRGZ1mvIQaMO7dSrOwQRHoj3JXdRO6gXzlCdraSsOzN3JJZDVvRjOTUC
	bjxDiKjfB0RVt2lPArXrt2B/6czfoFXvOF8mGVldPt0qSIEqfY5cQULmilXHXwImC1CF3FQhYaU60
	pVaHmmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJFB-00000004G0J-3REZ;
	Wed, 26 Feb 2025 15:22:41 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIbp-000000049Iv-0KY5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:42:03 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aaecf50578eso1365165766b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 06:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740580919; x=1741185719; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yd4Q4hVeUYOM1ue+qUfzWNg9Q9i3oT/9A9AYIFfGkUc=;
        b=bouYI1UXmiO+2k1NXBlJXRGXmGuyXiLK/vlxpuMEkzHoSucjy3q/MJoMuhDsz9i2Mc
         INkkRzXmQfwRWjrfsbmwQYtLAhX0aEnJarVH4opUUG0asFFuOYNa75PvP0TuxaMa3Xii
         Igs6K1cqEVoFFxsm07Jhf+akRjPov6aBIZVgj9iZrKhBgPdN6u3yosv9HM1iRCYROIiS
         XSDAlueU5UernLE4V+L9bJocRRzYVxlUQ+Cjbi6cAVcNw5ePEyOXBdDUkXDJXeIToqoc
         WJWbL88GOsRudS/gtxHGCBfmUpB47OXo2GyYlxsJmNmsB5BhqjHJYalVPiD0B7IURVNo
         4t7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740580919; x=1741185719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd4Q4hVeUYOM1ue+qUfzWNg9Q9i3oT/9A9AYIFfGkUc=;
        b=sY9gUMK58dowYGNiw+8ySu9xmU1OSc6B8sh0KS3SV5jJF8FuyLjuPc7KKqiO/gIhaQ
         2Ni0EBTLxiOKeCQ9Po/q8gauCt0S/jUxsyY5Xt8cP8kFfd+mz6c60pPs6SEi+sNzi5pg
         lAqqH64vUbjVJxS8Fwh7sOgX9kQwxhbg1AJiy7y8o6i7+BjhkFgwsFWWo7THKpJT6POg
         Rw8Q0GHWP7bxfBfPCw5NcmjIIO1UBKpWpiYj6G1/akQsmyRGFIivjhHehLJNHYbX2/Fn
         g3mJfMY5MIfxolU81yOcw6MI8XtHz1QR0HQwZYSOvddcrSkTRiEck7r0C6WqsSmNfQmG
         2LAw==
X-Forwarded-Encrypted: i=1; AJvYcCW72MQeEgFIhmAxa/2ozUBlC9q1foYzYzRlcg6T9u9jgeUPxvF8WOrBlUb5zeA64Z/1d6jg8oCyM4/4ngAaz3Jm@lists.infradead.org
X-Gm-Message-State: AOJu0YxuDS4gnVmCZuHRnNKrocmdB/aEFpM2mgBKGnxJimUjrVWHOAPR
	jhNt1eqrETyZeh816bcNgBM7Ebnotp2GXKl4wb2PRl/EKCxrLrwhz3T3+DsSU50=
X-Gm-Gg: ASbGncs/gWxI5igkl0Ty3TUFbVZu2O7rU1scPPWrw51245Hqk7J/9jXWdcLoywEhdiP
	DvUvtNd+l8Lb/vDXNHnXesPtqxpCc2MRUyUm82Y9jBd+hW1cr1xh2uXZc58CgLk66QGJ2ZC6Wyd
	z+fQEIXPyaM/DSan96uhzRoVBDPGvzOfrnivrVXMPyuu/ynL8usolX1tjWdpxt17qeFwooG/kuF
	7Sh1uoV4QQZMdYXlllmSHyZb+5Zg2hu55zAU9UNpMj2yS+0glHELYhBUpoP1yKcYoDpFsPqc2E9
	v5tdTDzSyJPScxhMnkIQPxFz7amssQM=
X-Google-Smtp-Source: AGHT+IEqq+wCIO+7KpV9xqIa2Ubw1hCVyP4Ga6WxVj5wemOObN4UBSusPlhMuI5n8yBIpYErWlyqpg==
X-Received: by 2002:a17:906:314d:b0:ab7:9df1:e562 with SMTP id a640c23a62f3a-abc0de55dbcmr1974440866b.48.1740580919225;
        Wed, 26 Feb 2025 06:41:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed2012142sm333883966b.117.2025.02.26.06.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:41:58 -0800 (PST)
Date: Wed, 26 Feb 2025 17:41:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	hverkuil@xs4all.nl, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: imx: fix a potential memory leak in
 imx_media_csc_scaler_device_init()
Message-ID: <450cdcc9-ccb8-4ebd-847c-b106fae2d709@stanley.mountain>
References: <20250226142126.3620482-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226142126.3620482-1-haoxiang_li2024@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_064201_132153_C546288C 
X-CRM114-Status: GOOD (  15.75  )
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

On Wed, Feb 26, 2025 at 10:21:26PM +0800, Haoxiang Li wrote:
> Add video_device_release() in label 'err_m2m' to release the memory
> allocated by video_device_alloc() and prevent potential memory leaks.
> 
> Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/staging/media/imx/imx-media-csc-scaler.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
> index e5e08c6f79f2..f99c88e87a94 100644
> --- a/drivers/staging/media/imx/imx-media-csc-scaler.c
> +++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
> @@ -913,6 +913,7 @@ imx_media_csc_scaler_device_init(struct imx_media_dev *md)
>  
>  err_m2m:
>  	video_set_drvdata(vfd, NULL);
> +	video_device_release(vfd);

The video_set_drvdata() call is pointless.  It just does:

	vfd.dev->driver_data = NULL;

but that's not necessary if we're just going to free "vfd" on the next
line.

regards,
dan carpenter

>  err_vfd:
>  	kfree(priv);
>  	return ERR_PTR(ret);


