Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6407CE6E80F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 11:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrhNkAcR4O9t+aOkubVrk5pFhzyBj02L09FZbkYaGZk=; b=pLrcgUz47UVmUOjBUgOSW8y5Q6
	i5qY4610SOvJ8tv8UF1MfOjNc7DimlpbXb9OaLcWwX2zFSZCcvoRlgoDheXvjle0yRynC2gAB7udS
	bNAQocXYxzqp0oZl2hREUgvB0ZGeL07WuxYtf+aYWH4L+P/g1RN8Q+m/Q1xW4uz/r2KAZt32BrT2k
	MlZGmFb+5kQjIxNcNRfyjf+aCRCqOxlto75tVf8tEIBwG3dOFt4+ufSsGgTNbXCaiKViNo/i6eqh1
	xHYm+IloHq2jgPGUm1S3bRwIZ/+AOtxxMyhfRIn5x9zLLQjJhvCNQlD7xeoK1lHLYmQoDJ94k3Dgw
	da523Crw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnEO1-00000006WlC-0wBF;
	Tue, 03 Feb 2026 11:16:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnENy-00000006Wkp-39iG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 11:15:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42fb2314f52so3218863f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 03:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770117357; x=1770722157; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VrhNkAcR4O9t+aOkubVrk5pFhzyBj02L09FZbkYaGZk=;
        b=PJoD/4ry1ZLdXTueY2BB+Yj69ee11SO9nN6SNcdv98OjZo0eEPMv/1zfa1XjeYkFR4
         T+OzaDKRuci9vEhFNWBA3tg0HYiZECDcc6lGtCCgTMSv3qa50YfXeZc/pUiDx8WVj618
         UmlR4znyT2YbXEgv1Mme9A7iXTA0R+QWAJ1MAZjsgjR7COmqkzas5eVG6LteJi6CGgZ7
         hqbFchuGQOW1+UY4gzFzYHKzNfqIK0GO1lHIE5Pb2g1745aCKNLxBZZDPA33Nf1bjKJ8
         5uournesY5O3ftGf+kd/GPulzT2qL7kpJYPQODb7wGHjFK1G8gvykzKj3tqSdV2MzSgd
         HpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770117357; x=1770722157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrhNkAcR4O9t+aOkubVrk5pFhzyBj02L09FZbkYaGZk=;
        b=efK2BXISPflv3i5IoRrc5je/QtFFIopj5BvfeX1u3km0zCQTNdQ/n2ysMzSOkFYDOO
         LARZDD4D7QKDhPxB6j4Bjtm6+4/SPJwwgop4oTIa0f6n/1+Tcmiwesgm7LWIyZHmRtSQ
         ptJZWX7wtMOtYGh+u4MLYElQ8stINObYbtU4mF/aW6vTpJ1AHhwS11t6LLDT3Mazo6On
         3L57JhL+qc6BvU6n5sKd8A5trxjUAQN9gfkJO7VY2bxtzMdk8/0uin5VbrdbEgy2+TqU
         xzKpAhDKagJ1Ryg3qapeBk9yBW7w+4rQmKsv+XAAhsgne9tRgmbdDRN1j8Y4MaWjMuGE
         Dc3w==
X-Forwarded-Encrypted: i=1; AJvYcCVfmFwJPF2fV+XSSvGsprIyxhDGbk5jEVCRiRewWEvkCXFrJZCr4Db1HtviR44TbmzO6ztS2Vvov5S11sEkvu+O@lists.infradead.org
X-Gm-Message-State: AOJu0YwanHY235Ex2fS02iQoE73TKTUjHsHfmjXndwI04pqbS369nsIq
	6PcjhSFiO6fFlySWVYCo49vCa0EKsVWl2TvfW/8QQR1UGyMjClaJuLNClrKNezWt728=
