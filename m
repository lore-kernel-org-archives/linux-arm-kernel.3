Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BBACA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 09:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wjbO+/CzvSzhggdBHtlSBiSOrC+TN4SiqbwtSU008o=; b=LmYo8KpragvtIDVymoCYEwjeW+
	bYPdaikemBsnaT9uhuxv7UmUNmJ90iwseAb9vJqAOR8mCGCOCWrJYZC/hPlEPOx9mHYTZfvd+Ugbu
	ylp0WCKORYBrSBDns/FL/J6Nwd3yBlLvN6xUGekmfiqi8TOB8/3Ry3sMKY0ijOZdMn784tIpaaOv3
	kfr+iet/J4oNvMCancVRfOFt635F1LzGqDZRxwXALtvuVIPmUg1mXE2ceg8tZLzJpsy2AcfQVanrm
	sW8pdOkcI+gtnXb0+BpZBi2M7on2FwSb2JusDhcsIzB4K+c/LdH70Q+iBUJLOip27vnXZ2Uwx1ZW8
	nxr3fCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpta-0000000BM3S-20aN;
	Tue, 26 Aug 2025 09:23:14 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqoh4-0000000Ax9s-1roC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 08:06:15 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-afcb7af30a5so904493866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 01:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756195572; x=1756800372; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wjbO+/CzvSzhggdBHtlSBiSOrC+TN4SiqbwtSU008o=;
        b=Y8/2pv5d2nUkKd5W9wW8XoFEgUcnCkQRNoINiCF6ANnLNNxQqvVXUh4QdtiOm6Z5D2
         61CgOPiSQe5B/n6bJc8jfEYedEzvqcqjZH4+vBM2g5fT3rv/zSsNV+fASBnqUeZMAVi1
         7KUqNOSd3+d3P8KJmo4YrnV2szfA1koczITD+lAsQuzy/Bl42XcNrld3Tr+CZ1BlENze
         Q5tpPvBIb9Wa/2kN+ADsNrrQ2pxuxAzQfzi8KwHlpnCaCBj/O4+uRiuKuGOPY6MECiBn
         PSWN4CITIzMREEQZoXkmCIfxXOafp28Tw3MTb5WGGdKJtoqcpotK+6I3VXLDqXbkJgdC
         K3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756195572; x=1756800372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wjbO+/CzvSzhggdBHtlSBiSOrC+TN4SiqbwtSU008o=;
        b=KpDcI3kZNCo1yArOMRfBdwJeMh3DWGb91MbQMYvB894sretg9jYXluAzKjBzsbDrYf
         EJjDirl54sjlGEdvOMfqVw544kpH4mhIHPAB51CWB+DAGyMQi443GpDmf3UQJZu5AUbB
         tga2SZEaRTaZNeSQYtEOShYs3id7PHrxIhwG9+yngy6jyueYSF4puEx7Qdg5RD75yUDn
         Qb0aMDHjCx43XsbLl6t9Uw+h222FFDg1WuOsQEOIPJxJjY8OHLtcIMjktrJpcI4dW+u2
         VyustlJ6V9Q+zOiG1cDx4DvofboG9Gujw50ZmynoydGF4M6xiw1NH+FlVrETCZIlQ/Wh
         6weg==
X-Forwarded-Encrypted: i=1; AJvYcCUm1fp3nrjfUc9QPfOVx6DJMLzN9LFoRXx7clG+bJdOOnBvr8YfBj+DhQU+WqaBs8+zhaK8Wo6/kdtTVErYY1qX@lists.infradead.org
X-Gm-Message-State: AOJu0YxvLoQJhJwmXiulz3zF69G8DnTxPCADV3gpzyLopu8L6FNOGwpa
	znXdnCgSmp3Ul9e4a2ls3cxEqSEdIXZ9vfH5p/lGf5EfbGwaPpkkvTOcmxhkoj/8bST6pYoOH09
	CXuckKUOhzTPXK8LX6gXUnpTt3cVV20g=
X-Gm-Gg: ASbGnctTb+PRvutNBnN8uw5MJX0yAe2ULvljlFebJ40uArmzGQSjxunfyicTbKax3z+
	XtU5o4G1o49AZ0RiFahbGQkxdcAG0R08Gu3b6syn3nmzB3zs8beuiogQqYdZP6WHXmCPVtskeA8
	C3oqkXEcTRqFEOISeCIRimIC680koEIozH7XPzGLfoDI12dHQIdigovOEWsDsGxxIQR986r45Jt
	fBtyxg=
X-Google-Smtp-Source: AGHT+IET95gesPsImlWxfCSqXy/xiG2n7VC6emkdon2TKt+AHqmFUOCd9ze1yaM/komtsJdO29Rh9lxV5vuG/ZzJHKo=
X-Received: by 2002:a17:906:ef05:b0:afe:8761:e77a with SMTP id
 a640c23a62f3a-afe8761fad3mr537764766b.19.1756195572104; Tue, 26 Aug 2025
 01:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250825205235.1766401-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250825205235.1766401-1-sakari.ailus@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Aug 2025 11:05:35 +0300
X-Gm-Features: Ac12FXwdLHPHoVmXYor1LPriFlV0142umbIIkjkJQym6xu1Er8B2ZfjAPn-xRkY
Message-ID: <CAHp75Vcyr2gQ_Z7BV5nEJCSb1taWnBOfCfTWMQtMG-65Z+D0Dg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] iio: dac: Remove redundant pm_runtime_mark_last_busy()
 calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_010614_482707_D57AAAFE 
X-CRM114-Status: GOOD (  14.51  )
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

On Mon, Aug 25, 2025 at 11:53=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Also clean up error handling in stm32_dac_set_enable_state().

TL;DR: I think this change makes it harder to follow (due to complex
conditional).

...

>         ret =3D regmap_update_bits(dac->common->regmap, STM32_DAC_CR, msk=
, en);
>         mutex_unlock(&dac->lock);
> -       if (ret < 0) {
> +       if (ret) {
>                 dev_err(&indio_dev->dev, "%s failed\n", str_enable_disabl=
e(en));
> -               goto err_put_pm;
> +               goto err_pm_put;

This is one time use for the label and we know that ret is set here.

Just

  if (enable)
    pm_runtime_put_autosuspend(dev);
  return ret;

should work.

>         }

...

> -       if (!enable) {
> -               pm_runtime_mark_last_busy(dev);
> -               pm_runtime_put_autosuspend(dev);
> -       }
> -
> -       return 0;
> -
> -err_put_pm:
> -       if (enable) {
> -               pm_runtime_mark_last_busy(dev);
> +err_pm_put:
> +       if (!enable || (enable && ret))
>                 pm_runtime_put_autosuspend(dev);
> -       }
>
>         return ret;


And here is as simple as

if (!enable)
  pm_runtime_put_autosuspend(dev);

return 0;

and remove the unneeded label altogether with the error path.

--=20
With Best Regards,
Andy Shevchenko

