Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BF3CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KI069RBnL/iLpjQNmwGOrF7XUz9O+JaN3/9K4v8CLNc=; b=zyNjuJ6CNHz3TLl87ahEuw9HzU
	8tqkcp0HrRlcR3tk8HILwwsFKOUHE/v+ms2M6KVu9lpigeO4VmKrP0JADVZpgBQjClDt33aoBC1dV
	Vfvzv3g7QWfZcqxSGi+VenVk9mdaSmZ1wWqoKjVZLbJxYKMFEe4LuA/xkQt+eKNKHqQ+yY7QyznrT
	Z+bfBLc4fHIhRC2klq1ycLzD+MfjtHBY+AUq4FGWDFpsjPZ1Ye+gJFQgTvgM0ecA+rw286L/FUgKh
	93KBG7hnz4kQOJdtHjt58UUnU6Z/7OZta3BWQkW2vsnyMK7tzq28ZculhTH5g5aWt3wXtW/Lm5h69
	Kqo9lZ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0uc-00000006AgR-1kvX;
	Tue, 09 Jun 2026 18:10:54 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0uY-00000006AeV-3fgC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:10:53 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7BEEE20B7168;
	Tue,  9 Jun 2026 11:10:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7BEEE20B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1781028632;
	bh=KI069RBnL/iLpjQNmwGOrF7XUz9O+JaN3/9K4v8CLNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e5J64Wa6hJ9DNZkCEcNuQZvMgRlsTx4zQmbL1+pODyn2Q9XkM8CSdCKEGJdQDw+IL
	 1amN2VZTQFRryC50weiL0IGCdkNA76FPN7KMD/6ppQLxwZcZn9j89edEjOWG8DTF/9
	 HalUfEy5ORrlehvRhwVM2WRtUEMEqr+usyt8QfwQ=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	arnd@arndb.de,
	thuth@redhat.com,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	mhklinux@outlook.com
Subject: [RFC PATCH 3/6] arm64: hyperv: Add per-CPU RSI host call infrastructure for CCA Realms
Date: Tue,  9 Jun 2026 11:10:27 -0700
Message-ID: <20260609181030.2378391-4-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260609181030.2378391-1-kameroncarr@linux.microsoft.com>
References: <20260609181030.2378391-1-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_111050_967942_466B71E7 
X-CRM114-Status: GOOD (  18.79  )
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

Arm CCA Realms cannot issue Hyper-V hypercalls via HVC; the guest must
route them through the RSI_HOST_CALL interface, which takes the IPA of a
per-CPU rsi_host_call structure as its argument.

Add hyperv_pcpu_hostcall_struct as a per-CPU pointer to that buffer and
allocate it for the boot CPU during hyperv_init() and for each secondary
CPU in hv_cpu_init(). The allocation is gated on is_realm_world() so
non-Realm arm64 Hyper-V guests pay no memory cost.

Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c      | 78 ++++++++++++++++++++++++++++++-
 arch/arm64/include/asm/mshyperv.h |  3 ++
 2 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 4fdc26ade1d74..08fec82691683 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -15,10 +15,16 @@
 #include <linux/errno.h>
 #include <linux/version.h>
 #include <linux/cpuhotplug.h>
+#include <linux/slab.h>
+#include <linux/percpu.h>
 #include <asm/mshyperv.h>
+#include <asm/rsi.h>
 
 static bool hyperv_initialized;
 
