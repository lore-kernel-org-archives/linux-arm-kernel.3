Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7CFCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rmzfyqKtUktqtgRZxlEKA3VlDZr//CQb8mC+HCgs5Y=; b=YCUKsXgF4wZJmTbVI5q25ua/ud
	8q7AmXq8tYMpvADdVGisXSmwDmnU2vz/82Pfzyxwen07JJgGE7f0z2T0025/JUmG6BXAaQNxyBYv3
	/QCTmrIgSFaRkG6fXY2uOWuYrSu1yw9yMrpf3Y6e5h43v69SSQDqQJE0pKzZdriAOxyRrzx37EuYr
	1F4fkwprWs+UfWXcmPqrHRlyqYqHzX2I+d8rDn/DBWRP3m/lw2IVa7cCYK+c4wVJ3Y4OC7d+/WiYQ
	UxBJmY73vNDgljqfyYX5J6bcB5W8kaPyM4t12zGj44FkqOCi/DOyettKtHdzEOzN5FZd6p12B29tE
	kseVwkxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPY4-00000005Fcg-2IV6;
	Mon, 10 Nov 2025 10:55:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPY2-00000005FcA-2iNO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 10:54:59 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so18177385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 02:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772097; x=1763376897; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+rmzfyqKtUktqtgRZxlEKA3VlDZr//CQb8mC+HCgs5Y=;
        b=jNdYNDd7aVtVcH1mTi4Y7XQD3O1YqyhijIOWBTlGiQMvRt6oSh69ixpfQ05IgIcWFY
         8KWOcYMvNGwmkbW6Uq9qUSJM4V8Ays03HUS2TKStKATaeMN2PbFFUlEE9JfNBhYvHNmN
         wA2cLIGUekmaAWUxA7KJOFfKWXZx4I/CC7tDkUVEonVx9H1AHPJJYNdq0PVVItzK5Jng
         3STmT/bNmmXyguUdBOhnCZkUOP/Qi0I/PcxtPFPoZwXDARsxYZtS6cMuBzVM55U2sMWk
         x8SvU8Gcj5wrD7ah8rMoMZpWUF0gTME1cZD5rrGEkiJhAgz4UZbHZ0oJ3XgJvAJNk6J9
         gpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772097; x=1763376897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rmzfyqKtUktqtgRZxlEKA3VlDZr//CQb8mC+HCgs5Y=;
        b=PMyl8mPZtsHFZBE+r90ex+XPkC/4GNfNljVzhAa2toOtpCGLOEavuYz1sB20/2k/3D
         xtmsuVoghtRA8jxe7r39QS8J/BNgp57WPTskQapak0n1NzMlYlMowa1AX90uccVto+lp
         X/SDms85vBkF0iMEx8uLQf+4wnRFnItsDL4OTgcTKVQ8CZpqYeoKXcL8jQ9TM03MqQ6g
         4aVK6NdSW0kDBCVWl+InFbXTImtPJYYGCJxRAm1Nb1UAqvaA6jPyeDr+hlb9rl9/C6SA
         hZ7Rwljrx3AwrEktau6kiCoY3R7grIYMW+yACzyjfKnmhJrsxBtl0VmSVRgFf1E8j3y1
         NQIg==
X-Forwarded-Encrypted: i=1; AJvYcCU76yQktKTzWYObXHQof0VlwI5dCLzQDMk8wiRLw8zSoVuNWQKT2jIrJ6cGrLvY8Hfcj2fvB7Z6tzvDS60EkrlR@lists.infradead.org
X-Gm-Message-State: AOJu0YwBHOnNIT2FqGX/7Uwj2QfNeg+ZZrVqrlwJF1jqBQ3sYYzALXBu
	dFhpI9iPqflAXkY3M3hLq2c3YaQY8FWQ6KczhqYMdqkRbxwt4hakYi/cs1gKqZd0GHI=
