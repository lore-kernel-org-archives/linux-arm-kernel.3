Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29F1CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 17:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chOqt8RmvPjENMZLrKMXMx23a0j+hi9Mh5r2D2HF49A=; b=oCU2xYSpQ7qchdQ7QztzDYU4cr
	QAPxRimsJAbNvOQET4l4xHEagkAFlPRZm/CF1Z/Pglym1NlqgU5ar7tWs/4mu8Ftf1rKqur7/xNdO
	J3WZnlLoFlmv2nbuiTRV4mZd2BtU0GILMJX3tF4roBa4I84mZUr9Czi7tkxvo/JC2WvDMPOhglXbl
	w5OI9pM5t837ZeEEb1F7iHZicNL7DPXam7S9oFdTGxdAVW7C81odw6HvzOkHVRgQTp35j8S/LHNVw
	jqouB6EUaGYvKsSOznKEwipwOStrbwTEWwUCNEXp3i3CXfac3wZ9K5fdGrrMjcOOpH15ZOR/TZqKu
	NhKp+mqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDny1-0000000GRVd-1VP7;
	Tue, 28 Oct 2025 17:58:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnxx-0000000GRUw-2tg1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 17:58:42 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42557c5cedcso4075160f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761674319; x=1762279119; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chOqt8RmvPjENMZLrKMXMx23a0j+hi9Mh5r2D2HF49A=;
        b=M7HrKNf8W0kPPYpfSb9s7WSHvzS2GBu2/nWaURbd1le8lLJStbGNzEXxb8wrlPuZVJ
         FvPr++WESRuEJ801bOfPJV3SXbyHkpXtxnNLzKP/eaaLlCYrdYDLzTdrBWMWlg/5o0nd
         PJ3dvMbHJmKxD56RZpU5TWDqLNjn6mHpQSGmSvDc/81MqlndRZV99hhdWO37CiJhmDdc
         m4B4A89QoIbhXvImFVaqUbTe7c/JSPBe+2uA0Oh4GZT+p/VYK8X9WJ77q1GymhAeiQjg
         VP0MQyO2/nVWQo4PB5i9PbFSJUQI2RPRZNnKLh48AEz3ahFBfqWUMgWEDOJKaHzA8gCC
         UXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761674319; x=1762279119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chOqt8RmvPjENMZLrKMXMx23a0j+hi9Mh5r2D2HF49A=;
        b=RUuYAcqzO5znNza+EA6ii+2Xi0XnBZ30igkvcb1aAH+64nw+qjVnFPgX7A2PJZ7c3c
         JeAZvO5AKSjNe4JQMHlxHsZsvaploLm7V7Rnmh6RDzOjRxHLhTU7jUTOxlxLe53BvlDD
         kJpx1gK4rtZk23jTyEjmD8+yALQfDrQK54AIR9E/rfD9vWToNYsz56teLckZg3p5HVEX
         qyhZa/WYAnv6Suz/nygQ93Mnlo/mWEcRTl5YmrQycZIo9tm+eK6o9uNz5bUElugt2Tnq
         EtZp3lB04kPbI9TRWPdwE3TS8q+Jzm5aaD2Gt0UuteNWOb794Or1a+kaeP0i1n6nNKHB
         oJxA==
X-Forwarded-Encrypted: i=1; AJvYcCVJGD9PrWVjvvHILi2CGvtv7aokRXqRchCtQvSAdmTY486qKNF3UEXC405gqZjGWTT3PYpE28y1O4Pnj11urdLH@lists.infradead.org
X-Gm-Message-State: AOJu0YxCPk2UQjTitm9cQxaVUUN3zN9YxlOD3Hehy2DZqUF+s9ValjUY
	htsBEzGg5u2ijbKi2suIrFPeNW0D5Dk4Nxogs6YAV3VDYjSsZnDmYPxX9poqt+Myr6EDCyyU/Ig
	J/I1EMJ/REljeJA40Qrzywp90BFd+g6I=
X-Gm-Gg: ASbGncvcAqDb/3CQO+R0gemmuH+r5yrLLAlVC6w2I4FEiP5GPWGA6l4xjjN2GrcRi3V
	Gm9UYHuZsayuZp6FdA2WrMda2sXpaFEqu5Jpkus3t4G4uEllnqYlbWPWoGX0PW3cEWGGNGAi3WG
	nsOzOeP7kEJYLOSJXGtgxZUuviVun+nUI1xhfV5iP4ozjmL0gV11KXCAVeBIsO3l6yZ4NbiUjkK
	BEW3l+FrnPUgNsa/GI8NHveE7vw+pcz/ghhWoUQmcM27tD2qymI+oskglKC
X-Google-Smtp-Source: AGHT+IHh8T3ykEJ2k+SqnqUv99coirZbdgdMUPaGxgoPsKTmKd/b9zWs5bZFLuATTAQlif0eT61G09zLSddJRKJYc3M=
X-Received: by 2002:a05:6000:2905:b0:427:854:773 with SMTP id
 ffacd0b85a97d-429a7e76c0bmr3243802f8f.37.1761674319174; Tue, 28 Oct 2025
 10:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com> <20251002-c55-v12-1-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-1-3eda2dba9554@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 Oct 2025 17:58:12 +0000
