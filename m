Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59F7CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmaUFZDVkWD6HVh/+BoXQShFEp0DoOch9E/WeV/Zrq4=; b=OmgzMSuAHxlZvyMe9gxjthcQFP
	FJymp++qh0oWLk+ZNbJYYQjnsvGz+D2ah8xPwZb6eZcvXr2IEl6J3OUtsHEJYkBTRzBs9nHf0MtLq
	PdbmKJm/0GPO9WQE1fwyVsDu7Jsrs1UoHTyVBhGFMzQ2WLCNQJ7f1xemIiKMZtgHdaQFz9ZEspMmS
	mE6TPKgK4zj6dG1K3M66p9mX1Jtd9vq4LKTudU8TitknPZf1kqGLQzExd+yuKt/H3EjQIUHQqexSc
	ypeHCnmmP3F2OPEUtiI1HhKG9cAGHCPpDeCuOgBrwOyF/VjV1YKYGo5TM24lZCJ2h+yZugjI25GTm
	pxtfLETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3aSt-00000005PQC-0J0y;
	Tue, 30 Sep 2025 13:32:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3aSp-00000005POw-3f0A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 13:32:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D4B4113E;
	Tue, 30 Sep 2025 06:32:09 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC9973F59E;
	Tue, 30 Sep 2025 06:32:12 -0700 (PDT)
Message-ID: <7b13b1b5-295e-499b-9f8f-da168099377d@arm.com>
Date: Tue, 30 Sep 2025 14:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/29] arm_mpam: Probe the hardware features resctrl
 supports
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
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
 <20250910204309.20751-14-james.morse@arm.com>
 <8ed9fbe9-1075-4abb-91d0-20203906a4dc@arm.com>
 <32bc0e4a-d0bb-4aaa-8706-95a6edd470a9@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <32bc0e4a-d0bb-4aaa-8706-95a6edd470a9@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_063220_031644_DD1A6749 
X-CRM114-Status: GOOD (  22.51  )
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

On 9/29/25 18:45, James Morse wrote:
> Hi Ben,
> 
> On 11/09/2025 16:37, Ben Horgan wrote:
>> On 9/10/25 21:42, James Morse wrote:
>>> Expand the probing support with the control and monitor types
>>> we can use with resctrl.
> 
>>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>>> index 4cc44d4e21c4..5ae5d4eee8ec 100644
>>> --- a/drivers/resctrl/mpam_internal.h
>>> +++ b/drivers/resctrl/mpam_internal.h
>>> @@ -112,6 +112,55 @@ static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
>>>  	raw_spin_lock_init(&msc->_mon_sel_lock);
>>>  }
>>>  
>>> +/*
>>> + * When we compact the supported features, we don't care what they are.
>>> + * Storing them as a bitmap makes life easy.
>>> + */
>>> +typedef u16 mpam_features_t;
>>> +
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
>>> +};
> 
>> I added a garbled comment about this for v1. What I was trying to say is
>> that I don't think this quite matches what resctrl supports. For
>> instance, I don't think mpam_feat_ccap_part matches a resctrl feature.
> 
> Ah - right. I thought you meant something was removed later.
> Looks like I thought something could be emulated with CCAP, but that turns out not to be
> true because it doesn't have an implicit isolation property, which the
> resctrl:bitmap-from-userspace requires.
> (I think rwbw was a later addition to the architecture and I added it to the wrong patch).
> 
> I'll move that, _prop and _rwbw to the later patch. The split is fairly arbitrary - it was

I think ccap gets split into finer grained features later on which seems
fine.

> just somewhere to split an otherwise large patch, and does help determine if a bug is
> going to be visible to user-space or not.

Ok, sensible, I hadn't appreciated the user-space visibility aspect.

> 
> _capt can go completely. Last I heard no-one was interested in firmware descriptions of
> how the capture hardware can be triggered. I suspect no-one has done anything with it.

So, if I've understood correctly this leaves you with the following in
this patch.

mpam_feat_cpor_part,
mpam_feat_mbw_part,
mpam_feat_mbw_min,
mpam_feat_mbw_max,
mpam_feat_mbw_prop,
mpam_feat_msmon,
mpam_feat_msmon_csu,
mpam_feat_msmon_csu_hw_nrdy,
mpam_feat_msmon_mbwu,
mpam_feat_msmon_mbwu_hw_nrdy,

Looks like the correct, resctrl based, split.

> 
> 
> Thanks,
> 
> James

Thanks,

Ben


