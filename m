Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC70CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBEDbk4Y6+RPP4rGmNd7YAwakR+IT/5F+0KzBUyDp7c=; b=tMoJRTVyf/B6E7GLyyTApLbAjR
	OO0p4Y6BXbv63S+vj+TnkqU18iuUUgrQm7cYvd20GBjG/j4TNSXlVnqkmEZKXFx4XiiinkB7zxFn7
	gJZ6Fm/GDewNHbsMW079t5w+7D5Zant80WeKsgK+PSlvRrgdE2TvNPIKysbALO/RLZz/oNmLzQQBt
	LA92lxHVj8g4oZAYG75BvFsSIX6iEXyzUVT3Fbx6bVegp8qZyw0JRltbPNkbQGrcS0CB41uYbn9OL
	f4y4A/yTboaT69vBObgBS/Rzv9RacX6sFoHZ0SsfxRLgsVICg7Z2j0njDyO50zbwntbzSDWB5tL28
	Xc6hndKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ckq-00000005iIb-3H8R;
	Tue, 30 Sep 2025 15:59:04 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cko-00000005iHx-3Ai7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 15:59:03 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-781010ff051so4243593b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 08:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759247942; x=1759852742; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PBEDbk4Y6+RPP4rGmNd7YAwakR+IT/5F+0KzBUyDp7c=;
        b=U8ntyhAyQ/veekrIer84JKpXG0ZSOVeoyOvSGPCtwqZ+UD/9xvndoW0/OX6QZuTI4G
         XnlyVqeLSvh3bJ8T0b7n+q0Q+MddgSsUIiLdVe8Qwu9qgf6ONyyXT19hYLzTSAztZcC9
         L6lS7uFbycbjjhvxPqpZ3YAXi6K7T1FHwjvbxIZDRxRkN4tz5UsxWTbaJoMMn1d1WLR/
         TEWmqaaFUHlDeodaCHe0Oi60pxc+3TVYnHc5T/7rO6hbN/rP0pyPRm+ST56S5FWHVLNP
         QAoFvq+19K3vceYaNE8WiaSjM1GsyOfU+K3Z5p0ejEVA7EMnpxLuh2DKfuT1oqq/lQkM
         ltyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759247942; x=1759852742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBEDbk4Y6+RPP4rGmNd7YAwakR+IT/5F+0KzBUyDp7c=;
        b=Dt4ku9gQcUHz/IFS/ZUT2HwaYw15NnHhIdvle80ysKwhStdAZM4OZu7nq4i6SSrUqR
         1yxZVblvQ6w0/Usi7NmFo81hjPcTILMLo27LUgxDWtZtrhHlANbi63ynqta5dFfR7rsW
         l54qQcxjUTQ+9/GLFM/8ULjXRt4PYl1xGf3NBIdJBsBB4qwlVVWHp7Z+8dW7Ey3KQs8b
         vIDrTF8qwx56eE34lsh+4+CBVfMv92uyQbhIdGLRm0F4/3qB5kmv1qSmLmuv5hINr0uf
         qpi70gCjzTBxcrGqeV4zs9br3ocgk2TsPrdb8a6IbG6nPFhYxtUPTWoL6SfRnHVXCELh
         scqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9ikK0CgTt4bjduJyUzJESfa8r4GYwCbONJzFSu92LVShqJqu7DZvZT5GacF7KZUECJUYQxjku3acp8zxeCEk5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx9p/1PNd71Deibfh65bu1kifpnRJ4P0aO23YsFAFrvRPERQ1R
	lkb8fKyyVby0h0k79zX69ccsMnMEmtmBXMi3uixQZBeAIzJc8nxI7LxgSahH/bt9J6scrBdDUNE
	IdahQ5G4LhPohqQdxva3jxnX1fyLzBvj4xq3FQE6DYAR6j8ekVpN5
X-Gm-Gg: ASbGncsTPBu8siNRmXExkbZsXqqkdia0XBY2VrJQOzos5Uw4BIPmKFxJIlXJBLMqkak
	QfPzvMIV2QgXPdMxQtnWbuioBJW5d8YeQauSNp3WeaOJevEwu5jgOro5sXPrImKt2F9KA7NSs8u
	NUmJjEzdau6cse683Jr4gJ0s1FDDQJllruw84Z85IkejowU+aHdGn307RznquOZIUxTEWueOsGu
	rRM50f6aDHJ/eQIiwFN4rI/vRkVf+VcYDmfZXh8ohb/5r1QTAfZQZgKVRJ3RVQk
