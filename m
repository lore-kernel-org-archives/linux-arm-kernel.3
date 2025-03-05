Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F78BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfEdFUvQ2EkRiUWOzt1MvFJ8DJkkjSEDwZPsVt74AJw=; b=iUsyi0TpKTawhpY5BdUIG1S/8R
	eSckq38/ev+nFqRWapPwnlA2fvjRC9LeOp8Tu29p1iSTYys4GEyt/viVrKiaY2C9wqmYSDMuiij+I
	IW/0g32d4fnwHDBOC+svHwYIDmAr6xSF3hc/jKDPsAxQf06s/91Df/bISbIOwJDbW6PQiapoktGtA
	89vGVMfoMwxrGZ//Zbp7ioNSnOcszJM5+KCfaKHIovCcozn3e62ZqPM8GSO5dmNqipcpONnvybMYt
	/AbBO4MDX4bdCmBAoNRw/I8/5+Eswe8bxgMv2i9U93erMjBpMYkO9MirwIQAky4TMjMKVNMqb2ou4
	t2riH+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvgO-00000009Gqg-2p5z;
	Wed, 05 Mar 2025 20:49:36 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvL0-00000009DB8-24ut
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 20:27:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741206448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EfEdFUvQ2EkRiUWOzt1MvFJ8DJkkjSEDwZPsVt74AJw=;
	b=M2R3OIBO2T2joABxVS4DWe8rw8KKxwY5m9riq5I9pxyXhzZ4kifOy+Qdm2MNmL0VC8c2A3
	H6cb+zuqg0mL9+SgzWjE6JqFJCvOzxQ/VOs8NGbcESgdLV5aAWuYUERI1xw3mQA9kOxBud
	jKhdb+/5aZ/YhSuWnluCHt1QF13Iu+8=
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
	Janne Grunau <j@jannau.net>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v3 11/14] KVM: arm64: Remap PMUv3 events onto hardware
Date: Wed,  5 Mar 2025 12:26:38 -0800
Message-Id: <20250305202641.428114-12-oliver.upton@linux.dev>
In-Reply-To: <20250305202641.428114-1-oliver.upton@linux.dev>
References: <20250305202641.428114-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_122730_683952_21F8A2C1 
X-CRM114-Status: GOOD (  15.53  )
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

Map PMUv3 event IDs onto hardware, if the driver exposes such a helper.
This is expected to be quite rare, and only useful for non-PMUv3 hardware.

Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c    | 25 ++++++++++++++++++++++++-
 include/linux/perf/arm_pmu.h |  4 ++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 38d9490c17fd..5f4e9be8aa8b 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -677,6 +677,20 @@ static bool kvm_pmc_counts_at_el2(struct kvm_pmc *pmc)
 	return kvm_pmc_read_evtreg(pmc) & ARMV8_PMU_INCLUDE_EL2;
 }
 
+static int kvm_map_pmu_event(struct kvm *kvm, unsigned int eventsel)
+{
+	struct arm_pmu *pmu = kvm->arch.arm_pmu;
+
+	/*
+	 * The CPU PMU likely isn't PMUv3; let the driver provide a mapping
+	 * for the guest's PMUv3 event ID.
+	 */
+	if (unlikely(pmu->map_pmuv3_event))
+		return pmu->map_pmuv3_event(eventsel);
+
+	return eventsel;
+}
+
 /**
  * kvm_pmu_create_perf_event - create a perf event for a counter
  * @pmc: Counter context
@@ -687,7 +701,8 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 	struct arm_pmu *arm_pmu = vcpu->kvm->arch.arm_pmu;
 	struct perf_event *event;
 	struct perf_event_attr attr;
-	u64 eventsel, evtreg;
+	int eventsel;
+	u64 evtreg;
 
 	evtreg = kvm_pmc_read_evtreg(pmc);
 
@@ -713,6 +728,14 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 	    !test_bit(eventsel, vcpu->kvm->arch.pmu_filter))
 		return;
 
+	/*
+	 * Don't create an event if we're running on hardware that requires
+	 * PMUv3 event translation and we couldn't find a valid mapping.
+	 */
+	eventsel = kvm_map_pmu_event(vcpu->kvm, eventsel);
+	if (eventsel < 0)
+		return;
+
 	memset(&attr, 0, sizeof(struct perf_event_attr));
 	attr.type = arm_pmu->pmu.type;
 	attr.size = sizeof(attr);
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 4b5b83677e3f..7ce6dea5bfa9 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -100,6 +100,10 @@ struct arm_pmu {
 	void		(*stop)(struct arm_pmu *);
 	void		(*reset)(void *);
 	int		(*map_event)(struct perf_event *event);
+	/*
+	 * Called by KVM to map the PMUv3 event space onto non-PMUv3 hardware.
+	 */
+	int		(*map_pmuv3_event)(unsigned int eventsel);
 	DECLARE_BITMAP(cntr_mask, ARMPMU_MAX_HWEVENTS);
 	bool		secure_access; /* 32-bit ARM only */
 #define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
-- 
2.39.5


