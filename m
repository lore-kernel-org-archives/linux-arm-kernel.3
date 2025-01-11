Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36C2E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRoev3bZkaY0/ccSVGaXVhSdE1JTCCaY7SMUcS/N5gE=; b=knxDkSctVttZXlb2J52YDdSOoC
	E+I+FqQQwV1SKVVS9z8g/2VYAqzukC4k+F5o2oA61qnN3d/CuzcC9iOJQvCmaKVoYLbY7fsXHfK/3
	zKdrPhG0gGZ2hOY0vegYIuoy/Pc9I3qfJnBDBPcfdM839cJ/TOHmlWKdzBU3pfdzMoCB7aRbCUXng
	vD0hee+8qEGfUAhPB86OBCdNfspniW76ID7sUfvmq0Zw8E0yGvgWmX+Al0Yhmxe5TNuPG/oSOiEjd
	32IbgxIrRzUTWKldTLahPHYxHavxFRl9srqHRc/4TaPI2H/KZQ4y8TQnJOIjAv2eKXwMTrp9eR9LF
	b6xtDxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWaND-00000000ksh-3Op7;
	Sat, 11 Jan 2025 12:13:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWaM0-00000000kmV-13kX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 12:12:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D70D5C271A
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jan 2025 12:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7325C4CED2
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jan 2025 12:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736597554;
	bh=0GwypkPnWt/RJ4fOsgJazzW5HFbXsyFVM3KJa4beDIc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fxrCQMr+RCvNGMaiA6ixR0TWRXYKzahN74tGdnMrP+HY/IOQ6+acTQOI5m3/ZDqZ/
	 2fMJE+8zn4AhM/On64vZObAO6aAQXvgfOpPOrbTgkHtuxwhk0TBoFmGEU/47/t2bD7
	 nhaNkiXg62ZeriuGk8R4jDbfDcJQcM0uVbbhgsUKHaJMyfFfcTgAPv30awkKzOM9zQ
	 ekG9RMzAASEEEXS8qaNF5FftbjaBNvD9WoqkMMaeO6hZDGsGlyfdNONIdMaf+K56gG
	 RmFDxP0xP07kNpPqTa+26zUFAXauAozK+ccC8eHP2WApe9GGg6wSY1DeQzzbVXQyyk
	 xBn0GBYLRnWUg==
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-71e2bc5b90fso1444470a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jan 2025 04:12:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6rSJIVyDJKB9eEPvW+1ZCKtEfWWPaYbbMh3lrsuPL2Y5hnxbxOG9aaHSO+whbXxo+ToeFyCO8sjw7/Pj+v1pu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7LVJjA9C4pb2HfDAEVGNqs5set38RkJ6Y6z49EbGW4DEqgTBM
	czfJkhxAWLhz8wFDF0gzLcxPGb47ELcr4VxNsCs+6vm2oREnE/G30D6loiA7ULP0hEgRMbOimmc
	0KzDDpVKIqtknNxD52nenD3QtpY0=
X-Google-Smtp-Source: AGHT+IEA+04JMbR+NRAig83ydrur6btFIeS5TcU1Qs7bn3iWd4r1LnpTaQxOJRAw5YKsg1jbSKvC3H1HgwC0F8K5xco=
X-Received: by 2002:a05:6870:9d1a:b0:29e:4111:fefc with SMTP id
 586e51a60fabf-2aa06689212mr7311232fac.12.1736597554200; Sat, 11 Jan 2025
 04:12:34 -0800 (PST)
MIME-Version: 1.0
References: <20250110173520.78464-1-aha310510@gmail.com>
In-Reply-To: <20250110173520.78464-1-aha310510@gmail.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sat, 11 Jan 2025 21:11:57 +0900
X-Gmail-Original-Message-ID: <CAGTfZH02tdR_5i_RwghpRqb7WXtLMFFUNGrXrTXQ=UWNCwC0wA@mail.gmail.com>
X-Gm-Features: AbW1kvYpgl8fYL3OchY66N21_jsSfItdGZkJkogkPHBgXj8fF5dOaAOM10nqfIE
Message-ID: <CAGTfZH02tdR_5i_RwghpRqb7WXtLMFFUNGrXrTXQ=UWNCwC0wA@mail.gmail.com>
Subject: Re: [PATCH] PM / devfreq: exynos: remove unused function parameter
To: Jeongjun Park <aha310510@gmail.com>
Cc: cw00.choi@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, 
	krzk@kernel.org, alim.akhtar@samsung.com, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_041236_335224_97AC610D 
X-CRM114-Status: GOOD (  19.08  )
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

Applied it. Thanks

On Sat, Jan 11, 2025 at 2:35=E2=80=AFAM Jeongjun Park <aha310510@gmail.com>=
 wrote:
>
> exynos_bus_parse_of() still declares a parameter struct device_node that
> is not used yet. This parameter is unnecessary and should be removed.
>
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
>  drivers/devfreq/exynos-bus.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> index 7d06c476d8e9..b9ea7ad2e51b 100644
> --- a/drivers/devfreq/exynos-bus.c
> +++ b/drivers/devfreq/exynos-bus.c
> @@ -236,8 +236,7 @@ static int exynos_bus_parent_parse_of(struct device_n=
ode *np,
>         return ret;
>  }
>
> -static int exynos_bus_parse_of(struct device_node *np,
> -                             struct exynos_bus *bus)
> +static int exynos_bus_parse_of(struct exynos_bus *bus)
>  {
>         struct device *dev =3D bus->dev;
>         struct dev_pm_opp *opp;
> @@ -408,7 +407,7 @@ static int exynos_bus_probe(struct platform_device *p=
dev)
>         }
>
>         /* Parse the device-tree to get the resource information */
> -       ret =3D exynos_bus_parse_of(np, bus);
> +       ret =3D exynos_bus_parse_of(bus);
>         if (ret < 0)
>                 goto err_reg;
>
> --
>


--=20
Best Regards,
Chanwoo Choi
Samsung Electronics