+void * __percpu *hyperv_pcpu_hostcall_struct;
+EXPORT_SYMBOL_GPL(hyperv_pcpu_hostcall_struct);
+
 int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
 {
 	hv_get_vpreg_128(HV_REGISTER_HYPERVISOR_VERSION,
@@ -60,6 +66,46 @@ static bool __init hyperv_detect_via_acpi(void)
 
 #endif
 
+static void hv_hostcall_free(void)
+{
+	int cpu;
+
+	if (!hyperv_pcpu_hostcall_struct)
+		return;
+
+	for_each_possible_cpu(cpu)
+		kfree(*per_cpu_ptr(hyperv_pcpu_hostcall_struct, cpu));
+	free_percpu(hyperv_pcpu_hostcall_struct);
+	hyperv_pcpu_hostcall_struct = NULL;
+}
+
+static int hv_cpu_init(unsigned int cpu)
+{
+	void **hostcall_struct;
+	gfp_t flags;
+	void *mem;
+
+	if (hyperv_pcpu_hostcall_struct) {
+		/* hv_cpu_init() can be called with IRQs disabled from hv_resume() */
+		flags = irqs_disabled() ? GFP_ATOMIC : GFP_KERNEL;
+
+		hostcall_struct = (void **)this_cpu_ptr(hyperv_pcpu_hostcall_struct);
+		/*
+		 * The hostcall_struct memory is not freed when the CPU
+		 * goes offline. If a previously offlined CPU is brought
+		 * back online, the memory is reused here.
+		 */
+		if (!*hostcall_struct) {
+			mem = kzalloc_obj(struct rsi_host_call, flags);
+			if (!mem)
+				return -ENOMEM;
+			*hostcall_struct = mem;
+		}
+	}
+
+	return hv_common_cpu_init(cpu);
+}
+
 static bool __init hyperv_detect_via_smccc(void)
 {
 	uuid_t hyperv_uuid = UUID_INIT(
@@ -73,6 +119,8 @@ static bool __init hyperv_detect_via_smccc(void)
 static int __init hyperv_init(void)
 {
 	struct hv_get_vp_registers_output	result;
+	void **hostcall_struct;
+	void *mem;
 	u64	guest_id;
 	int	ret;
 
@@ -85,6 +133,27 @@ static int __init hyperv_init(void)
 	if (!hyperv_detect_via_acpi() && !hyperv_detect_via_smccc())
 		return 0;
 
+	/*
+	 * The RSI host-call buffer is only ever used when
+	 * is_realm_world() is true. Skip the per-CPU allocation on
+	 * non-Realm guests.
+	 */
+	if (is_realm_world()) {
+		hyperv_pcpu_hostcall_struct = alloc_percpu(void *);
+		if (!hyperv_pcpu_hostcall_struct)
+			return -ENOMEM;
+
+		hostcall_struct = (void **)this_cpu_ptr(hyperv_pcpu_hostcall_struct);
+		if (!*hostcall_struct) {
+			mem = kzalloc_obj(struct rsi_host_call);
+			if (!mem) {
+				ret = -ENOMEM;
+				goto free_hostcall_mem;
+			}
+			*hostcall_struct = mem;
+		}
+	}
+
 	/* Setup the guest ID */
 	guest_id = hv_generate_guest_id(LINUX_VERSION_CODE);
 	hv_set_vpreg(HV_REGISTER_GUEST_OS_ID, guest_id);
@@ -106,12 +175,13 @@ static int __init hyperv_init(void)
 
 	ret = hv_common_init();
 	if (ret)
-		return ret;
+		goto free_hostcall_mem;
 
 	ret = cpuhp_setup_state(CPUHP_AP_HYPERV_ONLINE, "arm64/hyperv_init:online",
-				hv_common_cpu_init, hv_common_cpu_die);
+				hv_cpu_init, hv_common_cpu_die);
 	if (ret < 0) {
 		hv_common_free();
+		hv_hostcall_free();
 		return ret;
 	}
 
@@ -125,6 +195,10 @@ static int __init hyperv_init(void)
 
 	hyperv_initialized = true;
 	return 0;
+
+free_hostcall_mem:
+	hv_hostcall_free();
+	return ret;
 }
 
 early_initcall(hyperv_init);
diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
index b721d3134ab66..65a00bd14c6cb 100644
--- a/arch/arm64/include/asm/mshyperv.h
+++ b/arch/arm64/include/asm/mshyperv.h
@@ -63,4 +63,7 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
 
 #include <asm-generic/mshyperv.h>
 
+/* Per-CPU RSI host call structure for CCA Realms */
+extern void *__percpu *hyperv_pcpu_hostcall_struct;
+
 #endif
-- 
2.45.4


