Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C8ECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 09:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLp8t+mlIcUHsTkDrUMPS/0VTfEVeAs1Db+TVve49B8=; b=RzPSslnUaXEY20UzcdoG8dLgfH
	GZX5jm3pPsnpm0qRrObkBL7XYQTG2LoqhbU5FoTWcYKH+7Tgsj16ZltxmqiEMMmyU7LFnS68Wogkn
	SfzD6w3sv38Qv2dPppJdtPS18ogEmXjaZ7glbgHDuWbC+/nhA281/mVRN3RPM1SaBwsWZ4chMdXEm
	Cb8agP6oNIBWl3zXagCdQvyCABqMY8Il/nLoWYqF+5/nzrVhh9FPXThFCXFzTCIyvbUjGStabGsPJ
	AiezHGfR/Al0uOypn4cd/NSkBcVjQodi9jYKy+lo4sIR3LE0yLvlgMemsywfFEdt3H6kH5pnAXyfx
	VnJ43FLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkhz-00000006qdL-1xx7;
	Tue, 11 Nov 2025 09:30:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkhx-00000006qcV-0RZH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 09:30:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DD9F2F;
	Tue, 11 Nov 2025 01:30:28 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48B9D3F66E;
	Tue, 11 Nov 2025 01:30:31 -0800 (PST)
Message-ID: <58e6a323-5c14-4c64-acb5-84bb8679404a@arm.com>
Date: Tue, 11 Nov 2025 09:30:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/33] arm_mpam: Probe hardware to find the supported
 partid/pmg values
To: Gavin Shan <gshan@redhat.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-15-ben.horgan@arm.com>
 <7d0c73d3-1943-469f-813a-eba1dac38d4a@redhat.com>
 <33f9822a-fbb5-47e1-ab5c-97b30511a97f@redhat.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <33f9822a-fbb5-47e1-ab5c-97b30511a97f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_013037_519797_60043C7D 
X-CRM114-Status: GOOD (  17.70  )
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

On 11/10/25 23:26, Gavin Shan wrote:
> Hi Ben,
> 
> On 11/9/25 10:43 AM, Gavin Shan wrote:
>> On 11/7/25 10:34 PM, Ben Horgan wrote:
>>> From: James Morse <james.morse@arm.com>
>>>
>>> CPUs can generate traffic with a range of PARTID and PMG values,
>>> but each MSC may also have its own maximum size for these fields.
>>> Before MPAM can be used, the driver needs to probe each RIS on
>>> each MSC, to find the system-wide smallest value that can be used.
>>> The limits from requestors (e.g. CPUs) also need taking into account.
>>>
>>> While doing this, RIS entries that firmware didn't describe are created
>>> under MPAM_CLASS_UNKNOWN.
>>>
>>> This adds the low level MSC write accessors.
>>>
>>> While we're here, implement the mpam_register_requestor() call
>>> for the arch code to register the CPU limits. Future callers of this
>>> will tell us about the SMMU and ITS.
>>>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
>>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>>> Tested-by: Peter Newman <peternewman@google.com>
>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>> ---
>>> Changes since v3:
>>>  From Jonathan:
>>> Stray comma in printk
>>> Unnecessary braces
>>> ---
>>>   drivers/resctrl/mpam_devices.c  | 148 +++++++++++++++++++++++++++++++-
>>>   drivers/resctrl/mpam_internal.h |   6 ++
>>>   include/linux/arm_mpam.h        |  14 +++
>>>   3 files changed, 167 insertions(+), 1 deletion(-)
[...]
>>>   static int mpam_msc_hw_probe(struct mpam_msc *msc)
>>>   {
>>>       u64 idr;
>>> +    u16 partid_max;
>>> +    u8 ris_idx, pmg_max;
>>> +    struct mpam_msc_ris *ris;
>>>       struct device *dev = &msc->pdev->dev;
>>>       lockdep_assert_held(&msc->probe_lock);
>>> @@ -464,6 +564,40 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>>>           return -EIO;
>>>       }
>>> +    /* Grab an IDR value to find out how many RIS there are */
>>> +    mutex_lock(&msc->part_sel_lock);
>>> +    idr = mpam_msc_read_idr(msc);
>>> +    mutex_unlock(&msc->part_sel_lock);
>>> +
>>> +    msc->ris_max = FIELD_GET(MPAMF_IDR_RIS_MAX, idr);
>>> +
>>> +    /* Use these values so partid/pmg always starts with a valid
>>> value */
>>> +    msc->partid_max = FIELD_GET(MPAMF_IDR_PARTID_MAX, idr);
>>> +    msc->pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
>>> +
>>> +    for (ris_idx = 0; ris_idx <= msc->ris_max; ris_idx++) {
>>> +        mutex_lock(&msc->part_sel_lock);
>>> +        __mpam_part_sel(ris_idx, 0, msc);
>>> +        idr = mpam_msc_read_idr(msc);
>>> +        mutex_unlock(&msc->part_sel_lock);
>>> +
>>> +        partid_max = FIELD_GET(MPAMF_IDR_PARTID_MAX, idr);
>>> +        pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
>>> +        msc->partid_max = min(msc->partid_max, partid_max);
>>> +        msc->pmg_max = min(msc->pmg_max, pmg_max);
>>> +
>>> +        mutex_lock(&mpam_list_lock);
>>> +        ris = mpam_get_or_create_ris(msc, ris_idx);
>>> +        mutex_unlock(&mpam_list_lock);
>>> +        if (IS_ERR(ris))
>>> +            return PTR_ERR(ris);
>>> +    }
>>> +
>>> +    spin_lock(&partid_max_lock);
>>> +    mpam_partid_max = min(mpam_partid_max, msc->partid_max);
>>> +    mpam_pmg_max = min(mpam_pmg_max, msc->pmg_max);
>>> +    spin_unlock(&partid_max_lock);
>>> +
> 
> mpam_register_requestor() could be used here to avoid the capacities
> (maximal PARTIDs and PMGs) are unexpectedly lowered.
> 

I agree that this is somewhat surprising that without a requestor the
driver supports 1 PARTID and 1 PMG, but it is intentional behaviour. The
driver is only intended to be fully functional when a requestor
(external to this base driver) registers itself and I don't want to add
a dual meaning to this registration. This will be more obvious once the
rest of the mpam support is added.

Thanks,

Ben


