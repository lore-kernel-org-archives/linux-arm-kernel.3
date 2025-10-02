Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D31CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 18:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3k+J8qpFjK/lgGh7Zl03b2mMgOSIB2yOErhlwgHFOls=; b=NHRz1lDj1k5vNHO2e1A4LBuqql
	O5b0yd4CUDOS//AyIE2VXXg7XtqXJB2v43mYbDIu5AuxcKmq9QrHJuO++o0VTzCL8B1NmD6mmZKSf
	t3ozT4qf485L3Ijsc0x7puGEQ+uaEz1rSaD8eW5atPLk7vA2ksUaaZ2iYOsO00jYNWFQ9z+wq5vV9
	q3T8eMyeSMQlEPLuCM1o25uLNi0nUqFRBVj9jRoH1gzrwZOb3NA0U/MMZXbYfqe9/yddRvHb34t+U
	gX3Qhsdjsg0vCTHYICMK9h4PxcuCAlB4Ep898cqLA5Ddn46SEukWwrjz7xpfkW/VNhP/2Qnx2ZbnW
	KT9tyW6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4NdO-0000000Axw8-42lj;
	Thu, 02 Oct 2025 18:02:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4NdL-0000000Axty-1mKX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 18:02:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 006BE1FCD;
	Thu,  2 Oct 2025 11:02:16 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF10D3F66E;
	Thu,  2 Oct 2025 11:02:18 -0700 (PDT)
Message-ID: <2c5c6e2a-e0ea-4786-ba6e-2c536a53a68b@arm.com>
Date: Thu, 2 Oct 2025 19:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/29] arm_mpam: Extend reset logic to allow devices to
 be reset any time
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-18-james.morse@arm.com>
 <9fa1b584-130b-45b0-9dba-8e046e643bf0@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <9fa1b584-130b-45b0-9dba-8e046e643bf0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_110227_509352_3198E9C8 
X-CRM114-Status: GOOD (  16.59  )
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

On 12/09/2025 12:42, Ben Horgan wrote:
> On 9/10/25 21:42, James Morse wrote:
>> cpuhp callbacks aren't the only time the MSC configuration may need to
>> be reset. Resctrl has an API call to reset a class.
>> If an MPAM error interrupt arrives it indicates the driver has
>> misprogrammed an MSC. The safest thing to do is reset all the MSCs
>> and disable MPAM.
>>
>> Add a helper to reset RIS via their class. Call this from mpam_disable(),
>> which can be scheduled from the error interrupt handler.
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index e7faf453b5d7..a9d3c4b09976 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -842,8 +842,6 @@ static int mpam_reset_ris(void *arg)
>>  	u16 partid, partid_max;
>>  	struct mpam_msc_ris *ris = arg;
>>
>> -	mpam_assert_srcu_read_lock_held();
>> -
>
> Remove where it is introduced. There is already one in
> mpam_reset_ris_partid() at that time.

Mmmm, this should really have been replaced with a comment.

I prefer each function to have an assert like this as documentation. In this case, a new
caller may miss the lock, but always hit the 'in_reset_state' case during testing, and be
caught out when a call to mpam_reset_ris_partid() occurs. Having documentation comments
that can also bark at you when you ignore them is really handy!

It's removed in this  patch  because calling it via mpam_touch_msc() puts it behind an
call to schedule, and lockdep expects 'current' to be the one holding the lock.

I'll add the comment. Looks like it just got dropped when mpam_touch_msc() stopped using
an IPI...


>>  	if (ris->in_reset_state)
>>  		return 0;
>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks!


James

