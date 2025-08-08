Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2027C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LggQVCeBaM3ZO2P9EdLHGegU0gzsuUBUEGhDmPi3qXQ=; b=I1WcirCfzOaleSTSjRN4psrfRJ
	u1xw1u+4Kl+J1+/TgtYCZw2pK3o7F+i5zzBMP2Q5MxqNbtd2H2QTz9RK1rb+yV1ncA24Pcu97IZz6
	1soBqZVBCtzqbYOmA2S6O8uK1yjYrad4GqXcsAH8fiEauzleVWqZfzRPACR0+LkkFRJTkxD8uuqL8
	G6xvYotzGXn994CP86pXAU8dkwmarJPEdHf9qcnJiiAZGE2jhy3KZfVvHLEq5wv9kvJpeMNyzbsvT
	Vd1nMX7ANy3llZHwpT90jii9CiTCWmaFWnACiMA4AQfvXpzQknYJitIvY2dVLN/4MDHCjP/M0Yqp2
	7vn0EI+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHXX-00000002BwP-2LYq;
	Fri, 08 Aug 2025 07:29:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHJJ-00000002ANA-0hp0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:14:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65A4116F8;
	Fri,  8 Aug 2025 00:14:32 -0700 (PDT)
Received: from [10.57.5.99] (unknown [10.57.5.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53CF43F673;
	Fri,  8 Aug 2025 00:14:35 -0700 (PDT)
Message-ID: <1f77ae63-0495-4af7-a3e7-8968f98ba6d5@arm.com>
Date: Fri, 8 Aug 2025 08:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 27/36] arm_mpam: Allow configuration to be applied and
 restored during cpu online
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-28-james.morse@arm.com>
 <7ab40c09-3922-4e0c-85dd-00ff05be4ce6@arm.com>
Content-Language: en-US
From: James Morse <james.morse@arm.com>
In-Reply-To: <7ab40c09-3922-4e0c-85dd-00ff05be4ce6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_001441_301294_10E97B03 
X-CRM114-Status: GOOD (  18.54  )
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

Hi Ben,

On 28/07/2025 12:59, Ben Horgan wrote:
> On 7/11/25 19:36, James Morse wrote:
>> When CPUs come online the original configuration should be restored.
>> Once the maximum partid is known, allocate an configuration array for
>> each component, and reprogram each RIS configuration from this.
>>
>> The MPAM spec describes how multiple controls can interact. To prevent
>> this happening by accident, always reset controls that don't have a
>> valid configuration. This allows the same helper to be used for
>> configuration and reset.
>> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/
>> mpam_devices.c
>> index bb3695eb84e9..f3ecfda265d2 100644
>> --- a/drivers/platform/arm64/mpam/mpam_devices.c
>> +++ b/drivers/platform/arm64/mpam/mpam_devices.c
>>   @@ -1000,10 +1041,38 @@ static void mpam_reset_msc(struct mpam_msc *msc, bool online)
>>            */
>>           ris->in_reset_state = online;
>>       }
>> -    srcu_read_unlock(&mpam_srcu, idx);
>>       mpam_mon_sel_outer_unlock(msc);
>>   }
>>   +static void mpam_reprogram_msc(struct mpam_msc *msc)
>> +{
>> +    int idx;
>> +    u16 partid;
>> +    bool reset;
>> +    struct mpam_config *cfg;
>> +    struct mpam_msc_ris *ris;
>> +
>> +    idx = srcu_read_lock(&mpam_srcu);
>> +    list_for_each_entry_rcu(ris, &msc->ris, msc_list) {
>> +        if (!mpam_is_enabled() && !ris->in_reset_state) {
>> +            mpam_touch_msc(msc, &mpam_reset_ris, ris);
>> +            ris->in_reset_state = true;
>> +            continue;
>> +        }
>> +
>> +        reset = true;
>> +        for (partid = 0; partid <= mpam_partid_max; partid++) {
> Do we need to consider 'partid_max_lock' here?

The lock is only needed while those parameters can change, due to a race with mpam_register_requestor(). Once mpam_enabled()
has been called, the values can't change, so the lock is redundant.

In this case, its relying on mpam_cpu_online() only ever being the cpuhp callback once partid_max_published has been set.

I'll add a comment.


>> +            cfg = &ris->vmsc->comp->cfg[partid];
>> +            if (cfg->features)
>> +                reset = false;
>> +
>> +            mpam_reprogram_ris_partid(ris, partid, cfg);
>> +        }
>> +        ris->in_reset_state = reset;
>> +    }
>> +    srcu_read_unlock(&mpam_srcu, idx);
>> +}
>> +
>>   static void _enable_percpu_irq(void *_irq)
>>   {
>>       int *irq = _irq;
>   @@ -1806,6 +1875,43 @@ static void mpam_unregister_irqs(void)
>>       cpus_read_unlock();
>>   }
>>   +static void __destroy_component_cfg(struct mpam_component *comp)
>> +{
>> +    add_to_garbage(comp->cfg);
>> +}
>> +
>> +static int __allocate_component_cfg(struct mpam_component *comp)
>> +{
>> +    if (comp->cfg)
>> +        return 0;
>> +
>> +    comp->cfg = kcalloc(mpam_partid_max + 1, sizeof(*comp->cfg), GFP_KERNEL);
> And here?

Aha, that is a good one - the configuration should be allocated after the partid values are fixed. Currently its done by
the same function, but not in the right order.


>> +    if (!comp->cfg)
>> +        return -ENOMEM;
>> +    init_garbage(comp->cfg);
>> +
>> +    return 0;
>> +}
>> +
>> +static int mpam_allocate_config(void)
>> +{
>> +    int err = 0;
>> +    struct mpam_class *class;
>> +    struct mpam_component *comp;
>> +
>> +    lockdep_assert_held(&mpam_list_lock);
>> +
>> +    list_for_each_entry(class, &mpam_classes, classes_list) {
>> +        list_for_each_entry(comp, &class->components, class_list) {
>> +            err = __allocate_component_cfg(comp);
>> +            if (err)
>> +                return err;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static void mpam_enable_once(void)
>>   {
>>       int err;
>> @@ -1817,12 +1923,21 @@ static void mpam_enable_once(void)
>>        */
>>       cpus_read_lock();
>>       mutex_lock(&mpam_list_lock);
>> -    mpam_enable_merge_features(&mpam_classes);
>> +    do {
>> +        mpam_enable_merge_features(&mpam_classes);
>>   -    err = mpam_register_irqs();
>> -    if (err)
>> -        pr_warn("Failed to register irqs: %d\n", err);
>> +        err = mpam_allocate_config();
>> +        if (err) {
>> +            pr_err("Failed to allocate configuration arrays.\n");
>> +            break;
>> +        }
>>   +        err = mpam_register_irqs();
>> +        if (err) {
>> +            pr_warn("Failed to register irqs: %d\n", err);
>> +            break;
>> +        }
>> +    } while (0);
>>       mutex_unlock(&mpam_list_lock);
>>       cpus_read_unlock();
>>   @@ -1861,6 +1976,8 @@ static void mpam_reset_component_locked(struct mpam_component
>> *comp)
>>       might_sleep();
>>       lockdep_assert_cpus_held();
>>   +    memset(comp->cfg, 0, (mpam_partid_max * sizeof(*comp->cfg)));
> And here?

Same story, and the same bug - the disable path can be called and reach this before the partid size has been fixed. The
code that enables interrupts should pull that earlier in mpam_enable_once, which would simplify all of these.



Thanks,

James

