Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2E0C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3TEajX3ol7WpjQM7Bs02XMYqvu3P30s/EI/WZ6xncs=; b=uR7NSmafaWjrVPDOOBuBc9i/nM
	y6Jw680+cGcpsGCEGRWs7RUx6pzs/3RVRL3sH+kLLGd/EoFL6yXp/LbIsevxyrSGT8NG6QHZ6guYU
	XR7a5QfPzSWng7sx2f9TjkhTbm2IZEWeoc6jSAD5f1i8o4elwlkL3G9u9tfD1x8wbE4akvNU75hLN
	jA5g4RhJBkdMlpiFlySZkxQISJUEqEwnCi9ttQgpbdAMJuqpao/POkYb84nTDzA/5zcPd3PhIuOYo
	WBJtxYuxgcO026ZOPqto0u3eaxDtCHPBtwaiDN+e50TkVOKZslrkdsT+jvTxusZksYzsRK77ZQxyP
	vh+OxZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARbB-0000000FEWu-1tuc;
	Thu, 01 May 2025 10:57:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARZG-0000000FEMS-0CgV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 10:55:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so2353695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 03:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746096900; x=1746701700; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3TEajX3ol7WpjQM7Bs02XMYqvu3P30s/EI/WZ6xncs=;
        b=EudkeJyrLWSh2rZds83sIFie3Ur1VUyj/La4xGRGD8P7KZV2Xus3/KH53k69FuAsW4
         yJt16OtxmIiMP5SBOUnhTGIHsjJ/kXOuyckk/2PmW9Vj01nVCCuLWQYSUA+ZvFUgCAa9
         EoDVng2Vn4hl82m0/XLpXCARCDX473pTLaEBLdgk2R3pi89k+0Aor1CwsIUqjQdETvyd
         31wp4WY608erM525xLGMp/zfTiqGITpdPXT/IIbSG5m+1hJQUdFZ//ooLGkNkKDZ7k2z
         a5TxiThburXgVE2EiviFLOZRXTgjZBSTRMfbmC4eW6gsM/nAUsw9YUKz9l3oV4MGIolV
         3sRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746096900; x=1746701700;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b3TEajX3ol7WpjQM7Bs02XMYqvu3P30s/EI/WZ6xncs=;
        b=QBEfiCgti0jVyrBqCU+FPGX10kbekjRhi+d1B3D3xC0QcaWDm9k1Ge+XOP+bnzw3AQ
         FZMJCc/jWD/MW1KrmgfbH3Sx8EJdTUkdpJOxeDzS3KZ3zccc7R+jyFM+rrLWF1uOuUEq
         n0c3+HRMC1U6Kzsk6EQN1RvgUGr1y3GapBMDS5gRg87QyuxDmWgGSmgbYhW3l+cuSdGJ
         /pMzXv4rU2wEiCqV5YtAOh6qdsfovSizQIBMjR2xmoDXoyVo1elSu5L1cXHt0hNmiO3t
         k9eKjxBVPn5sM6FFSx+hl520N0OgfLCldZd931+bLeGzcQazJydazP8jxWoXwd7ZQdeR
         zMmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzq1L9Ahfg9Ra1uGalGSxX+YvoHmlEro21OQR2zfiOFGlhhrGhBCTPISCiGNdIzl4uU6vvJwdcCwnetsoMY3bW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3k3Gzdn5Y3XXAwd2Cidz5P816Y9jB0BsvtFWZLBMZ3H+B+93j
	W8Hw+mavHNvk1rdqpYRz3oxp4GAZsEV+QdvVZDT3bIQAAFS3hcmu50XYTWYa1+s=
X-Gm-Gg: ASbGnct1fyiwJkD6oDqt86C4qTVHYfQJuvyiQ4wEOhRygUiqs2TpVcZl8ipZwffox1s
	VRCH5chv2MdE3AOW6v6muhiMCFxcOKV0sDS4XTMHUmt1AIJc6PQ37zqJONsCyPqt/pW5f12Va3o
	BBB2x4VBrs8xn4xz9xcjPwgyJQASIGinG3E7Yog7wC695DCCl49BG+y3e/f0L91m9XoQcfysJzc
	n6DkJrlLZrwdgmQHPZuFk3/r4MLXjEE78VbE0ueOS/fCJAN+JVdUq1AEZ/7JD253KuxOetps1ih
	+56q7v5XVKGwYnweldxYfoQGWS8iBaZhH3q+e2bceVg=
X-Google-Smtp-Source: AGHT+IEHpDCwTkBvG4KAXQYb/Pg+aRPSsJLfMls67U2P6l6YA0MQUP8uc2z5KlrWDlDqTkEd5taFng==
X-Received: by 2002:a05:600c:3b03:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-441b2696c9fmr65103385e9.31.1746096900318;
        Thu, 01 May 2025 03:55:00 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a882c0sm525040f8f.79.2025.05.01.03.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 03:54:59 -0700 (PDT)
Message-ID: <16bf2a1e-2a98-41b3-b780-c0215db5a6dc@linaro.org>
Date: Thu, 1 May 2025 11:54:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm4x: Remove redundant claim register setting
To: Leo Yan <leo.yan@arm.com>
References: <20250501104216.2375126-1-leo.yan@arm.com>
Content-Language: en-US
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250501104216.2375126-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_035502_101567_090774B3 
X-CRM114-Status: GOOD (  15.10  )
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



On 01/05/2025 11:42 am, Leo Yan wrote:
> The claim register is set twice in the restore flow; remove the
> duplicate operation.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 5c20ed4cf4ed..228317991ec2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1958,8 +1958,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>   	if (drvdata->numvmidc > 4)
>   		etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR1);
>   
> -	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
> -
>   	if (!drvdata->skip_power_up)
>   		etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
>   

Reviewed-by: James Clark <james.clark@linaro.org>

Semi-related to this patch but probably not worth fixing: There's 
technically a race condition with an external debugger here. It would be 
better to use coresight_claim_device_unlocked() and report the error 
that's returned instead of manually writing to the whole claim register 
without checking it before and after like the claim function does.



