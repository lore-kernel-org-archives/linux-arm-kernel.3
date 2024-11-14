Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCD2D65C79
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgI7vBVNQ5dramVjRX+iCqPJAW4j0v1proTfBVBLaKk=; b=2riH+fqgwlUK3BuAVDaLiFuTaL
	eMDet2Li0tShNGBaqRim8ko19aQo11C28y4N2/+42XMsB08V0L1pYxevRQHP7h37mAAzEIIXxpqb8
	oj5/+SMFyV6yTKJkIAf8OA9sjypIPgk5U1V3/16ttVychdf7AABZQdz9XKWn04/gqEd60hfZn1jAV
	Y5o/r9Qq3jxheLkBLCIePGQHxwq9xlt96n+Yp7N7UfSa/WwosMh4gGxTqggzezcdcXRD0qye8/O8I
	SNKEtTjLkdR2H/bH4a1RpcqbpIyKQPUfAzWtrlZzgtBnHRLKvxa+pG2xeM9oBhQ8JtBXVtudkoIRr
	iwy85Ivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXyL-00000009ifG-3Cu5;
	Thu, 14 Nov 2024 11:25:13 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBX7v-00000009Xnr-08cc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 10:31:07 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5c9693dc739so673970a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 02:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731580260; x=1732185060; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RgI7vBVNQ5dramVjRX+iCqPJAW4j0v1proTfBVBLaKk=;
        b=ypdFQimYy8J6BobSIDCFp2LIDjb3nAXhNujm7w1Rgs/m+q2GiZYW40MyCtn9PMFClx
         BaggFdl9XQ02H3AUp/Zm9GgO4DIXKbqTT15sb/G5AXOVhXNRc1D4M8C8YYpx8nyr4rkC
         PcFzSKQcgEipS9BMZxSWH6bAiw166jyi0Vaw8pfmxXqzfWozi62TBTqRrieYlOFd7AlG
         jW3Y2InO/19g3DoRHZvzv6QnnXS0vr6O3ksXKPtDRQI3Ie5KrUNN84oi7esp7mnA+kWC
         lSV0KAIAY904VzsEvIdbprr930tCNQY4MQW9V6LwTTdptZLD4VYqfMVyODcXUELDz6da
         dD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731580260; x=1732185060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RgI7vBVNQ5dramVjRX+iCqPJAW4j0v1proTfBVBLaKk=;
        b=fVzVNj0GJAwC8S33TJ/dP+zjyPFcDXvA+2bJG5N90vCyaHq6yhWmU2r+/0xHKA89Vg
         v30svw2Rob15DlD18uuLMiBa4izxeSNVAbA/ZzhA+cPAmk6Jt3W9LCtkACWmVdTP9CAh
         8vFNCiIqf+SXqIEc5NfMGtzSSPxbEeDaz6mWZmUZdSy8YS2du0ijfKjvuE3nhdhSZ87Z
         WA96P+DyS/UFhkYNuAmFcOqvz82cYH1exHkUHgziJseESRZKNh3N4/IOSzBxSwKctlM0
         FLYKBPw8DCHh9sHpRgjrVqgeZhF006JUOqG2l2aNelOdY+2POb4q/l13Fi/mtwkYPPjQ
         RuiA==
X-Forwarded-Encrypted: i=1; AJvYcCXpC8eBECFsPyAsXZSTtAy7Mx77tsW0U/U6vpTjatfDgumIwXNyYsZu2OMMLPR46CIMZRKu20+g8PBZis3T2ooa@lists.infradead.org
X-Gm-Message-State: AOJu0YwhmDzA9iLz5WxJW27WpTcszesTqqsfIfQF6hJo3FMa/vX2hq32
	wiMuHFknzpIM8zIgqEoRuTY6ENkIlCVxwxQ6aZQEIEtNTHE1NWe1eVpU4xlITvY=
X-Google-Smtp-Source: AGHT+IH/HoHzVZ8dweCgYTdCVV9zt9MtH4uuNtH40ihWsmPGZwTnP7LCHY0nxQ9xJT+XcqQ5mdq4sQ==
X-Received: by 2002:a05:6402:40d0:b0:5cf:6674:c669 with SMTP id 4fb4d7f45d1cf-5cf77e9027amr1227580a12.7.1731580260327;
        Thu, 14 Nov 2024 02:31:00 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79c0acf4sm421662a12.68.2024.11.14.02.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 02:30:59 -0800 (PST)