X-Google-Smtp-Source: AGHT+IFhZwULvLcG4+sUHq13O7HxesIFPG7smIAw05g6MeZ6WgbCJ8qpdnoSF7cyWH42E20sTJUeWIacFYXDpH/DhvU=
X-Received: by 2002:a05:6a21:78e:b0:319:c639:884c with SMTP id
 adf61e73a8af0-321e95597abmr256093637.49.1759247941873; Tue, 30 Sep 2025
 08:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-8-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-8-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 30 Sep 2025 16:58:50 +0100
X-Gm-Features: AS18NWAuSPC4iIVXvHyaRrKiIs_YMb44j30zZV_pQtQgRBqR2uIulkeW_PnbRr0
Message-ID: <CAJ9a7Vh_ZVnpDbperzA9Mr8eZbPwZmJ9QtTEkmjeozqJkX-U5w@mail.gmail.com>
Subject: Re: [PATCH v3 08/31] coresight: etm4x: Remove the state_needs_restore flag
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_085902_806162_694BBECB 
X-CRM114-Status: GOOD (  27.76  )
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

On Mon, 15 Sept 2025 at 11:33, Leo Yan <leo.yan@arm.com> wrote:
>
> When the restore flow is invoked, it means no error occurred during the
> save phase. Otherwise, if any errors happened while saving the context,
> the function would return an error and abort the suspend sequence.
>
> Therefore, the state_needs_restore flag is unnecessary. The save and
> restore functions are changed to check two conditions:
>
> 1) The global flag pm_save_enable is SELF_HOSTED mode;
> 2) The device is in active mode (non DISABLED).
>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 14 ++++++++------
>  drivers/hwtracing/coresight/coresight-etm4x.h      |  2 --
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2d2ef58393db10d058b3e29c5b270dd2d62e1a49..fbcd0fcd1992cd600d2eb8c95ae9a5adf0c287da 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1986,8 +1986,6 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>                 goto out;
>         }
>
> -       drvdata->state_needs_restore = true;
> -
>         /*
>          * Power can be removed from the trace unit now. We do this to
>          * potentially save power on systems that respect the TRCPDCR_PU
> @@ -2005,11 +2003,14 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  {
>         int ret = 0;
>
> +       if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
> +               return 0;
> +
>         /*
>          * Save and restore the ETM Trace registers only if
>          * the ETM is active.
>          */
> -       if (coresight_get_mode(drvdata->csdev) && drvdata->save_state)
> +       if (coresight_get_mode(drvdata->csdev))
>                 ret = __etm4_cpu_save(drvdata);
>         return ret;
>  }
> @@ -2099,8 +2100,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>         if (!drvdata->skip_power_up)
>                 etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
>
> -       drvdata->state_needs_restore = false;
> -
>         /*
>          * As recommended by section 4.3.7 ("Synchronization when using the
>          * memory-mapped interface") of ARM IHI 0064D
> @@ -2126,7 +2125,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>
>  static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>  {
> -       if (drvdata->state_needs_restore)
> +       if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
> +               return;
> +
> +       if (coresight_get_mode(drvdata->csdev))
>                 __etm4_cpu_restore(drvdata);
>  }
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index b8796b4271025f6aba79fe3cd6e4d17d0b56952d..012c52fd19338133129752d35523dc102df24604 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -980,7 +980,6 @@ struct etmv4_save_state {
>   *             in EL2. Otherwise, 0.
>   * @config:    structure holding configuration parameters.
>   * @save_state:        State to be preserved across power loss
> - * @state_needs_restore: True when there is context to restore after PM exit
>   * @skip_power_up: Indicates if an implementation can skip powering up
>   *                the trace unit.
>   * @paused:    Indicates if the trace unit is paused.
> @@ -1036,7 +1035,6 @@ struct etmv4_drvdata {
>         u64                             trfcr;
>         struct etmv4_config             config;
>         struct etmv4_save_state         *save_state;
> -       bool                            state_needs_restore;
>         bool                            skip_power_up;
>         bool                            paused;
>         DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

