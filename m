Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129F4CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 18:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCEQzFxW+madwrv8aBawelGrP3CVpUaeIwsfLgnOZAU=; b=fb+aVsLQ8Ta/b2lkzAxDq1qR4a
	6iOUScgU8ndvketkkJ8sqMO3jJjk8VSLyYkfeDX1UCjRKO68LdWYDB5CBK9RnaakCTTpRCJB8EBaO
	W66ThOI9Omm/3n667U26YlACZnWFXwPRLorSLOXqPjEOuJx7EwCvw91zCZsFqbQ7DHivh2jVXYWmD
	pRQ2PwRIKVSS3sx8WrzJhS9Emzlna26OzKWVZNZP2F3YsVky6capf4EY5e4Vo2DzLKnXpJJr4yDnd
	pG+2RrUPRes60Zy84eJkt4Tv+yhCfmnoogZF2RxP8VKxZ2U4qVBtykjJ11+o4M/FGw4nCtEP0zvF2
	y846ZjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDo0P-0000000GRmp-3jUN;
	Tue, 28 Oct 2025 18:01:13 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDo0L-0000000GRmE-3SV5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 18:01:12 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso99916f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 11:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761674468; x=1762279268; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCEQzFxW+madwrv8aBawelGrP3CVpUaeIwsfLgnOZAU=;
        b=KEHyVIEc4HyVrw+8+dS8HZM/soj0cMy3zjAAk9lS6HXKm0qs2Q0oIhXEgzE8ru+JaQ
         6+3yk309tLTOQXiK9/udDIqbq6+B/1ohH79+qgUdwJYZn8G4eR1a3UO+z5iykL1dJ/Ie
         Qps/8uCfclnT8HeD9+O0YjlpvqxQBz+5fom+ihFHyIj7ihDBlsDRtcRtl8c9BY0S0Wl2
         Foi8IKlXSwZ46K4J065gWUQhkWmNfpnaFwhz032Ttm4pi8wK3T2xeACwj7ifzDn+56s2
         CTrzHEjBl/EzWytDZ6mZ45U6Q6PX8hMpFAZvtJZY7JHbtcNfL0Stq2c/kg2QlGhSW609
         5TAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761674468; x=1762279268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCEQzFxW+madwrv8aBawelGrP3CVpUaeIwsfLgnOZAU=;
        b=J10n4noXRVoZYdiPMOLpGnjqNRY55Rp2DrNwCR0if1KFFhJi+sVQGDCbHq0soEZz0Q
         dadKQ/qJ5c2xmjPO0PdWetDX1YdJ7N31BQlrEtaXk8Vd128Iv/AeoumfbOUSGgbdIY1L
         NxdGseZL8okgaC6FeiikaJ5BbjvC32BxAyDIl7LQKBJ1HxUv9/X740C+BI9ehPChJi2/
         kNkE9YDx5PCCropzCea/5WWGDrImrYOkS7YfL8D8KaUrLAC12y+/WsjB7lQ9wF9ie3Tv
         nPfyVSjQy2vgp5xboU1Xd4kcCIEotR68ztGcaST1V/u5j5+KT3YD0FKxAg4dbDQ0OY5Y
         Xrow==
X-Forwarded-Encrypted: i=1; AJvYcCXKvetIYegsSNYyMBAFZ4sBt341xEJKmtq1tUPJIylsT4WTeiP1eMuopRCpqEXZh7ZyjaJRJDMQb5HggmYrZupt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6prBWPd33tEKE4nusqL+HmJK//cpS5xjLcsoIiyZ1Fr67ccez
	GCsdFUmNqRTIELtc2qVMoYyznSeyZk/JdInUwDaXkYZPqxTfmkPSFwBK/9V7FQcvULzHb3gXphY
	m5N1eZvLolCXUvO5QotSGuMpBTMpoJFg=
X-Gm-Gg: ASbGncsnHoqspnCSBxWlxdesWngcpoewQaE6EowlmNsR/QNsI93vE9pqoWd1jnf9WGG
	4S6A0+hO2bCkM45uOgD0gKrv0vVZWRTFB8x4sc+sjmXudSIxbo0u6Je/yWQqBwMgE5Cx+J9sp2e
	W75LN6P/ZCPuL+nCw42zxQU8ReEJPRrzI7AE740Z3pn00LLP28RYjF7FrH1+gzOb1lI1KEEYapR
	cnuJsRdtKTuxa5TcyILOsJRkuwXerbRy1jaR1ZCzHxWmxGBIgrD5owlmDZIXiY0xY7NKqQ=
X-Google-Smtp-Source: AGHT+IHpEn293xUQBtxDVQ71PVjUFm7YcMZrTKR+UYoQPv+Rm0ZHF2wr51C1F4u8ECE4D8JahpoR5i75Grw6elZvooM=
X-Received: by 2002:a05:6000:2887:b0:429:8b81:5ace with SMTP id
 ffacd0b85a97d-429a81b1470mr3944782f8f.7.1761674467657; Tue, 28 Oct 2025
 11:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com> <20251002-c55-v12-2-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-2-3eda2dba9554@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 Oct 2025 18:00:39 +0000
