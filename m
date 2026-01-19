Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC99D29C4D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 19:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCb1Q/eNGJuZWnaSy0QMCWG02dACV3WSdsoPlEt9HTE=; b=kmBOgfsR2+5IIjdIy4vr3oC+yO
	37s1q+uMnjcCRylQNayUJEfxpWrHrc76CTsNxQQbNDD2IkVtj1LRS89fSVc6pw9H5f9nVAKtTrOzn
	LhVdSgtzVuZi+Y7l40RmpcWHCU+/weATrGPS0JK30t/gtWvht/5x4UyME0LtwNxoxXjpsLeYDScbH
	fk3q7nx945EfrchUxWUXhClqHxgAdqSA3VUxbREBjYBp1BgxpcSzShZHDQGQ8O8yrRHX/y7KmA5/P
	4SxqGjc/EonHXY9prDiGfxhbpZskRz1LxzaA2akE20p3wpJpm0fFITO5zdOPWYh+Z4X77yhWoy1x5
	WDmJVS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuqk-00000002m1h-0dfJ;
	Mon, 19 Jan 2026 19:23:42 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuqd-00000002lxd-0z3X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 19:23:37 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-563686df549so3627869e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 11:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768850614; x=1769455414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCb1Q/eNGJuZWnaSy0QMCWG02dACV3WSdsoPlEt9HTE=;
        b=taG2un18ijf87iUpKV5DiZuXLPzjpgNNGSnW10SioqsBMBgo4GYI3IEkG+kHdZrYRc
         f9nMJST/QElr2/6kw68CyT55SK+O7+uk39gHlxhifWPQHEBwRGZXPpFyUMnOtbM5d1qB
         X4vH6OLm1FGm5Krh69WQuC/v35vnW9zYHpVNMMg2EcLG0R1zXm8MkliwNLzuO6H3wkCf
         pNN11XSuoomgj5Bk5KNbKpi35GILylQcdmA6cIOknWqfMEgQOnaHYZl9BjXLzav97rwp
         cakqfhjKZ9UvT6QUtZPBsJKuqV0W1pLzqXhYhr/FdqunZC0ZqrLdzEfIUVEY0VC/ah0h
         TbHw==
X-Forwarded-Encrypted: i=1; AJvYcCUt+pUsTlQrLLKOuzLlKunFClkovtylIjwyojufme74DwSEfo9t8OIpNx1f+/bhuV+/sTrz7JQR7IyGUtD7E67f@lists.infradead.org
X-Gm-Message-State: AOJu0Yw41a+8w4bvUKkWe7VRjH/hgg7DClZDUMSW4tOkshztEUZtdaIw
	sbQf5nOjnkm4f2SVog5IgVMmjB8DU0eZUw+/reHaFgu8aFfEs53iG974WiXI58tf
X-Gm-Gg: AY/fxX6BUZV5ph8oHgBNnQ8MQ0qb4/cCZYgiO6N1oLgRfLtD5tw65KXqFVwaBz+T13H
	9aOwH9fEkk1mD5sETWaqkghPLTVUCi6EdTb+5KLOBtmDkG++AqLF78G/SH43TWFkqqQ4i2imWK3
	FQ8fCnEzKr+uAGg3wmtmgTc1CeizbX/xXPg3nnaCEODelM8OK7eaYfr/GFu2Z5z1MXR8q9MV1z4
	E+n39w5ryWo7OYSKREfcUGM8RXc/EEps8I7Yg2aEVjcKbV4t3ENcKV0MQbbu8063PKFVa1+tS6V
	MCB0HShNY6icU12wYdVqIlDJcoNOVC6mi3ODJatvSDdSiu7f3bQz/bA8GnY2qlEIhfD/pZumNtt
	CL8K/QzhUdntZDfq3z5CmfUrP7mQpNLgeK94C6Mlf3ziXV5jH0kKecpgPtDayrTVEh4e6OimN2U
	zIDHAqNQGJZD+y0FH7Nsman30SwUGVV1Tr3L4vBRMa6J3ZsI+9
X-Received: by 2002:a05:6122:4b15:b0:563:4a88:6ea5 with SMTP id 71dfb90a1353d-563b5b9fcaamr3423656e0c.5.1768850613685;
        Mon, 19 Jan 2026 11:23:33 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b70e7eaasm2968316e0c.12.2026.01.19.11.23.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:23:32 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ef2561e395so3044125137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 11:23:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhT+bGx+HmsjIjJqdt0d+5GkStiVZuP9duYlezU+A5vEN9uOaxz0mD89LjC1C6b6uZaQRQOH8OItWhjRb5/wAO@lists.infradead.org
X-Received: by 2002:a05:6102:44d2:10b0:5f1:c453:b5ab with SMTP id
 ada2fe7eead31-5f1c453b6acmr1782180137.13.1768850612507; Mon, 19 Jan 2026
 11:23:32 -0800 (PST)
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:23:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXt69AywBVsY3DKH+cS52=Cw1xsvvBDBV3MXirZ+LYj+A@mail.gmail.com>
X-Gm-Features: AZwV_Qja2okCrIX9za1x2Adx7NBF3Qx2Xd3iJQm2I4PbFkiFeek_zkUKX3woR2E
Message-ID: <CAMuHMdXt69AywBVsY3DKH+cS52=Cw1xsvvBDBV3MXirZ+LYj+A@mail.gmail.com>
Subject: Re: [PATCH 3/8] base: soc: export soc_device_get_machine()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_112335_796840_70D558F2 
X-CRM114-Status: GOOD (  25.04  )
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

Hi Bartosz,

On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Some SoC drivers reimplement the functionality of
> soc_device_get_machine(). Make this function accessible through the
> sys_soc.h header. Rework it slightly to return a negative error number
> on failure to read the machine string (SoC core can keep on ignoring
> it). While at it: make it use the __free() helper from cleanup.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -5,6 +5,7 @@
>   * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/err.h>
>  #include <linux/glob.h>
>  #include <linux/idr.h>
> @@ -111,17 +112,18 @@ static void soc_release(struct device *dev)
>         kfree(soc_dev);
>  }
>
> -static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
>  {
> -       struct device_node *np;
> -
>         if (soc_dev_attr->machine)
> -               return;
> +               return -EBUSY;
> +
> +       struct device_node *np __free(device_node) = of_find_node_by_path("/");
> +       if (!np)
> +               return -ENOENT;
>
> -       np = of_find_node_by_path("/");
> -       of_property_read_string(np, "model", &soc_dev_attr->machine);
> -       of_node_put(np);
> +       return of_property_read_string(np, "model", &soc_dev_attr->machine);

I am not so fond of these of_find_node_by_path("/") + something replacements.
What about adding an of_machine_get_model() helper?

>  }
> +EXPORT_SYMBOL_GPL(soc_device_get_machine);
>
>  static struct soc_device_attribute *early_soc_dev_attr;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

