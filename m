Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E07BD149E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrYN5raZtmWI3hPp7h1MaTZOJ1/CQmOwVJXTIAsdSvU=; b=VwEuMwq/9uyNlLsL4/43xwl85r
	fW+xprflBkeQLkLrMfdNyJoaw7MWSTm4Z9FWCxn3nT3b6Lb4LPy63SIeklJAfIVAvIiAXXLQ7DE9t
	N/3yyYDLDCbm9XLuAODV3iaGDz9I+huY41XYXTZLNR3KM5G67PvwmSl+/34G83I124CuyqkDrNCVu
	cv6a8qIausRaUsrfQk2KlJ/pSjUqkOHfae/ZyiVZHm0b0zvk8esTYNE80mdmBse9VJr9vvvdyrQPb
	XLDNJnegXp75FB2+KEiMa6nUvxgS6KSdbHoPt1EZPI86ML4rhz6WKhF3hyho9MerqcvxcVyVwEW0k
	dz/TMNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PO4-00000004rX3-1XRF;
	Fri, 25 Oct 2024 18:50:16 +0000
Received: from out-185.mta1.migadu.com ([2001:41d0:203:375::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OzK-00000004mwe-1Sw1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 18:24:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729880680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrYN5raZtmWI3hPp7h1MaTZOJ1/CQmOwVJXTIAsdSvU=;
	b=mpQyf5fdkDWX8vMbgGH7PlXuYSF8BTzvlYcX6H0p4IGeZ/kEntusuo+rmuplKHsnkDsTKY
	uD0mK395NR1Pxp3tAQUPu8QC+gmRXi9jHuqH4f6XLrY0hWpEN4a6GHX6XS80Hyg4l5hedH
	8oOuJ78UyWpHzLqYlenhequjjM5IUZM=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v4 15/18] KVM: arm64: nv: Honor MDCR_EL2.HPME
Date: Fri, 25 Oct 2024 18:23:50 +0000
Message-ID: <20241025182354.3364124-16-oliver.upton@linux.dev>
In-Reply-To: <20241025182354.3364124-1-oliver.upton@linux.dev>
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_112442_549972_9911D367 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

When the PMU is configured with split counter ranges, HPME becomes the
enable bit for the counters reserved for EL2.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 03cd1ad7a55a..349886f03fd5 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -620,8 +620,15 @@ void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val)
 static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
 {
 	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
-	return (kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E) &&
-	       (__vcpu_sys_reg(vcpu, PMCNTENSET_EL0) & BIT(pmc->idx));
+	unsigned int mdcr = __vcpu_sys_reg(vcpu, MDCR_EL2);
+
+	if (!(__vcpu_sys_reg(vcpu, PMCNTENSET_EL0) & BIT(pmc->idx)))
+		return false;
+
+	if (kvm_pmu_counter_is_hyp(vcpu, pmc->idx))
+		return mdcr & MDCR_EL2_HPME;
+
+	return kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E;
 }
 
 static bool kvm_pmc_counts_at_el0(struct kvm_pmc *pmc)
-- 
2.47.0.163.g1226f6d8fa-goog


