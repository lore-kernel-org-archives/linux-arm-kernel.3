Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E458CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNJPcvY5VNPDIoa5TOt0mLxP0y52V+dV9mWBnFMjjqw=; b=UwfA4AvxEYqTbZLm5Q8t39/moy
	4CrnA79ps4xBXmYTqrWSADKMOgHpXOAUccZ4Idqq9NMhuDgYSJkd/p08YN0Op133Y+n5ZpNv5uI/5
	GeBzUT76V+zA5pIv2X+UHecGv7Fe7gJDswIxgJLvt3CiPY8yqpNNcEkR3Ria27UtautNBDQSF56X/
	JZGTlysKO5+4Ho0q4QKxNTs4OG0wy2DOdiSVFZwHomkyAwPfZYZYjkpnkLuER8IiLGx7d/8ustSlH
	Yh70bYe3T8s9BvWbLupLSnpIF5zQ/H0YuLkluK6BRZemwmeOwT0bo0HPm8jBRQsiQxmGMgHBTjdH/
	pzvYcKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNjk-00000006wom-4B7l;
	Fri, 08 May 2026 16:07:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNji-00000006wo9-2ZNc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:07:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB5B31E5E;
	Fri,  8 May 2026 09:07:25 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7ED893F763;
	Fri,  8 May 2026 09:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778256451; bh=uH4jki18tNIvGZJMD0bIn9/gNKPvChH9ZA2/rDdD2pE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t5Vr6qkLjf0lH4XCDhFgVvYvJse25wmK9E8hfgUyFJ8zDt/QOv/5VLYMfK2Y4S9Ky
	 MLHeEspLJJzhh5OPDF+1nEHvCmnVhLEMILSmIC2H1QtFq0kHAGWtPykDDdPoUiZRwH
	 rCiQwatHPCrbMs4AqNYpt/WmXpjLoy+akD577RKA=
Message-ID: <15208746-9521-4e04-a208-15600e96e7e1@arm.com>
Date: Fri, 8 May 2026 17:07:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm_mpam: Update architecture version check for
 MPAM MSC
To: Ben Horgan <ben.horgan@arm.com>, Zeng Heng <zengheng4@huawei.com>,
 xry111@xry111.site, catalin.marinas@arm.com, maz@kernel.org,
 ardb@kernel.org, yang@os.amperecomputing.com, ryan.roberts@arm.com,
 kevin.brodsky@arm.com, reinette.chatre@intel.com, miko.lenczewski@arm.com,
 will@kernel.org, suzuki.poulose@arm.com, thuth@redhat.com,
 james.clark@linaro.org, lpieralisi@kernel.org, broonie@kernel.org,
 oupton@kernel.org, anshuman.khandual@arm.com, yeoreum.yun@arm.com,
 leo.yan@arm.com, mrigendra.chaubey@gmail.com, fenghuay@nvidia.com,
 ahmed.genidi@arm.com, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 wangkefeng.wang@huawei.com
References: <20260203095406.6437-1-zengheng4@huawei.com>
 <20260203095406.6437-3-zengheng4@huawei.com>
 <b9900d7a-eaaf-4f1a-b79e-aa968a7b6e29@arm.com>
 <01ef61ca-7ba7-b282-7ec6-b1df5c301aa5@huawei.com>
 <cdddd32a-a485-0ef9-180b-edf29f4738bd@huawei.com>
 <ff95000d-d4ee-493a-b3cd-d573bd32abd0@arm.com>
 <7b9d69df-8086-472d-b0c3-8d46e1b5399e@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <7b9d69df-8086-472d-b0c3-8d46e1b5399e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_090734_736646_D2DB7645 
X-CRM114-Status: GOOD (  12.76  )
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

On 08/05/2026 10:56, Ben Horgan wrote:
> On 5/8/26 10:37, Ben Horgan wrote:
>> On 5/8/26 04:47, Zeng Heng wrote:
>>> On 2026/5/8 10:26, Zeng Heng wrote:
>>>
>>>>> I think its simpler to rule out the unsupported combinations, something like:
>>>>> | static bool mpam_msc_check_aidr(struct mpam_msc *msc)
>>>>> | {
>>>>> |     u32 rev;
>>>>> |
>>>>> |     rev = __mpam_read_reg(msc, MPAMF_AIDR) & MPAMF_AIDR_ARCH_REV;
>>>>> |
>>>>> |      /*
>>>>> |      * v0.0 and >v2.x aren't supported, but anything else should be backward
>>>>> |     * compatible to v0.1 or v1.0.
>>>>> |     */
>>>>> |     if (!rev)
>>>>> |         return false;
>>>>> |     if (rev & MPAMF_AIDR_ARCH_MAJOR_REV > MPAM_ARCHITECTURE_V1)
>>>>> |         return false;
>>>>> |
>>>
>>> Oops, after more complete version number testing, I found there's an
>>> operator precedence issue here. The correct fix is:
>>>
>>>     if ((rev & MPAMF_AIDR_ARCH_MAJOR_REV) > MPAM_ARCHITECTURE_V1)
>>>         return false;
>>>
>>> Note that '>' has higher precedence than '&'.

(yeah, the compiler winged at me. I should have said I didn't even build the hunk above
 before suggesting it!)


>> Isn't it better to use FIELD_GET()?

Always!


>> We could also avoid creating MPAMF_AIDR_ARCH_REV and use MPAMF_AIDR_ARCH_MAJOR_REV
>> and MPAMF_AIDR_ARCH_MINOR_REV directly to stop splitting the logic over two files. mpam_msc_check_aidr() could become:
>>
>> static bool mpam_msc_check_aidr(struct mpam_msc *msc)
>> {
>> 	u32 aidr = __mpam_read_reg(msc, MPAMF_AIDR);
>> 	u32 major = FIELD_GET(MPAMF_AIDR_ARCH_MAJOR_REV, aidr);
>> 	u32 minor = FIELD_GET(MPAMF_AIDR_ARCH_MINOR_REV, aidr);
>>
>> 	/*
>> 	 * v0.0 and >v2.x aren't supported, but anything else should be backward
>> 	 * compatible to v0.1 or v1.0.
>> 	 */
>> 	if (!major && !minor)
>> 		return false;
>> 	if (major > MPAM_ARCHITECTURE_V1)
> 
> This isn't correct. I missed that MPAM_ARCHITECTURE_V1 is 0x10 (which matches MPAMF_AIDR_ARCH_REV) and not 1.

Done locally. Thanks!

I also ran over two bugs with v0.1 MSC causing mpam_disable() to be called before
mpam_enable().


Thanks,

James

