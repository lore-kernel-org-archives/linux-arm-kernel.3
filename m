Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC0DD7877B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYaD+vIxRvyp4MCsUv1xsGtNN9FeP7FHLUrmhzNgycg=; b=mIGcQPydsbx2EESyvLYvg6YuIW
	k9TdwbTtsUPiukamYRd8aPpK4pQfh1V7zKI+jfcngL0q4QiPGza9omb/77DQm3euzjQwmSfrLo+5w
	iIiD+PzFVVLQ+yZCT7HfPvGu7lovAiHzf/aCW26orWgG8w3iq2p4QTjQkFn8BZAokM7Kl4RvMfuHJ
	InC6w9lR4Z5AXZKVi0Wfh7qjYKwl5FbmmIwXIJl558286KnjNxXC5l9nM83iSrJBarW4K5DeYWudr
	z4BdCfhU6sDskOkU09lFP3aiX5ty65z0fsWqEqMWUHqafQyLm85vFAzoKC0aQZlXu6qtr8x72hOTT
	iJkRRrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE8wc-00000000Jar-2F7C;
	Thu, 21 Nov 2024 15:18:10 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE8vf-00000000JUT-3mhy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 15:17:13 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ff5d2b8f0eso9173671fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 07:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732202230; x=1732807030; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LYaD+vIxRvyp4MCsUv1xsGtNN9FeP7FHLUrmhzNgycg=;
        b=fS5FcbMZu8hqBnAeArSIYDCw1qUapEy2m8a/G2I/rAbJfVSZ4w0gecNp5x2vf6nojq
         W+FKWAYpCzURfBcJT00LwffVWJpj536qLgSmBOd52a5L1QFITlnzsmziNAdGF4exQac6
         uPYLVgVUrz0GBQjRcGda0T7DLJfwL5vErdHyT+AsUkERmzlDlEIuBbZFC0l00eVJd3K1
         eAoJFxu6HeRS0CsLk9vK9RZTwRhfeDRe/Jj9zGyChbp9ZaCOZlq+mASZwaCd6UMfUNEp
         ADvBaw1no+uGB/2V1/OCXFQBWOw1F7HZvurLsp8aJWNv7aFWu43IkmXBMS2fbvLDrCRu
         9sJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732202230; x=1732807030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYaD+vIxRvyp4MCsUv1xsGtNN9FeP7FHLUrmhzNgycg=;
        b=jBvwVsgrwdELDmDWkADeStY7N5ecG9JKzyW3eU9JKJ3D14zLjKcD+adePe8PWVHO3C
         SdiaBF3EwLSzthVZt3t28/CEs1oszRg4oYW4RagXrMIrL/n2RmtOQAqzGOSMAifRNvRW
         ZApvFJBbaQMNBO1GDo6RSWxFd8guWsTOIPd40j35XEzp1kfYSzwuMROyzQuhOLD93vGe
         iLoulq0LcQtQNW29U2SCckaZp1xoyWW7f8jX5iDZ+xLYkekyLHdMBSYAw1iGJO23s7+j
         t2Jptep0NAyhArmlxtH07Df/bUenSbelSaRQOiRxtreFztrhp/bMJqrUDEA6/YU2776Y
         lpug==
X-Forwarded-Encrypted: i=1; AJvYcCVpl8RrWNUz6Aev5/hrOeMHBGiEzL9z6A1kLhqXBop1LbzpjCZSJHD8hIOhapd2jXcvQPMvjiwPkNvUcH7Bm+kt@lists.infradead.org
X-Gm-Message-State: AOJu0YxfLNg2FhlmoCjgatF3LRPFsNbfZ+3bYwXdASCEGJ01/hLgdpUQ
	tf8JRddve6/6daeA132GQtuciK3spqWw+ItBifqmWNfTGK6j45xl7mfp2Y+L4q8=
X-Gm-Gg: ASbGncvfNjFbykLO5DTfc3VCO/0Sf/pzGB7Aa1PGffY4AhBdmjXv1f4g7rxAS8RfX8w
	bcNw4wE7KRMhiwXl4Kh33+NmHvSACI9pvG+iyT6wbM6g3ix8a8Pd4lJLRhxJa7yMNYAERIVXbt9
	ZBFcGY0BGciwvDoiHe/GWUbAdW1J8HJ2T7qk2eOdGnuBjV/oj1VjfPGhuGJeMLtPIiNrqMBQzI+
	fqkkIk8Ey8OKMToZ2RBxe4Qh2uU15mUG6LYy8I2zuNdNHa0bKIJFEsFoBCm
X-Google-Smtp-Source: AGHT+IGuGkDWEGa66FRHfJwCBFniq/w48rL31cV/pcGtRhPh4zpF/rbVtHIdfpipVfcQosiMjkCEvQ==
X-Received: by 2002:a05:651c:4017:b0:2fb:382e:410b with SMTP id 38308e7fff4ca-2ff8dcc9c22mr36130851fa.32.1732202229431;
        Thu, 21 Nov 2024 07:17:09 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cff453e2f8sm1962653a12.68.2024.11.21.07.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 07:17:08 -0800 (PST)
Message-ID: <55469393-551f-4ad6-ae03-56306e474f58@linaro.org>
Date: Thu, 21 Nov 2024 15:17:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Fix dsb_mode_store() unsigned val is never
 less than zero
To: Pei Xiao <xiaopei01@kylinos.cn>, suzuki.poulose@arm.com
Cc: kernel test robot <lkp@intel.com>, mike.leach@linaro.org,
 alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <202410150702.UaZ7kvet-lkp@intel.com>
 <122503017ada249fbf12be3fa4ee6ccb8f8c78cc.1732156624.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <122503017ada249fbf12be3fa4ee6ccb8f8c78cc.1732156624.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_071711_966194_2BBD7E29 
X-CRM114-Status: GOOD (  12.96  )
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



On 21/11/2024 2:40 am, Pei Xiao wrote:
> dsb_mode_store() warn: unsigned 'val' is never less than zero.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410150702.UaZ7kvet-lkp@intel.com/
> Fixes: 018e43ad1eee ("coresight-tpdm: Add node to set dsb programming mode")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>   drivers/hwtracing/coresight/coresight-tpdm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index b7d99e91ab84..158950243d83 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -640,8 +640,7 @@ static ssize_t dsb_mode_store(struct device *dev,
>   	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	unsigned long val;
>   
> -	if ((kstrtoul(buf, 0, &val)) || (val < 0) ||
> -			(val & ~TPDM_DSB_MODE_MASK))
> +	if ((kstrtoul(buf, 0, &val)) || (val & ~TPDM_DSB_MODE_MASK))
>   		return -EINVAL;
>   
>   	spin_lock(&drvdata->spinlock);

Reviewed-by: James Clark <james.clark@linaro.org>


