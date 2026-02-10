Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167ADEA3F18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 22:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qA7Wxab5lDTDoenQekoOhdDsgl7K+To9SZa88kVTQKs=; b=muIC7L+kdaNGRLQPxnwWw5OQZw
	Nvk6hPgo6Lhd2LDXliVMcd6mJIXP0nIrd6gJ4i/6/0kClNr9F4pIA2WnVwi22w6gcA84da65zwGSx
	byZ06QckefY6+HvoRGzw6AZSSk5M9IYSu/osjof1bZZ91VMmwLP9ZQ2avatbD3ClGSbyto2YO3IZ2
	0oiH+SuvLSO1teYoHF0KdPH/BtESMWHelP7aokfduqAevWwCLLjOC0CVOHBt2QxwFKO2nGi2Dk7UR
	hZEhMoZxMhk2cPb4p+h+VhBIgjtFB8PuTZdJtnd0OMvE18r8xQ2zMg/F2WXRh2b+WEia0oDLMJDLX
	qU9XmkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpvoj-0000000HXWL-2uzv;
	Tue, 10 Feb 2026 22:02:45 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpvog-0000000HXW0-40Up
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 22:02:44 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6582e8831aeso2323941a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 14:02:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770760960; cv=none;
        d=google.com; s=arc-20240605;
        b=GcqELtLlunwS1rgNAQqvkL0RuWRioTFZnWPfZVV2kd3J9o1Z7K5+yaZlT9qXvVKdPX
         nMvRRax4OTDdmQP85+jRvLNBrOQPUWlByc656qpj6/mj9urNM9UGxGHVFfzksvuvdm6N
         ffB22+q6o4WVglgdYOGkxfQ/RT9gNz7GM1JcEglkOicxYmJ5sWFcycCf8M7L+zt/4RYW
         DGQ1tzhWz8YXfRn640R/IqSMWemkk3ULqIXZrLXD+YXGNIUjwFZOJ4IcX0pZ3yw6D0An
         pUWNZzGGNJ/u0PRRZl9i6jXu9HbMKFcbQ9DdPZt7Vw7fu5aRft3nKx42K2qKav9f0l++
         r2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qA7Wxab5lDTDoenQekoOhdDsgl7K+To9SZa88kVTQKs=;
        fh=4jwBkcK+MZVVKDtH2AyDFiguE0Um8G/CnYAqYSlZ5og=;
        b=Y8Pf92fj63P57DcI5uY9FwzQZ5d/DNPz9v4W2MPRx1GN6p7cD4RUN2ssZyAsmi1EKt
         YzDOqq20ip0yKYDGfHbS0BnwcnOb7R35W3lNuX+tmai8IqWNjgersNiWI3wuJIr2JxYV
         dhS7LxpCiUWnbwzo/LhP6Ff3UXcQp2PA5/5Js3UoTKfQCHnJzn6fKuOPE2ARSMarFRAq
         2sYHPmIvuj202FOLu2C8QlODZmx3R/qmUPHSSAnVKGQ3WXRU5G4QAU20z0dYd5cFTDHQ
         3uzfRDODG2/YjXdxkJ8536R9MWJAZpU/iLElQwLlwsy2MoEo76E+tCRpo09DiqHz4W0P
         dyzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770760960; x=1771365760; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qA7Wxab5lDTDoenQekoOhdDsgl7K+To9SZa88kVTQKs=;
        b=ynV9s+9vYAwA+EvU4ieFOMRa5YtarI+tbyTir8K8h+m86R/O9BGe3cQ84glhir/QJg
         x/gxrThd6cBmmd0KFxV0E2uyeCDzP4OukeLV3BckVLP48lZauaQdlevgn1Hg8JkniFaD
         M11GqTotnWpIFU6BDLNV93vgUDXpSnV2yPLkSvvNeKUHfTFjGzua9Ien2YnVb4i3wlwO
         OV6GzeXGMmgCKkvKTunl+ONw3bl9fynSLFMdSgKPf0NNaODGgUqJwP+CMPRUOsyvVokm
         /iw0TVBD/iuxOj5gaxiBbMrH1H0wJ6zP4Hs3UB9IWuAvKmllyitA1J6ypKp8gw/JoDR1
         Avbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770760960; x=1771365760;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA7Wxab5lDTDoenQekoOhdDsgl7K+To9SZa88kVTQKs=;
        b=PqmNgiW/Pou9Q8T9NZz6lapoEXQHsK9W+glUj/zYqZqzW7uzPqTnKo5MFB2IjnZbI3
         qLx8S5pR0/TGnirJQXL0MyXwVxBNnyCg+BmYToPGrtMnZe5AGoqBhhEs2Z9tDsWOB/W5
         fCUW9W1eCYk74jWAzcDRuOvymHP1ro+sWX/LI73SrlKxr8RrH7gEKU1P9mTwTI4mx57h
         t0tNoag40dmAYh6lKYrTL2TmyTP2GEnuug/m8Oy4g9Qqh/Duux1Io2eG4fDdGEaM9AS3
         IiDOjUVkj0a0qL8NXSmR6q9a26LcHc6Ha7mk6aOAXiroIR2JdR6/RgcIa5UlhAPdOGtf
         2dzg==
