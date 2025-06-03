Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE1CC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHNAlRur4Mzy55glFeFmX3daSkoJIVSbM9jw3Ca5CJo=; b=P5Y/VFTl4hoOUivgQ/uS5dnzbg
	yXkjscPN3V8Dp7swmCTJFD1ABJdg3XSI7/HGMjH/Y6DNZl7U8Pv4FuuU1gy6gaS0OcRbYRfblfciQ
	yEWYILnQYJ+zDKH7TnYH2IIOAOtQ+rx0ahleYcvTNzBcee8pqFYEoGlrg6K7G+AOrbJv0rC8pNKXH
	hJzVRhfdJFrJABecNxjQ5imZGXJuPDU46LQDK1KiSiMr3AWes8aS/eYPTa5XjbhJbKqsXFFGwmohv
	wCdpA98rKWPaqhzhqa6VMIHf1XIRINC42f5SUA5OLbQSS4XkqliPiaScXbcdkKTFEORpEEE9LBQYK
	GCkEfY2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMT1L-0000000BD79-1kyB;
	Tue, 03 Jun 2025 14:53:43 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSxF-0000000BCcA-243u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 14:49:30 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-450caff6336so35150385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748962168; x=1749566968; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DHNAlRur4Mzy55glFeFmX3daSkoJIVSbM9jw3Ca5CJo=;
        b=q1/0YioLY31+5LZ34v16aY+A/gJUuHuzA1DRRyzoK8Zqxd3E6mxK/J7k1Su1qGLYvp
         tOBSqaeoIPgJHYlsVrG7f7m42Ua9cXx/lHFZ/tfj30AVU9PRUov9ZPESF4lwZxqNj3TE
         b6Alcem1ugWHJ+Nmk5j+wWmXKW51gM0x+handfBo90Y9JkIv9g0ZhQGteZbxKawRJzYJ
         mVaMgOymE8hmT9fmYPIQYoRTmnWn3umGJQ7daZArt3YaJVnLW26Q9QS17WqJ8ai/+EE0
         JG9ffeftzIvOr1wXRcxJ/5mGThjVEhtjtJQvmi71RtJp8k/HbwKGvVDrkDB4UdyhbzY1
         XlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748962168; x=1749566968;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DHNAlRur4Mzy55glFeFmX3daSkoJIVSbM9jw3Ca5CJo=;
        b=F5S5vFdZ5d/zWV5M3kxQHPJQeW0/+Avl1M7+xjgiGpzIINmVFgJRBDWdrTBXmasjgY
         vElGeDEfvJzDE9KDfM1RmslYL7aJpEkeg+jPaD6KBwBgUDO8t8BcFtGZkPR2lnmBW6yQ
         x1nNQqRvHYPDlnqwjUYHGHiCIhkoWwrjbhzS6yJ8EJhjbX9MUgDB/I5va0O2Emct+0n+
         lQ3Ik5grKCY4oSdQyYV6bymhVS7NDQP9Kz2ziAS2Tg1KzjJuz5pUihlOOdeFwtB6jrTn
         t9rfs9wRe8iHd3RI6TAcKtLtVOf8n/PVHCeN5dPVtwEbr1eCJ44VqtMfday4/wXstWz9
         AElQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6u4J/mMxN7oAYKQ2xoOQ+Y/+EAa+vkf79k9KpxCN1yHQjGCuRyzGK6q8By5chArB6aA9bjPXNn7j1xO2K82Ze@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzjr9DS/qLoc6flQ4/bWdByhRBc8OUEtp1dcM1ZD18cO0Md87B
	wwJ+fd8pZYvvTf0mRHrsXWUFU5x3VMyXwwjYZkoYpd9EgJ3nxXu58869Y54VWjzZfk8=
