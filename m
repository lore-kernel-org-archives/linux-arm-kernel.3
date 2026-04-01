Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD27FF4937
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 03:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFEbBz5PX3/2nKejuwiTzZ1wLRp35lxUWahBRNogyRE=; b=p6xk6f1Ni6T0g4Qkc3/p1KgS1I
	jiDyS0FnRdqn3ouLpOZAFV21R1rXrQO9vfmV/iR7AYkSmQulsVz9DNEREwLOsNdrgeWCTbCgKmrAl
	W7nzheKq5C8mVMz5FDMVucCaIhWTQwRzsHK+8gzsBXqxD/rdNOERD4oRzWvkrQL9cGJ10l1cuoWwJ
	QNlVEOhfDWOLMcbv1wp+w4IG3VLKY7vwtMifqwCVbMQCAoOC/bnSgSverIvjP2adaHWCQQYiIpNaX
	QSCcDL/156BW2BNMtyVzbbmrGCRa7yk+dQnqNyAkX4acp4IDniuRrnoWUQ1AVkbFA+TBJqHUmyIpC
	VmR+5wUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7mMN-0000000DuN4-3IcZ;
	Wed, 01 Apr 2026 03:35:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7mML-0000000DuMi-3yuB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 03:35:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78AB21684;
	Tue, 31 Mar 2026 20:35:06 -0700 (PDT)
Received: from [10.164.18.48] (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27EA33F915;
	Tue, 31 Mar 2026 20:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775014512; bh=pHLdzIu+gjxC8ubRM8t7HQ1rx7VU+czt+7QSkF6RexQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TpU8p+yaz5ZkoAfZgdhaDqiYu+XvtASRD0PAfFRXfNrZQqQ+OZMjavngUDyfTK49h
	 B1STbsN9GKYDvOEVSKo5p3c1WyLqRUre3IFXzsxQobU0oltK1V/dUyRlOyrKiuvVL4
	 VHB2f/gkee1m74OCIp8sCR5twGyxnPihUN7ePRI8=
Message-ID: <3e14049e-dc9d-46ae-91bd-6cca09245907@arm.com>
Date: Wed, 1 Apr 2026 09:05:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/30] KVM: arm64: Kill exec_fault from kvm_s2_fault
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-21-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260327113618.4051534-21-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_203514_057435_5EE60EE2 
X-CRM114-Status: GOOD (  13.65  )
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



On 27/03/26 5:06 PM, Marc Zyngier wrote:
> Similarly to write_fault, exec_fault can be advantageously replaced
> by the kvm_vcpu_trap_is_exec_fault() predicate where needed.
> 
> Another one bites the dust...
> 
> Tested-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/kvm/mmu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 7dab0c3faa5bf..e8bda71e862b2 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1711,7 +1711,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>  }
>  
>  struct kvm_s2_fault {
> -	bool exec_fault;
>  	bool writable;
>  	bool topup_memcache;
>  	bool mte_allowed;
> @@ -1857,7 +1856,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>  		fault->writable = false;
>  	}
>  
> -	if (fault->exec_fault && fault->s2_force_noncacheable)
> +	if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu) && fault->s2_force_noncacheable)
>  		return -ENOEXEC;
>  
>  	/*
> @@ -1877,7 +1876,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>  	if (fault->writable)
>  		fault->prot |= KVM_PGTABLE_PROT_W;
>  
> -	if (fault->exec_fault)
> +	if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu))
>  		fault->prot |= KVM_PGTABLE_PROT_X;
>  
>  	if (fault->s2_force_noncacheable)
> @@ -1984,7 +1983,6 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  		.logging_active = logging_active,
>  		.force_pte = logging_active,
>  		.prot = KVM_PGTABLE_PROT_R,
> -		.exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu),
>  		.topup_memcache = !perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu)),
>  	};
>  	void *memcache;


