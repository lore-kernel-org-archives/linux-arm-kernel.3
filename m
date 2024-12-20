Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5286EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWkEtC1JATIn6qXREPnlwjqS9TBnknDlIdxobBNl7k8=; b=Ro7kG37BlO7VrY3/Bd8SyjzzMW
	pOYIp2lFMWCe+jiutILkA83Ecoy1Fw8Xoz+TW8H1Z40r0ZrouIZxNBt6oBS1BOY20HFn8jHKFFzEE
	FnRWwVd+dPwLWiCAyHGlulB14NMh3GBnp2DnHGEQkubQ2KnFkpiRHYCDeu7VeQmJtkI08FVooebGw
	RuqzZMVrjn32nPBMZiAgm69upTuZg3CW3HRxYOmdnaW5/7OI4d7hNLZkWOL+Es0bH2/BF7M7Bt7Js
	KCjUeEHzCFrZkcLlltq1YCP+WBTrjPtwcaYYCOj0yy+L+HntVGREwa+EAgkBQi9N0/aEL6MKP/7lp
	lGnmkuqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOguP-00000005etP-0Oyj;
	Fri, 20 Dec 2024 17:35:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgbw-00000005bHZ-2ywr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 17:16:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso20610235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 09:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734714983; x=1735319783; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aWkEtC1JATIn6qXREPnlwjqS9TBnknDlIdxobBNl7k8=;
        b=R29Fj8al4grcJYcIw3pSlLa4X52ECWUKXpHDShJuPbfx7V/2ugnAdA58p4/Fi2U8MQ
         1+NqXUtBhaqxcFyEbBmii7Sz1nbQhA7h3pPtfiQ0roE4DWWmZ+hhTJAkqKVx3nciatnW
         EfhTLWsNKohepig2wYfS6a82S/XCqf0vvsgXzfvLbflIbShKEq7yUxTAkjGJBbUcCGcE
         CFtkqY+OuZYB6GTl/Y2BpitfJfLHG9jxQUT/qzWV9cnmjPngvtcFa/UdOf7rvNo8Jus3
         itXDCMK6V3EVBDPLwZ01j7X0EZxkhdkbMFp1nXgAzjYdse14Dwco/vs3W8nn1671Q8Ig
         NObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734714983; x=1735319783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWkEtC1JATIn6qXREPnlwjqS9TBnknDlIdxobBNl7k8=;
        b=JpQ+saQt+1Q23jnzt86RRXOSuiFFFM9DLDTLtRbzHkAOvEfdv9TP4d+Zm8jpYpr5us
         JWItOmWEFv6Q36S2CSjHxQS67uZd4bgc6AZ1btJ56TBfpEokr7xUPMv/lhQuw4v+HwNq
         S3TbFa00Jm/Sm9QHYyp113R4xXZ7yDLhl9qvF7/aA40Ea+GFnUCErwIhuvLmymfQ9XPX
         LAqoQMrswUgM+ftcFe2mAx70tqlljRMQPRwaimfjzQYBt7sVTWJFI7Swh9iJVObPhdYG
         eXwPe2jVGhCFVGJCN00tcbMO8GeuJMp1FyhT1Sntvn3KeIMIVpdfFOk8gJKBop4xg692
         LSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVFmfMo+MwZgggDcGEFk+EhLJtSH6SEQ+enz8XG9RYJRUSL2+hOyjwjUAd7YMjTXeBOjAdg54bOnhVTuvHX/Ld@lists.infradead.org
X-Gm-Message-State: AOJu0YwzxVTmQHip+EfdZ4+vdPWALa4LSY4C2zP1Kv5zH6vJ73ModPcv
	L/zAAR7xiWq3GZYpWYkS2QBZh5Q6TMFSG0GAKBQZ0vFtijWgM8bZouKGEb8PUv0=
X-Gm-Gg: ASbGncuxNpnDyJ/x6PXmVU/fmi5GV8pDEFxu4mZHEovtZOrfgdhOJb3tyZQpBMuujcy
	cu1otbgvH5af5UWL59NzgCK5H75UtyvGdrmiPuObF3OPKOWBIr4hNp2QKnPnZcJEZbzM6dPNwWB
	8Aa0wsXEjWep+9M95nR+MSaEVBww6s0oml1mjI8+mogBhEh0MHd70hTf2PJGtIfGw+LuFhNSbtt
	dkaLk9iSo+D5m6fmm6nlLa3Fc+FwyT7CRZO4rFb2QnCGeXVXoYEGjgGgyA3wBx6CGY=
X-Google-Smtp-Source: AGHT+IGn2bSuOD+eQ1Kw77ReARBTW+Z43faAGpGgYHNzLywWOzDLSMMRJx0svPo2NgeJxp9j9ds7vQ==
X-Received: by 2002:a05:600c:746:b0:436:185f:dfae with SMTP id 5b1f17b1804b1-4365c770940mr76361555e9.6.1734714983179;
        Fri, 20 Dec 2024 09:16:23 -0800 (PST)
Received: from [192.168.68.163] ([145.224.65.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4bbsm50677985e9.32.2024.12.20.09.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 09:16:22 -0800 (PST)
Message-ID: <c98e8399-1471-4d38-b314-4fbcb8dcb27d@linaro.org>
Date: Fri, 20 Dec 2024 17:16:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm-spe: Fix null-ptr-deref in
 arm_spe__alloc_metadata()
To: Nihar Chaithanya <niharchaithanya@gmail.com>, Leo Yan <leo.yan@arm.com>
Cc: skhan@linuxfoundation.org, john.g.garry@oracle.com, will@kernel.org,
 mike.leach@linaro.org, leo.yan@linux.dev, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 graham.woodward@arm.com, bwicaksono@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241220145659.66066-1-niharchaithanya@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241220145659.66066-1-niharchaithanya@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091624_783265_95517AA5 
X-CRM114-Status: GOOD (  21.66  )
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



On 20/12/2024 2:57 pm, Nihar Chaithanya wrote:
> When metadata is allocated using arm_spe__alloc_metadata(), if the
> metadata version is 1, metadata is returned as NULL. This value
> is dereferenced later in arm_spe__free_metadata() and it can cause
> null-ptr-deref.
> 
> Modify the NULL check for metadata to return -EINVAL even when
> metadata_ver == 1.
> 

Hi Nihar,

I don't think this is the right fix. Doesn't that mean we can't open 
files with V1 anymore? Did you test opening an old SPE file on a new 
version of Perf? I actually thought I tested this before but maybe not 
if there's a NULL deref.

Seems like the correct fix is to not dereference anything if metadata is 
NULL, or make a fake placeholder one.


> This issue was reported by Coverity scan [1].
> [1] https://scan5.scan.coverity.com/#/project-view/63616/10063?selectedIssue=1636359
> 

Is this supposed to be publicly accessible? It goes to a login page for me.

> Closes: https://scan5.scan.coverity.com/#/project-view/63616/10063?selectedIssue=1636359
> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>

Probably needs a fixes: tag too for the commit that introduced the issue.

Thanks
James

> ---
>   tools/perf/util/arm-spe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index dbf13f47879c..55827d8ce133 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -1497,7 +1497,7 @@ int arm_spe_process_auxtrace_info(union perf_event *event,
>   
>   	metadata = arm_spe__alloc_metadata(auxtrace_info, &metadata_ver,
>   					   &nr_cpu);
> -	if (!metadata && metadata_ver != 1) {
> +	if (!metadata) {
>   		pr_err("Failed to parse Arm SPE metadata.\n");
>   		return -EINVAL;
>   	}


