Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9A3C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPRnO5G/WJmfBIgqqAqe9xIpgfcnJjnnYojt08KwWF8=; b=1R2St8NZyi/9UfViMH8CfYfISv
	DS8v5IZuerfD/naqgkstmp7fuJAFLK3Sr1aWcQwxubYOfQaNtBkBI2M1rb1szf9qN8jANCWsWCjmB
	GeSk6BU03l/RswgscfPX8qbM1Oxm0SpubXTNiJqjm4L6UIPO8QJKizdBmgJvssR5JSo6lkWoVBb01
	SREusaMAXz2ILPU3juP6uzy2njOJxbDRU23uoiNbVGZpLprLbQnaN+dJHaJfXCDEvuoOfy9mldZTs
	na5tkEm9q1EwZfY5iNCXKh46mvI9f3+Ibx+aa5f66xrE27er/tcFRs7rGWW/g4EAKCms+TZBVZRSM
	s2XhM+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJC0-0000000Gzhk-3L8F;
	Thu, 16 Jul 2026 10:19:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJBy-0000000GzhJ-1uuI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 10:19:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40AF12F;
	Thu, 16 Jul 2026 03:19:40 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E8113F7B4;
	Thu, 16 Jul 2026 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784197184; bh=3WOmSOJUE6+XMbdwY5Q6POKB6yIL5s1FNm2WoXf4Wfg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NFjy308AFS81BzQdrpSGjAeDy6Hf7XBhjRBE/6OcoG++oXkcBCD3OSw5h600E3GjH
	 swcDTklYpzr57MS9w5mD4mVaMFTx5pmujDBtvqTsjX3msSQKcHOg3UMlDpP8j+7+ZC
	 LCM09mvWgzo9NUJrHI2aV29iJK9cv0lkKVG7uWkQ=
Message-ID: <5c03fc19-43c1-4828-ab8d-4777ba5ff4f3@arm.com>
Date: Thu, 16 Jul 2026 11:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 27/37] KVM: arm64: CCA: Allow userspace to inject
 aborts
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-28-steven.price@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260715142841.80544-28-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_031946_602435_6D9FBE8D 
X-CRM114-Status: GOOD (  24.28  )
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

On 15/07/2026 15:28, Steven Price wrote:
> From: Joey Gouly <joey.gouly@arm.com>
> 
> Extend KVM_SET_VCPU_EVENTS to support realms, where KVM cannot set the
> system registers, and the RMM must perform it on next REC entry.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


>   Documentation/virt/kvm/api.rst |  2 ++
>   arch/arm64/kvm/guest.c         | 24 ++++++++++++++++++++++++
>   2 files changed, 26 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index e39d146b34a3..85bec9b4f021 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -1314,6 +1314,8 @@ User space may need to inject several types of events to the guest.
>   Set the pending SError exception state for this VCPU. It is not possible to
>   'cancel' an Serror that has been made pending.
>   
> +User space cannot inject SErrors into Realms.
> +
>   If the guest performed an access to I/O memory which could not be handled by
>   userspace, for example because of missing instruction syndrome decode
>   information or because there is no device mapped at the accessed IPA, then
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 3e970c4f6214..5469c9a97fad 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -827,6 +827,30 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
>   	u64 esr = events->exception.serror_esr;
>   	int ret = 0;
>   
> +	if (vcpu_is_rec(vcpu)) {
> +		/* Cannot inject SError into a Realm. */
> +		if (serror_pending)
> +			return -EINVAL;
> +
> +		/*
> +		 * If a data abort is pending, set the flag and let the RMM
> +		 * inject an SEA when the REC is scheduled to be run.
> +		 */
> +		if (ext_dabt_pending) {
> +			/*
> +			 * Can only inject SEA into a Realm if the previous exit
> +			 * was due to a data abort of an Unprotected IPA.
> +			 */
> +			if (!(vcpu->arch.rec.run->enter.flags & REC_ENTER_FLAG_EMULATED_MMIO))
> +				return -EINVAL;
> +
> +			vcpu->arch.rec.run->enter.flags &= ~REC_ENTER_FLAG_EMULATED_MMIO;
> +			vcpu->arch.rec.run->enter.flags |= REC_ENTER_FLAG_INJECT_SEA;
> +		}
> +
> +		return 0;
> +	}
> +
>   	/*
>   	 * Immediately commit the pending SEA to the vCPU's architectural
>   	 * state which is necessary since we do not return a pending SEA


