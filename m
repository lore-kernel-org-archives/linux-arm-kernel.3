Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5207FCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXm0/365RTsKvG9N91R+Ah8QPCSt4yaXdZ0cqx8tnlw=; b=EUxj2ScyElUMU7MsGyjS7IIMro
	MGu1lTD/Z/FsL037QExEWXcqTQytLRKmveuzYXfOxM1N7CRh7xOHZD0IHW5eSjxqXty06iGtDQOhZ
	Cw3oF6zTdCdjxJzL0I9je8eRil0+28ZbLAXzrWR0rLfxStWVmfl5GprHT1l05wS4CVa+5XVLil/w8
	vlgDClZmu8O0qY9cGYY2RrxSoui+c+gnHxxzD9qb/D8xxLiqRUjX1nWAbGZhCZusofiB2KSgBf/mg
	6KEEvDEmUT//ncgCTm9BNy/QDj0mz3F3yoxbdW2Pe0LFBmYd4cDIGwoB2wik7C/8d2Ln29BGNgkf9
	DzDxgKqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLAk-0000000CIqE-36T6;
	Tue, 04 Nov 2025 17:50:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLAj-0000000CIpa-0Qs9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:50:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C99971CE0;
	Tue,  4 Nov 2025 09:50:09 -0800 (PST)
Received: from [10.57.71.89] (unknown [10.57.71.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB1F33F66E;
	Tue,  4 Nov 2025 09:50:15 -0800 (PST)
Message-ID: <a0b19558-dbcb-4231-b0c4-302cc10652db@arm.com>
Date: Tue, 4 Nov 2025 17:50:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
Content-Language: en-GB
To: Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
 joey.gouly@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 vladimir.murzin@arm.com
References: <20251104125906.1919426-1-tabba@google.com>
 <20251104125906.1919426-6-tabba@google.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251104125906.1919426-6-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_095021_188181_58351DB2 
X-CRM114-Status: GOOD (  16.50  )
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

On 04/11/2025 12:59, Fuad Tabba wrote:
> The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
> register accesses. These accesses are trapped to EL2 when the bits are
> clear.
> 
> The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
> had the polarity inverted. When a guest did not support the ExtTrcBuff
> feature, the code was setting E2TB. This incorrectly disabled the trap,
> potentially allowing a protected guest to access registers for a feature
> it was not given.
> 
> Fix this by inverting the operation.
> 
> Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 43bde061b65d..df0c59a29b35 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
>   		val |= MDCR_EL2_TTRF;
>   
>   	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, ExtTrcBuff, IMP))

Why are we checkin ExtTrcBuff ? Shouldn't that be TraceBuffer ?

> -		val |= MDCR_EL2_E2TB_MASK;
> +		val &= ~MDCR_EL2_E2TB_MASK;
This looks correct to me.

Suzuki

>   
>   	/* Trap Debug Communications Channel registers */
>   	if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, FGT, IMP))



