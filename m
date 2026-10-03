Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E93CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 16:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enXH7320ifaUXA5MfrqFITor839IBio6m2WtR6Wf3pM=; b=yvriJ+/cBTNfdGZZIa3m3G+ewr
	PzXuCMjebyeB9TkByASuiLeiIN9mBgXVYQCG4tEu0dmCA75CNns/KOqirQ7Wma0FxmWA8CJZ6F5O0
	HOqdJ4kDgV/gLfZOxbBmZAykOzzJDiLfZT4PlwP/qB5ik2F/gLKow2y2UKM/G0AV72nOdL3aXn6WM
	DLRP+lT+qQLytdGQD0Bx0sz9NZxLzVgETUq2dRl6uelm8Lv2DY7as9aIizEJ3s3wuSxsceg35UZdX
	vSineuYcoB4YRmSeKaBvb1uatFqlsayZaguWXT+IllnVKkZpsBU8xlhZyUOP3EbxBw1ttdFVM7aU/
	2mhcqJqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD2Lp-0000000DjiK-2UM4;
	Sat, 03 Oct 2026 16:12:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD2Ln-0000000Dji0-0Llf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 16:12:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76E9F143D;
	Sat,  3 Oct 2026 09:12:33 -0700 (PDT)
Received: from [10.57.8.170] (unknown [10.57.8.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA0A33F763;
	Sat,  3 Oct 2026 09:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791043956; bh=h6+kAYhTqNCk5jLCyFcVvQkz7TJRrMZczCzt8KPp5zw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=WeJ4ekDixCXQNFuyz6q1fIRyA0ToG+nK0I3VpV4M10UQbtKTYc2w28Vgi9UT+YFXD
	 9PwheUiXaPqI7spjj6FU6ER+i/8EYTnpEPDWoNDHaFgHT4tyYGRkFXFvtPF7KHxSLo
	 14PbVYgk7AwPUHBBcevGV+xFjAzPFmtlLgUioF6o=
Message-ID: <ce2e8885-d848-48d3-b82e-49fcd9a6cfcc@arm.com>
Date: Sat, 3 Oct 2026 17:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 10/23] KVM: arm64: Add VM specific callback for S2 MMU
 operations
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, will@kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-11-suzuki.poulose@arm.com>
 <86ik3j2m5v.wl-maz@kernel.org> <9873fb9d-6f32-46f6-bcac-6a52e293d011@arm.com>
In-Reply-To: <9873fb9d-6f32-46f6-bcac-6a52e293d011@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_091239_162874_03C4BBA9 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

On 03/10/2026 16:30, Suzuki K Poulose wrote:
> On 03/10/2026 10:01, Marc Zyngier wrote:
>> On Thu, 01 Oct 2026 22:06:50 +0100,
>> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>>
>>> Add VM type specific S2 MMU operation backends which can be 
>>> initialized per
>>> VM flavor, to keep the handling cleaner.
>>>
>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>>> Tested-by: Gavin Shan <gshan@redhat.com>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> ---
>>> Changes since v19:
>>>   - Add a blank line in kvm_arch_flush_remote_tlbs()
> 
> 
>>>   struct kvm_s2_mmu {
>>>       struct kvm_vmid vmid;
>>> @@ -332,6 +345,8 @@ struct kvm_arch {
>>>        */
>>>       u64 fgu[__NR_FGT_GROUP_IDS__];
>>> +    const struct kvm_vm_s2_ops *vm_s2_ops;
>>> +
>>
>> If you're touching this patch, can you please move this pointer next
>> to the vcpu_ops pointer?
> 
> Sure, I will do that.

Sorry, this is only stored in kvm_arch, while the vcpu_ops are stored
in the vcpu_arch, to avoid pointer chasing vcpu->kvm->arch->.

I could move it closer to the vm_flavor ?

Cheers
Suzuki


