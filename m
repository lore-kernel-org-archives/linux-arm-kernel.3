Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE63CF45DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGE9UIHVgDBqIc65rQA4U564vEu8+BlSlMVLYefNTVU=; b=iFKCtcO0ufb9L49fetJP9CbkC4
	tqguSrtYf8wdZlTzulwS2WC8kAxnH6oCtgt1Ffc3DBfbM7UJswU7Q9lInhN7XjQelqs413xXLHZeP
	dLWwwY5CKzlX/wBg+yN26wOtnZeCiPD9llab9wl++MYI4IbnUs89QjLXUMKhkyY+EodMzoAenOuSj
	cbl3hqs3pNshzAYbjAz417SBSk8pjaoTN7iZEZh81C0tzzKy3e9oWS3AdPF6cD2vFjzwc/oBReV92
	FBFRl1pAjGAYqiCgyq0/oQWL//Zh/Eg4jMIYo/y1iVhoBIsHAOhKSQud9nwtaHGsybK97MhcK61A+
	Bo6KYmtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfft0-00000007JSj-1mcv;
	Tue, 13 Jan 2026 15:00:46 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffss-00000007JOW-0MHv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:00:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so47876835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 07:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768316436; x=1768921236; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGE9UIHVgDBqIc65rQA4U564vEu8+BlSlMVLYefNTVU=;
        b=ow2zCneV9iDqBFElAhDWirytzWcYfIlaDUXu5/xQ+Gf9G/b28gDQ5XMbpYI7o9ylgu
         16rxuwIYJSXFy+bCEIi4O/ARZJydQBylSnAnRkYFjEV1J9+DJKMB3tfR4cc6NNMggGHg
         4lTUqLXdYPZNjNGwgVRJ3VaNZoALQU8nzFde9bNZ8sKd+ux0yssSKlH0ODp3kVnxRF8b
         AEFEvfQUOEzkfKuj+VBZAlQy4JudpM95eb0sEcuIIzJxG6Qh2wtiRSmkTmKkJn0Z5Hq/
         RMbSsRCcOLUndEqJ9sSHusJ/W17xkF2BYdpOSfU/5fUNVlo2UmmtCHJWi22zzsNV7ASC
         tJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768316436; x=1768921236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGE9UIHVgDBqIc65rQA4U564vEu8+BlSlMVLYefNTVU=;
        b=wK+H5rkPHQKUXF2IusxgkWF6QZaV9Dw8WU+m+Zv7LvPjn6qDxTPySm/LPv8MLKnzis
         thonx0OnTWs5nROM87lyj/XGmz8KnA2czJhIn1Jtz13lN0BJmUov67ZCJUN5BNATC79z
         PmMYj90SACRiW8wK5Z2wSk2eV6QEfaebMixjHPpYP0yPRh4xrPV0+ogRntA3Fx6IYcH5
         K89tEknvyiAhUCcgqBl7pLzOf7Xtm/H0d9QAwiomHv1aTdqMnDvxT3V7IkQqHrPWYVtT
         ASooWksBSSKlPw3N4DTwMH+E+6FOXBkuvWNjrtFE+hyJhy/W3zjP2kIR9rr0XC4TKnNY
         nfqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUohwEOjHwUMsAjjud5EaUoXROlNZEOmNRBJWGFIdo3lS2XD7XWaqKnIC9JWRQXd0oIaiHCq9HmpLHPg4qYl8p2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9N44CnnUU0+J6SA4UV/Xm6MKEcOZlY0UADwi0nfJfIkcAXbeV
	yWqdiLjm1DWLAJq3FTacN6OIKv6UBx2nr8KxBD8+Vz7TUFf26SFWfxTwc6pjbp9keYE=
X-Gm-Gg: AY/fxX59cPFYl3xKuZLE72fbLxPVCkrpfEnvus+VpB/hMSbpcctEBzRRn6jnv0sr+IQ
	FN7iwMagbZosQlF3FHnND5EHb7yIH+ThpBet8wTKaA3eCehqCt2W5d2WSK9ftvV//u3GZjcY5CW
	1fdGf9rgCr0PtvTxMevym4ZuFaJZ2GlJy/PZf6UamCuYHHqkADy419xuO2O0ASY0pbCrbdR8fke
	qABKqNwaOPt+q8PPIBHV7qHgHr49U7BgUrVlpxV0ctjawg4ndo/9rbvdPDkuAcGmvHscXY2bZlu
	UVd8CY11dOSb6h13yo6zzjxy0PDirXD4aZUR/qfx1PyF5J1nkuNNa3yrrJZcHxGD1qyJnncgrwL
	Z4sjvccL/pp/SJAFXw0NMnAtwwuGUa9koTWCAhsT59XMhylM121vskJ9BPgoTwrpMHQHhO9VNxX
	xCGnS3N49XH3ARttM/vtdprKyKdYE=
X-Google-Smtp-Source: AGHT+IFbC4mPqKFKEgjK16OyZrgYzwPWew86VgIcMFrQGd72up6dSFd2v0PSZd2el7PkRQfxGmmB9g==
X-Received: by 2002:a05:600c:a314:b0:479:3876:22a8 with SMTP id 5b1f17b1804b1-47d84b2d285mr229096815e9.16.1768316435786;
        Tue, 13 Jan 2026 07:00:35 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee119aa2asm1883695e9.4.2026.01.13.07.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 07:00:35 -0800 (PST)
