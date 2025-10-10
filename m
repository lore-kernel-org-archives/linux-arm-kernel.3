Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EB5CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqgiiZ5o5qv7rye5RH9b2UVmC+QWuqAgyTpGDi/EGkA=; b=HXELgiO2BXAykQHEXjB7G+cWSL
	IzcNJ0qHv67ORHy175ijmCY0exioEKIC1EQ0X3L8t/owt6sJ7SS+OKOhen1cIssOi8+dL1hAAquF4
	HncZwYiaro/AuQlF0HTjDu5N4n7WjTHFAqJAkkUuc5KX5BIx12ahf1IY4mUPyeN7dcOyf3Sm7Rsvq
	TWpi8xT7p7jj6K5ZWmFC00SKLFi3Ux9JsjUyAQ4/foPn4R5ZA62tkmzLBFnU28cu29Y+DtB0kJiru
	44XkNkEgL74YII9Li1TOw2XNjxFbd5/TX8J8K6El+gIMC9/n7LN4/LKJAEoQMbYF3ocY0ZauWaPjg
	EyVa86gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GN0-00000008zsP-477K;
	Fri, 10 Oct 2025 16:53:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GMy-00000008zrX-0g8W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:53:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B9EE1596;
	Fri, 10 Oct 2025 09:53:19 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D3073F66E;
	Fri, 10 Oct 2025 09:53:21 -0700 (PDT)
Message-ID: <31f11369-c6ef-4a6b-a36e-973128d8f0fd@arm.com>
Date: Fri, 10 Oct 2025 17:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/29] arm_mpam: Add helper to reset saved mbwu state
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
 <20250910204309.20751-28-james.morse@arm.com>
 <20250912143302.00004d0e@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250912143302.00004d0e@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_095328_321172_8290A356 
X-CRM114-Status: GOOD (  21.12  )
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

On 12/09/2025 14:33, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:43:07 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> resctrl expects to reset the bandwidth counters when the filesystem
>> is mounted.
>>
>> To allow this, add a helper that clears the saved mbwu state. Instead
>> of cross calling to each CPU that can access the component MSC to
>> write to the counter, set a flag that causes it to be zero'd on the
>> the next read. This is easily done by forcing a configuration update.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>

> Minor comments inline.


>> @@ -1245,6 +1257,37 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
>>  	return err;
>>  }
>>  
>> +void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx)
>> +{
>> +	int idx;
>> +	struct mpam_msc *msc;
>> +	struct mpam_vmsc *vmsc;
>> +	struct mpam_msc_ris *ris;
>> +
>> +	if (!mpam_is_enabled())
>> +		return;
>> +
>> +	idx = srcu_read_lock(&mpam_srcu);
> 
> Maybe guard() though it doesn't add that much here.

'Fixed' already based on your other feedback.


>> +	list_for_each_entry_rcu(vmsc, &comp->vmsc, comp_list) {
> 
> Reason not to use _srcu variants?

Typo - I'd switched it all to srcu because of the pcc thing's need to sleep, but didn't
fix all these properly.



>> +		if (!mpam_has_feature(mpam_feat_msmon_mbwu, &vmsc->props))
>> +			continue;
>> +
>> +		msc = vmsc->msc;
>> +		list_for_each_entry_rcu(ris, &vmsc->ris, vmsc_list) {
>> +			if (!mpam_has_feature(mpam_feat_msmon_mbwu, &ris->props))
>> +				continue;
>> +
>> +			if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>> +				continue;
>> +
>> +			ris->mbwu_state[ctx->mon].correction = 0;
>> +			ris->mbwu_state[ctx->mon].reset_on_next_read = true;
>> +			mpam_mon_sel_unlock(msc);
>> +		}
>> +	}
>> +	srcu_read_unlock(&mpam_srcu, idx);
>> +}
>> +
>>  static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
>>  {
>>  	u32 num_words, msb;
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index c190826dfbda..7cbcafe8294a 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -223,10 +223,12 @@ struct mon_cfg {
>>  
>>  /*
>>   * Changes to enabled and cfg are protected by the msc->lock.
>> - * Changes to prev_val and correction are protected by the msc's mon_sel_lock.
>> + * Changes to reset_on_next_read, prev_val and correction are protected by the
>> + * msc's mon_sel_lock.

> Getting close to the point where a list of one per line would reduce churn.
> If you anticipate adding more to this in future I'd definitely consider it.
> e.g.
>  * msc's mon_sel_lcok protects:
>  * - reset_on_next_read
>  * - prev_val
>  * - correction
>  */

It doesn't get expanded further, this is the last patch of the driver. But this is easier
to read, so I'll do that.


Thanks,

James

