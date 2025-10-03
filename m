Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E39CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEuOLLQUtBe9MVgnQF3DeiQbaMbJSw6sIqUsw5D1bJA=; b=qYZeirRxf7iAlHLoXj9Xrd5efk
	GZ6NbdZFbHvHVO5Yzf2d9ItO2Oo4dMtQpm0lZtAHT000qnh9fMBWAYH8KhIA+PFiPEydJbvgDtTp8
	sGSnNakMloFQbVpT5wvqPoKdgveEe+KC/Ik3VbLEWBwMx5cwtE3XP3SJSSvksChK5fpK27KLRovBw
	Z+rLJULc1vOpjEC+rvM/ePy+6QEXZwxSruch3SrXCNoiwdN/YuZlzBAem4Wpo2DQiN8TJghCW04kE
	/7bP4PACv1erMhoCAWExRyuHKc/sv7RV44kv9brHewgriew2HfKMXaY8EF9BboFvzuu7n2y4bPCbj
	Obgor1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4eBZ-0000000CDOR-3J53;
	Fri, 03 Oct 2025 11:42:53 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4eBX-0000000CDNn-1jQI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 11:42:52 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3306eb96da1so1862356a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 04:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759491771; x=1760096571; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rEuOLLQUtBe9MVgnQF3DeiQbaMbJSw6sIqUsw5D1bJA=;
        b=DuJ36YSTenSLHDGliSiXToILLcL6AH+CHSFmwz86jKg8iXeFF7dSyKpidzEd9tEwSY
         KcmNsBRDq+WEFXYkdes88sOBokmTBekqBourdEQQM+RG3UwKIEKnqYk7rR9Prbb4fP3F
         aqJVZeWeRsBznC9y1zedPAVE4yoyUnXl2gGx8aVkw2Y8oZEzmtsnO5thEzvwU0UeKonc
         QpUJIgTekMlOt3euRWb90unktsD4Xm4aQMKg59aXY7k7muS0wqqGGXdID17a3eed44oU
         rp52qxVTS7wJwaor/u/FdLwmrOI3Iaeupxo+J7CsSxY+JPw+pslJfygDjgf1aHTuhwWO
         oiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759491771; x=1760096571;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEuOLLQUtBe9MVgnQF3DeiQbaMbJSw6sIqUsw5D1bJA=;
        b=LE0k4oQ89iyUpagPfnPaG/kaPnewrKQjqhypdESiLQ+fGY9DKC2YZMYZU5xgOTY0pL
         V/JXVx/i3BqLm+3JB3avThxm/cHBe9qIiojQKoiL5eJ6UDGTaMOQqOHAmlUqz0hD49pA
         Ov4GijPa406LNsMHesO/9LGwwlwatPX3GWoDLIThh65DzGGhIJj7v/uuBO7I5c6N+842
         aW8KOQeSQyvd4qMOP28OgkqyCmtNIxD4kQykH3453Tl9VN005KrT0HoL1Fto/yq6zNfG
         2UFsnl1cBs9/xbETIRjjlWXOqxMOD9tswwoajATu1JpDuUmN1t107W9eV6PEprG1VQaN
         wBZA==
X-Forwarded-Encrypted: i=1; AJvYcCXaJ26GgLiJsIrlZKshQfqkt+P8YkARoCqIN/yH6Clskr3D8CIQmyrNe5O+8ljeET1YGgz5HqL1Qmt+uNW9Q6Os@lists.infradead.org
X-Gm-Message-State: AOJu0YxbAeFNzn6MrwLWGrOWBspl7OEdnYpRwlf5/S43EQ+FeVLyCNvu
	QGf74DpQg4q0lrCNjZ3oimUMI2UWXXwKHiK4P6K1qn5qSkNg6MzGO3QGOrjt2W0Z95D/YRY458x
	NnU4xbJn2wd76vgnnnvu46nBOZo0nqXlr52UDUygWaQ==
X-Gm-Gg: ASbGnctGQdt1J4ICZTluxc6FxwhKObSkecEs3QSz9r3l3vM1u5xd22gKjKpxc/IafL/
	WFVM569zg/eYF++Tf/yVqmEAZIgzXutdb+bQD3SEA9b5rpM7z67KXeBSQcdhrX9ZxndzjfRfGU8
	8JavrA6etcYQ4uBxNJZZlgH2/1b/8Xpz9CCrNSJkhdVJxqXT46GQlzcNo9MjjMGe0e0ry4Z4vB0
	ejWZTNG4Bq/wu+t92zUJajVNEVsbRHOjHR2
X-Google-Smtp-Source: AGHT+IGS6sVmFI8BoleNZ2kRxdAPq7AQq9fzJ/wEexdF1v3djZQOFoyx47dRTvyEt73Rb9vJZhVqIwIfq5xGpXTQgnA=
X-Received: by 2002:a17:90b:1a87:b0:334:3286:8fe2 with SMTP id
 98e67ed59e1d1-339c277fabamr3577521a91.10.1759491770586; Fri, 03 Oct 2025
 04:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-25-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-25-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 3 Oct 2025 12:42:39 +0100
