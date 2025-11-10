Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265CECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRMyZfdYsDpRh9FUI3Yc9w8yH9JHyWqK4UFoLOqgVs0=; b=iEUjJqx5l0aAKLCOI0qg0V/QIz
	GiVEZiIvsqTI7FZo5sBW3c0ZBoeJ5uK0SOpBnTLD6uzghJWrgpM4Rtuog4Nmx1WllA1X87HETzB7e
	jz21S2NkG1e2/oGy+4w9ok9AWAWvbDRZrkmCARO+7CSmMSfAtN5gX7KJdwQ0vB2P7ijp7HYlEmJb4
	8Zn0uDFCmP5PXwZkpvKtzwWrZZ24pr+SbOuo5PrvkDJn5Ct8v7oIMUqZhQwSVGUhpBn60ldd6AIbH
	1trTDAzlmvauLqtFqSrJTRFBO+ouGebURYsUrSMN/a/mJzvzYjnAvlDCCVqov6wZnBCq66q5hJMTo
	Wrgu+d+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQJd-00000005LI2-2xYr;
	Mon, 10 Nov 2025 11:44:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQJZ-00000005LHe-2Eh6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:44:08 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47721743fd0so13918725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 03:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762775043; x=1763379843; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RRMyZfdYsDpRh9FUI3Yc9w8yH9JHyWqK4UFoLOqgVs0=;
        b=iAUvW3LUumVsVFZYroImMYLqUYLeO1NKJidEVygycKe6Ek0NS/gwfuwnThyG4tbJvw
         S6Smi5nl1ILnhkQV11Xoh6bA0FV+xu33NSAw2GvGhn/IUp3SP4gosMc8fcIivF4h40Mt
         HRUTGZgZcuB1JOtOw0Nj1TmLh2UJNTRHJNqNtRZkKHonBDJ6y35EK3ii330I1frRExmK
         ARhyy6uKoZYy3rCaG5bUovWOuTZTr5v66WByn18N79jU0l8URhu9pY7n6pVdU7D+PjmT
         eFdaqj1NrtPJKHftbgDCsHItWzRXP7gXdpXEOdZSdA29+BpB722GVDy1jm2COWigkhr2
         fgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762775043; x=1763379843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRMyZfdYsDpRh9FUI3Yc9w8yH9JHyWqK4UFoLOqgVs0=;
        b=ru8lfofR8GSBdZ6q3H9YxCPp6UJsw5QEedxtrPxRjUqG0FBFCQUmj6wrhzzS/Wz9Yx
         TXwv0R3eTJ9W/z0XNzOAMQAfrkEYyCrX0MA7+qywnGYpwExdP8rIN/ngFFr9+PIJV6/1
         7Yy5bT6/5us9PgQ9Lbhp/ua+dwU6kzyiuHmY+/6gVwO6AGouuU3+lG3PoIS1Y+cuuZi4
         IVAgVx/MQDpf1UdHjkCY5vdEwhLIryDny71PdqSVu686PUFd/P4s3n6679ewp8aaT2Nt
         Wo5/i1WAtGBWBFyRLJ8myZT1rH9eOfvnzVSAYE6TuIo+NYu0Se54WdSGFwJ6IiLp6kXU
         aifw==
X-Forwarded-Encrypted: i=1; AJvYcCXz+Xrw39kIQG1nYhMcMXLpSwQ7Ihv3npRqKgUC32Fz/Sg3uj4Gy9OOvu1heBg1bwnsAbxhq7YozwMeMEWBgxPM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4mIuKmQBKVB1gWWXVHMPa0MhD664wZZe1wsRLweSE251VRvMq
	QqjMClIASWAlgPdvyMud10U+VrJQRWd7nviQ7wd0EYTFd9AqUqEOyRKHaIlO8V6R+uI=
X-Gm-Gg: ASbGncsXDGEaExogV4suZQCwrsHi2z4CryZLEfiexGjWjwVWn5KGfY7wpysCxdS0R44
	PodutEL/2WimcxSB7kl/mQ+3Ezsw9fdZG5cGTitUQzWe/+42sb/A1hrunuHHrFsM70E6X5EJ/Ab
	D8+NF4greFxFx8aprBzalrxaPdHHEqgKKIXzm/YlZsbvzs9W66/VroKWgdkZInfjs5T9ygxa9t8
	p4PADn2AcLKFMEjX0pt5Ycs/kVHzSPAJKHTistXubsezi+lxb0ehT5hR2CSlvwjVtJpUkqTvOyN
	Sc54HHQlbBG42P1bK63dpZ2DULQxMfElugYdrKeXEhDq1TEERDJPkBa85QwfvR2ar6c+RW5jEOI
	/O87Cy1n7OFLftSY7Vdvzkxkp354DpKC+/uQaI4v3BnxVMwUOd/ACboSicwsy+uIviVXXf7sE9i
	NjrdlqVNK37s0zclGECBzu3LyAz38=
X-Google-Smtp-Source: AGHT+IEYjSyM5kVS9bSnwlaDyOY9Bx4Yg5jomNgYzxM2fhNfrgo0sdrxgcTvNJaim4dcl4FGpXR4Rw==
X-Received: by 2002:a05:600c:1c8e:b0:477:54cd:202f with SMTP id 5b1f17b1804b1-47773230ae6mr59378805e9.3.1762775043579;
        Mon, 10 Nov 2025 03:44:03 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679e06csm21513538f8f.47.2025.11.10.03.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:44:03 -0800 (PST)
Message-ID: <93e1b195-ef3a-46d0-827b-46e7ec0bbb98@linaro.org>
Date: Mon, 10 Nov 2025 11:44:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/15] coresight: Control path during CPU idle
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-11-3d4bba674709@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-11-3d4bba674709@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_034405_596904_551139B4 
X-CRM114-Status: GOOD (  18.09  )
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



On 04/11/2025 3:21 pm, Leo Yan wrote:
> Control links and helpers on an activated path during CPU idle. Since
> coresight_disable_path_from() does not handle a source device's
> helpers, explicitly disable them alongside the source device.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 6c12692efb51c63f3aa9da6f65a349eae1926f4d..73be22c8f315525111f2dafd692e61bc6db85c25 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1661,11 +1661,31 @@ static bool coresight_pm_is_needed(struct coresight_device *csdev)
>   
>   static int coresight_pm_save(struct coresight_device *csdev)
>   {
> -	return coresight_ops(csdev)->pm_save_disable(csdev);
> +	int ret;
> +
> +	if (WARN_ON(!csdev->path))
> +		return -EINVAL;
> +
> +	ret = coresight_ops(csdev)->pm_save_disable(csdev);
> +	if (ret)
> +		return ret;
> +
> +	coresight_disable_helpers(csdev, NULL);
> +	coresight_disable_path_from(csdev->path, NULL, true);
> +	return 0;
>   }
>   
>   static void coresight_pm_restore(struct coresight_device *csdev)
>   {
> +	if (WARN_ON(!csdev->path))
> +		return;
> +
> +	/*
> +	 * During CPU idle, the sink device is not accessed, so it is okay to
> +	 * pass a NULL pointer for the 'sink_data' parameter.
> +	 */
> +	coresight_enable_path_internal(csdev->path, coresight_get_mode(csdev),
> +				       NULL, true);
>   	coresight_ops(csdev)->pm_restore_enable(csdev);
>   }
>   
> 


