Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F42ACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 13:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhNC2STjjirOesaI9d1eJ9GZDJ/V751PcyAhgMqnsOQ=; b=Kvm9ZTheDWanEV+W6uhiXvoySA
	O1JnTAUy6pBuxq/a4/mo7KesnTtS8mxwRMiLljrPzjANRWWmi3xpiiIdpcVTIxPYD0Fmn2PggCrc6
	3SjNofBIg4Viz6sBxZworJLZIbzvlgxBU+++2WaNDljINAO+rupRtrN85ebT+kOipGLxUdJgIy6MD
	9HaQtdpbEJ6ji0X4iZlW2UG1hH2aMokcD3lEVn/1IncWRoWBPpbUKXc26vkK07h/pbbQ0NlkP5ii0
	VneSg2oR3C5TJHBlJucT0ARMq2AuvwPpqXPkPXakf8a3kCeqA8HAb8LFplPz1wZmFZIbQhPfAcr/9
	/XZOIm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up559-0000000H0Ka-2PmV;
	Thu, 21 Aug 2025 13:11:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1r7-0000000GUvH-3mdx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 09:45:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45b4d8921f2so3172385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 02:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755769512; x=1756374312; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhNC2STjjirOesaI9d1eJ9GZDJ/V751PcyAhgMqnsOQ=;
        b=vOWZG563ilgIj92HeOkK33bKYUF2oFnNrwaQA6uTsWL4rxbsrjCcEn+tPTtUExXFcE
         cruBFXGadp+on2Llz+wfR4mvb8m7wDr1BQZvV180aM3TZja6Zi+rvoJgBMwXRUNVng7W
         s5eMbQiR1LnWArSMOfprDxFXurEDhF0CbOFxELlP2qMjufLO0uGIhbxyyhNnfm1QAdkQ
         KpCF6UDgT3BDjJys3NXx0qLb14oM+4YPLYS7iTHhG7TNOit/Dbm5jDNcJYz5smfXdAm+
         OCdH3lejheTtuFxXPNLmpJIxpsno9484ygwm/zDCKXMfGL+vjaMOh/zSdXMqtBX8AugN
         8hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755769512; x=1756374312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhNC2STjjirOesaI9d1eJ9GZDJ/V751PcyAhgMqnsOQ=;
        b=jdKbujAmO0qqWSx07TRRn4DWQHVD0uGj3yZHTiWE5S3MX0g5LNBl4aqL+rZPhoaZVD
         Df2WkqyzXThgU6d9VXIzR35b8NKweHH0vZyn1qzYDJ5TGeBfKj9C+BMd9zExgQBqRCPl
         YPNtbHboiBadqK+YvEkYo8GTEADlhIc2pLT1WLsZSiwlbtDltS406O/112jLepSza0Qu
         i8sdk59yKT1GPioZlmGwuraDmeIkBF37DH3U16KLYlufwo6K0KFZkhMbVOgti8UVYMHq
         2UXTBEqDZ9kMrWvtEXqNsBvyHYd/U/29yPZ0kHO4zivjOoaVhYAh/AG98yySQP+SaDeb
         YquQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKsFAeQ6IoETUYuzCT+Q/Yktgt38ZBJ46P1Vi5o0rCt0rDLNtBULACwZx0u4142WIsixTou/3YZ+fKZ6xQonKN@lists.infradead.org
X-Gm-Message-State: AOJu0YznDwu9XrVX6Zr0Kdh7QVp59fOrQG59euu2tQ5v9IgOq4cQDqiY
	odz7oW6ZZCZCFrHXYZ6Q4ZkUgmfGn4Ex/pUSfPbQbmdTHLTfxMFqQ79/QWhvId+ZZKM=
X-Gm-Gg: ASbGncs0vPpqyQDcra6QA8A9mD1WnZa3H26/H/GLPEMsc0Dhid33Mc1uQa5BmMqQZmW
	obO3C+rfJLanNk6psz1jlyYwSF2zrXQg0hJAe9nzk4U2GHGwjGJtyYWw93gCKAQvJaxPTRH8v4o
	GomLgi/d+EcAnJrmkmn1QOJw4ACTgOGROlTnf0HmiTpU/v8h37Kq/bJLkbpM+Xmtg3YILZQnvmZ
	mP7g/cOC4+8oWFiQ0bOBfSz2imw9w/Khg6yPhk89Ypbg9+5qFggzSLvOzkwTUq3ej7ZX0VP6zbo
	qnQzoT8jERKcTUXXMtSAeMmR4/viesX9LZ3AWMOQzZctv1zNrYMkYCecM9OJmSvE/X9S1ee8JDj
	nBjEP2tHJRbpFxbaxrH8B2lXQOc4=
