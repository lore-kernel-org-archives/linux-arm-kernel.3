Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C005DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeRQlyAUR3PqW+g2eLdPPpZ5mVhOZm45aebnnXmKoiE=; b=Iq/Ng+eADK79owxIRwbnrwJLJx
	owsKaMZNKhCVbSscBZzw0WRIcxFn+pbgwymN3qUt86gVwYLHysA49AvD3H4WBsvAVI1FJuTNJilIb
	dRHxoVXLdcfLU5Iiw21XRJ6JvmxIH+i7TBcygxY3+HqUDr9TK7bU8vltwSVM7wTKKbZb7JSeMfmLO
	FfI6UHpNZFGRm60rXsYh00ibs0VCu93FpA91V9wZiHU4l5vED07BpnEpkVfP3My2uGvBYvXPGQ54Z
	uMAGXcZaEuRSs0t1jlZjWpgyCfq0zILbHn21FWOZ3sRNuEqUD39XhEoX1mlk03mUNZDnqkJqjn2G/
	r4iAyJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckY6-0000000Ccdz-0rvm;
	Fri, 18 Jul 2025 12:50:50 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckV5-0000000CbuY-41Ty
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 12:47:45 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-749248d06faso1812088b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 05:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752842863; x=1753447663; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QeRQlyAUR3PqW+g2eLdPPpZ5mVhOZm45aebnnXmKoiE=;
        b=neeU/T7LcGNOaoRncdnxw/3WjwLfMOEIYWTjEMqo+ZL40BfFsAGIEZ65J475snpQXi
         d0kZxAG6VON96LnMtSlegYQ+EITWh91USLUlzNG5JtV15sg5R1k6TZ84oQrYGqD6UBQg
         PgGQHdIMD2Et5VCr9MU2/NNgPvy8imBbUM/GSvy4Z/kwtcInsuy3CuOlk1w5Oq/hgHeA
         fE25rfQvnsgc7xWW4J+RyNK5xg3C4Zet1qWmR/ALkvbdNiUm5XUyjFD8Rk7Hh06F6bwO
         /BhMBIL8DwJWshUjSdwx+MWGmuJI5dn9lUHAiLZnzSB6rM62P9hO9KZ9NC6pXS9jhJRE
         SFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752842863; x=1753447663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeRQlyAUR3PqW+g2eLdPPpZ5mVhOZm45aebnnXmKoiE=;
        b=dIZfIleQ/gFnRlEeRflPzaNilbramh0HTUuYlwwmBTJo21T+ikRIi+rgCgfsepB1Yr
         Vkfo+OFXLneCtj/ZBi9cMiiwO2071wJmtk0R/CE7RZWW1seMFmw6Fa9gAgRbZoIuHkDf
         vGliOCgWTGz62HtrHtSZTJqoONvFMK8IVEgxnKd1N+ytMJXpYAIx7xjdSKqk5nagJ3GO
         QE3lKMRv8yGHhw6PPhvqYXBlkpSb1TqpeONfn4SSajDonG+kW8pGSqiVFiJkHsaLr8LL
         3RTj/BONJCK2TN+a0ruu59RrFTI22Vzn/shyeg4NH3xoY9pSj8gGGjjn0fL5+QjZUE+Q
         /U5A==
X-Forwarded-Encrypted: i=1; AJvYcCXdQB0i7ztsV4cBiNTv/LuHcD9/uxrpA1VSntKQzoK9TIxMXnza2hifnkkfhWJg9V0IZsux6SBHVqI5GIEKWBPZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwLMZqNf60Im2HNLrKGpWSFUbn6MJgfjOloUifb9sKBaAqgnR48
	64V+xK3dt8/yKPeAEvnxIDenJui+4kPOQ69vblrTfoxI2ObhydAbUWDPoGChzA7qmn7Gy/dczbt
	IWFWk31scNufREOBRKL9NY35xQoNXbmaBSqYq5d27sw==
X-Gm-Gg: ASbGncsPmQYg5HSeebOFmbAtWRoarPZB18lRtbQNycbbDj0xuLR2A9EhfrwHuPd2uIz
	86tOKwKHMkMQ15GhOxrCSYvuz47ZFOpqc5A6Wi1Bixwzvm6cd8BGQ7G1dZ8TXemUK7O6PVxghPP
	Vz/xMe7srvucywf93WYSLD04l/8PjBgh1EX2AQ+RcYUf6a/XJilihvmuvpUPhPbYL24rKwvP7YU
	ors29QL
X-Google-Smtp-Source: AGHT+IEMc7UZ/KYJa/a3DfDdOy24w8KU+Grmwp7vVtNPwtQHk7nDpLvJRl2+7eiSzAbsGuJXlmMDrfna6kz153iEkMo=
X-Received: by 2002:a05:6a20:9389:b0:234:e900:4fb7 with SMTP id
 adf61e73a8af0-2390dc2f767mr10317148637.24.1752842863244; Fri, 18 Jul 2025
 05:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <7bd9fae8-a15f-412a-8800-ce47acf0b5ce@sabinyo.mountain>
In-Reply-To: <7bd9fae8-a15f-412a-8800-ce47acf0b5ce@sabinyo.mountain>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 18 Jul 2025 13:47:31 +0100
X-Gm-Features: Ac12FXwpsQaG8cu8OC5sYhhmw0Xl3b3O3C7eTtu5iWVgpjaqHzEUSGMRFw2z9oM
Message-ID: <CAJ9a7VjykdwBd3_Mh88U_Mqpqsi6aNFeeMS_wMsLE7EV4n_iMA@mail.gmail.com>
Subject: Re: [PATCH next] coresight: Fix a NULL vs IS_ERR() bug in probe
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yuanfang Zhang <quic_yuanfang@quicinc.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Leo Yan <leo.yan@arm.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_054744_000134_6ABA4801 
X-CRM114-Status: GOOD (  15.76  )
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

On Wed, 16 Jul 2025 at 20:38, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The devm_ioremap_resource() function returns error pointers on error.
> It never returns NULL.  Update the error checking to match.
>
> Fixes: 26e20622a8ae ("coresight: add coresight Trace Network On Chip driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-tnoc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index 0e4164707eea..d542df46ea39 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -183,8 +183,8 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>         dev_set_drvdata(dev, drvdata);
>
>         drvdata->base = devm_ioremap_resource(dev, &adev->res);
> -       if (!drvdata->base)
> -               return -ENOMEM;
> +       if (IS_ERR(drvdata->base))
> +               return PTR_ERR(drvdata->base);
>
>         spin_lock_init(&drvdata->spinlock);
>
> --
> 2.47.2
>
Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