X-Gm-Features: AS18NWCZWhn1WyJLg1zlf1hCnfDuwdiqMETuXWN6vwkNJ3r4LjDs0XwtLnOZpNw
Message-ID: <CAJ9a7ViPxne8WXLS-QQDWw0=Nm_QAP4jw4sZCHKoOyDgTdVy2g@mail.gmail.com>
Subject: Re: [PATCH v3 25/31] coresight: Add 'in_idle' argument to path
 enable/disable functions
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_044251_454814_B154A7BF 
X-CRM114-Status: GOOD (  25.10  )
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

Hi Leo

On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
>
> Introduce an in_idle argument to the path enable and disable functions.
> When set to true, it skips to touch the sink device. To avoid invoking
> sink related helpers, the condition check is moved before the enable
> helpers are called.
>
> This is a preparation for managing the path during CPU idle.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 29 +++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 904123279ee70531787feea98e5f9fc502470f88..0e8506d5eaa01d1cc4846324a64eae5f0f442da3 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -479,7 +479,8 @@ static void coresight_restore_source(struct coresight_device *csdev)
>   * disabled.
>   */
>  static void coresight_disable_path_from(struct coresight_path *path,
> -                                       struct coresight_node *nd)
> +                                       struct coresight_node *nd,
> +                                       bool in_idle)
>  {
>         u32 type;
>         struct coresight_device *csdev, *parent, *child;
> @@ -502,6 +503,10 @@ static void coresight_disable_path_from(struct coresight_path *path,
>                                                 CORESIGHT_DEV_TYPE_SINK :
>                                                 CORESIGHT_DEV_TYPE_LINK;
>
> +               /* To reduce latency, CPU idle does not touch the sink */
> +               if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
> +                       continue;
> +

Why not - if this is the last/only active path then you absolutely
want to disable the sink to flush trace through the system.
If it is not, then the disable sink will simply reduce the refcount by one.

Mike


>                 switch (type) {
>                 case CORESIGHT_DEV_TYPE_SINK:
>                         coresight_disable_sink(csdev);
> @@ -537,7 +542,7 @@ void coresight_disable_path(struct coresight_path *path)
>         if (coresight_is_percpu_source(source))
>                 per_cpu(csdev_cpu_path, source->cpu) = NULL;
>
> -       coresight_disable_path_from(path, NULL);
> +       coresight_disable_path_from(path, NULL, false);
>  }
>  EXPORT_SYMBOL_GPL(coresight_disable_path);
>
> @@ -561,7 +566,8 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
>  }
>
>  static int _coresight_enable_path(struct coresight_path *path,
> -                                 enum cs_mode mode, void *sink_data)
> +                                 enum cs_mode mode, void *sink_data,
> +                                 bool in_idle)
>  {
>         int ret = 0;
>         u32 type;
> @@ -574,10 +580,6 @@ static int _coresight_enable_path(struct coresight_path *path,
>                 csdev = nd->csdev;
>                 type = csdev->type;
>
> -               /* Enable all helpers adjacent to the path first */
> -               ret = coresight_enable_helpers(csdev, mode, path);
> -               if (ret)
> -                       goto err_disable_path;
>                 /*
>                  * ETF devices are tricky... They can be a link or a sink,
>                  * depending on how they are configured.  If an ETF has been
> @@ -589,6 +591,15 @@ static int _coresight_enable_path(struct coresight_path *path,
>                                                 CORESIGHT_DEV_TYPE_SINK :
>                                                 CORESIGHT_DEV_TYPE_LINK;
>
> +               /* To reduce latency, CPU idle does not touch the sink */
> +               if (in_idle && type == CORESIGHT_DEV_TYPE_SINK)
> +                       continue;
> +
> +               /* Enable all helpers adjacent to the path first */
> +               ret = coresight_enable_helpers(csdev, mode, path);
> +               if (ret)
> +                       goto err_disable_path;
> +
>                 switch (type) {
>                 case CORESIGHT_DEV_TYPE_SINK:
>                         ret = coresight_enable_sink(csdev, mode, sink_data);
> @@ -624,7 +635,7 @@ static int _coresight_enable_path(struct coresight_path *path,
>  err_disable_helpers:
>         coresight_disable_helpers(csdev, path);
>  err_disable_path:
> -       coresight_disable_path_from(path, nd);
> +       coresight_disable_path_from(path, nd, false);
>         goto out;
>  }
>
> @@ -634,7 +645,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>         int ret;
>         struct coresight_device *source;
>
> -       ret = _coresight_enable_path(path, mode, sink_data);
> +       ret = _coresight_enable_path(path, mode, sink_data, false);
>         if (ret)
>                 return ret;
>
>
> --
> 2.34.1
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

