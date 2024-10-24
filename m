Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A24CFA451
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/YbuUL2WD+TFE2MQWzqAv9neYxLc4OycxQF7jHpOTqM=; b=buwPmYXtTyMmiHsQF9bwn+ExDc
	0G3AXxGDtHjRWWOG14vcJlrsqjWzBX7GQCLRnjgd/1NM0Gc2KpCNu51DiBPwRlFz6OoDydcp/NjuA
	+rrtr+35KVAj2oiesByZGiloAQvIYLKx7PUHK7qx4cW3bvwkAXn+eWdlaq7+aNvPhJMF2ScgCFtnZ
	ADx3O6FRConJ1uzkVopBrZnWSIxFdRdAXM6l+8YgeeMChM74VlJms0H96GVZWMgJcvOsccK0dmp5k
	1iCYMO41gIvNOC1rDClydnLjJfucltL9EsT/eyd8p5TMaoibAnylu+N3Xh/tAKRBFm2gItLMAuA6S
	FX1KTzdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3upp-000000001I0-34Q3;
	Thu, 24 Oct 2024 10:12:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ugz-0000000006i-16zh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:04:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41098339;
	Thu, 24 Oct 2024 03:04:12 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 663FD3F71E;
	Thu, 24 Oct 2024 03:03:41 -0700 (PDT)
Date: Thu, 24 Oct 2024 11:03:36 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 08/37] KVM: arm64: Correctly access TCR2_EL1, PIR_EL1,
 PIRE0_EL1 with VHE
Message-ID: <20241024100336.GA1382116@e124191.cambridge.arm.com>
References: <20241023145345.1613824-1-maz@kernel.org>
 <20241023145345.1613824-9-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023145345.1613824-9-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_030345_461893_960261DC 
X-CRM114-Status: GOOD (  21.22  )
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

On Wed, Oct 23, 2024 at 03:53:16PM +0100, Marc Zyngier wrote:
> For code that accesses any of the guest registers for emulation
> purposes, it is crucial to know where the most up-to-date data is.
> 
> While this is pretty clear for nVHE (memory is the sole repository),
> things are a lot muddier for VHE, as depending on the SYSREGS_ON_CPU
> flag, registers can either be loaded on the HW or be in memory.
> 
> Even worse with NV, where the loaded state is by definition partial.
> 
> For these reasons, KVM offers the vcpu_read_sys_reg() and
> vcpu_write_sys_reg() primitives that always do the right thing.
> However, these primitive must know what register to access, and
> this is the role of the __vcpu_read_sys_reg_from_cpu() and
> __vcpu_write_sys_reg_to_cpu() helpers.
> 
> As it turns out, TCR2_EL1, PIR_EL1, PIRE0_EL1 and not described
> in the latter helpers, meaning that the AT code cannot use them
> to emulate S1PIE.
> 
> Add the three registers to the (long) list.
> 
> Fixes: 86f9de9db178 ("KVM: arm64: Save/restore PIE registers")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Joey Gouly <joey.gouly@arm.com>
> ---
>  arch/arm64/include/asm/kvm_host.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 329619c6fa961..1adf68971bb17 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1030,6 +1030,9 @@ static inline bool __vcpu_read_sys_reg_from_cpu(int reg, u64 *val)
>  	case TTBR0_EL1:		*val = read_sysreg_s(SYS_TTBR0_EL12);	break;
>  	case TTBR1_EL1:		*val = read_sysreg_s(SYS_TTBR1_EL12);	break;
>  	case TCR_EL1:		*val = read_sysreg_s(SYS_TCR_EL12);	break;
> +	case TCR2_EL1:		*val = read_sysreg_s(SYS_TCR2_EL12);	break;
> +	case PIR_EL1:		*val = read_sysreg_s(SYS_PIR_EL12);	break;
> +	case PIRE0_EL1:		*val = read_sysreg_s(SYS_PIRE0_EL12);	break;
>  	case ESR_EL1:		*val = read_sysreg_s(SYS_ESR_EL12);	break;
>  	case AFSR0_EL1:		*val = read_sysreg_s(SYS_AFSR0_EL12);	break;
>  	case AFSR1_EL1:		*val = read_sysreg_s(SYS_AFSR1_EL12);	break;
> @@ -1076,6 +1079,9 @@ static inline bool __vcpu_write_sys_reg_to_cpu(u64 val, int reg)
>  	case TTBR0_EL1:		write_sysreg_s(val, SYS_TTBR0_EL12);	break;
>  	case TTBR1_EL1:		write_sysreg_s(val, SYS_TTBR1_EL12);	break;
>  	case TCR_EL1:		write_sysreg_s(val, SYS_TCR_EL12);	break;
> +	case TCR2_EL1:		write_sysreg_s(val, SYS_TCR2_EL12);	break;
> +	case PIR_EL1:		write_sysreg_s(val, SYS_PIR_EL12);	break;
> +	case PIRE0_EL1:		write_sysreg_s(val, SYS_PIRE0_EL12);	break;
>  	case ESR_EL1:		write_sysreg_s(val, SYS_ESR_EL12);	break;
>  	case AFSR0_EL1:		write_sysreg_s(val, SYS_AFSR0_EL12);	break;
>  	case AFSR1_EL1:		write_sysreg_s(val, SYS_AFSR1_EL12);	break;

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

