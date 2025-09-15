Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C901CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwopsEOek4ou3+ezmGuS74+PQLBMuVqqlmPaeWYH/gY=; b=Yj4sUKNZBifa++yCbXV5x8B2Rk
	Mox5WRLRimpguNWvUAWEnKX4RM0C3ut8vhVD/xf4WGAM1wn09me7QR8dSF65oANfUsv5Ey+fw7lQ3
	Sx0GHv53AsNTUZUeY7bWk62O9JSaNq/muQ9yUMRcCK/4natfd7VKxVDiX+1XFH2ffmh8dAX8Vrhfw
	zDKjyl6gVUZwWTrnZx1BQDJH82NDoHGHpv1WT0TQWg2L25bGdV25ZQ1Oj+AniO6L1a0ZF12NdTRRG
	vi5bsU3TVoGnoW6Bx7+ZXm0z1xAnKmCEAlOp4/qycUz97dJsV4Dh7yAZ5QjMA8PNZbLsdN7+gg2EJ
	WdrDfDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6em-00000003jva-3mCR;
	Mon, 15 Sep 2025 10:42:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6ek-00000003ju0-3ngo;
	Mon, 15 Sep 2025 10:42:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 126CA43710;
	Mon, 15 Sep 2025 10:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F74C4CEF1;
	Mon, 15 Sep 2025 10:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757932917;
	bh=4BjLepU4AwvkrI0d43q0aFDK1GjRHaIm4CkmokzQ9SI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKXB17uSwbZe+whIjd4zRzhq1ba+B4tNal7uYCuvuT/S8/7Sn8kRzxjdnJ+gtvsqK
	 l546xMXwcEVDqPsuJETGL6e77trVb+5Z3GKXvfhYlgO3+s8FHLeRluR7Nr0abCJB7x
	 /5d7O2U4kYzI0PIxAnvaJ1VLGj0xkcOQRQwVH3vORv+gBgYah0d7Z/JR5a+CMyAd8R
	 wPV05buDYcw0i+Z4IWXpGg9zVIZxh4Nc9t/JObhE0YSv0Ozc+nZyVH4eSD65CNx4l9
	 KHyqELQQiCrUtxxg8J7r0lBVLCiLdnTS2c61RWCVThb7jO+wL4FlUs5SCL7zrbEnji
	 Td6YbrVMt3Rgw==
Date: Mon, 15 Sep 2025 11:41:52 +0100
From: Will Deacon <will@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v6 0/8] Add SBI v3.0 PMU enhancements
Message-ID: <aMftcHLgBvH76erX@willie-the-truck>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
 <f740b716-6c8b-46a5-31ae-ecc37e766152@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f740b716-6c8b-46a5-31ae-ecc37e766152@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_034158_962067_DC2494D4 
X-CRM114-Status: GOOD (  17.12  )
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

On Mon, Sep 15, 2025 at 12:25:52AM -0600, Paul Walmsley wrote:
> On Tue, 9 Sep 2025, Atish Patra wrote:
> 
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
> > [3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v6
> > 
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> 
> For the series:
> 
> Acked-by: Paul Walmsley <pjw@kernel.org>

I was assuming this series would go via the Risc-V arch tree so please
shout if you were expecting me to take it via drivers/perf/!

Will

