Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D179EC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uazcixllph1AaG+4CN/PpRkvp/6wJ2RJPrO8IuhhZU4=; b=QHa3lMuf5+F1AJ4Lg6dpJeRNpa
	W2U/XdXTNhBLu5Z5GJEQMNddt2WXQ4xprsgLZCYgAQpaYZAfkit2d0CB2ZDkiPMvD4h7NbX4T1yK/
	hTHPtSPWe9K/LLJvqY24TWoHxH43DmJDvYSJoopTPiDqxHtX1ej2p4n6mstxYtoh04iTkRLFfawGr
	KZypDiAWZrjJNrjdyIGxryH1rk8rsXL8TXmksLdNZLQvcWhCP1jR9fMdPNGg6f/ufzpkPsCtnH39H
	H33LUuj7h2eA7kKNWZs/zQL82J2VGn9zK/ida5FVhFEg+9yHmSWq1vhOD1m20/cX43IZo6mHebqOb
	wHfoe9xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99P9-00000006i9z-2ilZ;
	Tue, 22 Sep 2026 22:56:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99P6-00000006i9b-1Ccr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:56:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 267771576;
	Tue, 22 Sep 2026 15:55:53 -0700 (PDT)
Received: from [10.57.9.113] (unknown [10.57.9.113])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A07BB3F632;
	Tue, 22 Sep 2026 15:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790117756; bh=qVCjW+bKUVgRJaxooxblKpYN+hplHE+53CuW6GhbhWg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NYFlzv5R7+kCofQIFQDwJs6xa1Tp35O7ZW6qtSA9fT4Pygzy9yDpBiIqnoRsXfoCU
	 Iog5eoTK90Q60dmjkNHrvRS3Q5CEV4M8UtI0CW1l5b4iP1hxxa3rR2tGoXJzpqMeaj
	 c5IADN5feKzMA5TDTPUIgueobeOVzZWzDfkDuvhM=
Message-ID: <2164b046-bbbb-4cfb-b797-5df27fbe313f@arm.com>
Date: Tue, 22 Sep 2026 23:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries
 for memory
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-7-suzuki.poulose@arm.com>
 <178978126543.2352296.12214136703168879825.b4-review@b4>
 <65b0c03b-36b9-4e60-aa55-c3b4b85e21ee@arm.com>
 <93aea89c-0a05-4b5a-905d-2e8c14a9e894@arm.com>
 <20260921145838.00003b04@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260921145838.00003b04@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_155600_522276_4744F7D0 
X-CRM114-Status: GOOD (  25.24  )
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

On 21/09/2026 22:58, Jonathan Cameron wrote:
> 
>>>>>    static int __init arm64_init_rmi(void)
>>>>>    {
>>>>>        int ret;
>>>>> @@ -786,8 +970,24 @@ static int __init arm64_init_rmi(void)
>>>>>        if (ret) {
>>>>>            pr_err("RMM activate failed\n");
>>>>>            ret = ret < 0 ? ret : -ENXIO;
>>>>> +        return ret;
>>>>
>>>> Why did this change?
>>>
>>> Rebase messed up. I will restore it.
>>
>> Actually this is not. We dont have to check the metadata if
>> we couldn't activate the RMM. Also, the failure path at the
>> bottom has "deactivate", which again is not needed. So
>> it is the right thing to do.
> 
> Only after this patch? Not from the previous patch?
> 
>>
>>>    
>>>>   
>>>>>        }
>>>>> +    ret = rmi_init_metadata();
>>>>> +    if (ret)
>>>>
>>>> And this is hitting another bit of guidance in cleanup.h.
>>>> Functions shouldn't be mixing __free and friends with
>>>> gotos.  Again, not a bug here but there are large ugly
>>>> monsters around this stuff, hence the blanket guidance.
>>>> I haven't thought that hard on how you avoid it here, but
>>>> usually it's a combination of suitable helpers and wrappers
>>>> and resulting code is often more readable as a result.
>>
>> I could change the hunk to something like, but that looks ugly.
>>
>> @@ -1010,20 +1010,12 @@ static int __init arm64_init_rmi(void)
>>                   return ret;
>>           }
>>
>> -       ret = rmi_init_metadata();
>> -       if (ret)
>> -               goto out_deactivate;
>> +       if (!rmi_init_metadata() &&
>> !register_memory_notifier(&rmi_memory_nb)) {
>> +               arm64_rmi_is_available = true;
>> +               pr_info("RMI configured\n");
>> +               return 0;
>> +       }
>>
>> -       ret = register_memory_notifier(&rmi_memory_nb);
>> -       if (ret)
>> -               goto out_deactivate;
>> -
>> -       arm64_rmi_is_available = true;
>> -       pr_info("RMI configured\n");
>> -
>> -       return 0;
>> -
>> -out_deactivate:
>>           WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL,
>> SMC_RMI_RMM_DEACTIVATE));
>>           return ret;
>>    }
>>
>>
>> Either ways, we have to cleanup the object on return, no matter
>> the route we take. So the original form is much more readable
>> for me.
> 
> Agree to more readable, but that fragility of mixing __free() and
> goto is a real problem that has tripped many folk up - hence
> the perhaps overly strict guidance.  Rather than avoiding the goto, I'd just
> not use __free()  - go old school and have two labels for errors
> and an extra manual free in the good path.
> 
> 	pr_info("RMI configured\n:);
> 	kfree(sro);
> 
> 	return 0;
> 
> out_deactivate:
> 	WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_DEACTIVATE));
> out_free_sro:
> 	kfree(sro);
> 	return ret;
> }
> 
> Sometime the new toys aren't the right answer.

I have the following hunk on top of this patch, that could do the trick.

diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
index bcdbed26cf08d..4385f49068965 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -1033,20 +1033,19 @@ static int __init arm64_init_rmi(void)
                 return ret;
         }

-       ret = rmi_init_metadata();
-       if (ret)
-               goto out_deactivate;
-
-       ret = register_memory_notifier(&rmi_memory_nb);
-       if (ret)
-               goto out_deactivate;
-
-       arm64_rmi_is_available = true;
-       pr_info("RMI configured\n");
-
-       return 0;
-
-out_deactivate:
+       do {
+               ret = rmi_init_metadata();
+               if (ret)
+                       break;
+               ret = register_memory_notifier(&rmi_memory_nb);
+               if (ret)
+                       break;
+               arm64_rmi_is_available = true;
+               pr_info("RMI configured\n");
+               return 0;
+       } while (0);
+
+       /* De-activate the RMM and reclaim any donated memory */
         WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL, 
SMC_RMI_RMM_DEACTIVATE));
         return ret;

Cheers
Suzuki

> 
> Jonathan
> 
> 
> 
> 
>>
>> Cheers
>> Suzuki
>>
>>>>   
>>>
>>> I will see if I can improve it.
>>>
>>> Cheers
>>> Suzuki
>>>    
>>
> 


