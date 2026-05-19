Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3128CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5zxrJzhz4zdnbyw+j6OnckVHPyDpmxi7LLakKPc0g0=; b=sbdwEFmmgY6/2GkBlpIuwjUI1W
	ha2+j+DjyFlo65fjZ+B6mv5c00cBlFbxDXPGRhHzPC2K6vxzSKPoIcQstFOxb5oxaB+4I/PsF6WoG
	WxKf42AUnjOn5Ybtuc1BMS1nhNhmFm1hxeLgYBK8sAqdMKIKgDn8GgscxvRg+dSVc0imWK+dlDMrO
	lwGdjK4OpD+zREJHHF9nSlqQWL+CWopKf78C+Ccl9jsRFU3gwAHfiIBt6gWQ121gRM6mtNLQ32Nw7
	YzuYvRIan4gNRm38qZcDoNBMmt9fqXYmqAh9Kg1Gfa6maCvWMnC/71JbUFa91Lr3V76qMbUjN69RF
	bJI4xfnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJq6-00000001Wk0-2hoV;
	Tue, 19 May 2026 12:46:28 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJq0-00000001Wh2-3WZk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:46:24 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso1832883f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 05:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779194778; x=1779799578; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5zxrJzhz4zdnbyw+j6OnckVHPyDpmxi7LLakKPc0g0=;
        b=X+1BZNhjLDKfTLFS9kzA1iShoD0MyZv3JVD8maxgMfsYV87MwDInf8OyOkbnLamI8E
         +txGCT7UuRDtHHGcA0rAYlSAUm27QWaho7t1/jKch/DQmzYEBzDTctPT2cE7B2t/ovcj
         98IDslfnkGps2SPM6RFZVk1DJ+IbOqW/uLKfUmJM5JR4HAscmiorGYUQuIe/rw/Yhh7f
         WZljQRFhKsdN1XDCRToVb1+p3meONxX5pROG66eZTSXI1BJULN4opNXKnXI2g27Q2Gti
         rliPjc3uEzNqP2ypdk2U5O7LveMtcGlJ77FUFSKuvHejxQEts4FY/POBF8x3ToccvSQE
         sRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779194778; x=1779799578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5zxrJzhz4zdnbyw+j6OnckVHPyDpmxi7LLakKPc0g0=;
        b=Z0R5z0b725x509q2hZHdlRTx3bIJuEUspxzcEdQGV/FE7/WDtce10SLruCYjt/iIif
         WNHSxJGEMaikR5GwFSKCJSWGXIVrUg1WiT2xp8hD0NBjhoWfvMf4ADu5OcTqhm726xoa
         okl8lDecFjCd9jTOS46l1wOOYoVLOYthja6dYUuECilWSatIBtSP9iv1OighrGLYJj48
         V+MEfrNo/Covh9wfii3WOFu0M9lQ09h2xyI1J7Syqt8r38EIBOQGVDlEKC1fTMAChABA
         KAX3h9pvcusUGjL5jw/EWNfUnpnQnk53K/6MvCcoE92WmPvGSz1VPWZP5sxcl/3lZ+7q
         MygQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ejB9JPhWSTfhWN6pr7wRdZ6+GFLlLVLa/2jqFWW5ZKHCq8YK9eJ8bSCnUkZVYFijMRKEY0iJVqKtXW32FK1VB@lists.infradead.org
X-Gm-Message-State: AOJu0YyXe4sOebJAfvRjNaf9IgFg8GcuXKygADvji94VJb9ShJ1Ksrbw
	L5Jto6ZafESN8oTVbsGa3YxezgRuvmfGOZbzd0Q4b46eIthx9Ej+pkIfCeyEOxG7r1I=
X-Gm-Gg: Acq92OFOrqvBASFTEZxifCLo05SJWAsmUFQgfZsNpp1W1TcCCRG7XUlFgg7p6W9Iggc
	QGuMNzaEmzctjyyOi9vOtBu3m4r5H3H3sjWUXw4Rp1IAaI6Lz+De7xxxASUlQVdGn+c5Jqkln/k
	Kmb5/x/Ai5Exjku99Rd73CfjDmEMOy2Ea+zkkoxIvgzEtINb7S1su+/1d6c0u+ZsXsHyEJbe8Cs
	rVbbu08AsM+rstVa/FYbkEi7W4bgdXR65DsC50UniwMtdBIM6EqSERyIYCzvACWjl+D6MS0Z5wP
	jj8R3HWVvyphQBVGob/7bwajoDkAT8s3WssBdXQ3s6uBCYAi/PkWtrxThrFau7dANAnb5AkxNJd
	4CuLf7lY8wWzDGpzNXJvKwD+w+68BF6gGKo1ZMSscf2UJFc6J5gwE9084+uJFoTdOVVyuvp3EGL
	rv80wBMakp1p/PE5JHMd+OWk1ouV4DErSYwPOgYMA=