Message-ID: <43ec5e82-88a6-4c7b-983a-b5aa32673913@linaro.org>
Date: Tue, 13 Jan 2026 15:00:34 +0000
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
 <d7db9f17-012e-43d7-a0a5-58b254dd7e33@linaro.org> <aWUQ3bYuxpMEWTUk@raptor>
 <aWYdob5IfyOQcu6I@raptor>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aWYdob5IfyOQcu6I@raptor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_070039_314744_99CE5445 
X-CRM114-Status: GOOD (  36.73  )
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



On 13/01/2026 10:25 am, Alexandru Elisei wrote:
> Hi James,
> 
> On Mon, Jan 12, 2026 at 03:18:53PM +0000, Alexandru Elisei wrote:
>> Hi James,
>>
>> On Mon, Jan 12, 2026 at 12:09:19PM +0000, James Clark wrote:
>>>
>>>
>>> On 12/01/2026 11:26 am, Alexandru Elisei wrote:
>>>> Hi James,
>>>>
>>>> On Fri, Jan 09, 2026 at 04:29:50PM +0000, James Clark wrote:
>>>>>
>>>>>
>>>>> On 14/11/2025 4:06 pm, Alexandru Elisei wrote:
>>>>>> Add a new configuration option that will be used for KVM SPE emulation.
>>>>>> CONFIG_KVM_ARM_SPE depends on the SPE driver being builtin because:
>>>>>>
>>>>>> 1. The SPE driver maintains a cpumask of physical CPUs that support SPE,
>>>>>>       and that will be used by KVM to emulate SPE on heterogeneous systems.
>>>>>>
>>>>>> 2. KVM will rely on the SPE driver enabling the SPE interrupt at the GIC
>>>>>>       level.
>>>>>>
>>>>>> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
>>>>>> ---
>>>>>>     arch/arm64/kvm/Kconfig | 8 ++++++++
>>>>>>     1 file changed, 8 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
>>>>>> index 4f803fd1c99a..31388b5b2655 100644
>>>>>> --- a/arch/arm64/kvm/Kconfig
>>>>>> +++ b/arch/arm64/kvm/Kconfig
>>>>>> @@ -83,4 +83,12 @@ config PTDUMP_STAGE2_DEBUGFS
>>>>>>     	  If in doubt, say N.
>>>>>> +config KVM_ARM_SPE
>>>>>> +	bool
>>>>>> +	depends on KVM && ARM_SPE_PMU=y
>>>>>
>>>>> I think the most common configuration is module, so requiring built-in isn't
>>>>> great. If there's any way of avoiding it, even if it costs a little bit of
>>>>> pain, it would be good for adoption.
>>>>
>>>> I'm not sure how that could be done. You need the buffer maintenance interrupt
>>>> to do a VM exit so KVM can inject the virtual interrupt back into the guest,
>>>> otherwise there's a possibility of a large blackout window when the buffer is
>>>> full.
>>>
>>> Without expanding more I don't see how injecting an interrupt is strongly
>>> related to the way it's compiled.
>>
>> It's the SPE driver that enables the hardware interrupt in the GIC.
>>
>>>
>>>>
>>>> The code also relies on the SPE driver to probe all the SPUs in the system.
>>>>
>>>
>>> I don't think that's a hard requirement either, the KVM code could fairly
>>> easily do this itself. Inline the common code and put it in a shared header
>>> etc. I'm sure there are lots of creative ways to flip the dependencies that
>>> might not be "proper" software engineering. But like I said a bit of pain
>>> here might be beneficial overall.
>>
>> Userspace gets the maximum buffer size and the SPE instance id from the sysfs
>> files.
>>
>> So KVM would have to parse the DTB, read PMBIDR_EL1 and PMSIDR_EL1 on each
>> physical CPU in the system, create the sysfs files (at least 'type', 'cpumask'
>> and 'max_buffer_size' or whatever that ends up being named) and install a dummy
>> IRQ handler before the SPE driver is loaded.
>>
>> Then when the SPE driver is loaded, the driver would have to remove the IRQ
>> handler and install its own, and create the rest of the sysfs files.
>>
>> That's assuming that the SPE driver is loaded after KVM. I think it's possible
>> for the SPE driver to be loaded first. So both KVM and SPE would have be able to
>> communicate with one other in case the other probed first.
>>
>> Is having to change the symbol ARM_SPE_PMU from 'm' to 'y' worth this? I am not
>> convinced and I don't see much use for going down this rabbit hole at this stage
>> of the series.

No, definitely not something that needs to be done at this point.

>>
>> Also, since KVM would partially populate the sysfs directory for each SPE
>> instance, would it be reasonable for software to assume that the SPE driver is
>> loaded based on this and start using it? For example, how does perf detect the
>> presence of the arm_spe event?
> 
> Coming back to this, I do understand and agree with your concerns, so after
> talking in private I came up with exporting the symbol kvm_host_spe_init() -
> that's the function which adds the SPE instance to the list of SPUs.
> 
> With this change the SPE driver can be built as a module, but SPE for a VM is
> available only as long as the driver is loaded.
> 
> I hope that improves the adoption story :)
> 
> Thanks,
> Alex

Nice, if it's not too horrible we should try it. If it turns out to be 
horrible then yes we'll have to ask people to change their configs.


