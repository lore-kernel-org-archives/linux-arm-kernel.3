Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287BBCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 11:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dA868JnAHP3q2CSQEnaSqNKQJhKRobjZEEDKC4ctiE=; b=4tmzYoThfl5dcmr/GVxJ/FepWB
	NqXhXPKhmdhXQDYTKjgepTp9MDfp/RI2q0xe2T7txqdNrFAsxOZLw5YrtiJPaEod/++120u3mNw9B
	wMaQSidlyvUDxiURtlOH8/9qUVV2cqjD6gubYZtq+k5zyMDRe+91ObcgOcC0hTx47IslGWJX1gUYu
	zAmP6Mtq/1GxGeeEMRflUdHD/tEFrEyE9dJjzxXPv6Ox2Jwr/wZ6NR96flyn0dZ/8z9/uukDQLTy5
	Cmv04y7vA4Glkd0nQYiHbsCFL3rgKrZMPbmTRocEsY/fIoDdvoOuH9W9Uuz0u07On/gEFMrynK7cS
	+fZL5NWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65bF-00000001qTA-1ztv;
	Tue, 07 Oct 2025 11:11:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65bC-00000001qSo-0BBt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 11:11:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 265031424;
	Tue,  7 Oct 2025 04:11:08 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0BB73F66E;
	Tue,  7 Oct 2025 04:11:10 -0700 (PDT)
Message-ID: <4aec304d-4a89-4957-ac72-148db39f6117@arm.com>
Date: Tue, 7 Oct 2025 12:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/29] arm_mpam: Allow configuration to be applied and
 restored during cpu online
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
 <20250910204309.20751-21-james.morse@arm.com>
 <20250912132229.000044c7@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250912132229.000044c7@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_041118_219497_1F8FDC43 
X-CRM114-Status: GOOD (  20.86  )
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

On 12/09/2025 13:22, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:43:00 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> When CPUs come online the MSC's original configuration should be restored.
>>
>> Add struct mpam_config to hold the configuration. This has a bitmap of
>> features that were modified. Once the maximum partid is known, allocate
>> a configuration array for each component, and reprogram each RIS
>> configuration from this.

> Trivial comments
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks!


>> +static void mpam_init_reset_cfg(struct mpam_config *reset_cfg)
>> +{
>> +	memset(reset_cfg, 0, sizeof(*reset_cfg));
> 
> Might as well do the following and skip the memset.
> 
> 	*reset_cfg = (struct mpam_config) {
> 		.features = ~0,
> 		.cpbm = ~0,
> 		.mbw_pbm = ~0,
> 		.mbw_max = MPAM...
> 		.reset_cpbm = true,
> 		.reset_mbw_pbm = true,
> 	};

Sure,


>> +	reset_cfg->features = ~0;
>> +	reset_cfg->cpbm = ~0;
>> +	reset_cfg->mbw_pbm = ~0;
>> +	reset_cfg->mbw_max = MPAMCFG_MBW_MAX_MAX;
>> +
>> +	reset_cfg->reset_cpbm = true;
>> +	reset_cfg->reset_mbw_pbm = true;
>> +}
> 
>> +static int mpam_allocate_config(void)
>> +{
>> +	int err = 0;
> 
> Always set before use. Maybe push down so it is in tighter scope and
> can declare and initialize to final value in one line.

Sure,


>> +	struct mpam_class *class;
>> +	struct mpam_component *comp;
>> +
>> +	lockdep_assert_held(&mpam_list_lock);
>> +
>> +	list_for_each_entry(class, &mpam_classes, classes_list) {
>> +		list_for_each_entry(comp, &class->components, class_list) {
>> +			err = __allocate_component_cfg(comp);
>> +			if (err)
>> +				return err;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 
> 
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index b69fa9199cb4..17570d9aae9b 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -169,11 +169,7 @@ struct mpam_props {
>>  	u16			num_mbwu_mon;
>>  };
>>  
>> -static inline bool mpam_has_feature(enum mpam_device_features feat,
>> -				    struct mpam_props *props)
>> -{
>> -	return (1 << feat) & props->features;
>> -}
>> +#define mpam_has_feature(_feat, x)	((1 << (_feat)) & (x)->features)
> 
> If this is worth doing push it back to original introduction.
> I'm not sure it is necessary.

It's the change in this patch that makes it necessary, maybe_update_config() goes calling
mpam_has_feature() on a configuration instead of a class/msc/ris props structure. I could
have made that a separate helper to get the type right - but making it a macro was simpler.

I'll push it back earlier.


Thanks,

James

