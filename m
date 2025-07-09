Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B978FC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDvxz8anR+BJ4sHLfVXzhIbmkKQRFf6UUA1osiYchOg=; b=YWEKfaQaj6JQnkNWU5JSDhKMpK
	xOhnMb3IVVPhlrTz4H6JpQ6YRlY1ki2aTQ032HNZd7hYMMSHwPoAS5W0C5WZknKxkpXcSeQyjsABB
	PgHjjtTSS9Q6dRX+cegF4XuEgtEYSjfspWBdxBcBisGNGN6OGV6lTz3kYuloJoF68T/V4yNq5rgDW
	qej+B8TMX/Uz0zBy45eiYNdMW3eeEM5OkrGyRbEcWvjxyWlOnrBLBYTJ2F1ej7RQ5B/GFbJECsUyN
	995Jyjsrkess/HMBLl4ETOe+SDqBxXMaDaNX+7uVUQo1lI4hrb7c1kPIop10eoUJ+ima/leNkeGGK
	EmJvXAYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVxs-000000090oY-1qoL;
	Wed, 09 Jul 2025 14:40:04 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZT1J-00000008VXI-3BfL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 11:31:26 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-71173646662so50260277b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 04:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752060685; x=1752665485; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CDvxz8anR+BJ4sHLfVXzhIbmkKQRFf6UUA1osiYchOg=;
        b=Y+EsLCdJHhkhTKOx+yu6oD+JXJFtkKMQA7kOEJrBwEWvbTtiUo8+y+/c6JBg2WubWC
         PZSd9Pme5rw7JHyaD8j/79KuXrXGGT17NYVTPDnek4/h1RyaXqinvgIAF6B02m72V9Vu
         t9URX2/ovFwBMWmKukyuHd8bfD5uYbR3SJxyJgzSV+nrsu9eVM7K24JilxlahIiBGfLF
         g5BYFX/yCuofmCirslYpD+zv4AH4n+wWfSSv+P4qPYcDNyydq3/XqsBhh3Cay/eD7Eso
         B8UUzG7MpF6fNhWH+NLYJqcut2okPp8B+1utTbCMBhaf8dDob7xr3cWGQZPvhe3v6Vd7
         LJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060685; x=1752665485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDvxz8anR+BJ4sHLfVXzhIbmkKQRFf6UUA1osiYchOg=;
        b=sLwiQJrwyCAjEA1iX05kLiVuy3t+h0sKh4xinYuuXNc4yeyp5dxa6impSL0pVheXU0
         UWQLSB+rteCXDnqb67gBh07CZCuoj15FaShNE5VJilNx+u6A6N5mAQqSMF+4W6i6FwN4
         aKYKNieuLH+UCdlLo2n+v2O9zB7kwIzQXb9S0msAaUhti8ioJgvEhXluVw+tb1Bk3mwf
         ls4ISmbgXsMAvnaqA5exLz9/lnAAaiYe15qlPGbNecH1JuzUhB080vFMc995jyTAqvYL
         YxaVb1GNV0sRV2Q3tgAX6FEPmvXh5FBZrrnUnN7fJitoXjlUaYLwCEDlx3IJPScsPFFl
         tAWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRmTSncWi664mVG3IeiyD9cbnSnGmjjx0qzP3Zu5Qssfx0Z6aPx8aJ1otpDhb6u6l6B3GD0mRxXQZHqmkPo7aX@lists.infradead.org
X-Gm-Message-State: AOJu0YwB0bpv29UyIM2UiSGWH1rNgyZiCcmnjvhY0IH2xGnONhKldiql
	mjHp9OWvzMLzLp81p6FqdoonQoyCxTQhSW48WJn6FesZYo+g63HfOOebJiT0JFw94h6OJf0teLF
	p1GYaNn4zIDphMKI5YAIqcEr4pnMQ26SJdcxh61QiIA==
X-Gm-Gg: ASbGncthXfA3MtCXY9KwbdIa8QCeXKcsUTTWusdf6vGRHc7Yasb7cW5mvM9AAKy2aT5
	1N8sVIT/0MYcWZddCjin5YD3qYzudkaWR7w1iXWPYpdjYc2B2C4V72Ix+QjcvgvheYZxtqoCGdt
	7ZSmp8hcu+zbbhR/5BJYOWE5x1ZGiwqHqVV0U0445vgnRfg14LlSDDypg=
X-Google-Smtp-Source: AGHT+IGU+pji3u6/G/drrXD9f6hzZ57lAuY7UQylTxtmRHqJxsYBUBEDT5Y4GQThZIBDfvEDAxWsUuXsGoMFEvARnXI=
X-Received: by 2002:a05:690c:6901:b0:70e:2c7f:2ed4 with SMTP id
 00721157ae682-717b13c163fmr32649447b3.0.1752060684637; Wed, 09 Jul 2025
 04:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <e71abd8d75dd842690e5a11e38037bcf5feac189.1751816732.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <e71abd8d75dd842690e5a11e38037bcf5feac189.1751816732.git.christophe.jaillet@wanadoo.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Jul 2025 13:30:48 +0200
X-Gm-Features: Ac12FXwjFFHXtdaaUqyy9FfmUbPYblM-fvRv4hnhCWqr-KyPAgwmhH4mdvxEDsE
Message-ID: <CAPDyKFr2VPbQRRx6hYp4e6by1O4LvpD=WwwP2gb2KCMTB8uQGQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Constify struct meson_secure_pwrc_domain_data
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_043125_791792_2124BD1A 
X-CRM114-Status: GOOD (  17.11  )
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

On Sun, 6 Jul 2025 at 17:45, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'struct meson_secure_pwrc_domain_data' are not modified in these drivers.
>
> Constifying these structures moves some data to a read-only section, so
> increases overall security.
>
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text    data     bss     dec     hex filename
>    9248     408       0    9656    25b8 drivers/pmdomain/amlogic/meson-secure-pwrc.o
>
> After:
> =====
>    text    data     bss     dec     hex filename
>    9344     304       0    9648    25b0 drivers/pmdomain/amlogic/meson-secure-pwrc.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Compile tested only
> ---
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index ff76ea36835e..e8bda60078c4 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -342,32 +342,32 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
>         return of_genpd_add_provider_onecell(pdev->dev.of_node, &pwrc->xlate);
>  }
>
> -static struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
>         .domains = a1_pwrc_domains,
>         .count = ARRAY_SIZE(a1_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data amlogic_secure_a4_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data amlogic_secure_a4_pwrc_data = {
>         .domains = a4_pwrc_domains,
>         .count = ARRAY_SIZE(a4_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data amlogic_secure_a5_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data amlogic_secure_a5_pwrc_data = {
>         .domains = a5_pwrc_domains,
>         .count = ARRAY_SIZE(a5_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
>         .domains = c3_pwrc_domains,
>         .count = ARRAY_SIZE(c3_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
>         .domains = s4_pwrc_domains,
>         .count = ARRAY_SIZE(s4_pwrc_domains),
>  };
>
> -static struct meson_secure_pwrc_domain_data amlogic_secure_t7_pwrc_data = {
> +static const struct meson_secure_pwrc_domain_data amlogic_secure_t7_pwrc_data = {
>         .domains = t7_pwrc_domains,
>         .count = ARRAY_SIZE(t7_pwrc_domains),
>  };
> --
> 2.50.0
>

