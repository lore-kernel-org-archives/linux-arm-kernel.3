Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599B9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 00:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwJZ5fDbgmSR+ahAQmiwhuMgMix6CJj7qh6ixmGfCak=; b=2uMjKxzu/7g3q/6nAWXc6PHH2/
	8muikrKJTg94Rrf40JMN9nSXmtK70k2/thHpX1rRTMnjuy865bnwds5nODJ6EP3XZvM/S5Yi4IxAX
	EKRsSXTM583as6MTYySdw2JfsYEa6CfUpeR970EeFJPD3PYL+EGFhGnN3yfl9d6h3Fc5KHsgPf66P
	7l07zBK4o67R5xQeKDwkcGcEUXgMF0VaGmkuF3efg623zq0O4Z5slrOdrhDbI0STvhaUeKZ0qAKa1
	pu46UX4N0FvRYlxyyyOTgq/Z4q8jgRARRXLvojCyfxU8PVbbYN3F/k4E6ov4vCOx+z1Cb89GPXVPL
	68nOnm4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjR2d-0000000AbXE-16nf;
	Tue, 14 Jul 2026 00:30:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjR2b-0000000AbX6-471j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 00:30:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1575560120;
	Tue, 14 Jul 2026 00:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9045A1F000E9;
	Tue, 14 Jul 2026 00:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783989028;
	bh=HwJZ5fDbgmSR+ahAQmiwhuMgMix6CJj7qh6ixmGfCak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XZfpObAHeg8LWfDAIVeaDnwOHoYt6s07qQxfji5bFHlBxmhmIi1GMBms0Ei3w6+HH
	 UsY1hf8lvwjnTyET7dQG2mLbyPs0GSc9BeTORNQmfEDWMNY//0fLRIga60d0lZnGRS
	 qe13vDplIlSV1+gM/FB4GIY+ImjGiz2kFiOEFzDadMCZ7YLeezyGsGJh+DMl6teH4g
	 JnfXTO3ORKkLDFqBv6hnFDT13VRatuMaTj3TusR3Nu/wpQMaU8OlZwbSWuEdTyY+HB
	 2QbOaJs8+zI0hztq691GAgedgDDhO4ejk48hTqZ/i28LoOYTSXHPbdntgq7vHG27xC
	 3zZ6+U7pL1rsg==
Date: Mon, 13 Jul 2026 17:30:27 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v4 2/8] KVM: arm64: Make vcpu_{read,write}_sys_reg
 available to HYP code
Message-ID: <alWDI7uj9YFedXET@kernel.org>
References: <20260706095927.560795-1-fuad.tabba@linux.dev>
 <20260706095927.560795-3-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706095927.560795-3-fuad.tabba@linux.dev>
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

Hi Fuad,

On Mon, Jul 06, 2026 at 10:59:21AM +0100, Fuad Tabba wrote:
> The vcpu_{read,write}_sys_reg() accessors are host-only, so helpers
> built on them such as kvm_vcpu_set_be()/kvm_vcpu_is_be() cannot be
> shared with hyp code. exception.c already wraps them in
> __vcpu_{read,write}_sys_reg(), which pick the host- or hyp-side accessor
> via has_vhe() and so are valid in any context.
> 
> Move those wrappers to kvm_emulate.h as kvm_vcpu_{read,write}_sys_reg()
> and switch the callers over, so a follow-up series can share that
> emulation code at EL2.
> 
> No functional change intended.
> 
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/include/asm/kvm_emulate.h | 22 +++++++++++++++---
>  arch/arm64/kvm/hyp/exception.c       | 34 ++++++++--------------------
>  2 files changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 5bf3d7e1d92c7..80b30fead3d16 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -506,6 +506,22 @@ static inline unsigned long kvm_vcpu_get_mpidr_aff(struct kvm_vcpu *vcpu)
>  	return __vcpu_sys_reg(vcpu, MPIDR_EL1) & MPIDR_HWID_BITMASK;
>  }
>  
> +static inline u64 kvm_vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
> +{
> +	if (has_vhe())
> +		return vcpu_read_sys_reg(vcpu, reg);
> +
> +	return __vcpu_sys_reg(vcpu, reg);
> +}
> +
> +static inline void kvm_vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
> +{
> +	if (has_vhe())
> +		vcpu_write_sys_reg(vcpu, val, reg);
> +	else
> +		__vcpu_assign_sys_reg(vcpu, reg, val);
> +}
> +

Can you instead name the wrappers vcpu_{read,write}_sys_reg() and rename
the current implementations, like __vcpu_{read,write}_sysreg_vhe()?

Just want to avoid confusion between kvm_vcpu_ and vcpu_

Thanks,
Oliver

