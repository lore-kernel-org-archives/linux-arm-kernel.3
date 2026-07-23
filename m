Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E039C531CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 12:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aB8Q4OnQxgGR3hOnEbILSOeq7HiqZdVqhRD7b5FSwLU=; b=iHrxggIEhyxTFgr+0HgjzF8+N3
	1UGSiFtdxBWILAwR/KlRWjg/7VjwADiQUJlLhveJIPtPcr5qJxA5cIM3HUhcp6HBx9gY0bTDQ/cKI
	Igt8leWd5B/Zdi1JXrnb4ipWpS/P/4GJ/vRUG01g/Tl+oM2NWEn3c7F2QVCzhhsU1za749/LqgyZR
	+D2skGfucpj13L5hLeBx0iCVJbpDOgXxuJ96P1iDgx673sHbDh33fLcKc7Lx2wYgngyhr3QIND5ij
	ZLIz/CF+ZX4UcRIxDb/rQtKGPCWdiiSXHatCCQ9RBceqnF76BjlJqcFfu3GQynLDy4BeDlA0k80oz
	d0lUq90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsUL-0000000EEPG-2sK4;
	Thu, 23 Jul 2026 12:25:21 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsUJ-0000000EEOa-24OJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:25:20 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so930625a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 05:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784809517; cv=none;
        d=google.com; s=arc-20260327;
        b=XhAvIoIbBpHkdo+rINhMtVIjBBhHM+BizRIpfDxRz7mbQPqy57XmON0gXwLgIOFEGf
         fDnaOvVoNFgDyFz62luffa1sUskQHa31dviAIhcxRG37n4cZNTCE8igbqej6Esyd1iPF
         SGDsHvTWPyuHbqO0CIdg7atDhlqvJfYBpehBwoVvK4X3n0CDFh6ppLOyIP7c3zXWGWIa
         vEA8oy0kfqyqgOEjLinQ/MXNyYhe8+Ckv6NQ8Vwt4fPEG607SzU6ZxzTCxGaT8KzM/r3
         JOUOZQTMkfi0CUt19vUa8tFMhpnpMO8lgX/V3UyzUMtcH3dLvQxKyuQXY/FFwznboE6j
         ieBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aB8Q4OnQxgGR3hOnEbILSOeq7HiqZdVqhRD7b5FSwLU=;
        fh=jp2wdYHTCSC8lyG26x18GjTJq1xsafE2VFh8dyvUG/0=;
        b=STQpHFkNELPpJMuGO+zZhRpw3qWebDcjj4to3ncafOXe7QIHWszlGDMadaaFwJWV0y
         qbDvjzhWFjiwiqCBBAQAUEyzIFQzALcmq8KVQhf2kjleUvhtd8CO8g3Nda/jbVHEyYBA
         RdNlekh9yRclQollOPq32aCUrgBiaBFnsecxIi2KNHENC57wEHYLdVqHOkDTAEgb7/bh
         Li62QDermk/cP7bRnnxW1nUmt68GDF2RWRZSzUqwqGjICnIbfG6fAQIWhofiMFaJY96E
         tepQ8nlcvOC7hicl0cmlNuEAMl8tjDIhKdI2ibQCPJhRFThxnAiIXeuOYt8U6VVuvJlb
         AX8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784809517; x=1785414317; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aB8Q4OnQxgGR3hOnEbILSOeq7HiqZdVqhRD7b5FSwLU=;
        b=yuyindnN8JJUALs4+dEKl6t1Xwr6jjEYWvVKaN96uNvvXqVJ0tAFdOV215YKztytk2
         Q9KfAvLLqHFffX2RG2upDgEbeYZKaO0zD19rOXJO31MiYXn9ksqV450lQyfIibUyH8qZ
         aUntoT/151phj8huBu1StqNthQtTuzADixT9tcjfKDiYw60juhfdH/2M7Mu028LbsCLe
         cFmDerbC7FZueBVG5mcD5ZruTN6fSbXjiQ3Ee7gu/e5LIXm5XlsqFHQkx704gdgcCIso
         jR1a2tQHYYskprYedzpU0IYRKjZFi6mVWFEhCzCXzO0Lro4oVwTB6/0fanq7z4STouUA
         Mv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784809517; x=1785414317;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aB8Q4OnQxgGR3hOnEbILSOeq7HiqZdVqhRD7b5FSwLU=;
        b=Z2fQOX0WLWD1EJmbr+zE7jD4tey0dfB3Wlq1QvNvCRqxGCxi+xM3LwxHc/JX4E3FOA
         KIuAh/XtUTrKy8CjRJzi4yegrWAGfIhPi2KA7GOCBRTY8IrC9GAp96FlMHLkf/P/FBBB
         Fa7MDMgTLQcPszt3t0LSxuIETs1ZQPDcGx8JOiVoM+5NzEFa9XTbiSiujmz2MIRb51d8
         c3fDAdh7Rco6yHauU2jkHLEP/375wXQQuaKmZNLaOdklWOa/1lVlBMKrN7dW7rov2ruv
         LFPHGF3NXoswrsXFBtvwkmh2SBX7e+H/F7MURzfktDqQ/ZCkhUzqQ1rdYY3JB6pw9I7A
         Lw3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpZA87o7wQ9a013aGkRI38VUSMwvugqqRFJls/cAX1XPhV2PuYZYoCX9Lf+2DnKYXAgnNBpI2eMl+SE5spL2m4g@lists.infradead.org
