Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195C4D6B6DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 22:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSTwWvPDbKEnyoJdhYuAUAC8p/hvR5Suw9BWaRelTHc=; b=bTlmyMw1jjnN0l4GiCogam1dVy
	LzRtevgZR3WFkBnC+pbXY53JzK98crs/ysb6b/U9B8rkX2vHECqhE2eG4d8npy2XN3W6JPwk0UzSt
	bzJwhKLw4RrSvIvfUk8glYnXYffQyWqz96TWza7url++VzNtDTZzXveLthZX83MU8ugR52iRwEWHa
	KD138Z+V3JxsEHSfenVyczLqYcv52OhL4QxXIuke3mFDUYzTlnto/zamXh/wgbMuXQmUx3eom1wMg
	gXEJWyrANVP3E851+uEZvDh/gWKQvjCXEKGjUuCGwUYcaID0yfeO5A2/ACgcD10+Ex7bE+aoAt+Ls
	DrizT0RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6HVm-00000001zxn-1WeO;
	Wed, 30 Oct 2024 22:49:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6HU7-00000001zqJ-0LOq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 22:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730328493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSTwWvPDbKEnyoJdhYuAUAC8p/hvR5Suw9BWaRelTHc=;
	b=QaOOsH0eqioygXd8jg0Q69sXehApauzID6U8PXzoK6L9daO4tWA4m0VdH6u0JFTiBe0WJs
	4KaRK2L3cfABprGtSHHkuYH3syvZ9NHgamh5CqlDsMPJergmpOX/kz8YfvE5T6QsWOwPHQ
	UP4Ee9zfTDTtxMDqQbNWlkM9PKt/rKE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-KzoCIjkiNlOVhW_zqoid_Q-1; Wed, 30 Oct 2024 18:48:12 -0400
X-MC-Unique: KzoCIjkiNlOVhW_zqoid_Q-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2e5c75bee71so331134a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 15:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730328491; x=1730933291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSTwWvPDbKEnyoJdhYuAUAC8p/hvR5Suw9BWaRelTHc=;
        b=F3Ly8muCZyzX8xuWQYmcSq20AzscG5asvLDdeRDGktWT1umKTWBAOn9QRKg+HvwWW6
         hSSBBtL0A8Dsbd5mg6BpYEfl3kq/UFu3XxgIXkFGMCg9jymKg1ZPqQVoYJFAW69DDcHM
         n0w3A0vPBr0QQm/o+J8kkhky6//n8FtT2IL8ZdiKFEJkXNUFLQUES4qGFqZ9ZH/sLN8q
         ZfE9OvFxE1XfUyoChu5XXZWW0Fy2Yj5wtRb2OS5C11YL/iYCBRuJK9Y4iXJNGFfuyhyy
         xEafcEHNSD4Pex8WgwNX8/MVbRxpdSJP1cWb+yqpjMKgX276Q8kowe5X5Wa8yjezttZh
         /ZfA==
X-Forwarded-Encrypted: i=1; AJvYcCX0vDeisuEfrEFMC7Zo/GFeDf3/KB7GpvVcuHwl4xnuKoveCSo3ZIBUvBm54c15APGn6L00lSSTuA7jiIKhIg+t@lists.infradead.org
X-Gm-Message-State: AOJu0YzWs3x8FU4UccSae/OflJGZqBT8RzU59mGsUJv3WdVRkLNN2Rg4
	MxcaspvhYUQn4E8HfExz6qUaYCWSd9BGYd/xR5a3kHNcDTmqz3xulxTav2OFdGYJD/TR+7qQbtP
	IssyOYnRpAkAd9EKf9Q8P2kCyjr/WDxOG1bwMGsjatSvmyh5gXPgYwJpBQocnDtluWSRWbZgK
X-Received: by 2002:a17:90a:8d05:b0:2e2:b204:90c8 with SMTP id 98e67ed59e1d1-2e8f11bf7d2mr18512079a91.34.1730328491275;
        Wed, 30 Oct 2024 15:48:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk33fvhx7J/zOySil7LvSFSpwzEwNmUlqs+yh90jXmneYSsyy4+TZp43m6T36UsLv0fd+DpA==
X-Received: by 2002:a17:90a:8d05:b0:2e2:b204:90c8 with SMTP id 98e67ed59e1d1-2e8f11bf7d2mr18512066a91.34.1730328490930;
        Wed, 30 Oct 2024 15:48:10 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fbfa8a4sm2434748a91.53.2024.10.30.15.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 15:48:10 -0700 (PDT)
Message-ID: <98b47e47-9014-45d1-86c7-4b78ff36bf54@redhat.com>
Date: Thu, 31 Oct 2024 08:48:05 +1000
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
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <b62b9ba4-eaf9-4533-9a97-7d5e2929b1e8@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_154815_216062_0C1EECE1 
X-CRM114-Status: GOOD (  20.42  )
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

Hi Jeremy,

On 10/31/24 1:16 AM, Jeremy Linton wrote:
> On 10/29/24 7:23 PM, Gavin Shan wrote:
>> On 10/30/24 12:11 AM, Jeremy Linton wrote:
>>> The TSM module provides both guest identification as well as
>>> attestation when a guest is run in CCA mode. Lets assure by creating a
>>> dummy platform device that the module is automatically loaded during
>>> boot. Once it is in place it can be used earlier in the boot process
>>> to say decrypt a LUKS rootfs.
>>>
>>> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>>> ---
>>>   arch/arm64/include/asm/rsi.h                    |  2 ++
>>>   arch/arm64/kernel/rsi.c                         | 15 +++++++++++++++
>>>   drivers/virt/coco/arm-cca-guest/arm-cca-guest.c |  7 +++++++
>>>   3 files changed, 24 insertions(+)
>>>
>>
>> I don't understand how the TSM module is automatically loaded and arm_cca_guest_init()
>> is triggered because of the newly introduced platform device. Could you please provide
>> more details? Apart from it, some nick-picks as below.
> 
> I think your asking how the module boilerplate here works, AKA how the standard uevent/udev/modalias/kmod stuff works? The short version is that the platform bus uevents an add device with a modalias and userspace udev + kmod finds matching modules, and their dependencies, and loads them which triggers the module_init() calls.
> 
> The suse folks have a detailed description of how this works:
> https://doc.opensuse.org/documentation/leap/reference/html/book-reference/cha-udev.html#sec-udev-kernel
> 
> So, this is a fairly common misuse of the platform bus, in this case to avoid needing a HWCAP. Assuring the module exists in the initrd will then result in it being loaded along any other modules required for the rootfs pivot.
> 
> 

Thanks for the explanation and details. The module won't be automatically loaded if
udev daemon isn't in place or the DEV_ADD event is ignored for whatever reasons. For
example the corresponding ACTION for DEV_ADD of this particular device is null in the
udev rules. So it's not guranteed that the module can be automatically loaded until udev
is in place and udev rules have been configured properly. It's a best-effort attempt
if I don't miss anything.

Could you please update the change log to mention the automatic module loading depends
on udev and its rules? In this way, readers will know it's a best-effort attempt at least.

Thanks,
Gavin


