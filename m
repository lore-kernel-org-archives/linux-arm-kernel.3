Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2048FC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKE7waXahrL/wj901/PgSLUvYMTHuq0PMoAwxr4tukA=; b=sbSScrdvPUXTd9bHP8jlt7wFoT
	LBA+FuV/uxpFvOZMiIiU9J2Oyojj957iIjn5WzUMN6qZNc1UcQvaPNrol6kgHdFSXOEtvJ62wcL6F
	/KaNJa767ivjDo0bQL8qKcntW/SsVgSrLcSspurKb2PM4J3/6apgc2i7GYfUoK8f3TdahalomlBrr
	OSwhuU7AnmLW9FpOVrKmxeppT/rZ63VwN8KMl/fbgKoeAY5Y5iU2ZWcjklcy3Kc0sSghd18Nmu/WV
	mz0whZNsZUoCiYPrPM6Xk2dVP/ZTqroXrc7Y07giuMsqjlhdxAQBoWry6SzJbaQPMgyXkSUebyNLk
	ZtLR6y4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EN9-0000000Bkrx-0aJf;
	Thu, 17 Sep 2026 15:50:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EN6-0000000BkpH-08uP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:50:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD2C31F37;
	Thu, 17 Sep 2026 08:49:55 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9FB13F7B4;
	Thu, 17 Sep 2026 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789660199; bh=uj9ZhxPtZlaMAJjllPz+XYRBkA3Sgv72c0v1bO+y8ic=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WRfIo66+RNyHDDP73SbOEOHjy7/jhlsevqI2ipFIm7MsCkfLlI8OeXMavfr9VE577
	 4ooAI4aPFjGiwxipG8MK/sXJPVC+lrHlUpfwWulLN/kgulZsNcIylTL2iRndDOrKJT
	 y3XGAXaXL0SQxdB+SM4qbYRrbI5Q4unGPiudwVJY=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: will@kernel.org,
	julien.thierry.kdev@gmail.com,
	kvm@vger.kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH kvmtool 4/7] arm64/pmu: Consider kvmtool's affinity when searching for a PMU
Date: Thu, 17 Sep 2026 16:49:29 +0100
Message-ID: <20260917154932.193943-5-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917154932.193943-1-alexandru.elisei@arm.com>
References: <20260917154932.193943-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_085000_123660_141B1B8B 
X-CRM114-Status: GOOD (  15.98  )
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

When --vcpu-affinity is set, find_pmu() -> find_pmu_cpumask() attempts to
find a PMU instance that is shared by all CPUs in the specified affinity.

If --vcpu-affinity is not set, find_pmu() will only attempt to find a PMU
instance associated with the *current* physical CPU. This misses the fact
that it might be possible that the other threads that kvmtool creates
(which include the VCPU threads), might be executed on physical CPUs which
have a different PMU instance than the *current* physical CPU (or none at
all). This can lead to hard to reproduce and diagnose errors.

Improve things by teaching find_pmu() to use kvmtool process CPU affinity
when --vcpu-affinity is not set.

Also fix a memory leak by freeing the local variable 'cpumask'.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm64/pmu.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/arm64/pmu.c b/arm64/pmu.c
index e5a07abcd317..d3761689c907 100644
--- a/arm64/pmu.c
+++ b/arm64/pmu.c
@@ -189,28 +189,44 @@ out_free:
  */
 static int find_pmu(struct kvm *kvm)
 {
+	cpu_set_t *affinity;
 	cpumask_t *cpumask;
-	int i, this_cpu;
 	size_t setsize;
+	int i, ret = 0;
 
 	cpumask = calloc(cpumask_size(), 1);
 	if (!cpumask)
 		die_perror("calloc");
 
-	if (!kvm->arch.vcpu_affinity_cpuset) {
-		this_cpu = sched_getcpu();
-		if (this_cpu < 0)
-			return -errno;
-		cpumask_set_cpu(this_cpu, cpumask);
+	setsize = CPU_ALLOC_SIZE(NR_CPUS);
+
+	if (kvm->arch.vcpu_affinity_cpuset) {
+		affinity = kvm->arch.vcpu_affinity_cpuset;
 	} else {
-		setsize = CPU_ALLOC_SIZE(NR_CPUS);
-		for (i = 0; i < NR_CPUS; i ++) {
-			if (CPU_ISSET_S(i, setsize, kvm->arch.vcpu_affinity_cpuset))
-				cpumask_set_cpu(i, cpumask);
+		affinity = CPU_ALLOC(NR_CPUS);
+		if (!affinity)
+			die_perror("CPU_ALLOC");
+		CPU_ZERO_S(setsize, affinity);
+
+		ret = sched_getaffinity(0, setsize, affinity);
+		if (ret < 0) {
+			ret = -errno;
+			goto out_free;
 		}
 	}
 
-	return find_pmu_cpumask(kvm, cpumask);
+	for (i = 0; i < NR_CPUS; i ++) {
+		if (CPU_ISSET_S(i, setsize, affinity))
+			cpumask_set_cpu(i, cpumask);
+	}
+
+	ret = find_pmu_cpumask(kvm, cpumask);
+
+out_free:
+	free(cpumask);
+	if (!kvm->arch.vcpu_affinity_cpuset)
+		CPU_FREE(affinity);
+	return ret;
 }
 
 void pmu__generate_fdt_nodes(void *fdt, struct kvm *kvm)
-- 
2.55.0


