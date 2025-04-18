Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8E8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 12:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXkCfmEUc7LzpxVnLIg/IPHBctqoHaGPnaOOKS8P/Og=; b=tvZVlHpQOE3qpxBbXhKnKQ4UK/
	aMqPSysOQ0XGCQtjzDunt4t0rgSupicDDMUCjE+FEv0npwAiFEk5JyKgBmkVDUqBwIcCXza844HWT
	MBaRDkQBuHFgdgPKA5iC/cluUqBPfpbePl72ez7WSxS+Vfd14bQhK8Lh+NjaxowrgGf0d0PHIduEk
	V6VPpetuOjbfHc75EY3YiekW5rIPUFtXyfcAOnCtr9bWS6iZNf11ZmF0rWhHRfuh5KdNQijxsPLlL
	es6YKvhaltJiYXnQKc9yeuH3Zt6phizJ+kv10u57WOqP8VU/vhai6m7mc0qqlIyRfTVGdwyyvya59
	6bhVnMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5l7f-0000000G7Pb-31XV;
	Fri, 18 Apr 2025 12:47:11 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5l5k-0000000G7BW-0zyG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 12:45:13 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso24797556d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744980311; x=1745585111; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OXkCfmEUc7LzpxVnLIg/IPHBctqoHaGPnaOOKS8P/Og=;
        b=qh8F04kEoKkR+69UUZlXFUDe85UsCqrH0Lq5Z7PPFBCkq5B3kze5mY3NyndGlIJFDC
         EDxkLkltvMzmDK3bgPeQNWYzNiSF1EpffTc0DFPoG0+WADsln/BmZ/qkXXJ1Rb9N2eX9
         OyJzv6WMQf1EHbY6LJzCaHGOnX217VqQhaEGfrk2V3R4ALo+BIBYjpsY/oGfPtHk4KUQ
         NIIjneh51sWXgwWHkyObAKm/VjMzwMbEBpR0LCDYY0SM9bpp7Kf1L+cn/h9r1OqrXJdK
         FLufwcrocUL+NSFuJS3hePl/7wKWRRV+BGUqaDBM9qF1vgixIdLW+Abz/niCST8qUOo0
         22Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980311; x=1745585111;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXkCfmEUc7LzpxVnLIg/IPHBctqoHaGPnaOOKS8P/Og=;
        b=S81JqnY+19fweUUFKMlniq+7P9UJpn234RZhScSJIS7z6segAIYPB8OGOU9a85bFCp
         2WXIiG7TTAANlTutXyMoxCMe1gob6kAb+05Njg9dCKEPLIGNXnbSchwM/dIEC1ljgRCG
         IQjhK7nlBlmzEYKy+UCYFSdpZbfUqrSbMb9TP1uJC9l9tXhyZo8jdWwSUTWnSiM1IAD5
         I02CGYCAxOFabQ2cFSxz4lP1wkoy9u30hC5cZ0XMsGyxamMOEPj7C2odtG8W+ScbafSX
         VK1S8p65edJl4MpsXpMWcsjTT2dqK7DdJH11eUobbpvZn/w/awBx53BcDoG5utvn+BG6
         K5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVl3F2fQ1ug0rb1dsgoUJOzzweaYoObarHuRWcMom8wPT0w1DrqgRu/vFR3LIDWviRcbNT03S50koTdaAWD2feL@lists.infradead.org
X-Gm-Message-State: AOJu0YwhrILhybTcrGQAgGgvoC2yUM4VWeIeDtEWEoYm2yQ81X32l3Il
	3+wGkoHBLY84gmJj4+RTW0l6NUWqIu+va7jrvL71UXjkp2AJNSvRuQTYt3tLklE=
X-Gm-Gg: ASbGnctueMI2wZE5yU6X6c79qW3VAfrbHCjXHPu5UOEZsmfNHOmmApt6lK/l68cGYIl
	RPbpn9T3GYKk0J5ceiMV6B139WntULz8NfTHRJNdylIuvOsRP5qriE4m47BMMd0rVduiUeGq203
	xUG7QOm1GGT2c7Lk5HgH4W/54RLeeNJKF9z+whi6j8tAFGLzpJpffJ1xyIokcqrNKpceaY+YT1l
	zoxakuJqWXZWm+XFyybl8pJNk29qomG/LirD1C/GoakumTO4SCcM8U3dRZQisFqOeBIDbScTz4I
	afeQ3FXE+xGoK9FN1ebtS0WOweL3wHpe0F167Q8d9O7JWw==
X-Google-Smtp-Source: AGHT+IEZdyYA51jGvbZkm/yOrNHbFvp9m23H3RTW5HtgAkzz9w0U+ZAEqEnXFIW9TtqYnKH54EJ3Ug==
X-Received: by 2002:a05:6214:daa:b0:6e8:90eb:e591 with SMTP id 6a1803df08f44-6f2c4577f11mr35766706d6.24.1744980311082;
        Fri, 18 Apr 2025 05:45:11 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0f939sm10224416d6.48.2025.04.18.05.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:45:10 -0700 (PDT)
Message-ID: <275992627ec612d0a82f5a63bcdae47efdfe16ef.camel@ndufresne.ca>
Subject: Re: [PATCH v5 1/5] media: imx-jpeg: Move mxc_jpeg_free_slot_data()
 ahead
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 08:45:09 -0400
In-Reply-To: <20250418070826.141-2-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
	 <20250418070826.141-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_054512_280864_4182CB63 
X-CRM114-Status: GOOD (  14.83  )
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

Le vendredi 18 avril 2025 =C3=A0 15:08 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> Move function mxc_jpeg_free_slot_data() above mxc_jpeg_alloc_slot_data()
> allowing to call that function during allocation failures.
> No functional changes are made.

Since the following patch is a "Fixes" and depends on this one, you
must also add the tags here.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encod=
er/Decoder")

>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Ack.

> ---
> v5
> - Split the resetting pointer in free to a separate patch
>=20
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0 | 40 +=
++++++++----------
> =C2=A01 file changed, 20 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 0e6ee997284b..2f7ee5dfa93d 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -752,6 +752,26 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_da=
ta *slot_data)
> =C2=A0	return -1;
> =C2=A0}
> =C2=A0
> +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> +{
> +	/* free descriptor for decoding/encoding phase */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			=C2=A0 jpeg->slot_data.desc,
> +			=C2=A0 jpeg->slot_data.desc_handle);
> +
> +	/* free descriptor for encoder configuration phase / decoder DHT */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			=C2=A0 jpeg->slot_data.cfg_desc,
> +			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> +
> +	/* free configuration stream */
> +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> +			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> +			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> +
> +	jpeg->slot_data.used =3D false;
> +}
> +
> =C2=A0static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
> =C2=A0{
> =C2=A0	struct mxc_jpeg_desc *desc;
> @@ -798,26 +818,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg=
_dev *jpeg)
> =C2=A0	return false;
> =C2=A0}
> =C2=A0
> -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> -{
> -	/* free descriptor for decoding/encoding phase */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			=C2=A0 jpeg->slot_data.desc,
> -			=C2=A0 jpeg->slot_data.desc_handle);
> -
> -	/* free descriptor for encoder configuration phase / decoder DHT */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			=C2=A0 jpeg->slot_data.cfg_desc,
> -			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> -
> -	/* free configuration stream */
> -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> -			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> -			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> -
> -	jpeg->slot_data.used =3D false;
> -}
> -
> =C2=A0static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx =
*ctx,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer *s=
rc_buf,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer *d=
st_buf)

