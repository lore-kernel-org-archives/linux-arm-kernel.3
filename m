Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A8AD3B998
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 22:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2pual4xoEIYNjwFlQQNe2gKnnOo74I425F37AXX3IE=; b=FK311smifUAUE8u0TDoCn0ymtA
	wqn8QYYzbgeALWHOJDY/ZlPqkU4GuaARNcpSeNMR07zUvYWIVsbFimQQseOdEDhFkfIP3hpmQRSib
	cgYarp8twGFanAJJ65dNgcm4Jz9WZEiSgxgImq5X6kM1AIF6gczBfVKRrcBMtyyQ0gdvSz6Y4BHnL
	gibRh9FO+ZtPga3A4Pn882kmJA5doQautX+8I/MIkV21CMo0KjnkivcKWPrgrNCzUYAM9LD/iPFH+
	8kAnpvNKqeiSs4GToEh/sb4xP843E0aEheqX1Ikwitff/ORpgVkrpXNEPaXbkv7NIB1lDsWKJUaHJ
	1uaduPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6Yw-0000000Eshv-0bpj;
	Tue, 09 Dec 2025 22:52:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6Yt-0000000EshY-2B17
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 22:52:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E17BA43B4D;
	Tue,  9 Dec 2025 22:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7621FC4CEF5;
	Tue,  9 Dec 2025 22:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765320722;
	bh=rH4jIugTLj/MmCntl4IsivPRYzz2+X9BI1dkt+tZUAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gK65ZiVLcISjQpaWlozvWZ/pB9Rf8c/OBAmSq5WFPeLuhkNPfGcZ49r6ridSEvAdE
	 rsprjey86yb+rAP/iGqpUfqxIw+yB/WdgcEZDIc+EOh2tyi2vgZMrIct++Bkn3zCi+
	 3KaaCqCRS+H6v7E3PZEbkdfjMmzut0GL9P4cYsiyOB3xYSKA908I32jqPur/CMLGEP
	 WAHCW48J+RNnzQAHbv6QmFw+wzfPco2ATYN69Ip3r+Fu9wjPmRodlDjYIN2+vH3qX4
	 2sfYtr+rtP2yniLQJhVtUe3bf8VDM1rFkByxdFzEgGMRF3fJAMjL2Zqq/sX+vC+ltX
	 h55APJ6d8k38A==
Date: Tue, 9 Dec 2025 14:52:01 -0800
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
Subject: Re: [PATCH v5 21/24] KVM: arm64: Inject recorded guest interrupts
Message-ID: <aTioEWHu0ZbFCjR6@kernel.org>
References: <20251209205121.1871534-1-coltonlewis@google.com>
 <20251209205121.1871534-22-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-22-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_145203_577788_E6F82746 
X-CRM114-Status: GOOD (  13.97  )
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

In no situation should KVM be injecting a "recorded" IRQ. The overflow
condition of the PMU is well defined in the architecture and we should
implement *exactly* that.

On Tue, Dec 09, 2025 at 08:51:18PM +0000, Colton Lewis wrote:
> +/**
> + * kvm_pmu_part_overflow_status() - Determine if any guest counters have overflowed
> + * @vcpu: Ponter to struct kvm_vcpu
> + *
> + * Determine if any guest counters have overflowed and therefore an
> + * IRQ needs to be injected into the guest.
> + *
> + * Return: True if there was an overflow, false otherwise
> + */
> +bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu)
> +{
> +	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
> +	u64 mask = kvm_pmu_guest_counter_mask(pmu);
> +	u64 pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
> +	u64 pmint = read_pmintenset();
> +	u64 pmcr = read_pmcr();

How do we know that the vPMU has been loaded on the CPU at this point?

> +
> +	return (pmcr & ARMV8_PMU_PMCR_E) && (mask & pmovs & pmint);
> +}

I'd rather reuse kvm_pmu_overflow_status(), relying on the accessors to
abstract away the implementation / location of the guest PMU context.

Thanks,
Oliver