X-Google-Smtp-Source: AGHT+IFKmw7v+ViT8cC8n71RStzPIt3fAok0oSUJk+oz7azFYymuB/3CTMgTbPUStv8Rn2xHhfsY5Q==
X-Received: by 2002:a05:600c:4fcd:b0:459:dfde:3329 with SMTP id 5b1f17b1804b1-45b4d854105mr19045205e9.31.1755769511864;
        Thu, 21 Aug 2025 02:45:11 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4dba004bsm22126335e9.24.2025.08.21.02.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 02:45:11 -0700 (PDT)
Message-ID: <751030d7-444e-46e6-b56f-0b72206969fc@linaro.org>
Date: Thu, 21 Aug 2025 10:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/28] coresight: etm4x: Always set tracer's device
 mode on target CPU
To: Leo Yan <leo.yan@arm.com>, Levi Yun <yeoreum.yun@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-2-23ebb864fcc1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-2-23ebb864fcc1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_024513_968737_B06B3A95 
X-CRM114-Status: GOOD (  18.65  )
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



On 01/07/2025 3:53 pm, Leo Yan wrote:
> When enabling a tracer via SysFS interface, the device mode may be set
> by any CPU - not necessarily the target CPU. This can lead to race
> condition in SMP, and may result in incorrect mode values being read.
> 
> Consider the following example, where CPU0 attempts to enable the tracer
> on CPU1 (the target CPU):
> 
>   CPU0                                    CPU1
>   etm4_enable()
>    ` coresight_take_mode(SYSFS)
>    ` etm4_enable_sysfs()
>       ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
>       			                /
>                                         /  CPU idle:
>                                        /   etm4_cpu_save()
>                                       /     ` coresight_get_mode()
> 	       Failed to enable h/w /         ^^^
>    ` coresight_set_mode(DISABLED) <-'          Read the intermediate SYSFS mode
> 


> In this case, CPU0 initiates the operation by taking the SYSFS mode to
> avoid conflicts with the Perf mode. It then sends an IPI to CPU1 to
> configure the tracer registers. If any error occurs during this process,
> CPU0 rolls back by setting the mode to DISABLED.
> 
> However, if CPU1 enters an idle state during this time, it might read
> the intermediate SYSFS mode. As a result, the CPU PM flow could wrongly
> save and restore tracer context that is actually disabled.
> 
> To resolve the issue, this commit moves the device mode setting logic on
> the target CPU. This ensures that the device mode is only modified by
> the target CPU, eliminating race condition between mode writes and reads
> across CPUs.
> 
> An additional change introduces the etm4_disable_hw_smp_call() function
> for SMP calls, which disables the tracer and explicitly set the mode to
> DISABLED during SysFS operations.
> 
> The flow is updated with this change:
> 
>   CPU0                                    CPU1
>   etm4_enable()
>    ` etm4_enable_sysfs()
>       ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
>                                            ` coresight_take_mode(SYSFS)
> 	                                    Failed, set back to DISABLED
>                                            ` coresight_set_mode(DISABLED)
> 
>                                            CPU idle:
>                                            etm4_cpu_save()
>                                             ` coresight_get_mode()
>                                                ^^^
>                                                Read out the DISABLED mode

There's no lock though, so can't it do this:

  CPU0                                    CPU1
  etm4_enable()
    ` etm4_enable_sysfs()
       ` smp_call_function_single() --->  etm4_enable_hw_smp_call()
                                              `coresight_take_mode(SYSFS)

                                          CPU idle:
                                          etm4_cpu_save()
                                            ` coresight_get_mode()
                                           ^^ Intermediate SYSFS mode

This is why I was voting for changing the compare and swap mode stuff to 
spinlocks so we can be sure it's correct. The lock shouldn't be released 
until the mode is at its final value.