X-Gm-Features: AWmQ_bkbLojgbgpv5n9DbkH76vLTXPQ-oionzdgMQBrgFA-kSP32mMdP7wnhQz8
Message-ID: <CA+V-a8uVjR7p_+LCXOTjH4MxL_PMv4O5obuJxpvoyJvFfHG--A@mail.gmail.com>
Subject: Re: [PATCH v12 02/15] media: uapi: Add 20-bit bayer formats
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, 
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org, 
	mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_110110_017877_1F48238D 
X-CRM114-Status: GOOD (  14.84  )
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

On Thu, Oct 2, 2025 at 11:20=E2=80=AFAM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> The Mali-C55 requires input data be in 20-bit format, MSB aligned.
> Add some new media bus format macros to represent that input format.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v12:
>
>         - None
>
> Changes in v11:
>
>         - None
>
> Changes in v10:
>
>         - None
>
> Changes in v9:
>
>         - None
>
> Changes in v8:
>
>         - None
>
> Changes in v7:
>
>         - None
>
> Changes in v6:
>
>         - Fixed the table formatting
>
> Changes in v5:
>
>         - New patch
> ---
>  .../userspace-api/media/v4l/subdev-formats.rst     | 252 +++++++++++++++=
+++++-
>  include/uapi/linux/media-bus-format.h              |   6 +-
>  2 files changed, 255 insertions(+), 3 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/D=
ocumentation/userspace-api/media/v4l/subdev-formats.rst
> index 57194180fe42f31f88aa0aeb4a4650bf4fb32bcc..ecbe83dcc4b716c77ce37f55f=
bb8a59b2eed17ab 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -2816,7 +2816,7 @@ organization is given as an example for the first p=
ixel only.
>      \tiny
>      \setlength{\tabcolsep}{2pt}
>
> -.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.=
22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}=
|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
> +.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.=
22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}=
|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.=
22cm}|p{0.22cm}|p{0.22cm}|
>
>  .. _v4l2-mbus-pixelcode-bayer:
>
> @@ -2829,10 +2829,14 @@ organization is given as an example for the first=
 pixel only.
>      * - Identifier
>        - Code
>        -
> -      - :cspan:`15` Data organization
> +      - :cspan:`19` Data organization
>      * -
>        -
>        - Bit
> +      - 19
> +      - 18
> +      - 17
> +      - 16
>        - 15
>        - 14
>        - 13
> @@ -2862,6 +2866,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -2883,6 +2891,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -2904,6 +2916,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -2925,6 +2941,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`7`
>        - r\ :sub:`6`
>        - r\ :sub:`5`
> @@ -2946,6 +2966,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -2967,6 +2991,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -2988,6 +3016,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -3009,6 +3041,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`7`
>        - r\ :sub:`6`
>        - r\ :sub:`5`
> @@ -3030,6 +3066,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -3051,6 +3091,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -3072,6 +3116,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -3093,6 +3141,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`7`
>        - r\ :sub:`6`
>        - r\ :sub:`5`
> @@ -3114,6 +3166,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - 0
>        - 0
>        - 0
> @@ -3133,6 +3189,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -3154,6 +3214,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -3173,6 +3237,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - 0
>        - 0
>        - 0
> @@ -3194,6 +3262,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`9`
>        - b\ :sub:`8`
>        - b\ :sub:`7`
> @@ -3213,6 +3285,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`1`
>        - b\ :sub:`0`
>        - 0
> @@ -3234,6 +3310,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`1`
>        - b\ :sub:`0`
>        - 0
> @@ -3253,6 +3333,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`9`
>        - b\ :sub:`8`
>        - b\ :sub:`7`
> @@ -3272,6 +3356,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`9`
>        - b\ :sub:`8`
>        - b\ :sub:`7`
> @@ -3293,6 +3381,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`9`
>        - g\ :sub:`8`
>        - g\ :sub:`7`
> @@ -3314,6 +3406,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`9`
>        - g\ :sub:`8`
>        - g\ :sub:`7`
> @@ -3335,6 +3431,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`9`
>        - r\ :sub:`8`
>        - r\ :sub:`7`
> @@ -3354,6 +3454,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`11`
>        - b\ :sub:`10`
>        - b\ :sub:`9`
> @@ -3375,6 +3479,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`11`
>        - g\ :sub:`10`
>        - g\ :sub:`9`
> @@ -3396,6 +3504,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`11`
>        - g\ :sub:`10`
>        - g\ :sub:`9`
> @@ -3417,6 +3529,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`11`
>        - r\ :sub:`10`
>        - r\ :sub:`9`
> @@ -3436,6 +3552,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`13`
>        - b\ :sub:`12`
>        - b\ :sub:`11`
> @@ -3457,6 +3577,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`13`
>        - g\ :sub:`12`
>        - g\ :sub:`11`
> @@ -3478,6 +3602,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`13`
>        - g\ :sub:`12`
>        - g\ :sub:`11`
> @@ -3499,6 +3627,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`13`
>        - r\ :sub:`12`
>        - r\ :sub:`11`
> @@ -3518,6 +3650,10 @@ organization is given as an example for the first =
pixel only.
>        - MEDIA_BUS_FMT_SBGGR16_1X16
>        - 0x301d
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`15`
>        - b\ :sub:`14`
>        - b\ :sub:`13`
> @@ -3539,6 +3675,10 @@ organization is given as an example for the first =
pixel only.
>        - MEDIA_BUS_FMT_SGBRG16_1X16
>        - 0x301e
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`15`
>        - g\ :sub:`14`
>        - g\ :sub:`13`
> @@ -3560,6 +3700,10 @@ organization is given as an example for the first =
pixel only.
>        - MEDIA_BUS_FMT_SGRBG16_1X16
>        - 0x301f
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`15`
>        - g\ :sub:`14`
>        - g\ :sub:`13`
> @@ -3581,6 +3725,110 @@ organization is given as an example for the first=
 pixel only.
