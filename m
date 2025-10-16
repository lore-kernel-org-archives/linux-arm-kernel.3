Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2499CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5+2CZZfMBynQqO48tMM7HGvpzaeSmX/JqR3/En34zE=; b=XkIuibvYRJjlQ73NzAybXR6GTi
	4Ki4KypOUDm/eP56gemKoRZ2Pun7xSvIH8yaXTKsGuCmEgywiViOflABed7JMtNA/99yPEaJw11iC
	vYOLVgz+smTuR5Ge1H5BJ0R7O6MDG3ZoM11uWONKyHpUJv+te+F5nbhz57Gn6kf1yRe6gYXhlPaMA
	sBMkax3mejeLUYwjs4D1AZmoJ3uPJa3MYdjV0hRwfHYt3qbQhkDDRxijL1F5RThFrPF2Re9Bh7dn2
	F5L7HC2WQDH0Iw6bF4pPMugrhfcVSHjQQcIU60JzE3UThBN6WtsLka9UyFYIPLYsYA+ksYBreEr0D
	1jbGGARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9J52-00000003reH-1KW0;
	Thu, 16 Oct 2025 08:11:24 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9J4z-00000003rdg-3AFz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 08:11:22 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59054fc6a45so525292e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 01:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760602279; x=1761207079; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5+2CZZfMBynQqO48tMM7HGvpzaeSmX/JqR3/En34zE=;
        b=cm+9PeiJ2jo6HghUCKPt/wNxGJmqN2m1nhiXypaEL90FaSB0SDRIfc7CM4QoLPQ0z/
         kcrapYQIb2ah0OVwOm3cvdVd8RcOAZ5y180gCccnsUAx9KbfaNK0KjfXdOmRUgff+3AT
         jPS7QVFwMWjkQTV17nJW5HsCPQjj28UiB8r1opXO4EEMTz2H3F0W+cBtGBwgFjnus0u8
         ffyDuskIAU1reEaGSuSPV3r7yQWJW5NqrkJwZg9JYl+WI7QzjxSFfCO/t63GzyjeykeX
         TsJ6+FwUr47eFqWIx74tDDul0Jc3uPKGNMHBAQZZACHNPuOFku0vvbn4VJcLKAEgzm8I
         ns2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760602279; x=1761207079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5+2CZZfMBynQqO48tMM7HGvpzaeSmX/JqR3/En34zE=;
        b=iTmDEY47hvWYoOQKwdmBrAQF8qQqvIOKuFR71R1rVxBWmZYpwQAy8WoAPnmqMK2i9F
         BjxagNr29HHnhT6tec9o6zzVxYI1PTnqCG+6PrE72HcSiV9CIFFy0QMTaEOgxGmu1j+e
         cf7bklOc4c6KiUQCOgflAh3DqwATaWwlrJzKu45wB7ZKRZMiqSOX1uw1p/JZHgFDCl3z
         3j2Q0bV3Fb0mEK63liBlOSC3H9c8cbnytyjAWeHLTlBfeADSkv4z2KTqv68g6rWggnGS
         9YjKNeUKVhlAgzutyfqTXJftcNJTUkii3YBeXECyGtqPGYLTeweEmyVYNCDmYHG/oC+2
         lirg==
X-Forwarded-Encrypted: i=1; AJvYcCV8lrWFgxIb9uu/mos22yYn4AkOY4FDYuFPfIoX0J0jBz4BWqsqBW3fQA2ySVgTUEE3XEo3aD6uwHPfxpOnou05@lists.infradead.org
X-Gm-Message-State: AOJu0YzK9gr2aTpvBP4B+zFhxmMLkAFaOvRr2Bkskxnut2bRNCrrr7a2
	ghDIXfI+Omj7O/6A1FKtEZMD+vQlER/xdy3Iz2qd/vW3OUUzwqFGJgPF
