Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F4AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 07:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSXRG4UDI370NboKvA/d+qzWYgjnMyk4awDopImJtPY=; b=Dnufc8VmSNKdSLbQUX1/Z4jo6B
	zIRR0dCIWCmc5eysK2FDQYEhE2V6/4I2c4wPjawm+7RXWK+gC1I47/ITnC6WmwKjoBph5deNMnj1W
	8fu0odxKNnSehyMZO/kjpQfF/Tm1aL+mEdYHDs8OWPyqy01HSUlbGbEU2b7PJkJU1mgN3xlSLpa4M
	F9ltw9yy/NfW9zWPeHwwUKltgtvOrcTJ7O72N+aozM+VRTUUHWEaCXR2WMF42jxN/pzKjn64FbMdC
	xYuLG910i48B0/mk+V30oemZSCUx7JQHHvc1Jnd6/slXQ9na0XDGYWtwGCGCdWrYHAMsfUnb4EUqn
	ApRX3SMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljTC-0000000A7VG-053p;
	Tue, 12 Aug 2025 07:30:54 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliGW-0000000A0Hn-1KuQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 06:13:45 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55b8f1a13e9so4585787e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 23:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754979222; x=1755584022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TSXRG4UDI370NboKvA/d+qzWYgjnMyk4awDopImJtPY=;
        b=hLUlpnljZVJSEiXacXRaSixQaOz9EsOppgXl2QtO+vYGkOs5reOcYcm0pAoQ38U4Za
         RUEGdjCVhmYaNVa4aWE3PFubruU9+hMaCzWmtmhju5zjTM5na/I4W8nnzELPQvhzLxZq
         ZZW6Lbu0HbthuUu4i8gElY+hV3+2N+rVyqgJxmpVKN8QA1BmCRGumdaMqFoWsedVJBUz
         9eL4538f9BceFoZTzqWBDAZljKL+GmisniVgpMwdikP/hL44gJy5wh7zuH4PITJ3aK2F
         dMh2Xlm0E9qvpnCeXr95ewHmC+Hj+s+Mq2mmcr6wIwZOh0hGNhCbVf+bm9qnziZjhlIU
         Fjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754979222; x=1755584022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TSXRG4UDI370NboKvA/d+qzWYgjnMyk4awDopImJtPY=;
        b=nzvIHM4ShVxzDqrYdRVsM9PFNv0d2F46oKJz9PBveSAJRTYdVzhSJP94hkvk9ZtC9g
         8iennO9NREzx/UApdeMrd4TQU9oDAF0UrPot9Zzut9iH6f76hnDmhG/o4HT/s0ADak44
         O0Fnf1Ypv57JV9clRheZZKmWn2RFbQsQG70lQ4Pn3S3mx2KZDM2Kju/PB1HVN0j8kqQ6
         t4SgC5QRlvVCIulu9vec5eL25utvzGzoX6BXDjk8SWWBGjHq+5UB+TgNQRj9QItmI+nY
         RLQiEcpM3QPRIqrJjGCHXd4f6h/4Yonk1qLoftGFJw0iI3zA25sxUfUTuYhhFLA+JAyX
         FIZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+zVEFksyJ9oxlvej527uXnUDXmOSoGmbwSEOn+Sz35wHySbL3u0ECAq0PswjLLUDJ83fwNi7dlNhbd+Zm6/as@lists.infradead.org
X-Gm-Message-State: AOJu0YwVmUHBLtflD2ox7hXwnHGMYF+Pkhu36Tvf+NzSA0prp2NJONiL
	kKDu9eZ7/hvDIZYLQp6A2Dplz6BQP0StbxtKnWwBpGFE5fsdrvgXl5Ot
X-Gm-Gg: ASbGncvitTRXqBEtq1bai4rKtmiLmjdVR2eJ6lpgGrodscM19wgtfRe751FEgQbuscG
	pQvl5LOzSpd1poOzRgb4A0U2UI4BdD/oMVgfUdUO6t2HEld7MqfmIgApUc1V6XZaJmpaSZadRy6
	AiPfDJ98YSeDNIXZo99MxO1gG+JRZ3RvBqVxqePLGLPbxD6YPxk2EcZ16so9zdmsCGGjqZEMV9k
	KuZOVVEVlx9Cofw+084E7g/dWGp/PVoARZrzGc495G77YVQIrSvTWzvjE7Eqy+YEeGSnxZ3JadG
	qnIIoF9iQ+9lEYR57pXjLd888uQc5Z6S6PZdA8W9rKc73h1R2kuh6r1zRsEMBYuUL95xPo8QlUc
	tFm46cq+gBEqELWJno4i5hL24gu+qg73sNhgLhW66TT0tbvA=
X-Google-Smtp-Source: AGHT+IHD1nKmWw3ewqqmK3tmT5SLNBo0Q1b6H5f7Ay3XURTOzQQPfxP60v/DXVcVArn1HmiAasOnww==
X-Received: by 2002:a05:6512:15a9:b0:55c:d5f8:7866 with SMTP id 2adb3069b0e04-55cd5f87a6dmr841162e87.57.1754979221938;
        Mon, 11 Aug 2025 23:13:41 -0700 (PDT)
