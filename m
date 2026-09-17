Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B37C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4gUHCOX6sUXg0tUw+Jt5/2DPSL1IAFpd2jKjnoUpgn0=; b=1d/cNdg3+MJ/aK3IbEHzZJGato
	tpcFL5aX9ldvXn/HpLyw2JTdfmq39Xs4jsNmd2QlSscJvKAep3ZUK2VTXTQazS2iZMa6J2whu+DFl
	1cqLs/NRcfdxUi2gfrpjQ3IuxFwvhr7WxxwVhyHwG7LWtY0MnhEjQzFlpKE9O70k1wFZeoOEU/Xqx
	yCtNLL6D5/alm2onVSdPXFxlima9BCPWXpLkPEt3nOmnymN4d+WQwmAhTTTLzU0oasAPN2niFmspQ
	IXJw5iTajxw1enFYaa/PIeF8zY0Nove8HZxeoZQ8qAbZdzwhcPhyJtLiFpwpKWoTPvhRiplP6u8+w
	4vFAuAeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GjR-0000000CDTC-2NPW;
	Thu, 17 Sep 2026 18:21:13 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GjP-0000000CDQk-0xuY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 18:21:12 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso11566335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669270; x=1790274070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4gUHCOX6sUXg0tUw+Jt5/2DPSL1IAFpd2jKjnoUpgn0=;
        b=WMvdn8j5IFbmS9wwMHtPkU1fDUXpNLwwAHWt4m2Dgy8WxiMZeAcI20DK/siEMzwcKq
         CmnHLONVg+eqmHfATXxhiDCzKuHKeBGkFheZtd/zRLwKOPCPwVMjMMyS3oUsYWYa4c/U
         iEQpZS3xxYuelBFYgmf8wMpf/85xsbvHuRDmGyQlWgp/3S0+O006mJf1W/6b4IhMX9TM
         EeTPo8aLWSyGrbXTbaUPWZj4hhYt+i0R5utFo073qebNhFdUe8oHXUWAGwJKc0K0hHJO
         w0ZXoDCtSPNe5g/kk3uhkrDZxNFIQjB6oOu5bBTrJZO0En4fOxhEGo0PwIZuhHDBX8uO
         f26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669270; x=1790274070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4gUHCOX6sUXg0tUw+Jt5/2DPSL1IAFpd2jKjnoUpgn0=;
        b=prDorBzrbvDJhgLh3dyXX2S6OI/OBlo7eFqcgqXPE6JbH7HBoNY1OyAAUlgRczi13c
         jkAKGcL3zPLUoCrNUHpWnWBeT/ZxXU31VOGh4r4+5074BFRqyzGMws9P8dkk23CDPNW0
         APr38cVQfwdtpPMiyD+bk8z19IK7JCkvC16ssYeKT0joDCrgypcrPsVuh+KZnW8HLn9c
         jtTyhZhcRgcqnid/myGuEth6u9Z3/QeM84fgxncxonv29MphiO7L/NKQpL4yqe539kxn
         locPtR9xHnU9k5xwPLUCvd8IcwuyS9Lh6EDXEMMKyRabqcQNnNLMpgQcIiNelcdeJSDl
         P1vA==
X-Gm-Message-State: AFuF++lfc5hkGXsYe9PQxnX9053RJ6QlRvJMfJ1kEjz1Bnt1uTE9X0XA
	v+1ucuSN90agqrfulGXZfzM95nUZ3R4pttvFsZwfPgf2ZXZxvDBZ/daD
X-Gm-Gg: AYBFou1P61JDnkCZUPZjBc5vw6vWXYVDg+stakpwr0gQ4bz7b6Y0IUFGNZ3jHNT5qnL
	6zv1+3oq+kQAOMe1Q8Rv1LPc1wFD1MOIKzo3tYeQ63YC5hZ7G0iX/RWWo9GJgtvLfeV0OfGBzmK
	+ZRz61W9sDa5n5AHZX5P84Cnpy0pT0GsRCgZ9swIh+dO4iD7dOKKGMeGMGRux+HoKQmr4IkglEc
	SP291o3UJISKi1YROywssJcbzb74MWgC+IpbBcL6DfygoUbyJXy64CSbaCf4pgljDL/qls56YMR
	uI1qFOZST5KgfR5gMxzlopcMQLXX9gIb++4gDjnIMydke7PfkkU+dzlGvaOT0v72oMoCpp4sNCl
	0BDkImisUQk5ag/OmeGGZx9q0zliwCaihI+3xIDpXJtACosiXeE8XFww5APeI95W5u+i7jV4WXZ
	71qBN6S3h2f/O2qHtSLDiI/lDjs9Zc/Y0gdZdQnb9xWJi4ZphrHZAFAcP1ZQ5VgxYmpx3PyyfuY
	HZOpJ4K
