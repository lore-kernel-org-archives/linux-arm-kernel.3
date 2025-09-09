Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAFFCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUmEz4PSa+ZG++P99ECFpCKNPetArqnrnBcZ+Ce7WEE=; b=Ix29yfr03aIIc84dZNIk6v4ZG0
	bjkZNdpfS/M4poNDYKOLDMIovSBNxPkxUUoko3A80YwFXZYVouzDpgjz8IfyHYhLD3Y9TsgizsTui
	+GmDqPw9DW1viJ/i/Vr/LnBVQ/yGAK0dkmdIML04V4XyMfGdVwxVE/jB1FwCXmTw+smf/9KOolAVR
	eruhRi3WKL3ENxAZVZMgUN9XDiuZZl3q9JG/BrtVbGkCqXQpAl0yYKgC/zzrV0OKgKLMttI5V6oMZ
	4LBCUxREP93xMsh6Byg7qToXsUGpQ2SrWQ14qtVN//8O11dSd6CpExnyS9rVY8oJ77oBlLLzvTkmt
	w/0TzCCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw27M-000000096Y9-05S6;
	Tue, 09 Sep 2025 17:26:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1et-00000008gyR-3tno
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 16:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GUmEz4PSa+ZG++P99ECFpCKNPetArqnrnBcZ+Ce7WEE=; b=kFDtiNmVIsrX7//RvW+LX3qUE+
	obtNAqgPcDr/SpSI6E5GbCaIlk5qS4fJ4UssUU9Ax/AD73vmEuXgMWljVSL/oYYMqiJ+yXpyYPv//
	w+5QdN+XfH/vRYQd0FnLZR/BnD0jSrW3tR//curRHYXR4zibdwx7ddcitAsTFpL1N+gZiLhEFP9W1
	BlRyRnsY3UTWlydAzrznLjS/sbFA0bm4NAK49AjPZihIqzPy1pIpDG9WqBF5wt9qT0KteSYqmiwcl
	DY8SYjBq8BsW8DshJUHNp8Y/ZZfORJl0fpWpxj1y++7dtEz/rY+GCi3fmQr11/QKDxrlFu6uyFa5G
	6BFi3aww==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1eq-00000005RlO-0KLl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:57:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8AB420E3;
	Tue,  9 Sep 2025 09:57:18 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92FA53F694;
	Tue,  9 Sep 2025 09:57:16 -0700 (PDT)
Message-ID: <9c65c518-b4a2-4ac0-bf5d-9bdb8741dcf6@arm.com>
Date: Tue, 9 Sep 2025 17:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/33] arm_mpam: Probe the hardware features resctrl
 supports
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
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
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <17f4507c-c244-42ee-bea0-57ed22e0a05f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_175728_567830_65AD248F 
X-CRM114-Status: GOOD (  14.99  )
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

On 28/08/2025 14:44, Ben Horgan wrote:
> On 8/22/25 16:29, James Morse wrote:
>> Expand the probing support with the control and monitor types
>> we can use with resctrl.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 012e09e80300..290a04f8654f 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -102,7 +102,7 @@ static LLIST_HEAD(mpam_garbage);
>>  
>>  static u32 __mpam_read_reg(struct mpam_msc *msc, u16 reg)
>>  {
>> -	WARN_ON_ONCE(reg > msc->mapped_hwpage_sz);
>> +	WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);

> Update in the patch that introduced this line.

Yeah - this got ripped out.
Now that the size is in the ACPI table, I should never need to debug it being wrong!
(and the resulting translation fault will be enough to say something is wrong)


>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index c6f087f9fa7d..9f6cd4a68cce 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -136,6 +136,56 @@ static inline void mpam_mon_sel_lock_held(struct mpam_msc *msc)

>> +/* Bits for mpam_features_t */
>> +enum mpam_device_features {
>> +	mpam_feat_ccap_part = 0,
>> +	mpam_feat_cpor_part,
>> +	mpam_feat_mbw_part,
>> +	mpam_feat_mbw_min,
>> +	mpam_feat_mbw_max,
>> +	mpam_feat_mbw_prop,
>> +	mpam_feat_msmon,
>> +	mpam_feat_msmon_csu,
>> +	mpam_feat_msmon_csu_capture,
>> +	mpam_feat_msmon_csu_hw_nrdy,
>> +	mpam_feat_msmon_mbwu,
>> +	mpam_feat_msmon_mbwu_capture,
>> +	mpam_feat_msmon_mbwu_rwbw,
>> +	mpam_feat_msmon_mbwu_hw_nrdy,
>> +	mpam_feat_msmon_capt,
>> +	MPAM_FEATURE_LAST,

> This isn't all the features or just the features supported by resctrl.
> Just add them all in this patch?

I'm having trouble parsing this ...

I needed somewhere to split the features up, as there are rather a lot. Those that resctrl
supports seemed like the logical spot.


>> +};
>> +static_assert(BITS_PER_TYPE(mpam_features_t) >= MPAM_FEATURE_LAST);
>> +#define MPAM_ALL_FEATURES      ((1 << MPAM_FEATURE_LAST) - 1)

> Unused?

Fixed, thanks!


Thanks,

James