X-Gm-Gg: ASbGnctERESWtWhDEmA79Bs36gN3mEnj2soN2WcYbpSk385nE+x+YlbUIGhYEEXMt3T
	6pHR2YHZb1l/C31vAAVz7UcPlOce4v86zcBCYIQ2mcSPcoU8sj1Wc8DbhTPkxnGSGb2dY/wiIAz
	dyvwV4BXZj7EFwkDbe2p0lPkGrAM4EMDmpGsylMaKHmaAu6LZloRYs17rkExDzOsgANN4bPmVJK
	BP8jhg2Fk71u9dqNpiXTDsyWL52TBLlt1exxdqK4Y/glPgu4Bu3EQ1rq9EpOnCzhNwsnGk6bjP/
	q3IbjCowf8iw373qAS0TmO4R8cEhbC1ZLjiUoAhNlHyuHeCnM2B5dZWQKOZrPA6zKCauLs4SWJe
	pTCM1b7lDmcQiJhRglSwbKzz2o3tBTnESE6JTf4EZ3EE/SKukCXXzziNLcTsP4kCbbWv1AiztXu
	T++NY+tuSzyuM670xybAdUpUWrPdbTng+NsfU=
X-Google-Smtp-Source: AGHT+IEYWB1mGiujYNtAZfgmbXj5qXzMVo5yOgGV2/jf8UYxiEdfgb8Xo1Yclq2cMZD8i9xmbbs1dA==
X-Received: by 2002:a05:6512:1325:b0:57e:f60:2330 with SMTP id 2adb3069b0e04-5906dc122b7mr8208187e87.21.1760602278760;
        Thu, 16 Oct 2025 01:11:18 -0700 (PDT)
Received: from [192.168.15.130] (94-240-0-2.lukman.pl. [94.240.0.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3764618a0c9sm49380031fa.53.2025.10.16.01.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:11:18 -0700 (PDT)
Message-ID: <fdcbd981-259f-418a-a72b-cc463d39796c@gmail.com>
Date: Thu, 16 Oct 2025 10:11:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/25] media: samsung: s5p-jpeg: Drop unneeded
 v4l2_m2m_get_vq() NULL check
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
 <20251015075353.22625-22-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
In-Reply-To: <20251015075353.22625-22-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_011121_811144_82242FCC 
X-CRM114-Status: GOOD (  17.25  )
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

Hi Laurent,

W dniu 15.10.2025 o 09:53, Laurent Pinchart pisze:
> The v4l2_m2m_get_vq() function never returns NULL.
> 
> In the set format handler, the check may have been intended to catch
> invalid format types, but that's not needed as the V4L2 core picks the
> appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
> type can't be incorrect.
> 
> In the get format handler, the return value is not used for any purpose
> other than the NULL check, which was therefore probably intended to
> catch invalid format types. That's not needed for the same reason as in
> the set format handler.
> 
> Drop the unneeded return value check and, as the function has no side
> effect, the unneeded function call as well.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>

> ---
>   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> index 81792f7f8b16..ff28482759ec 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> @@ -1332,15 +1332,10 @@ static struct s5p_jpeg_q_data *get_q_data(struct s5p_jpeg_ctx *ctx,
>   
>   static int s5p_jpeg_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
>   {
> -	struct vb2_queue *vq;
>   	struct s5p_jpeg_q_data *q_data = NULL;
>   	struct v4l2_pix_format *pix = &f->fmt.pix;
>   	struct s5p_jpeg_ctx *ct = file_to_ctx(file);
>   
> -	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
> -
>   	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE &&
>   	    ct->mode == S5P_JPEG_DECODE && !ct->hdr_parsed)
>   		return -EINVAL;
> @@ -1593,8 +1588,6 @@ static int s5p_jpeg_s_fmt(struct s5p_jpeg_ctx *ct, struct v4l2_format *f)
>   	unsigned int f_type;
>   
>   	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
>   
>   	q_data = get_q_data(ct, f->type);
>   	BUG_ON(q_data == NULL);


