Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88653CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2fM9ol8hAiy4stpUXQgtrARblvZh+AB07aRFiK3NSk=; b=f+unsjefICVA8uvgNLWxSBdVXQ
	MsXM7XTjd+BgoHdL7fNGd+x2AFa1+eG6BdRk5vXacjCyBIxFI49oy50irT4PU9Zkjqd+8WJXHQ6fZ
	Nj/Nx5E+zWhHDkylSngQL90csCXBrH+VL6G6OJ6yv4Gcw2mwqwhdLRvL5hBNTcZsiy7+pbPQ6X5qv
	loECPpNIhQzuEeQ2UA813kciwYMdhwZM5lhtp8AaC8BaGSjyafjtnfQtbmnSP3GO096sjTN0tOkey
	j2zFiFtk+5KHxylI02Sp0OnUVyVCpV5OUQYQ04Xf9bFnTd4cr/f41jfWSB9qMskd730puyZzrHSIB
	VKbNrr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKxR-00000001k50-3w01;
	Tue, 19 May 2026 13:58:05 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKxN-00000001k3M-2tfr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:58:03 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-67f94c078e8so6320636a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779199080; x=1779803880; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2fM9ol8hAiy4stpUXQgtrARblvZh+AB07aRFiK3NSk=;
        b=hFPpikJbjIaifvO1hoN1Kn6KjSoPRej49WI3nWI1ZjVMbMpPsPipzS9ede5EUmimkd
         pllO0dUggjLoqCO42dLNBumOZTOSVGZvSrnI/+E+mB+sseKvUhO6r2anEwMJHz3MLxGz
         ycAIvnScu9KPrOUsmFkeW87ipEUB//8aYuXYXxfZQl+CkcfR3YRbmPMeDMjVipCzaE8d
         4jXNwahyxXp4Y7NojZcySnMFaqJxRqTjUxBgSbHkQHKjpkcwVRg1tAA764xpySgr1yVO
         WsQRUVf37dmVyog2wC9zYTsbKqDt9oJlq5d6gB3TAi833Q708UrmEpo5NuSP2zuxKrz5
         Z21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199080; x=1779803880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2fM9ol8hAiy4stpUXQgtrARblvZh+AB07aRFiK3NSk=;
        b=Syl/KIRMbcAeOcmZyfgZmW2drNX5l06i+uB5Y5Go8mKd5UaS8Pajhyv35g2BXnwIbR
         /Of6yP3LeyMGK1MOKCn8Dic3pl2ik60lcAGYINWjK4qI6YV/DXpZAaWEoOfGhkrIbpo3
         qO95n0Z49nqINbSwYMNxcTKh+VLdShKDytxO++wu9qqzLXoKXUj8WY/XLQAlf5y7EDjV
         7QLhHde5AYKJf0I/MtnSSw4JGb4pM3IJy5OzEhQAcDCTjoOs/HBw+Is7vuO7DxXjByXX
         fnX/9YY/pLF4Cv9Z5G5GFuA7E90EnPj6BCFgOdS6OK5KDPiKIg6QJpElifdU2pf87660
         zmyg==
X-Forwarded-Encrypted: i=1; AFNElJ+1zqklP3i5XkANkT1B5uV4wkg6bkRt90GMlZaQGVRd5LQAq+jeWMOUG+IjrCUyr3U4k9CgD7H9ZFA+F13DEcb2@lists.infradead.org
X-Gm-Message-State: AOJu0YzpX0qw2YdjKep4aJ3HbIRAR8KRH5JOy3vpBMQAa2DJtToQNeL7
	LS3YimKo4uGnimieY9gpcIFYFvNLquzoJslNJHRKq0ohyllFJXeEDNSITUb5n4E0A7c=
