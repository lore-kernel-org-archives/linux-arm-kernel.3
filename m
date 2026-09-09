Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977A3C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9pb4YC9fhpF8TltT/q+1BXFwd5kqkxHnSLfp6Lxj9w=; b=U6c6wVApgC6vWeYjj17EERZ18S
	43sOy0aD2N68DVXvjgEzcVyvgRT/e6NjuQcWhpGqL5iGohHH7kOXbdLySRoUeu4ehopXgocE9Ydh+
	LoVxw4jv0yt1g9VTqtLBlGt5OyAnZ0UTSUnscQxuf/2hIHP624bBMNEyHcnzNCb2tH6ZO7c7b5Mq8
	aRVqrtrWXzd9jhUxllOISvzCSAGXvtsb1BaI0nmFZvhPXFP9t9meaGnUESfXlc1XtCgj+CiTpzaCe
	K+hiLRnbLrJvzDV6+cJNAumEd5cEWCHSgSPDvL5glOG6Hl1kV7dl7EGfxyr4CXynVeJ8gZEAx+nyG
	+b5ZMAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E5j-0000000BCzq-0253;
	Wed, 09 Sep 2026 08:55:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E5g-0000000BCzD-0fdG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:55:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60CB31576;
	Wed,  9 Sep 2026 01:55:31 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66B0E3F7B4;
	Wed,  9 Sep 2026 01:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788944135; bh=lJDJz6lETRllb1wBQU19zV4OLNHqoK3MIQ/bs71SEBo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LZXOxeaghjFTVejUYIz42ta9EdC/XzJtbaXMq7kG5rYlpmWL0I9CHrpcDsUMw5j67
	 5DyX181jUhzTNqnqD+cX0PchoWXiDxLuhN6TGcCTQxw7rTSd4wSUfayizASiLuT7tB
	 xCbp4eyGD/aT2RavQKL3aJGnaTJ6x+WQzEe/PeHM=
Message-ID: <aa928fb0-1aad-4244-8b03-85a87db35dad@arm.com>
Date: Wed, 9 Sep 2026 09:55:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 7/7] firmware: arm_rmm: Add wrappers for Realm related
 RMI commands
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-8-suzuki.poulose@arm.com>
 <de7e2d98-2faa-4e16-8164-d7247d31dbd5@redhat.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <de7e2d98-2faa-4e16-8164-d7247d31dbd5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015536_279320_F8020321 
X-CRM114-Status: GOOD (  17.22  )
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

On 09/09/2026 08:15, Gavin Shan wrote:
> On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
>> From: Steven Price <steven.price@arm.com>
>>
>> Introduce wrappers for the RMI functions needed for creating and
>> managing realm guests. This will be used by the KVM to manage the
>> Realms
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>> Changes since v16:
>>    * Split into a separate patch and move away from arch/arm64 to
>>      include/linux/.
>>    * Also moved into the firmware_rmm series from the KVM CCA support.
>>      This is done in a hope to reduce the merge conflicts and make
>>      the KVM CCA upstreaming in independent parallel chunks
>> ---
>>   include/linux/arm-rmi-cmds.h | 453 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 453 insertions(+)
>>
>> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
>> index 79e2c1f165112..746257d77dd61 100644
>> --- a/include/linux/arm-rmi-cmds.h
>> +++ b/include/linux/arm-rmi-cmds.h
>> @@ -222,4 +222,457 @@ static inline long 
>> rmi_granule_range_undelegate(unsigned long base,
>>       return ret;
>>   }
>> +/**
>> + * rmi_rtt_data_map_init() - Create a protected mapping with data 
>> contents
>                                  
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> s/Create a protected mapping with data contents/Create a mappings in 
> protected IPA with known contents

Ack.

> 
> With this, it's consistently counterpart of the comments for 
> rmi_rtt_data_map().
> 
>
>

...


> 
> The nested if statements can be avoided if we have:
> 
>      if (ret != RMI_SUCCESS)
>          return ret;
> 
>      if (out_top)
>          *out_top = regs.a1;
>      if (out_range)
>          *out_range = regs.a2;
>      if (out_count)
>          *out_count = regs.a3;
> 
>      return RMI_SUCCESS;

Done for all of them.

...
>> +/**
>> + * rmi_realm_activate() - Active a realm
>> + * @rd: PA of the RD
>> + *
>> + * Mark a realm as Active signalling that creation is complete and 
>> allowing
>                                                           ^^^^^^^^
> 
> s/complete/completed ?

I have changed this :

  /**
- * rmi_realm_activate() - Active a realm
+ * rmi_realm_activate() - Activate a realm
   * @rd: PA of the RD
   *
- * Mark a realm as Active signalling that creation is complete and allowing
+ * Mark a realm as Active, signalling that creation is completed, allowing
   * execution of the realm.

Addressed the rest of the comments.

Thank you for your detailed look at the patches, much appreciated !

Cheers
Suzuki

