Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DACAD132B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPuhQI0lOHF+Ad4CcmmMCQ7pBg6SlbMgHJcEZYv6FAA=; b=dXl4kJLf6cq0t6P3v16CoY++5K
	i6Zx6VTMlbN6OUtL4oCcpX1C2IaILH6pLJa+MzWgh9LCGoMviTEbUwhKnOK2PBE54UQ4Bmn+3VCTj
	tdq3uAYrHW6pnrpKgDtTQpMmGot+dRY7T5Cs51Z/CYCuXUbsWoZx7yhxbN+tzFlQI6Mh0+ZfMnR/t
	oxR+kpgKDVuzTBZXj+NcwTs6QgizAaBAw93gNov+KFWdnKRuwSeq9ewEhJCAs8j3WgHLq+qqKQFhm
	1Mj1mIcDJ6088CDTyXNVdcgeaOVoyVYRxRFL3hyeu6SF6gRxLeJxWRZ+3q81ggszmHYH4kDTP5Tkb
	K6+0xk5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vzn-0000000DfDy-3iwX;
	Mon, 04 Nov 2024 12:15:47 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vlZ-0000000DctP-3QSN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 12:01:10 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539f7606199so1665137e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 04:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730721661; x=1731326461; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPuhQI0lOHF+Ad4CcmmMCQ7pBg6SlbMgHJcEZYv6FAA=;
        b=sz6+b4hNkMLCZz58LZHzcTypSKsaFm7JIr7BgXcaYeEyTW8qDaoe4tMWOv8QeI/9L/
         L6hPc1IT4nkjUToboniY4pXCxcWWkVLh05kShgf0iFfiJlWPb8oOH8GbjZ5xiNl6GEf4
         Xq3rY+0gdNq/kfnFB/yEellu8hATokWIkZkPkwpsExp7uzFm79RchBlIgm4OO8g06r3k
         QDdwgU7fiPMu21k7sreujpJ0juP6p1/1JTC5K5+Roa2ma14/d5av8cAGqVhn2+1aa3DA
         pcRA4od3kEvhbx4LZHJRhr/2DHVIBUE/TNGAy0NfYdGK9vVH/y0oCdd2+ZTnIOJsEy/d
         fhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730721661; x=1731326461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPuhQI0lOHF+Ad4CcmmMCQ7pBg6SlbMgHJcEZYv6FAA=;
        b=TA3wxp21KVOKW67IiHCHxn/Tq630BGaYx7a/VYU53WweenZqu2IDF6qqtI5sTG/9z2
         jdt56rFbYEd5pmaKb4tIH9eYn63ROTWZK42v/6XSXk7EplRU0CjJ9XrlmH82CkYa0EIc
         wOWsdphiQq1HJb7JuMg7RvcNhMTNNrufKfQlSRt0IXlQuYvhTrREZ1pEHgwMX44d9G8R
         8pqcq7BD4KyGOUvciSnNVLvO9yLA9w9fJut+vhW4FePuiHOezdSM9WKMJ7g8tFmcyF40
         zZZex/3o4vmwwHbfH7dKJZGYXopF3ens1BJSU4ZXfkyqb/3MvwcZ6FufwEpTSBXXUBMh
         bh+g==
X-Forwarded-Encrypted: i=1; AJvYcCX8K5t25x5nEHNaWA0K2krjIbNExLKZfBTG2LrhUzr5ma9XpuJQolv6jMPOrHeYGGGf8wbTpsxe58tGcrCVigCs@lists.infradead.org
X-Gm-Message-State: AOJu0YzM1vgkOLI2xDWINTjB7y5E0uGlqvDTXogoynvSsw/snlqMKBoq
	Y/djUVoMLvMi3IScwGID6RG1DbSazA+cVwfKYNaa7RCZQqX7+5B+2TDZqB13H8U=
