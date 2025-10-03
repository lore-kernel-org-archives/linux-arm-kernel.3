Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3614BCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 09:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1yuUer+fDBoEEdnzOoIW6C52BQWyqBlzwiYtiPQEGU=; b=ECr1iE9r2ht9bGryteWuuDBUxB
	80dT22eoyKN4Skj0QqkY3YXmZTSVZyG1JD8c2nQcvaQV2l8zIqgf3+oTPBScwV5YXbdF3ld7SQeCb
	2xC59x5dR3bUpX27zqXgq9jfOtq1WSleeGtHo1YXTUuKtxpa5MhrS+zR4afeyPVni/X0UUAb6Pj7q
	EN1KHI0yQSGZNNYabAWaozEvMsiaG2nWwEznpCx83HvR4T0GaX4T1ZQ/AQZeIhW60jKRtbyXDzXsc
	wl1AvO2TRkdTh0Cbe/mL70roBMwXogbzo6cRunG9nsl278i0Ov2hdRz2pqQ6NL5d+Cbsql80JreM9
	j0nj6RLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4cFK-0000000ByXf-3tem;
	Fri, 03 Oct 2025 09:38:38 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4cFI-0000000ByWl-2Gyr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 09:38:37 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3307de086d8so1867689a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 02:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759484315; x=1760089115; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X1yuUer+fDBoEEdnzOoIW6C52BQWyqBlzwiYtiPQEGU=;
        b=bfZtzjzjR5sH9Y1GtDdTi0sKzT8PUtTwpY4DVi88OmxGnuFsDBB+Z+DZJzEM7Ay4Xg
         +70RWEBrMq06M9T1UxIggNYor3J0fR2Ex/2G4A1jQnlEsQII74qTQIGqCRjaaxvzxV2T
         JsR7kOoC07rbioba8CeZTH4pcQLaxdGTCuO5v1F0x31Xzg6kxGuRJYpcbeEv8n/jYHDP
         aFpM9O3wict4oBhOvYuYObzvJfWKHlmiH2NvZcIZ1zr7FucqSv4O/zZH74zw0W8fuXjN
         r3vKBx1cAjNn0v8Sd1Hh4B4b+dzP6qKTpgVNlA7+BuzjrRmVC0JO3AAFl9KXnDCG5lBq
         itbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759484315; x=1760089115;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1yuUer+fDBoEEdnzOoIW6C52BQWyqBlzwiYtiPQEGU=;
        b=V/HAm5pjY++yZCtEvKtlzSQ2N6oATKa49a4EkNFIruX8q/GsksTAji34NyyWoAsvJy
         P5v/iUWEGGl67pFisNYEAekqz8WfrjEfoh31dRheh8F+sj7LKTkcVZ2jMI8gQSRkcig9
         fRlLABbFNhul+D3lZRLgmuhYBZfu+EglTyeYAUBUytsyNZwxYkeHNGG5v0Ib2vKXJ6pY
         46jbhgTWpR+9XPGG8Rt2RHHVMR+Pje3mZ24OIZxr8xWECNs1/CVg9AZNqRYq47CiXxvE
         Y3WeltjDlUyqCcSqwHt5jyCX7o8YkQfbSArCxujKI3weLGgZaaAFgBCfyHmcTcS5yS34
         Dj5g==
X-Forwarded-Encrypted: i=1; AJvYcCX4TfVef1nYmeBbMXI6HwreFhxOJYTw6Ixay39ZdSV4pnQ1+htIlfsY+q/F24LR01kKFVBxHWFT+dhEUgf9aZuc@lists.infradead.org
X-Gm-Message-State: AOJu0YyBWimcW7VY/QMcKawRgYiN7E0SoJutIxjrxpI0GUZ+ElF7HmOP
	7rJFNnvaKvLjtmyQAQzZ/QERrTrgX3RIgFBUp0uvnRGE3g4WAsTl4MVIrIz7bPZPiIcKDjUsWwk
	UJBp+GlsKFXat6F8h49RtFcLKlp9t49f7pbDunyPF3A==
