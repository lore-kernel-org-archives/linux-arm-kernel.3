Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCA7C54F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3teXUf8WKpvTFrZ83o1YFXUsepdqCyooJHEVCHxAJY=; b=jmb3oEWxK21mW/snU1SRy3bdLI
	brsWY+7Gw/BlK2tobOw6XEFb45FoV1nHQH3O37zjJnZ7TOF8pBv22CT5fJPpBj8PhuZuG4W11FBbw
	y4IogUDpEiT+tUJ5XCLs6a/Iok+uKIz3faaSs7FkgnmiytA8dKXPiee9IDhYZEmo41Kefo5hUehB7
	bcDP84a30TgxQwoNvVipBNyEfmOtLjQk9Q5qeYctqrCDCp7Vyl1v4HS2TGQywK/FqZ5QWnS1nFW6i
	RwiOVlIyVQH869SnqxbHFdTyCebNv0/twcKcTgDP5CI8DpfU6c2rbl4CA4yT1XKQQZVtJeqMK5N4i
	JasR9fZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4iD-00000008BLs-09g3;
	Wed, 29 Jul 2026 13:52:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4iA-00000008BLA-37J9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:52:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E160F165C;
	Wed, 29 Jul 2026 06:52:34 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AD193F86F;
	Wed, 29 Jul 2026 06:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785333159; bh=bIn3BoKAiPM5c2kEvhjsM3SOvgUjn8PGLLyEVBKJzk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MwUG11p+Auh3CdMpQkUXULpzkUfAYF4bdSD1pHi22trMt022PNZnZ09tbJCGmboZM
	 id5XdrjLFq67IB6MvI9OSSNaUfZ6qT3khYNguFao/WE8obd/s09D0unHK1KTYzs2uh
	 od5ks4+ggIGBvW0AOKpWiYVAV6r24hz9gekvuYVc=
Date: Wed, 29 Jul 2026 14:52:30 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v7 2/8] KVM: arm64: Make vcpu_{read,write}_sys_reg
 available to HYP code
Message-ID: <amoFnupIKfDEzN0F@e143914.arm.com>
References: <20260729131823.2021516-1-fuad.tabba@linux.dev>
 <20260729131823.2021516-3-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729131823.2021516-3-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_065242_958925_83F03484 
X-CRM114-Status: GOOD (  21.98  )
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

On Wed, Jul 29, 2026 at 02:18:17PM +0100, Fuad Tabba wrote:
> The vcpu_{read,write}_sys_reg() accessors abstract where a system
> register lives, but their VHE implementation cannot be linked into the
> nVHE hypervisor, so exception.c open-codes has_vhe() wrappers instead.
> 
> Redirect the accessors to the raw context accessors for nVHE hyp builds,
> where registers are always in memory, and drop the local wrappers. This
> lets hyp code reuse helpers built on the canonical accessors.
> 
> No functional change intended.
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/include/asm/kvm_emulate.h |  6 +++++
>  arch/arm64/kvm/hyp/exception.c       | 34 ++++++++--------------------
>  2 files changed, 15 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 5bf3d7e1d92c7..fb4062b3ce55a 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -506,6 +506,12 @@ static inline unsigned long kvm_vcpu_get_mpidr_aff(struct kvm_vcpu *vcpu)
>  	return __vcpu_sys_reg(vcpu, MPIDR_EL1) & MPIDR_HWID_BITMASK;
>  }
>  
> +/* In nVHE hyp code, registers are always in memory: use the raw accessors. */
> +#if defined(__KVM_NVHE_HYPERVISOR__)
> +#define vcpu_read_sys_reg(v, r)		__vcpu_sys_reg(v, r)
> +#define vcpu_write_sys_reg(v, x, r)	__vcpu_assign_sys_reg(v, r, x)
> +#endif
> +

Does this make sense in arch/arm64/include/asm/kvm_host.h instead? Next
to the definitions of __vcpu_sys_reg() etc.

Thanks,
Joey

>  static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
>  {
>  	if (vcpu_mode_is_32bit(vcpu)) {
> diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
> index bef40ddb16dbc..754e2dc1df54a 100644
> --- a/arch/arm64/kvm/hyp/exception.c
> +++ b/arch/arm64/kvm/hyp/exception.c
> @@ -20,22 +20,6 @@
>  #error Hypervisor code only!
>  #endif
>  
> -static inline u64 __vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
> -{
> -	if (has_vhe())
> -		return vcpu_read_sys_reg(vcpu, reg);
> -
> -	return __vcpu_sys_reg(vcpu, reg);
> -}
> -
> -static inline void __vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
> -{
> -	if (has_vhe())
> -		vcpu_write_sys_reg(vcpu, val, reg);
> -	else
> -		__vcpu_assign_sys_reg(vcpu, reg, val);
> -}
> -
>  static void __vcpu_write_spsr(struct kvm_vcpu *vcpu, unsigned long target_mode,
>  			      u64 val)
>  {
> @@ -101,14 +85,14 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>  
>  	switch (target_mode) {
>  	case PSR_MODE_EL1h:
> -		vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL1);
> -		sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> -		__vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL1);
> +		vbar = vcpu_read_sys_reg(vcpu, VBAR_EL1);
> +		sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> +		vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL1);
>  		break;
>  	case PSR_MODE_EL2h:
> -		vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL2);
> -		sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL2);
> -		__vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL2);
> +		vbar = vcpu_read_sys_reg(vcpu, VBAR_EL2);
> +		sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL2);
> +		vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL2);
>  		break;
>  	default:
>  		/* Don't do that */
> @@ -185,7 +169,7 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>   */
>  static unsigned long get_except32_cpsr(struct kvm_vcpu *vcpu, u32 mode)
>  {
> -	u32 sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> +	u32 sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
>  	unsigned long old, new;
>  
>  	old = *vcpu_cpsr(vcpu);
> @@ -281,7 +265,7 @@ static void enter_exception32(struct kvm_vcpu *vcpu, u32 mode, u32 vect_offset)
>  {
>  	unsigned long spsr = *vcpu_cpsr(vcpu);
>  	bool is_thumb = (spsr & PSR_AA32_T_BIT);
> -	u32 sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> +	u32 sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
>  	u32 return_address;
>  
>  	*vcpu_cpsr(vcpu) = get_except32_cpsr(vcpu, mode);
> @@ -305,7 +289,7 @@ static void enter_exception32(struct kvm_vcpu *vcpu, u32 mode, u32 vect_offset)
>  	if (sctlr & (1 << 13))
>  		vect_offset += 0xffff0000;
>  	else /* always have security exceptions */
> -		vect_offset += __vcpu_read_sys_reg(vcpu, VBAR_EL1);
> +		vect_offset += vcpu_read_sys_reg(vcpu, VBAR_EL1);
>  
>  	*vcpu_pc(vcpu) = vect_offset;
>  }
> -- 
> 2.39.5
> 

