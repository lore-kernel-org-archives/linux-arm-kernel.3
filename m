Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCF6C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JO1RytCw7CQxlD6804FsBIdj143RrsQgoAnMa93zRJU=; b=Mm6uDSlVjyF/hCyfr4Ybf198Ug
	vDvjLBGmYYvjaAg4lojQz+lgMgRIlxJmPI0mJz6HawjnsDn4y8tinhyB7D/e61aIv/0sZSsvmovAR
	U7D6iZk/P6TdHOTa1AX54Fl7rWo3Ivo7bFpMByTK9Ntt4xb/YDzfn8VXHMMeDiCxY2Af5EoWXzm0P
	sWNRRYZ1g8uNX1+EXUoOumb0Ri3rmladTmWNyAb0oHpos6oaT4EuwqT/o1siHNrweaaxp92d2mIX4
	SJAjXDyuPW6Q2NovT5bN9P7kmHzAAfu6/PkjmhmLVeLhz2LKHcMuu+TcJUaS9DNZmWxu/pnzMLvXZ
	JGgTOxXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9Hl-00000004oxL-00fN;
	Fri, 10 Jul 2026 11:20:49 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9Hi-00000004owP-1a4x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:20:47 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66ABEvsM024946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 10 Jul 2026 20:15:11 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=JO1RytCw7CQxlD6804FsBIdj143RrsQgoAnMa93zRJU=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1783682112; v=1;
        b=Sn1So8LCm6eWjVT03slVIzGiyZKxQj59xS4Rhcvk2+0PpBg1xfn2gXjacJRyu4lJ
         xwOeEmNdZfDO88q38SO9mBsTObZhdMm9DQ0eVjUjybBT0s+1lB/CAtGJtX7HqCSN
         jWxD3PhFxHOYPyz5nwOibOQCmxb4pll3fwekDkMm9ABfdXZXMiWQ0Whesc0OsQGO
         KaAHg6hmZhe1xLzzkjeVY+qM6s6AvmL/68NVxCpwTcxrHzMP41OXErA4Xq+GFV4i
         M7gv16In+ylUzyBTz3dl9jyf28ARCO9dF6WqO2fFkO7yR0RtNs6ELfChYUPYfCZA
         CFymPnJwTvS4XrHRVHITfw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Fri, 10 Jul 2026 20:15:02 +0900
Subject: [PATCH v8 08/11] KVM: arm64: PMU: Pass the target CPU to
 kvm_pmu_probe_armpmu()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-hybrid-v8-8-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
References: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=4094;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=8hhDq85vcHcF/9BQ2Qz8axGKuQb8hlF+J1dMzI4UNmY=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bAFctzlZG1FnqW6+Q/dl6r396ypmleA5Mem9UTBr9rz
 D9qrz/oKGVhEONikBVTZEkp2s2tEV37qTAhvgVmDisTyBAGLk4BmIhXNcP/gLNFnXNNbJUPLN/9
 7m7Fq8bgbaaHBXXlarbsz3T7ZzH3LcN/R3PBwwe0ZvjzuR65cs/j7C6OMJULjfZyLTWWGezX/3x
 lAgA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_042046_642345_7E42EFA4 
X-CRM114-Status: GOOD (  19.02  )
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

kvm_pmu_probe_armpmu() currently samples the current CPU internally,
which ties the helper to default PMU selection.

Move that policy to kvm_arm_set_default_pmu() by passing
raw_smp_processor_id() from the caller, and make the helper search for
the pPMU covering an explicit CPU. Move the helper above
kvm_pmu_create_perf_event() so later code can reuse it when creating
PMU events for a VCPU's current pCPU.

This preserves the existing default PMU selection behavior while
preparing fixed-counters-only mode to select a pPMU at runtime.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/pmu-emul.c | 72 +++++++++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 1d03d0cb62f3..1dd8aa6a027d 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -677,6 +677,23 @@ static int kvm_map_pmu_event(struct arm_pmu *pmu, unsigned int eventsel)
 	return eventsel;
 }
 
+static struct arm_pmu *kvm_pmu_probe_armpmu(int cpu)
+{
+	struct arm_pmu_entry *entry;
+	struct arm_pmu *pmu;
+
+	guard(rcu)();
+
+	list_for_each_entry_rcu(entry, &arm_pmus, entry) {
+		pmu = entry->arm_pmu;
+
+		if (cpumask_test_cpu(cpu, &pmu->supported_cpus))
+			return pmu;
+	}
+
+	return NULL;
+}
+
 /**
  * kvm_pmu_create_perf_event - create a perf event for a counter
  * @pmc: Counter context
@@ -806,42 +823,6 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
 	list_add_tail_rcu(&entry->entry, &arm_pmus);
 }
 
-static struct arm_pmu *kvm_pmu_probe_armpmu(void)
-{
-	struct arm_pmu_entry *entry;
-	struct arm_pmu *pmu;
-	int cpu;
-
-	guard(rcu)();
-
-	/*
-	 * It is safe to use a stale cpu to iterate the list of PMUs so long as
-	 * the same value is used for the entirety of the loop. Given this, and
-	 * the fact that no percpu data is used for the lookup there is no need
-	 * to disable preemption.
-	 *
-	 * It is still necessary to get a valid cpu, though, to probe for the
-	 * default PMU instance as userspace is not required to specify a PMU
-	 * type. In order to uphold the preexisting behavior KVM selects the
-	 * PMU instance for the core during vcpu init. A dependent use
-	 * case would be a user with disdain of all things big.LITTLE that
-	 * affines the VMM to a particular cluster of cores.
-	 *
-	 * In any case, userspace should just do the sane thing and use the UAPI
-	 * to select a PMU type directly. But, be wary of the baggage being
-	 * carried here.
-	 */
-	cpu = raw_smp_processor_id();
-	list_for_each_entry_rcu(entry, &arm_pmus, entry) {
-		pmu = entry->arm_pmu;
-
-		if (cpumask_test_cpu(cpu, &pmu->supported_cpus))
-			return pmu;
-	}
-
-	return NULL;
-}
-
 static u64 __compute_pmceid(struct arm_pmu *pmu, bool pmceid1)
 {
 	u32 hi[2], lo[2];
@@ -1076,7 +1057,24 @@ static void kvm_arm_set_pmu(struct kvm *kvm, struct arm_pmu *arm_pmu)
  */
 int kvm_arm_set_default_pmu(struct kvm *kvm)
 {
-	struct arm_pmu *arm_pmu = kvm_pmu_probe_armpmu();
+	/*
+	 * It is safe to use a stale cpu to iterate the list of PMUs so long as
+	 * the same value is used for the entirety of the loop. Given this, and
+	 * the fact that no percpu data is used for the lookup there is no need
+	 * to disable preemption.
+	 *
+	 * It is still necessary to get a valid cpu, though, to probe for the
+	 * default PMU instance as userspace is not required to specify a PMU
+	 * type. In order to uphold the preexisting behavior KVM selects the
+	 * PMU instance for the core during vcpu init. A dependent use
+	 * case would be a user with disdain of all things big.LITTLE that
+	 * affines the VMM to a particular cluster of cores.
+	 *
+	 * In any case, userspace should just do the sane thing and use the UAPI
+	 * to select a PMU type directly. But, be wary of the baggage being
+	 * carried here.
+	 */
+	struct arm_pmu *arm_pmu = kvm_pmu_probe_armpmu(raw_smp_processor_id());
 
 	if (!arm_pmu)
 		return -ENODEV;

-- 
2.55.0


