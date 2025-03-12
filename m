Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8036C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Mfjk0WqBwbwG6SvP7514pIeUTooyFhIFrrreXPggdY=; b=IfDWdQxt/y8ey/ud/QfuLVjWNE
	M8V3vjMZFsWAO7kEMltTToe1MgGKG08pPs8VsMjSGW/OO5YgQayw7UFJKtovhGPc981vPivMI85cx
	Jp4O1c72Bfl9V+OnL1IBwQeJ3dWOMVz0YW6AH44UN6bPIqZMN2Wj7IjZlj9fMwdQpbPyC6sTgYRaD
	RQ60boM+M92ZQ8Q04FvucmL47+McCJhZGp2tn6iWFKncTuUKIU6qIyQ00ia1WP0hXfNmknpNf7UT9
	0P9hsfEFdYOxePr7tDh9feNZYVVKkszcsxb/kQgR9sEACBkm2Hn9OcPbK1B9epMObi47xt1cnZ7rW
	NG2xRv+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLsr-00000008X1D-3v4W;
	Wed, 12 Mar 2025 13:12:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLei-00000008TmA-1SDw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 12:57:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50335152B;
	Wed, 12 Mar 2025 05:58:00 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 781983F694;
	Wed, 12 Mar 2025 05:57:15 -0700 (PDT)
Message-ID: <44d516b5-5e1f-4b50-b65c-0ed596639fd0@arm.com>
Date: Wed, 12 Mar 2025 12:57:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] iommu/arm-smmu-qcom: Don't read fault registers
 directly
To: Rob Clark <robdclark@gmail.com>, Connor Abbott <cwabbott0@gmail.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
 <20250311180807.GC5216@willie-the-truck>
 <CACu1E7Hw6vGbTQ7t-Hj3ziycZhPxtOGSDkt7o4fNUx91KDcXfg@mail.gmail.com>
 <CAF6AEGs8PoZBpFesQ_DGcngn4X24wzFy=zn2mAUJepdibxoKog@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAF6AEGs8PoZBpFesQ_DGcngn4X24wzFy=zn2mAUJepdibxoKog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_055752_470590_E2F61810 
X-CRM114-Status: GOOD (  20.53  )
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

On 11/03/2025 8:00 pm, Rob Clark wrote:
> On Tue, Mar 11, 2025 at 12:42 PM Connor Abbott <cwabbott0@gmail.com> wrote:
>>
>> On Tue, Mar 11, 2025 at 2:08 PM Will Deacon <will@kernel.org> wrote:
>>>
>>> On Tue, Mar 04, 2025 at 11:56:48AM -0500, Connor Abbott wrote:
>>>> In some cases drm/msm has to resume a stalled transaction directly in
>>>> its fault handler. Experimentally this doesn't work on SMMU500 if the
>>>> fault hasn't already been acknowledged by clearing FSR. Rather than
>>>> trying to clear FSR in msm's fault handler and implementing a
>>>> tricky handshake to avoid accidentally clearing FSR twice, we want to
>>>> clear FSR before calling the fault handlers, but this means that the
>>>> contents of registers can change underneath us in the fault handler and
>>>> msm currently uses a private function to read the register contents for
>>>> its own purposes in its fault handler, such as using the
>>>> implementation-defined FSYNR1 to determine which block caused the fault.
>>>> Fix this by making msm use the register values already read by arm-smmu
>>>> itself before clearing FSR rather than messing around with reading
>>>> registers directly.
>>>>
>>>> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
>>>> ---
>>>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
>>>>   drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
>>>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++----------
>>>>   3 files changed, 27 insertions(+), 27 deletions(-)
>>>
>>> [...]
>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>> index d3bc77dcd4d40f25bc70f3289616fb866649b022..411d807e0a7033833716635efb3968a0bd3ff237 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>> @@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
>>>>        ARM_SMMU_DOMAIN_NESTED,
>>>>   };
>>>>
>>>> +struct arm_smmu_context_fault_info {
>>>> +     unsigned long iova;
>>>> +     u64 ttbr0;
>>>> +     u32 fsr;
>>>> +     u32 fsynr0;
>>>> +     u32 fsynr1;
>>>> +     u32 cbfrsynra;
>>>> +     u32 contextidr;
>>>> +};
>>>> +
>>>>   struct arm_smmu_domain {
>>>>        struct arm_smmu_device          *smmu;
>>>>        struct io_pgtable_ops           *pgtbl_ops;
>>>> @@ -380,6 +390,7 @@ struct arm_smmu_domain {
>>>>        const struct iommu_flush_ops    *flush_ops;
>>>>        struct arm_smmu_cfg             cfg;
>>>>        enum arm_smmu_domain_stage      stage;
>>>> +     struct arm_smmu_context_fault_info cfi;
>>>
>>> Does this mean we have to serialise all faults for a given domain? That
>>> can't be right...
>>>
>>> Will
>>
>> They are already serialized? There's only one of each register per
>> context bank, so you can only have one context fault at a time per
>> context bank, and AFAIK a context bank is 1:1 with a domain. Also this
>> struct is only written and then read inside the context bank's
>> interrupt handler, and you can only have one interrupt at a time, no?
>>
>> Connor
> 
> And if it was a race condition with cfi getting overridden, it would
> have already been an equivalent race condition currently when reading
> the values from registers (ie. the register values could have changed
> in the elapsed time)
> 
> So no additional serialization needed here.

Agreed, the only subtlety is the other side of things is true as well - 
i.e. cfi is only valid and stable between the IRQ being fired and 
CBn_RESUME being written, so actually it *mustn't* be touched by 
anything outside the fault handling path.

Thanks,
Robin.