X-Gm-Gg: ASbGncsKg+7xqUOb+4RXKMPCGMa8x0MqCTTDLGoZ7UBOLl2UaS2KFmrZo6wq3Q3A6pD
	yCyvaUxK+uyLZ86aJwliFzj4HzjkEwLzozG/cGjX2++IASvptomBl2Vs8+NlLUew5wpe6oYWmkK
	TiBNkwWn/YD61uzt1gZmwYoPimCeG6enMROZA8msGxY73NE0SEm1d2obKS4umQoCoQd4mhE5d9T
	m2p1ZUAcvsgTEIkcWeBvNFL0polGPPjtdfysqpqR+VSRqQ=
X-Google-Smtp-Source: AGHT+IEVFDPtBOlDZ/nAeN5YwpFzoCphYWhQNcvVNgyuJt2XgrMVJ2mxE7iC0PUoOrcq3ig/lWIKBTBoHGtf3Ebf/tc=
X-Received: by 2002:a17:90b:4ac7:b0:32d:c63d:4db1 with SMTP id
 98e67ed59e1d1-339c2805c19mr2839355a91.34.1759484315494; Fri, 03 Oct 2025
 02:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-20-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-20-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 3 Oct 2025 10:38:24 +0100
X-Gm-Features: AS18NWCRRiw8F7z5u-bzSc_jT6EACan0OsVp6iwQiKIfPejW68U3l5UKsqZbXUU
Message-ID: <CAJ9a7VjoW=U42SztbdHfxM=v=UaAmJn1=cdJd1EZU3rB6x+WAA@mail.gmail.com>
Subject: Re: [PATCH v3 20/31] coresight: cti: Register PM notifier after data initialization
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_023836_588552_A832854A 
X-CRM114-Status: GOOD (  24.22  )
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

Hi Leo,

The CTI PM code was initially set up before the CTI was a helper device.

If the core bound CTIs, which are helpers to the core bound ETMs, are
disabled as part of the path disable helpers, then I think the CTI
specific PM code might be redundant.

If it is not, then should this not  hook into the generic PM code in
coresight-core.c?

Regards

Mike

On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
>
> The PM notifier needs to access the driver data, so it is only safe to
> register PM notifier after data initialization.
>
> For this reason, move cti_pm_setup() to a later point, specifically
> after 'drvdata->csdev' has been set up.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-cti-core.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index ba4635dfc2e30b4e9ae4972f91bdc6647975b719..b2ddbe12be8d6140a3098797d6d1cc4393259b3a 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -926,17 +926,12 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>         if (!cti_desc.name)
>                 return -ENOMEM;
>
> -       /* setup CPU power management handling for CPU bound CTI devices. */
> -       ret = cti_pm_setup(drvdata);
> -       if (ret)
> -               return ret;
> -
>         /* create dynamic attributes for connections */
>         ret = cti_create_cons_sysfs(dev, drvdata);
>         if (ret) {
>                 dev_err(dev, "%s: create dynamic sysfs entries failed\n",
>                         cti_desc.name);
> -               goto pm_release;
> +               return ret;
>         }
>
>         /* set up coresight component description */
> @@ -950,9 +945,14 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>
>         coresight_clear_self_claim_tag(&cti_desc.access);
>         drvdata->csdev = coresight_register(&cti_desc);
> -       if (IS_ERR(drvdata->csdev)) {
> -               ret = PTR_ERR(drvdata->csdev);
> -               goto pm_release;
> +       if (IS_ERR(drvdata->csdev))
> +               return PTR_ERR(drvdata->csdev);
> +
> +       /* setup CPU power management handling for CPU bound CTI devices. */
> +       ret = cti_pm_setup(drvdata);
> +       if (ret) {
> +               coresight_unregister(drvdata->csdev);
> +               return ret;
>         }
>
>         /* add to list of CTI devices */
> @@ -970,10 +970,6 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>         pm_runtime_put(&adev->dev);
>         dev_info(&drvdata->csdev->dev, "CTI initialized\n");
>         return 0;
> -
> -pm_release:
> -       cti_pm_release(drvdata);
> -       return ret;
>  }
>
>  static struct amba_cs_uci_id uci_id_cti[] = {
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

