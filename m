Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D009CED60F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 11:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUkvBqC7X/FDotDhaEe45S1C2VHNQnhuVshU53dzpNU=; b=iepJZRVL2LqA2KAvgUJaOib9yv
	DDR2VRK9NIZjEr/trCpuZ9VyIZUfH5dUAXVYDK+/mNs3f6QWY765tTVNPmFpaSeiXVhUFZp/QrCKE
	VV59U8ZAoEWONM1qv0FIzCHXHBvpU/LAisry5M7adCcoGdvIDR5gsU9KGaEou8ov9RleQBqTSq2Fg
	AMt0HtJOe5Sb/XK6NCYmhnbEQdRTlTaOm58uE3XwO2ZSd0hi+G6sqFmMvBzeJY3ycfIv5EF3ryk7S
	mn4JsbGD915UUMxdObtJq7WXr+8czXdC8uMQ+JnJqjOP7XG+He38xR855AQIK+oZ2pRoD2xcjwrZR
	XJXPNIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJcT-00000000J5z-1rlj;
	Tue, 18 Nov 2025 11:11:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJcQ-00000000J5D-2c8d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 11:11:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 912EB1007;
	Tue, 18 Nov 2025 03:11:20 -0800 (PST)
Received: from [10.57.73.50] (unknown [10.57.73.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CBB83F66E;
	Tue, 18 Nov 2025 03:11:26 -0800 (PST)
Message-ID: <3413a31a-6949-4a2c-95d0-97aa72823216@arm.com>
Date: Tue, 18 Nov 2025 11:11:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
Content-Language: en-GB
To: Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
 joey.gouly@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 vladimir.murzin@arm.com
References: <20251118103807.707500-1-tabba@google.com>
 <20251118103807.707500-3-tabba@google.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251118103807.707500-3-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_031130_702930_98E2FB9C 
X-CRM114-Status: GOOD (  14.88  )
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

On 18/11/2025 10:37, Fuad Tabba wrote:
> The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
> register accesses. These accesses are trapped to EL2 when the bits are
> clear.
> 
> The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
> had the polarity inverted. When a guest did not support the Trace Buffer
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
> index 8d06a246dfd1..f6f8996c4f97 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
>   		val |= MDCR_EL2_TTRF;
>   
>   	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
> -		val |= MDCR_EL2_E2TB_MASK;
> +		val &= ~MDCR_EL2_E2TB_MASK;

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>