X-Received: by 2002:a05:600c:1f87:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49ead86eb54mr92023815e9.11.1789669269234;
        Thu, 17 Sep 2026 11:21:09 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fbd225898sm101433835e9.9.2026.09.17.11.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:21:08 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	linux-pm@vger.kernel.org
Subject: [PATCH v5] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Thu, 17 Sep 2026 20:20:59 +0200
Message-ID: <20260917182059.2851-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_112111_296890_CE4FA568 
X-CRM114-Status: GOOD (  18.11  )
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

arch_freq_get_on_cpu() computes the product of the frequency scale and
the reference frequency as a u64, but assigns it to an unsigned int
before shifting it back down:

	freq = scale * arch_scale_freq_ref(cpu);
	freq >>= SCHED_CAPACITY_SHIFT;

The product is truncated to 32 bits before the shift, so the result
wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
i.e. 4194304 kHz.

On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
the CPU demonstrably runs at the boost frequency: a fixed workload
completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
kHz, matching the 1.171 frequency ratio.

Compute it with cap_scale(), turned into a static inline taking u64 and
moved to <linux/sched/topology.h> so it is usable outside kernel/sched.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
Changes in v5:
- cap_scale() becomes a static inline taking u64 arguments instead of
  a macro, as Dietmar proposed and Peter agreed, after Peter pointed out
  that the macro relies on one operand being u64.  It now lives in
  <linux/sched/topology.h>, where SCHED_CAPACITY_SHIFT is visible,
  rather than <linux/topology.h>.
- Patch 2/2 of v4 is dropped: it duplicated Ananthu C V's series [1],
  which I tested instead.  This fix is needed with that series, since
  it puts the reference above 4194304 kHz from boot.
- v4: https://lore.kernel.org/all/20260917125112.2283-1-okerixx@gmail.com/

[1] https://lore.kernel.org/all/20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com/

 arch/arm64/kernel/topology.c   | 6 ++----
 include/linux/sched/topology.h | 5 +++++
 kernel/sched/sched.h           | 2 --
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f..39dd7f8575cd 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/percpu.h>
 #include <linux/sched/isolation.h>
+#include <linux/sched/topology.h>
 #include <linux/xarray.h>
 
 #include <asm/cpu.h>
@@ -186,7 +187,6 @@ int arch_freq_get_on_cpu(int cpu)
 	struct amu_cntr_sample *amu_sample;
 	unsigned int start_cpu = cpu;
 	unsigned long last_update;
-	unsigned int freq = 0;
 	u64 scale;
 
 	if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
@@ -245,9 +245,7 @@ int arch_freq_get_on_cpu(int cpu)
 	 * (see amu_scale_freq_tick for details)
 	 */
 	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
-	return freq;
+	return cap_scale(arch_scale_freq_ref(cpu), scale);
 }
 
 static void amu_fie_setup(const struct cpumask *cpus)
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index b5d9d7c2b8ad..922b2f015e89 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -234,6 +234,11 @@ static inline void rebuild_sched_domains_energy(void)
 }
 #endif
 
+static inline u64 cap_scale(u64 value, u64 scale)
+{
+	return value * scale >> SCHED_CAPACITY_SHIFT;
+}
+
 #ifndef arch_scale_cpu_capacity
 /**
  * arch_scale_cpu_capacity - get the capacity scale factor of a given CPU.
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c3ad70e58b8..45796fccdc84 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -236,8 +236,6 @@ static inline int task_has_dl_policy(struct task_struct *p)
 	return dl_policy(p->policy);
 }
 
-#define cap_scale(v, s)		((v)*(s) >> SCHED_CAPACITY_SHIFT)
-
 static inline void update_avg(u64 *avg, u64 sample)
 {
 	s64 diff = sample - *avg;

base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
-- 
2.55.0


