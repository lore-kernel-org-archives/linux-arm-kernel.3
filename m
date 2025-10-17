Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E8DCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSKG3+LOqoDLLdUUbMkH75kmZOMHDvW8qoEPjpJ6i68=; b=4aTfFtax51B349d/Ud2lA8eatl
	KS0sBHyz0f6ct/Z8+DweaVyRQk6fZQ6Z8t1XEJmiIXYrsJgocix3LUVYHGtmi6z0KcdfpqZ6iz9iV
	+JHtYUCBcS6Ovwa30Szy/ymrefriPb5dlA+kTMt2MJ0XIq4ZdBjfN58lkiirYMwv4ZN1NRhiYDfqN
	rqa9kaPr3aYojV7Ot5Rgc52mjku0z4lDx/F9nMchESVJVqp5WVodngipAT1fCb+8u1H9u6iRAwCo0
	eZslDlm+fcSLdMcL4kyqZpB7Mmk98vZQAaXvhnUm249oPc7WOiKNJyeWYPUmatyugfqOBkc0xPKLK
	NMLPWCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pXX-00000008i5W-3Yk2;
	Fri, 17 Oct 2025 18:50:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pXU-00000008i4r-3Qe5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:50:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 930301515;
	Fri, 17 Oct 2025 11:50:45 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90E0B3F6A8;
	Fri, 17 Oct 2025 11:50:48 -0700 (PDT)
Message-ID: <72750912-ed50-4a1b-8c43-455a7bc9efc1@arm.com>
Date: Fri, 17 Oct 2025 19:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/29] arm_mpam: Reset MSC controls from cpu hp
 callbacks
To: Fenghua Yu <fenghuay@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-16-james.morse@arm.com>
 <1f084a23-7211-4291-99b6-7f5192fb9096@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <1f084a23-7211-4291-99b6-7f5192fb9096@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_115056_918726_A9766C6F 
X-CRM114-Status: GOOD (  15.68  )
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

Hi Fenghua,

On 05/10/2025 21:43, Fenghua Yu wrote:
> Hi, James,
> 
> On 9/10/25 13:42, James Morse wrote:
>> When a CPU comes online, it may bring a newly accessible MSC with
>> it. Only the default partid has its value reset by hardware, and
>> even then the MSC might not have been reset since its config was
>> previously dirtyied. e.g. Kexec.
> 
> typo: s/dirtyied/dirtied/
> 
> 
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
>>
>> CC: Rohit Mathew<Rohit.Mathew@arm.com>
>> Signed-off-by: James Morse<james.morse@arm.com>
> 
> Other than the minor comments,
> 
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks,


> [SNIP]
>> +static void mpam_reset_ris(struct mpam_msc_ris *ris)
>> +{
>> +    u16 partid, partid_max;
>> +
>> +    mpam_assert_srcu_read_lock_held();
>> +
>> +    if (ris->in_reset_state)
>> +        return;
>> +
>> +    spin_lock(&partid_max_lock);
>> +    partid_max = mpam_partid_max;
>> +    spin_unlock(&partid_max_lock);
>> +    for (partid = 0; partid < partid_max; partid++)
> 
>  * Should partid_max be inclusive? So it's "partid < partid_max + 1" here?
> 
> MPAM spec says max PARTID is inclusive: "The range of valid PARTIDs is 0 to the maximum
> PARTID, inclusive. The maximum values of a PARTID implemented by different MSCs need not
> be the same".

Hmmm, if partid_max is 0 then this loop should run only once, so yet.


Thanks,

James

