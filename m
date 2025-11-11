Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEE0CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 17:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD884tdWlbul8u0wH+/AJTgE5hfuxgJLDSHdpBO2hhg=; b=U1zQKnf/E/qH0BW4szxTKoEsfm
	lAXkIfkKEp5o+XJEA+A88EmdFWyOppnSGqcdth7bHq2lkQK7L8/XfXG/EeswcUCU7lMN/+dOU+ig+
	cDS0ppXPWfqb42VRlXgXXeg/a+moVrazNPsV2oC52e9BvMJI6v0jQ1TJl8vZv6y9GEyAq3tiqumBt
	W/YWaqywibFLUqo2uRrQmBT/VdR95eIb7opL7mhSqAa0KZO249RO6G98i4xZeueunZ89q5rPvqiK8
	6D3yD7v+d+LhSM+otn6rhrrdlk+FSRg0EenS8p1EUGCiF2ABbwde/2PIwMQPMsvMEXM96xEs2NAee
	c40Ysafg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsR7-00000007YV0-0OV0;
	Tue, 11 Nov 2025 17:45:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsR5-00000007YUV-1Olr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 17:45:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28353497;
	Tue, 11 Nov 2025 09:45:34 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4536B3F5A1;
	Tue, 11 Nov 2025 09:45:37 -0800 (PST)
Message-ID: <ee02c9fb-721d-4fb8-a2e7-d7a291972a8c@arm.com>
Date: Tue, 11 Nov 2025 17:45:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/33] arm_mpam: Allow configuration to be applied and
 restored during cpu online
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: james.morse@arm.com, amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
 guohanjun@huawei.com, jeremy.linton@arm.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-24-ben.horgan@arm.com>
 <20251110172724.00005675@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251110172724.00005675@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_094543_509929_6F140AAE 
X-CRM114-Status: GOOD (  19.41  )
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

On 11/10/25 17:27, Jonathan Cameron wrote:
> On Fri, 7 Nov 2025 12:34:40 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> From: James Morse <james.morse@arm.com>
>>
>> When CPUs come online the MSC's original configuration should be restored.
>>
>> Add struct mpam_config to hold the configuration. This has a bitmap of
>> features that were modified. Once the maximum partid is known, allocate
> 
> I'm not following 'were modified'.  When?  Sometime in the past?
> Perhaps "features that have been modified when XXX happens" or
> 
> Having read the code I think this is something like "are modified as configuration
> is read".
> 
>> a configuration array for each component, and reprogram each RIS
>> configuration from this.
>>
>> CC: Dave Martin <Dave.Martin@arm.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Cc: Shaopeng Tan (Fujitsu) tan.shaopeng@fujitsu.com
>> Cc: Peter Newman peternewman@google.com
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since v3:
>> Drop tags
>> Fix component reset, otherwise cpbm wrong and controls not set.
>> Add a cfg_lock to guard configuration of an msc
> 
> The use of bitmap_set() for things that aren't unsigned long (arrays) is a bad
> idea. Much better to use GENMASK() to fill those.
> 
>> ---
>>  drivers/resctrl/mpam_devices.c  | 268 ++++++++++++++++++++++++++++++--
>>  drivers/resctrl/mpam_internal.h |  27 ++++
>>  2 files changed, 280 insertions(+), 15 deletions(-)

> Why manipulate a u32 with bitmap_set() with a horrible pretend it's an unsigned long cast.
> Instead just do:
> 		comp->cfg[i].cpbm = GENMASK(cprops->cpbm_wd, 0);
> Which is indeed what bitmap_set will do internally due to an optimization for small bitmaps
> but lets avoid that making one integer pretend to be another of a different length.
> 
> 
>> +		bitmap_set((unsigned long *)&comp->cfg[i].mbw_pbm, 0, cprops->mbw_pbm_bits);
>> +		bitmap_set((unsigned long *)&comp->cfg[i].mbw_max, 16 - cprops->bwa_wd, cprops->bwa_wd);
>> +	}
>> +}
> 

It is a bit nasty. I was trying to keep the concept of setting n bits and avoid 
considering explicitly what happens when n is zero.

These bitmap_set() can become:

if (cprops->cpbm_wd)
	comp->cfg[i].cpbm = GENMASK(cprops->cpbm_wd - 1, 0);
if (cprops->mbw_pbm_bits)
	comp->cfg[i].mbw_pbm = GENMASK(cprops->mbw_pbm_bits - 1, 0);
if (cprops->bwa_wd)
	comp->cfg[i].mbw_max = GENMASK(15, 16 - cprops->bwa_wd);

 
Thanks,

Ben


