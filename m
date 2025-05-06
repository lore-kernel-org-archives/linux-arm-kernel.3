Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F0DC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 10:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+WrS+ZGF7ajKhUyNAGyOnZkGrNQsEpRwCZdg328c+s=; b=eeEsBG9GaI+6gnBGiMebq8pHBK
	VWimdlPtb6vpe9Vx3AVS2rrYhf+L/jPfCFLJdxExYgvuH+dtP3p9ey1S1BXaPuO5XDBqkIMLvcTjf
	5f9oEgzcNLeRxkKQU25EGe26qSLtuS5rlKkNK4n3Y9D5zL07UEOdUs7N3uuCQj950Vn8vTv2KKyUV
	QasfNmrIqLWIB5wCmkFdTx/jx3Diu3T46bzKRV6DHq03k9TRFSjYbqyt5IBQnP+dXjHQCSuvy9AUU
	/gFWl6ghYZ8St08qVsO9sdKFA2gFLTD2wg7uVAh2FlNdhWdpUqiNPiPfKsiba64k7yrNomJnDQ8Wb
	kjvb7ezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFze-0000000Be1j-0Acn;
	Tue, 06 May 2025 10:57:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEaS-0000000BN7g-3JxK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:27:41 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so21039345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746523659; x=1747128459; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j+WrS+ZGF7ajKhUyNAGyOnZkGrNQsEpRwCZdg328c+s=;
        b=JPhEco1gLICM/sH3rkhC5tD2207PL59oLCLI44opBsTNRldcLAMSlYuNkkmP7D2Dmw
         ARYDps1eqCLhj1OBJLEtOPli4KKx9tWJi9tAkFhXVlDi8V/Uiv2u7SAFae7N1Lse90cJ
         l/krfSsH7k32rUVlpEWWqwds2epbTcq9TO6Dq7VSLw8XelsgrrhOMDG0qUb5Jw3YNcn9
         3CCZZVXIIKPkXCql9yutZmjMQFSVpfa41KmTKrefzvqXHppSd/2lBflNjr5GCHy78ByT
         3IiY7hYPY0MYhslGoe79FhySzEFXnmRe8QyOj6+dp88iviayjRNn41e4QwmsuJ4EocGq
         guOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523659; x=1747128459;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+WrS+ZGF7ajKhUyNAGyOnZkGrNQsEpRwCZdg328c+s=;
        b=w6cChMDA6afhBDJvNeIX0d3lgtNcR7Y4O6np3fTMQ6E+nDVIe9/lUeMzfTcnyi09OJ
         VgLizk57C99u4w7r0XXB+FOESbKsEWQV+PS9shPldR/Q5rLCcFk/dah/pSSxLAcconzU
         uMILICb4ZFdQlsfOkxO2Q8TTUH/U/+AAkHz9PCvF6fN0aqlTQGknMh4NTiazR7c028/U
         12gqpCYRkammFfcp8kvT2OX3UiKJ+fcsF4JQSbL3g/69xVvX/ym5025PXFjoedc7+Ty1
         1MlHZDJa0utSNctoXoGdTUIGyAgC83G6M4zkVJGMFZU4vLhiCNS0w7k5xfzd8jGv/imu
         Wmkg==
X-Forwarded-Encrypted: i=1; AJvYcCWFvhnx3s3HYQPOpfq9YuEnKMxQv/wFcZXwUl/7ES9MtpYctPy6o9uAlsylHfnCJ11s6AcieUEPGzjTPE4t0CNr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3YzH++CslQXtPM5F5RAPEsrAYWtFUcRsJ0mMwSZEMtlin+i+V
	U1leIGS7HlecEnFITPqam8oFTfeS8o7EztkpXq/VjP7OVLHIH9U6d1OAn8MPtlU=
