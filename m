Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5170FC9EC7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTQwB3rZvEI+7UgNbenEQSikhCpce+1ZGVw/HdNyvwI=; b=BKFUa9j245yJhkfTWMUu83kMq+
	6jKB0d8C1hvRbz2wLWN4DsN1D3C1nZEUtsw0D08SBrRoMYb/KAz8euL9mwmM/BHj1MLI7y8IKml2z
	D0OsguJFUW4LcURJPDArDWXRvRZq/yjGOCN76e7RzDXebbabh2cHt7w5nhvkotK+Xn313KvY5VkcV
	dOhjv12CIP92YIaCucVidIdK2IPeVhzR6JQzQXo8Dfw1gxULDuv35eNIQ2FCGJVEdslMR6CyExnsG
	E0AcYhGWwzSJpE/0ahdT929nVXXBYL1/vPYfnfKmezsJ64bwZicTgpBHCu3beC2/LmzIm9ER9qQ2v
	ZWDtzsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGjc-00000005JBk-373m;
	Mon, 12 Jan 2026 12:09:24 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGja-00000005JBG-1k2S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 12:09:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so60122275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 04:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768219760; x=1768824560; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTQwB3rZvEI+7UgNbenEQSikhCpce+1ZGVw/HdNyvwI=;
        b=LNnJDcftbRUiCkH45AdmpHYWUxUY/TxT2y94RvJPy9ZridVbt1M/rX1NHo2xzSR1w4
         WkXSp6vi1AyG2vC/2x95kmPAf7RrdHcZUViHznJlZZ8wZr8LWtFMlb2wQBeBy0yx2PMZ
         dEy0jt0YJJV/JUu/Mi20vlQK6dbwe2ZJi9imVZ8nCaJoe9cDM2mUHxocIuVVxmAQVg4H
         rWpjJ0ISKPdmF8amzEgnfDlHurFwapDt5y6BcyPHOBlARia5YvoGwQWqsdIi1X2Z6uOM
         rKXaFc/hI95HPRtxSZP3/rrub7HOkV54IDQ6oWiWb1fEu41V2r4vwaHGsjojV7dm+/jY
         jUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768219760; x=1768824560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTQwB3rZvEI+7UgNbenEQSikhCpce+1ZGVw/HdNyvwI=;
        b=MDtKDeyUz/YV3TKjORFUaAXcB+SD61TT108AE7sbWZOYYIQZ6US/8eS0gCaziFre1b
         5CvORtP/pxtITwsL3xj6+WI/uW5RBmNT3Y+4yX20FuGX/oKjnuyfUzIzTrtRyv52eTZ2
         6XP2WmJejCMH5iZS41xK7IMxu7khQpG1eWPODWrN6SljOw1l/gTndIU39UriZLR8yBuc
         t22DAxl994ACTzEr/zzCyCTiM4ARpnPKDadbPo+k1RdmfbvBHrcq9gMuvJazUhPHa4+B
         XrgKgp8nval3kj/8ohW6GaDimceuCLkbtZqiVnwoWgTsyIejLGhDNInNfNObahCQwuu7
         WxHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuNNwcfnJjDlElB/ARLGWgepvkEhNCsjlRHC8/0rTM/rXAHKvQEJttw4JoSMSQ80AbhAVCUIoUiB7P/Umj7/RG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2YTrn8L0Sxi9j4w2yV8ocL7r+cMx8VxpNauPycPpX5uEkrlGi
	jjbgQPnbOmqc0QNkdfkHx70RzIlAusBtKA/ui4lLdxyvDZoHmL4HWM0+0XXSmOJ2huU=
X-Gm-Gg: AY/fxX7whkxWbs2+GvUVh8SIayUwdc3eRi2lsOhVYCWhybEjvgFB2ZF/63ZaRvcOzQh
	LHVP/Qlj+YmakNOxkrD0u9j0YnwGL7xhwLbIKmuv+9F1Hnai1H+sHqa1nqtSfyYxIEvk1BFgbFS
	p6yJtEvskbNqxtvwPKYHvWevhRDeYQjNuBMnutVDrFSA1D5EaT1vrMLPLJyWKGzymvyy8+SLmFn
	+NxITuRvBQe0S9YbJkrfK8mqUOqmMOGcdVCBSmum7Qv+wtWDT82oLHmiXG9qD+YXyeS3MH1GzlX
	AYzw1tn4pnyut3U5cguC50UMgnE/msljm85MuwxFgBgLbfTAGgxaZuzF2Naa6tGx6Thd11OW1+T
	H+ReZvnXRSiMNY8j2UQ0Ey4VchEfP03v00lqjOF1OUwNA52RHrZGM8awKVc/lVmM1RaaQC3YWbC
	z7MgH22t74zZ/DH/WUdo8oGl7tjmv81pmo0ajXSw==
