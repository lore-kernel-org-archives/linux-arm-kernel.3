Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4799C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 19:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xU/TVU9R6QqVQBU8DMj4Dr025QCTEz1Y5w5z0voxEUA=; b=Z3r2wLZh1c7T2pswnTZ5TG3AfU
	9+1uKvNBlVUCZuAj8zA8R8FFTgjy0Kv2AYZMrsRO7i6KPUnaTvwUpfTBRlssOdQS6bogvtb8K5Q3S
	O6yeg7/uVCGNxaM78FmINUy7p+F1ceL7v8dCQNxTYZ8i9xc9b17wlEfFYmWk2lfsLdo5HN+XAwfVv
	zklLccCofbcXWVAaWOI+HFOTFDPNdFXz5z3pnEReKgH5w4m1OGPKi/PiiOrhdN5IMhAbMnZ2gd4fX
	Um2tlgH09m11gz3Cu++vzSjmlAifpW31DswirSE9Eqx9AWDeFfgNtHZGlKL/4nUGFYt4Z7l3Ei3ZD
	axk5LitQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Nu7-0000000ChSm-31dH;
	Wed, 09 Sep 2026 19:24:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Nu4-0000000ChQ8-0d5W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 19:24:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so73008825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 12:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981854; x=1789586654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xU/TVU9R6QqVQBU8DMj4Dr025QCTEz1Y5w5z0voxEUA=;
        b=O6OfxAYkZeQiDcxTfZ/IcqEz6ZI4a2OmBHJlfTOAvDVvc8Z9zNgafMe9KcG6UNtkkp
         6fAbhqcYssVKmEbdVKfqLH1ebymI2XKL+tni9g8tQOdaI1LE8IEfpCFzEhbbYU/hGldv
         kpR34DJhwVXKw25Dfj+xt9EY9gGwjE4tjo3ovaecVbWF5R+oQVRiioelJ1twzd+sCN7d
         sk53TleHw9RvMx9uiJ9OUiSSt1pHsqUL9T0VfKt683Pg7uaCB51EGVi6BN/eDduis/7o
         aQcGo5vim9EmH5WmwIGcT7gto8klG4Dh6Fj3s1miHHzFCGToEC+3kWI+/OzLXfLcIcO4
         3BEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981854; x=1789586654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xU/TVU9R6QqVQBU8DMj4Dr025QCTEz1Y5w5z0voxEUA=;
        b=IRw+v8Mze6iXx9gtImx/0UPwkCa5vNyJxurPyjXhPBTqEavJR4Qi2niIpK9GuAZm+R
         8jUDHqtxgDrGq8MxlqQAcyAAwjvEdLAHWt3D63IKjmTFrUnfaX2sNgjM7ra/1XD9FFjK
         zrmRZCsgYU5BJmqyrp9H0hEat3rijR4jRpIJNqeLdcvZi8MYq1mrT6X/1NnxFXUF+4cP
         eW7vKsBvN3MW3TMea0YfJpZ9dSIQHH6Lis13aCZifK9pB1RljUty+5BvqOrfyN8YopFD
         jc4wvAILDKmmUDuYHAThihQ3QNcN4GrVl7BSXEBGkovCiY3vko1Lf5VRo5Rcdz8QHNVE
         LQ8Q==
X-Gm-Message-State: AFuF++ncCup5FAkSRZRrAks24Uq3w9e4qjhL5wr7zpLYULmMCVcbY89e
	9znTpyFJY3ZZIToLRRFAGgGNt8PsRJ9/gVnwFZNvHhJiC4w8UWjI45lQ
