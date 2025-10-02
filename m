Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBA9CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3P2SqVLMxqWw0YsfwYWOiRgzhonXoSlAGUyYx+H0cP8=; b=B40XBbEn3etDwr0FoKGKanhJow
	wdB3NZ7ND7UEaI5Yxw6T8iE9yFFDErL+IW1Gd6JpeLhufupyOIPzhKLvKx0J2L27jOgP/tc41PxmM
	ViTUazjZRJy9ZxZTZhLgwIDxIobf8CbTAHsI2kzI4R1NoQbEHh8HXmmBE1EN9/mWIUZbbm5nE4VAp
	P0eU79RUKgzbabx5nvI2ULcyHWZNvBRrM8Mt9OXxlh55v5Y3p6umr1W1FKmGfLWmQONGRSQ97H3+l
	63XZRYvpEmleGlYrBnlH9+r6MCeYgkYXT1WJKtblZ8frgOANL0e4tfX1/tXpZaxS58H15fPT9Ml9Q
	t3kNl/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GbX-0000000AGZj-2VWs;
	Thu, 02 Oct 2025 10:32:07 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GbU-0000000AGZO-36dZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:32:05 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-330b4739538so870252a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759401123; x=1760005923; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3P2SqVLMxqWw0YsfwYWOiRgzhonXoSlAGUyYx+H0cP8=;
        b=B2Qgu8d5X/BJ+4QTmKwcHPFOT92wlmUiMHRCFqHiZLnW6nHtqKHHh9k4lcSQiGxDri
         WWYaWrRrwC2joBZFZS4a4cMSEy5E8uu3yL3l67SGnOt6z4wPBO68d+7p/DXHFI4fEELh
         2sCDRAGj5BLNUeYDbxoDl7AjHtTZxPdMkmafqt9ukNgyrTDUc+kccLGGHAxkmI4O8BeQ
         JITraHciXQc+3FwGNiyodFC+2GN6UnmdSubKUpeLHpjuCFrNFAbpTZjYp36WeE4adgvM
         OKGlyIxFpPgDx/1+V0Frgb+kGzmi1nemLskN9n3cR5/y9ELLfbrc1CCWvIIpKcT+whuf
         CNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759401123; x=1760005923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3P2SqVLMxqWw0YsfwYWOiRgzhonXoSlAGUyYx+H0cP8=;
        b=Eeg5g4J448D9/1gKXqlblbHnPso9ErSxFSxpTkfyJkHV/EPWnUILTJD8i+t8QhVFhS
         CyLFQ32kphZb6BgpoOYo5HsFTpkOwMtONnpa6d3bdbEPlC5agmLvBeOaPDwyfKfXvlRy
         meaN3pCZZdiS3QZpFC2cJJOOYns0ZZCISLqJy3t9K8q1rEro8oAB2uBkfKNuzVLuUI0q
         pOUQTxQQoHBMGn/dTgbWO2PNFgpJEtPjea2n4D6ENBtsnnDRBInZ8kEOQ582zWWEClxQ
         kBGMEyexZwlrN+aqIVnuWO0G8Dun1lmb0xyA2zj16lJbVN5MQk+YR/Q3fVa0J1KjlinN
         q51w==
X-Forwarded-Encrypted: i=1; AJvYcCVzBIdOul7YlVEkkpGIdq+BDlA05dQG3FccYI88Shaa3dD73lMxk5C1uIsiHRCm/RdQX9ONgIoqzYtvKNkSeQjf@lists.infradead.org
X-Gm-Message-State: AOJu0YzUxfAKc1GOiQY1Omb4dfJBVBlOEU1oQtG446gMobOtiFu9EIWQ
	hASD8xRf/5bo6d8uE3nCqQQZih09R+BusDXfCuFmSCtZmABqPl5sYpgIdQpx0OYY+aDnSwQc8Ne
	v71Whdts7XUPMGlLxKZAqvOfO5F3NxmX2l8cRYOhNqQ==
X-Gm-Gg: ASbGncsqIm5JsymXHXDCiDMP9mORTFLCxmx7q56TrAkL/YjdwZ6eUfyxaY8eYLQQUP+
	jeSPMOq7xpUQGtqGqVgJIuSVxxEBJWOE/npkW1/13R/JQsJn3I3HOCsnqo77IFl8h4vyXmKNIJb
	1dQvZTxrYfDJHv2asVgn0YsxeqmhKlZNu+Yq5Ec0CUQVOa5zgp/TwFeHz4+JWxZO6NocdHTcQzC
	PeAAfvJUYv/APKIBBg128QwiCzb/ba1RpBIE5iBEp37/hE=
