Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C0BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Awwesm3WdGTQ342y1fdRIojrKuPgPaPYEIbsEmlVRRQ=; b=yLooBefsobjG8zXbO/Un8217dA
	czxUBGR9y/DFZIa0t3ePBm2xNwUUfIc/0DVXzi5q4ZypwHmUUxeVIK7seXMuPp+UZn3YXcRbMoApo
	Tt7rvYbQ8lxsjk2Uk04fpY7DeonveQ3+3Y055Hna02f7rgtbiHPySi7bkNXoYZHclS8we7NXYroOA
	toMKQLWo3nvdNrJ3V7ukVqH82cPk2AmBRe1xyfu+Qx5jSHpWpPmWzSnK9pnKRiUuDajJmbq/bqE5p
	j5qchVXE7z1YxjuuozI9xnX5/8xabj7mSMero0oyeGrrubiOSXi0SXqnEpbuWH7KSPDCi8A5uh7N5
	aNM5CF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHev-00000002DSI-3rGh;
	Fri, 08 Aug 2025 07:37:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHNn-00000002Aww-46xD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:19:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D96316F8;
	Fri,  8 Aug 2025 00:19:11 -0700 (PDT)
Received: from [10.57.5.99] (unknown [10.57.5.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29FC33F673;
	Fri,  8 Aug 2025 00:19:12 -0700 (PDT)
Message-ID: <ac2cea6e-db7e-4783-9d97-45ad16811f50@arm.com>
Date: Fri, 8 Aug 2025 08:19:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 33/36] arm_mpam: Use long MBWU counters if supported
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
 <20250711183648.30766-34-james.morse@arm.com>
 <b0e5db1b-e4cc-4f11-a81d-40f942eff78d@arm.com>
Content-Language: en-US
From: James Morse <james.morse@arm.com>
In-Reply-To: <b0e5db1b-e4cc-4f11-a81d-40f942eff78d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_001920_102504_06CFE381 
X-CRM114-Status: GOOD (  16.25  )
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

On 28/07/2025 14:46, Ben Horgan wrote:
> On 7/11/25 19:36, James Morse wrote:
>> From: Rohit Mathew <rohit.mathew@arm.com>
>>
>> If the 44 bit (long) or 63 bit (LWD) counters are detected on probing
>> the RIS, use long/LWD counter instead of the regular 31 bit mbwu
>> counter.
>>
>> Only 32bit accesses to the MSC are required to be supported by the
>> spec, but these registers are 64bits. The lower half may overflow
>> into the higher half between two 32bit reads. To avoid this, use
>> a helper that reads the top half twice to check for overflow.

> Slightly misleading as it may be read up to 4 times.

Meh - its referring to the high/low/high pattern. Sure if it fails you go round the whole
thing again. I'll change it 'read multiple times to check for overflow'.


>> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/
>> mpam_devices.c
>> index 774137a124f8..ace69ac2d0ee 100644
>> --- a/drivers/platform/arm64/mpam/mpam_devices.c
>> +++ b/drivers/platform/arm64/mpam/mpam_devices.c
>> @@ -1125,10 +1177,24 @@ static void __ris_msmon_read(void *arg)
>>           now = FIELD_GET(MSMON___VALUE, now);
>>           break;
>>       case mpam_feat_msmon_mbwu:
>> -        now = mpam_read_monsel_reg(msc, MBWU);
>> -        if (mpam_has_feature(mpam_feat_msmon_mbwu_hw_nrdy, rprops))
>> -            nrdy = now & MSMON___NRDY;
>> -        now = FIELD_GET(MSMON___VALUE, now);
>> +        /*
>> +         * If long or lwd counters are supported, use them, else revert
>> +         * to the 32 bit counter.
>> +         */
> 32 bit counter -> 31 bit counter

Sure,


>> +        if (mpam_ris_has_mbwu_long_counter(ris)) {
>> +            now = mpam_msc_read_mbwu_l(msc);
>> +            if (mpam_has_feature(mpam_feat_msmon_mbwu_hw_nrdy, rprops))
>> +                nrdy = now & MSMON___NRDY_L;
>> +            if (mpam_has_feature(mpam_feat_msmon_mbwu_63counter, rprops))
>> +                now = FIELD_GET(MSMON___LWD_VALUE, now);
>> +            else
>> +                now = FIELD_GET(MSMON___L_VALUE, now);
>> +        } else {
>> +            now = mpam_read_monsel_reg(msc, MBWU);
>> +            if (mpam_has_feature(mpam_feat_msmon_mbwu_hw_nrdy, rprops))
>> +                nrdy = now & MSMON___NRDY;
>> +            now = FIELD_GET(MSMON___VALUE, now);
>> +        }
>>             if (nrdy)
>>               break;

>> diff --git a/drivers/platform/arm64/mpam/mpam_internal.h b/drivers/platform/arm64/mpam/
>> mpam_internal.h
>> index fc705801c1b6..4553616f2f67 100644
>> --- a/drivers/platform/arm64/mpam/mpam_internal.h
>> +++ b/drivers/platform/arm64/mpam/mpam_internal.h
>> @@ -674,7 +675,10 @@ int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32
>> cache_level,
>>    */
>>   #define MSMON___VALUE          GENMASK(30, 0)
>>   #define MSMON___NRDY           BIT(31)
>> -#define MSMON_MBWU_L_VALUE     GENMASK(62, 0)
>> +#define MSMON___NRDY_L        BIT(63)
>> +#define MSMON___L_VALUE        GENMASK(43, 0)
>> +#define MSMON___LWD_VALUE    GENMASK(62, 0)
>> +
> As mentioned on an earlier patch. These could be added with all the other register
> definition.

Yup,


Thanks,

James

