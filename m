Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F012FC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMUDPAFU1O8xG8NCQoQQo1s0+ikZ5HYpQJjYgU1KeM8=; b=nldC5Q2734xmLfureEuQV/sWPj
	YeIaa1p2jyNIalDUw98IhqDjPodtyToVO5YvsfgXX2vtKUkFtgKVRXyP6XM0Xk1PxT3vRTE8jyDCi
	SgUAUad/gpVCzuETTU0LSZtFrIFYE8T8S0/KyFkNNVtI+fd4RxUgBnZIh/eCFo9/KZEKCsaqx62jh
	toN4zMDE4Mdw79aWfZDy8x6UXB8NlbrhYyDDBuUkQ9CbLoMPZoG8SKSuoHddu3JPuqvhMsP+DFIMv
	gbVTgnO4A3XGW9rtMtrAUqUHqWRKbPlrXaXAhl++NKmVIEoIfEv8L4fWoux+KKG4y08i5LmDBQe6K
	jAf1VU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGBE-00000000Ypw-3pze;
	Mon, 31 Mar 2025 14:32:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzG4H-00000000Xyg-3POx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:24:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso29062835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 07:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743431088; x=1744035888; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dMUDPAFU1O8xG8NCQoQQo1s0+ikZ5HYpQJjYgU1KeM8=;
        b=qtPLFHzwLKlRZMM3K2zIsp+LlRnvIpTeUK1DdnGWRwdLaTFN73AD6bx+4Db8rMdVtJ
         WqiH/11B/RIb1gDbUEEt1cB0JSyJ8ltO0Aq+z+IfIfySJXTVW9ItACnV6xNUOkK7kEbf
         ANpHgN1yQ9SVVFLRb34Q+CkP/CjcvWcWgP3ZEIm8oErvJ6DMIQOin6ujDF2y9ir6ULmC
         v8NSwi0Rimf6RntbNpXtU1TrT3mPS3Ni3ojWFI9y2H/F+145KmTTyulC9N1133bynmqn
         oauVTU3S8YuauZ6hAvGSWLZhl3l7b/h9DlgyYCwgZ3bm7K8/Zmfbc3Dl3/KAKwpJsB+7
         0Jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743431088; x=1744035888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMUDPAFU1O8xG8NCQoQQo1s0+ikZ5HYpQJjYgU1KeM8=;
        b=og2Smis2uBT8N6Rstmy/pcssZcOMlnkdzmyB7NSFnG65kAI1pOyLy6mc48PDIOrPbi
         fp3U0m4RO4PwZiyDWYOPgTjHGbVa9okUETR198FGpZRBRCDNlVMxNrliTheiBJeg1Kkn
         mczrLSYsQz7ZNLbHf0OWZOg0C0bLjEfMWH6oFHakndcB085yJVnpgLywMuJvcd+bO5Vu
         /zwFZFrnR/gOiOPwht72GAjakoYi7Kw35PZriWIc3QfaGfC+ZOYv1JJwdkqnw11yiRFw
         uR3RkbAy9dd2itXv1Dp61L3alH16ODaGEYkJVRky1zeiZqFqPL/wEo7lfDzJBVP5Dwco
         1KIw==
X-Forwarded-Encrypted: i=1; AJvYcCVVpgzCJtk84UR1m+CiACpup87UqBs21OGPgCiePaT/kbwUpbfy7xsvY6n6303BduMbrNIYX7XdV/rCOXY8XkQu@lists.infradead.org
X-Gm-Message-State: AOJu0YweDKgp5yBx7AWZg3N50o59zD3SgR9o5Vlua7TbpmjE79JcJH8M
	yNv+Gk04hZYqhnlz+s5bPxW6tg7uEvFg1zxZwxi0K3z8zLN4NniUFLagJem7f2E=
X-Gm-Gg: ASbGnctjXRI31ndckdXKjY/VJUAv4UQ+pPowa/MoZiji0d4ffHz6MiYogjOYt5V4cIG
	4MPd8RDVSHesLF+Wgz5onvGKrvqA1TbKeeqi2nqp1XcMG/rzyMBj2cP0YL+lV+QH55q0bwMpBp8
	u2qXk1vctJImQ07UeYTDBGHnnuStJpwhUwgR+ocvXuV1PGaqAiYj9U8TbHXydB/Zth18wgLXaUr
	tzSdBeRaGDeupFbH0XOoJ3xf8m/X9PbhkTilIUBii34VJU7I4KqpdOhxkhQEzBKqCe5HRx3mJOE
	letwt0nZw6ek3Sz+DXnahKbJABRMhR5gnYbyKqOBBdnzrBmvfg==
X-Google-Smtp-Source: AGHT+IGHvJ94y7udCjZezUAWslORfm/B4FLHAOoJRG39KVz7X0DFlR4mCxB/y+cweClieCU7uQx6vA==
X-Received: by 2002:a05:600c:4754:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43db8516a10mr72004525e9.26.1743431087790;
        Mon, 31 Mar 2025 07:24:47 -0700 (PDT)
