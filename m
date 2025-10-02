Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F145ACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 13:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qfJp/p2Jk/7oWC2nv6EKNGxe/l3mbNhb5pYaAL5aQ8=; b=mhgRsdK/ZNBo9mJ5I+id5HwAjK
	VbO6l1uJh5mCbviaISk8xkAzrKWxW/fn7xFE6QOGm5OVa1Gb5YPNk+x1LxGEfrrSux27VmvU7YOHf
	nTyWOvcJ89tnBrnLDnLUA0siNuXrVT508GZfDsFC2Mv+cZKb0o3rPoEzfiB7DWrKpyhv7sLYCAO9r
	3gkZsuEVoYkC0zVDPZO+/Ou2bM8mU3uKYrk0+f6nmqfHmgm6vWm1ga70Y+fhOxDHv5abwAxcM3HE3
	vXKJlfM5UsvFP0BAIZJpgVJik9rAkreoluzUWYdaER9uXKeiuBKSziaph5pDfXqyJQxqCthBa5fEl
	r4WYz51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4JPl-0000000AXTl-0FD8;
	Thu, 02 Oct 2025 13:32:09 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4JPi-0000000AXSn-0vCm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 13:32:07 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so884718a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 06:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759411925; x=1760016725; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6qfJp/p2Jk/7oWC2nv6EKNGxe/l3mbNhb5pYaAL5aQ8=;
        b=QHt2guMHhlP0E3qHGYPa8aNy1ytcnIxrCGRoPrl6SKozVNXlgi4X3Flqz/7aEzNwrl
         StcVT9Jz0vNzfMSXmWhSiseGFV0Amg7xbC6inSkgCSLz2Q0vr5Vv7XZyyO0IiXEaMzoa
         oXvhL/55d74CEx9NMbu/fekMob/50o507sQmXQKmSsWsaIcluBrwlO5uSli7GCWgboUo
         v2KwqDm5uXdtmXRcnTKdWsD2pXjUtMtu4U9xDJ4bU3UEIguAKEKcJ3SsbTdbXHLCIk1D
         yIeiiomTn4v51zjP55SEFn28eWr+PFoAzA7yjGN340QuN7MrMVEjq/rsQWYPdIQ3HNVt
         51hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759411925; x=1760016725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qfJp/p2Jk/7oWC2nv6EKNGxe/l3mbNhb5pYaAL5aQ8=;
        b=l7XGchHakZBkLl4VFd1TxFUXB5/A8iKHKz1Draa3VcJrC2YRwpS09Ucvn1y3cQ4kD5
         ueyRr6nXxoSHO9l7jozqVsLBLgQ67uloic5rz12B1OhEIUW4oDbohecD1E+Sj5Chi9KK
         f0wB2iATeopz4SJ/zKXvJl4InJka4azgFTzq2I5caQhMKJvWYmvmGG2whhxivsIOcgXQ
         wnpZMxtwlnyADVEWEA7BWgZb8BcfFR1AczXBANKH0IzcyP7q5Iq0ndLRp8UICriQjmop
         7SqoodfyPnqrQZEdsgOQ3+Mq59B6LxctFI2O/frhyQJbq/bgT34+LQId5IkqtZTmeSjl
         nKdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOTtJJHEKPWGWI0+O8dWkL/xxXGSIgYI8Zw+BaGdPoMbhrYYRKS4HPPtp3ixxNZnYZUAjqgTMqXO23Yi5EkYiW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1k49UqHYJuKx261YK2XEkn0pQqiv0Y4tHw03q1BceLAPIphwg
	aG7XpXBIIc0ihXMMplfAghZjNiWe3MENB9brpLGoDxdAImSy6YlG9+SKJosKdfYFxb8vPiWDdGj
	zgd7vNUI7Amjmy/0cP72z2Py5XBHUjSna34HHLIVI9Q==
X-Gm-Gg: ASbGncs1sGWMuvHmYhsopiaYRTAAYrQ9b/3xc/fJg1n1Fdpwpmfr4d8B+vvnl7Quvs8
	NPVF7uCrJOnTncaVWsH+haBPo5Lyy5AjEpxTrl2yfIfjhI322I257RISXU0e2xAtpVn7iVm8vUP
	GqntrR1y14D+ajkEoiWX2fYG22YE+2f/FGn7yW7U8c8U7JayY9Qe9U2P+7v8KWzPM9RZs8y9Z+m
	jps4UbYgQz543/Px1BH6EadqLKSmPHV21M4