X-Gm-Message-State: AOJu0YxxnxDOpl6bdhNmfw07WAdgiqaBE4DQ/SPpj8o28pzUC7AUfA40
	/yTX3JfzBYu6sy1bVX7bJrYcFOneeVat3HX8FRpGL3q0RVLfLOdolc0kp+4+ohlZiT5rHBt7s+w
	zf8MiJN4e9ohCcBoFv0KTtl86SaTzMXXAVBqYgRlJRA==
X-Gm-Gg: AR+sD10geoMk0QGI/OiD9oHxh7fPTzwv6TehE+5HRiSs1XXP82lwwwU/LbSHHaOs3gG
	23nJr25wZSZh60vfr/bN20mN9Mg8ntSxAdNa7wVQXWfW+8MjdtcxLg9+eUVT75QAOGVX4AH3r6W
	KtqY+cgTC0BxqY5/VcuXtByt4BuPAI5PhV7W6rDRmyMpQb15F32qzd8v0doTVAXRjnCwoIRO/Hq
	g3mgHBT1GCH3DjfdLycrtBVx8wpIcs9igh9bPs6JlP9GBOXrYhFP2evZXGgHBRt0Yra0pOV6HtP
	T39xZ5rtTLQC+shojcyi
X-Received: by 2002:a05:6402:a0db:b0:695:f580:a66f with SMTP id
 4fb4d7f45d1cf-69f6d9e12b5mr996909a12.21.1784809517384; Thu, 23 Jul 2026
 05:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org> <20260709-exynos850-ap2apm-mailbox-v4-2-caf2fe9a237d@linaro.org>
In-Reply-To: <20260709-exynos850-ap2apm-mailbox-v4-2-caf2fe9a237d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 23 Jul 2026 13:25:04 +0100
X-Gm-Features: AUfX_mxKHXmvgZNOprzFkOSU6fVlzJ5mLmuhFNF7QD8eikBR_HNCKQLBJH8wlno
Message-ID: <CADrjBPqHcXgAC+AdMAKZRa6S6ZOaYKnwhj-K+wXdouuV7oVmkw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_052519_580181_1170601A 
X-CRM114-Status: GOOD (  28.28  )
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

