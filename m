Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DA2CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6nqL2pmL14wnGK+viK/sxZI1IOcFxqNHP3eMXSmelY=; b=LHZrpbxRViU1bnVsw4ApXilCXb
	cwriwtzqO2tnCr4GaskL4QUGDavMRu2sgP5UymmxzArVpW0jTTt6qEYa5fo5I6Vz2ib+c0gm6x5zF
	zjMT7ZRXKZZPuzamEhin3GsMgWMaPcrmBoe5/T4UEN1rFMr6Mx9vW86KxiBqmF0Uwru+Fxfcl3mYW
	MAHjr2Xw9nvQbrZk8jx6tKKA0Qf+kVRUloca7GCjEYWJnqTnjVS9Azfh4yyNks+vxZxWpsrci1uQ0
	WpIZVKGPAYK/oZSJRo7toBTxA1UZ9cye3kUI9UPw2mBo1woAx7NNJg4LuW4BpVSnVNewEigLiclIv
	vgyjHfWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPK5-00000005E0N-05WF;
	Mon, 10 Nov 2025 10:40:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPJw-00000005Dxo-3LW8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 10:40:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78DC8497;
	Mon, 10 Nov 2025 02:40:16 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03D223F66E;
	Mon, 10 Nov 2025 02:40:22 -0800 (PST)
Message-ID: <a914297b-753b-4fa0-8ffc-3a64b006316c@arm.com>
Date: Mon, 10 Nov 2025 10:40:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/45] KVM: arm64: Turn vgic-v3 errata traps into a
 patched-in constant
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Christoffer Dall <christoffer.dall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Yao Yuan <yaoyuan@linux.alibaba.com>
References: <20251109171619.1507205-1-maz@kernel.org>
 <20251109171619.1507205-5-maz@kernel.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251109171619.1507205-5-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_024028_742641_E0C8F9C2 
X-CRM114-Status: GOOD (  14.79  )
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

On 09/11/2025 17:15, Marc Zyngier wrote:
> The trap bits are currently only set to manage CPU errata. However,
> we are about to make use of them for purposes beyond beating broken
> CPUs into submission.
> 
> For this purpose, turn these errata-driven bits into a patched-in
> constant that is merged with the KVM-driven value at the point of
> programming the ICH_HCR_EL2 register, rather than being directly
> stored with with the shadow value..
> 
> This allows the KVM code to distinguish between a trap being handled
> for the purpose of an erratum workaround, or for KVM's own need.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

...

> diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
> index ac5f9c5d2b980..0ecadfa00397d 100644
> --- a/arch/arm64/kvm/vgic/vgic.h
> +++ b/arch/arm64/kvm/vgic/vgic.h
> @@ -164,6 +164,22 @@ static inline int vgic_write_guest_lock(struct kvm *kvm, gpa_t gpa,
>   	return ret;
>   }
>   
> +void kvm_compute_ich_hcr_trap_bits(struct alt_instr *alt,
> +				   __le32 *origptr, __le32 *updptr, int nr_inst);
> +
> +static inline u64 vgic_ich_hcr_trap_bits(void)
> +{
> +	u64 hcr;

minor nit: Do we need a guard to make sure this isn't called before the 
capabilities are finalized (given we may use it outside VM context, e.g. 
VGIC probe). perhaps :

WARN_ON(!system_capabilities_finalized());


> +
> +	/* All the traps are in the bottom 16bits */
> +	asm volatile(ALTERNATIVE_CB("movz %0, #0\n",
> +				    ARM64_ALWAYS_SYSTEM,
> +				    kvm_compute_ich_hcr_trap_bits)
> +		     : "=r" (hcr));


Suzuki

