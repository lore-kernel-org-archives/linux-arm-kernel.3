Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F88C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeCNpdeRoI8QajyV6e3aQEh/w6JG3nllZj3IC/6sm2A=; b=CkJW4RmA3W2nX9pmHDjVarAhGc
	sgIO5OB5XwlAl6N+UTynm1EIYF0/JQ+BET+y6pH1C+zwP94CbRgwnE2G2ELD1ZrgNQDCfO5duULTg
	A+ooVkjfQgD44nINdgKdyoZlKap4zma+IQ7cq5J4DXCcjUbq4n1ySakpfil9hHGtClUG9rqcqOfxU
	8XKUHIrHi80kbMMa+FrxkO4GhVB+9TwmvCixkgiSLaAYtXLTpXBciFApUerhuiDIGSBEHqUOiDjQt
	MQm8VxXJXLdu+9nQksmT4+KIGKHiG6xSdCkGBS72v1b8CccV3oBfIC9TvK+2y8gB0o87q1BZBPKCr
	LhCTZtPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EN8-0000000BkrH-3nIj;
	Thu, 17 Sep 2026 15:50:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EN2-0000000Bknz-3LWr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:49:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05B331AED;
	Thu, 17 Sep 2026 08:49:52 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1C753F7B4;
	Thu, 17 Sep 2026 08:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789660195; bh=7sqR+1Z/fJAou2PRLS/FpDCcUcqzxktOKzSP5jajxKE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NJXJks/QzNPAg8o/kiW0WP7OkbIC3tLvBwIXPD8xNeyyh3vS+49ZsPrvqsuHi39K2
	 +pzlTbePYIRQdZxsiqCYyVRa/wQBwjcaOal+2/kvba6HwkD6dZgTaz/5DG392k/hJ6
	 ZWqL7GsmN7HvnBpiCYj87607s7EnnRUpqxqcjCrs=
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
Subject: [PATCH kvmtool 2/7] arm64: Consistently treat vcpu_affinity_cpuset as dynamically allocated
Date: Thu, 17 Sep 2026 16:49:27 +0100
Message-ID: <20260917154932.193943-3-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917154932.193943-1-alexandru.elisei@arm.com>
References: <20260917154932.193943-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_084956_878028_F78EE915 
X-CRM114-Status: GOOD (  10.56  )
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

man 3 CPU_ALLOC says that for dynamically allocated cpusets, one should use
the *_S macros to manipulate the cpuset, and the example program also
demonstrates this. Use CPU_SET_S and CPU_ISSET_S to comply.

Fixes: 4639b72f61a3 ("arm64: Add --vcpu-affinity command line argument")
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm64/kvm.c | 6 ++++--
 arm64/pmu.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arm64/kvm.c b/arm64/kvm.c
index cdd673542aea..5f3ed9f6d201 100644
--- a/arm64/kvm.c
+++ b/arm64/kvm.c
@@ -450,6 +450,7 @@ int vcpu_affinity_parser(const struct option *opt, const char *arg, int unset)
 	struct kvm *kvm = opt->ptr;
 	const char *cpulist = arg;
 	cpumask_t *cpumask;
+	size_t setsize;
 	int cpu, ret;
 
 	kvm->cfg.arch.vcpu_affinity = cpulist;
@@ -467,10 +468,11 @@ int vcpu_affinity_parser(const struct option *opt, const char *arg, int unset)
 	kvm->arch.vcpu_affinity_cpuset = CPU_ALLOC(NR_CPUS);
 	if (!kvm->arch.vcpu_affinity_cpuset)
 		die_perror("CPU_ALLOC");
-	CPU_ZERO_S(CPU_ALLOC_SIZE(NR_CPUS), kvm->arch.vcpu_affinity_cpuset);
 
+	setsize = CPU_ALLOC_SIZE(NR_CPUS);
+	CPU_ZERO_S(setsize, kvm->arch.vcpu_affinity_cpuset);
 	for_each_cpu(cpu, cpumask)
-		CPU_SET(cpu, kvm->arch.vcpu_affinity_cpuset);
+		CPU_SET_S(cpu, setsize, kvm->arch.vcpu_affinity_cpuset);
 
 	return 0;
 }
diff --git a/arm64/pmu.c b/arm64/pmu.c
index 49d58ddd529b..e5a07abcd317 100644
--- a/arm64/pmu.c
+++ b/arm64/pmu.c
@@ -191,6 +191,7 @@ static int find_pmu(struct kvm *kvm)
 {
 	cpumask_t *cpumask;
 	int i, this_cpu;
+	size_t setsize;
 
 	cpumask = calloc(cpumask_size(), 1);
 	if (!cpumask)
@@ -202,8 +203,9 @@ static int find_pmu(struct kvm *kvm)
 			return -errno;
 		cpumask_set_cpu(this_cpu, cpumask);
 	} else {
-		for (i = 0; i < CPU_SETSIZE; i ++) {
-			if (CPU_ISSET(i, kvm->arch.vcpu_affinity_cpuset))
+		setsize = CPU_ALLOC_SIZE(NR_CPUS);
+		for (i = 0; i < NR_CPUS; i ++) {
+			if (CPU_ISSET_S(i, setsize, kvm->arch.vcpu_affinity_cpuset))
 				cpumask_set_cpu(i, cpumask);
 		}
 	}
-- 
2.55.0


