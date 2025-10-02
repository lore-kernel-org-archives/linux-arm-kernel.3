Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101B9CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnyIJAuqTOjdfngmlwPerHGz7RM35XwFHeIlPr5VuyQ=; b=A6bTGZCzj1+/rNrc2lPatmvvsB
	oKBkSlRNEPPN/tgdFgpCUv/Jj8PGtGSdxox6CY+w0fyy2UIQf6oQn+DuyZSbU5TN45jPUpU6xdC+K
	0XF9eA7t3IZv6Ihq8ogZi7GYxIBF8G0xdkDlzisZgz6SVjHoGD24fK9odShrQ2tLzoV0kEjI5XZuL
	Z1f6oyK44OXrGOq33XJMHElOL/1u80y+5YB1BGfuR8wJiYq3qQ9pcVLaSOrbdMsP8WL4LJQUQpeJY
	sZvTCX9+RKS8Sru2q13XoJYyY7JSfF9bHuGJPmlrWWWv3yY8SmqAKZQvda1lt8b5h1Qn1nTIg+1w/
	HmXLtCBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Isa-0000000AUYt-0A49;
	Thu, 02 Oct 2025 12:57:52 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4IsX-0000000AUXL-45l7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 12:57:51 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-33255011eafso1106904a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759409869; x=1760014669; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qnyIJAuqTOjdfngmlwPerHGz7RM35XwFHeIlPr5VuyQ=;
        b=Q74IJUqKENwKJGfK883aHwx9K9iqLlSmfmTAKYWa8eEpdDwspitQ3sAT7qcdZtj4NC
         gWSuJd6ru0THA2gIZ4uC624kEWfFVpaghPQrHPWDLveRDLVmfR2beDReMPNRMRQW9jOA
         JxMlPyCYilmuTAzOBNB9r717NHS3IazzDcu2r1VHB8a2jrkmLmTowLmqYU2/H42sqv4p
         WQ6tr+mcJyjhxDjlczAnShZvoiIdAfT/7ajYbwgE2kjFRO1tdIprFENPlogkjLpaeGBU
         6Po8fN/9aBawsJiHr7T/QvfFP6Y9tgIegQaxiUmO1n3feYovLulRAw6ume9sVdzGojPp
         ZoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409869; x=1760014669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnyIJAuqTOjdfngmlwPerHGz7RM35XwFHeIlPr5VuyQ=;
        b=WRSDKDR/q5wcjL6gKZtokLtdgD11H8DmaN1MqbuKxTDwDS9t35QJJ+pj0FKLR9WJ9l
         Gn5aS1Nz0SZmzFxy+mVM9xyppk5X2hwHbHpZFDgszqHo/S5KOzW5UE5GQ8ixnbF+Cawd
         r5F6tuR5xwYbQcDBPAFIhnNWcU4vIDmsa6WwEBQTbg+CBbkD9MxBPQSW3GsTnYav1tq2
         PyOcxF6Rl1xC44RN9QvyLuU4BmPZ281PBxg/66G/7uvQS65AgKNpgQsY3RJUV7rMFo5L
         8Ybhn7Cw2+6BLDUsKnBmz7Tfqnu/zhz3BPn82QzepkLjrzo3nSevY+j/B98huEgNZoSG
         dFEg==
X-Forwarded-Encrypted: i=1; AJvYcCUufaemwfq0ra6SRrSRiQ4Zar0B7MYbkdBJ8GjyMQ0Jm7sEhNyEB7Rvdqgnb5WAwjK9Hgc4MqJpZLFqOgG5H1iF@lists.infradead.org
X-Gm-Message-State: AOJu0YwzgwURTDLsgaV6o7A9f9a5/Oi2aGd09mxESGj7FBd5aP9Zjfff
	m5TFQ5kzEp86iVlVyd7L5y6HaWT9oNl1f1tsrVJDqILJSiIcxntuIDdQYrneWT9euttaMtiwRPG
	qpDJ4OQOMSr7iqepJUUMatVencN0KHCOxkj5N3R+DhQ==