Received: from [192.168.15.130] (94-240-0-2.lukman.pl. [94.240.0.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cac7626fasm2645563e87.174.2025.08.11.23.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 23:13:41 -0700 (PDT)
Message-ID: <b6f75a41-d5bb-46c7-966d-eeb1d47736e5@gmail.com>
Date: Tue, 12 Aug 2025 08:13:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 56/76] media: s5p-jpeg: Access v4l2_fh from file
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Hans Verkuil <hans@jjverkuil.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250810013100.29776-57-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
In-Reply-To: <20250810013100.29776-57-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_231344_382633_48AAC203 
X-CRM114-Status: GOOD (  19.84  )
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

Hi Laurent & Jacopo,

Thanks for taking care of this, this generally looks good to me,
but please see inline.

W dniu 10.08.2025 o 03:30, Laurent Pinchart pisze:
> From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> The v4l2_fh associated with an open file handle is now guaranteed
> to be available in file->private_data, initialised by v4l2_fh_add().
> 
> Access the v4l2_fh, and from there the driver-specific structure,
> from the file * in all ioctl handlers.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Update file-to-ctx macro due to removal of fh-to-ctx macro
> ---
>   .../platform/samsung/s5p-jpeg/jpeg-core.c     | 27 ++++++++-----------
>   1 file changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> index 65f256db4c76..81792f7f8b16 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> @@ -580,14 +580,9 @@ static inline struct s5p_jpeg_ctx *ctrl_to_ctx(struct v4l2_ctrl *c)
>   	return container_of(c->handler, struct s5p_jpeg_ctx, ctrl_handler);
>   }
>   
> -static inline struct s5p_jpeg_ctx *fh_to_ctx(struct v4l2_fh *fh)
> -{
> -	return container_of(fh, struct s5p_jpeg_ctx, fh);
> -}
> -
>   static inline struct s5p_jpeg_ctx *file_to_ctx(struct file *filp)
>   {
> -	return fh_to_ctx(file_to_v4l2_fh(filp));
> +	return container_of(file_to_v4l2_fh(filp), struct s5p_jpeg_ctx, fh);
>   }
>   
>   static int s5p_jpeg_to_user_subsampling(struct s5p_jpeg_ctx *ctx)
> @@ -1015,8 +1010,8 @@ static int s5p_jpeg_open(struct file *file)
>   
>   static int s5p_jpeg_release(struct file *file)
>   {
> -	struct s5p_jpeg *jpeg = video_drvdata(file);
>   	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> +	struct s5p_jpeg *jpeg = video_drvdata(file);

What is the purpose of this change?

Regards,

Andrzej

>   
>   	mutex_lock(&jpeg->lock);
>   	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> @@ -1253,7 +1248,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
>   static int s5p_jpeg_querycap(struct file *file, void *priv,
>   			   struct v4l2_capability *cap)
>   {
> -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
>   
>   	if (ctx->mode == S5P_JPEG_ENCODE) {
>   		strscpy(cap->driver, S5P_JPEG_M2M_NAME,
> @@ -1301,7 +1296,7 @@ static int enum_fmt(struct s5p_jpeg_ctx *ctx,
>   static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
>   				   struct v4l2_fmtdesc *f)
>   {
> -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
>   
>   	if (ctx->mode == S5P_JPEG_ENCODE)
>   		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
> @@ -1314,7 +1309,7 @@ static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
>   static int s5p_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
>   				   struct v4l2_fmtdesc *f)
>   {
> -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
>   
>   	if (ctx->mode == S5P_JPEG_ENCODE)
>   		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
> @@ -1340,7 +1335,7 @@ static int s5p_jpeg_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
>   	struct vb2_queue *vq;
>   	struct s5p_jpeg_q_data *q_data = NULL;
>   	struct v4l2_pix_format *pix = &f->fmt.pix;
> -	struct s5p_jpeg_ctx *ct = fh_to_ctx(priv);
> +	struct s5p_jpeg_ctx *ct = file_to_ctx(file);
>   
>   	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
>   	if (!vq)
> @@ -1480,7 +1475,7 @@ static int vidioc_try_fmt(struct v4l2_format *f, struct s5p_jpeg_fmt *fmt,
>   static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
>   				  struct v4l2_format *f)
>   {
> -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
>   	struct v4l2_pix_format *pix = &f->fmt.pix;
>   	struct s5p_jpeg_fmt *fmt;
>   	int ret;
> @@ -1539,7 +1534,7 @@ static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
>   static int s5p_jpeg_try_fmt_vid_out(struct file *file, void *priv,
>   				  struct v4l2_format *f)
>   {
> -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
>   	struct s5p_jpeg_fmt *fmt;
>   
>   	fmt = s5p_jpeg_find_format(ctx, f->fmt.pix.pixelformat,
> @@ -1686,7 +1681,7 @@ static int s5p_jpeg_s_fmt_vid_cap(struct file *file, void *priv,
>   	if (ret)
>   		return ret;
>   
> -	return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
> +	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
>   }
>   
>   static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
> @@ -1698,7 +1693,7 @@ static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
>   	if (ret)
>   		return ret;
>   
> -	return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
> +	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
>   }
>   
>   static int s5p_jpeg_subscribe_event(struct v4l2_fh *fh,
> @@ -1795,7 +1790,7 @@ static int exynos3250_jpeg_try_crop(struct s5p_jpeg_ctx *ctx,
>   static int s5p_jpeg_g_selection(struct file *file, void *priv,
>   			 struct v4l2_selection *s)
>   {
> -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
>   
>   	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>   	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)