X-Google-Smtp-Source: AGHT+IGCxThmPZPCKAFvfkDTbeICRGAR2+9HX+FzW2uCvJfFowdPG3QOFM+d8EEsbwERgfOo+4bhLNYLb6Cccbudq1k=
X-Received: by 2002:a17:90b:3b4d:b0:32b:cb15:5fdc with SMTP id
 98e67ed59e1d1-339a6f58bd6mr8355041a91.30.1759411925029; Thu, 02 Oct 2025
 06:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-18-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-18-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 2 Oct 2025 14:31:53 +0100
X-Gm-Features: AS18NWDJEBWn24_oE8w8n0MS6-AO9Hmd4m5JWBtDAScbGNiGNXsV8E8vYNFeq2k
Message-ID: <CAJ9a7VgTE6Lo=Xnt1ERjd3WQCd=Zr=KaeMufZeq_W9mpdE0zGg@mail.gmail.com>
Subject: Re: [PATCH v3 18/31] coresight: cti: Fix race condition by using
 device mode
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_063206_274584_D0C777B5 
X-CRM114-Status: GOOD (  27.94  )
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

On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
>
> A CTI device can be enabled as a helper in a CoreSight path or directly
> via the SysFS knob. Currently, the driver lacks protection when multiple
> flows contend for access to the same CTI device.
>
> Use the device mode to mark the CTI as in use, and reset it to the
> DISABLED state when the device is no longer needed. Any conflict will
> cause the attempt to acquire the mode to fail, ensuring the device can
> only be enabled exclusively.
>
> Fixes: 1b5b1646e63d ("coresight: Fix CTI module refcount leak by making it a helper device")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-cti-core.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 2c8bf5dbe8b8206c92ae5ea64a26c947ef5b9582..ba4635dfc2e30b4e9ae4972f91bdc6647975b719 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -87,20 +87,31 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>  }
>
>  /* write regs to hardware and enable */
> -static int cti_enable_hw(struct cti_drvdata *drvdata)
> +static int cti_enable_hw(struct cti_drvdata *drvdata, enum cs_mode mode)
>  {
>         struct cti_config *config = &drvdata->config;
> +       struct coresight_device *csdev = drvdata->csdev;
>         unsigned long flags;
>         int rc = 0;
>
>         raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>
> +       if (!drvdata->config.enable_req_count) {
> +               coresight_set_mode(csdev, mode);
> +       } else {
> +               /* The device has been configured with an incompatible mode */
> +               if (coresight_get_mode(csdev) != mode) {
> +                       rc = -EBUSY;
> +                       goto cti_err_not_enabled;
> +               }
> +       }
> +

Would this be simpler to check along the lines of

if (curr_mode != DISABLED && curr_mode != mode)
     rc = -EBUSY; goto err_not_enabled.

then put the set_mode() in the code that is run only once on enable,
removing the need to reset mode in error path?

>         /* no need to do anything if enabled or unpowered*/
>         if (config->hw_enabled || !config->hw_powered)
>                 goto cti_state_unchanged;
>
>         /* claim the device */
> -       rc = coresight_claim_device(drvdata->csdev);
> +       rc = coresight_claim_device(csdev);
>         if (rc)
>                 goto cti_err_not_enabled;
>
> @@ -116,6 +127,8 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
>
>         /* cannot enable due to error */
>  cti_err_not_enabled:
> +       if (!drvdata->config.enable_req_count)
> +               coresight_set_mode(csdev, CS_MODE_DISABLED);
>         raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>         return rc;
>  }
> @@ -165,6 +178,8 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
>         if (--drvdata->config.enable_req_count > 0)
>                 goto cti_not_disabled;
>
> +       coresight_set_mode(csdev, CS_MODE_DISABLED);
> +
>         /* no need to do anything if disabled or cpu unpowered */
>         if (!config->hw_enabled || !config->hw_powered)
>                 goto cti_not_disabled;
> @@ -803,7 +818,7 @@ int cti_enable(struct coresight_device *csdev, enum cs_mode mode, void *data)
>  {
>         struct cti_drvdata *drvdata = csdev_to_cti_drvdata(csdev);
>
> -       return cti_enable_hw(drvdata);
> +       return cti_enable_hw(drvdata, mode);
>  }
>
>  int cti_disable(struct coresight_device *csdev, void *data)
>
> --
> 2.34.1
>

Regards

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

