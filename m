Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3D7C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 15:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBZAg7coz8Yl4UYLo3Gw27GNoH3K539iz6XFHn4olsc=; b=RBPAnejbbmcbYk8qpDxzp6L29I
	K4XPV7YV3FyPkbXEUngNXIQGmnvM8FthKPf6plkt9vMNHaoljLeb+/oDWvXWwUnXdnAncM5W1mnfr
	Mez2+Cxlif7v8LiaimdhMNv3BT1GWCWBr/Ap2G7CqzW8UlQLO557FT1Z04BdUXntZKPiRXhEixhFC
	i+Y6BUOevbcjCsQuKrjfI7JgYtqXGOvWRzCkxLBV0tvTcqJ6yjPP+SBhMXz+GaK1tyqgenTkLqzcs
	qayrbEPRt0D+S2EXadnU89Fnk/GmqyEkn2y0T2FnW504BtfovpOU6SpnSjEZytAOED9QZZRbrUK4i
	YKus5n5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTeB-0000000BIav-0aPs;
	Tue, 03 Jun 2025 15:33:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTby-0000000BIGv-01u9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 15:31:35 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-451d54214adso24237885e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748964692; x=1749569492; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HBZAg7coz8Yl4UYLo3Gw27GNoH3K539iz6XFHn4olsc=;
        b=fpFK+MY68Lsl1P/axigFtR0s+/eWTQCq8ymGhuIFKZI8MhKs3XQPiCudhDCvFfPNPp
         5emsfYzXs/p8DCipRMYkrRJ1I/0kbgJn/1G+XRKUxi5CvnQeSZ16fiFgDwKSxdt3vnsY
         Y9x92LEQJoMCU6PIFoyp+B6Ie98LE0cF+Y4DhyM6qZMB55TekDNGl/pw+vy6UmIxTE/V
         6cnbp6pDeliWfGBsHA7D0007kGZSupRYBO4v2soqWocFbUYYvM8hTUWCJN26lERnHnCA
         uaJ3iIbbcvG7NHbKVNYLAP5QNv7nhgFOzdxXDNmTdVNPBpVI0TXi9QazjVQNDvCjZ5U6
         +glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748964692; x=1749569492;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBZAg7coz8Yl4UYLo3Gw27GNoH3K539iz6XFHn4olsc=;
        b=OBh+LeUdCPDqRNFZI+k+pjLxCUwFK027vhQyQ5T3cEpaEEx7UiVwwmKSuLe7NCJ3xH
         9IocVdSu1mX1BM4i6zY1QuPpHTvFRAUc9yw5xkU2i0D3BpbhvMHhzooXf9AAL/KBRKP8
         EO/qDqt1jglNG4oIGRuP69QrZwesTGbp4PljEM1PKw/M2Oxdhvrjg3jy84dVg+wwJGT2
         zFZbgtyoQU/xs6rvuDdfn7NTUjG+Y98fkXmsA7iZKMGrocH3F60Ur0lhIC7BKKAFxmtG
         wsIcLqvBupvDB3M0cIfIvPWK1WvLjF7uAnICX7JR253/6Yqw+pco/AE0QExVcW/Foix5
         1FBg==
X-Forwarded-Encrypted: i=1; AJvYcCUjJSdYKTtFarqr5QvttoZh7xGRL2NdxtDXGPKhPRs6LaEaq6KZAwqY+0FSC9G8r2j/BuFcWbH6x7H1TMuXAkdZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxfunXColACKGkbicutgj9saY76tZC4eYMsC4MTNOkNnwV2iX9+
	B3ZGB5zK/VjGYvLskVPEMvl5vomEr5/3fjw5TDv5TrdrYsgc/p1Qa9JovZUWVmUkLJA=
X-Gm-Gg: ASbGncs6DMkweIbUefoFFvm750XIC2w71ZlAvb2n0/7dx68qov4zJFCnqltiqIfclDf
	xR7z2JD7kJBj2r9rZ9do/NnyDVB/SacsGzopnzydEB3MkJuGm8Wd7V0NUNKXFOVNvLSjXBJXMVT
	fuEUVELbNMv8C1n/JLdPlsFOsPxo9Y5p9cVqo3V6nQC68qhLCTbIIZEYwpDUoPV2hceVxHqMeH0
	bwa2Nm85Bn+Npll/akqSK9weyhvMXppt4/f639jeurXe8dk4AtW4DxE74O8sjyfnYAeCK0QY18f
	4H844ixoaLJteEqNEXtjPeURgUSB6JhpyFYnFP5h7uQzRLKDUGBAQEideh1HWTNmG8g=
X-Google-Smtp-Source: AGHT+IFQrBWx3+w9PBk2HcoUaNXfr+MZTjqWRMosbyKBDgA/bBe/yew8j7KSLP4izuy6Q4GHq2E4BA==
X-Received: by 2002:a05:600c:c0cf:b0:442:d9f2:ded8 with SMTP id 5b1f17b1804b1-450d65008a7mr148527375e9.15.1748964692264;
        Tue, 03 Jun 2025 08:31:32 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451e57bcb99sm20712835e9.2.2025.06.03.08.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 08:31:31 -0700 (PDT)
Message-ID: <7b234557-1630-44fa-923c-35f9e4434969@linaro.org>
Date: Tue, 3 Jun 2025 16:31:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/11] coresight: Take hotplug lock in
 enable_source_store() for Sysfs mode
To: Leo Yan <leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
 <20250516160742.1200904-10-leo.yan@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Yabin Cui <yabinc@google.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250516160742.1200904-10-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_083134_084177_AC26C50B 
X-CRM114-Status: GOOD (  31.01  )
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
>   drivers/hwtracing/coresight/coresight-etm4x-core.c |  8 --------
>   drivers/hwtracing/coresight/coresight-sysfs.c      | 12 +++++++++++-
>   2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index d5fd9e58a962..e5a7c0dd7f8e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1032,13 +1032,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>   {
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   
> -	/*
> -	 * Taking hotplug lock here protects from clocks getting disabled
> -	 * with tracing being left on (crash scenario) if user disable occurs
> -	 * after cpu online mask indicates the cpu is offline but before the
> -	 * DYING hotplug callback is serviced by the ETM driver.
> -	 */
> -	cpus_read_lock();
>   	raw_spin_lock(&drvdata->spinlock);
>   
>   	/*
> @@ -1048,7 +1041,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
>   	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
>   
>   	raw_spin_unlock(&drvdata->spinlock);
> -	cpus_read_unlock();
>   
>   	/*
>   	 * we only release trace IDs when resetting sysfs.
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index feadaf065b53..ea839a5e601b 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -359,14 +359,24 @@ static ssize_t enable_source_store(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> +	/*
> +	 * CoreSight hotplug callbacks in core layer control a activated path
> +	 * from its source to sink. Taking hotplug lock here protects a race
> +	 * condition with hotplug callbacks.
> +	 */
> +	cpus_read_lock();
> +

Looks like you can do guard(cpus_read_lock)(); and avoid the multiple 
unlocks below.

>   	if (val) {
>   		ret = coresight_enable_sysfs(csdev);
> -		if (ret)
> +		if (ret) {
> +			cpus_read_unlock();
>   			return ret;
> +		}
>   	} else {
>   		coresight_disable_sysfs(csdev);
>   	}
>   
> +	cpus_read_unlock();
>   	return size;
>   }
>   static DEVICE_ATTR_RW(enable_source);


