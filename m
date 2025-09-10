Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5237CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+phvW+KKmKqe7pZ72xZlaqj4jT21NwccEQ06HVMCK4=; b=bRM5Ox4Z4IzaPAWDfR7M4/9pVF
	fVMrpNL2Mpogpv0y+1o2QLHqlBuwBEZ1QW+bKMVQAayGXdaBJO3T3RdBR+KAX6Z3v6YnJSScFRqjk
	OibNZbDjRdastcgtQ3ZKa0R9Gk9u4mtbbaqArgUyD3MT5DM8UXwSKjlQY70N6CUUY3P4Wtca7LDcC
	yBrwb3CZPw3y+IRzZsMopizqDm0TzvcaU/G9EdEVoDqARSEVzNxn/vYIUdW9ncB++wvn4/g7DZAAU
	uZQR1rK/oetRq7viqQ6Mod5A34dXl93oO7LHgKPZXjBRMOXyo6Lyg8U/P7mX/rTvmvXSrr170mp++
	vC0d3GxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGhV-0000000D66p-3ehg;
	Wed, 10 Sep 2025 09:01:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGhS-0000000D63l-0lJL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 09:01:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D26316F8;
	Wed, 10 Sep 2025 02:00:58 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8718D3F63F;
	Wed, 10 Sep 2025 02:01:01 -0700 (PDT)
Message-ID: <e8d05e0f-044f-485d-8630-1c4ec48b8032@arm.com>
Date: Wed, 10 Sep 2025 10:01:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/33] arm_mpam: Probe MSCs to find the supported
 partid/pmg values
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
 <20250822153048.2287-16-james.morse@arm.com>
 <507919cd-a6d0-42b7-8721-d35f232edfa5@arm.com>
 <cbc2a9e2-4919-4ade-9d1b-afd0464f43bf@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <cbc2a9e2-4919-4ade-9d1b-afd0464f43bf@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_020110_352955_833F76BA 
X-CRM114-Status: GOOD (  19.54  )
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

On 9/9/25 17:56, James Morse wrote:
> Hi Ben,
> 
> On 28/08/2025 14:12, Ben Horgan wrote:
>> On 8/22/25 16:29, James Morse wrote:
>>> CPUs can generate traffic with a range of PARTID and PMG values,
>>> but each MSC may have its own maximum size for these fields.
>>> Before MPAM can be used, the driver needs to probe each RIS on
>>> each MSC, to find the system-wide smallest value that can be used.
>>>
>>> While doing this, RIS entries that firmware didn't describe are create
>>> under MPAM_CLASS_UNKNOWN.
>>>
>>> While we're here, implement the mpam_register_requestor() call
>>> for the arch code to register the CPU limits. Future callers of this
>>> will tell us about the SMMU and ITS.
> 
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>> index 9d6516f98acf..012e09e80300 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -106,6 +116,74 @@ static inline u32 _mpam_read_partsel_reg(struct mpam_msc *msc, u16 reg)
> 
>>> +int mpam_register_requestor(u16 partid_max, u8 pmg_max)
>>> +{
>>> +	int err = 0;
>>> +
>>> +	lockdep_assert_irqs_enabled();
>>> +
>>> +	spin_lock(&partid_max_lock);
>>> +	if (!partid_max_init) {
>>> +		mpam_partid_max = partid_max;
>>> +		mpam_pmg_max = pmg_max;
>>> +		partid_max_init = true;
>>> +	} else if (!partid_max_published) {
>>> +		mpam_partid_max = min(mpam_partid_max, partid_max);
>>> +		mpam_pmg_max = min(mpam_pmg_max, pmg_max);
> 
>> Do we really need to reduce these maximum here? If, say, we add an SMMU
>> requester which supports fewer partids than the cpus don't we want to be
>> able to carry on using those partids from the cpus. In this case the
>> SMMU requestor can, without risk of error interrupts, just use all the
>> partids it supports.
> 
> How would it do that?
> 
> We're probably going to expose that SMMU, or the devices behind it, via resctrl. You can
> create 10 control groups in resctrl - but can't assign the SMMU/devices to the last two
> because it doesn't actually support that many...


Ok. If that's how it's going to be exposed to the user then it make sense.

> 
> 
> Thanks,
> 
> James

Thanks,

Ben


