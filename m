Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A19BC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Osiw3oVjK+7dRZsMZHKAmt8+0xs64bMaNjb1eOWi7oY=; b=s8qkxYmBaFggtSyGZKO9J/+89w
	6yv7CPruUSZ8AvBRSQF5Bzsy7zEk1Md1gUaPSp0hofhxPjMsWIMOBoKioLpMQ9lLrhi25YIqQSBAO
	2PMgmXtmwikqM7LbMy4xdd8jZHpJIRqFA2IvyQogACAZnYlF94eu1aRwfPsNA0O6VjNSbhniuCK2K
	Vewli/zw+6skosP/LWbobfgVNMN2GH4c0bfZg3ucuOXvv25tU4/kQC1SNs8A+eR4TcOrrDxlCRrSb
	fOjb/Ir3JZNw0Fdeo1rkHizjPWnmGvTxC6VMU31Wn9pAGkCXVDRuDkxd0qUc87h57Ft5Cg/cj1kW+
	ICYkGuFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUfN-00000009taq-34qx;
	Tue, 18 Feb 2025 20:58:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUAC-00000009kwJ-2qst
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:25:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB1A85C6298;
	Tue, 18 Feb 2025 20:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54E6C4CEE8;
	Tue, 18 Feb 2025 20:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910351;
	bh=rhEnxd6dxqXUn4fdDYtvd/B4dG/MCx/T8Z8mlfAZ6fg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZlYdW3WUpOwB+630by4/Y94uWeGStmKia/nExviRi+NgaCfAvGHmf2ENF0Lvyt5lF
	 IZxnUi4LAwyBhOAhag/g/s1zbu5zWsLt8gG64SP7bajqmNf/Mx6p3S1VIhP2pE5VJO
	 cTy1GA1UTLaMQdmPlPXFdVePUkvS88Cc2wayQ/QHHoVKP2j93TW1vrSOTkLjOY3SQk
	 2lN5/ZPKfqek7DwzZYsYR8+fr3o1pTC3RoEcRiQ0/8bB6SqPm2G7GdDVE+xhKXbnq8
	 wDioNA38YCpo0O5jDPC8FSlS5zx7YeE1/lhHpwBgFUgrCg9wKh/VB5Ir35b8UXe0Wb
	 ACOPUOzOIfGYQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Beata Michalska <beata.michalska@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.13 26/31] arm64: amu: Delay allocating cpumask for AMU FIE support
Date: Tue, 18 Feb 2025 15:24:46 -0500
Message-Id: <20250218202455.3592096-26-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202455.3592096-1-sashal@kernel.org>
References: <20250218202455.3592096-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.3
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_122552_813914_39D79536 
X-CRM114-Status: GOOD (  13.76  )
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

From: Beata Michalska <beata.michalska@arm.com>

[ Upstream commit d923782b041218ef3804b2fed87619b5b1a497f3 ]

For the time being, the amu_fie_cpus cpumask is being exclusively used
by the AMU-related internals of FIE support and is guaranteed to be
valid on every access currently made. Still the mask is not being
invalidated on one of the error handling code paths, which leaves
a soft spot with theoretical risk of UAF for CPUMASK_OFFSTACK cases.
To make things sound, delay allocating said cpumask
(for CPUMASK_OFFSTACK) avoiding otherwise nasty sanitising case failing
to register the cpufreq policy notifications.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Reviewed-by: Sumit Gupta <sumitg@nvidia.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Link: https://lore.kernel.org/r/20250131155842.3839098-1-beata.michalska@arm.com
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/kernel/topology.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 1a2c72f3e7f80..cb180684d10d5 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -194,12 +194,19 @@ static void amu_fie_setup(const struct cpumask *cpus)
 	int cpu;
 
 	/* We are already set since the last insmod of cpufreq driver */
-	if (unlikely(cpumask_subset(cpus, amu_fie_cpus)))
+	if (cpumask_available(amu_fie_cpus) &&
+	    unlikely(cpumask_subset(cpus, amu_fie_cpus)))
 		return;
 
-	for_each_cpu(cpu, cpus) {
+	for_each_cpu(cpu, cpus)
 		if (!freq_counters_valid(cpu))
 			return;
+
+	if (!cpumask_available(amu_fie_cpus) &&
+	    !zalloc_cpumask_var(&amu_fie_cpus, GFP_KERNEL)) {
+		WARN_ONCE(1, "Failed to allocate FIE cpumask for CPUs[%*pbl]\n",
+			  cpumask_pr_args(cpus));
+		return;
 	}
 
 	cpumask_or(amu_fie_cpus, amu_fie_cpus, cpus);
@@ -237,17 +244,8 @@ static struct notifier_block init_amu_fie_notifier = {
 
 static int __init init_amu_fie(void)
 {
-	int ret;
-
-	if (!zalloc_cpumask_var(&amu_fie_cpus, GFP_KERNEL))
-		return -ENOMEM;
-
-	ret = cpufreq_register_notifier(&init_amu_fie_notifier,
+	return cpufreq_register_notifier(&init_amu_fie_notifier,
 					CPUFREQ_POLICY_NOTIFIER);
-	if (ret)
-		free_cpumask_var(amu_fie_cpus);
-
-	return ret;
 }
 core_initcall(init_amu_fie);
 
-- 
2.39.5


