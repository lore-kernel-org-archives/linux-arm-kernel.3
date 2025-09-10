Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A52CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v48lgXJ6u9qvj0Fr+uGtR+AAM94iWt42qJRoz3Cna78=; b=hjjLkWMDp5fuMQ02pWHxgu7zOw
	1u94+p31IpsC5xd59/jYAfn9ShVX2k9qYGWcTsM55MMwE/UOwURIVaxCdI+xM4csEkNY911n52etC
	qZpWyTIruVgoveL05hUI77lfYRFYmN3AKNtqSiB2CwUiBbORRK6IR3aR4sqIHukbM2HPjjX12fU11
	cAmQWKpOC1Sl8hZl901id2KT30gNJp7nsAf1XIqmCsu4IKZY4Z45McGDnWC/9UBoWdVKblpSbW9Nt
	l517OXn4J4th9on0s1iu9XKV7O8IGodYgG0P94uIjZtW8hUTltLL8aRcNl/CAA55oIPZ8b+cAdSdg
	GDrwqx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGs1-0000000D97A-1VmI;
	Wed, 10 Sep 2025 09:12:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGrz-0000000D96b-0M6T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 09:12:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBAA516F8;
	Wed, 10 Sep 2025 02:11:53 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F28353F63F;
	Wed, 10 Sep 2025 02:11:56 -0700 (PDT)
Message-ID: <cefaff01-5e74-44b1-96aa-bb0c490f1ce3@arm.com>
Date: Wed, 10 Sep 2025 10:11:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/33] arm_mpam: Probe the hardware features resctrl
 supports
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-18-james.morse@arm.com>
 <17f4507c-c244-42ee-bea0-57ed22e0a05f@arm.com>
 <9c65c518-b4a2-4ac0-bf5d-9bdb8741dcf6@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <9c65c518-b4a2-4ac0-bf5d-9bdb8741dcf6@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_021203_252135_909072E9 
X-CRM114-Status: GOOD (  20.71  )
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

Hi James,

On 9/9/25 17:57, James Morse wrote:
> Hi Ben,
> 
> On 28/08/2025 14:44, Ben Horgan wrote:
>> On 8/22/25 16:29, James Morse wrote:
>>> Expand the probing support with the control and monitor types
>>> we can use with resctrl.
> 
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>> index 012e09e80300..290a04f8654f 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -102,7 +102,7 @@ static LLIST_HEAD(mpam_garbage);
>>>  
>>>  static u32 __mpam_read_reg(struct mpam_msc *msc, u16 reg)
>>>  {
>>> -	WARN_ON_ONCE(reg > msc->mapped_hwpage_sz);
>>> +	WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);
> 
>> Update in the patch that introduced this line.
> 
> Yeah - this got ripped out.
> Now that the size is in the ACPI table, I should never need to debug it being wrong!
> (and the resulting translation fault will be enough to say something is wrong)
> 
> 
>>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>>> index c6f087f9fa7d..9f6cd4a68cce 100644
>>> --- a/drivers/resctrl/mpam_internal.h
>>> +++ b/drivers/resctrl/mpam_internal.h
>>> @@ -136,6 +136,56 @@ static inline void mpam_mon_sel_lock_held(struct mpam_msc *msc)
> 
>>> +/* Bits for mpam_features_t */
>>> +enum mpam_device_features {
>>> +	mpam_feat_ccap_part = 0,
>>> +	mpam_feat_cpor_part,
>>> +	mpam_feat_mbw_part,
>>> +	mpam_feat_mbw_min,
>>> +	mpam_feat_mbw_max,
>>> +	mpam_feat_mbw_prop,
>>> +	mpam_feat_msmon,
>>> +	mpam_feat_msmon_csu,
>>> +	mpam_feat_msmon_csu_capture,
>>> +	mpam_feat_msmon_csu_hw_nrdy,
>>> +	mpam_feat_msmon_mbwu,
>>> +	mpam_feat_msmon_mbwu_capture,
>>> +	mpam_feat_msmon_mbwu_rwbw,
>>> +	mpam_feat_msmon_mbwu_hw_nrdy,
>>> +	mpam_feat_msmon_capt,
>>> +	MPAM_FEATURE_LAST,
> 
>> This isn't all the features or just the features supported by resctrl.
>> Just add them all in this patch?
> 
> I'm having trouble parsing this ...
> 
> I needed somewhere to split the features up, as there are rather a lot. Those that resctrl
> supports seemed like the logical spot.

I don't think resctrl doesn't support ccap, mpam_feat_ccap_part.
Possibly the point is that this is split into more detailed features
later but that's not clear from this patch or commit message.

> 
> 
>>> +};
>>> +static_assert(BITS_PER_TYPE(mpam_features_t) >= MPAM_FEATURE_LAST);
>>> +#define MPAM_ALL_FEATURES      ((1 << MPAM_FEATURE_LAST) - 1)
> 
>> Unused?
> 
> Fixed, thanks!
> 
> 
> Thanks,
> 
> James

Thanks,

Ben


