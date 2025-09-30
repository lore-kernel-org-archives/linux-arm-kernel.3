Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC29CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 17:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VH78FGRNlE/Xlp+FsWHnHVMzfv/BP+odOw3DN9l0+8=; b=KmgrI8OmV4ZzvSJITo3xdWgTs8
	OFCtmTyrFfjH/9ADgvz9rGs6GbsXe3MEcGcG/mRSaZ+pAbXKmGT68coB3VsEVt0Ho6CzcsFh2wY1o
	3T/9qwSTC2Pry2clTu4XaVn8OoNCUk5TiXTSyMB1ZGrGdxLtYtmkjELdVlhHgGFAKde9vXsOvZ/k4
	ujNPHv8zcrXDBh6zyKIaLghTfRa1Aartdd1pKvpNmgLD1Th9dgNWMEKuC2y9zkG2wc/nr/l7MWiwS
	4QKfUiHUonrQoqxmZptwsSAyxHluyX/1sQucHxGFlYj3gCzrf03zPYs5g8WyCoFNRQQIPMiP9l7Qi
	zxS7RwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3doa-00000005qRv-2ich;
	Tue, 30 Sep 2025 17:07:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3doR-00000005qOq-3ijA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 17:06:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D72BF267F;
	Tue, 30 Sep 2025 10:06:40 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D00833F59E;
	Tue, 30 Sep 2025 10:06:43 -0700 (PDT)
Message-ID: <137ca3de-2572-4edf-b10c-67b690f84128@arm.com>
Date: Tue, 30 Sep 2025 18:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/29] arm_mpam: Reset MSC controls from cpu hp
 callbacks
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-16-james.morse@arm.com>
 <20250912125535.0000151c@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250912125535.0000151c@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_100652_057690_D7A3AE45 
X-CRM114-Status: GOOD (  17.20  )
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

Hi Jonathan,

On 12/09/2025 12:55, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:42:55 +0000
> James Morse <james.morse@arm.com> wrote:
> 
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

> Just one trivial passing comment from me.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index cd8e95fa5fd6..0353313cf284 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -818,6 +921,20 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
>>  
>>  static int mpam_cpu_offline(unsigned int cpu)
>>  {
>> +	int idx;
>> +	struct mpam_msc *msc;
>> +
>> +	idx = srcu_read_lock(&mpam_srcu);

> Might be worth using
> guard(srcu)(&mpam_srcu);
> here but only real advantage it bring is in hiding the local idx variable
> away.  

Sure. I did that in a few other places, it looks like I either missed this, or thought it
got more complicated later...


Thanks,

James

