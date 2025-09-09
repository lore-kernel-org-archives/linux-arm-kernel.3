Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE768CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQj/5jlTkw/Bib4wvpo/RLsws32kvsO/DxizhOAyfck=; b=cMIjf17lBvIC88VvfJnIVXZaiA
	DNITAMuRVGBJGlJ+9SC9RKnlOgBHm+cD/wFqvPXpXySuNQL1EP7krk6yLSjoTr6HuPuTmpXCPD9w9
	Y0wgkafBqOTlVncQGs9sIU4z61MlY82ICnZt6nhhB3K/5boHlQ6mE3X28qMONt/f6RJP4j4UyjIi5
	Mo6sr+WfnNlXTVv4o8gP7rOvD1eiebFBkLIWwb/y4fPICU8vdqmn3MutRMsqq33nrfdH1FcOTvq2M
	8gTUJNSsDdz1458wdUCG/CTwLjpcemCSFQtQQK8Ir4aK+gat8aw50Fs4dlqUmqE7GU6nQghKvi/0i
	ckO9RA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw27U-000000096n7-0ZBj;
	Tue, 09 Sep 2025 17:27:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1fY-00000008hEz-0tnL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:58:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33B1715A1;
	Tue,  9 Sep 2025 09:58:03 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75FF03F694;
	Tue,  9 Sep 2025 09:58:05 -0700 (PDT)
Message-ID: <fb2f66b4-89ea-4b1f-b5d5-30bf0be8d822@arm.com>
Date: Tue, 9 Sep 2025 17:58:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/33] arm_mpam: Extend reset logic to allow devices to be
 reset any time
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
 <20250822153048.2287-22-james.morse@arm.com>
 <c2a814d6-e235-4589-bdb0-63d08d4ca008@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <c2a814d6-e235-4589-bdb0-63d08d4ca008@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_095812_382332_87C1178A 
X-CRM114-Status: GOOD (  17.15  )
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

On 29/08/2025 15:30, Ben Horgan wrote:
> On 8/22/25 16:30, James Morse wrote:
>> cpuhp callbacks aren't the only time the MSC configuration may need to
>> be reset. Resctrl has an API call to reset a class.
>> If an MPAM error interrupt arrives it indicates the driver has
>> misprogrammed an MSC. The safest thing to do is reset all the MSCs
>> and disable MPAM.
>>
>> Add a helper to reset RIS via their class. Call this from mpam_disable(),
>> which can be scheduled from the error interrupt handler.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 759244966736..3516cbe8623e 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1569,6 +1567,66 @@ static void mpam_enable_once(void)

>> +/*
>> + * Called in response to an error IRQ.
>> + * All of MPAMs errors indicate a software bug, restore any modified
>> + * controls to their reset values.
>> + */
>> +void mpam_disable(void)
>> +{
>> +	int idx;
>> +	struct mpam_class *class;
>> +
>> +	idx = srcu_read_lock(&mpam_srcu);
>> +	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
>> +				 srcu_read_lock_held(&mpam_srcu))
> 
> Why do you use list_for_each_entry_srcu() here when in other places you
> use list_for_each_entry_rcu()?

It's a mistake. I was part way making this use RCU when someone 'invented' the
firmware interface meaning readl() needs to be able to sleep...
Those were added in a later patch than I thought, and I missed fixing them up.

I think the srcu version provides extra checking - and is the correct one to use.
I'll fix those -- thanks for spotting it!


Thanks,

James

>> +		mpam_reset_class(class);
>> +	srcu_read_unlock(&mpam_srcu, idx);
>> +}



