Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969BFE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 21:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YI2KAoE2SX7+W8a4D1T/xctArnLAfC10Qu1P05UgNA=; b=TLGpeXAcUVaeBliQQOb0kZHyPh
	BGe1kaFJCqc03FYfPZCDHO6QEZ4/ZuKApBvXcImquiyvuDA/W3DN/918IZkufi8G77b1Rf12210cb
	Mlwdx2k5/TmTki/ciPf9avyhuJm4eTwUWOtG+3pxdsZhEYsFkrt7NDTkM6JxcX6/r4PYBzI6EqpNK
	nY0meNb/85fHGsIRKXcli5fvTts1mZZ+kGpMerGeM83INsp/rWUaFyrUkejW/TNi6sTRtuvqxKsYI
	Yq9ewS16H4aWjUF8/RQPeCGngmeAni4LWAA7LQsvc0vLMzJPp7S/KF3vPcMs0XDPjXxsy87rH1tSs
	Xy1fiIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfKg-0000000EttX-2V1P;
	Tue, 17 Dec 2024 21:42:22 +0000
Received: from out-187.mta0.migadu.com ([2001:41d0:1004:224b::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf2j-0000000Eqw1-1u4c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 21:23:50 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734470627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7YI2KAoE2SX7+W8a4D1T/xctArnLAfC10Qu1P05UgNA=;
	b=DuIwr+s4NNh44T42eneXEcnCmnXGAZNrlC/kyuTskZtvRC7BXsxCXIikgCW0helwT7ElDx
	3VnwDicLKGH4aCkqNZc7f8jAlVXCoSoJIFOO7hXKdiP1cj1ILHFFN2U78WOdIEGmaEDQqc
	E8JAfD6lURoYaBUQnJVIaZEVR5VR5SU=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [RFC PATCH 17/18] KVM: arm64: Provide 1 event counter on IMPDEF hardware
Date: Tue, 17 Dec 2024 13:23:38 -0800
Message-Id: <20241217212338.3709556-1-oliver.upton@linux.dev>
In-Reply-To: <20241217212048.3709204-1-oliver.upton@linux.dev>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_132349_626441_275637E3 
X-CRM114-Status: GOOD (  12.37  )
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

PMUv3 requires that all programmable event counters are capable of
counting any event. The Apple M* PMU is quite a bit different, and
events have affinities for particular PMCs.

Expose 1 event counter on IMPDEF hardware, allowing the guest to do
something useful with its PMU while also upholding the requirements of
the architecture.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---

Jury is still out on whether we want to do this, which is why this patch
is RFC.

 arch/arm64/kvm/pmu-emul.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 3803737cbf7c..8f96a34d3da5 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -1046,8 +1046,12 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 {
 	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
 
+	/*
+	 * PMUv3 requires that all event counters are capable of counting any
+	 * event, though the same may not be true of non-PMUv3 hardware.
+	 */
 	if (cpus_have_final_cap(ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS))
-		return 0;
+		return 1;
 
 	/*
 	 * The arm_pmu->cntr_mask considers the fixed counter(s) as well.
-- 
2.39.5