X-Gm-Gg: ASbGncsuNNbTi0KLCM4Kr2po8tnRaVQvJz1LqwGnI638EzRJRB74OiSHatkM51WhKel
	dnXy71TH1Pna7TsTVTcX1N9BlSZUh0E8rKwE0CHmU9EPAXAfllsRkdNc2FKilOx/UdTfx/1IGWe
	1xbQp73+1Q1XUqmNwrkx8gskhdQlGxTovscwGK+yuMMQ6tx3uIcdeafAfDSI/KbOdfBQ/UvenGa
	yyrR4zO6OH0yqWqMqyQCZQNjanqocjLaiGP
X-Google-Smtp-Source: AGHT+IEyg2y50d1dxaOlqJukSg0aa+uwX8CiX1WBrEVgVa74SaSE/OSZGpVcac3mHJ2bajBYwFCOhl8CxjoKQvqbLQ0=
X-Received: by 2002:a17:90b:4f41:b0:330:4604:3ae8 with SMTP id
 98e67ed59e1d1-339a6f2eadamr8619710a91.21.1759409869136; Thu, 02 Oct 2025
 05:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-17-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-17-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 2 Oct 2025 13:57:38 +0100
X-Gm-Features: AS18NWALFfIf150nOKD9FgMmd-9KKDlTZ4uMqdc8U39s1LJmGb5SZTU3t4xxFg0
Message-ID: <CAJ9a7Vg-3nRfqAiNFGzr19rQBoopGcH=wrFQN4t2AxS9SSpbfQ@mail.gmail.com>
Subject: Re: [PATCH v3 17/31] coresight: etm4x: Remove redundant condition
 checks in save and restore
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_055750_013327_D6881256 
X-CRM114-Status: GOOD (  22.93  )
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

On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
>
> Since a dedicated callback is now used to determine whether context save
> and restore operations are needed, performing the same check within the
> save and restore callbacks is redundant.
>
> The save and restore flows currently use two-level functions: the first
> level handles the condition check, while the second level performs the
> low level operations. As the checks are no longer necessary, simplify
> the logic into single-level functions.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 35 ++--------------------
>  1 file changed, 3 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 66aefdb002f075446572df9c4eed9093da19a066..b63433e80d305588c18b084408496690480a7af0 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1854,10 +1854,10 @@ static bool etm4_need_context_save_restore(struct coresight_device *csdev)
>         return false;
>  }
>
> -static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
> +static int etm4_cpu_save(struct coresight_device *csdev)
>  {
>         int ret = 0;
> -       struct coresight_device *csdev = drvdata->csdev;
> +       struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>         struct csdev_access *csa;
>         struct device *etm_dev;
>
> @@ -1905,40 +1905,11 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>         return ret;
>  }
>
> -static int etm4_cpu_save(struct coresight_device *csdev)
> -{
> -       struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> -       int ret = 0;
> -
> -       if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
> -               return 0;
> -
> -       /*
> -        * Save and restore the ETM Trace registers only if
> -        * the ETM is active.
> -        */
> -       if (coresight_get_mode(drvdata->csdev))
> -               ret = __etm4_cpu_save(drvdata);
> -       return ret;
> -}
> -
> -static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
> -{
> -       if (WARN_ON(!drvdata->csdev))
> -               return;
> -
> -       etm4_enable_hw(drvdata, false);
> -}
> -
>  static void etm4_cpu_restore(struct coresight_device *csdev)
>  {
>         struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>
> -       if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
> -               return;
> -
> -       if (coresight_get_mode(drvdata->csdev))
> -               __etm4_cpu_restore(drvdata);
> +       etm4_enable_hw(drvdata, false);
>  }
>
>  static const struct coresight_ops_source etm4_source_ops = {
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