>        - MEDIA_BUS_FMT_SRGGB16_1X16
>        - 0x3020
>        -
> +      -
> +      -
> +      -
> +      -
> +      - r\ :sub:`15`
> +      - r\ :sub:`14`
> +      - r\ :sub:`13`
> +      - r\ :sub:`12`
> +      - r\ :sub:`11`
> +      - r\ :sub:`10`
> +      - r\ :sub:`9`
> +      - r\ :sub:`8`
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SBGGR20-1X20:
> +
> +      - MEDIA_BUS_FMT_SBGGR20_1X20
> +      - 0x3021
> +      -
> +      - b\ :sub:`19`
> +      - b\ :sub:`18`
> +      - b\ :sub:`17`
> +      - b\ :sub:`16`
> +      - b\ :sub:`15`
> +      - b\ :sub:`14`
> +      - b\ :sub:`13`
> +      - b\ :sub:`12`
> +      - b\ :sub:`11`
> +      - b\ :sub:`10`
> +      - b\ :sub:`9`
> +      - b\ :sub:`8`
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SGBRG20-1X20:
> +
> +      - MEDIA_BUS_FMT_SGBRG20_1X20
> +      - 0x3022
> +      -
> +      - g\ :sub:`19`
> +      - g\ :sub:`18`
> +      - g\ :sub:`17`
> +      - g\ :sub:`16`
> +      - g\ :sub:`15`
> +      - g\ :sub:`14`
> +      - g\ :sub:`13`
> +      - g\ :sub:`12`
> +      - g\ :sub:`11`
> +      - g\ :sub:`10`
> +      - g\ :sub:`9`
> +      - g\ :sub:`8`
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SGRBG20-1X20:
> +
> +      - MEDIA_BUS_FMT_SGRBG20_1X20
> +      - 0x3023
> +      -
> +      - g\ :sub:`19`
> +      - g\ :sub:`18`
> +      - g\ :sub:`17`
> +      - g\ :sub:`16`
> +      - g\ :sub:`15`
> +      - g\ :sub:`14`
> +      - g\ :sub:`13`
> +      - g\ :sub:`12`
> +      - g\ :sub:`11`
> +      - g\ :sub:`10`
> +      - g\ :sub:`9`
> +      - g\ :sub:`8`
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SRGGB20-1X20:
> +
> +      - MEDIA_BUS_FMT_SRGGB20_1X20
> +      - 0x3024
> +      -
> +      - r\ :sub:`19`
> +      - r\ :sub:`18`
> +      - r\ :sub:`17`
> +      - r\ :sub:`16`
>        - r\ :sub:`15`
>        - r\ :sub:`14`
>        - r\ :sub:`13`
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/m=
edia-bus-format.h
> index 62ad82fd285a8ce24bd16c207c51c0e75ea95070..6005f033e62c04bdd3dff7ac9=
05f5b921341cd47 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -124,7 +124,7 @@
>  #define MEDIA_BUS_FMT_YUV16_1X48               0x202a
>  #define MEDIA_BUS_FMT_UYYVYY16_0_5X48          0x202b
>
> -/* Bayer - next is     0x3021 */
> +/* Bayer - next is     0x3025 */
>  #define MEDIA_BUS_FMT_SBGGR8_1X8               0x3001
>  #define MEDIA_BUS_FMT_SGBRG8_1X8               0x3013
>  #define MEDIA_BUS_FMT_SGRBG8_1X8               0x3002
> @@ -157,6 +157,10 @@
>  #define MEDIA_BUS_FMT_SGBRG16_1X16             0x301e
>  #define MEDIA_BUS_FMT_SGRBG16_1X16             0x301f
>  #define MEDIA_BUS_FMT_SRGGB16_1X16             0x3020
> +#define MEDIA_BUS_FMT_SBGGR20_1X20             0x3021
> +#define MEDIA_BUS_FMT_SGBRG20_1X20             0x3022
> +#define MEDIA_BUS_FMT_SGRBG20_1X20             0x3023
> +#define MEDIA_BUS_FMT_SRGGB20_1X20             0x3024
>
>  /* JPEG compressed formats - next is   0x4002 */
>  #define MEDIA_BUS_FMT_JPEG_1X8                 0x4001
>
> --
> 2.43.0
>
>

