Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCBDCCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrHkIjwbW6MAwNBmCrtoiCycqOn7oq29PvQJ0N98MT0=; b=QVtus7L/qlQRNiBpK4jpcIjGnO
	uWXWo/+nKg1BNzK0NrdSysSdRhrzAwrPfl8Q/Yr6g9LeFDLRQWiRnVEpZvpJbD7zvZEX481NhM7a3
	5Aa8mehCc/kOVevRtYi+2ssVOgFoP74+r+mOz04X8NvpWoy2rXIRqDhSmaanP0e7j7RFynuW+ewJA
	9qf2uzn6xcLoPU00EltOwwIAaHsF+0NkhCWBcePsS0e04kk5Fkh/VeKz75qu+2LZkA54WNPsEtf76
	lY57uEMed+cO1v/to0VZFQotAdfu6uAQw63QnulnY5Ap8p5Zq4VwA6Tz8LXWaeRhEgG+otp0w0UMK
	eAKg6YpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GNB-00000008zy0-2iNc;
	Fri, 10 Oct 2025 16:53:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GN9-00000008zwo-408h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:53:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80F9D175D;
	Fri, 10 Oct 2025 09:53:31 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57A743F66E;
	Fri, 10 Oct 2025 09:53:33 -0700 (PDT)
Message-ID: <aa0fd6dd-3332-46a2-a894-cf0416d3e461@arm.com>
Date: Fri, 10 Oct 2025 17:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/29] arm_mpam: Add helper to reset saved mbwu state
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
 <20250910204309.20751-28-james.morse@arm.com>
 <af6b6827-9bab-4328-ace0-710d7845c2ac@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <af6b6827-9bab-4328-ace0-710d7845c2ac@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_095340_112706_C678FF00 
X-CRM114-Status: GOOD (  13.52  )
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

On 26/09/2025 05:11, Fenghua Yu wrote:
> On 9/10/25 13:43, James Morse wrote:
>> resctrl expects to reset the bandwidth counters when the filesystem
>> is mounted.
>>
>> To allow this, add a helper that clears the saved mbwu state. Instead
>> of cross calling to each CPU that can access the component MSC to
>> write to the counter, set a flag that causes it to be zero'd on the
>> the next read. This is easily done by forcing a configuration update.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
> 
> Other than the following minor change,
> 
> Reviewed-by: Fenghua Yu <fenghuay@nvdia.com>

Thanks!


>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 3080a81f0845..8254d6190ca2 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c

>>   @@ -1245,6 +1257,37 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg
>> *ctx,
>>       return err;
>>   }
>>   +void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx)
>> +{
>> +    int idx;
>> +    struct mpam_msc *msc;
>> +    struct mpam_vmsc *vmsc;
>> +    struct mpam_msc_ris *ris;
>> +
>> +    if (!mpam_is_enabled())
>> +        return;
>> +
>> +    idx = srcu_read_lock(&mpam_srcu);

> guard(srcu)(&mpam_srcu);

Yeah, Jonathan had already suggested it.


>> +    list_for_each_entry_rcu(vmsc, &comp->vmsc, comp_list) {
>> +        if (!mpam_has_feature(mpam_feat_msmon_mbwu, &vmsc->props))
>> +            continue;
>> +
>> +        msc = vmsc->msc;
>> +        list_for_each_entry_rcu(ris, &vmsc->ris, vmsc_list) {
>> +            if (!mpam_has_feature(mpam_feat_msmon_mbwu, &ris->props))
>> +                continue;
>> +
>> +            if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>> +                continue;
>> +
>> +            ris->mbwu_state[ctx->mon].correction = 0;
>> +            ris->mbwu_state[ctx->mon].reset_on_next_read = true;
>> +            mpam_mon_sel_unlock(msc);
>> +        }
>> +    }
>> +    srcu_read_unlock(&mpam_srcu, idx);
>> +}


Thanks,

James

