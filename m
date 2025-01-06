Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C488DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 22:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKTyGHq16tbtZ727IbGG7iAWKjSMFE0JRUn0L2vZOLI=; b=4QlUup0y2Qm9co5tTzXxB/h90X
	zRdAGKYyxd1X851rLsicRfTgyPm7V7lTlJuBe7VznsbSTedHYEAT1P/Ir4742n5o1onbUIZPSy9mU
	bMyqxJHiCd/F8v76cBaiAA/apG+uShGW9QoGtI/HgpbRjdOe51UkQC0ScUCS8JQJ9oJIaIMBeMBem
	ki/CsUIzZbdo3AjDT5yDgsUQCC0EM+tqketuOeDgkXDyYZH46F0GDIAW/02KLyfvvcwS1C2jk7bHc
	qKfPBS1AOv81vGEWjYa40h2LLIP5RAZMFUcxUV1XnJMyTm5z+ZUr7dDdC9Xx1I2ul7oMm79U8/Zjm
	+NnnJn7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUvQK-00000002qld-3dUJ;
	Mon, 06 Jan 2025 22:18:12 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUvP5-00000002qZ7-22Sf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 22:16:56 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6dd1b895541so120910406d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 14:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736201814; x=1736806614; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MKTyGHq16tbtZ727IbGG7iAWKjSMFE0JRUn0L2vZOLI=;
        b=2+0bq6uA3jBQMx+LS4OLzEeV0gwl7SaavUeu6K6CNJ9wxvWvT8hx9RRCPdMWTisWvl
         cpcP0isidMLXkxpZ4f4GiGjMMNEtDxEOZAH3AIoM3ULI6nXChvGszDW9qinM+wLYlsEa
         ycuVDfXnQvgWPuyeBZ0dIzAQw5RYuNz8WTD+kdksGKVjBSlRU7euYYr7Cishs33Icza3
         TsIgKKjiDV/LvYjBJMu7xZ+9mLUqFV9aZ6xy8xL4zjY4y1uUFvwyh81ShahNuFdEbDfS
         +3A80QM+sMQKhVLtb/S8TpDOMSjJjfJP2ufk1A4FFbeRSm1orItpz5kDUUkxIw5HdDuX
         7HdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736201814; x=1736806614;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MKTyGHq16tbtZ727IbGG7iAWKjSMFE0JRUn0L2vZOLI=;
        b=Fr3RxsWZkiuHowpEXUmyzQL1CMdatrF78p70Hlwp/b+b6zUv6BHbL6HlIY5OJC7HB4
         NGAouhuuDCERccUIWhg63sxqCwiY9xP3DaBT3dawq84FBeZVN7mrjIL8rUjyhK4g4ogN
         XTMZcyCmNNff4xmqm7Vf7YQWn818QsSs24Da8rs58jBERJEAcX6lDYIR3yMXP1IJzrtM
         StGUDA+fc+zNDB/GTvDWv/63oksj7QW1AfRT1XdMOIPrtuJ0ZAOXx/B9fkJpBRI5m8/3
         LWBd/+/KwzarZCbgA/9vQstv9atVTGM2Dj49LorOcNc6JosAAIARG4mfRpaevtnIPY8z
         454g==
X-Forwarded-Encrypted: i=1; AJvYcCUDGmdGFStAE5MSpeIh+cZL3L114Hx4RVmtTPLliznOwaZvR5BKqcmGPuEp+NZu9mUzeya1HKPjx9w8IhQxSi0S@lists.infradead.org
X-Gm-Message-State: AOJu0YyprRIeRJFvEjOMg0gERd8000+8lFCot+6TX1gcd0+uan/BiqW5
	al/iSosv26MGqo7yAaMD8SR/hK51bqoxK1anpyxzD/SJoe+cWAI2n3z8fyqlt9s=
X-Gm-Gg: ASbGncu8wgjNRf+FzPauqC/SXTxCAbzg/yUJwX1pOQFr82PCvsKnFTmTHZ5Sh+h3BKm
	Ms5xQ0Ni4+As3mUKJ8B5CNTeg+9slc9WLRcTVUxj5dbbdVSDLf62ylBZSTOgWiAKaGPLzkV/jGp
	AHKPf5eAIADdMRkTbkqve48jQ9e9ALBW6o8y2oqeEqhN8erblTgn536RA6Jc0aoP9f0FzfFTNe6
	/mFnvnC1F+0ASAnoqhNw26BKkuTtcy4hZ21gk2JMHd7CQK3sOzlv9RdVg==
