Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDF6CCFA1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0SC5dtN/EI2PuuKztOZyox/MGIrIYy9hq7oU1yzaSE=; b=qRUlBPfGBJd152O/V+myKl8gtE
	xxfSHmYjchiN5YlqCWNHzAV6dshmMqePpqfGDcPEH7BmEz8ltHCdz9e+W0FetZNCma/gF3AWbUjhw
	IxVfKEj5mkWoPMgmbJQxWV70ebCKq5QfmYx34FQ0P1OTQdsGfPi7vfpg82SEuS+5sI27h+zuLxhFA
	0mASUza+wsEJ42ljLrK52tYDm1D3t5wtZo1IpVSVxYuOTL1zKy4mXPQUVlUX1bicguanm1HXIvy+C
	ldODlopBLQa2AB69DB3wZKZxfl6bwLAOnm16EEUlyMZ8UGFqiHWB9QwKqhhSmay/e/2an2PUxdBr1
	HFrPuTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJmF-0000000H6me-44vj;
	Fri, 07 Nov 2025 10:33:07 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJmE-0000000H6ls-1Ef9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 10:33:07 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59428d2d975so650956e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 02:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511584; x=1763116384; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0SC5dtN/EI2PuuKztOZyox/MGIrIYy9hq7oU1yzaSE=;
        b=DoqofBLwa/Ly2vcK4g3y3zIQr98GeAg8UGl4K9q8B91hSbdofKcyJX3GNTbpA7IZ1L
         U3pc/58zzYAXjOu3UGsI1x1BGM2x5gQqrudxf98gxcR/dzgSvJf8jqxgLUAnb4iQhcMi
         NcJMTSCq718CnaTC8U6EgwPzr6k68GEHJGdvxd8HAXEt1PNg6Pag6O4YhWnypA/blYhf
         XdIp1j43G0OuXRfDGV7saxLhrE2AhzU/7ybR4KycWCVgy7fuzb/v1TN0OBUVQc/3X3KM
         R1b/6iDMjXTL5aGc8I+lNWdD/LVoHH9tgxdxBaKBRMRVJUXgM7DfsT+Kp0quFXLeyEyk
         nfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511584; x=1763116384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u0SC5dtN/EI2PuuKztOZyox/MGIrIYy9hq7oU1yzaSE=;
        b=L3yxUbzQ2Cr79TvGUwCQe67hDxGh9inrQDMFwqO2fKuh7zYGz1TZNxFGvfV7toeHZ1
         de5idrDFsgHUw36V+BQiR2m5NKtr7V1BgPKiuXlV6jjX+1YQgOu8sEluNhwddbMVRD8b
         HwxYSX5gMWXOTPJN9G0TTPJqSP9J9ZJKhbYz5ixW938ci39TC2hejHJ2LFwdglgmzxMf
         fzZEd9UsI7ePUokjH3/5UW0BEzzk/Xoip/p1HtvTSr//bwOeKzM9/EREHX1vA4GhLeXj
         Ikk54g+PkPqccKQ19cFuO2oNuYtoGj/3cOtY2nZC22EJNjNW67ZR8036xl4YeXxJb7En
         PHkA==
X-Forwarded-Encrypted: i=1; AJvYcCXXvHYJpSSc/IMdgMMs44M3AogT/ev5VDLxLHoXZs4ZRCVEbPlGrIw0cdbWxKHSV0+CHzBBXG2BWVSDENoY+/H0@lists.infradead.org
X-Gm-Message-State: AOJu0YxP8NJRGs7SzIASDB3HqaTWBKWyxsklpOCJmz0Yzb+Kp1PL7lgI
	MEPI1TdaYOPq+A24xnEuvSXNpKo3v3LkbhYtbQmAxzscTe0T1FIqdKEbABW5354cUQgNaIPfzTU
	sUrq5CvlnuRtOuynGWBCE5QPqpY/VFug20s/psbX+vg==
