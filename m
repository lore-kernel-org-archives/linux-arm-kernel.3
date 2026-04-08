Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679071073CAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 12:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HjLng+uQRNjm1z1zuTjy5y/w9qsZHRWlW+XuytMdIQ=; b=BHtJDgiuwR+1mjrb2hdDdI01BQ
	pEn1U4leei9tmmq5EEtmL4YBtQ/JadcNG0JuoAtjjAHnmBJ6jJTw2DETaYZudVBelgEXwGPu4A/Pu
	SM5MM1UTbDQvgGfo+kRdfOfxAxu2wSs2G3L/oRMWDv1qw+zy6Rn8wSzwuNhuH+9e21poQBD+aC3J9
	22hbBjsudjQZm606UAqaPQH6DijgtANZ93Pbyb+ZVPeH4Ma3+foc6ce8sG59CyCykC/n2L7KrWprF
	B5mevB9RQ13Wd9w/j6nI5ivfTl2pvnBJMtDI2f+Bzht5i3NRGRT2UthBAyhrnqECqt3eAppc5CZyF
	3EUF3O5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wASCC-00000008roQ-3Htt;
	Wed, 08 Apr 2026 12:39:48 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wASCA-00000008ro2-0cri
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 12:39:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-483487335c2so63989035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 05:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775651984; x=1776256784; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0HjLng+uQRNjm1z1zuTjy5y/w9qsZHRWlW+XuytMdIQ=;
        b=S5QZSnm2fUyI+0gGgrWutSqH1RE6InXsaH/wQupNamhJsPwz5akbjmzfPNWp2+d6Qe
         OAtE4Fw4i0Ls1YzNMzyFyDCv8i252KmsLdPVaMPAzRTVBoRaA4Cb9M3ZfCCaZtvg65KC
         rIkd1OhQghqL/X1YEykJ9lAWtJ7mDEgR5dAKAu6DN2lFBAKXW/stLaFqLp2KqECDk5tU
         E5HSnbuwfnZLgIAEO3Y1tmszAfe/Ej3b2T/fImVASf/C1Q+B+0SriHL4ZHTnUysagIdV
         8scfDyMYKVDwhhvEvMvmMTRf1ec5ayzw0WI0EVF55lNK58D9KT12blfVGXoxNDnZ6JF6
         SrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775651984; x=1776256784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HjLng+uQRNjm1z1zuTjy5y/w9qsZHRWlW+XuytMdIQ=;
        b=fzACYZOK91Ssc9EKYthV3G1QdwWX/iR9S0YpYzGZ7YDN4x2gC0lpxI6pwa3wy4EbjY
         0YZByi0kMEd64WsaIFW+eujZODz0/JPzW5zLB5W9DxLLhLEjt8AAWDSzeM2w6kxwg7u4
         nu8YTz312p10LBtp0+FbD20RbTGNtrQLExMrsp2T0LsXCcG+RK4kbCxyFbSlRk7AbdWx
         yrB1LbXKSoHcjlMecZ3mwgdPe9DeMCnagZlNEylibENcnMRcTYINi5EIu2cS8nBWyHIv
         +73No5cJoPNEmfcqXOZ/uoQ9uKT0h16J+m3JepSm7vcZGgG6Zg/6j4nri+PhFGP60DlT
         +rYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX3i1EqkaFuway575bFzEc6b42aXX+NjsRB0rT38ZprwybiCJWPjInXr3y/4AXof5/TugOvjCb47veeKS56h9e@lists.infradead.org
X-Gm-Message-State: AOJu0YwR5vIK+KtZ7dJW0+7z745VdFoVgV6AyMsLUYsxSweczgtX8G5K
	L/5iIKiql7J6wg/SUd85FXM/hrcgiXdN+aUG3SGt5E+JzEs/Ic2HYasxxUiaaZG6X5w=
X-Gm-Gg: AeBDiev8+0v5iKMExvCnM7Z0V8SZctMKZMgU6vnAukfxKzJrNqiW/zq7Aal6mcuCK0j
	eSPqsFX0X+vx19LdB3ejxiSG7Jn18AJaw3fzijyf4658gfmckScQgsNaM66XFajR0zwvU4IXjth
	4jUTXBtdxVSipG/j3yLYkwKAxi2S3fnayN1eRVPfpRuJW4YC/d5DjH3oNhLr9sdNXzxRcm8woey
	t8ptvFB1X6tIAQJrVKB1RhgLSudOIedNjJ26uGCif+pRcAMoY8rJpq2FXuRuH/k+ynmhynAIxbL
	7bObtl/G4X0h/4ccDHtYPng8SF/CSfIWBwUD+www0d5mTxEtGPe3eUoTGKccFPhv4Gw3I7Aph5N
	JJiLcTG7ALiEb5QPWuXe1kGvgUPOrLRhd5y9LWsMFPKFc6UeXX6pOBpZv19SWFJrwXhXvkoKyom
	pE/QwqqCowjCvTLXEbJkwMB4zVO4Cr6Z7yJ3ISAfU=
X-Received: by 2002:a05:600c:630a:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-488998e3cbemr295635395e9.30.1775651984088;
        Wed, 08 Apr 2026 05:39:44 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a7165aasm642886245e9.14.2026.04.08.05.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 05:39:43 -0700 (PDT)
Message-ID: <73d5dfc1-b382-4d6d-ba19-90422f3a2705@linaro.org>
Date: Wed, 8 Apr 2026 13:39:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm4x: Correct TRCVMIDCCTLR1 save and restore
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260408-arm_cs_fix_trcvmidcctlr1_typo-v1-1-6a5695363b46@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260408-arm_cs_fix_trcvmidcctlr1_typo-v1-1-6a5695363b46@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_053946_229733_105823D3 
X-CRM114-Status: GOOD (  14.69  )
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



On 08/04/2026 1:31 pm, Leo Yan wrote:
> It is a typo to use trcvmidcctlr0 to save and restore TRCVMIDCCTLR1.
> Use trcvmidcctlr1 instead.
> 
> Fixes: f5bd523690d2 ("coresight: etm4x: Convert all register accesses")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index d565a73f0042e3e0b21fcf9cb94009cc25834d3d..c370b6bf45ef26aff29ee71630f86eae2487069a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1979,7 +1979,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   
>   	state->trcvmidcctlr0 = etm4x_read32(csa, TRCVMIDCCTLR0);
>   	if (drvdata->numvmidc > 4)
> -		state->trcvmidcctlr0 = etm4x_read32(csa, TRCVMIDCCTLR1);
> +		state->trcvmidcctlr1 = etm4x_read32(csa, TRCVMIDCCTLR1);
>   
>   	state->trcclaimset = etm4x_read32(csa, TRCCLAIMCLR);
>   
> @@ -2102,7 +2102,7 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>   
>   	etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR0);
>   	if (drvdata->numvmidc > 4)
> -		etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR1);
> +		etm4x_relaxed_write32(csa, state->trcvmidcctlr1, TRCVMIDCCTLR1);
>   
>   	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
>   
> 
> ---
> base-commit: 971f3474f8898ae8bbab19a9b547819a5e6fbcf1
> change-id: 20260408-arm_cs_fix_trcvmidcctlr1_typo-3382c27d1c28
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>