X-Google-Smtp-Source: AGHT+IFBCd5sFXzWy1gcNmqfDzYVOs8lG40yFCqGt0rSh5Hxou3JAyyvVXilB2wQl4wInH3b+m+z+Q==
X-Received: by 2002:ad4:5cc6:0:b0:6d4:e0a:230e with SMTP id 6a1803df08f44-6dd23337823mr949624936d6.16.1736201814187;
        Mon, 06 Jan 2025 14:16:54 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2bd0b9sm1541514285a.23.2025.01.06.14.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:16:53 -0800 (PST)
Message-ID: <86d9eb915432c6b070f7c7f524973e9a363de76e.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] media: amphion: Support display delay for Hevc
 format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 06 Jan 2025 17:16:52 -0500
In-Reply-To: <20241219015146.706482-1-ming.qian@oss.nxp.com>
References: <20241219015146.706482-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_141655_527788_81E6CEE0 
X-CRM114-Status: GOOD (  19.68  )
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

Hi,

nit: use capital HEVC in the subject

Le jeudi 19 d=C3=A9cembre 2024 =C3=A0 10:51 +0900, Ming Qian a =C3=A9crit=
=C2=A0:
> The amphion decoder firmware v1.9.0 supports display delay 0 for
> hevc format, then driver can enable this feature.

nit: HEVC

I think this added "feature" hides a bug you haven't fixed in this patch.


        v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
                          V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
                          0, 1, 1, 0);

With the control registered this way, 0 is the default, and the range of 0-=
1.
But from your commit message, this is only supported from firmware 1.9.0 an=
d up.
I think the patch should basically adjust the min and def values according =
to
the detected firmware version.

This might actually be more complex, aka per CODEC, and for that you may wa=
nt to
use v4l2_ctrl_config structure.

Nicolas


> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/=
platform/amphion/vpu_malone.c
> index 5c6b2a841b6f..8f4aa48b2d65 100644
> --- a/drivers/media/platform/amphion/vpu_malone.c
> +++ b/drivers/media/platform/amphion/vpu_malone.c
> @@ -332,6 +332,8 @@ struct vpu_dec_ctrl {
>  	u32 buf_addr[VID_API_NUM_STREAMS];
>  };
> =20
> +static const struct malone_padding_scode *get_padding_scode(u32 type, u3=
2 fmt);
> +
>  u32 vpu_malone_get_data_size(void)
>  {
>  	return sizeof(struct vpu_dec_ctrl);
> @@ -654,8 +656,10 @@ static int vpu_malone_set_params(struct vpu_shared_a=
ddr *shared,
>  		hc->jpg[instance].jpg_mjpeg_interlaced =3D 0;
>  	}
> =20
> -	hc->codec_param[instance].disp_imm =3D params->display_delay_enable ? 1=
 : 0;
> -	if (malone_format !=3D MALONE_FMT_AVC)
> +	if (params->display_delay_enable &&
> +	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format))
> +		hc->codec_param[instance].disp_imm =3D 1;
> +	else
>  		hc->codec_param[instance].disp_imm =3D 0;
>  	hc->codec_param[instance].dbglog_enable =3D 0;
>  	iface->dbglog_desc.level =3D 0;
> @@ -1024,6 +1028,7 @@ static const struct malone_padding_scode padding_sc=
odes[] =3D {
>  	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
>  	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
>  	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
> +	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
>  };
> =20
>  static const struct malone_padding_scode padding_scode_dft =3D {0x0, 0x0=
};
> @@ -1058,8 +1063,11 @@ static int vpu_malone_add_padding_scode(struct vpu=
_buffer *stream_buffer,
>  	int ret;
> =20
>  	ps =3D get_padding_scode(scode_type, pixelformat);
> -	if (!ps)
> +	if (!ps) {
> +		if (scode_type =3D=3D SCODE_PADDING_BUFFLUSH)
> +			return 0;
>  		return -EINVAL;
> +	}
> =20
>  	wptr =3D readl(&str_buf->wptr);
>  	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + stream_b=
uffer->length)


