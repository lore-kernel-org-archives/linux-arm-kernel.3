Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C749C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 02:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iv+ULazfCotUfqTUQgUOXEi7/XbND58A2hHC6r5AKlU=; b=tQWOMi9ZW6yUVOu4V7HkX0agn/
	3wqeq3C8Iz78he27JfjkDI5KZznYTH1sXMID6DJ+udyVNGsDwTMB14RlZVvyJ4XlPEUS/uyqtnLUd
	rRw158pqz3nDq20vWvJUILD/Ar116SNgzEA81o0gUd5ht5R4J9xBnkMuPjb/dMvAtz6qSHnfmixsK
	jDFSaYvOsTZ1F9wFkfsQe0gQKLxKxKYKAXlsJHTmnpdo730GNbDCQ0Zvl6Wi06OopX6yjtFgohsN9
	9XjRMzCd4aT3HgE0/VAdj5YvI27VVkYdMITnxGYQBmF3P+X+Q3ZR7WYzHi9hLoTUh40SCbzMEfXna
	OUHHIgiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUyRf-0000000DKdq-3lbk;
	Fri, 27 Jun 2025 02:04:03 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUyPF-0000000DKQq-1B32
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 02:01:34 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-52b2290e28eso345103e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 19:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750989691; x=1751594491; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iv+ULazfCotUfqTUQgUOXEi7/XbND58A2hHC6r5AKlU=;
        b=NkumAQW0nxeZnwxgsB5n99TGOArgwVD+BQga+2aAv8OligC4vkDMeupcS66VK4p96g
         iuKNK5sgBUnVrnnVFdv1T0P0yg95aTN3ZPWgybioBBKkbCIDg5Ga3POwXs+bn/XkLrPZ
         N1XkdmVzcEm0c9Pd4CUTf/zTJ6GRI49egD5HjRjSZ1FHdTuqgzu1MpsKprRoFYIfThKq
         hGbtJwNrFV9P6KPEJvw44Fn7ahc4o+N2OkeQV00108GnLv+OwJ7w7yEzjLsl9gkOUDa7
         JF6Fz/vTDqeif4PNoXxq2gQpyft7MYOWfqWmdjnQ04G8jxJWFNzhajq1fqh56b3Z5xMj
         eMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750989691; x=1751594491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iv+ULazfCotUfqTUQgUOXEi7/XbND58A2hHC6r5AKlU=;
        b=FNg3mnfO7XXBTl1Ybbwq7uOnUctlyoGraFDmGt8ggHMnaZOsIZochyy76u9vN5oFJX
         26ylAiXjjTbN4J9/GaK1MW4Kb4ByNzrNAY1S/1m/5nJHf25x8ERVOmWMiTtGzwJ7YdMU
         uWlknufys5tnxEWiLadHgOKSvIoaSUOzjP1eiTB8Pkc3IEOB4R/wND2rtsxHu4vT6G2d
         cnjeBvIg5Cvtp4eGa+5esOSqk3XuNlB9zfsO1acxMw4yoauzVlh7C/gASqRQHPrLGpPJ
         y0cU9Ed4CyB0oUwyZJlH8Jqc/YHmeCiiScdH1fZiKF9AgFSy8WAMCBfXYmnFmQ+CPQUg
         slqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpgb3VlFOKQBrorKEgBIpBe9nJwPVJ6YwJRlo8fBuwe6aOPrRM1tJVM5fsh5YKHfrwD+/GnrSKmjFOH6EQum2z@lists.infradead.org
X-Gm-Message-State: AOJu0YxpvwZqQT4mW2crbed4L6t93oZ8nC3alMh4oxIpMWLD7EYIkXId
	SQBkEv3fXPlNj1Q3S8ftZ961JG1kpSEr95f1v5Phwa7Ijm6mdSxIbsEkY0mA08JxkdCvO6ZvrV5
	qfeP/t43qzKma5Agu/Efj9/jgD7ptuvw=
X-Gm-Gg: ASbGnct6AuWa82pt7phD6H7wmE9B0Igvu/BfvhQQ6BCc9iq+pyWIxHl9F6POxibwWVy
	YqmwTntIS0uOgjAbOqdXopbe9sv1Xm0q2eKVTfoF21lahXq0NqszXZV04FQIF5o1kfiU0zSMIYI
	tyEYrYpewqECwc2o5WX4mttbsn71cQhIzZukaA3LlHTQ==
X-Google-Smtp-Source: AGHT+IEfDkUmXmdGNiYTAmO+fSQE3VFxMdbIHmR6wR3Spz90Kei7f1lHrowLtUvc0N5RL+zWLCQWluZ6/tNtS2e7eSo=
X-Received: by 2002:a05:6122:21a1:b0:531:4041:c4c7 with SMTP id
 71dfb90a1353d-5330bfd4563mr1451187e0c.7.1750989691380; Thu, 26 Jun 2025
 19:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de> <20250618-restricted-pointers-drm-v1-1-781e0d88cd92@linutronix.de>
In-Reply-To: <20250618-restricted-pointers-drm-v1-1-781e0d88cd92@linutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 11:00:55 +0900
X-Gm-Features: Ac12FXzQxzyREaVVCRYXuMvFKjupkA98dfTPk38AOS_x9wbPi10kqXkSS64ZqjU
Message-ID: <CAAQKjZNG73CX8ebxqLgcYRGguGya-9zODL3BTdBDgbgJLJZ9jw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: samsung-dsim: Don't use %pK through printk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_190133_341217_FBB123AF 
X-CRM114-Status: GOOD (  17.90  )
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

2025=EB=85=84 6=EC=9B=94 18=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 4:56, T=
homas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
>
> Switch to the regular pointer formatting which is safer and
> easier to reason about.

Applied.

Thanks,
Inki Dae

>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 0014c497e3fe7d8349a119dbdda30d65d816cccf..bccc88d2594840647d7107c13=
d69104912087384 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1095,7 +1095,7 @@ static void samsung_dsim_send_to_fifo(struct samsun=
g_dsim *dsi,
>         bool first =3D !xfer->tx_done;
>         u32 reg;
>
> -       dev_dbg(dev, "< xfer %pK: tx len %u, done %u, rx len %u, done %u\=
n",
> +       dev_dbg(dev, "< xfer %p: tx len %u, done %u, rx len %u, done %u\n=
",
>                 xfer, length, xfer->tx_done, xfer->rx_len, xfer->rx_done)=
;
>
>         if (length > DSI_TX_FIFO_SIZE)
> @@ -1293,7 +1293,7 @@ static bool samsung_dsim_transfer_finish(struct sam=
sung_dsim *dsi)
>         spin_unlock_irqrestore(&dsi->transfer_lock, flags);
>
>         dev_dbg(dsi->dev,
> -               "> xfer %pK, tx_len %zu, tx_done %u, rx_len %u, rx_done %=
u\n",
> +               "> xfer %p, tx_len %zu, tx_done %u, rx_len %u, rx_done %u=
\n",
>                 xfer, xfer->packet.payload_length, xfer->tx_done, xfer->r=
x_len,
>                 xfer->rx_done);
>
>
> --
> 2.49.0
>
>

