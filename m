Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD632C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 14:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rww57mlubvtdeeYsi/V5z+WJ/fnA69/dGryxrqrN8Ps=; b=fEf5LmNtfnSA+kqyEFcHMHgCr0
	rPwi4Tqsgeq3ogIwR8+dUE/IuTDnjHjqZWX2IezvcJli10vvVOkohfYEHc/coSPn4RLI1Zbz8BWf1
	mXlnTrhxGBYoMJ5EXIGlAohyleu87j/YGPXrrnSgPg3995SCWjco6V7hmhbfSxibfyke6Eu2/9ONl
	khJIc/ScS8mpH4OLoU8SM22ZHILvqm41EDW6OAbHMuu7iCTfkT+Nh9cDl8tFQ1ZphNeqg6ZljBRRL
	OmyHGifsl63bdykQEKP0yCA9u4auNEVtWxHfPZxUhf5OBsmkePhizKwYQECNOy0vbpP0GbzcNRUWb
	todAIs+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkNY-0000000G6Pz-1i6a;
	Wed, 21 May 2025 14:25:08 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHk4G-0000000G2c3-0aCa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 14:05:13 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-442f9043f56so38938255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 07:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747836310; x=1748441110; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rww57mlubvtdeeYsi/V5z+WJ/fnA69/dGryxrqrN8Ps=;
        b=A3LIgYKoxEcAgljnr0V2/M496xvhTOwt9OsyrcxqXd2Dj3Q/9BV/Gny6fGDQl7bAUk
         TdeL8vgVJTJC7Al+moQpQ7FzsvSB+x2ikkKZso10QTETPQQidIu0O13dOD556esmGGMn
         RGvt/gSktsEMdfTYC5oDgXf20/KrKvTQWrSjCk9Ny8BRvlcHf25jhAPegRb2kSzWr84t
         ubfxn9JtZz/uVN3ZN8XUriuT/iouj5ezwxB37+TaU1qOVIhZDl53qEIsRHpqG4xEXFdu
         47dszh3eJF+0dAlMSCpEteUee5uxkqT8BMV9Qw9+WqTCvOmxoxzoABliFTCPffTNTbE+
         tAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836310; x=1748441110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rww57mlubvtdeeYsi/V5z+WJ/fnA69/dGryxrqrN8Ps=;
        b=wTSCxDnFj2Xw/nzr+X7D5VckebURK0fp7/kPWrNBnctKD4fOXQe6dOXVTlFpgho9nL
         M0DuQFnTpGvqSsenAKga8i+NjljYEJtnIUKgqUzXJLtyXpzjm+ZgoANrg3tpbw7bHYxZ
         SjHdbPkZLPW1XY8dMeEE3ysCY21q2NUqVuH+1g9IlSrCTCICW2wv+5EnTPdsNTF2jXnF
         TfEhdWZoy9B7EzbpJSxSFIeKIF0YLjPU73SIg1wdV5Sn+RliSOfItUQiilsA/4+1t7iF
         iDYMCmhWVEDi62L6ekOJ3WK1UJMo4zULZTtKYbXq48S1EsljjVLlDwCAl2V2i1xbtZWl
         hjQA==
X-Forwarded-Encrypted: i=1; AJvYcCX2CO6470mR4B2eMlCgpFwEsALQx14JIz5ATg7hpxrTETzhmSQegbBy7JhNMOsSeZnS6RJeeBFU8neXqjkln5Rv@lists.infradead.org
X-Gm-Message-State: AOJu0YwIRWvIBpTdwKNFXDPXbqOGM9zkq+Cp0lz+6np5knUV4fq1O/3O
	tJFhArVEhQb/WkZBvghUGhZz/gmzGut9RhsFueum/pem9hTcmfEicvLgTroQ5+xaoj4=
X-Gm-Gg: ASbGncuH7oxtcuD2H7+K2xhoLV9YV+9tNGRFLpHw9ewm+jCNUKAeTo877ZuMnnPnyGM
	jMEDNei8djScJHjEFYDLSTHqXEHXrHNP/I8pumDyGcmKKikN5ZtQ0eMSykP0JOIynuwqHiWIjV2
	7itf31DHQbJ3LiBh8NDVpHPtIRgCHjlxqOGaF25bG4/p9GaRvPv3UcHWPutWpMo+LtoarEGqnaS
	pUgNA6Z2bNa181xYQsg5wdXlL9RQXmkUiKtdc8PN4XbfUKgG0/HqmQ5WO9oitUOGxpPsBg/c6F2
	nyl8HeqK8pur9fE4ZllIIcMztCGbjQUvBDMZ8IkckmWKhVwY/qUEcb3G
X-Google-Smtp-Source: AGHT+IEhO6m6M9YiDETIrH4hAOKT3SSy+/T07XPcXoqmSRVYMiVL6aVDIILf6rgW73lHFGyhOQgTjg==
X-Received: by 2002:a05:600c:8708:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-442fd60b92bmr228369365e9.2.1747836309852;
        Wed, 21 May 2025 07:05:09 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a03fsm19576583f8f.22.2025.05.21.07.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 07:05:08 -0700 (PDT)
Message-ID: <bbd6fb9d-72eb-468a-bae5-7e4f9fedbc1b@linaro.org>
Date: Wed, 21 May 2025 15:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] coresight: etm4x: Refactor trace filter
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20250521125406.2594620-1-leo.yan@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250521125406.2594620-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_070512_204836_8F5FDF91 
X-CRM114-Status: GOOD (  13.41  )
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



On 21/05/2025 1:54 pm, Leo Yan wrote:
> This series is minor refactoring for trace filter and comes from the
> previous patch set [1].
> 
> The first patch introduces a new helper has_feat_trf() for detecing if
> FEAT_TRF is implemented. This is more readable.
> 
> The second patch refactors the ts_source_show() function.  It simplifies
> to directly return the TS value when FEAT_TRF is implemented.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20250519174945.2245271-1-leo.yan@arm.com/
> 
> Changes from v2:
> - Added the has_feat_trf() helper for more readable (James Clark)
> 
> 
> Leo Yan (2):
>    coresight: etm4x: Introduce has_feat_trf() helper
>    coresight: etm4x: Refactor returning TS field
> 
>   drivers/hwtracing/coresight/coresight-etm4x-core.c  |  8 ++++----
>   drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 18 +++---------------
>   drivers/hwtracing/coresight/coresight-etm4x.h       |  9 +++++++++
>   3 files changed, 16 insertions(+), 19 deletions(-)
> 

Reviewed-by: James Clark <james.clark@linaro.org>