X-Gm-Gg: AZuq6aIiIraRnz9QEApcF/CgPEx+h8Rq/ZTymuLmV8I9GX5tp+MgajuZtL/zZsKQYPp
	PnALBqFE4LXF5xIIJc7avy4/cS6+/M4koSJjcmLO56yrElTuopSmEX38Q3McDsxZQfUct+zlchN
	BIXAqwhX3cn6R7gOdOMDpF32hOzxEnSHcS63MpikoRI8cXjZAvvSy4yxe8sSOV6j5l46l140BJ9
	75Xkoztc7jhUs3G4V4E+Zfvtk4GggLXrQsu/bpQMosRvjVhh47d7uyXYXHjf/4jH7WeL3e2gaLo
	rf7CANR7k8k5Bd/vzkN62dwKNGJejRVFXCp399GCVk0BU6BfNMzwmmev4jCLLUvwErjmjRO16xD
	RKC+bTDBXJ27xV8LqaM+STYKo2hRIdNBcQEOj7NpB5E+vwuMGHV9XGHuy2Z5ZhF01svxcvLOOjh
	axqgSwGYPx1WjK9ocZ
X-Received: by 2002:a05:600c:1d8c:b0:47b:deb9:15fb with SMTP id 5b1f17b1804b1-482db4970e2mr191238095e9.33.1770117356881;
        Tue, 03 Feb 2026 03:15:56 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2e3bf18sm121781685e9.19.2026.02.03.03.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 03:15:56 -0800 (PST)
Message-ID: <e451547b-15a7-4296-a5da-379640c141c7@linaro.org>
Date: Tue, 3 Feb 2026 11:15:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] coresight: Unify error handling in
 coresight_register()
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mao Jinlong <quic_jinlmao@quicinc.com>
References: <20260202-arm_coresight_refactor_dev_register-v3-0-03292470c48c@arm.com>
 <20260202-arm_coresight_refactor_dev_register-v3-8-03292470c48c@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260202-arm_coresight_refactor_dev_register-v3-8-03292470c48c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_031558_837670_9BB7C456 
X-CRM114-Status: GOOD (  23.89  )
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



On 02/02/2026 9:34 am, Leo Yan wrote:
> Unify error handling during registration:
> 
> 1) Failures before device registration are handled by err_out, which
>     releases platform data.
> 
> 2) Jump to the out_unlock label on failures after device registration
>     to unwind the flow via coresight_unregister().
> 
> The "registered" variable is no longer used, remove it.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 955af43010446803030973c72f07315492b2fcf3..65cf975493c86de42515845147d90497aa20c595 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1326,7 +1326,6 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   {
>   	int ret;
>   	struct coresight_device *csdev;
> -	bool registered = false;
>   
>   	csdev = kzalloc(sizeof(*csdev), GFP_KERNEL);
>   	if (!csdev) {
> @@ -1380,7 +1379,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   		 * All resources are free'd explicitly via
>   		 * coresight_device_release(), triggered from put_device().
>   		 */
> -		goto out_unlock;
> +		mutex_unlock(&coresight_mutex);
> +		goto err_out;

I'm not sure if replacing the "registered" system with extra calls to 
unlock is necessarily better. I think the whole point of out_unlock was 
to have a single call to unlock so it couldn't be forgotten or didn't 
need to be duplicated.

Probably a better way to clean this up would be to pull out a function 
for all the stuff that needs to be locked and use guard(). Then do the 
stuff that doesn't need to be locked after that function. Either way it 
doesn't look wrong.

>   	}
>   
>   	ret = etm_perf_add_symlink_sink(csdev);
> @@ -1390,12 +1390,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   	 * coresight_device_release() triggered from put_device(), which is in
>   	 * turn called from function device_unregister().
>   	 */
> -	if (ret && ret != -EOPNOTSUPP) {
> -		device_unregister(&csdev->dev);
> +	if (ret && ret != -EOPNOTSUPP)
>   		goto out_unlock;
> -	}
> -	/* Device is now registered */
> -	registered = true;
>   
>   	ret = coresight_create_conns_sysfs_group(csdev);
>   	if (ret)
> @@ -1415,11 +1411,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   out_unlock:
>   	mutex_unlock(&coresight_mutex);
>   
> -	/* Unregister the device if needed */
> -	if (registered) {
> -		coresight_unregister(csdev);
> -		return ERR_PTR(ret);
> -	}
> +	coresight_unregister(csdev);
> +	return ERR_PTR(ret);
>   
>   err_out:
>   	coresight_release_platform_data(desc->dev, desc->pdata);
> 


