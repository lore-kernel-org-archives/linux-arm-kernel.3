Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE94C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QM3RRP0XaDNOOfeZlTYgg6PVua/cy0zRQi7OH6IuckU=; b=r54dPHW2BTmwNjcnEX/+FTmhlT
	lw3pcqi4x39y30Xdg898aiGafpZjXydB4OlxRgV5wqQdJ+bxl5VfUGyamfhnO3pdC5If6nlLfsSZ8
	ly6o92x0u1IbG7IZGu6B1wSBQPPeVYfOCuoCJ20bv5wRFgxk+NacrArqe27hqUEGZ+5V3IZKzMjjI
	YPlE+IH5FQ5b0LzNblyjwIyv34kDT8mCyzXxW+0IJaBGawnxCDHv+N8Bj2DV38U8R/2ruQucSRCom
	U3MpObM2xNw1k6BZgz01440vgH3o7BfD332bmQtaeH5YFxvpe21JYZ2NZHpjs4ZbnCQ/IiKoGhD+z
	HnpDlgWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FI6-0000000Bzce-49sn;
	Thu, 17 Sep 2026 16:48:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FI3-0000000BzbZ-3CAk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 16:48:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1422143D;
	Thu, 17 Sep 2026 09:48:46 -0700 (PDT)
Received: from [10.57.6.197] (unknown [10.57.6.197])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 886E13F86F;
	Thu, 17 Sep 2026 09:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789663730; bh=v2C7EiRZuO4diAaDVWghy6mD5U5YPo2XvV9CYJSeGiQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dbf7TZpWogEREN5RtxsT/Ausx25/I4HOlW/ITLaj4+pQXjm4b7U/AGcpjhwZoulPA
	 gVQE4SzxWT43WU1WQtx3stH4r63UHBcaPC3cu+7Z+VBaHDnmHer/mADG0jng9X3W14
	 CT+yQz3WNYuJywEWBzHIlrYl+7VHRdeC1KfxlkUg=
Message-ID: <888527d9-6355-45fc-b4a1-e485ae32d377@arm.com>
Date: Thu, 17 Sep 2026 17:48:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 12/23] KVM: arm64: Widen the scope of "protected" VMs
Content-Language: en-GB
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
 <20260915160141.3543048-13-suzuki.poulose@arm.com>
 <CA+EHjTxfbG6-LPjJVoErQ3iJk4vAvhVO=Qv6hjcxDXL0yByiQA@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTxfbG6-LPjJVoErQ3iJk4vAvhVO=Qv6hjcxDXL0yByiQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_094851_869159_BA873F9C 
X-CRM114-Status: UNSURE (   9.30  )
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

On 17/09/2026 12:51, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On Tue, 15 Sep 2026 17:01:30 +0100, Suzuki K Poulose
> <suzuki.poulose@arm.com> wrote:
> [...]
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> [...]
>> -#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
>> +#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor >= __VM_PROTECTED)
>> +#define kvm_vm_is_protected_pkvm(kvm)        ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
>>   #define kvm_vm_is_unprotected_pkvm(kvm)        ((kvm)->arch.vm_flavor == VM_PKVM)
> 
> Agree with Marc that this belongs in patch 5. When it moves, could you
> add vcpu_is_protected_pkvm() next to vcpu_is_protected()? The pKVM
> host-side series [1] has vcpu_is_protected() checks that are pKVM
> mechanism (the vCPU feature allowlist, CPU_ON against the pKVM
> power-off state, the ONE_REG rejection after the first run), and with
> the wider predicate those have to carry a pKVM-specific name.

Ack.

Suzuki

> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20260914113338.159227-1-fuad.tabba@linux.dev/


