Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E6ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NsPs5mmEZAM0RI4s1ltQROCFrLKlKr1rZoj7O547TY=; b=CZDdrI+vbVRzGr4qwsSgGyS/IC
	4IkDNeNKcVwclMqrVH9Y8Am/B5zTU2t1qap6ZEtjkGiZ37IgODPI5nXtRyfoqWPmbjCJgy5V33wIK
	+tnq9OvIMy482RMlMO7Kn8bkLR1pBkpuoyLeW7OUY3yE2ginNfTg467Q1V7mMyDe22rajQO1rsvyR
	mDq+q0tQC75+nNR8fYBpA12SFOhZytr40JyeTR4UN7UviVja8ZJOZxLKaQZyK3z3QcE92XROvTp1i
	gGXposjeisi4ULZ5vCfCMhmSoZZKG1ppFSEYc60F6VGAEeUaIgBskqgw3ePQjuy0qW7iYgl+/+hyN
	b12ubGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw27S-000000096iw-2rja;
	Tue, 09 Sep 2025 17:27:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1fG-00000008h7X-27VO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:57:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92E1C2008;
	Tue,  9 Sep 2025 09:57:45 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C2EC3F694;
	Tue,  9 Sep 2025 09:57:47 -0700 (PDT)
Message-ID: <3a3520f7-654b-420f-a8e8-ca57f92e21fe@arm.com>
Date: Tue, 9 Sep 2025 17:57:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/33] arm_mpam: Reset MSC controls from cpu hp callbacks
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
 <20250822153048.2287-20-james.morse@arm.com>
 <1c20a5b2-2afe-4084-9494-a994e1a275b7@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <1c20a5b2-2afe-4084-9494-a994e1a275b7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_095754_672592_E0B566CB 
X-CRM114-Status: GOOD (  15.76  )
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

On 27/08/2025 17:19, Ben Horgan wrote:
> On 8/22/25 16:30, James Morse wrote:
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

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index bb62de6d3847..c1f01dd748ad 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c

>> @@ -849,8 +850,115 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)

>> +static void mpam_reset_ris_partid(struct mpam_msc_ris *ris, u16 partid)
>> +{
>> +	u16 bwa_fract = MPAMCFG_MBW_MAX_MAX;
>> +	struct mpam_msc *msc = ris->vmsc->msc;
>> +	struct mpam_props *rprops = &ris->props;
>> +
>> +	mpam_assert_srcu_read_lock_held();
>> +
>> +	mutex_lock(&msc->part_sel_lock);
>> +	__mpam_part_sel(ris->ris_idx, partid, msc);
>> +
>> +	if (mpam_has_feature(mpam_feat_cpor_part, rprops))
>> +		mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM, rprops->cpbm_wd);
>> +
>> +	if (mpam_has_feature(mpam_feat_mbw_part, rprops))
>> +		mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops->mbw_pbm_bits);
>> +
>> +	if (mpam_has_feature(mpam_feat_mbw_min, rprops))
>> +		mpam_write_partsel_reg(msc, MBW_MIN, 0);
>> +
>> +	if (mpam_has_feature(mpam_feat_mbw_max, rprops))
>> +		mpam_write_partsel_reg(msc, MBW_MAX, bwa_fract);

> MPAMCFG_MBW_MAX_MAX can be used directly instead of bwa_fract.

Without the second user, yes.


>> +
>> +	if (mpam_has_feature(mpam_feat_mbw_prop, rprops))
>> +		mpam_write_partsel_reg(msc, MBW_PROP, bwa_fract);

> Shouldn't this reset to 0? STRIDEM1 is a cost.

Heh, this is just a copy and paste of the last value, because it clears the 'enable' bit,
and the spec says "there is no setting of the STRIDEM1 control field that disables the
effects of proportional-stride".

Yes - zero would be better.


Thanks,

James