X-Received: by 2002:a5d:49d2:0:b0:45e:739b:3e3b with SMTP id ffacd0b85a97d-45e739b3ed0mr14584891f8f.0.1779194778350;
        Tue, 19 May 2026 05:46:18 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13a7sm47525460f8f.29.2026.05.19.05.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 05:46:17 -0700 (PDT)
Message-ID: <6925146f-7250-40be-908d-9a210472654f@linaro.org>
Date: Tue, 19 May 2026 13:46:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: platform: defer connection counter increment
 until alloc succeeds
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260511-fix-ref-count-issue-v1-1-99d647810d3c@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260511-fix-ref-count-issue-v1-1-99d647810d3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_054620_916402_B471E292 
X-CRM114-Status: GOOD (  19.62  )
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



On 11/05/2026 5:19 am, Jie Gan wrote:
> coresight_add_out_conn() increments nr_outconns before calling
> devm_krealloc_array() and again before devm_kmalloc(). If either
> allocation fails, the counter is already bumped while the corresponding
> array entry is NULL or uninitialized garbage.
> 
> coresight_add_in_conn() has the same problem with nr_inconns and
> devm_krealloc_array().
> 
> In both cases the probe returns -ENOMEM, which causes
> coresight_get_platform_data() to call coresight_release_platform_data()
> for cleanup. That function iterates up to nr_outconns (or nr_inconns)
> entries and dereferences each pointer unconditionally, hitting the NULL
> or garbage entry and panicking instead of failing gracefully.
> 
> Fix by moving the counter increments to after all allocations succeed,
> so the struct is always consistent on any error path.
> 
> Fixes: 3d4ff657e454 ("coresight: Dynamically add connections")
> Fixes: e3f4e68797a9 ("coresight: Store in-connections as well as out-connections")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   drivers/hwtracing/coresight/coresight-platform.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index e337b6e2bf32..93c2d075cad6 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -45,9 +45,8 @@ coresight_add_out_conn(struct device *dev,
>   		}
>   	}
>   
> -	pdata->nr_outconns++;
>   	pdata->out_conns =
> -		devm_krealloc_array(dev, pdata->out_conns, pdata->nr_outconns,
> +		devm_krealloc_array(dev, pdata->out_conns, pdata->nr_outconns + 1,
>   				    sizeof(*pdata->out_conns), GFP_KERNEL);
>   	if (!pdata->out_conns)
>   		return ERR_PTR(-ENOMEM);
> @@ -63,7 +62,8 @@ coresight_add_out_conn(struct device *dev,
>   	 * used right away.
>   	 */
>   	*conn = *new_conn;
> -	pdata->out_conns[pdata->nr_outconns - 1] = conn;
> +	pdata->out_conns[pdata->nr_outconns] = conn;
> +	pdata->nr_outconns++;
>   	return conn;
>   }
>   EXPORT_SYMBOL_GPL(coresight_add_out_conn);
> @@ -86,13 +86,13 @@ int coresight_add_in_conn(struct coresight_connection *out_conn)
>   			return 0;
>   		}
>   
> -	pdata->nr_inconns++;
>   	pdata->in_conns =
> -		devm_krealloc_array(dev, pdata->in_conns, pdata->nr_inconns,
> +		devm_krealloc_array(dev, pdata->in_conns, pdata->nr_inconns + 1,
>   				    sizeof(*pdata->in_conns), GFP_KERNEL);
>   	if (!pdata->in_conns)
>   		return -ENOMEM;
> -	pdata->in_conns[pdata->nr_inconns - 1] = out_conn;
> +	pdata->in_conns[pdata->nr_inconns] = out_conn;
> +	pdata->nr_inconns++;
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(coresight_add_in_conn);
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260511-fix-ref-count-issue-7c44ce39700f
> 
> Best regards,