X-Google-Smtp-Source: AGHT+IEVxqtmZ8Iypu6KLmzuavgzaMjHW05m9rZ/bXcJq5/QJRKZ+HKa1MwjTddrSFEfzenNCE6K9w==
X-Received: by 2002:a05:600c:500d:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-47d84b3baa1mr144825325e9.20.1768219760432;
        Mon, 12 Jan 2026 04:09:20 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8702534dsm144173975e9.2.2026.01.12.04.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 04:09:20 -0800 (PST)
Message-ID: <d7db9f17-012e-43d7-a0a5-58b254dd7e33@linaro.org>
Date: Mon, 12 Jan 2026 12:09:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 03/35] KVM: arm64: Add CONFIG_KVM_ARM_SPE Kconfig
 option
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: mark.rutland@arm.com, james.morse@arm.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-4-alexandru.elisei@arm.com>
 <1aaffbcd-ba0c-4371-80d7-ce59ac7f13a9@linaro.org> <aWTaXBse_R_LjJE-@raptor>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aWTaXBse_R_LjJE-@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_040922_509430_D767B6F8 
X-CRM114-Status: GOOD (  29.95  )
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



On 12/01/2026 11:26 am, Alexandru Elisei wrote:
> Hi James,
> 
> On Fri, Jan 09, 2026 at 04:29:50PM +0000, James Clark wrote:
>>
>>
>> On 14/11/2025 4:06 pm, Alexandru Elisei wrote:
>>> Add a new configuration option that will be used for KVM SPE emulation.
>>> CONFIG_KVM_ARM_SPE depends on the SPE driver being builtin because:
>>>
>>> 1. The SPE driver maintains a cpumask of physical CPUs that support SPE,
>>>      and that will be used by KVM to emulate SPE on heterogeneous systems.
>>>
>>> 2. KVM will rely on the SPE driver enabling the SPE interrupt at the GIC
>>>      level.
>>>
>>> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
>>> ---
>>>    arch/arm64/kvm/Kconfig | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
>>> index 4f803fd1c99a..31388b5b2655 100644
>>> --- a/arch/arm64/kvm/Kconfig
>>> +++ b/arch/arm64/kvm/Kconfig
>>> @@ -83,4 +83,12 @@ config PTDUMP_STAGE2_DEBUGFS
>>>    	  If in doubt, say N.
>>> +config KVM_ARM_SPE
>>> +	bool
>>> +	depends on KVM && ARM_SPE_PMU=y
>>
>> I think the most common configuration is module, so requiring built-in isn't
>> great. If there's any way of avoiding it, even if it costs a little bit of
>> pain, it would be good for adoption.
> 
> I'm not sure how that could be done. You need the buffer maintenance interrupt
> to do a VM exit so KVM can inject the virtual interrupt back into the guest,
> otherwise there's a possibility of a large blackout window when the buffer is
> full.

Without expanding more I don't see how injecting an interrupt is 
strongly related to the way it's compiled.

> 
> The code also relies on the SPE driver to probe all the SPUs in the system.
> 

I don't think that's a hard requirement either, the KVM code could 
fairly easily do this itself. Inline the common code and put it in a 
shared header etc. I'm sure there are lots of creative ways to flip the 
dependencies that might not be "proper" software engineering. But like I 
said a bit of pain here might be beneficial overall.

>>
>> It was basically the first thing I got stuck on trying to get it to work. Or
>> if it really can't be done, maybe some kind of debug message to say why
>> enabling failed.
> 
> When you search for the symbol in menuconfig you get a list of the symbols it
> depends on.

Right, but that doesn't address the problems of adoption at all.

Having it on by default when SPE and KVM are already enabled in their 
default configs is the difference between people being able to use this 
with zero friction vs 200 people all getting stuck and then coming to 
ask me why it's not working and distros having to update SPE from being 
a module to static.

> 
> Thanks,
> Alex