Received: from [192.168.1.247] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6ab48sm169719975e9.10.2025.03.31.07.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 07:24:47 -0700 (PDT)
Message-ID: <ea366793-4c27-44af-9b6b-8964c4151416@linaro.org>
Date: Mon, 31 Mar 2025 15:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: catu: Introduce refcount and spinlock for
 enabling/disabling
To: Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Leo Yan <leo.yan@arm.com>
References: <20250328223837.2314277-1-yabinc@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250328223837.2314277-1-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_072449_862913_27065938 
X-CRM114-Status: GOOD (  33.27  )
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



On 28/03/2025 10:38 pm, Yabin Cui wrote:
> When tracing ETM data on multiple CPUs concurrently via the
> perf interface, the CATU device is shared across different CPU
> paths. This can lead to race conditions when multiple CPUs attempt
> to enable or disable the CATU device simultaneously.
> 
> To address these race conditions, this patch introduces the
> following changes:
> 
> 1. The enable and disable operations for the CATU device are not
>     reentrant. Therefore, a spinlock is added to ensure that only
>     one CPU can enable or disable a given CATU device at any point
>     in time.
> 
> 2. A reference counter is used to manage the enable/disable state
>     of the CATU device. The device is enabled when the first CPU
>     requires it and is only disabled when the last CPU finishes
>     using it. This ensures the device remains active as long as at
>     least one CPU needs it.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
>   drivers/hwtracing/coresight/coresight-catu.c | 29 ++++++++++++++------
>   drivers/hwtracing/coresight/coresight-catu.h |  1 +
>   2 files changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 275cc0d9f505..834a7ffbbdbc 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -458,12 +458,19 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
>   static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		       void *data)
>   {
> -	int rc;
> +	int rc = 0;
> +	unsigned long flags;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>   
> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_enable_hw(catu_drvdata, mode, data);
> -	CS_LOCK(catu_drvdata->base);
> +	spin_lock_irqsave(&catu_drvdata->spinlock, flags);

Hi Yabin,

This needs to be a raw_spinlock since [1]. Also you might as well use 
the new guard() thing to save someone find-and-replacing it later.

But I'm wondering if this is accurate. The ETR's refcount is dependent 
on the pid of the owner of the trace session:

   /* Do not proceed if this device is associated with another session */
   if (drvdata->pid != -1 && drvdata->pid != pid) {
	rc = -EBUSY;
	goto unlock_out;
   }

   /*
    * No HW configuration is needed if the sink is already in
    * use for this session.
    */
   if (drvdata->pid == pid) {
	csdev->refcnt++;
	goto unlock_out;
   }

If the helpers get enabled first, could this mean that CATU gets 
associated with a different session than the ETR? Maybe not, but it 
would be easier to understand if the core code handled the refcounting 
and locking for linked devices.

[1]: 
https://lore.kernel.org/all/20250306121110.1647948-3-yeoreum.yun@arm.com/

Thanks
James

> +	if (csdev->refcnt == 0) {
> +		CS_UNLOCK(catu_drvdata->base);
> +		rc = catu_enable_hw(catu_drvdata, mode, data);
> +		CS_LOCK(catu_drvdata->base);
> +	}
> +	if (!rc)
> +		csdev->refcnt++;
> +	spin_unlock_irqrestore(&catu_drvdata->spinlock, flags);
>   	return rc;
>   }
>   
> @@ -486,12 +493,17 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
>   
>   static int catu_disable(struct coresight_device *csdev, void *__unused)
>   {
> -	int rc;
> +	int rc = 0;
> +	unsigned long flags;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>   
> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_disable_hw(catu_drvdata);
> -	CS_LOCK(catu_drvdata->base);
> +	spin_lock_irqsave(&catu_drvdata->spinlock, flags);
> +	if (--csdev->refcnt == 0) {
> +		CS_UNLOCK(catu_drvdata->base);
> +		rc = catu_disable_hw(catu_drvdata);
> +		CS_LOCK(catu_drvdata->base);
> +	}
> +	spin_unlock_irqrestore(&catu_drvdata->spinlock, flags);
>   	return rc;
>   }
>   
> @@ -550,6 +562,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>   	dev->platform_data = pdata;
>   
>   	drvdata->base = base;
> +	spin_lock_init(&drvdata->spinlock);
>   	catu_desc.access = CSDEV_ACCESS_IOMEM(base);
>   	catu_desc.pdata = pdata;
>   	catu_desc.dev = dev;
> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
> index 141feac1c14b..663282ec6381 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.h
> +++ b/drivers/hwtracing/coresight/coresight-catu.h
> @@ -65,6 +65,7 @@ struct catu_drvdata {
>   	void __iomem *base;
>   	struct coresight_device *csdev;
>   	int irq;
> +	spinlock_t spinlock;
>   };
>   
>   #define CATU_REG32(name, offset)					\


