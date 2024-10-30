Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB9AD5CCBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neq3xz566B3S1oQsZnbDCq4KXTbI5MRw/rrr6tIudvQ=; b=ifAIUddxMtWMJV5hfVNf400GCh
	1nyY1CD4sFnrZIS1EelhcCpl9Qw4zdirq1pv3B008FzBaPR/CMyEhPgyZOnh2Zk0QcDhxBun/KMDm
	e5olLfP2FeazOCV4wgQ7lpwIrCsdmGUfgfjgJ7ADIS0X43R0ZxqeTA0so9vx8txPc16DNob83qwQU
	GDw+YGvB5sIM7ennYZFtyNhiOtQ92F64HJSXezJTh7WvRRQvk7Xscb22ZRzHJ6VtRgyu+ft11Zx8s
	e/65ATz69eQtGrvCPujyzcbcyjykP20X1eGTKfQjPD3hXfuphBIj5GZShSi9KBHWlPR7AteTnv5Lc
	B6WKApaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6AT4-00000000pzX-15TX;
	Wed, 30 Oct 2024 15:18:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ARG-00000000pMn-0E9u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:16:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5462113E;
	Wed, 30 Oct 2024 08:17:16 -0700 (PDT)
Received: from [192.168.20.57] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 247943F66E;
	Wed, 30 Oct 2024 08:16:44 -0700 (PDT)
Message-ID: <b62b9ba4-eaf9-4533-9a97-7d5e2929b1e8@arm.com>
Date: Wed, 30 Oct 2024 10:16:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: rsi: Add automatic arm-cca-guest module loading
To: Gavin Shan <gshan@redhat.com>, linux-arm-kernel@lists.infradead.org
Cc: steven.price@arm.com, suzuki.poulose@arm.com, catalin.marinas@arm.com,
 will@kernel.org, sami.mujawar@arm.com, linux-kernel@vger.kernel.org
References: <20241029141114.7207-1-jeremy.linton@arm.com>
 <32211eb5-eed5-4c71-b62a-362d32e1af47@redhat.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <32211eb5-eed5-4c71-b62a-362d32e1af47@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_081650_297334_92C5917F 
X-CRM114-Status: GOOD (  29.18  )
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

Hi Gavin,

Thanks for looking at this!

On 10/29/24 7:23 PM, Gavin Shan wrote:
> Hi Jeremy,
> 
> On 10/30/24 12:11 AM, Jeremy Linton wrote:
>> The TSM module provides both guest identification as well as
>> attestation when a guest is run in CCA mode. Lets assure by creating a
>> dummy platform device that the module is automatically loaded during
>> boot. Once it is in place it can be used earlier in the boot process
>> to say decrypt a LUKS rootfs.
>>
>> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>> ---
>>   arch/arm64/include/asm/rsi.h                    |  2 ++
>>   arch/arm64/kernel/rsi.c                         | 15 +++++++++++++++
>>   drivers/virt/coco/arm-cca-guest/arm-cca-guest.c |  7 +++++++
>>   3 files changed, 24 insertions(+)
>>
> 
> I don't understand how the TSM module is automatically loaded and 
> arm_cca_guest_init()
> is triggered because of the newly introduced platform device. Could you 
> please provide
> more details? Apart from it, some nick-picks as below.

I think your asking how the module boilerplate here works, AKA how the 
standard uevent/udev/modalias/kmod stuff works? The short version is 
that the platform bus uevents an add device with a modalias and 
userspace udev + kmod finds matching modules, and their dependencies, 
and loads them which triggers the module_init() calls.

The suse folks have a detailed description of how this works:
https://doc.opensuse.org/documentation/leap/reference/html/book-reference/cha-udev.html#sec-udev-kernel

So, this is a fairly common misuse of the platform bus, in this case to 
avoid needing a HWCAP. Assuring the module exists in the initrd will 
then result in it being loaded along any other modules required for the 
rootfs pivot.


> 
>> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
>> index 188cbb9b23f5..1b14a4c4257a 100644
>> --- a/arch/arm64/include/asm/rsi.h
>> +++ b/arch/arm64/include/asm/rsi.h
>> @@ -10,6 +10,8 @@
>>   #include <linux/jump_label.h>
>>   #include <asm/rsi_cmds.h>
>> +#define ARMV9_RSI_PDEV_NAME "arm-cca-dev"
>> +
> 
> Maybe 'ARMV9' can be avoided since RSI is the specific feature to ARMv9.
> Besides, we already had @rsi_present there. So I would suggest to rename
> it to RSI_PDEV_NAME

This and the remainder of the comments below look reasonable to me, thanks!
> 
>>   DECLARE_STATIC_KEY_FALSE(rsi_present);
>>   void __init arm64_rsi_init(void);
>> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
>> index 3031f25c32ef..ad963eb12921 100644
>> --- a/arch/arm64/kernel/rsi.c
>> +++ b/arch/arm64/kernel/rsi.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/psci.h>
>>   #include <linux/swiotlb.h>
>>   #include <linux/cc_platform.h>
>> +#include <linux/platform_device.h>
>>   #include <asm/io.h>
>>   #include <asm/mem_encrypt.h>
>> @@ -140,3 +141,17 @@ void __init arm64_rsi_init(void)
>>       static_branch_enable(&rsi_present);
>>   }
>> +static struct platform_device rsi_dev = {
>> +    .name = ARMV9_RSI_PDEV_NAME,
>> +    .id = -1
>> +};
>> +
> 
>          .id = PLATFORM_DEVID_NONE,
> 
>> +static int __init rsi_init(void)
>> +{
>> +    if (is_realm_world())
>> +        if (platform_device_register(&rsi_dev))
>> +            pr_err("failed to register rsi platform device");
>> +    return 0;
>> +}
>> +
> 
> Those two checks can be connected with '&&' and '\n' seems missed in the
> error message.
> 
>          if (is_realm_world() && platform_device_register(&rsi_dev))
>              pr_err("Failed to register RSI platform device\n");
> 
>> +arch_initcall(rsi_init)
>> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/ 
>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
>> index 488153879ec9..e7ef3b83d5d9 100644
>> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
>> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/arm-smccc.h>
>>   #include <linux/cc_platform.h>
>>   #include <linux/kernel.h>
>> +#include <linux/mod_devicetable.h>
>>   #include <linux/module.h>
>>   #include <linux/smp.h>
>>   #include <linux/tsm.h>
>> @@ -219,6 +220,12 @@ static void __exit arm_cca_guest_exit(void)
>>   }
>>   module_exit(arm_cca_guest_exit);
>> +static const struct platform_device_id arm_cca_match[] = {
>> +    { ARMV9_RSI_PDEV_NAME, 0},
>> +    { }
>> +};
>> +
>> +MODULE_DEVICE_TABLE(platform, arm_cca_match);
> 
> 
> /* Comments here to explain why @arm_cca_dev_ids[] is needed */
> static const struct platform_device_id arm_cca_dev_ids[] = {
>         ...
> };
> 
> MODULE_DEVICE_TABLE(platform, arm_cca_dev_ids);
> 
>>   MODULE_AUTHOR("Sami Mujawar <sami.mujawar@arm.com>");
>>   MODULE_DESCRIPTION("Arm CCA Guest TSM Driver");
>>   MODULE_LICENSE("GPL");
> 
> Thanks,
> Gavin
> 


