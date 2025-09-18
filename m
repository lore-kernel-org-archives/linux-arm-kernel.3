Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C33CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmLf1Tj2R3sq5q0ivjcJ1kVe6mewGPnpvIRcj6+g+w0=; b=zLrZo2H65xx/FkoZZoOHIjpuZo
	rEnNEOlLdaGhnb6VZK/aTderQYmvKsY5mk5RHRgOf+yhDYSU9LngHcREbe6I28wrJJCAMx4o2pT5/
	CiNgg4GG1Qy1lz5R4AZvZcV9kee2D44dFi2o3Mut/lmW6RwvhIjb1mM9kNFORNs4oPrlhIHaiX8Xx
	DIv5z8x9BBPtbAJgl375EOmvXwrBeuVeFgU1xJ2Q2v5FT5A/Kh8zJigUeaOZN71lnqa2a2LSp9phw
	9XTdh5IV6gMUTJVDuiLCZwNrjQasx5ODn+kx9lbmLU53hUUrRGl6kNjeGooy5cXO+P9sUKQu5Ee+Y
	HsncmVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDQt-0000000HL7D-0vYK;
	Thu, 18 Sep 2025 12:08:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDQr-0000000HL6L-1zAD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:08:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD81B43AE9;
	Thu, 18 Sep 2025 12:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03D1C4CEE7;
	Thu, 18 Sep 2025 12:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758197292;
	bh=PbmNRrE13pJ1wWoztpIKlTco1UBVTpVaWVXoqFvxRj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqVnMIZTI8xG0T0TF0wEOzyt12pdgcdOW4aXbRJSnvea/xTlD0jPA/sWWJbMWGbA4
	 F9e+5+BQkXvfV/PDOuy8Wjbfxk1ClU2XyVJpiudhdz7aV5buvjGKWDwou7/rb6750C
	 1qs7d/aLL5GwMRv9kRmy5ElwRh44hNfoeTu+z7XVJtE/G+O4Iwii92TRl1lCbpSTXp
	 gel8VgiPjcQy2t+PN4yHFxSz6dcAYyI0etNqdaj8Wui2urZn268tO5Bs7zu8JPfR+H
	 vcrqXCUCyeMk3vyBjDIvPIrBTadObXHrNpXEY+uMdJ9zuxRqVuIPPsX7paDUzoR0Wt
	 tANCc2mPwwYVg==
Date: Thu, 18 Sep 2025 13:08:07 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 2/2] arm64/sysreg: Replace TCR_EL1 field macros
Message-ID: <aMv2J1hRQm_f4WAP@willie-the-truck>
References: <20250907123000.414181-1-anshuman.khandual@arm.com>
 <20250907123000.414181-3-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907123000.414181-3-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_050813_528898_37741300 
X-CRM114-Status: GOOD (  11.77  )
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

On Sun, Sep 07, 2025 at 06:00:00PM +0530, Anshuman Khandual wrote:
> This just replaces all used TCR_EL1 field macros with tools sysreg variant
> based fields and subsequently drops them from the header (pgtable-hwdef.h)
> and moves all required macros into KVM header (asm/kvm_arm.h) for continued
> usage in KVM.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: kvmarm@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Changes in V4:
> 
> - Dropped all unused TCR_XXX macros while moving into KVM header
> 
>  arch/arm64/include/asm/assembler.h     |  6 +-
>  arch/arm64/include/asm/cputype.h       |  2 +-
>  arch/arm64/include/asm/kvm_arm.h       | 43 +++++++++++
>  arch/arm64/include/asm/mmu_context.h   |  4 +-
>  arch/arm64/include/asm/pgtable-hwdef.h | 98 +-------------------------
>  arch/arm64/include/asm/pgtable-prot.h  |  2 +-
>  arch/arm64/kernel/cpufeature.c         |  4 +-
>  arch/arm64/kernel/pi/map_kernel.c      |  8 +--
>  arch/arm64/kernel/vmcore_info.c        |  2 +-
>  arch/arm64/mm/proc.S                   | 36 ++++++----
>  tools/arch/arm64/include/asm/cputype.h |  2 +-

Please don't mix tools/ patches with arch patches. You probably want to keep
the KVM one separate as well.

Will

