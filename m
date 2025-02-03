Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DACC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 18:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNDGXaXWlDnWYxdojyVit6ndHU1GueE33oD7T19VC2c=; b=HjXd/6UmG22Xn8csHgYWvQ3ywh
	tjeIqVYSjPpTVZCGf9r31Y/nfLPH5LNXBPbM0zSw6xPsaez5M4z1wFVXT4LBD5yW5j7P8DX25fhoP
	Mj4G510vMRvbasd2Y3h9oHaTujSaB8NakQUast5ZTgTR118qRKIs/w6gNiTy0r2/rYDVh6hl3UnN8
	5DKZdtKKT0+9gZcX0cLUy9GAKrstBUuNULOmBZ9odFK6IUdhyOr+W1hxSlsgVfBNz2Zwr8+983tUm
	oF+fde1+IU6ErvZC1x6W4CBeb4v7ZffTjdQSUI5OH71wOI9/Y+nz6DoGkrWzs80O+ZDyBKUyhjI4V
	dKhKttvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1VQ-0000000GKNz-3w36;
	Mon, 03 Feb 2025 18:49:12 +0000
Received: from out-175.mta0.migadu.com ([91.218.175.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1FG-0000000GH1G-3zQw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 18:32:32 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738607546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qNDGXaXWlDnWYxdojyVit6ndHU1GueE33oD7T19VC2c=;
	b=rzs/Ce4g0oaSYJyETez0mm4OJwtlje8EWZyFWbqrmmbuIhFwOioB8YKEVrrRV2vQ2zzhvZ
	2FHlzTz26XW4ED0qT33C9yjcIPwAcn7nvqcBwLyEY5IDq8WHkZLPqq9tvbmIWwNz9BwPsj
	iFlPkb5MKZBwJT3TqUtgW/DANaei9b0=
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
	Oliver Upton <oliver.upton@linux.dev>,
	Janne Grunau <j@jannau.net>
Subject: [PATCH v2 09/14] KVM: arm64: Use guard() to cleanup usage of arm_pmus_lock
Date: Mon,  3 Feb 2025 10:31:06 -0800
Message-Id: <20250203183111.191519-10-oliver.upton@linux.dev>
In-Reply-To: <20250203183111.191519-1-oliver.upton@linux.dev>
References: <20250203183111.191519-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_103231_132717_E09E3F47 
X-CRM114-Status: GOOD (  11.73  )
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

Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 8413a038e6c2..3048e22c240b 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -802,26 +802,23 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
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
@@ -842,17 +839,13 @@ static struct arm_pmu *kvm_pmu_probe_armpmu(void)
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


