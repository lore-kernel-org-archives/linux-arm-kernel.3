Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1E3D149E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Owyw17gWiY/wAB+tVVFDbqz1mQh4LseuhIiRcAFPnCo=; b=0rJrXlRxL10NwMqhuxDiFBWaal
	RaW+7fk42JNaM+BEuhnj7JfpcGmyPSE76qbMEDPnvHxxbK6UFIZAS2vH4jlHHi2XN6rRZYuoBfsW6
	9m/qRpjsb+IG5zd2XPHrlaKcyPAb88tamTB2QF7KbSF2jFBMAUpXm5D+GfS7fs0rJF+6H/Bh7v0Xr
	TtlYFPOW5DpCFj0hj6qVGX/2QUvlKXx5OYsZhfTSd5sh4ejhFEp8WeMDr789L+7tAvWE1Aa88d0u0
	RBWgR7q+N/iBtIsriSyE6V+rY7l4rCrcZSWjOfkm20+E9OwJZ18FQfXmqLyAKAIBmATu+GRcL1ONA
	ipVhQvmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PPc-00000004rmM-0rRp;
	Fri, 25 Oct 2024 18:51:52 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OzM-00000004mx3-2s9p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 18:24:47 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729880682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Owyw17gWiY/wAB+tVVFDbqz1mQh4LseuhIiRcAFPnCo=;
	b=TcH6DeFLIlJxfOvvh2g2c8lQNf63nJ1xNdujBUnCnhFJANWPjwhf3LJFZXDluQntM4Rk/H
	PcB85ZdAIMr3VD+fyZQM715VWN6peLMTHM4T1xAhsUp1C4wNOEBsq1aqR4LN5QWB26C5bR
	vHfvYTYR28NWFj03/2ihe3LkPxPapCY=
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
Subject: [PATCH v4 16/18] KVM: arm64: nv: Honor MDCR_EL2.HLP
Date: Fri, 25 Oct 2024 18:23:51 +0000
Message-ID: <20241025182354.3364124-17-oliver.upton@linux.dev>
In-Reply-To: <20241025182354.3364124-1-oliver.upton@linux.dev>
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_112445_059984_8844348F 
X-CRM114-Status: UNSURE (   9.33  )
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

Counters that fall in the hypervisor range (i.e. N >= HPMN) have a
separate control for enabling 64 bit overflow. Take it into account.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 349886f03fd5..1e9cdbc235a8 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -89,7 +89,11 @@ static bool kvm_pmc_is_64bit(struct kvm_pmc *pmc)
 
 static bool kvm_pmc_has_64bit_overflow(struct kvm_pmc *pmc)
 {
-	u64 val = kvm_vcpu_read_pmcr(kvm_pmc_to_vcpu(pmc));
+	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
+	u64 val = kvm_vcpu_read_pmcr(vcpu);
+
+	if (kvm_pmu_counter_is_hyp(vcpu, pmc->idx))
+		return __vcpu_sys_reg(vcpu, MDCR_EL2) & MDCR_EL2_HLP;
 
 	return (pmc->idx < ARMV8_PMU_CYCLE_IDX && (val & ARMV8_PMU_PMCR_LP)) ||
 	       (pmc->idx == ARMV8_PMU_CYCLE_IDX && (val & ARMV8_PMU_PMCR_LC));
-- 
2.47.0.163.g1226f6d8fa-goog


