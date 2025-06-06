Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C742AC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D02VVevmOF3cQxFCCzf3uOD2IZ0DFegRFrqZJe6cxu4=; b=sLB4TyFfjnvGAK015FPAORYUi7
	btvUkx+SVuPJzP8QlB7Neun0f8iX2/dJO6Ii6bGeIpXuKrHKoYh47cJ/TDsHUXQRnUpPEblyNITnf
	+qTlo8rbHVPUtyndAHbbB2qEk9HNlbhysHv/+zeoduOmHhpzRH+XTemCwgdwZmWk3mWtOXTSd19lG
	SpSxI56p1mW0qdnQsN0AbHP+WAwqEVNu0PjGs9BP88hF5A/cNWLDOi/VYDjFle5ZWLToPMvnchXav
	XZSIgoJxTReV0Mre9xhd+gXu7o1rl87d3tiiCfzM4VJ6n9rDbqHLvXTOGgWQl4u7H2RU1k8Y+Zsan
	nMkrLtLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXc8-00000000OYU-2pAb;
	Fri, 06 Jun 2025 14:00:08 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXYL-00000000NuO-440z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 13:56:15 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so1256425f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749218172; x=1749822972; darn=lists.infradead.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D02VVevmOF3cQxFCCzf3uOD2IZ0DFegRFrqZJe6cxu4=;
        b=IcoWyIj3BXMc58pCW5WuM6KLfDyGDKvFOEO0DdkOSutIMyhJ/rGr6f1hfkb2LW4YFR
         i4BpR511UKRiMsNycdCkXrorE7d8qe8jcRmVCQTOuI3EQwQKrRMhTph7Z8lHHsQJIYHW
         vhePpGspIrTZqDTL7g9gXYFb8W76WlAUi3LxUDHm+rZLGKSXRzsE+C98CXMoX7YXEKHf
         Y6b2CHf3SfzI34bWZ/xp30ae4vUaSkxkE/qvE+za3zSqDm5foPQ06Oaq70Jm4/9oZR81
         G+Q9PNN5ORsKVv7vFn3jHBr/rsm1gPHzSQ7lOHG81TTvNRmhxhRjK/O/TdZtrXhYSkXr
         +OLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749218172; x=1749822972;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D02VVevmOF3cQxFCCzf3uOD2IZ0DFegRFrqZJe6cxu4=;
        b=Jsc0Vxew3IVll7/nY+Jj39YXnG+2RpJ9fIJUiu37T+slWuQfck2aDV8R8DpgrVy2Xy
         HpN3FSoXg1lOkgglyd6Ze1eK3Q5ZwBoypa89NdFPcv39RFzWRwZSLcxYwhqvlznEaZm1
         BNC7dF2I4HmbKIWL1FCJd/ThssePgiErpmd5H9KQ/xyx5Pk0v0XzZQk/eygSSYvo/NAt
         7kR3TPK76i4wm6CfSh+FQIcwEMevqU+IdBlSM6vApLc5J21nPAA1rWil9YsNON0ULTyJ
         JcdxbJExeqDY9GOvhhHID5rBEDuUC4/E1nyyYWoy/wjS+0OQycEFxJT4mlpDNVOqTDuS
         9tSA==
X-Forwarded-Encrypted: i=1; AJvYcCU7knWfF8c1XGNG8DR64d56eu2Cxy9902DdnaOMsEQMWuWdUbITXevGbxC4szMicTtlmCB7dQOQVYxMY4hfRMwC@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj/I07PJCmKoUkyF8PH5YKWLni4bKaVjwDbRdc8ui5PnnQqY+Z
	wDN5YGEPDexdodOuxKK50f3MZvSUU7vPcNEUWZ8ixfvpEMJ0roZl1FM8
X-Gm-Gg: ASbGnctF2TsXtI2lYZZeQba5mNGTpMpxiMmaRZ7YzMfIh4hAkkPU0ZOFagyC81nkmYN
	67Wj8JwRT0ufpJbikOhpKsGDoj3pVQ8wtQ6cn3+6gBsF71r00HLKIYdEH7gdIxPUdOhDFMAUoF8
	JsfpEyTHM0py8MvxFFGumWpAKRqosFizQMqt6vkguNG91o1lwFhaThfkZGVEbuF+UcBm8gsaphc
	UXK3H3H/Fvz4oUtHPW+QWzh02ydM4YlKa8poV2ljM8Hww1sUEphWE8r4H9fso1SYUgoKVeq238L
	1i+hZTDfBzK4vQY75tmPHp+INh0nVeBosbjEXEdm3YG8w+KM0AOKitMmxsOv/ehX1raQjx5LYWP
	Ng3jV6fFlyuWdPQ==
