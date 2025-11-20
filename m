Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785EECF8844
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGKS5Qz+iDj1N5ZFatwOSuiQq3LACqP9+1LJMFe9aCQ=; b=a1ZScXsS6/Z/AzV22CGQzYtUmx
	oO+ynXdNxVrqQnmmsW8cfPV592MN38wJck/0wzVcwHtAnaRC1Kb+dTeW7klDrv9dZxi1zupufkKEf
	/+xPSR/rPRi1V9QMVJ7+9mRic6FnCxP/O3sAwrCticVSZdst1PRfnbaDa3xBQ7y2GSyHyDSmIK4rS
	2MMZuhAj4cL10CiAezPZt9JXS9zlbvnbbAtyavu5olDD8dYOsIR94Rq8flakyWiBZcj63khrhV5WL
	A6HnY35GKcmhU75Xys9dpRd11Symmh+x8UEmF6qEhaZIBOifrC34M1fNjpAvDjxNUhyxgAmRGNRQL
	jFhf1KNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2ld-00000006ZCh-1pWO;
	Thu, 20 Nov 2025 11:24:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2lb-00000006ZCI-0OoN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:24:00 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42b2dc17965so713391f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 03:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763637837; x=1764242637; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGKS5Qz+iDj1N5ZFatwOSuiQq3LACqP9+1LJMFe9aCQ=;
        b=PF9wq0SjKgGKImAWeo26gKOhAD8JJZglBh/aPI7sN3M2tWEGw0AjTSrISCRN8qQHgb
         j0Vrg64PzPQIGeOFFkR/Iy5kTMijm1oJXApHcucRqVbS1msMtpnkgH6NRVHico43j1vL
         q1PsqTtN/AF3zDPSRJ6faNxumvQsMP15JxnOXGoaoBoxm5kRy8SBPqPHqVlvl4G8l683
         o0Dob8VHTfxhPrsMT3XG4rac/3TXhm1w3a0hpRVUrdF2cz+OCHaT0fyHRNsRYl2RfUpo
         Ld4ogtzA0eQGAVF4rRu7KXi29FVOJwojyo5P7XIZWL3pBbtKG6cgjy1Y1Nddk2PKfyEo
         ZP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763637837; x=1764242637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGKS5Qz+iDj1N5ZFatwOSuiQq3LACqP9+1LJMFe9aCQ=;
        b=xOkITRu/W+8pXp8efxBW91mKvqRy+bW/vEDW3q29soq5QiDT29T68/RfnpKl8pDZOg
         M0Jsa+J575qGxksqAXaplAnSCeSi4QYvLXH8zTI4Db6FMlqDvQNkw3c1MDbeUjkYWvYS
         msoqd52nTTTjmS1yXnQTBOD5iJO8/NmGDTlf/8pyDiwKrnhlooeWkYDjsRugipehFxl0
         eGAWvkqvszfeHL4s2ammVkPRHUpTnsv26uUnHgK4EzF5HNJS2Gwb05jq5H++78WIVVgI
         EhPJsWBlNVbzwjVjQ0XIljfIIMGLDaLSNT1o76Vpf5pgizGBvIJSJ6RFl6kCiJIRrYRp
         n/GQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0ChTbHPwTav2MFFrB2F1RcFNT3nUpCr7iKwt69wgwX7+e1yQQwau9CPjynJZ5qNUDavG//udooC8NmiDqOhl9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7jk7w60/V3/0M741jUxCGUZxlufYtnZ5Fmzly8WFaj0cQkuBG
	F4D+kZS2Ly8sfRM56KwwAIlCEB19bLnZqQ9tWWUZALwAqEpLOtDmccdbYGW24srBSYU=
X-Gm-Gg: ASbGnctTQns3xor9rIozFlhrXyfftl/eJo2kRWcdvPE3mniQd7xcuMTTqlhhxGhNehZ
	3TzsjOETg7pPBuNmEa87k92vQji7m+8T2lRbTKTKmgT0q9uwgpGNimj0fo/Bb7kscbXKja0tDfD
	GBQQBZ+9bFlKh8Muxa9vmMIIga/PhvRUfDchMU9a/0v4uwZOC1AHJVxxpaUFWtPuoZEU7yUczFf
	4ZMP6oGaT2pUSmKx/ahW4x/B/pd4gQOK7upctTfnn8EcCU0ALlgb5QzssTrfBTm8JnykKOd48Cd
	TBCdjCD3SabtgDvTsdxkb9rCmMvCuR1DDeTghFQtqGtxvsmlTT+0JaAtUFfkBTnPTE42/Rcz2D2
	9xulQcJHqiVrGcZ3ODqT6fKCG/oBoo7QZVn7+KQnnYNQubHsp2YMxKUdg5HhcpqI7FPRImtbtbQ
	FR9qLGC9fsyCu8d5/7w6td4l93XwU=
X-Google-Smtp-Source: AGHT+IFCSjoFY3pjgeslRHfYXRA9gv/Jay36MG/cxam58OuayXjQUun787Hauf8c91OeSVdBZ+aa9Q==
X-Received: by 2002:a05:6000:3107:b0:42b:30a6:9c10 with SMTP id ffacd0b85a97d-42cb9a6583cmr1993724f8f.56.1763637837301;
        Thu, 20 Nov 2025 03:23:57 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa7affsm5144069f8f.23.2025.11.20.03.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 03:23:56 -0800 (PST)
Message-ID: <30c078df-82ff-4914-b5a2-58cb2d6dd073@linaro.org>
Date: Thu, 20 Nov 2025 11:23:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] coresight: remove unneeded semicolon
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, suzuki.poulose@arm.com
Cc: mike.leach@linaro.org, alexander.shishkin@linux.intel.com,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20251120094105.2766068-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251120094105.2766068-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_032359_158570_20554A96 
X-CRM114-Status: GOOD (  15.02  )
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



On 20/11/2025 9:41 am, Jiapeng Chong wrote:
> No functional modification involved.
> 
> ./drivers/hwtracing/coresight/coresight-priv.h:238:2-3: Unneeded semicolon.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=27327
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>   drivers/hwtracing/coresight/coresight-priv.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index fd896ac07942..16f0cee8cad6 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -235,7 +235,7 @@ static inline void *coresight_get_uci_data_from_amba(const struct amba_id *table
>   		if ((pid & table->mask) == table->id)
>   			return coresight_get_uci_data(table);
>   		table++;
> -	};
> +	}
>   	return NULL;
>   }
>   

Reviewed-by: James Clark <james.clark@linaro.org>

I turned on -Wextra-semi-stmt for Coresight but it results in hundreds 
warnings because of the way macros like wmb() are always used with a 
semicolon.

So I'm not really sure what the point of fixing these up is? Because 
they can never all be fixed without a fundamental style change so why 
not just ignore them?

James