X-Gm-Gg: Acq92OFn3wlMbrwSc5Ti4KuXMnbkf7bfsg07Y4Q2IAE67xl7k3u1J8mqrOAtSHsrelA
	vSrY9u9+yBKfKclh3cK/eim9uZxu7ZxOMjyMgj8Chl5ItLNiiiZxqKycqUhPVIhb9HodUhQXslP
	RxGJ7wYkqJ1YXE8NZ2Pb3sgfP3PcQVJdjQdrzGSdMu5baFi0y0/xE4TuB48E98yUl18QxHWsaBH
	6KZRar2dzIm3IbvoKUxRQixhIpqXm75XcPegAnjigWZTp0/7Benh76U06NsmWQ37hBxdl5Zn8gA
	tuLR/1ipqIqQhac2SkoIcivCpMuV2ZPM4egfXmlK46gMkubQRycGCxnQaDB5jWdxnQzmyY53GVx
	8kYWlYEKwD4Wr+WsS7uuM4clGcHVDOCUXscwGJBKCtLCpPeRfDjmTZ/qacLmnr2zHex7rYynE9n
	fMo0HMOTU3OC1dEDef4EI1CZMj1Lvn41wGAaT0L6I=
X-Received: by 2002:a05:6402:3494:b0:676:d85a:66ea with SMTP id 4fb4d7f45d1cf-683bc9ace55mr11883875a12.5.1779199079640;
        Tue, 19 May 2026 06:57:59 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311879413sm6717277a12.25.2026.05.19.06.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 06:57:58 -0700 (PDT)
Message-ID: <f347bad3-4a11-4f65-b35f-f59c6360ac5b@linaro.org>
Date: Tue, 19 May 2026 14:57:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix resource leaks on path build failure
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_065801_770681_12402E63 
X-CRM114-Status: GOOD (  25.55  )
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



On 13/05/2026 2:32 am, Jie Gan wrote:
> Two related leaks when _coresight_build_path() encounters an error after
> coresight_grab_device() has already incremented the pm_runtime, module,
> and device references for a node:
> 
> 1. In _coresight_build_path(), if kzalloc_obj() for the path node fails
>     after coresight_grab_device() succeeds, coresight_drop_device() was
>     never called, permanently leaking all three references.
> 
> 2. In coresight_build_path(), on failure the partial path was freed with
>     kfree(path) instead of coresight_release_path(path).  kfree() only
>     frees the coresight_path struct itself; it does not iterate path_list
>     to call coresight_drop_device() and kfree() for each coresight_node
>     already added by deeper recursive calls, leaking both the pm_runtime,
>     module, and device references and the node memory for every element
>     on the partial path.
> 
> Fix both by adding coresight_drop_device() in the OOM unwind of
> _coresight_build_path(), and replacing kfree(path) with
> coresight_release_path(path) in coresight_build_path().
> 
> Fixes: 32b0707a4182 ("coresight: Add try_get_module() in coresight_grab_device()")
> Fixes: b3e94405941e ("coresight: associating path with session rather than tracer")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 46f247f73cf6..c1354ea8e11d 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -825,8 +825,10 @@ static int _coresight_build_path(struct coresight_device *csdev,
>   		return ret;
>   
>   	node = kzalloc_obj(struct coresight_node);
> -	if (!node)
> +	if (!node) {
> +		coresight_drop_device(csdev);
>   		return -ENOMEM;
> +	}
>   
>   	node->csdev = csdev;
>   	list_add(&node->link, &path->path_list);
> @@ -851,7 +853,7 @@ struct coresight_path *coresight_build_path(struct coresight_device *source,
>   
>   	rc = _coresight_build_path(source, source, sink, path);
>   	if (rc) {
> -		kfree(path);
> +		coresight_release_path(path);
>   		return ERR_PTR(rc);
>   	}
>   
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260513-fix-memory-leak-issue-034b4a45265e
> 
> Best regards,

Looks good to me, but sashiko is complaining: 
https://sashiko.dev/#/patchset/20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4%40oss.qualcomm.com

I'm trying to understand why it's saying that, but I think the scenario 
is that if there are multiple correct paths to a sink, when one path 
partially fails and a second path succeeds you could get a path_list 
with some garbage entries in it.

That's kind of a different and existing issue to the one you've fixed, 
and assumes that multiple paths to one sink are possible, which I'm not 
sure is supported?

It might be as easy as breaking the loop early for any return value 
other than -ENODEV, but I'll leave it to you to decide whether to do 
that here or not.

Reviewed-by: James Clark <james.clark@linaro.org>


