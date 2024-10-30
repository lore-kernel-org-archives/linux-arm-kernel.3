Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CD0D5CC8A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6e62zABhJgu0xsmWlRUsEgJ/DIZADPy+MDY7G9xqvTM=; b=0lUE9XzpXa6t7IUNCvfMjdzxJ2
	McOz/Uv7Mgo6modUGi8pc8/8/+SQKAn15bKUYdXLdkDgvJoYsKhPm7KWfwKTuj2NZ144WifRxvubz
	PhBi4jHJ91VktUeqRh0CaB2Mk8jgWBHNRuLpPSac3kwzJ4j81YID/xsTldqKKcs4GPb/ay1rKRwv6
	P6T9nXhNLd6e8VkFZg7+ymntss++8QKqx4DXiqprSR2QRu6F7P/KvwAXDOQdjdhIHWMrNglt2+E4m
	XENeLR4BvzRAUW0BXya0iUwiwjQyIcePXTSvHQgVmzFVpCcn9aa+kxTTFeg8XVslRkkONzySxQcRe
	2ZmN9JgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t669C-0000000Hahl-2tqM;
	Wed, 30 Oct 2024 10:41:54 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65zn-0000000HYhy-0sW3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:32:13 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso63234751fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730284329; x=1730889129; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6e62zABhJgu0xsmWlRUsEgJ/DIZADPy+MDY7G9xqvTM=;
        b=pxyUMXeW7JeYQKzaH43+uuTjmf3qoKNJCfVPJ4mKTzPXhUb4cdWTIrcYL7LFpvOSnU
         YbPyZhcrkYZwrIw+w2Eq9Gxxr6m37+ZZpO9V+HFLK8d/i2FkAe6nREMS0DZYO0j6JlbC
         UrooG9Y/gOVCn7qKTjKmXiCEz6IznpZxbYXlNhJOs55hdzRoMJBarlJYCZWin1eFluXW
         U5rEpYkB15UfYh2s8E9kioJjreoZbs1DvejWcFyEVysjUT+7pwGte51Mjssjl02Z5h9v
         alraWJHmMCUQWhIXJZGkXSlEhjbfiA9MDQ+Rr8/m+dpY0OOlA3IHSZLg7rRKXbwgHV+V
         IzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284329; x=1730889129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6e62zABhJgu0xsmWlRUsEgJ/DIZADPy+MDY7G9xqvTM=;
        b=GSGLIa2PuanoFQ5ZW8jl1Bev/vf9lUbhxJOA6ZCWYNBRvZ75sYmlzCVfe/k0JPnGZN
         ylrqNM/G0ZYQezv3v4NecA62T00s1Mzjy2pV0yMEN7rmmwQVrPY2El749x0AadnMxgWc
         0kOipgS4zqUronJ6NCPUkaizJWlQwHN5uwa8FNqoqgHj3h8nHO4nGWXTmd6gw3HSHl+4
         iOLk9FstyD7WEtAzT0XggSkgjG0wE9W2SwqxTTJesVdQ8Vtz3IqkAwvXA7rSseLrYnCz
         2VMFDudJhVQch9T2fyWpa6PxPmm88+DeeLYm4Oh/r84km+rXu0GNreJfM7fWUY0dshYu
         mM1g==
X-Forwarded-Encrypted: i=1; AJvYcCXSCE/vuNQF+AS68zQ50xxf+pZiD9YLaibvCo4uSq/QyBLr8uDvzR8X3+6Ret4//B9FeWIJtPTd442bHi7ehryS@lists.infradead.org
X-Gm-Message-State: AOJu0YyqViIDIMDD1Df0855dT4tWkB97oHhqV8KIBz/Q5tJR67BRYDe1
	PDzcn+UMS2vXNiSrL1qZgy650eu5V77oKKsz6TExUwToOFDO3+nh6mgWZmLyPMQ=
X-Google-Smtp-Source: AGHT+IHN0Q+Mdq7fYa0Zn8cYYpDEzpyE0X1QlkitrR+30fjLy2hEruXPOPZRkaCk7IohqcOaFpkJEA==
X-Received: by 2002:a2e:bea5:0:b0:2fa:dcb6:fa7a with SMTP id 38308e7fff4ca-2fd0590bdc8mr13523571fa.11.1730284327314;
        Wed, 30 Oct 2024 03:32:07 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca747sm17059915e9.45.2024.10.30.03.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 03:32:06 -0700 (PDT)
Message-ID: <c553db69-6bb8-44f8-b571-21c631fcaee8@linaro.org>
Date: Wed, 30 Oct 2024 10:32:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] scsi: ufs: exynos: add gs101_ufs_drv_init() hook
 and enable WriteBooster
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org
Cc: andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-8-peter.griffin@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025131442.112862-8-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_033211_295929_F4659F5E 
X-CRM114-Status: GOOD (  13.63  )
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



On 10/25/24 2:14 PM, Peter Griffin wrote:
> Factor out the common code into a new exynos_ufs_shareability() function
> and provide a dedicated gs101_drv_init() hook.
> 
> This allows us to enable WriteBooster capability (UFSHCD_CAP_WB_EN) in a
> way that doesn't effect other SoCs supported in this driver.
> 
> WriteBooster improves write speeds by enabling a pseudo SLC cache. Using
> the `fio seqwrite` test we can achieve speeds of 945MB/s with this feature
> enabled (until the cache is exhausted) before dropping back to ~260MB/s
> (which are the speeds we see without the WriteBooster feature enabled).
> 
> Assuming the UFSHCD_CAP_WB_EN capability is set by the host then
> WriteBooster can also be enabled and disabled via sysfs so it is possible
> for the system to only enable it when extra write performance is required.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

While reviewing this patch I noticed few cleanups can be made. I sent
them here:
https://lore.kernel.org/linux-scsi/20241030102715.3312308-1-tudor.ambarus@linaro.org/

Feel free to include them in your set if you're going to respin. Or not,
if you don't want to tie your head with cleanup patches. I can respin
them on top of yours later on.