Message-ID: <9a637e74-d81d-405c-bad0-c97ec1aa4b77@linaro.org>
Date: Thu, 14 Nov 2024 10:30:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] coresight: tmc: Don't change the buffer size if it's
 in use
To: Yicong Yang <yangyicong@huawei.com>, suzuki.poulose@arm.com,
 mike.leach@linaro.org, coresight@lists.linaro.org
Cc: jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 hejunhao3@huawei.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20241114081653.24328-1-yangyicong@huawei.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241114081653.24328-1-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_023103_134506_12DF2999 
X-CRM114-Status: GOOD (  24.93  )
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



On 14/11/2024 8:16 am, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Enable the trace in below steps will crash the kernel by NULL pointer
> dereferencing:
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> echo 0x400000 > /sys/bus/coresight/devices/tmc_etr0/buffer_size
> echo 1 > /sys/bus/coresight/devices/etm2/enable_source
> dd if=/dev/tmc_etr0 of=test_etm_sysfs_etr_030.data
> 
> The call trace will be like:
>   WARNING: CPU: 39 PID: 8586 at drivers/hwtracing/coresight/coresight-tmc-etr.c:1123 __tmc_etr_disable_hw+0x108/0x140 [coresight_tmc]
>   [...]
>   Call trace:
>    __tmc_etr_disable_hw+0x108/0x140 [coresight_tmc]
>    tmc_read_prepare_etr+0xc0/0xd0 [coresight_tmc]
>    tmc_open+0x60/0xa0 [coresight_tmc]
>    misc_open+0x11c/0x170
>    chrdev_open+0xcc/0x2b0
>    do_dentry_open+0x140/0x4e0
>    vfs_open+0x34/0xf8
>    path_openat+0x2b0/0xf58
>    do_filp_open+0x8c/0x148
>    do_sys_openat2+0xb8/0xe8
>    __arm64_sys_openat+0x70/0xc0
>    el0_svc_common.constprop.0+0x64/0x148
>    do_el0_svc+0x24/0x38
>    el0_svc+0x40/0x140
>    el0t_64_sync_handler+0xc0/0xc8
>    el0t_64_sync+0x1a4/0x1a8
>   ---[ end trace 0000000000000000 ]---
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000028
>   [...]
>   Call trace:
>    tmc_etr_get_sysfs_trace+0x10/0x80 [coresight_tmc]
>    vfs_read+0xcc/0x310
>    ksys_read+0x74/0x108
>    __arm64_sys_read+0x24/0x38
>    el0_svc_common.constprop.0+0x64/0x148
>    do_el0_svc+0x24/0x38
>    el0_svc+0x40/0x140
> 
> Due to the buffer size changed, the buffer will be reallocated in
> tmc_etr_get_sysfs_buffer() when the second source enabled. At trace
> end tmc_etr_sync_sysfs_buf() will reset the drvdata->sysfs_buf and
> trigger the later NULL pointer dereference when reading out the
> data.
> 
> But it doesn't make sense to change the buffer size when it's
> already in use. So block such behavior.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   drivers/hwtracing/coresight/coresight-tmc-core.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 475fa4bb6813..9660af63e9bc 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -319,6 +319,11 @@ static ssize_t buffer_size_store(struct device *dev,
>   	if (drvdata->config_type != TMC_CONFIG_TYPE_ETR)
>   		return -EPERM;
>   
> +	/* Don't change the buffer size if it's in use */
> +	guard(spinlock)(&drvdata->spinlock);
> +	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)

Size isn't used in perf mode is it? So it can be -EBUSY only when mode 
== CS_MODE_SYSFS.

> +		return -EBUSY;
> +
>   	ret = kstrtoul(buf, 0, &val);
>   	if (ret)
>   		return ret;

Looks ok to me. Although for consistency it might be worth changing to 
guard(mutex)(&coresight_mutex) because this is about sysfs mode only and 
other usages of mode and comments point to coresight_mutex. Using the 
device's spinlock will technically work but it did make me go and double 
check the code. And there are other cases of reading the mode like this:

static ssize_t enable_source_show(struct device *dev,
				  struct device_attribute *attr,
				  char *buf)
{
	struct coresight_device *csdev = to_coresight_device(dev);

	guard(mutex)(&coresight_mutex);
	return scnprintf(buf, PAGE_SIZE, "%u\n",
			 coresight_get_mode(csdev) == CS_MODE_SYSFS);
}

Mode can change to CS_MODE_PERF while inside coresight_mutex but the 
device would end up not being enabled for sysfs, so it's still ok to 
update the sysfs size value in that case.

With that change:

Reviewed-by: James Clark <james.clark@linaro.org>


