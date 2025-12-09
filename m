Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1B5D3B7F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 21:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnEMWkEPI1SkSNZs2sRt/kQRuW3RJPP7Se1BlYE8nZs=; b=Ge3Tu7wVChgxHpsJN1at8UpsvB
	xI/ClKhErgPl++eKkiH41/2n37nQV7LkWNjSK5IUI2z1khL9IHId+u1kYAInnHF+EFrFVAuB2dD7T
	LbUR95U+A8BgvZt0c7drUqTY/dkod5fqmyx7Z0ZCd1eQ831B2IpvfZIOMVn4iR+akWOq4zaJ8gQi5
	gErRluMXco0+O6ny3D95xUNCbSrQrikCBO8ZjZonOeyxXPx4kfAHBoSt1tG3d1Pq6W49tc46rIdVZ
	ajsmNe9Y2/h2PoSeSG0DXLvLcDRl0eUQyeOWh9obY1u+niZl4ZE84sTAeiilz7jm08RGji+I6DG/0
	BUYfqlFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT52A-0000000EoRM-2aj4;
	Tue, 09 Dec 2025 21:14:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT527-0000000EoQn-21N5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 21:14:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D714143D3D;
	Tue,  9 Dec 2025 21:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766FCC4CEF5;
	Tue,  9 Dec 2025 21:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765314844;
	bh=wrKMdhnv/lci1szVNE8yO/OkhzS84B5q7GQ6DcVQ5Fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Is12v/y4WiB0S9HbOrzFDtXLS+fpcsdRBoEfwYav5vIK649imo3EuFfoAsHIUj6Iq
	 w6gfTsR9+O2/VfSPCSEdOJyw7LRgFbGph2Df+zVbPUBpKdPeVP0BJxSBld6Cv0JtOI
	 8IJCe9xvxDp/0XyhKE6DlPD+Ht0cm0kXoNGD1wKM1MigwvdB8zOt9sEXvm7QuAZBRo
	 HtoMgseVIOwaA48d2+Q7vbBeayHLraXGbB/XqkYsMpfACjIiZ/4Go3GRk1ArdANEhw
	 caGMdho5bNJ+H7KYK2SqHQvuAPtjco4gY+Yk+bDkhkj9vIt+LYgBVWcNffBHHqkYID
	 Cf5OrcOoYcpJw==
Date: Tue, 9 Dec 2025 13:14:03 -0800
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 12/24] KVM: arm64: Use physical PMSELR for PMXEVTYPER
 if partitioned
Message-ID: <aTiRG0I1FZzntHtH@kernel.org>
References: <20251209205121.1871534-1-coltonlewis@google.com>
 <20251209205121.1871534-13-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-13-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_131407_581379_E2572A4D 
X-CRM114-Status: GOOD (  19.71  )
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

On Tue, Dec 09, 2025 at 08:51:09PM +0000, Colton Lewis wrote:
> Because PMXEVTYPER is trapped and PMSELR is not, it is not appropriate
> to use the virtual PMSELR register when it could be outdated and lead
> to an invalid write. Use the physical register when partitioned.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm64/include/asm/arm_pmuv3.h | 7 ++++++-
>  arch/arm64/kvm/sys_regs.c          | 9 +++++++--
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
> index 27c4d6d47da31..60600f04b5902 100644
> --- a/arch/arm64/include/asm/arm_pmuv3.h
> +++ b/arch/arm64/include/asm/arm_pmuv3.h
> @@ -70,11 +70,16 @@ static inline u64 read_pmcr(void)
>  	return read_sysreg(pmcr_el0);
>  }
>  
> -static inline void write_pmselr(u32 val)
> +static inline void write_pmselr(u64 val)
>  {
>  	write_sysreg(val, pmselr_el0);
>  }
>  
> +static inline u64 read_pmselr(void)
> +{
> +	return read_sysreg(pmselr_el0);
> +}
> +
>  static inline void write_pmccntr(u64 val)
>  {
>  	write_sysreg(val, pmccntr_el0);
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 0c9596325519b..2e6d907fa8af2 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1199,14 +1199,19 @@ static bool writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params
>  static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>  			       const struct sys_reg_desc *r)
>  {
> -	u64 idx, reg;
> +	u64 idx, reg, pmselr;
>  
>  	if (pmu_access_el0_disabled(vcpu))
>  		return false;
>  
>  	if (r->CRn == 9 && r->CRm == 13 && r->Op2 == 1) {
>  		/* PMXEVTYPER_EL0 */
> -		idx = SYS_FIELD_GET(PMSELR_EL0, SEL, __vcpu_sys_reg(vcpu, PMSELR_EL0));
> +		if (kvm_vcpu_pmu_is_partitioned(vcpu))
> +			pmselr = read_pmselr();
> +		else
> +			pmselr = __vcpu_sys_reg(vcpu, PMSELR_EL0);

This isn't preemption safe. Nor should the "if (partitioned) do X else do Y" get
open-coded throughout the shop.

I would rather this be handled with a prepatory patch that provides
generic PMU register accessors to the rest of KVM (e.g.
vcpu_read_pmu_reg() / vcpu_write_pmu_reg()). Internally those helpers
can locate the vCPU's PMU registers (emulated, partitioned in-memory,
partitioned in-CPU).

Thanks,
Oliver