X-Gm-Gg: ASbGnctJt/C8gsAb1SrhEOo3CGimlcR8sNNxRv07AlhRzJMWrjOFDjjW6ENf73INFD4
	nyAe5gpP6o6NfJWC7ODgceWB2wiocQ9AOaMPddidkR9YOA85An+N0VsCcPtXQmO0IKa5NJlQ6Ly
	w/p0E3o9p/KvGgyjjR3SSAG+FaJP6nC8Yc0+jWK+08VoPqBScQgG7KG/F83Nce4MnkKTITbhEgO
	dgbsgqrn98cN4aQaZoLgU8ZOFIeAZjfh0QK1SxdAiicNLV3MI9bJtFolchp10xuarARrRc9yPIR
	TBq+aD/kFH7uGY/Q56GSuaf2jsgw0gkBXvKJ2qhLFw8=
X-Google-Smtp-Source: AGHT+IG5XXvRCx9XeVrs9fzQmCZyz79wKWVTD/0n1rorDH8LiUb2mKCXxid8ZfYYsDBB7YNr/KB5yg==
X-Received: by 2002:a05:600c:a409:b0:43b:cd0d:9466 with SMTP id 5b1f17b1804b1-441d0a909b9mr19936035e9.9.1746523658914;
        Tue, 06 May 2025 02:27:38 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc441sm165112065e9.3.2025.05.06.02.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 02:27:38 -0700 (PDT)
Message-ID: <6f9346a0-03c5-4b00-85f9-0d54e24d0657@linaro.org>
Date: Tue, 6 May 2025 10:27:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: replicator: Fix panic for clearing claim tag
To: Leo Yan <leo.yan@arm.com>
References: <20250502111108.2726217-1-leo.yan@arm.com>
Content-Language: en-US
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250502111108.2726217-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_022740_844531_054A180B 
X-CRM114-Status: GOOD (  16.88  )
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



On 02/05/2025 12:11 pm, Leo Yan wrote:
> On platforms with a static replicator, a kernel panic occurs during boot:
> 
>    [    4.999406]  replicator_probe+0x1f8/0x360
>    [    5.003455]  replicator_platform_probe+0x64/0xd8
>    [    5.008115]  platform_probe+0x70/0xf0
>    [    5.011812]  really_probe+0xc4/0x2a8
>    [    5.015417]  __driver_probe_device+0x80/0x140
>    [    5.019813]  driver_probe_device+0xe4/0x170
>    [    5.024032]  __driver_attach+0x9c/0x1b0
>    [    5.027900]  bus_for_each_dev+0x7c/0xe8
>    [    5.031769]  driver_attach+0x2c/0x40
>    [    5.035373]  bus_add_driver+0xec/0x218
>    [    5.039154]  driver_register+0x68/0x138
>    [    5.043023]  __platform_driver_register+0x2c/0x40
>    [    5.047771]  coresight_init_driver+0x4c/0xe0
>    [    5.052079]  replicator_init+0x30/0x48
>    [    5.055865]  do_one_initcall+0x4c/0x280
>    [    5.059736]  kernel_init_freeable+0x1ec/0x3c8
>    [    5.064134]  kernel_init+0x28/0x1f0
>    [    5.067655]  ret_from_fork+0x10/0x20
> 
> A static replicator doesn't have registers, so accessing the claim
> register results in a NULL pointer deference.  Fixes the issue by
> accessing the claim registers only after the I/O resource has been
> successfully mapped.
> 
> Fixes: 6f4c6f70575f ("coresight: Clear self hosted claim tag on probe")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-replicator.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index f1d2f764e898..06efd2b01a0f 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -262,6 +262,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
>   		drvdata->base = base;
>   		desc.groups = replicator_groups;
>   		desc.access = CSDEV_ACCESS_IOMEM(base);
> +		coresight_clear_self_claim_tag(&desc.access);
>   	}
>   
>   	if (fwnode_property_present(dev_fwnode(dev),
> @@ -284,7 +285,6 @@ static int replicator_probe(struct device *dev, struct resource *res)
>   	desc.pdata = dev->platform_data;
>   	desc.dev = dev;
>   
> -	coresight_clear_self_claim_tag(&desc.access);
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev)) {
>   		ret = PTR_ERR(drvdata->csdev);

Oops. The other occurrence of this is the funnel, but I got that one right.

Reviewed-by: James Clark <james.clark@linaro.org>