X-Gm-Gg: ASbGncthJmzw/M1Oauliz9LhJVG1yQ8CFIjxNEqtsk19WOHudKURe2rIx9yOYOBczwt
	YoiIttHAxH6BkD2syk/5Nzn5E9JUt67HGAOjBdxJA89744zEhRXuMfG92emFnFMhjOP9LVU3llR
	fAFrbnm/6a5Ks74NXIiAM/39EgZSRxRJc5hr2MKFS2QLGf04A4u4NW24n5YWo/2YBIHq6amoXWh
	Abv90uHNYMfpQvnsYd7freLHiKsJ9Kkyskxz4BiMzFbgTs6HWLb+NRheZSl1PQ12SXrKBXOhOn9
	ytxA41L1uBaoLMKy6iysaJaW6w==
X-Google-Smtp-Source: AGHT+IH/NaO2IV2PuSuT+uIy0ell6f4pEVJBNYisr1Il5Fm4JRWfx8ML7AoeEUzy6VOMfbvkcuWVGadITNGQPdN4yQA=
X-Received: by 2002:a05:6512:3a86:b0:591:eb00:9795 with SMTP id
 2adb3069b0e04-59456b5b60bmr827315e87.13.1762511583894; Fri, 07 Nov 2025
 02:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
 <20251106-gpio-of-match-v1-2-50c7115a045e@linaro.org> <CAMRc=Mchtho0yDsSp+wwBt=yBGg1+3i8ifkUrip1MJaq-uk+0g@mail.gmail.com>
 <cf23070f-8a3c-4c13-a46c-dc95f044c936@linaro.org>
In-Reply-To: <cf23070f-8a3c-4c13-a46c-dc95f044c936@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Nov 2025 11:32:52 +0100
X-Gm-Features: AWmQ_bk09Ua_9bvIZ5lzbEUjBii8ELdurCEnXHjZ0WSd4oyNENmk6WbdUM8c1Lw
Message-ID: <CAMRc=MeQk6BnKPGNxmFYP6Z=Qmo+PB0T8bBZGAbR3LP7xRzELA@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio: aspeed: Simplify with of_device_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_023306_351312_F514CA57 
X-CRM114-Status: GOOD (  19.90  )
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

On Thu, Nov 6, 2025 at 8:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 06/11/2025 17:23, Bartosz Golaszewski wrote:
> > On Thu, Nov 6, 2025 at 5:16=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> Driver's probe function matches against driver's of_device_id table,
> >> where each entry has non-NULL match data, so of_match_node() can be
> >> simplified with of_device_get_match_data().
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  drivers/gpio/gpio-aspeed.c | 7 ++-----
> >>  1 file changed, 2 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> >> index 2e0ae953dd99..3d675b63936c 100644
> >> --- a/drivers/gpio/gpio-aspeed.c
> >> +++ b/drivers/gpio/gpio-aspeed.c
> >> @@ -1305,7 +1305,6 @@ MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
> >>
> >>  static int aspeed_gpio_probe(struct platform_device *pdev)
> >>  {
> >> -       const struct of_device_id *gpio_id;
> >>         struct gpio_irq_chip *girq;
> >>         struct aspeed_gpio *gpio;
> >>         int rc, irq, i, banks, err;
> >> @@ -1323,8 +1322,8 @@ static int aspeed_gpio_probe(struct platform_dev=
ice *pdev)
> >>
> >>         raw_spin_lock_init(&gpio->lock);
> >>
> >> -       gpio_id =3D of_match_node(aspeed_gpio_of_table, pdev->dev.of_n=
ode);
> >> -       if (!gpio_id)
> >> +       gpio->config =3D of_device_get_match_data(&pdev->dev);
> >
> > If you're already doing it, just use device_get_match_data() here and
> > elsewhere in the series.
>
> That's not exactly equivalent, but I guess it does not matter if driver
> probes only via OF. Sure, I'll change it.
>

In this case, it probably doesn't matter but in almost all cases it's
better to go through the fwnode path, as it also checks potential
secondary nodes when retrieving properties. Not to mention better
portability of the driver if needed in the future.

Bart

