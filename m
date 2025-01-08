Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE87E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CvZEmJRxP2br576zD1I4cLXAkxRRC3B+NKcSsRkRdc=; b=uzRbUgnHvaHEzfXIH0+pQcmfDX
	PcwdoUdxvBP/1fzPCEsU2Pn6l+n2NqZgQ1xc9JI3yolb67oRgO+q7L1PlkKBbu6Y6NgFjUu2BQGI7
	FRI/H8A9ag40BXARcHLgD/J3ywB1YC4wIubFJzRpkVe2Wt8KadUftgKmYQB0xzT8jfjTiH3VnL5TP
	dxLJoa45u4sIp4Z/EeHLOUZ65SKs7vkHitykqt9zqzzG1zjqSkQPQBFt5OiwM86+GFFfsdp1tDR2l
	aL5ZgJbUAoyXvVMCY1ssFqfwlykZ2o+wy3TQnLSvTX98nG8dT+GcY85psN1vlr46zLXx/+Put4VDw
	ccsHsunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVs0-00000008Z83-43fP;
	Wed, 08 Jan 2025 13:13:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVKi-00000008SPu-1Wh7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 12:38:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CE825C5006;
	Wed,  8 Jan 2025 12:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B92C4CEDD;
	Wed,  8 Jan 2025 12:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736339927;
	bh=mLAJdLoN9h4bkCdI7kmcjMyVeLTRBumWzuPyPWQzzzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+q5fQMEttwesjS6DPxWd36hXgQfNbcbwiCG2Cc5GxhrVmZDUSmUZ7m3JpH/JOOAs
	 aGtPiyBe4aApMhwoLLa4UBYPebjDyp9yYSuWx/mYzXLkjpMbj90mG3WOoTSJDAvXZG
	 12BhvMLHaaw322KIQgkXJnsRv+OvGoNbM7gmP47V0WHJHYzxMu1MXw9i3T4XEDWwfU
	 L1kiC2gHNlMdTjlfZmUjI4fLjvZASbNSIzHriiBEmIcA9S0w9IYF5ORU8LY46T5a6K
	 6OeVSOikbOHj4f6SMinowzBvNiyJggZ7PhLKfY17X8pZicWugb3fZaKWXjI6J0l7vF
	 sOFUTydIveYvA==
Date: Wed, 8 Jan 2025 12:38:41 +0000
From: Will Deacon <will@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] KVM: arm64: Support FEAT_PMUv3 on Apple hardware
Message-ID: <20250108123840.GA9197@willie-the-truck>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217212048.3709204-1-oliver.upton@linux.dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_043848_446602_976710A4 
X-CRM114-Status: GOOD (  14.71  )
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

Hi Oliver,

On Tue, Dec 17, 2024 at 01:20:30PM -0800, Oliver Upton wrote:
> One of the interesting features of some Apple M* parts is an IMPDEF trap
> that routes EL1/EL0 accesses of the PMUv3 registers to EL2. This allows
> a hypervisor to emulate an architectural PMUv3 on top of the IMPDEF PMU
> hardware present in the CPU.
> 
> And if you squint, this _might_ look like a CPU erratum :-)
> 
> This series takes advantage of these IMPDEF traps to provide PMUv3 to
> KVM guests. As a starting point, only expose the fixed CPU cycle counter
> and no event counters. Conveniently, this is enough to get Windows
> running as a KVM guest on Apple hardware.
> 
> I've tried to keep the deviation to a minimum by refactoring some of the
> flows used for PMUv3, e.g. computing PMCEID from the arm_pmu bitmap
> instead of reading hardware directly.

What's your plan for this series? I started looking at it and I can take
the first four apple_m1 patches if you like?

Will

