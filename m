Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CCAC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDp6QAQVBbqcbjhun7HZkm4ce/Tk1AAMzwD4Ki2+UTk=; b=bDGCNDPm+KHLxJ+yKifVrjqwP6
	V/nQ7VZP5ztBNrxKvytmdhkohcl82FMDy2unoMXmkmQv0/biMOzYkFpvSWOPyznL0cB53GYhxBQmx
	wCQCcRbYAV3xCWmJw/u67qBx9sl5BZcaZqZcZCbg6HCkdSvBRuE3g3kzKHnW2ewJaXICU50yUT3KL
	b7JsRQinuDB+lIFpxdjPnymzLOSQbYQOs0R05T7cWCAQEzyvD3giz8pL5NFbBpzlLYUHZbeDLxVWN
	vhqZdXAmgGktfsRzBQS34AUDYl0AE5Aj6Vz+DfHo8fwRiPpvqlp58YGuqXJF7yNxBhS3ZSJofsSnb
	j05cPt6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9By-0000000Fa4U-2g66;
	Fri, 24 Jul 2026 06:15:30 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9Bu-0000000Fa26-3It2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784873724; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=aDp6QAQVBbqcbjhun7HZkm4ce/Tk1AAMzwD4Ki2+UTk=;
	b=TP6eVXLfTbCk0rwhg8UUyz1cLMd0ZtB1i0x1iJCyvgU2NbXcF6LqZ0lNxMDRG1xyURSv1uEcSiR+QW8CibCmnYleFITvc+h9rKpuiG2FhmaBSlaR2f2Y29DzipQI5CRWiGj0g858DB7EPA+uj1x4aATTN4CqdEF+YYdtv3Yo904=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R601e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7iEB63_1784873724;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X7iEB63_1784873724 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jul 2026 14:15:24 +0800
Date: Fri, 24 Jul 2026 14:15:23 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 19/28] KVM: arm64: Make HCR_EL2 a non-VNCR register
Message-ID: <eq54itdtb62ubzkapzrqxbnv7nkwfzhxehkuvy4nm5st5525kx@2rxzly5g3mjs>
References: <20260722074234.3330999-1-maz@kernel.org>
 <20260722074234.3330999-20-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722074234.3330999-20-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_231527_099638_ACA7B23C 
X-CRM114-Status: GOOD (  23.40  )
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

On Wed, Jul 22, 2026 at 08:42:25AM +0800, Marc Zyngier wrote:
> FEAT_NV3 makes a fundamental change to the architecture, by moving
> guest-initiated HCR_EL2 accesses to the NVHCR_EL2 register. As the
> names suggests, this is HCR_EL2 for a NV guest.
>
> But where do NVHCR_EL2 accesses from a guest go? The are redirected
> to the VNCR page, right where HCR_EL2 is stored in the NV2 case.
> Does it hurt? Good. There's more coming.
>
> The challenge here is to make KVM work seamlessly, without rewriting
> everything. Which implies that things such as __vcpu_sys_reg(HCR_EL2)
> must work, no matter the underlying NV implementation.
>
> A simple way to deal with it is to move HCR_EL2's canonical storage
> outside of VNCR for the vast majority of the KVM code, and only have
> a copy at entry/exit times. Given that we don't really support NV3
> yet, this is pretty simple.
>
> In the process, advertise NVHCR_EL2 as the register that now holds
> offset 0x78 in the VNCR page.
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h     | 3 ++-
>  arch/arm64/include/asm/vncr_mapping.h | 2 +-
>  arch/arm64/kvm/hyp/vhe/switch.c       | 9 +++++++++
>  3 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index bae2c4f92ef5c..2648c8a717ba0 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -543,6 +543,7 @@ enum vcpu_sysreg {
>  	MDCR_EL2,	/* Monitor Debug Configuration Register (EL2) */
>  	CNTHCTL_EL2,	/* Counter-timer Hypervisor Control register */
>  	ZCR_EL2,	/* SVE Control Register (EL2) */
> +	HCR_EL2,	/* Hypervisor Control Register */
>
>  	/* Any VNCR-capable reg goes after this point */
>  	MARKER(__VNCR_START__),
> @@ -571,7 +572,7 @@ enum vcpu_sysreg {
>  	VNCR(TFSR_EL1),	/* Tag Fault Status Register (EL1) */
>  	VNCR(VPIDR_EL2),/* Virtualization Processor ID Register */
>  	VNCR(VMPIDR_EL2),/* Virtualization Multiprocessor ID Register */
> -	VNCR(HCR_EL2),	/* Hypervisor Configuration Register */
> +	VNCR(NVHCR_EL2),/* NV Hypervisor Configuration Register */
>  	VNCR(HSTR_EL2),	/* Hypervisor System Trap Register */
>  	VNCR(VTTBR_EL2),/* Virtualization Translation Table Base Register */
>  	VNCR(VTCR_EL2),	/* Virtualization Translation Control Register */
> diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
> index 14366d35ce82f..9e8a49fa8b638 100644
> --- a/arch/arm64/include/asm/vncr_mapping.h
> +++ b/arch/arm64/include/asm/vncr_mapping.h
> @@ -11,7 +11,7 @@
>  #define VNCR_VTCR_EL2           0x040
>  #define VNCR_VMPIDR_EL2         0x050
>  #define VNCR_CNTVOFF_EL2        0x060
> -#define VNCR_HCR_EL2            0x078
> +#define VNCR_NVHCR_EL2          0x078
>  #define VNCR_HSTR_EL2           0x080
>  #define VNCR_VPIDR_EL2          0x088
>  #define VNCR_TPIDR_EL2          0x090
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index 53af19212895d..e5a51dc3cbe5e 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -70,6 +70,9 @@ static u64 __compute_hcr(struct kvm_vcpu *vcpu)
>  		if (!vcpu_el2_e2h_is_set(vcpu))
>  			hcr |= HCR_NV1;
>
> +		/* Publish the guest's view of HCR_EL2 to the HW */
> +		__vcpu_assign_sys_reg(vcpu, NVHCR_EL2, __vcpu_sys_reg(vcpu, HCR_EL2));
> +
>  		/*
>  		 * Nothing in HCR_EL2 should impact running in hypervisor
>  		 * context, apart from bits we have defined as RESx (E2H,
> @@ -549,6 +552,7 @@ static void fixup_nv_guest_exit(struct kvm_vcpu *vcpu)
>  	 */
>  	if (unlikely(host_data_test_flag(VCPU_IN_HYP_CONTEXT))) {
>  		u64 mode = *vcpu_cpsr(vcpu) & (PSR_MODE_MASK | PSR_MODE32_BIT);
> +		u64 hcr;
>
>  		switch (mode) {
>  		case PSR_MODE_EL1t:
> @@ -561,6 +565,11 @@ static void fixup_nv_guest_exit(struct kvm_vcpu *vcpu)
>
>  		*vcpu_cpsr(vcpu) &= ~(PSR_MODE_MASK | PSR_MODE32_BIT);
>  		*vcpu_cpsr(vcpu) |= mode;
> +
> +		/* Publish the latest HCR_EL2 to the emulation */
> +		hcr = __vcpu_sys_reg(vcpu, NVHCR_EL2);
> +
> +		__vcpu_assign_sys_reg(vcpu, HCR_EL2, hcr);

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

>  	}
>
>  	/* Apply extreme paranoia! */
> --
> 2.47.3

