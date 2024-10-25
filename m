Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4FBD0C614
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eM5nkTRxomZGNrAn6Kh9dqC0qKVLwKAVOyxctouNCUI=; b=usMG22gcp45vAtqP4b71h+4sLx
	thrPhDZlpuQ059jc74XgnDnN8p/WXdDxxpfdciBWJCEkplHFyB4sZ5ckzHu+givtreb2WwYm72BdL
	28oYIVkB9O9uSeTTZRlbKf7mE1vfb5hznc4abJX8WANRJbFYdBnMqOeEOQUYX4CU4U5IUBjTXgCaj
	gPoBFfOOA3Dt199QYbSTexPaIyEL+4/hr4zd9L/nMGoHNaTfGo0fRoW4TCNz81mq7JVTn2tK2LYns
	AdNBdd0Xo/CnxwmAMaer5SyISJlopu4/FeHOTraM3LflqiPFjFeV7EIus+yiTpMfFEWvrBP7BweIg
	kWxNa7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4L71-00000003ySB-2KUk;
	Fri, 25 Oct 2024 14:16:23 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K33-00000003lP6-0RPa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:08:14 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so1946922e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729861691; x=1730466491; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eM5nkTRxomZGNrAn6Kh9dqC0qKVLwKAVOyxctouNCUI=;
        b=C8vSRDSgZ7HdvWwRebnGppWup6NS1wkufQMvNT3aEdSvaOQCnIys3d4/tPnDZnD7A3
         NNscwjs+egb6kgA45uIwsiKMTOzNjRgYuH43HfltttrzQ2DmxyRmJACGw9BQyh1h+jBr
         hcxRw33YzJk5J65IpVvAsH2N8A567ZadAuRLEijb5LmoCF+dSS7iSkArgPSgA4EqHSSN
         CS1m7dcsvyePT2mcc0jDLmwufE5yeOst3PorIz8ew6ErUyBVuOrnsjbYdvYUk3ESz2Bz
         dxEpDvp38TiVvtaPs5XEnbbZFgqy/wlPxf/HiPHAm8TzOdSYsOWEtDp3j4mKDEqFu9sz
         r+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729861691; x=1730466491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eM5nkTRxomZGNrAn6Kh9dqC0qKVLwKAVOyxctouNCUI=;
        b=DTBYw6cXBk/BZDkqK+xFbr9NXAFgcq6m2jDMrWFTsvQx4ZYnP5p+kAYzWRoE3H+Wl+
         RGssr6MWbW1sE96zX7svJdZWwTVpF/ugVveZrt+IXRvr5zLta1Q+nHKn01vUtTS8+xux
         9I88ljF3s/eOHnrOGLEIWE1mKuRBInBGhm1+W3gM3Oy0g2Hh1W6mPFhhurlm+Dg/gaao
         hwzJPxeNGHlBJ7FCTOPRBUq/rMUkimuVSES4V+T0H0UNHpVKke//FdiXLgiSpvwxoKMN
         Xg4Qb5rdkJGYxfp/l8imfSWcClBEYDc558wbXEDpDBVDeVay55xQW9PWNBueoLuOziIC
         9nUg==
X-Forwarded-Encrypted: i=1; AJvYcCVRnkSXpxqkScUKihNKLPke1/fO/oYpQ5Ez7EqtyEU8kgcvOefYvXo+1G0tPqvL8xUD8FbXwYyXi+3Wa6JSKGWV@lists.infradead.org
X-Gm-Message-State: AOJu0YzSM89X152F63AEHfq7dgekj5frPBHhFfsOpCP5V2ZCZo7jcdFw
	ec9jch/JVWvHrofL4II3eCS39sAF3ru1EONXMqkU45wsqRVdHrXnRE0QDG5Vlig=
X-Google-Smtp-Source: AGHT+IFCT0tBIW4gocugoLB0PVdeFxoiVJ9M/pABhSRPvl5b0xI66ZUSnk//HMoGyQlwk1X0S/7NtA==
X-Received: by 2002:a05:6512:1286:b0:539:fc42:e5ee with SMTP id 2adb3069b0e04-53b23e0880amr3207615e87.29.1729861690929;
        Fri, 25 Oct 2024 06:08:10 -0700 (PDT)
Received: from [192.168.68.136] ([145.224.65.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b7e8sm48189595e9.48.2024.10.25.06.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 06:08:10 -0700 (PDT)
Message-ID: <1e115332-f68f-479a-8ae9-6b9a3120b21c@linaro.org>
Date: Fri, 25 Oct 2024 14:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/4] perf arm-spe: Allow synthesizing of branch
 instructions
To: Graham Woodward <graham.woodward@arm.com>
Cc: nd@arm.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
 jolsa@kernel.org, irogers@google.com, mike.leach@linaro.org,
 leo.yan@linux.dev, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241025105212.51779-1-graham.woodward@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241025105212.51779-1-graham.woodward@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_060813_200865_A23C5A0F 
X-CRM114-Status: GOOD (  13.29  )
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



On 25/10/2024 11:52 am, Graham Woodward wrote:
> Currently the --itrace=b will only show branch-misses but this change
> allows perf to synthesize branches as well.
> 
> The change also incorporates the ability to display the target
> addresses when specifying the addr field if the instruction is a branch.
> 
> Graham Woodward (4):
>    perf arm-spe: Set sample.addr to target address for instruction sample
>    perf arm-spe: Use ARM_SPE_OP_BRANCH_ERET when synthesizing branches
>    perf arm-spe: Correctly set sample flags
>    perf arm-spe: Update --itrace help text
> 
>   tools/perf/Documentation/itrace.txt       |  2 +-
>   tools/perf/Documentation/perf-arm-spe.txt |  2 +-
>   tools/perf/builtin-script.c               |  1 +
>   tools/perf/util/arm-spe.c                 | 31 ++++++++++++++++++-----
>   tools/perf/util/auxtrace.h                |  3 +--
>   tools/perf/util/event.h                   |  1 +
>   6 files changed, 29 insertions(+), 11 deletions(-)
> 

Hi Graham,

I think this is V1? Also it looks like the base doesn't include a few of 
the new SPE changes and it doesn't apply cleanly. Make sure it's based 
of the latest (46610ba41ef1)

With that LGTM:

Reviewed-by: James Clark <james.clark@linaro.org>


