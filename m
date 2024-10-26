Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD617D10BFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDrJjoXe96jtaGbZQ/F1djq7fODfGCzzGpz/Lz+dRHI=; b=MvkqQYUARbgZWW2zsJinBiUlIR
	u//OUbec2opGVCdNih9nQ/GpMpHk9R9+e5FVWzMrqMeXf1U7zGnzIsIW21zeCLs/bbOGc1lCeFSMh
	fFyFEoKG8CPZ2VoyW/L3g2D0cCzrsqaoObyZu6MOD7Lz5MfnTrLkV81SAiIPFqArIa7sRCOpgvM2V
	j8ICEOteh8H9aJWzR1QpbVZ6g919zSIfmdQa1RswYim2jP6MPtHnwLP9ixTZD/Bgvn7oit5Hk+zIe
	sa+x1AnEyrzCup8CFjWOOOOCJPYJu1Hc1r528kdcUwIRUmaeB/Q6VOv4kgUsDR4xoPxQwKiJx8Mqa
	8GBPE8Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4hrV-00000006kQi-2b1W;
	Sat, 26 Oct 2024 14:33:53 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4hpu-00000006kJd-2d8V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 14:32:17 +0000
Date: Sat, 26 Oct 2024 14:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729953131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iDrJjoXe96jtaGbZQ/F1djq7fODfGCzzGpz/Lz+dRHI=;
	b=ioWmhbjoTUdaVLhZ52kRWU0xlN3PhCoOaVqbYJ1QwtWk9i+7sKbCODYdWiHuaS8SvmvvLG
	mLcIR2vs+88bjLX1DXct357tkBvxcVx/gE3JS71Xy7auPw5s310Oeaejlnw4hNv7WB1c2Y
	kJUV5jdnqxzbmT6ll9OwVtNpEXRhnoM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/18] KVM: arm64: nv: Describe trap behaviour of
 MDCR_EL2.HPMN
Message-ID: <Zxz9YonLVsaLuMEJ@linux.dev>
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
 <20241025182354.3364124-11-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025182354.3364124-11-oliver.upton@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_073215_545662_781DD411 
X-CRM114-Status: GOOD (  15.18  )
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

On Fri, Oct 25, 2024 at 06:23:45PM +0000, Oliver Upton wrote:
> MDCR_EL2.HPMN splits the PMU event counters into two ranges: the first
> range is accessible from all ELs, and the second range is accessible
> only to EL2/3. Supposing the guest hypervisor allows direct access to
> the PMU counters from the L2, KVM needs to locally handle those
> accesses.
> 
> Add a new complex trap configuration for HPMN that checks if the counter
> index is accessible to the current context. As written, the architecture
> suggests HPMN only causes PMEVCNTR<n>_EL0 to trap, though intuition (and
> the pseudocode) suggest that the trap applies to PMEVTYPER<n>_EL0 as
> well.
> 
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  arch/arm64/kvm/emulate-nested.c | 160 +++++++++++++++++++-------------
>  arch/arm64/kvm/pmu-emul.c       |  18 ++++
>  include/kvm/arm_pmu.h           |   6 ++
>  3 files changed, 120 insertions(+), 64 deletions(-)

Gonna squash in the following to fix !CONFIG_HW_PERF_EVENTS builds.

diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index e6103df9ef5d..feb5d1d35f0f 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -188,7 +188,7 @@ static inline u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
-static inline bool kvm_pmu_counter_is_hyp(struct kvm_vcpu *vcpu)
+static inline bool kvm_pmu_counter_is_hyp(struct kvm_vcpu *vcpu, unsigned int idx)
 {
 	return false;
 }

-- 
Thanks,
Oliver

