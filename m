Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A98ACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 18:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iycIE/C71XdC8Q733mqJrOT3IAKDZgNSULKSF6Rk3TY=; b=EAD4fBC57owWkM5AlHcBV+104f
	RyTByck2ZSnoAAeIIrPjZSlfHnUJZQY83cH+KtJpP4WdkQ1n5UUOywX7x3a6rDUS+XZtXYPC6s81R
	0YS0nfIl3awZJiPCdJwsKXTr2a4bpuNCb2t91KVwWUDkjzoJu/SAcS6Oe8VzGdzrFLqU0bwD/F5oz
	MIAnpfQuFwxDIwUikFX3nSiK5MlbVFclTHxJrub80rawiAEGK+g+TihK1xPItXt8+uFeAvVDdt3qt
	8AUvqY+qkgxzNHP7drrVG2ZylJnY4QIe4cBqbQjj+izwIDd4MtCQR/k9pywY1YHWwZr6UTKqlgucS
	4fQgmsFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4k8z-0000000Cu43-2DJY;
	Fri, 03 Oct 2025 18:04:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4k8x-0000000Cu3L-2fWn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 18:04:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B84E81655;
	Fri,  3 Oct 2025 11:04:26 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA1303F5A1;
	Fri,  3 Oct 2025 11:04:29 -0700 (PDT)
Message-ID: <312531db-9293-4db1-b97a-2437105c3ccb@arm.com>
Date: Fri, 3 Oct 2025 19:04:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/29] arm_mpam: Allow configuration to be applied and
 restored during cpu online
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
 <20250910204309.20751-21-james.morse@arm.com>
 <3359b947-6adb-4d77-97e1-5abb0b9d2a4e@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <3359b947-6adb-4d77-97e1-5abb0b9d2a4e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_110435_711567_34CEFB6E 
X-CRM114-Status: GOOD (  14.38  )
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

On 25/09/2025 07:53, Fenghua Yu wrote:
> On 9/10/25 13:43, James Morse wrote:
>> When CPUs come online the MSC's original configuration should be restored.
>>
>> Add struct mpam_config to hold the configuration. This has a bitmap of
>> features that were modified. Once the maximum partid is known, allocate
>> a configuration array for each component, and reprogram each RIS
>> configuration from this.


>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index ec1db5f8b05c..7fd149109c75 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c

>> @@ -922,6 +991,40 @@ static void mpam_reset_msc(struct mpam_msc *msc, bool online)
>>       }
>>   }
>>   +static void mpam_reprogram_msc(struct mpam_msc *msc)
>> +{
>> +    u16 partid;
>> +    bool reset;
>> +    struct mpam_config *cfg;
>> +    struct mpam_msc_ris *ris;
>> +
>> +    /*
>> +     * No lock for mpam_partid_max as partid_max_published has been
>> +     * set by mpam_enabled(), so the values can no longer change.
>> +     */
>> +    mpam_assert_partid_sizes_fixed();
>> +
>> +    guard(srcu)(&mpam_srcu);

> mpam_srcu is locked in caller mpam_cpu_online(). It's unnecessary to call guard(srcu)
> (&mpam_srcu) here again for simpler logic and less overhead.

It's not simpler - as now the requirements for the innards of mpam_reprogram_msc() have to
spill out to the callers.
I also contest that its less overhead - this is used on the cpuhp path, I'd suspect the
'cost' can't even be measured.

The good news is at the end of the day this thing only has that one caller, so I'll change
this one ...


Thanks,

James



