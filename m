Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE92E68948
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 03:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTcn/fPUEPCVIhM9W+KJ9dVkd6Xp9RZ6Mf0OP58hRpo=; b=dM0ve8hne6FNRvSmQDVwWf8uSw
	03ysMaXAj5xiadKEZ0+sdzZAN6HmXUAsS/WQdozPhSTNsBiTWVpf/dXsSEO7FCkSDHFO0+9YQLRUN
	h1oqTLCIwHtrBS4c/OR4tPuds3NCZt49I7kUGsdXaSDYf/avO/LasYdwUSKrldNIUAEM9Zr3s8wAG
	pixaCfnl6oXFs7Q94UG+0XVrnfaW/wrLlRG2yxtrDoCDFuTPZVpS9xL66Bl2jJUp9PPUYvBVECG/R
	fOV1bMbJuwHprLdK6xFgHIgaeZdf8OpnqgmuIK3RkK8XNE9M0JxOdtcyZ83U8SDoTpI5vjS6P+wy1
	XUnZfoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Ldd-00000002PTT-0B1B;
	Thu, 31 Oct 2024 03:14:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Lby-00000002PMs-0zb5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 03:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730344355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cTcn/fPUEPCVIhM9W+KJ9dVkd6Xp9RZ6Mf0OP58hRpo=;
	b=AyaVgSTLnBILE/g66XKGxeQIrbLzv0cMCEV14e826vWwHW/5NlDFz1zlR80AdyikbG+0DX
	+FBGFrJGNg8Uz3y1VCdtSjBPqTwCre0VhZkCY+JJ+/TaiFO+GcP83TszoSSKXTJXofVXu7
	jwOwzVuREtUGnMhnt63V5L0Z2rU3Vrk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-TMTd0h_6MdWq-KSwSXLmmQ-1; Wed, 30 Oct 2024 23:12:32 -0400
X-MC-Unique: TMTd0h_6MdWq-KSwSXLmmQ-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2e2ebab7abfso1408003a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 20:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730344351; x=1730949151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cTcn/fPUEPCVIhM9W+KJ9dVkd6Xp9RZ6Mf0OP58hRpo=;
        b=SLiyW3eqI0NyKpafuITiAEWgFY3+NNOqXNTwyu/+X9xPHmRAR/CZSq4svT/kaz7kKK
         WVWwDW9/h4nb4cth2d6qKST/QSRgmnu87JzqpFFyS8+47gdFbgPG1GQD10kWoMYCK75S
         okQS/ms4fBildJZHYswJgpRJRAapzGByb4Ltu2fg5MHvRoQkp376ECCySNp3+8glHhd8
         h+uXX81cUr4wTV6lEb/hY+jfG3Zk+nRDh14LpxTLSmfIe11TGR7W+wW7io7QXBolteyH
         FcoHjUBqlZpd80elHIy9CGvf6j14xNB7XDXugByFRlZnVsPQ7rzMfng0eyWS3J6mqSYF
         kE6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNLvKA5Zf8pqTHvSI37WCk/40hmIHu1k+4qp8AZxdFEmIn2DqiLBfwzJqlQjtIq9nVkQXDOdR7w4lTnU3Nbagt@lists.infradead.org
X-Gm-Message-State: AOJu0YyqW8FCdm/hEFF7xrTVe0ujLHrvBwxHZfaIYv5Ie7yYnnCei71A
	FNkPSj11L8jw2oPQ/nxpW9dVO6eDvn2HwVgoR/5HU5IMoVWwMk9zAoVRtqEgVsNy2Qfh1o6ZzYa
	TIoZUzEa3gxOJRSEVkUlj4ljuIPxcxS4VgKuE2U1oSUasdE/6OXEZaN+UAX9eCDrulyxA7/14
X-Received: by 2002:a17:90b:1844:b0:2da:6e46:ad48 with SMTP id 98e67ed59e1d1-2e93e058c03mr1465098a91.1.1730344351451;
        Wed, 30 Oct 2024 20:12:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDUOe3x7LQ/M3/+26G2FoLgVX0MJvm1eLjlAsEfhteoWB6OmAuc6Y5WFI5zoL8xr+mEBaiOg==
