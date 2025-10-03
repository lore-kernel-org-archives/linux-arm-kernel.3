Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3A2CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vt0Lz0KP67qMhZQ1jUhDjn2O4uRsgt8XSR4VEcp+uCE=; b=iDQtMFJOqu9+WNGeUvD+LcbDMg
	NYKOspV3UzHwbK5zPx7sqjOyM3bdk/0aoQljzhuXsgekESibSRs49pEYQ3qfUrmyvH4ZTqN4vM3lI
	3DGRpOieKvqEzFDkDGzmXxY6GAk5MtaObSttYOktP+Hw57h2q6XKwC89ziMNKwkwVJkEkVLxY019k
	lNDX9+kURWFnoM3d1w85Fm17HRuj9FxsH+oL6S/td/aX/nQXOps57WPOrVOIg05NPm+BLyRln4OWh
	RdIz1avShrcpVgAeIzr9eURMzyjwQDSjj7iFLkHNuG//Rr1UZDqpKBcIEfI7QYY/NELZpZC4qPCIt
	AyD9/SGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4dB6-0000000C2v6-3UmN;
	Fri, 03 Oct 2025 10:38:20 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4dB4-0000000C2uX-1WBT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 10:38:19 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so1780003a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 03:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759487897; x=1760092697; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vt0Lz0KP67qMhZQ1jUhDjn2O4uRsgt8XSR4VEcp+uCE=;
        b=PC6GsMHixayZUjzFTOzcCzvAS/wIUdnXVfOinOz/nbwwbFVIM9NQfUrl7zP5trY8k0
         kEhwgxY1NnarK/1Cw6xoNEJLK3OJNdQsEs+85PKh0TSZJ/A3yM5xy7YKsBk33oWhfLjB
         saXTzjTz9BTgfOGqFu9j/5jXh6yEskmFrkxtRa2QGg/l5HbGtNPgrb6BdwVA0ouzkT+T
         J0SDRj7jORui0UlQODVRoU80KO3tHrwgm2RxyRsjadRECqfaC+68ZnjwkX+DP+sJrdXO
         KXHyNRIkteqAyxFP6jF+kSyjyp6eelrgK2FzHiMrhvBpYR2pmoXGJKqamT5j+537jQQS
         4JZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759487897; x=1760092697;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vt0Lz0KP67qMhZQ1jUhDjn2O4uRsgt8XSR4VEcp+uCE=;
        b=rTBGUgKe+jpw0E49EdpENDnrGUie/TN04+cso0+REAjY7TKxyEio84HUVYylUhec7C
         k2RBrCaayK0llbqgT0l8owmxZdJMjNbH/GT5jdpg/khib8n9r04TigjH7m5vVIWBPvfO
         MmHBQJWA3dys3IxuPBkeZ/AX+WidByRG8fKNs90nkGPFV7543s6BpA3c4qdRrt8UYj9k
         p2AU/mv6LyWVmlSpiqeF4eiQhlu0FOhbczl6DNKjZ6KsoMdgF6c2V5z+1Oi1bVVc+hPf
         ZxYxGOkfr0K9b/ALAS9r722uo88kTyj8IUDo1sKpOa1dHIIPZ65tCz2z2kvazC+rxYG+
         1jnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8brwFeO5f2KmA9j0ipBlJ/fVcFDd4jCwcy3CYxjxZ8NuyrGSOIDLePWHz4A0tz3CJh2/5G/0rCjdw7syYKrBv@lists.infradead.org
X-Gm-Message-State: AOJu0YwlHG0TEq8x06Cxxv7BBclSJvGM0YoHTZpqr+jDw97yeOtakM6v
	3cT5Nn/cfNYd60/8Lv4xR3/gB1H8MQu6jn3Y2GON+GNWnRjoItBgW/g6cZagPCX70u1jgnsBYHs
	kTJxf0EJ+J7P6Yqvb4Bl3sxnguY/fBDXlZVVStAWf6A==
X-Gm-Gg: ASbGncuyCyRcHUeZHq3ghkIzI++rt22e81bTEgKqcKEkOu0DJP0y69OxXVGM9rk7cvj
	Ggw5s5TYAfqCxbiYZENbY1Fs86r8wRvfFvC5iz/BatyIlfsvGSGfNHhLMo1dwIKC9a2jHzuncA9
	ASX97Z2OIoDE7biRMVA6J6pD93IMHjesE2rB7rA6iNpCsYVdd/yiAtPyAuLJWaVNuMXgF3iNIua
	QpAMnvLBDOoMGs468GkiW1oQ7F8tRqvRpqhvQxH5Yu5xDHpdA3keR2u+A==