On Thu, 9 Jul 2026 at 15:45, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Exynos850-based platforms support ACPM and has similar workflow
> of communicating with ACPM via mailbox, however mailbox controller
> registers are located at different offsets and writes/reads could be
> different. To distinguish between such different behaviours,
> the registers offsets for Exynos850 and the platform-specific data
> structs are introduced and configuration is described in such structs
> for gs101 and exynos850 based SoCs. Probe routine now selects the
> corresponding platform-specific data via device_get_match_data().
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/mailbox/exynos-mailbox.c | 72 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 66 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
> index fa02f18948cf..ff75c1c7633c 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -24,14 +24,60 @@
>
>  #define EXYNOS_MBOX_CHAN_COUNT         HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
>
> +#define EXYNOS850_MBOX_INTGR0          0x8     /* Interrupt Generation Register 0      */
> +#define EXYNOS850_MBOX_INTMR1          0x24    /* Interrupt Mask Register 1            */
> +
> +#define EXYNOS850_MBOX_INTMR1_MASK     GENMASK(15, 0)
> +#define EXYNOS850_MBOX_INTGR0_MASK     GENMASK(31, 16)
> +
> +#define EXYNOS850_MBOX_CHAN_COUNT      HWEIGHT32(EXYNOS850_MBOX_INTGR0_MASK)
> +
> +/**
> + * struct exynos_mbox_driver_data - platform-specific mailbox configuration.
> + * @intgr:             offset to the IRQ generation register, doorbell
> + *                     to APM co-processor.
> + * @intgr_shift:       shift to apply to the value written to IRQ generation
> + *                     register.
> + * @intmr:             offset to the IRQ mask register.
> + * @intmr_mask:                value to write to the mask register to mask out all
> + *                     interrupts.
> + * @num_chans:         number of channels the mailbox can support (hardware
> + *                     capability).
> + */
> +struct exynos_mbox_driver_data {
> +       u32 intgr;
> +       u32 intgr_shift;
> +       u32 intmr;
> +       u32 intmr_mask;
> +       int num_chans;
> +};
> +
>  /**
>   * struct exynos_mbox - driver's private data.
>   * @regs:      mailbox registers base address.
>   * @mbox:      pointer to the mailbox controller.
> + * @data:      pointer to driver platform-specific data.
>   */
>  struct exynos_mbox {
>         void __iomem *regs;
>         struct mbox_controller *mbox;
> +       const struct exynos_mbox_driver_data *data;
> +};
> +
> +static const struct exynos_mbox_driver_data exynos850_mbox_data = {
> +       .intgr = EXYNOS850_MBOX_INTGR0,
> +       .intgr_shift = 16,
> +       .intmr = EXYNOS850_MBOX_INTMR1,
> +       .intmr_mask = EXYNOS850_MBOX_INTMR1_MASK,
> +       .num_chans = EXYNOS850_MBOX_CHAN_COUNT,
> +};
> +
> +static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
> +       .intgr = EXYNOS_MBOX_INTGR1,
> +       .intgr_shift = 0,
> +       .intmr = EXYNOS_MBOX_INTMR0,
> +       .intmr_mask = EXYNOS_MBOX_INTMR0_MASK,
> +       .num_chans = EXYNOS_MBOX_CHAN_COUNT,
>  };
>
>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
> @@ -50,7 +96,9 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>                 return -EINVAL;
>         }
>
> -       writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
> +       /* Ring the doorbell */
> +       writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
> +              exynos_mbox->regs + exynos_mbox->data->intgr);
>
>         return 0;
>  }
> @@ -80,19 +128,31 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
>  }
>
>  static const struct of_device_id exynos_mbox_match[] = {
> -       { .compatible = "google,gs101-mbox" },
> +       {
> +               .compatible = "google,gs101-mbox",
> +               .data = &exynos_gs101_mbox_data
> +       },
> +       {
> +               .compatible = "samsung,exynos850-mbox",
> +               .data = &exynos850_mbox_data
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, exynos_mbox_match);
>
>  static int exynos_mbox_probe(struct platform_device *pdev)
>  {
> +       const struct exynos_mbox_driver_data *data;
>         struct device *dev = &pdev->dev;
>         struct exynos_mbox *exynos_mbox;
>         struct mbox_controller *mbox;
>         struct mbox_chan *chans;
>         struct clk *pclk;
>
> +       data = device_get_match_data(&pdev->dev);
> +       if (!data)
> +               return -ENODEV;
> +
>         exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
>         if (!exynos_mbox)
>                 return -ENOMEM;
> @@ -101,8 +161,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>         if (!mbox)
>                 return -ENOMEM;
>
> -       chans = devm_kcalloc(dev, EXYNOS_MBOX_CHAN_COUNT, sizeof(*chans),
> -                            GFP_KERNEL);
> +       chans = devm_kcalloc(dev, data->num_chans, sizeof(*chans), GFP_KERNEL);
>         if (!chans)
>                 return -ENOMEM;
>
> @@ -115,7 +174,8 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>                 return dev_err_probe(dev, PTR_ERR(pclk),
>                                      "Failed to enable clock.\n");
>
> -       mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
> +       exynos_mbox->data = data;
> +       mbox->num_chans = data->num_chans;
>         mbox->chans = chans;
>         mbox->dev = dev;
>         mbox->ops = &exynos_mbox_chan_ops;
> @@ -126,7 +186,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
>         platform_set_drvdata(pdev, exynos_mbox);
>
>         /* Mask out all interrupts. We support just polling channels for now. */
> -       writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
> +       writel(data->intmr_mask, exynos_mbox->regs + data->intmr);
>
>         return devm_mbox_controller_register(dev, mbox);
>  }
>
> --
> 2.51.0
>