X-Gm-Gg: ASbGncvcv7ixO5BK8G2ZN4unHNHBSf6Q2ftDxkrKOzlj5IrHVrsTfvfN7Ba4+IzJxxs
	tFR4dr5aXIY4RAnDbOvv4O8iAQjHpViGEP7gmcZeK3BVTjaS73SP6ByLHZjgtEKQGkbatRU83G4
	+1MQCD4MGs1gN3p3+IkQ7nf/SzqgLYkC24XLFXRZ/I4+XqrckPeFsuzLUm/djj08W8c56d4TE14
	wRAAhv6mSzDw2UDIgVkAH17fjN0EaZXEJNINGw0uiEZOAvioRn9BS6a58LT9gqiY33l6lql9jU4
	/WJ9t+9PLbz0834bM+UhS3/rGivuCBIrPl6PrzbGpbEAJXtNMxabxpTyq89810dVa0g=
X-Google-Smtp-Source: AGHT+IECmBPCBSD7Uesgd5QQryXEzom9/UC61J2dkhS1V9fif6y3urAVFESoNt+7xicsEWyGs2yM7g==
X-Received: by 2002:a05:600c:348c:b0:450:d07e:ee14 with SMTP id 5b1f17b1804b1-450d8874cecmr172725155e9.17.1748962167869;
        Tue, 03 Jun 2025 07:49:27 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fc281csm172222795e9.40.2025.06.03.07.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:49:27 -0700 (PDT)
Message-ID: <788e698d-aa1a-47ba-829f-aef9cd4b7417@linaro.org>
Date: Tue, 3 Jun 2025 15:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/11] coresight: Save activated path into source
 device
To: Leo Yan <leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
 <20250516160742.1200904-6-leo.yan@arm.com>
Content-Language: en-US
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Yabin Cui <yabinc@google.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250516160742.1200904-6-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_074929_538292_4ED47056 
X-CRM114-Status: GOOD (  21.42  )
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



On 16/05/2025 5:07 pm, Leo Yan wrote:
> For a source device, save activated path into the coresight_device
> structure.
> 
> This will be used by sequential changes for controlling the path during
> CPU idle.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 10 ++++++++++
>   include/linux/coresight.h                    |  3 +++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 7ab7321ca8d5..8f565bb3c535 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -495,6 +495,12 @@ static void coresight_disable_path_from(struct coresight_path *path,
>   
>   void coresight_disable_path(struct coresight_path *path)
>   {
> +	struct coresight_device *source;
> +
> +	source = coresight_get_source(path);
> +	if (coresight_is_percpu_source(source))
> +		source->path = NULL;
> +
>   	coresight_disable_path_from(path, NULL);
>   }
>   EXPORT_SYMBOL_GPL(coresight_disable_path);
> @@ -577,6 +583,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   		}
>   	}
>   
> +	source = coresight_get_source(path);
> +	if (coresight_is_percpu_source(source))
> +		source->path = path;
> +
>   out:
>   	return ret;
>   err_disable_helpers:
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 64cee4040daa..cd9709a36b9c 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -265,6 +265,7 @@ struct coresight_trace_id_map {
>    *		CS_MODE_SYSFS. Otherwise it must be accessed from inside the
>    *		spinlock.
>    * @orphan:	true if the component has connections that haven't been linked.
> + * @path:	activated path pointer (only used for source device).
>    * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
>    *		by writing a 1 to the 'enable_sink' file.  A sink can be
>    *		activated but not yet enabled.  Enabling for a _sink_ happens
> @@ -291,6 +292,8 @@ struct coresight_device {
>   	local_t	mode;
>   	int refcnt;
>   	bool orphan;
> +	/* activated path (for source only) */
> +	struct coresight_path *path;

This is probably cleaner if it's saved in the new global per-cpu you 
added in patch 2. It's even more specific than "for source only", it's 
actually only for per-cpu sources so it's not worth having it on every 
device.

>   	/* sink specific fields */
>   	bool sysfs_sink_activated;
>   	struct dev_ext_attribute *ea;