X-Google-Smtp-Source: AGHT+IEM3O5tUU04a5LaTKi0uTx/G/p6pgZKPZdU29UN06t1A4lDLuJArcz6gyv+xfNEOYcdpth31F/9xA65A5O95n4=
X-Received: by 2002:a17:90b:380b:b0:32b:6ac0:8633 with SMTP id
 98e67ed59e1d1-339c2735e4fmr3841096a91.16.1759487897221; Fri, 03 Oct 2025
 03:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-29-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-29-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 3 Oct 2025 11:38:06 +0100
X-Gm-Features: AS18NWDUvH24V8B3ezfs8MnHwgYzUDjfnMpt0KLx6zDdLbsp6634XHXiae00oSY
Message-ID: <CAJ9a7Vgp45fAMCjD1F_oKArb-eGWT+hYs-mY0k3UTb-c-DEDDg@mail.gmail.com>
Subject: Re: [PATCH v3 29/31] coresight: Take hotplug lock in
 enable_source_store() for Sysfs mode
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_033818_414473_FF42AFA4 
X-CRM114-Status: GOOD (  29.87  )
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
> The hotplug lock is acquired and released in the etm4_disable_sysfs()
> function, which is a low-level function located in the ETM4 driver.
> This prevents us from a new solution for hotplug.
>
> Firstly, hotplug callbacks cannot invoke etm4_disable_sysfs() to disable
> the source; otherwise, a deadlock issue occurs.  The reason is that, in
> the hotplug flow, the kernel acquires the hotplug lock before calling
> callbacks.  Subsequently, if coresight_disable_source() is invoked and
> it calls etm4_disable_sysfs(), the hotplug lock will be acquired twice,
> leading to a double lock issue.
>
> Secondly, when hotplugging a CPU on or off, if we want to manipulate all
> components on a path attached to the CPU, we need to maintain atomicity
> for the entire path.  Otherwise, a race condition may occur with users
> setting the same path via the Sysfs knobs, ultimately causing mess
> states in CoreSight components.
>
> This patch moves the hotplug locking from etm4_disable_sysfs() into
> enable_source_store().  As a result, when users control the Sysfs knobs,
> the whole flow is protected by hotplug locking, ensuring it is mutual
> exclusive with hotplug callbacks.
>
> Note, the paired function etm4_enable_sysfs() does not use hotplug
> locking, which is why this patch does not modify it.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 9 ---------
>  drivers/hwtracing/coresight/coresight-sysfs.c      | 7 +++++++
>  2 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 4218cefca63d7b2f3b102e74d7f007ebc7b08861..920c817de8c33751760a1ed7ab1df8437620bb4e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1088,13 +1088,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>  {
>         struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>
> -       /*
> -        * Taking hotplug lock here protects from clocks getting disabled
> -        * with tracing being left on (crash scenario) if user disable occurs
> -        * after cpu online mask indicates the cpu is offline but before the
> -        * DYING hotplug callback is serviced by the ETM driver.
> -        */
> -       cpus_read_lock();
>         raw_spin_lock(&drvdata->spinlock);
>
>         /*
> @@ -1108,8 +1101,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>
>         cscfg_csdev_disable_active_config(csdev);
>
> -       cpus_read_unlock();
> -
>         /*
>          * we only release trace IDs when resetting sysfs.
>          * This permits sysfs users to read the trace ID after the trace
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index cb02f1bfaf068ec3f50f997bcb94f7d5215ccea8..a4c5a334703f0bb35db5eeda87ae5a9756f6a453 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -363,6 +363,13 @@ static ssize_t enable_source_store(struct device *dev,
>         if (ret)
>                 return ret;
>
> +       /*
> +        * CoreSight hotplug callbacks in core layer control a activated path
> +        * from its source to sink. Taking hotplug lock here protects a race
> +        * condition with hotplug callbacks.
> +        */
> +       guard(cpus_read_lock)();
> +
>         if (val) {
>                 ret = coresight_enable_sysfs(csdev);
>                 if (ret)
>
> --
> 2.34.1
>
Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

