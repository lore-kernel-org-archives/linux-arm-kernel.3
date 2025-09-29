Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC825CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lD/ZRIRPRoD4eeilEpQ/Ax8KbRLZBttE2gusXUBy/7U=; b=JU8Ah7X2PEPxwuVS5NuJqUvRAl
	08RVZbJfy081hLrt3311zy2XWWgSo+gOfb5KYnuEM5NvrP62UvUMSXfdtK6+lHmjup/mphwfBCTpv
	W/LaQuLyou9SQJXa9QuwMqrnQ8PBJTNWEw/LgnW6BnMRKRYkskPGWN2dg9Yl+Nqi57SkRfmwZb8BH
	WC8tbgEinSDje9r587YHOCn48823EgLvY2T5OZocwMzq7gGISc3r6DmXQZ/XdLxQPrlpWOroWXGTy
	pbkH3zy3rMXDFPPmTRY9WQMjBrdQhCWEOFgHVWUslfGwZBdbMFFBWdNGeSjL8GwVVhYZwu0hmC2M6
	bdOxeMAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3FmG-00000002mnj-46Ia;
	Mon, 29 Sep 2025 15:27:00 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3FmD-00000002mmp-2xRj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 15:26:59 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-366ce79fbeeso43559611fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 08:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759159615; x=1759764415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lD/ZRIRPRoD4eeilEpQ/Ax8KbRLZBttE2gusXUBy/7U=;
        b=YYTIc2jZHZLROPB1u44+vCBM/89/CdLLjjG/HoLv25VU5WcCwGfV/d6ue6upT+LhrZ
         X89mcs/0q5fxNLXAFu/l4m9YOtVspGCsPk2UVKVKhMwUzv0xYpeuznOogSQCA7ECaxHg
         PlqGuEinVJ49TxjCYWuSF5fBCMbH6FBjhmg74n4MTKmaWLo6dBTo7XxYJfvp+nzt56Uz
         A5EXDJvpWzKvqVJM1v9Rqn4c5ggRIGBeHLdAVPLkwcaf+TuS6FK6BRSEgATjthLwWGYd
         p4tWorrVvGTMQe0t2WDD0xyWVupgUjxA8UdIE31NQbp2tXuA44wWNXRCgbWaRXiUwRpQ
         AMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759159615; x=1759764415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lD/ZRIRPRoD4eeilEpQ/Ax8KbRLZBttE2gusXUBy/7U=;
        b=N0QcQ2xc2GakSmNO1csqJ4eTibOh6bJ+VFOmaYpXEOu5YfEyqTTCtROHLatKkPuBA9
         rhTHa0KgaizBRg00Zbjdl8kuW6JG7yGO+Qgd/x0pbMkT4bR+I8DMplfdafXXgEyLTM0A
         1wdXkuidTsD5rK0e07RA08jp3X1yG0ECvATDUcPE5WwOM6KIHbcCY6tXDUvmryQtIoFd
         WSJ1KUZ41wDKV/k7MfjTZ0yqldjrG95yaro5fG1nOrnhBkjukPwGiGOdCE5zm45OV5fc
         iM0SsVU+/HWF+tp7Jqwmvc3Dx9e9gng+I3pcMbYBWyVtEcJ2cW7YIIwbTxHb18dOR3wT
         XYlA==
X-Forwarded-Encrypted: i=1; AJvYcCX/B7iIbt6mCFGIjMd1vUokaBGTpkpYzEvFG2i9UnqmwFEQhwb+NFJNOxBWMAil4yMOMv9Ep/6NTayCGFbwGDRk@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo2pMYXRQFsY6c231IXNiWHyj2cyhAEqPIEpApheWmKHYXwJAe
	zlyZHOEOuiZdm/BBgnAjgKocDut6gQF2/n8yCw3i64ZPZe9zFdhlLwUgHpmyYlqjsnCJGObNvpw
	Gh6cFY7mPHNyK0KFvEXlslZr4U6cTT41lINANGqPMRb878GOS5Cs9qLaHPVxa
