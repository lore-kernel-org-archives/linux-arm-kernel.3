Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E45DC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0f7n1fpoUidgZ1YLNHJMGFWP/ZxXK7zjXQ7oQorZMI=; b=RAG+jEAybmNq8RjhSmZUjHqvWO
	W0W4Kl8lmj+QTFkQtPGZV1Pz/SWHqHdrJ1lRLFPcKmQhWdV6C0AwIGwFCykq1AVek5a1U3OJwzRzb
	WLxkN8OUXI+pS5cq2NyMEdttkicbaA6Eay1gcmm6I3M5tK5fW/lgk767tnE5Ih5s912QwECovgC2f
	EcM7sYT3NKBfVWQ/fV+brk4JCTLb/3L60tBurmnb0jiJs7OKG+6RTJVPVM7eBdSSBqcCFXN8q7E8a
	K9DOwafd6NQCYZdG0UyRLMTIkY5hbuiB9AUxxRSLje2DX29BKd1IWgRrddcotg2uS9cG5e+iqQRkk
	riDq0+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29K-00000009XOv-276j;
	Mon, 19 May 2025 15:11:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1D4-00000009Ped-2LOT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:11:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6289A4DF88;
	Mon, 19 May 2025 14:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA3BC4CEE4;
	Mon, 19 May 2025 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747663877;
	bh=e1ejy1mxpIjt2Bw3FSFixCpdrvKaPbVj5b42czyYzxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UuwiVYBOmT0r42eJ2BqI4kUGWbraux+H8fHr1YvAZeA9N9XwhGUYwmIXillv60Ih9
	 /kCS7UbncUQhT1kEgfPVltZdCiGO4EanQSEKr8vci8xkPu27AYe1tHnGn0g6pHiVRi
	 4N3l359n5U3jgumzYPeuR5rRhukDobMO2WzWpCRDMJUhT87QF8K7EJJe0lQ8kMu1X/
	 5eqDmq7Q0tRQuOm7M3bogWphHNV/480ddeGJLnGUXZifEC24lUKmPMAzMUn22R7wr7
	 IZ8UWdYDSsMQlvY/GZFu9phFXmpLAj7fz8By3/nS93KPzpNrJkpwxddkt66syizpKC
	 SfoWiaf3/nmPA==
Date: Mon, 19 May 2025 15:11:11 +0100
From: Will Deacon <will@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Leo Yan <leo.yan@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v21 3/4] KVM: arm64: nvhe: Disable branch generation in
 nVHE guests
Message-ID: <20250519141106.GC16991@willie-the-truck>
References: <20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org>
 <20250407-arm-brbe-v19-v21-3-ff187ff6c928@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-arm-brbe-v19-v21-3-ff187ff6c928@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_071118_736734_7196BF64 
X-CRM114-Status: GOOD (  22.44  )
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

On Mon, Apr 07, 2025 at 12:41:32PM -0500, Rob Herring (Arm) wrote:
> From: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> While BRBE can record branches within guests, the host recording
> branches in guests is not supported by perf (though events are).
> Support for BRBE in guests will supported by providing direct access
> to BRBE within the guests. That is how x86 LBR works for guests.
> Therefore, BRBE needs to be disabled on guest entry and restored on
> exit.
> 
> For nVHE, this requires explicit handling for guests. Before
> entering a guest, save the BRBE state and disable the it. When
> returning to the host, restore the state.
> 
> For VHE, it is not necessary. We initialize
> BRBCR_EL1.{E1BRE,E0BRE}=={0,0} at boot time, and HCR_EL2.TGE==1 while
> running in the host. We configure BRBCR_EL2.{E2BRE,E0HBRE} to enable
> branch recording in the host. When entering the guest, we set
> HCR_EL2.TGE==0 which means BRBCR_EL1 is used instead of BRBCR_EL2.
> Consequently for VHE, BRBE recording is disabled at EL1 and EL0 when
> running a guest.
> 
> Should recording in guests (by the host) ever be desired, the perf ABI
> will need to be extended to distinguish guest addresses (struct
> perf_branch_entry.priv) for starters. BRBE records would also need to be
> invalidated on guest entry/exit as guest/host EL1 and EL0 records can't
> be distinguished.
> 
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
> Tested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v20:
>  - Reword commit message about no guest recording.
>  - Add BRBE to __kvm_vcpu_run() synchronization comment
> 
> v19:
>  - Rework due to v6.14 debug flag changes
>  - Redo commit message
> ---
>  arch/arm64/include/asm/kvm_host.h  |  2 ++
>  arch/arm64/kvm/debug.c             |  4 ++++
>  arch/arm64/kvm/hyp/nvhe/debug-sr.c | 32 ++++++++++++++++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/switch.c   |  2 +-
>  4 files changed, 39 insertions(+), 1 deletion(-)

This one also needs reviewing from the KVM/arm64 side...

Will

