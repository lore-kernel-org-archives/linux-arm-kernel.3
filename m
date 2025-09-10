Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BBACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1BufRIMwV+2xPzaqwIZy06+rKClIc6ElOJ34FU6fIY=; b=FHk0aBLuKLojmV8CIl5WOCsxeG
	Ei0QgcHgtCbPZLj9ECmVhqcorG1WE22VkryFvypUNPsY+6oRHB+aNEZD3C3ENK2tE27wQYV33uPZJ
	iQz4JStGpaOln1o0OYXuR7AfssyDx2hJabSGXMepIlpyaD/8Yv69J/hA1sNjvU9dJXA2rWgxyb+jY
	x1u4sGfaJKOZkKFbmTr8XH/I9ouh0CwB8jEl5apwdH8iw4PZdPeqLOGZulmB/unSIny+D4V87J9cu
	GnGl96JeLX7tV+9nfiWe6OwEsem4p0YjAznlqA2x/oyFi6YIcXAO1SlaKEaabEYPYDp57XXpK6znM
	tNkgvHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQVu-0000000GHfo-1F3r;
	Wed, 10 Sep 2025 19:29:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQVr-0000000GHdv-3UP3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:29:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11CAA31DB;
	Wed, 10 Sep 2025 12:29:43 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D086B3F694;
	Wed, 10 Sep 2025 12:29:44 -0700 (PDT)
Message-ID: <1a571086-4165-4c94-a834-bd7b92a31b0d@arm.com>
Date: Wed, 10 Sep 2025 20:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/33] arm_mpam: Track bandwidth counter state for
 overflow and power management
To: Fenghua Yu <fenghuay@nvidia.com>, linux-kernel@vger.kernel.org,
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
 Shanker Donthineni <sdonthineni@nvidia.com>, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-63-james.morse@arm.com>
 <b2fb792f-92ba-4bee-8a2a-e434405653e9@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <b2fb792f-92ba-4bee-8a2a-e434405653e9@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_122951_913004_16F1F8D9 
X-CRM114-Status: GOOD (  13.00  )
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

On 28/08/2025 01:58, Fenghua Yu wrote:
> On 8/22/25 08:30, James Morse wrote:
>> Bandwidth counters need to run continuously to correctly reflect the
>> bandwidth.
>>
>> The value read may be lower than the previous value read in the case
>> of overflow and when the hardware is reset due to CPU hotplug.
>>
>> Add struct mbwu_state to track the bandwidth counter to allow overflow
>> and power management to be handled.

>> @@ -2291,11 +2395,35 @@ static void mpam_unregister_irqs(void)
>>     static void __destroy_component_cfg(struct mpam_component *comp)
>>   {
>> +    struct mpam_msc *msc;
>> +    struct mpam_vmsc *vmsc;
>> +    struct mpam_msc_ris *ris;
>> +
>> +    lockdep_assert_held(&mpam_list_lock);
>> +
>>       add_to_garbage(comp->cfg);
>> +    list_for_each_entry(vmsc, &comp->vmsc, comp_list) {
>> +        msc = vmsc->msc;
>> +
>> +        mpam_mon_sel_outer_lock(msc);
>> +        if (mpam_mon_sel_inner_lock(msc)) {
>> +            list_for_each_entry(ris, &vmsc->ris, vmsc_list)
>> +                add_to_garbage(ris->mbwu_state);
>> +            mpam_mon_sel_inner_unlock(msc);
>> +        }
>> +        mpam_mon_sel_outer_lock(msc);
> 
> s/mpam_mon_sel_outer_lock(msc);/mpam_mon_sel_outer_unlock(msc);/
> 
> Or this will hit a dead lock.

Heh, that's a good typo. Thanks!

James