X-Gm-Gg: ASbGncugCsInCYH11lFcTQpprRUwDUTPPUQJO953k5ewqSzTQ2vsE+MmT4zwk+NRb/3
	WX98ddiNhhb3J7HEf2FDCkCqs/ZR5HqelyirAy3RNs+EIymU7e0o6LoQypNZXMODT4BbXaObuva
	JIazZWOOnBPdVFf8gSley/VjHhuxEu8BkpgY3JyJFI5YQJ52WE7KDc+bxW0e3js8xQcP+ypst+G
	A+Uol8eWYB/tTavwg==
X-Google-Smtp-Source: AGHT+IEtN2lUKLnGoQ7WbW57ONBR/QKmzEKKycsDkK+DioqKXixXXuBeSvK0yyrJ+ATSRroRyWJm9ggSxHWFJcUI9/Y=
X-Received: by 2002:a05:651c:25d3:10b0:372:950f:2ae2 with SMTP id
 38308e7fff4ca-372950f3057mr14578111fa.5.1759159615153; Mon, 29 Sep 2025
 08:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250929025358.2064-1-vulab@iscas.ac.cn>
In-Reply-To: <20250929025358.2064-1-vulab@iscas.ac.cn>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 29 Sep 2025 17:26:44 +0200
X-Gm-Features: AS18NWC2Vrzn89dFO6i3Pc5PcwsDZZtJqDcKNUIw8w9lRMGluo4z28T9Y4iCLNQ
Message-ID: <CAMknhBFm1HPKv6bPnYALc_=wGBHWB3SKnWmnBZ82Pan9z9TPVw@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: mt6360: Handle error in cleanup path correctly
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_082658_002488_D2386BE4 
X-CRM114-Status: GOOD (  21.60  )
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

It looks like you missed the IIO mailing list in the CC, so this might
not show up in Jonathan's queue.

On Mon, Sep 29, 2025 at 4:54=E2=80=AFAM Haotian Zhang <vulab@iscas.ac.cn> w=
rote:
>
> The return value of a regmap_raw_write() in the cleanup path was
> being ignored.
>
> Fix this by checking the return value and propagating the error.
>
> Fixes: 1f4877218f7e ("iio: adc: mt6360: Add ADC driver for MT6360")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/iio/adc/mt6360-adc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iio/adc/mt6360-adc.c b/drivers/iio/adc/mt6360-adc.c
> index 69b3569c90e5..97c4af8a93fc 100644
> --- a/drivers/iio/adc/mt6360-adc.c
> +++ b/drivers/iio/adc/mt6360-adc.c
> @@ -70,6 +70,7 @@ static int mt6360_adc_read_channel(struct mt6360_adc_da=
ta *mad, int channel, int
>         ktime_t predict_end_t, timeout;
>         unsigned int pre_wait_time;
>         int ret;
> +       int cleanup_ret;
>
>         mutex_lock(&mad->adc_lock);
>
> @@ -130,11 +131,15 @@ static int mt6360_adc_read_channel(struct mt6360_ad=
c_data *mad, int channel, int
>  out_adc_conv:
>         /* Only keep ADC enable */
>         adc_enable =3D cpu_to_be16(MT6360_ADCEN_MASK);
> -       regmap_raw_write(mad->regmap, MT6360_REG_PMUADCCFG, &adc_enable, =
sizeof(adc_enable));
> +       cleanup_ret =3D regmap_raw_write(mad->regmap, MT6360_REG_PMUADCCF=
G,
> +                               &adc_enable, sizeof(adc_enable));
> +       if (ret >=3D 0)
> +               ret =3D cleanup_ret;

This overwrites the original return error, which is IIO_VAL_INT on
success or an error code. In either case, changing the return value
will break things.

In cleanup paths, there really isn't anything we can do with return
values other than ignore them like we were already doing or log an
error message.

>         mad->last_off_timestamps[channel] =3D ktime_get();
>         /* Config prefer channel to NO_PREFER */
>         regmap_update_bits(mad->regmap, MT6360_REG_PMUADCRPT1, MT6360_PRE=
FERCH_MASK,

The return value here is also being ignored. If we decide that we
should add error messages, then we should add one here as well.

>                            MT6360_NO_PREFER << MT6360_PREFERCH_SHFT);
> +
>  out_adc_lock:
>         mutex_unlock(&mad->adc_lock);
>
> --
> 2.50.1.windows.1
>