X-Gm-Gg: AYBFou2CjCunw43+sfTuG5NQSCqv5qltbpLDcI+EXcmV9pKveuajeL7mrbvh9GqSBL2
	lij8tT6Mank24r70mYLBqRYmtNuHGA84vGihofHrw1VJ27c28BdyuN8yxSwfA78EEeTYVg3ACFi
	g3pGEgXL1Cljv2kmZckRSbvtDGafqn1gBURrvKlYvSVDAyyrh3THJ8zlBz6Hrr3JVNvZfMRw5nu
	L161IaNdz9JkgbSSKhovyKnb3ugF/6A6D3/xAJ+wP0r/IbXJrGNBHg5IlDndRKCEhmfYrX1C9RU
	d74ID7g3ZV9WKRGyNXduHX3ZDieiSxIJOE85A2DnJPB03eB1wYZrbQF1ASnmdKoV+/R/S6YEFvF
	BdLIVANxY1CHTIEUrJBGTHzG8ffLhElars0TWLlHFYIapIk7f1nOCmXLoPTVrdGvZlYo+0MgpAN
	O1tG2pOGjinLqJctf1lnQVG6UfVJG9Fo/H163SlGCuUH7CpgHeeIKfT9hpa2121rHsWmKHGUsCd
	4BzPgoZ6IpkBxhFn9VN8IjIlnCj8fiTVvWicPRTpy0pxF6pjuLoY9Y=
X-Received: by 2002:a05:600c:c173:b0:49c:cedc:3c36 with SMTP id 5b1f17b1804b1-49cf82a514cmr391436765e9.16.1788981854243;
        Wed, 09 Sep 2026 12:24:14 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26bf9490sm10925625e9.9.2026.09.09.12.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:24:12 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v2 2/2] cpufreq: update capacity_freq_ref when the boost state changes
Date: Wed,  9 Sep 2026 21:23:51 +0200
Message-ID: <20260909192351.33910-3-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909192351.33910-1-okerixx@gmail.com>
References: <20260909192351.33910-1-okerixx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_122416_224177_4F4C3D18 
X-CRM114-Status: GOOD (  20.88  )
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

capacity_freq_ref is latched from policy->cpuinfo.max_freq by
init_cpu_capacity_callback() on CPUFREQ_CREATE_POLICY, and never
updated afterwards.

cpufreq_frequency_table_cpuinfo() excludes CPUFREQ_BOOST_FREQ entries
while boost is disabled, so on a system that boots with boost off the
latched value is the non-boost maximum.  Enabling boost later raises
policy->cpuinfo.max_freq but leaves capacity_freq_ref behind.

Two things then go wrong on arm64, where the AMU drives frequency
invariance.  amu_scale_freq_tick() caps the computed scale at
SCHED_CAPACITY_SCALE, so a CPU running above capacity_freq_ref
saturates at 1024: the scheduler cannot tell a boosted CPU from one at
the sustained maximum, and utilisation is underestimated.  And
arch_freq_get_on_cpu(), which reverses that computation, cannot report
more than capacity_freq_ref, so cpuinfo_avg_freq is pinned to the
non-boost maximum.

On a Snapdragon X2 Elite (Glymur) laptop with a 4032000 kHz sustained
and a 4723200 kHz boost OPP, cpuinfo_avg_freq reads exactly 4032000
while the CPU runs at 4723200; a fixed workload completes in 1.72 s
rather than the 2.01 s that frequency would imply.

Factor the update out of init_cpu_capacity_callback() into
topology_update_freq_ref() and call it from policy_set_boost(), which
is the common path for the global boost knob, the per-policy one, and
the CPU online path.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 arch/arm/include/asm/topology.h   |  1 +
 arch/arm64/include/asm/topology.h |  1 +
 arch/riscv/include/asm/topology.h |  1 +
 drivers/base/arch_topology.c      | 19 +++++++++++++------
 drivers/cpufreq/cpufreq.c         |  2 ++
 include/linux/arch_topology.h     |  1 +
 include/linux/cpufreq.h           |  7 +++++++
 7 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/topology.h b/arch/arm/include/asm/topology.h
index ad36b6570067..a776a79885ee 100644
--- a/arch/arm/include/asm/topology.h
+++ b/arch/arm/include/asm/topology.h
@@ -11,6 +11,7 @@
 #ifndef CONFIG_BL_SWITCHER
 /* Replace task scheduler's default frequency-invariant accounting */
 #define arch_set_freq_scale topology_set_freq_scale
