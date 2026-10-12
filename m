Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEC2CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YrQ9zOVkgWgQ/3zymIULToD1dBWa/+qOqL56R94dm8=; b=eYSGP0oL/Z9sGeT5caS1dFd2U7
	TA9I87kc5HtzssUzAjaJWZ2TNmfo84EoYqmBFoU+JBfqby/VcQp/mXrju1o6owCYDA20/UuqRVxRw
	7w7u7gLwcTY7ED92SnAjqwtZXggfgosHt44xqQcnUP/LjYhNVnHJ8Bqu+YreeJwxewKKkbnclWRGS
	s7oF5NuhweqhtJy/dW3KzK+OwhJ0td4F8BXqCnFQVzxkXB4jig6NB5Z46wRQ7hRPE5H6dwhKc/AUp
	KLXvviTxg/iowUPFIGiHhs4LnBBFAMnHRqSXf4fvBnvbEASG2JHH95xfFr+EgrNhoRa5kwklqhCsd
	Cr8GQpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDUv-0000000AGyw-0tMx;
	Mon, 12 Oct 2026 10:43:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDUs-0000000AGyK-2Ae4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:43:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BEA71655;
	Mon, 12 Oct 2026 03:43:06 -0700 (PDT)
Received: from [10.0.128.125] (Suzukis-MBP.cambridge.arm.com [10.0.128.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 175983F66F;
	Mon, 12 Oct 2026 03:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791801789; bh=wxKPMgVdqQs8f3ozDud5AHV0AleLO9sbUs1KNlaMwiQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gqfBpIsa8MgxhW9DUlEvs4HuSOq3Vj7/vxqVW3nO3wnF2B+HjWPJ6oXZTBgfyn/R2
	 mfGbyF8+CHP4frwxGmu0lwXFW2J+p4VK7PAPRXawy9ua2Prfz+U+tW4046CzXkU+nw
	 3r7r6EmoQiV8x3+qM8/B3hoqQQJeySBeu4pB4d+A=
Message-ID: <b941a0c8-6d17-4a21-9eb7-30ad06bd6748@arm.com>
Date: Mon, 12 Oct 2026 11:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] KVM: arm64: Reject the GICv5 CPU interface
 hypercalls under pKVM
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, maz@kernel.org, oupton@kernel.org,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
 seiden@linux.ibm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
 vdonnefort@google.com, qperret@google.com, Sascha.Bischoff@arm.com,
 steven.price@arm.com, tabba@google.com
References: <20261011143648.211337-1-fuad.tabba@linux.dev>
 <20261011143648.211337-2-fuad.tabba@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261011143648.211337-2-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_034310_599580_1AAFC9C7 
X-CRM114-Status: GOOD (  12.59  )
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

On 11/10/2026 15:36, Fuad Tabba wrote:
> __vgic_v5_save_apr() and __vgic_v5_restore_vmcr_apr() remain callable
> once pKVM has finalised. pKVM never registers a GICv5 vgic, so neither
> has a valid caller in protected mode, and on a GICv3 machine both reach
> a register that is UNDEFINED at EL2 and panic the hypervisor.
> 
> Move both into the band the dispatcher rejects once pKVM has finalised.
> 
> Fixes: af325e87af5da ("KVM: arm64: gic-v5: Add vgic-v5 save/restore hyp interface")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   arch/arm64/include/asm/kvm_asm.h   | 4 ++--
>   arch/arm64/kvm/hyp/nvhe/hyp-main.c | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index e5b92ac09e69e..ea319c496bb26 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -62,6 +62,8 @@ enum __kvm_host_smccc_func {
>   	__KVM_HOST_SMCCC_FUNC___kvm_enable_ssbs,
>   	__KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
>   	__KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
> +	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
> +	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
>   
>   	MARKER(__KVM_HOST_SMCCC_FUNC_MIN_PKVM),
>   

Any calls above are rejected after pKVM is initialized, so the calls are 
indeed rejected.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>



