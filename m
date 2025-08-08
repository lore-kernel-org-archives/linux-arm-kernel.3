Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82132C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkNu/0dfKECvSuSdN1MAJAMUO4PgAAHpTaoPONsJRV4=; b=LtO/14joC8yFFqc11rGsC2PkXg
	uzSSDHGXAwjHM7jEX/w0Mi1EHaE/tiySC0HtC71+UD3h+Bl5hHXyv/05Epqeenp5MpBlYYpCULROl
	RetJyyFGKZCfIqTYP2Q5X9T5KmhI2GqDuvWfgLqtu7dHzd0h3JVPsAERqHrT3/poFwEG6irLYF06K
	x/sV8+VjqiZA5iz/aYsnhpmocPE1UkhwrsbVp8Pcj5PioccijWTqbpfaPHZOo6A/dRpAfxvKYyalR
	TMU+ueL4jaD9bJhEZ2AP6ASVdZzP6SVNXVGxWzPrbsw07mW++VMjij7jx08gps8bS6L2aQcFMvQEn
	o6egSHfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHDt-000000029pk-1GlJ;
	Fri, 08 Aug 2025 07:09:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHBO-000000029S5-3c4B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:06:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 961C016F8;
	Fri,  8 Aug 2025 00:06:21 -0700 (PDT)
Received: from [10.57.5.99] (unknown [10.57.5.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03FED3F673;
	Fri,  8 Aug 2025 00:05:53 -0700 (PDT)
Message-ID: <0936f322-30a4-4026-8db0-208514cc9742@arm.com>
Date: Fri, 8 Aug 2025 08:05:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 22/36] arm_mpam: Reset MSC controls from cpu hp
 callbacks
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
 <20250711183648.30766-23-james.morse@arm.com>
 <b69f7207-84b3-424f-b675-b423c56e5dcd@arm.com>
Content-Language: en-US
From: James Morse <james.morse@arm.com>
In-Reply-To: <b69f7207-84b3-424f-b675-b423c56e5dcd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_000630_981172_9B19E552 
X-CRM114-Status: GOOD (  19.17  )
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

On 28/07/2025 10:49, Ben Horgan wrote:
> On 7/11/25 19:36, James Morse wrote:
>> When a CPU comes online, it may bring a newly accessible MSC with
>> it. Only the default partid has its value reset by hardware, and
>> even then the MSC might not have been reset since its config was
>> previously dirtyied. e.g. Kexec.
>>
>> Any in-use partid must have its configuration restored, or reset.
>> In-use partids may be held in caches and evicted later.
>>
>> MSC are also reset when CPUs are taken offline to cover cases where
>> firmware doesn't reset the MSC over reboot using UEFI, or kexec
>> where there is no firmware involvement.
>>
>> If the configuration for a RIS has not been touched since it was
>> brought online, it does not need resetting again.
>>
>> To reset, write the maximum values for all discovered controls.
>> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/
>> mpam_devices.c
>> index 7b042a35405a..d014dbe0ab96 100644
>> --- a/drivers/platform/arm64/mpam/mpam_devices.c
>> +++ b/drivers/platform/arm64/mpam/mpam_devices.c

>> @@ -849,8 +850,116 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>>       return 0;
>>   }
>>   +static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
>> +{
>> +    u32 num_words, msb;
>> +    u32 bm = ~0;
>> +    int i;
>> +
>> +    lockdep_assert_held(&msc->part_sel_lock);
>> +
>> +    if (wd == 0)
>> +        return;
>> +
>> +    /*
>> +     * Write all ~0 to all but the last 32bit-word, which may
>> +     * have fewer bits...
>> +     */
>> +    num_words = DIV_ROUND_UP(wd, 32);
>> +    for (i = 0; i < num_words - 1; i++, reg += sizeof(bm))
>> +        __mpam_write_reg(msc, reg, bm);
>> +
>> +    /*
>> +     * ....and then the last (maybe) partial 32bit word. When wd is a
>> +     * multiple of 32, msb should be 31 to write a full 32bit word.
>> +     */
>> +    msb = (wd - 1) % 32;
>> +    bm = GENMASK(msb, 0);
>> +    if (bm)
>> +        __mpam_write_reg(msc, reg, bm);
> Drop the 'if' as the 0 bit will always be part of the mask.

Yup, this was a harmless leftover of the versions that tried to optionally write the left over bits.


>>   @@ -1419,7 +1541,7 @@ static void mpam_enable_once(void)
>>       mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline);
>>         printk(KERN_INFO "MPAM enabled with %u partid and %u pmg\n",
>> -           mpam_partid_max + 1, mpam_pmg_max + 1);
>> +        READ_ONCE(mpam_partid_max) + 1, mpam_pmg_max + 1);
> 
> Belongs in 'arm_mpam: Probe MSCs to find the supported partid/pmg values'.

That value is now protected by a lock, and can't change at this point, so it no longer needs the READ_ONCE() anyway.


Thanks,

James