X-Gm-Features: AWmQ_bkHVf79naQHjwnfJ41qc93yuL_ZI4xCKXD8yt892ICcC21tOdZ_3oQLbqc
Message-ID: <CA+V-a8suSo-dFNBs=VzwXpJ3XkQjZAMHx71y5ozhZQX1ui=3qw@mail.gmail.com>
Subject: Re: [PATCH v12 01/15] media: uapi: Add MEDIA_BUS_FMT_RGB202020_1X60
 format code
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
X-CRM114-CacheID: sfid-20251028_105841_768091_CF5775F5 
X-CRM114-Status: GOOD (  19.33  )
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

On Thu, Oct 2, 2025 at 11:18=E2=80=AFAM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> The Mali-C55 ISP by ARM requires 20-bits per colour channel input on
> the bus. Add a new media bus format code to represent it.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
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
>         - none
>
> Changes in v4:
>
>         - None
>
> Changes in v3:
>
>         - None
>
> Changes in v2:
>
>         - none
> ---
>  .../userspace-api/media/v4l/subdev-formats.rst     | 168 +++++++++++++++=
++++++
>  include/uapi/linux/media-bus-format.h              |   3 +-
>  2 files changed, 170 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/D=
ocumentation/userspace-api/media/v4l/subdev-formats.rst
> index 2a94371448dc07e5c7097421bd82f42dcd7e21aa..57194180fe42f31f88aa0aeb4=
a4650bf4fb32bcc 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -2224,6 +2224,174 @@ The following table list existing packed 48bit wi=
de RGB formats.
>
>      \endgroup
>
> +The following table list existing packed 60bit wide RGB formats.
> +
> +.. tabularcolumns:: |p{4.0cm}|p{0.7cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0=
.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm=
}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0=
.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm=
}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
> +
> +.. _v4l2-mbus-pixelcode-rgb-60:
> +
> +.. raw:: latex
> +
> +    \begingroup
> +    \tiny
> +    \setlength{\tabcolsep}{2pt}
> +
> +.. flat-table:: 60bit RGB formats
> +    :header-rows:  3
> +    :stub-columns: 0
> +    :widths: 36 7 3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 =
2 2 2 2 2 2
> +
> +    * - Identifier
> +      - Code
> +      -
> +      - :cspan:`31` Data organization
> +    * -
> +      -
> +      - Bit
> +      -
> +      -
> +      -
> +      -
> +      - 59
> +      - 58
> +      - 57
> +      - 56
> +      - 55
> +      - 54
> +      - 53
> +      - 52
> +      - 51
> +      - 50
> +      - 49
> +      - 48
> +      - 47
> +      - 46
> +      - 45
> +      - 44
> +      - 43
> +      - 42
> +      - 41
> +      - 40
> +      - 39
> +      - 38
> +      - 37
> +      - 36
> +      - 35
> +      - 34
> +      - 33
> +      - 32
> +    * -
> +      -
> +      -
> +      - 31
> +      - 30
> +      - 29
> +      - 28
> +      - 27
> +      - 26
> +      - 25
> +      - 24
> +      - 23
> +      - 22
> +      - 21
> +      - 20
> +      - 19
> +      - 18
> +      - 17
> +      - 16
> +      - 15
> +      - 14
> +      - 13
> +      - 12
> +      - 11
> +      - 10
> +      - 9
> +      - 8
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +    * .. _MEDIA-BUS-FMT-RGB202020-1X60:
> +
> +      - MEDIA_BUS_FMT_RGB202020_1X60
> +      - 0x1026
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - r\ :sub:`19`
> +      - r\ :sub:`18`
> +      - r\ :sub:`17`
> +      - r\ :sub:`16`
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
> +      - g\ :sub:`19`
> +      - g\ :sub:`18`
> +      - g\ :sub:`17`
> +      - g\ :sub:`16`
> +      - g\ :sub:`15`
> +      - g\ :sub:`14`
> +      - g\ :sub:`13`
> +      - g\ :sub:`12`
> +    * -
> +      -
> +      -
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
> +
> +.. raw:: latex
> +
> +    \endgroup
> +
>  On LVDS buses, usually each sample is transferred serialized in seven
>  time slots per pixel clock, on three (18-bit) or four (24-bit) or five (=
30-bit)
>  differential data pairs at the same time. The remaining bits are used
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/m=
edia-bus-format.h
> index ff62056feed5b6588bfcfdff178f5b68eecd3a26..62ad82fd285a8ce24bd16c207=
c51c0e75ea95070 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -34,7 +34,7 @@
>
>  #define MEDIA_BUS_FMT_FIXED                    0x0001
>
> -/* RGB - next is       0x1028 */
> +/* RGB - next is       0x1029 */
>  #define MEDIA_BUS_FMT_RGB444_1X12              0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE      0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE      0x1002
> @@ -74,6 +74,7 @@
>  #define MEDIA_BUS_FMT_RGB888_1X36_CPADLO       0x1021
>  #define MEDIA_BUS_FMT_RGB121212_1X36           0x1019
>  #define MEDIA_BUS_FMT_RGB161616_1X48           0x101a
> +#define MEDIA_BUS_FMT_RGB202020_1X60           0x1028
>
>  /* YUV (including grey) - next is      0x202f */
>  #define MEDIA_BUS_FMT_Y8_1X8                   0x2001
>
> --
> 2.43.0
>
>