X-Google-Smtp-Source: AGHT+IH/4Dz7vdItmgmTlnNXWLY79bYjxG+RnGnF5b/cbxCPhJ2PE6r5VIZGSsEVJ0iX7xCVJcwFng==
X-Received: by 2002:a05:6000:18ac:b0:3a4:ee40:6c85 with SMTP id ffacd0b85a97d-3a531cba357mr3281306f8f.54.1749218171799;
        Fri, 06 Jun 2025 06:56:11 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-452730d161csm21907155e9.37.2025.06.06.06.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:56:11 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 14:56:05 +0100
Message-Id: <DAFI37JD827I.KWPZ7XCTWPBD@linaro.com>
Cc: <kieran.bingham@ideasonboard.com>, <rmfrfs@gmail.com>,
 <martink@posteo.de>, <kernel@puri.sm>, <mchehab@kernel.org>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] media: platform: Refactor interrupt status
 registers
To: "Isaac Scott" <isaac.scott@ideasonboard.com>,
 <laurent.pinchart@ideasonboard.com>
References: <20250606121403.498153-1-isaac.scott@ideasonboard.com>
 <20250606121403.498153-2-isaac.scott@ideasonboard.com>
In-Reply-To: <20250606121403.498153-2-isaac.scott@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_065614_007678_33CDFEC5 
X-CRM114-Status: GOOD (  22.97  )
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

Hey Isaac,
Thanks for the patch.

On Fri Jun 6, 2025 at 1:14 PM WEST, Isaac Scott wrote:

> The NXP i.MX 8 MP CSI-2 receiver features multiple interrupt and debug
> status sources which span multiple registers. The driver currently
> supports two interrupt source registers, and attributes the
> mipi_csis_event event entries to those registers through a boolean debug
> field that indicate if the event relates to the main interrupt status
> (false) or debug interrupt status (true) register. To make it easier to
> add new event fields, replace the debug bool with a 'status index'
> integer than indicates the index of the corresponding status register.
>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 64 +++++++++++-----------
>  1 file changed, 31 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index d060eadebc7a..bbc549c22aff 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -249,7 +249,7 @@
>  #define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
> =20
>  struct mipi_csis_event {
> -	bool debug;
> +	unsigned int status_index;
>  	u32 mask;
>  	const char * const name;
>  	unsigned int counter;
> @@ -257,30 +257,30 @@ struct mipi_csis_event {
> =20
>  static const struct mipi_csis_event mipi_csis_events[] =3D {
>  	/* Errors */
> -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" }=
,
> -	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported=
" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early Frame End" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early Frame Start" },
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error"},

Maybe instead of 0,1,2 (magic indexes)... we could give a meaningful index
enums names, don't know, like: main, debug, user??? or something that
you think is better.

Cheers,
    Rui

> +	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,		"Wrong Configuration Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_ECC,			"ECC Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_CRC,			"CRC Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,		"Data Type Ignored"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,		"Early Frame End"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,		"Early Frame Start"},
>  	/* Non-image data receive events */
> -	{ false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even fr=
ame" },
> -	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even fram=
e" },
> -	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd fram=
e" },
> -	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame"=
 },
> +	{ 0, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame"=
},
> +	{ 0, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame"},
> +	{ 0, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame"},
> +	{ 0, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame"},
>  	/* Frame start/end */
> -	{ false, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
> -	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge" },
> +	{ 0, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start"},
> +	{ 0, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge"},
>  };
> =20
>  #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> @@ -765,32 +765,30 @@ static irqreturn_t mipi_csis_irq_handler(int irq, v=
oid *dev_id)
>  	struct mipi_csis_device *csis =3D dev_id;
>  	unsigned long flags;
>  	unsigned int i;
> -	u32 status;
> -	u32 dbg_status;
> +	u32 status[2];
> =20
> -	status =3D mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> -	dbg_status =3D mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
> +	status[0] =3D mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> +	status[1] =3D mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
> =20
>  	spin_lock_irqsave(&csis->slock, flags);
> =20
>  	/* Update the event/error counters */
> -	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
> +	if ((status[0] & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
>  		for (i =3D 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
>  			struct mipi_csis_event *event =3D &csis->events[i];
> =20
> -			if ((!event->debug && (status & event->mask)) ||
> -			    (event->debug && (dbg_status & event->mask)))
> +			if (status[event->status_index] & event->mask)
>  				event->counter++;
>  		}
>  	}
> =20
> -	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
> +	if (status[0] & MIPI_CSIS_INT_SRC_FRAME_START)
>  		mipi_csis_queue_event_sof(csis);
> =20
>  	spin_unlock_irqrestore(&csis->slock, flags);
> =20
> -	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status);
> -	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
> +	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status[0]);
> +	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, status[1]);
> =20
>  	return IRQ_HANDLED;
>  }
> --=20
> 2.43.0




