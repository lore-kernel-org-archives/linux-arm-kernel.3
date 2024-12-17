Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30640E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 21:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTQ2Tzn1HxAPU/EVgkiyp2AhrhJBkik6I90AqfM4kFo=; b=m2vK7RXKH/IsiqHiot2DQmAxQV
	M0qvxHVETVzEPzyYlxRvJPaXurMUoqkjL9T1UaKr5kcophZmlGMZth9SQi+aPFvmn1KLdB4N/RMlG
	rATixT/2unFcGCpUXnjb2tRPzxW1axKwRPYkDezhP5q3FsmHM8Xzt23kmeu45iotCgFChQNBLTkMK
	EUCq18uEj8xeae+gTRaqWpRAEz1sPLf3syfA27p0kkvLdzCo/53Ah4DDqV3WxBrQZV8xLCjLJAC2g
	OEuNPHMSRI1N7/NY/XEqPCqm0c34pZ67cvJSVg11K/2z/szTah5FJ517q26jYmb1YtTiRlk3+PMCO
	eslCUkOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfB8-0000000EsOM-3aIP;
	Tue, 17 Dec 2024 21:32:30 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf0U-0000000EqX7-1SxV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 21:21:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734470488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NTQ2Tzn1HxAPU/EVgkiyp2AhrhJBkik6I90AqfM4kFo=;
	b=wFRC6+CUAMdRwboZkqFztEUtrhANO3wvwnKa2x+r/zKBV+O2jkyh51t0hCh82UiFi/wjZ5
	c0KX6V49bHL19huUTON3rMl+szrUm3Psf81+4lO1iPBGS1KhE4ZipLoBMOBVc+u/EbqBPf
	6tfob6iPBsWLgRokJUrSihicu3tT+F0=
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
Subject: [PATCH 10/18] KVM: arm64: Use guard() to cleanup usage of arm_pmus_lock
Date: Tue, 17 Dec 2024 13:20:40 -0800
Message-Id: <20241217212048.3709204-11-oliver.upton@linux.dev>
In-Reply-To: <20241217212048.3709204-1-oliver.upton@linux.dev>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_132130_534064_1BEE0FC0 
X-CRM114-Status: GOOD (  11.50  )
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

Get rid of some goto label patterns by using guard() to drop the
arm_pmus_lock when returning from a function.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 33cd694c754f..2c98cf24bef3 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -821,26 +821,23 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
 	if (!pmuv3_implemented(kvm_arm_pmu_get_pmuver_limit()))
 		return;
 
-	mutex_lock(&arm_pmus_lock);
+	guard(mutex)(&arm_pmus_lock);
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
 	if (!entry)
-		goto out_unlock;
+		return;
 
 	entry->arm_pmu = pmu;
 	list_add_tail(&entry->entry, &arm_pmus);
-
-out_unlock:
-	mutex_unlock(&arm_pmus_lock);
 }
 
 static struct arm_pmu *kvm_pmu_probe_armpmu(void)
 {
-	struct arm_pmu *tmp, *pmu = NULL;
 	struct arm_pmu_entry *entry;
+	struct arm_pmu *pmu;
 	int cpu;
 
-	mutex_lock(&arm_pmus_lock);
+	guard(mutex)(&arm_pmus_lock);
 
 	/*
 	 * It is safe to use a stale cpu to iterate the list of PMUs so long as
@@ -861,17 +858,13 @@ static struct arm_pmu *kvm_pmu_probe_armpmu(void)
 	 */
 	cpu = raw_smp_processor_id();
 	list_for_each_entry(entry, &arm_pmus, entry) {
-		tmp = entry->arm_pmu;
+		pmu = entry->arm_pmu;
 
-		if (cpumask_test_cpu(cpu, &tmp->supported_cpus)) {
-			pmu = tmp;
-			break;
-		}
+		if (cpumask_test_cpu(cpu, &pmu->supported_cpus))
+			return pmu;
 	}
 
-	mutex_unlock(&arm_pmus_lock);
-
-	return pmu;
+	return NULL;
 }
 
 static u64 __compute_pmceid(struct arm_pmu *pmu, bool pmceid1)
-- 
2.39.5


