Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75587E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 21:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TcLiLiTkrT1ZOgtNZ0/LRyp4Uk9ZY3x7+K0ZAo4Rt4=; b=qpW3RbAxx/iakL6rDib4G3TVhJ
	bgP84EqnxfumuzHJ7ipoG5VAnoPWfAx+jxWccxXTDBvKGpE0XgmD8/5G42xSjYrU7gaOwQjjt9v8v
	c4qBTEQm4DZmKLZUr6AzOshhfbLlsUM3yRJiEoCIbad/1HphSnVkor0SRK/MlQHaelZMRIq/vdOtb
	7oFKatPs7hgkk2e78vcq8E60mOMZfBaJgzwkf8qQgH/7/azcSoJc/kr2USDPbec/6MInblcQz2zUJ
	7aUrmU30nff4GzjGla5Gky3j4SoHRRoar55Z8XrZJh27ECcQe8ZdX7T/ne1hbiqYD+EW4qPG+x76S
	GDjB5eyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfFN-0000000EswF-1fKf;
	Tue, 17 Dec 2024 21:36:53 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf0M-0000000EqVN-2MeG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 21:21:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734470480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0TcLiLiTkrT1ZOgtNZ0/LRyp4Uk9ZY3x7+K0ZAo4Rt4=;
	b=hd1Dn/97T+NoQc/hRkwhWdtzP43/slWQvmsaGSweQIX8IDm8NpLbSNX+5B1+TUfdrRObC1
	uEyDi8M6QFSDcmbf5ugAowFLytn7XT33HSavk7UC3dcIVBcGig+M3pxNjbLgp4ZZ2+u+kg
	HlzjMiyc5g6VTP/GTFa1086NetX/ZWk=
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
Subject: [PATCH 07/18] KVM: arm64: Remap PMUv3 events onto hardware
Date: Tue, 17 Dec 2024 13:20:37 -0800
Message-Id: <20241217212048.3709204-8-oliver.upton@linux.dev>
In-Reply-To: <20241217212048.3709204-1-oliver.upton@linux.dev>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_132122_741658_65B94DC9 
X-CRM114-Status: GOOD (  10.95  )
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

Use the provided helper to map PMUv3 event IDs onto hardware, if the
driver exposes such a helper. This is expected to be quite rare, and
only useful for non-PMUv3 hardware.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 7f20da32266e..6d7fc0051ad8 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -692,6 +692,18 @@ static bool kvm_pmc_counts_at_el2(struct kvm_pmc *pmc)
 	return kvm_pmc_read_evtreg(pmc) & ARMV8_PMU_INCLUDE_EL2;
 }
 
+static u64 kvm_map_pmu_event(struct kvm *kvm, u64 eventsel)
+{
+	struct arm_pmu *pmu = kvm->arch.arm_pmu;
+	int hw_event;
+
+	if (!pmu->map_pmuv3_event)
+		return eventsel;
+
+	hw_event = pmu->map_pmuv3_event(eventsel);
+	return (hw_event < 0) ? eventsel : hw_event;
+}
+
 /**
  * kvm_pmu_create_perf_event - create a perf event for a counter
  * @pmc: Counter context
@@ -730,13 +742,13 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 
 	memset(&attr, 0, sizeof(struct perf_event_attr));
 	attr.type = arm_pmu->pmu.type;
+	attr.config = kvm_map_pmu_event(vcpu->kvm, eventsel);
 	attr.size = sizeof(attr);
 	attr.pinned = 1;
 	attr.disabled = !kvm_pmu_counter_is_enabled(pmc);
 	attr.exclude_user = !kvm_pmc_counts_at_el0(pmc);
 	attr.exclude_hv = 1; /* Don't count EL2 events */
 	attr.exclude_host = 1; /* Don't count host events */
-	attr.config = eventsel;
 
 	/*
 	 * Filter events at EL1 (i.e. vEL2) when in a hyp context based on the
-- 
2.39.5


