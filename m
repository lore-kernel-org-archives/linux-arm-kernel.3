Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1525CE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 10:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwroZ5ftifLjf2sYQGLnTg3BTauvYFKzYd2jyBf2Tpc=; b=F7F0yVVO2olLpIfBSIwn+PWVA1
	+3XR+yiq5AAS1gAGGNjXLAJak1wC8i+aBd0NpseYhvyn3hOpGhGQs0dIWP6N8MKZ7Shpu82IbTCnM
	gjTXOxUqoJwvD9tcRaN1B7K4f25Tz+TYAoFoSWk1ff//iDrb9mH1MFmiDesp8mAXQbIRek77Fhyey
	Lp6yY+fy/FAngc0oa7lGvkF42iGTpq3ZSp1ITuscfuKOzqHPmFcS4xWF2BZeoPkX+vzeTHaiYSq+N
	SXWUlbvYZJ2MaC5rccKK0H65MWOFLpb5P3ce1gGxpawhuqQrTqlUMcnjAfdYCOJxXnLRjXPJNF8Wk
	EWV2Ouow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfKl-00000009l8j-37mu;
	Mon, 23 Dec 2024 10:06:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfHl-00000009kqx-0x40
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Dec 2024 10:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HwroZ5ftifLjf2sYQGLnTg3BTauvYFKzYd2jyBf2Tpc=; b=pHApdTCTt1Wx9RzYnx0SM+qi24
	3bmLmNOQwnDXOZGevspMeOXU/87xRlRSGIQQUYR9/z6ke4IYeNi2jJ1Hwjyr4rS+8HUb/kKZlZhQD
	NJHT6vxp+tuZDzZTJq8HT1b6CeHa+d9xRKQdw8DTheHPuL7jk2mVcDC64uvuX9XG0DsBKiQhhuIfY
	rJU3HCapd7GErcJwkJdb05fzj8kHxvRL9DbmqFOt3qVNYaTDlaozeUVzmH95uULg3KyBToI2NY/R/
	LTV4WYNZKVFEvBDVXrTr5OfNIar8dw7krXAPe+21RWACU8kk+o+mdq+Y2ovbqyNuP7dUlYdEz2VoH
	WeIebFRw==;
Received: from mail-vs1-f45.google.com ([209.85.217.45])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfHi-00000006JRT-0psS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 10:03:36 +0000
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4afe70b41a8so1124470137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 02:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734948210; x=1735553010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwroZ5ftifLjf2sYQGLnTg3BTauvYFKzYd2jyBf2Tpc=;
        b=Ni9pojdEIWg6qNFVGmUehc5k0tSjHmDFGt1vKpg9YjhFtRbhLhVFJKAWzegd4WCa6j
         etKuct0N5vWhmmf6J6MU58fMC5yxJnP3XYqiYXLB96VdZvl59PbftNL76+uLopr8uOGb
         xXoYMkDEeP9dGUXPbHZIhx07RSqLM7/MyceOnGIEZrWs6puccPX9czmNDN/HTjwvbtr6
         kwgS+k/rsnMk+C41Pfh2ENrBeeSRro4vZfiRyu6jCK/tNVYzr0wOEh1bJxqfCz6NfXV4
         L8f6LvlR8zcecIrS/3eiu67/HFgpX4dI6tqLXeXiFrr+Y3Yo/SjMTBe2TKoGhSZaFYCv
         vp5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8quNYOD7wTBzot9lkb2x01pZS0Xgq5yFI+k6jeU0yZ4pgeaQNGKNznEGAAWLBN7s2D8161FGVtA65SFXzzLNN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5urNp6X+gHdmbn2+zbSVayMh4gkcRhffJjfti9bQYuiW/ZYxt
	exAHtvMBljYgY8O9VM8rFyqkDt3mxxy/8xULv1SXk1ByH5yMb1Y6gyu5dFqk
X-Gm-Gg: ASbGncvb7sgW+o6YyXIhw+d040rtk6hywD2qD8le/Wxrq6vYPCPBny3qdQoTKIADQ05
	8Vw8DwD9JHjdcdcVYPN9XmtZDU/uKjyvOo6dACiH/YS6Yjd+sDk1cg1KXHTn3lGizdEpRULcRsU
	j54MbDc+uQVXcZv9q+g3Tzn65CWNLECdPXAQxTq87mhqsBCEg55ak78+d3yfNm7cb/ELDEHo2CQ
	IDAA/xTpqxSN8GUTrQ+a2pDbaR3wwBt33k8wlqHe7k4I7qSqmcRhCCIto6t2RGcwgdjaxyyR2yY
	tRqQI3e7XVnze4pla+4=
X-Google-Smtp-Source: AGHT+IELgCyE4FSZT0QtcFFVkACUpAL+1nqmOtldsYr8Wn4R5Ns3y7BNIRVzg73SQY6rnvordSHYFg==
X-Received: by 2002:a05:6102:c02:b0:4b2:5c72:cd55 with SMTP id ada2fe7eead31-4b2cc31f256mr10921032137.5.1734948209959;
        Mon, 23 Dec 2024 02:03:29 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2ffcdbd26sm75319137.6.2024.12.23.02.03.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 02:03:29 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afe70b41a8so1124446137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 02:03:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyEOiEyhfyXZde94GkXXYfUSfdEMJVGJ+rPoiZ459ZdeTMZXs6tyWP6cAS/Vp2PaL5CRjgWbHbU4HnXLVKsWSZ@lists.infradead.org
X-Received: by 2002:a05:6102:32c5:b0:4b2:bceb:1ac6 with SMTP id
 ada2fe7eead31-4b2cc45eaf6mr11513750137.17.1734948209264; Mon, 23 Dec 2024
 02:03:29 -0800 (PST)
MIME-Version: 1.0
References: <28f88e536cab0abd5712787350b012bb0f1eacb5.1734445715.git.geert+renesas@glider.be>
In-Reply-To: <28f88e536cab0abd5712787350b012bb0f1eacb5.1734445715.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Dec 2024 11:03:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSPVcOYyDBsoHOVZP9RO4=RryefeH7nGUaTUZRL1OtNw@mail.gmail.com>
Message-ID: <CAMuHMdVSPVcOYyDBsoHOVZP9RO4=RryefeH7nGUaTUZRL1OtNw@mail.gmail.com>
Subject: Re: [PATCH] firmware: imx: IMX_SCMI_MISC_DRV should depend on ARCH_MXC
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Shengjiu Wang <shengjiu.wang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_100334_557721_91A47DC6 
X-CRM114-Status: GOOD (  19.36  )
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

Hi Arnd,

On Tue, Dec 17, 2024 at 3:37=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The i.MX System Controller Management Interface firmware is only present
> on Freescale i.MX SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> asking the user about this driver when configuring a kernel without
> Freescale i.MX platform support.
>
> Fixes: 514b2262ade48a05 ("firmware: arm_scmi: Fix i.MX build dependency")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

The issue this fixes ("the whole world is exposed to i.MX SCMI firmware
questions") is now in v6.13-rc4.

> --- a/drivers/firmware/imx/Kconfig
> +++ b/drivers/firmware/imx/Kconfig
> @@ -25,6 +25,7 @@ config IMX_SCU
>
>  config IMX_SCMI_MISC_DRV
>         tristate "IMX SCMI MISC Protocol driver"
> +       depends on ARCH_MXC || COMPILE_TEST
>         default y if ARCH_MXC
>         help
>           The System Controller Management Interface firmware (SCMI FW) i=
s

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