X-Received: by 2002:a17:90b:1844:b0:2da:6e46:ad48 with SMTP id 98e67ed59e1d1-2e93e058c03mr1465078a91.1.1730344351060;
        Wed, 30 Oct 2024 20:12:31 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92c53868bsm1709608a91.1.2024.10.30.20.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 20:12:30 -0700 (PDT)
Message-ID: <2e94df8e-ab9b-4214-86d0-e9efaa40aaf8@redhat.com>
Date: Thu, 31 Oct 2024 13:12:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: rsi: Add automatic arm-cca-guest module loading
To: Jeremy Linton <jeremy.linton@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: steven.price@arm.com, suzuki.poulose@arm.com, catalin.marinas@arm.com,
 will@kernel.org, sami.mujawar@arm.com, linux-kernel@vger.kernel.org
References: <20241029141114.7207-1-jeremy.linton@arm.com>
 <32211eb5-eed5-4c71-b62a-362d32e1af47@redhat.com>
 <b62b9ba4-eaf9-4533-9a97-7d5e2929b1e8@arm.com>
 <98b47e47-9014-45d1-86c7-4b78ff36bf54@redhat.com>
 <86b2aef1-8926-47c8-8a33-9f02e3dd7d72@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <86b2aef1-8926-47c8-8a33-9f02e3dd7d72@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_201238_401301_A763BBD0 
X-CRM114-Status: GOOD (  21.69  )
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

Hi Jeremy

On 10/31/24 12:08 PM, Jeremy Linton wrote:
> On 10/30/24 5:48 PM, Gavin Shan wrote:
>> On 10/31/24 1:16 AM, Jeremy Linton wrote:
>>> On 10/29/24 7:23 PM, Gavin Shan wrote:
>>>> On 10/30/24 12:11 AM, Jeremy Linton wrote:
>>>>> The TSM module provides both guest identification as well as
>>>>> attestation when a guest is run in CCA mode. Lets assure by creating a
>>>>> dummy platform device that the module is automatically loaded during
>>>>> boot. Once it is in place it can be used earlier in the boot process
>>>>> to say decrypt a LUKS rootfs.
>>>>>
>>>>> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>>>>> ---
>>>>>   arch/arm64/include/asm/rsi.h                    |  2 ++
>>>>>   arch/arm64/kernel/rsi.c                         | 15 +++++++++++++++
>>>>>   drivers/virt/coco/arm-cca-guest/arm-cca-guest.c |  7 +++++++
>>>>>   3 files changed, 24 insertions(+)
>>>>>
>>>>
>>>> I don't understand how the TSM module is automatically loaded and arm_cca_guest_init()
>>>> is triggered because of the newly introduced platform device. Could you please provide
>>>> more details? Apart from it, some nick-picks as below.
>>>
>>> I think your asking how the module boilerplate here works, AKA how the standard uevent/udev/modalias/kmod stuff works? The short version is that the platform bus uevents an add device with a modalias and userspace udev + kmod finds matching modules, and their dependencies, and loads them which triggers the module_init() calls.
>>>
>>> The suse folks have a detailed description of how this works:
>>> https://doc.opensuse.org/documentation/leap/reference/html/book- reference/cha-udev.html#sec-udev-kernel
>>>
>>> So, this is a fairly common misuse of the platform bus, in this case to avoid needing a HWCAP. Assuring the module exists in the initrd will then result in it being loaded along any other modules required for the rootfs pivot.
>>>
>>>
>>
>> Thanks for the explanation and details. The module won't be automatically loaded if
>> udev daemon isn't in place or the DEV_ADD event is ignored for whatever reasons. For
>> example the corresponding ACTION for DEV_ADD of this particular device is null in the
>> udev rules. So it's not guranteed that the module can be automatically loaded until udev
>> is in place and udev rules have been configured properly. It's a best- effort attempt
>> if I don't miss anything.
> 
> This functionality has been standard in all but the most deeply enmbedded linux systems for a couple decades now (AFAIK). The platform and modalias logic should largely just work everywhere that its appropriate to be building this as a module. And to be clear that is without updating any of the existing rules.
> 

Right, it's also what I understood. What I requested is just to mention it
in the change log if you agree, something like below. With this, the change
log looks complete to me.

"The TSM module will be loaded by udev daemon after it receives the device addition event."

>>
>> Could you please update the change log to mention the automatic module loading depends
>> on udev and its rules? In this way, readers will know it's a best-effort attempt at least.
>>

Thanks,
Gavin


