Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C778C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 13:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSr+ZSRNbqiUiANxs3p6CjWEuxuLAmhaJ6If5m/BHW0=; b=F9M4TgrmrVlqfxF5MbkDbBJkKq
	QhT/mYcDE9SoIf0y47pqto0Krj4EH2RsP+EQfQJwxqieZdx0x1WobvlnwZ1lChb6DHxVyjpDiYHo3
	CsRIp9k61U6WkBtVokIbZQzdvzj+TGVYw57tuHK/iFX0Tj5j19jLeXRwA+E2zYBXttByLs613TcSo
	YYkGdjwLDDNHoFKY/4pphAbWXYpBc87wAOOjrrbCU3VGPvPs09mtRA2pwNruZk0RBFCSlf72rYedQ
	38ASMCCmzcvYtkKFY9uQeDz16KFunRrOXIiJ6g5rOPdiIg2yif+hMfpnOnU3r7aDjst+k5MGsSoVO
	r/pGAjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDX6-00000002cjB-3zMb;
	Tue, 22 Jul 2025 13:59:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCsD-00000002WxT-0f88;
	Tue, 22 Jul 2025 13:17:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87BDA419DF;
	Tue, 22 Jul 2025 13:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EE0C4CEEB;
	Tue, 22 Jul 2025 13:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753190255;
	bh=3leS8riuCJe+lnyQnQIcRHprkIXpvrMzyIhcjLqEY1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJNhgn6qehAH7M6iwdt46ZSRtnpNN7QCYzYCFtpxyCOf9hD4MrstgMo6XRuzOF91c
	 sjv8RgAd4UifKt4aPajQt1uLJIdA0CTSwNfFbDlcF8QJmy0M1E/dH6Wnj4IbwqUdGe
	 ykJV6IdS8vz+9K5Gck9anM2yCECJ0V9cL76ZDvhaL3VsgFphEVvk35vu854JJEIwlA
	 mZWzP7DiEysaVcb+3NYpPiKRGR79NaQI9mdGR3PpkUTqTS0UDACcR/srpvBKQCaSpU
	 pNXOiIOJ9CTniD++dcKH1fM5/oz7ADMNXTsOBMNvN1K4Jc/tbgBPJI1VGCJ8Pig1kl
	 UZQ70MIhMgvQg==
Date: Tue, 22 Jul 2025 14:17:30 +0100
From: Will Deacon <will@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 0/9] Add SBI v3.0 PMU enhancements
Message-ID: <aH-PanNcaHsbSlOd@willie-the-truck>
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
 <CAAhSdy2XM+3UQD0FZehJnmCbjwRMCZQpt1cEkb4gmJu+LFsaKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhSdy2XM+3UQD0FZehJnmCbjwRMCZQpt1cEkb4gmJu+LFsaKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_061737_237056_10F23E1B 
X-CRM114-Status: GOOD (  24.00  )
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

On Tue, Jul 22, 2025 at 09:29:40AM +0530, Anup Patel wrote:
> On Tue, Jul 22, 2025 at 8:45 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > SBI v3.0 specification[1] added two new improvements to the PMU chaper.
> > The SBI v3.0 specification is frozen and under public review phase as
> > per the RISC-V International guidelines.
> >
> > 1. Added an additional get_event_info function to query event availablity
> > in bulk instead of individual SBI calls for each event. This helps in
> > improving the boot time.
> >
> > 2. Raw event width allowed by the platform is widened to have 56 bits
> > with RAW event v2 as per new clarification in the priv ISA[2].
> >
> > Apart from implementing these new features, this series improves the gpa
> > range check in KVM and updates the kvm SBI implementation to SBI v3.0.
> >
> > The opensbi patches have been merged. This series can be found at [3].
> >
> > [1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf
> > [2] https://github.com/riscv/riscv-isa-manual/issues/1578
> > [3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v4
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> > Changes in v4:
> > - Rebased on top of v6.16-rc7
> > - Fixed a potential compilation issue in PATCH5.
> > - Minor typos fixed PATCH2 and PATCH3.
> > - Fixed variable ordering in PATCH6
> > - Link to v3: https://lore.kernel.org/r/20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com
> >
> > Changes in v3:
> > - Rebased on top of v6.15-rc7
> > - Link to v2: https://lore.kernel.org/r/20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com
> >
> > Changes in v2:
> > - Dropped PATCH 2 to be taken during rcX.
> > - Improved gpa range check validation by introducing a helper function
> >   and checking the entire range.
> > - Link to v1: https://lore.kernel.org/r/20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com
> >
> > ---
> > Atish Patra (9):
> >       drivers/perf: riscv: Add SBI v3.0 flag
> >       drivers/perf: riscv: Add raw event v2 support
> >       RISC-V: KVM: Add support for Raw event v2
> >       drivers/perf: riscv: Implement PMU event info function
> >       drivers/perf: riscv: Export PMU event info function
> >       KVM: Add a helper function to validate vcpu gpa range
> >       RISC-V: KVM: Use the new gpa range validate helper function
> >       RISC-V: KVM: Implement get event info function
> >       RISC-V: KVM: Upgrade the supported SBI version to 3.0
> >
> >  arch/riscv/include/asm/kvm_vcpu_pmu.h |   3 +
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h |   2 +-
> >  arch/riscv/include/asm/sbi.h          |  13 +++
> >  arch/riscv/kvm/vcpu_pmu.c             |  75 ++++++++++++-
> >  arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
> >  arch/riscv/kvm/vcpu_sbi_sta.c         |   6 +-
> >  drivers/perf/riscv_pmu_sbi.c          | 191 +++++++++++++++++++++++++---------
> >  include/linux/kvm_host.h              |   2 +
> >  include/linux/perf/riscv_pmu.h        |   1 +
> >  virt/kvm/kvm_main.c                   |  21 ++++
> >  10 files changed, 258 insertions(+), 59 deletions(-)
> 
> Are you okay with this series going through the KVM RISC-V tree ?

The Risc-V PMU stuff usually goes via Palmer, so whatever he reckons.

Will