X-Google-Smtp-Source: AGHT+IFNooRw4RHeJvjuSBVXCorl+kB8dNR6gBxLsbJ85oC4nGIv0h9tEQUex6+32+m/lKZXcg7r2MvecOqjHMCn2h8=
X-Received: by 2002:a17:90b:3845:b0:32b:9506:1780 with SMTP id
 98e67ed59e1d1-339a6e91e6bmr7872652a91.9.1759401123576; Thu, 02 Oct 2025
 03:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-19-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-19-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 2 Oct 2025 11:31:52 +0100
X-Gm-Features: AS18NWA7_Nm9M_Ji8RxvzJsu3FLLNTGn6cVY6LePoADrv-2AZXH_SPpPn2e3Oro
Message-ID: <CAJ9a7VgQoJMQyuGP6UP8ptg4xcoV2cbR4bwz6ooRy5O_SaiCVA@mail.gmail.com>
Subject: Re: [PATCH v3 19/31] coresight: cti: Introduce CS_MODE_DEBUG mode
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_033204_800696_0B53CDF2 
X-CRM114-Status: GOOD (  25.64  )
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

On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
>
> Introduce a new CS_MODE_DEBUG mode to indicate that a device is being
> used for debugging purposes, e.g, if a system enables CTI for debugging
> but not for hardware trace
>

How can you know why the CTI is being enabled?

System CTIs are attached to key HW trace infrastucture such as input
triggers for ETR/ETB that have direct effect on trace.
CoreCTIs, while they have some debug triggers, can also trigger ETM events.

Mike

> Update ETM4x driver to mute compiler warnings for the newly added mode.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 2 +-
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 ++
>  include/linux/coresight.h                          | 9 +++++----
>  3 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 572b80ee96fbf18ec8cf9abc30d109a676dfbc5d..3e0039f75f5aad104cb86561bf37971c7dc4e408 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -112,7 +112,7 @@ static ssize_t enable_store(struct device *dev,
>                 ret = pm_runtime_resume_and_get(dev->parent);
>                 if (ret)
>                         return ret;
> -               ret = cti_enable(drvdata->csdev, CS_MODE_SYSFS, NULL);
> +               ret = cti_enable(drvdata->csdev, CS_MODE_DEBUG, NULL);
>                 if (ret)
>                         pm_runtime_put(dev->parent);
>         } else {
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index b63433e80d305588c18b084408496690480a7af0..4218cefca63d7b2f3b102e74d7f007ebc7b08861 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -934,6 +934,7 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
>         case CS_MODE_PERF:
>                 ret = etm4_enable_perf(csdev, event, path);
>                 break;
> +       case CS_MODE_DEBUG:
>         default:
>                 ret = -EINVAL;
>         }
> @@ -1132,6 +1133,7 @@ static void etm4_disable(struct coresight_device *csdev,
>         mode = coresight_get_mode(csdev);
>
>         switch (mode) {
> +       case CS_MODE_DEBUG:
>         case CS_MODE_DISABLED:
>                 break;
>         case CS_MODE_SYSFS:
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 39781ba24ee2ad9f3065770409aafb0e5af57fa8..462876b5a870f3e93ad2a1807a9045d5eb115ccd 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -253,10 +253,10 @@ struct coresight_trace_id_map {
>   *             by @coresight_ops.
>   * @access:    Device i/o access abstraction for this device.
>   * @dev:       The device entity associated to this component.
> - * @mode:      The device mode, i.e sysFS, Perf or disabled. This is actually
> - *             an 'enum cs_mode' but stored in an atomic type. Access is always
> - *             through atomic APIs, ensuring SMP-safe synchronisation between
> - *             racing from sysFS and Perf mode. A compare-and-exchange
> + * @mode:      The device mode, i.e sysFS, Perf, debug or disabled. This is
> + *             actually an 'enum cs_mode' but stored in an atomic type. Access
> + *             is always through atomic APIs, ensuring SMP-safe synchronisation
> + *             between racing from sysFS and Perf mode. A compare-and-exchange
>   *             operation is done to atomically claim one mode or the other.
>   * @refcnt:    keep track of what is in use. Only access this outside of the
>   *             device's spinlock when the coresight_mutex held and mode ==
> @@ -344,6 +344,7 @@ enum cs_mode {
>         CS_MODE_DISABLED,
>         CS_MODE_SYSFS,
>         CS_MODE_PERF,
> +       CS_MODE_DEBUG,
>  };
>
>  #define coresight_ops(csdev)   csdev->ops
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