X-Google-Smtp-Source: AGHT+IHGDCvSZ82+pqj20lnV2RkzetR2+um5kEOcAMMqRJf6AmgTdZquemX2q3CajdcCaqZBFT9v5w==
X-Received: by 2002:a05:6512:3d89:b0:539:ee0a:4f8f with SMTP id 2adb3069b0e04-53b7ed18669mr9298570e87.44.1730721661088;
        Mon, 04 Nov 2024 04:01:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc95957sm1671039e87.55.2024.11.04.04.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 04:00:59 -0800 (PST)
Date: Mon, 4 Nov 2024 14:00:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, 
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v5 04/13] media: uapi: Add
 MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
Message-ID: <ixckmdku6yriieo4ezzsepg5nflltzkvqbt7ylref4mu6a4t26@crooexpf3v57>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <20241104032806.611890-5-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104032806.611890-5-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_040105_916147_45B98811 
X-CRM114-Status: GOOD (  20.13  )
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

On Mon, Nov 04, 2024 at 11:27:57AM +0800, Liu Ying wrote:
> Add two media bus formats that identify 30-bit RGB pixels transmitted
> by a LVDS link with five differential data pairs, serialized into 7
> time slots, using standard SPWG/VESA or JEIDA data mapping.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v5:
> * No change.
> 
> v4:
> * No change.
> 
> v3:
> * New patch.
> 
>  .../media/v4l/subdev-formats.rst              | 156 +++++++++++++++++-
>  include/uapi/linux/media-bus-format.h         |   4 +-
>  2 files changed, 157 insertions(+), 3 deletions(-)

Laurent, Hans, can we please hear your opinion on this patch?

Ideally we'd like to merge it together with the rest of the series
through drm-misc (or via an immutable tag/branch from your side).

> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index d2a6cd2e1eb2..2a94371448dc 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -2225,7 +2225,7 @@ The following table list existing packed 48bit wide RGB formats.
>      \endgroup
>  
>  On LVDS buses, usually each sample is transferred serialized in seven
> -time slots per pixel clock, on three (18-bit) or four (24-bit)
> +time slots per pixel clock, on three (18-bit) or four (24-bit) or five (30-bit)
>  differential data pairs at the same time. The remaining bits are used
>  for control signals as defined by SPWG/PSWG/VESA or JEIDA standards. The
>  24-bit RGB format serialized in seven time slots on four lanes using
> @@ -2246,11 +2246,12 @@ JEIDA defined bit mapping will be named
>        - Code
>        -
>        -
> -      - :cspan:`3` Data organization
> +      - :cspan:`4` Data organization
>      * -
>        -
>        - Timeslot
>        - Lane
> +      - 4
>        - 3
>        - 2
>        - 1
> @@ -2262,6 +2263,7 @@ JEIDA defined bit mapping will be named
>        - 0
>        -
>        -
> +      -
>        - d
>        - b\ :sub:`1`
>        - g\ :sub:`0`
> @@ -2270,6 +2272,7 @@ JEIDA defined bit mapping will be named
>        - 1
>        -
>        -
> +      -
>        - d
>        - b\ :sub:`0`
>        - r\ :sub:`5`
> @@ -2278,6 +2281,7 @@ JEIDA defined bit mapping will be named
>        - 2
>        -
>        -
> +      -
>        - d
>        - g\ :sub:`5`
>        - r\ :sub:`4`
> @@ -2286,6 +2290,7 @@ JEIDA defined bit mapping will be named
>        - 3
>        -
>        -
> +      -
>        - b\ :sub:`5`
>        - g\ :sub:`4`
>        - r\ :sub:`3`
> @@ -2294,6 +2299,7 @@ JEIDA defined bit mapping will be named
>        - 4
>        -
>        -
> +      -
>        - b\ :sub:`4`
>        - g\ :sub:`3`
>        - r\ :sub:`2`
> @@ -2302,6 +2308,7 @@ JEIDA defined bit mapping will be named
>        - 5
>        -
>        -
> +      -
>        - b\ :sub:`3`
>        - g\ :sub:`2`
>        - r\ :sub:`1`
> @@ -2310,6 +2317,7 @@ JEIDA defined bit mapping will be named
>        - 6
>        -
>        -
> +      -
>        - b\ :sub:`2`
>        - g\ :sub:`1`
>        - r\ :sub:`0`
> @@ -2319,6 +2327,7 @@ JEIDA defined bit mapping will be named
>        - 0x1011
>        - 0
>        -
> +      -
>        - d
>        - d
>        - b\ :sub:`1`
> @@ -2327,6 +2336,7 @@ JEIDA defined bit mapping will be named
>        -
>        - 1
>        -
> +      -
>        - b\ :sub:`7`
>        - d
>        - b\ :sub:`0`
> @@ -2335,6 +2345,7 @@ JEIDA defined bit mapping will be named
>        -
>        - 2
>        -
> +      -
>        - b\ :sub:`6`
>        - d
>        - g\ :sub:`5`
> @@ -2343,6 +2354,7 @@ JEIDA defined bit mapping will be named
>        -
>        - 3
>        -
> +      -
>        - g\ :sub:`7`
>        - b\ :sub:`5`
>        - g\ :sub:`4`
> @@ -2351,6 +2363,7 @@ JEIDA defined bit mapping will be named
>        -
>        - 4
>        -
> +      -
>        - g\ :sub:`6`
>        - b\ :sub:`4`
>        - g\ :sub:`3`
> @@ -2359,6 +2372,7 @@ JEIDA defined bit mapping will be named
>        -
>        - 5
>        -
> +      -
>        - r\ :sub:`7`
>        - b\ :sub:`3`
>        - g\ :sub:`2`
> @@ -2367,6 +2381,7 @@ JEIDA defined bit mapping will be named
>        -
>        - 6
>        -
> +      -
>        - r\ :sub:`6`
>        - b\ :sub:`2`
>        - g\ :sub:`1`
> @@ -2377,6 +2392,7 @@ JEIDA defined bit mapping will be named
>        - 0x1012
>        - 0
>        -
> +      -
>        - d
>        - d
>        - b\ :sub:`3`
> @@ -2385,6 +2401,7 @@ JEIDA defined bit mapping will be named
>        -
>        - 1
>        -
> +      -
>        - b\ :sub:`1`
>        - d
>        - b\ :sub:`2`
> @@ -2393,6 +2410,7 @@ JEIDA defined bit mapping will be named
>        -
>        - 2
>        -
> +      -
>        - b\ :sub:`0`
>        - d
>        - g\ :sub:`7`
> @@ -2401,6 +2419,7 @@ JEIDA defined bit mapping will be named
>        -
>        - 3
>        -
> +      -
>        - g\ :sub:`1`
>        - b\ :sub:`7`
>        - g\ :sub:`6`
> @@ -2409,6 +2428,7 @@ JEIDA defined bit mapping will be named
>        -
>        - 4
>        -
> +      -
>        - g\ :sub:`0`
>        - b\ :sub:`6`
>        - g\ :sub:`5`
> @@ -2417,6 +2437,7 @@ JEIDA defined bit mapping will be named
>        -
>        - 5
>        -
> +      -
>        - r\ :sub:`1`
>        - b\ :sub:`5`
>        - g\ :sub:`4`
> @@ -2425,10 +2446,141 @@ JEIDA defined bit mapping will be named
>        -
>        - 6
>        -
> +      -
> +      - r\ :sub:`0`
> +      - b\ :sub:`4`
> +      - g\ :sub:`3`
> +      - r\ :sub:`2`
> +    * .. _MEDIA-BUS-FMT-RGB101010-1X7X5-SPWG:
> +
> +      - MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG
> +      - 0x1026
> +      - 0
> +      -
> +      - d
> +      - d
> +      - d
> +      - b\ :sub:`1`
> +      - g\ :sub:`0`
> +    * -
> +      -
> +      - 1
> +      -
> +      - b\ :sub:`9`
> +      - b\ :sub:`7`
> +      - d
> +      - b\ :sub:`0`
> +      - r\ :sub:`5`
> +    * -
> +      -
> +      - 2
> +      -
> +      - b\ :sub:`8`
> +      - b\ :sub:`6`
> +      - d
> +      - g\ :sub:`5`
> +      - r\ :sub:`4`
> +    * -
> +      -
> +      - 3
> +      -
> +      - g\ :sub:`9`
> +      - g\ :sub:`7`
> +      - b\ :sub:`5`
> +      - g\ :sub:`4`
> +      - r\ :sub:`3`
> +    * -
> +      -
> +      - 4
> +      -
> +      - g\ :sub:`8`
> +      - g\ :sub:`6`
> +      - b\ :sub:`4`
> +      - g\ :sub:`3`
> +      - r\ :sub:`2`
> +    * -
> +      -
> +      - 5
> +      -
> +      - r\ :sub:`9`
> +      - r\ :sub:`7`
> +      - b\ :sub:`3`
> +      - g\ :sub:`2`
> +      - r\ :sub:`1`
> +    * -
> +      -
> +      - 6
> +      -
> +      - r\ :sub:`8`
> +      - r\ :sub:`6`
> +      - b\ :sub:`2`
> +      - g\ :sub:`1`
>        - r\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-RGB101010-1X7X5-JEIDA:
> +
> +      - MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA
> +      - 0x1027
> +      - 0
> +      -
> +      - d
> +      - d
> +      - d
> +      - b\ :sub:`5`
> +      - g\ :sub:`4`
> +    * -
> +      -
> +      - 1
> +      -
> +      - b\ :sub:`1`
> +      - b\ :sub:`3`
> +      - d
>        - b\ :sub:`4`
> +      - r\ :sub:`9`
> +    * -
> +      -
> +      - 2
> +      -
> +      - b\ :sub:`0`
> +      - b\ :sub:`2`
> +      - d
> +      - g\ :sub:`9`
> +      - r\ :sub:`8`
> +    * -
> +      -
> +      - 3
> +      -
> +      - g\ :sub:`1`
>        - g\ :sub:`3`
> +      - b\ :sub:`9`
> +      - g\ :sub:`8`
> +      - r\ :sub:`7`
> +    * -
> +      -
> +      - 4
> +      -
> +      - g\ :sub:`0`
> +      - g\ :sub:`2`
> +      - b\ :sub:`8`
> +      - g\ :sub:`7`
> +      - r\ :sub:`6`
> +    * -
> +      -
> +      - 5
> +      -
> +      - r\ :sub:`1`
> +      - r\ :sub:`3`
> +      - b\ :sub:`7`
> +      - g\ :sub:`6`
> +      - r\ :sub:`5`
> +    * -
> +      -
> +      - 6
> +      -
> +      - r\ :sub:`0`
>        - r\ :sub:`2`
> +      - b\ :sub:`6`
> +      - g\ :sub:`5`
> +      - r\ :sub:`4`
>  
>  .. raw:: latex
>  
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index d4c1d991014b..ff62056feed5 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -34,7 +34,7 @@
>  
>  #define MEDIA_BUS_FMT_FIXED			0x0001
>  
> -/* RGB - next is	0x1026 */
> +/* RGB - next is	0x1028 */
>  #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
> @@ -68,6 +68,8 @@
>  #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
>  #define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
>  #define MEDIA_BUS_FMT_RGB101010_1X30		0x1018
> +#define MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG	0x1026
> +#define MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA	0x1027
>  #define MEDIA_BUS_FMT_RGB666_1X36_CPADLO	0x1020
>  #define MEDIA_BUS_FMT_RGB888_1X36_CPADLO	0x1021
>  #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

