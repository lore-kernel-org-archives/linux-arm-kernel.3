Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A221CDDE69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYCk7E6ta+Ey8nwWP/38BvbPODIKMRBP7CdiGiNRmuI=; b=xADocr+pVN80giphilfJnA6bAE
	hhC4mRCdrJyGkO8cPTzgzuOFEzu65DYGNTG0VzNhWZYzuymffQhJw5TjVfVNPLPp8bCgPwsHmkZSD
	EpCOlQerpyQsfvVca9dfshYu8RhVtYtJnMdv8PyG+VfaF5VkDs+K3V4yN7f3HZUw7KmcpG77tySS5
	u00UvQPbadLSdNDvvZzTdOYMG+WP81p0KiNpPIQjwGtus8izjXyGd/vW606L6vKOHNqoqShZKRsx0
	nhP/aUl2oCiEYNZp7fsghytI91S4WEHxR1dgiDtuOBVUFa1Un/8wbYTHEHqR6K1SYf7aTfBGL/xcv
	SDdlZf6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uc7-0000000Ha7h-1gil;
	Thu, 24 Oct 2024 09:58:43 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uKq-0000000HVv1-115N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:40:54 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XZ17m3dHfz6K61T;
	Thu, 24 Oct 2024 17:38:44 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5851F1406AD;
	Thu, 24 Oct 2024 17:40:50 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 11:40:43 +0200
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <kvmarm@lists.linux.dev>, <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<cohuck@redhat.com>, <eric.auger@redhat.com>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
	<jonathan.cameron@huawei.com>, <anthony.jebson@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>
Subject: [RFC PATCH v2 2/3] KVM: arm64: Use hypercall to retrieve any migration targets
Date: Thu, 24 Oct 2024 10:40:11 +0100
Message-ID: <20241024094012.29452-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20241024094012.29452-1-shameerali.kolothum.thodi@huawei.com>
References: <20241024094012.29452-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_024052_600694_8AD70B57 
X-CRM114-Status: GOOD (  16.45  )
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

Provides a paravirt helper function to retrieve any migration target
CPUs if available and store it. This will be used in subsequent patch
to enable any errata associated with those targets

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
ToDo:
Not sure it make sense to use kvm_arm_hyp_service_available() here
as these hypercalls will be handled by userspace VMM.

---
 arch/arm64/include/asm/cpufeature.h |  7 +++++
 arch/arm64/include/asm/paravirt.h   |  3 ++
 arch/arm64/kernel/cpu_errata.c      |  3 ++
 arch/arm64/kernel/paravirt.c        | 48 +++++++++++++++++++++++++++++
 4 files changed, 61 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 985d966787b1..6623f47814bc 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -386,6 +386,13 @@ struct arm64_cpu_capabilities {
 	const struct cpumask *cpus;
 };
 
+#define MIGRN_TARGET_CPUS_HYP_CALL_VER_1	1
+#define MAX_MIGRN_TARGET_CPUS			64
+struct migrn_target {
+	u32 midr;
+	u32 revidr;
+};
+
 static inline int cpucap_default_scope(const struct arm64_cpu_capabilities *cap)
 {
 	return cap->type & ARM64_CPUCAP_SCOPE_MASK;
diff --git a/arch/arm64/include/asm/paravirt.h b/arch/arm64/include/asm/paravirt.h
index 9aa193e0e8f2..19cd97dafbbc 100644
--- a/arch/arm64/include/asm/paravirt.h
+++ b/arch/arm64/include/asm/paravirt.h
@@ -19,11 +19,14 @@ static inline u64 paravirt_steal_clock(int cpu)
 }
 
 int __init pv_time_init(void);
+void __init pv_errata_migrn_target_init(void);
 
 #else
 
 #define pv_time_init() do {} while (0)
 
+#define pv_errata_migrn_target_init() do {} while (0)
+
 #endif // CONFIG_PARAVIRT
 
 #endif
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index dfefbdf4073a..feaaf2b11f46 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -14,6 +14,9 @@
 #include <asm/kvm_asm.h>
 #include <asm/smp_plat.h>
 
+u32 __ro_after_init errata_migrn_target_num;
+struct migrn_target __ro_after_init errata_migrn_target_cpus[MAX_MIGRN_TARGET_CPUS];
+
 static bool __maybe_unused
 is_affected_midr_range(const struct arm64_cpu_capabilities *entry, int scope)
 {
diff --git a/arch/arm64/kernel/paravirt.c b/arch/arm64/kernel/paravirt.c
index aa718d6a9274..675424258419 100644
--- a/arch/arm64/kernel/paravirt.c
+++ b/arch/arm64/kernel/paravirt.c
@@ -153,6 +153,54 @@ static bool __init has_pv_steal_clock(void)
 	return (res.a0 == SMCCC_RET_SUCCESS);
 }
 
+extern struct migrn_target __ro_after_init errata_migrn_target_cpus[];
+extern u32 __ro_after_init errata_migrn_target_num;
+void  __init pv_errata_migrn_target_init(void)
+{
+	u32 target_num;
+	struct arm_smccc_res res;
+	u32 curr = 0;
+
+	/* Check we have already set errata targets */
+	if (errata_migrn_target_num)
+		return;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_NUM_FUNC_ID, &res);
+	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
+		return;
+
+	target_num = lower_32_bits(res.a0);
+	if (!target_num || target_num > MAX_MIGRN_TARGET_CPUS ||
+	    upper_32_bits(res.a0) != MIGRN_TARGET_CPUS_HYP_CALL_VER_1)
+		return;
+
+	while (curr < target_num) {
+		unsigned long *ptr;
+		int j;
+
+		arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_CPUS_FUNC_ID, &res);
+		if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
+			break;
+
+		ptr = (unsigned long *)&res;
+		for (j = 0; j < 4; j++, ptr++) {
+			if (!(*ptr))
+				goto out;
+			errata_migrn_target_cpus[curr].midr = lower_32_bits(*ptr);
+			errata_migrn_target_cpus[curr].revidr = upper_32_bits(*ptr);
+			curr++;
+		}
+	}
+out:
+	if (curr != target_num) {
+		pr_warn("Failed to retrieve all migration target CPUs\n");
+		return;
+	}
+
+	errata_migrn_target_num = target_num;
+	pr_info("Migration target CPUs set to %d\n", target_num);
+}
+
 int __init pv_time_init(void)
 {
 	int ret;
-- 
2.45.2