X-Forwarded-Encrypted: i=1; AJvYcCWrDjEfBWE7k2KA+fkmUF37CkqiqqDBWS8llUF5xi7PnB//9ckb5CfJj5GLHpI9QCyhcRoVFeP4VWaRBlhHIFLX@lists.infradead.org
X-Gm-Message-State: AOJu0YwXSyjRTSC4nPxOIkqhGkgxbyUY+wmr5o7/UJSqUTYbuz9gJ5lD
	V4qngct+GmoF05YnJDepQD/ntOLc0ltMYp7ALgbkfN5+ps13R+ZIF37JzYmeatI9+fsJXsMvv7m
	gt4gqTBgQSDA8Vk5K70i24f8XYNSA2jx9dVPc0Ob4jg==
X-Gm-Gg: AZuq6aJc5Otd1hFIbYzfV5cE/ySDaB6AjkCENwnli3RuL9Q0zY+A3JgII/MNo2PmYrn
	XAH1fKjv5UEky+JiNQojgOXkYg0d9UGizP81c5gGFCttzUKx1CrlnVe/sI3uDhZmBtgOke2hMtT
	n8qDBo24DTZc3oVxi/GVZ1RGgZv5KQYpg5hIYPME8IMxKfMcD0CVI7iNHqT/mwmHHtozfY5FxvG
	nhQqCJSSfxoSDEGmYiR23BRygRjEPMMCVsZdcQojhZqxOQovtma1lqOhyMft+1jmFHkbFzR/8f+
	WRjbK+m7Ylma2dKzqPELCbihWtsiORyPfKy5wmvDyg==
X-Received: by 2002:a05:6402:2747:b0:659:428f:a6c0 with SMTP id
 4fb4d7f45d1cf-65984195a6dmr8461697a12.20.1770760960108; Tue, 10 Feb 2026
 14:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20260209051407.1467660-1-nichen@iscas.ac.cn>
In-Reply-To: <20260209051407.1467660-1-nichen@iscas.ac.cn>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 10 Feb 2026 15:02:29 -0700
X-Gm-Features: AZwV_QiEwWqMd-kvx6163w8_DnjRXZIR5SwPqJy6RBJlGaVXXNh7W1JAS9Kje6M
Message-ID: <CANLsYkwVL76mt1BcKb8OkMBCH5UzrO_rp9ctuGoN1uo7QmYcgg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Check return value of
 regmap_attach_dev() in imx_rproc_mmio_detect_mode()
To: Chen Ni <nichen@iscas.ac.cn>
Cc: peng.fan@nxp.com, andersson@kernel.org, festevam@gmail.com, 
	frank.li@nxp.com, imx@lists.linux.dev, kernel@pengutronix.de, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, s.hauer@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_140243_009646_FC1F582E 
X-CRM114-Status: GOOD (  19.78  )
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

On Sun, 8 Feb 2026 at 22:18, Chen Ni <nichen@iscas.ac.cn> wrote:
>
> Add error checking for regmap_attach_dev() call in
> imx_rproc_mmio_detect_mode() function to ensure proper error
> propagation.
>
> Return the value of regmap_attach_dev() if it fails to prevent
> proceeding with an incomplete regmap setup.
>
> Suggested-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
> Changes in v2:
> - Use dev_err() + return ret instead of dev_err_probe()
> ---
>  drivers/remoteproc/imx_rproc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f5f916d67905..75baf905988b 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1007,7 +1007,11 @@ static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
>         }
>
>         priv->regmap = regmap;
> -       regmap_attach_dev(dev, regmap, &config);
> +       ret = regmap_attach_dev(dev, regmap, &config);
> +       if (ret) {
> +               dev_err(dev, "regmap attach failed\n");
> +               return ret;
> +       }
>

I will add this to my tree when the next cycle starts.

Thanks,
Mathieu

>         if (priv->gpr) {
>                 ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
> --
> 2.25.1
>

