Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E73AD3B994
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 21:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zS9dPVMTkifYR3MyS4d4d3Y4W97MjCElsgjzWGQTcD8=; b=2uE+auhknEOgvXrIjydVNY4Tns
	pG6fukXoikzfYh7rAWHJDmIkYkRjqFRhWp+FC99scEy2J5b8mXHPHNlJXd5b3IdEmYHVBMCqls93G
	lBBOBs9x1NMUP5XWMGtJ3Q7SY8eOBDyiLU+S1ExqHRl4ajEVTvpkzNMNp2F0y9UdDKovUA9sCs2Jr
	JUr8HSi89o+C2NPxEU2K/OjELgqHw1CjMLqoXHRucVWsmxL/oUpGnB61R4udCjjJ9qpYrQ5Z1775x
	kHqoLYOfCHwEDrjsTvTOyGOJ4Di1A2wYgENdptx1dqhYAezhJxuENCgL/VJ3qvqTuHSPOFri7tdR5
	YN4pO1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT573-0000000Eoo6-3cPp;
	Tue, 09 Dec 2025 21:19:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT570-0000000Eond-49n3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 21:19:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 564D440385;
	Tue,  9 Dec 2025 21:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE793C4CEF5;
	Tue,  9 Dec 2025 21:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765315150;
	bh=CT4qAWPdZvEtbycxJ4ObqKwT1R9e3YjH2bRTZc2PLgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EE6P6mO9ijeLBkT6QwQgQBOQPIMu0fOqejSIn2W6QC83goR/f6/DbF6p9NEGTDkMJ
	 yJYGChp4TGWyt7//LRy8ByBf1/W8Ed6fyWTcvF0y7h+Czkxa8h5oknYj/PRc8ZvyCr
	 7jyKdtyEdkeWtKxuafUajHl6fw946IT03T29xXALsYPeFwxgj3bQ0+RTHxkOWO77cD
	 JRFS/80bRtk2VR4BOzfuxSAiARypvid3iiXmoEoZu69ERtoAIttvnD46jpgOrBn9aZ
	 ioaQ7YHObMsyDrNkJAPOGoOZtEsNJUyW+2IhlVVB/EsMiPn7HM0KH2i2+htaKtFDDx
	 qhc3pFLfQo5Rg==
Date: Tue, 9 Dec 2025 13:19:08 -0800
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
Subject: Re: [PATCH v5 13/24] KVM: arm64: Writethrough trapped PMOVS register
Message-ID: <aTiSTODjzaLzwAPN@kernel.org>
References: <20251209205121.1871534-1-coltonlewis@google.com>
 <20251209205121.1871534-14-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-14-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_131911_074314_394403C1 
X-CRM114-Status: GOOD (  18.41  )
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

On Tue, Dec 09, 2025 at 08:51:10PM +0000, Colton Lewis wrote:
> Because PMOVS remains trapped, it needs to be written through when
> partitioned to affect PMU hardware when expected.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm64/include/asm/arm_pmuv3.h | 10 ++++++++++
>  arch/arm64/kvm/sys_regs.c          | 17 ++++++++++++++++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
> index 60600f04b5902..3e25c0313263c 100644
> --- a/arch/arm64/include/asm/arm_pmuv3.h
> +++ b/arch/arm64/include/asm/arm_pmuv3.h
> @@ -140,6 +140,16 @@ static inline u64 read_pmicfiltr(void)
>  	return read_sysreg_s(SYS_PMICFILTR_EL0);
>  }
>  
> +static inline void write_pmovsset(u64 val)
> +{
> +	write_sysreg(val, pmovsset_el0);
> +}
> +
> +static inline u64 read_pmovsset(void)
> +{
> +	return read_sysreg(pmovsset_el0);
> +}
> +
>  static inline void write_pmovsclr(u64 val)
>  {
>  	write_sysreg(val, pmovsclr_el0);
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 2e6d907fa8af2..bee892db9ca8b 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1307,6 +1307,19 @@ static bool access_pminten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>  	return true;
>  }
>  
> +static void writethrough_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p, bool set)
> +{
> +	u64 mask = kvm_pmu_accessible_counter_mask(vcpu);
> +
> +	if (set) {
> +		__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, (p->regval & mask));
> +		write_pmovsset(p->regval & mask);
> +	} else {
> +		__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, &=, ~(p->regval & mask));
> +		write_pmovsclr(p->regval & mask);
> +	}

There's only ever a single canonical guest view of a register. Either it has
been loaded onto the CPU or it is in memory, writing the value to two
different locations is odd. What guarantees the guest context is on the
CPU currently? And what about preemption?

Thanks,
Oliver