+#define arch_update_freq_ref topology_update_freq_ref
 #define arch_scale_freq_capacity topology_get_freq_scale
 #define arch_scale_freq_invariant topology_scale_freq_invariant
 #define arch_scale_freq_ref topology_get_freq_ref
diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
index b9eaf4ad7085..a4b96a7ee4a5 100644
--- a/arch/arm64/include/asm/topology.h
+++ b/arch/arm64/include/asm/topology.h
@@ -22,6 +22,7 @@ void update_freq_counters_refs(void);
 /* Replace task scheduler's default frequency-invariant accounting */
 #define arch_scale_freq_tick topology_scale_freq_tick
 #define arch_set_freq_scale topology_set_freq_scale
+#define arch_update_freq_ref topology_update_freq_ref
 #define arch_scale_freq_capacity topology_get_freq_scale
 #define arch_scale_freq_invariant topology_scale_freq_invariant
 #define arch_scale_freq_ref topology_get_freq_ref
diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
index fe1a8bf6902d..a363d72c174f 100644
--- a/arch/riscv/include/asm/topology.h
+++ b/arch/riscv/include/asm/topology.h
@@ -11,6 +11,7 @@
 /* Replace task scheduler's default frequency-invariant accounting */
 #define arch_scale_freq_tick		topology_scale_freq_tick
 #define arch_set_freq_scale		topology_set_freq_scale
+#define arch_update_freq_ref		topology_update_freq_ref
 #define arch_scale_freq_capacity	topology_get_freq_scale
 #define arch_scale_freq_invariant	topology_scale_freq_invariant
 #define arch_scale_freq_ref		topology_get_freq_ref
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..79eb1681065d 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -317,6 +317,18 @@ bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)
 	return !ret;
 }
 
+void topology_update_freq_ref(const struct cpumask *cpus, unsigned int max_freq)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		per_cpu(capacity_freq_ref, cpu) = max_freq;
+		freq_inv_set_max_ratio(cpu,
+				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
+	}
+}
+EXPORT_SYMBOL_GPL(topology_update_freq_ref);
+
 void __weak freq_inv_set_max_ratio(int cpu, u64 max_rate)
 {
 }
@@ -392,7 +404,6 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 			   void *data)
 {
 	struct cpufreq_policy *policy = data;
-	int cpu;
 
 	if (val != CPUFREQ_CREATE_POLICY)
 		return 0;
@@ -403,11 +414,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 
 	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
 
-	for_each_cpu(cpu, policy->related_cpus) {
-		per_cpu(capacity_freq_ref, cpu) = policy->cpuinfo.max_freq;
-		freq_inv_set_max_ratio(cpu,
-				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
-	}
+	topology_update_freq_ref(policy->related_cpus, policy->cpuinfo.max_freq);
 
 	if (cpumask_empty(cpus_to_visit)) {
 		if (raw_capacity) {
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 96515880b4ac..a70805a1d9d3 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -594,6 +594,8 @@ static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
 		return ret;
 	}
 
+	arch_update_freq_ref(policy->related_cpus, policy->cpuinfo.max_freq);
+
 	return 0;
 }
 
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index ebd7f8935f96..4974f5e1a7fe 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -31,6 +31,7 @@ static inline unsigned long topology_get_freq_scale(int cpu)
 
 void topology_set_freq_scale(const struct cpumask *cpus, unsigned long cur_freq,
 			     unsigned long max_freq);
+void topology_update_freq_ref(const struct cpumask *cpus, unsigned int max_freq);
 bool topology_scale_freq_invariant(void);
 
 enum scale_freq_source {
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 35ce665edfd8..5b904e13eb21 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1235,6 +1235,13 @@ void arch_set_freq_scale(const struct cpumask *cpus,
 }
 #endif
 
+#ifndef arch_update_freq_ref
+static __always_inline
+void arch_update_freq_ref(const struct cpumask *cpus, unsigned int max_freq)
+{
+}
+#endif
+
 /* the following are really really optional */
 extern struct freq_attr cpufreq_freq_attr_scaling_available_freqs;
 extern struct freq_attr cpufreq_freq_attr_scaling_boost_freqs;
-- 
2.55.0


