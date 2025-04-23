Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8A0C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfFYosDpWgtYqX+IBcKx3G6NRXK+h00Dluuphe8bpkw=; b=KA9iXT/J+L4UyK7VVJ5L/nFfm3
	EGMbQ9ZmWR0PwPAsNuFQ44YwOVTjp9NeCG7fwIATyJhkZ5ILCwote0GG+/aEo/X1QebRUfxahynnE
	a9lM5AxA8m9xLarCP2XOVsyjeVLyA461j3absUIuy+HeFEGq4SDxdewPWcMWLaSgO4XztYJwhrdsS
	7kRqaG9oRdIGSTlkbHW/ezkszTnVlu3iEQdG0IdAc1IHS39jo2lc5+uhuJ5C7i1l1KfWeeYd6lGPF
	UHtAt8V7WxL+ZGnVfpDiZJL7Zcxqxq8Bsi+Bw9lTBw+XAv1O5CwwlLfjuLFEbXxGxWkC7d8kpLDUW
	23WELLYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e5J-0000000BIMo-3ehP;
	Wed, 23 Apr 2025 17:40:33 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aaV-0000000AkCt-2iKN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 13:56:32 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso7853274b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 06:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745416590; x=1746021390; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AfFYosDpWgtYqX+IBcKx3G6NRXK+h00Dluuphe8bpkw=;
        b=pmtsGGnyW+dajnYLVNXI1rnveVVZtJHzNehwKvOGJ5x+qonoVvieoQq1sWSGeufINk
         Wmnc4aoNY1fc6cKZ8afZzpFI8IvXdEDudacFgseN/8yCdHg+uJSneybEc66odURFWbCM
         eRBvtB//6WNO0QBbkWKXUb1/tQrrFsvD0JplMC0ch9jYZVTaTfOTduTtrdCVFUPW+pr3
         Y/Z3d3bQxHR7Vnceg7K+jW3n9fxc0pvowrQceIN2Ku144Betb4dVAxeaPNPq8KlZYecb
         Pp5eT4XA/DDOv14REUdbg6qNpnJR0vz/+GR3xtwQHj+AKKqneQj7sghLAD1hsjaVJ8IK
         ojIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416590; x=1746021390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfFYosDpWgtYqX+IBcKx3G6NRXK+h00Dluuphe8bpkw=;
        b=vnhdcgMT1kxkOpuFOHtn2dmTR/7nqP0aVyJW1AO1RUWfVRYx95MzH75qz77pC6T9tb
         +xraWX+0T0QlQ7gLu1Y70GHvqBHyAqYv9kjbBZ+BZcXEnwBh/dTF5J4/Leh5fFm8l3+u
         FlFCNXZtty6Krbvb3ToBG1Cc2Jj8fGngUoJTmmfns+0WGG7LdrOQxAKxjksvdhtVoGm5
         6tdXJPhDOuFaiym3YTWjgLRlBxAxS7quWx6tdVvIzpo2xqZvX4mmQx2y0M2VtWDE9Gmj
         r4zFkv9HWgrWrZhKPnUcC96hnZMHKvSnPWKgp9krUG8wDjSD6uQLuv+4rHRCgGX7kV3r
         JM7w==
X-Forwarded-Encrypted: i=1; AJvYcCX/L3tLF/0hqL6HyDz1JpyHLkCmk49ah/72hg5mBmeNTUAJ6DItdKJR/WNk51oFuX/G0wegUcQl/H1I/4mJsLZa@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj0UgERfX5WJMpm14gn5hHid3aseapCe4dVW2nT4zGFPpHbU1u
	/tGfMR8IeSZW8P7tPEYPIBH6HJrklvVvkaBGKDbLipmR86DRkO1dOtVH2+/ggedfyAOdoOF8mFj
	nzOwaqg6b73zEqxRekh6L2z0XmYYxQq22VANE1g==
X-Gm-Gg: ASbGnct1JR8dy+sUg1FXNnYtnN6vvJja3CnZPenoquvRk/hdaoU4ZhGykcde1oynlKt
	Mh/iGACTfKTc6nHCvDObBgdXSGvTjOszL781YVPoeZzi3DN3VfG4x9v36VJ8Ti5MgRciISsTcds
	U4ShxBUt8ybmLMdXNRbdjsh0I=
X-Google-Smtp-Source: AGHT+IEZEwAAL6Mzvuw66yRR76sgj8VMBU2yaInPUBYU8I3B/gwzxM8RhzYuE2b5vDzjHBe3JxDUibZDnvfCuYcJvbc=
X-Received: by 2002:a05:6a00:35cd:b0:736:a8db:93b8 with SMTP id
 d2e1a72fcca58-73dc14443dcmr27340760b3a.3.1745416590619; Wed, 23 Apr 2025
 06:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250423103744.475-1-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250423103744.475-1-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 23 Apr 2025 14:56:18 +0100
X-Gm-Features: ATxdqUHZer5iq5su-vp4Gz2VbQzHeqDcBbOIkqfEaFQjhoASLp3Hn8QLjnpu60s
Message-ID: <CAJ9a7Vi9sZBMfkwp445im8fbjeEZOB5_8saTsXhYj3aoRRPdFw@mail.gmail.com>
Subject: Re: [PATCH] coresight: tmc: fix failure to disable/enable ETF after reading
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_065631_712983_44CF9215 
X-CRM114-Status: GOOD (  26.31  )
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

On Wed, 23 Apr 2025 at 11:37, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> From: Mao Jinlong <quic_jinlmao@quicinc.com>
>
> From: Mao Jinlong <quic_jinlmao@quicinc.com>
>

What are these extra email addresses for?

> ETF may fail to re-enable after reading, and driver->reading will
> not be set to false, this will cause failure to enable/disable to ETF.
> This change set driver->reading to false even if re-enabling fail.
>
> Fixes: 669c4614236a7 ("coresight: tmc: Don't enable TMC when it's not ready.")

This SHA and message appear not be present in any upstream / coresight branch.

> Co-developed-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tmc-etf.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> index d858740001c2..8c9f14e36bc2 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> @@ -87,6 +87,12 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>  {
>         CS_UNLOCK(drvdata->base);
>
> +       /* Check if the etf already disabled*/
> +       if (!(readl_relaxed(drvdata->base + TMC_CTL) & TMC_CTL_CAPT_EN)) {
> +               CS_LOCK(drvdata->base);
> +               return;
> +       }
> +

What does this have to do with the stated function of the patch - this
is unnecessary.
Under what scenario can this function be called with the ETB
previously disabled?

>         tmc_flush_and_stop(drvdata);
>         /*
>          * When operating in sysFS mode the content of the buffer needs to be
> @@ -747,7 +753,6 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
>         char *buf = NULL;
>         enum tmc_mode mode;
>         unsigned long flags;
> -       int rc = 0;
>
>         /* config types are set a boot time and never change */
>         if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETB &&
> @@ -773,11 +778,7 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
>                  * can't be NULL.
>                  */
>                 memset(drvdata->buf, 0, drvdata->size);
> -               rc = __tmc_etb_enable_hw(drvdata);
> -               if (rc) {
> -                       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> -                       return rc;
> -               }
> +               __tmc_etb_enable_hw(drvdata);

Dropping a valid error check is not acceptable. If a TMC cannot be
re-enabled, then that is a hardware error that needs noting and
dealing with.

Regards

Mike

>         } else {
>                 /*
>                  * The ETB/ETF is not tracing and the buffer was just read.
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