X-Gm-Gg: ASbGncuLmV5EDoCiu54nvYpCgtaSueqdliNRKbfqRnPFtT2jmvC0QvDVqy9Mg08S+7b
	uTKugKe8nr7pcJWkz1ssJJI6/vc952gB9TjEszbLNVY/EbbWNx35r/a1dmB8eAocaXwnjRMZVW5
	yLmKXKKYS24VdwTV5A70qN7AfMgtRG2L8Xx7I1N48AOl+TpHK67m9goEnV0mVk8kYpS6XtZreri
	6zmnCPfgkwKWkmLpcykpeab7/uQjYlnr7apn0vEAt6s2AKB/vimB9rN1jDRE4CC8UsMhNcG5T77
	ZHpeNqDq4hEepeI0S/6M2tGEdHxRggNigzIHjvbrQmuCib+scD0wsiFAozPelJ76Q6wL3jmIn18
	a9BKH+7vIwlSiLxxBbioMcrz79HMkRnI7MkOLk1SXmzOOmicQTqaHArft8Bp9o18riPNrJOZYQM
	XbdMFbMw==
X-Google-Smtp-Source: AGHT+IGHQqpFO78FAXuTUiow/ayNj6a1s7WPG/2MI8tezbdXlT1tawHmiIkox1DHfFUpZH7Sxto/ag==
X-Received: by 2002:a05:600c:35d4:b0:477:7b9a:bb07 with SMTP id 5b1f17b1804b1-4777b9abc84mr37182325e9.35.1762772096679;
        Mon, 10 Nov 2025 02:54:56 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bd08834sm199863405e9.15.2025.11.10.02.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 02:54:56 -0800 (PST)
Message-ID: <a5687fbb-19e7-4963-83d8-60562221efa6@linaro.org>
Date: Mon, 10 Nov 2025 10:54:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/15] coresight: Add callback to determine if PM is
 needed
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-5-3d4bba674709@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-5-3d4bba674709@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_025458_739632_3273D6D5 
X-CRM114-Status: GOOD (  23.05  )
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
> Add a callback in the source device that returns a boolean indicating
> whether power management operations are required. The save and restore
> flow is skipped if the callback returns false.
> 
> The ETMv4 driver implements its own version's callback.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   drivers/hwtracing/coresight/coresight-core.c       |  9 ++++++++-
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 16 ++++++++++++++++
>   include/linux/coresight.h                          |  1 +
>   3 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index f642190740b93555084584abbc1d9426cc87ec7c..0d4e935094297023b8a7786ff4b1b3783164016b 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1586,7 +1586,14 @@ static bool coresight_pm_is_needed(struct coresight_device *csdev)
>   	    !coresight_ops(csdev)->pm_restore_enable)
>   		return false;
>   
> -	return true;
> +	/*
> +	 * PM callbacks are provided but pm_is_neended() is absent, it means
> +	 * no extra check is needed.
> +	 */
> +	if (!coresight_ops(csdev)->pm_is_needed)
> +		return true;
> +
> +	return coresight_ops(csdev)->pm_is_needed(csdev);
>   }
>   
>   static int coresight_pm_save(struct coresight_device *csdev)
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index adb5c6b12c6f3113747f1f455087b1ab497a53f6..da135849c70833366aa1089a0752bc7844c0d96d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1838,6 +1838,21 @@ static int etm4_dying_cpu(unsigned int cpu)
>   	return 0;
>   }
>   
> +static bool etm4_need_save_restore_context(struct coresight_device *csdev)
> +{
> +	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
> +		return false;
> +
> +	/*
> +	 * Save and restore the ETM Trace registers only if
> +	 * the ETM is active.
> +	 */
> +	if (coresight_get_mode(csdev))
> +		return true;
> +
> +	return false;
> +}
> +
>   static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   {
>   	int ret = 0;
> @@ -1929,6 +1944,7 @@ static const struct coresight_ops etm4_cs_ops = {
>   	.trace_id		= coresight_etm_get_trace_id,
>   	.pm_save_disable	= etm4_cpu_save,
>   	.pm_restore_enable	= etm4_cpu_restore,
> +	.pm_is_needed		= etm4_need_save_restore_context,
>   	.source_ops		= &etm4_source_ops,
>   };
>   
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index b10ef4fa17a76b4d11223cc8fd43e5544b6ea8b9..3d59be214dd25dfa7ad9148a6688628e0d1a98dd 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -441,6 +441,7 @@ struct coresight_ops {
>   			struct coresight_device *sink);
>   	int (*pm_save_disable)(struct coresight_device *csdev);
>   	void (*pm_restore_enable)(struct coresight_device *csdev);
> +	bool (*pm_is_needed)(struct coresight_device *csdev);
>   	const struct coresight_ops_sink *sink_ops;
>   	const struct coresight_ops_link *link_ops;
>   	const struct coresight_ops_source *source_ops;
> 


