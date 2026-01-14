Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25048D38FEC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYh1woO3a8XEASbOHlaRaUnQlAGZTW0Vgy8M22Wjpwc=; b=MZ8ZIZ0X0EEtGiziuuzxIH1/ab
	/728Thm1X7UFk/Ky3dxDP9FlH13eDtuwmsGiJodf7QiQOGfZrLyYd/VTtvXM9IDQRPd/MmDN0bkz4
	YX+/WhiB+ELw2OhoAxjct2NjIimsYlQG0nITybnVkBq/3EGCe6B+7kaDDF7DZ0Za+d87MvwzNr33r
	WMT0Td48V4jvZWQ1JppnPc//1XbJP2kGI/B9US4NpXlU8VfX1XqQFpB0n20Blev0FR25DHHgkeOU5
	ra2EPDRQmXB0DhhOqqwvMcZTy5TS4U5QqrytJ64mgIkbeWqwuuRKItFUG96OwbODZp4iWYfv7xHB9
	KeRv5UHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg45F-00000009zJ2-0Yxv;
	Wed, 14 Jan 2026 16:51:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg45C-00000009zHi-2nRN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 16:50:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 547731515;
	Wed, 14 Jan 2026 08:50:50 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32FBE3F632;
	Wed, 14 Jan 2026 08:50:52 -0800 (PST)
Message-ID: <fe013731-4bbf-47c2-85f8-842f781ae2f3@arm.com>
Date: Wed, 14 Jan 2026 16:50:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/47] KVM: arm64: Use kernel-space partid
 configuration for hypercalls
From: Ben Horgan <ben.horgan@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, oupton@kernel.org, joey.gouly@arm.com,
 suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-14-ben.horgan@arm.com> <86o6mwl7kl.wl-maz@kernel.org>
 <b9e10419-b4de-4cb6-93b6-07e878d2072a@arm.com>
Content-Language: en-US
In-Reply-To: <b9e10419-b4de-4cb6-93b6-07e878d2072a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_085058_825887_24DD86DD 
X-CRM114-Status: GOOD (  22.86  )
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

Hi Marc,

On 1/14/26 14:39, Ben Horgan wrote:
> Hi Marc,
> 
> On 1/14/26 12:09, Marc Zyngier wrote:
>> On Mon, 12 Jan 2026 16:58:40 +0000,
>> Ben Horgan <ben.horgan@arm.com> wrote:
>>>
>>> On nVHE systems whether or not MPAM is enabled, EL2 continues to use
>>> partid-0 for hypercalls, even when the host may have configured its kernel
>>> threads to use a different partid. 0 may have been assigned to another
>>> task. Copy the EL1 MPAM register to EL2. This ensures hypercalls use the
>>> same partid as the kernel thread does on the host.
>>>
>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>> ---
>>> Changes since v2:
>>> Use mask
>>> Use read_sysreg_el1 to cope with hvhe
>>> ---
>>>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
>>> index a7c689152f68..ad99d8a73a9e 100644
>>> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
>>> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
>>> @@ -635,6 +635,14 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
>>>  	unsigned long hcall_min = 0;
>>>  	hcall_t hfn;
>>>  
>>> +	if (system_supports_mpam()) {
>>> +		u64 mask = MPAM1_EL1_PARTID_D | MPAM1_EL1_PARTID_I |
>>> +			MPAM1_EL1_PMG_D | MPAM1_EL1_PMG_I;
>>> +
>>> +		write_sysreg_s(read_sysreg_el1(SYS_MPAM1) & mask, SYS_MPAM2_EL2);
>>> +		isb();
>>> +	}
>>
>> Is it really OK to not preserve the rest of MPAM2_EL2? This explicitly
>> clears MPAM2_EL2.MPAMEN, which feels counter-productive.
>>
>> 	M.
>>
> 
> There are 3 things to consider:
> 1. traps - these are only relevant when we leave EL2 and are dealt with
> in __activate_traps_mpam(). (This also covers EnMPAMSM which is a
> not-trap bit.)
> 2. MPAM2_EL2.MPAMEN - this is read only as long as we have an EL3 and if
> we don't have EL3 will be 0 anyway from el2_setup.h and MPAM won't be
> considered supported in the kernel.
> 3. The alternate partid space fields which are kept as zero and relate
> to FEAT_RME.
> 
> So, safe. Ok with you or would you rather I make it more obviously safe?

As discussed offline, to avoid having to reason about MPAM2_EL2.MPAMEN
I'll set this bit to 1 in this write as we are already assuming mpam is
enabled and we want to keep it enabled.

> 
> Thanks,
> 
> Ben
> 
> 

Thanks,

Ben


