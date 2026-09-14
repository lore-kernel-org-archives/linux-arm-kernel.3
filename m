Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25A7C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhJEZVTmWCutK8CuRal+hlp6EWxxjoBec/bFsRo0Q40=; b=BFe78VKVacGMqPPqdsDLmeLCUE
	uTCj6ukCPoLieYBcMc6eeIgSUEyASes+vBUug1sv7v+m5LvnfTF1ROeqz6WwDqh+gIAKpYoGas5V0
	Eayrg3Y9JlHHd3Za95EpmHbfTCAbtfVUXBVNdyoFrdmHHpAdaxCgH7KdFFxkhNQx/H3J/LB04QjLz
	j8DADQpAJ7gBAPkB0qznKsVobFO18fIs24OzQAQ0vR43JlziZQCwT1GUVd5M8IZzoKWD1cJPikJ35
	3U86Nnq0GvmGIt+KXuygpMP5Gt4tLk4oZr3ECKwxb9uD4HwGPbV3ewE4UN19qOjnKkm9uvBsQRpnH
	3jr9viUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x655K-00000003LTF-39b4;
	Mon, 14 Sep 2026 11:42:54 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6550-00000003LCW-0LH8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:42:40 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68EBfjsH084060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 14 Sep 2026 20:41:56 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=GhJEZVTmWCutK8CuRal+hlp6EWxxjoBec/bFsRo0Q40=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789386116; v=1;
        b=fK3380i3yvyBX4O6d7ka3wD0/OEKqOKddLIQLwwEuCKnupoV+2EQmTgYEzbhI33g
         HpyehYGQ6/UsujL19E/KvhqV8v61kmwb3Y/fCU6PJCXtrMWf9bkhQTsY8yp3jTq/
         13G4GWD8c8no9Pkj1WXDxk+sHqjuhpsjWmZdLWTZXF0kI+KcceOwlU/iNGpQP3QI
         GAI1XFDDZpJOScOMfVQA8COrnkqVXtqp2fzcVGFuloBQnPJssUqkCuK3en1+dDzz
         WxzYsq0pOETbGTHCMmzMfFdpjMzELnNdfHixZU20qIiIuk2+SwRa1kD1hUATLUEf
         Y+Z6vcteH8rwD/49rYiC6w==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 14 Sep 2026 20:40:54 +0900
Subject: [PATCH v10 15/20] KVM: arm64: PMU: Protect the list of PMUs with
 RCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-hybrid-v10-15-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
References: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
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
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Andrew Jones <drjones@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
        Fuad Tabba <fuad.tabba@linux.dev>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2743;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=pedYvIkMPkw2UKgQ2Eo+uCCbPTSI7IGTLXtxt7GZPGY=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9byu6VrXiVeD4gJvblHj99i2/ZNuSbCB99FLZT/zPk1r
 3YdN4deRykLgxgXg6yYIktK0W5ujejaT4UJ8S0wc1iZQIYwcHEKwER+HWf4pyLBIR6l+m7XjMnv
 uLKrp4bIJextV3p5T0dhWdnrbVFtdxj+cOg+0J07YUdNqXhV0WerSY+fu/qF3F46+8DEswqOnob
 VTAA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_044234_827039_67033819 
X-CRM114-Status: GOOD (  13.22  )
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

Convert the list of PMUs to a RCU-protected list that has primitives to
avoid read-side contention.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index e24ad6c72937..94bc69727c9f 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -7,9 +7,9 @@
 #include <linux/cpu.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
-#include <linux/list.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmu.h>
+#include <linux/rculist.h>
 #include <linux/uaccess.h>
 #include <asm/kvm_emulate.h>
 #include <kvm/arm_pmu.h>
@@ -17,6 +17,10 @@
 
 #define PERF_ATTR_CFG1_COUNTER_64BIT	BIT(0)
 
+/*
+ * arm_pmus is append-only. kvm_supports_guest_pmuv3() feeds persistent
+ * VM state, so a true result must remain valid after the check.
+ */
 static LIST_HEAD(arm_pmus);
 static DEFINE_MUTEX(arm_pmus_lock);
 
@@ -26,7 +30,6 @@ static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc);
 
 bool kvm_supports_guest_pmuv3(void)
 {
-	guard(mutex)(&arm_pmus_lock);
 	return !list_empty(&arm_pmus);
 }
 
@@ -819,7 +822,7 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
 		return;
 
 	entry->arm_pmu = pmu;
-	list_add_tail(&entry->entry, &arm_pmus);
+	list_add_tail_rcu(&entry->entry, &arm_pmus);
 }
 
 static struct arm_pmu *kvm_pmu_probe_armpmu(void)
@@ -828,7 +831,7 @@ static struct arm_pmu *kvm_pmu_probe_armpmu(void)
 	struct arm_pmu *pmu;
 	int cpu;
 
-	guard(mutex)(&arm_pmus_lock);
+	guard(rcu)();
 
 	/*
 	 * It is safe to use a stale cpu to iterate the list of PMUs so long as
@@ -848,7 +851,7 @@ static struct arm_pmu *kvm_pmu_probe_armpmu(void)
 	 * carried here.
 	 */
 	cpu = raw_smp_processor_id();
-	list_for_each_entry(entry, &arm_pmus, entry) {
+	list_for_each_entry_rcu(entry, &arm_pmus, entry) {
 		pmu = entry->arm_pmu;
 
 		if (cpumask_test_cpu(cpu, &pmu->supported_cpus))
@@ -1114,9 +1117,9 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
 	int ret = -ENXIO;
 
 	lockdep_assert_held(&kvm->arch.config_lock);
-	mutex_lock(&arm_pmus_lock);
+	guard(rcu)();
 
-	list_for_each_entry(entry, &arm_pmus, entry) {
+	list_for_each_entry_rcu(entry, &arm_pmus, entry) {
 		arm_pmu = entry->arm_pmu;
 		if (arm_pmu->pmu.type == pmu_id) {
 			if (kvm_vm_has_ran_once(kvm) ||
@@ -1143,7 +1146,6 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
 		}
 	}
 
-	mutex_unlock(&arm_pmus_lock);
 	return ret;
 }
 

-- 
2.55.0


