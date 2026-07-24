Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9186C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjK8+/M5a5LG6q8ss8TkNXU/GsjIibwk6x/XF5COBgQ=; b=vYHvk4beMTbnO+DeShw1ml2wUb
	PgnscODSlp0xFJERdJjr7i3PhzSlVNu+Q2S3W8hZgdWQsBw2JkIOg7xrPKw86Bl/2zBNuc8zZUKkd
	ADdggzXuZL4i8vf1CdZp2TyOhxAUtwkcCYWeJVFodbikZIO9WLA+RlWgD8KSpq8NdIMB+c73GIMkU
	34y/oxfefJ1oM9S8YKXqMYTWvH9ldN2CsVOs66UtWkwO5fGEu7CsYtHWOe3NOFL1x2PBq6sbVuqXo
	wODr8YUxc/IIm8Pqbst4KHR4ZpPwD0HL/UJzbL9qjmpx53DxRHFcGUx5JoKVCFV+LyNyoC3MPkG3s
	1oSD0/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCPm-0000000FzP9-19kC;
	Fri, 24 Jul 2026 09:41:58 +0000
Received: from esa9.hc1455-7.c3s2.iphmx.com ([139.138.36.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCPk-0000000FzNs-2AzZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784886116; x=1816422116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RNkuio2LL2Nc30zjeKwe+1C7Rs23SB5prtaVUYCMtMo=;
  b=qrfjCPFGWdkTgCjUaPAKiOZaqH+kgevxuM0HnVJ/PHs72Sqanaoluvc0
   ibBqN/WYYhQTzWazKTPx3JIv3E7AIf37iNSsPx+UOIOhei54rUM3cMJ1O
   y6JSrpD6C83dU9ljw+dfIsdOQ1tKjFifgMmYhKRSRX5h9MGAQshMzbYmk
   +Tb03L4/Du2FY8/Ea/M/AQHPx34ay3ET3WdfhuCyLVeDOy4+aGrDaCJV9
   iIrggON1Lv7tp+Di2tQ8RA2bl+K62lDtDXQDXdctCKH6rOlUbgauukyY5
   kCjqAsto9HcQzpPkwAYeecRFufyNAOG/OJFNDohWyS2Wzy44TYpwe1ahW
   A==;
X-CSE-ConnectionGUID: zjhgHs3IRk6JIzyLyh2LHg==
X-CSE-MsgGUID: xORaa3PeR6GuysJPlaNBWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="235922322"
X-IronPort-AV: E=Sophos;i="6.25,182,1779116400"; 
   d="scan'208";a="235922322"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 18:41:54 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 748AEC0180A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:41:54 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 2B40B149CEED
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:41:54 +0000 (UTC)
Received: from sm-arm-grace07.ssoft.mng.com (unknown [10.124.178.20])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 7801A405AB7;
	Fri, 24 Jul 2026 09:41:48 +0000 (UTC)
From: Kohei Enju <enju.kohei@fujitsu.com>
To: linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	cgroups@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Steven Price <steven.price@arm.com>,
	Kohei Enju <enju.kohei@fujitsu.com>
Subject: [RFC PATCH v1 2/2] cgroup/misc: Add support for Arm CCA MECIDs
Date: Fri, 24 Jul 2026 18:40:56 +0900
Message-ID: <20260724094120.166536-3-enju.kohei@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724094120.166536-1-enju.kohei@fujitsu.com>
References: <20260724094120.166536-1-enju.kohei@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_024156_861369_65BA443A 
X-CRM114-Status: GOOD (  22.32  )
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

Arm CCA MECIDs are limited platform resources. Add a misc cgroup
resource to allow the system administrator to account for and limit
their use.

The cca_mec resource represents the number of Realm VMs using the
private MEC policy. Each such Realm consumes one MECID. Charge the
resource when the Realm is created, and uncharge it when the Realm is
successfully destroyed.

Realms using the shared MEC policy don't consume this resource.

Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
 arch/arm64/include/asm/kvm_rmi.h |  2 ++
 arch/arm64/kvm/rmi.c             | 44 +++++++++++++++++++++++++++++++-
 drivers/firmware/arm_rmm/rmi.c   |  4 +++
 include/linux/misc_cgroup.h      |  4 +++
 kernel/cgroup/misc.c             |  4 +++
 5 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index 721033b132e1..182bdd22014f 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -61,6 +61,7 @@ enum realm_state {
  * @stage2_unmapped: The Realm stage-2 mappings have been removed
  * @rtts_destroyed: The non-root RTTs have been torn down
  * @mec_policy: MEC policy for the Realm VM
+ * @misc_cg: Misc cgroup charged while the Realm owns a private MECID
  */
 struct realm {
 	void *rd;
@@ -78,6 +79,7 @@ struct realm {
 	bool stage2_unmapped;
 	bool rtts_destroyed;
 	unsigned int mec_policy;
+	struct misc_cg *misc_cg;
 };
 
 /**
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 629dea5e8c47..505fa80f635d 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -5,6 +5,7 @@
 
 #include <uapi/linux/psci.h>
 #include <linux/kvm_host.h>
+#include <linux/misc_cgroup.h>
 
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_mmu.h>
@@ -525,6 +526,36 @@ static int realm_init_sve_param(struct kvm *kvm, struct realm_params *params)
 	return 0;
 }
 
+static int realm_mec_charge(struct realm *realm)
+{
+	struct misc_cg *misc_cg;
+	int ret;
+
+	if (realm->mec_policy != ARM_RMI_MEC_POLICY_PRIVATE)
+		return 0;
+
+	misc_cg = get_current_misc_cg();
+
+	ret = misc_cg_try_charge(MISC_CG_RES_CCA_MEC, misc_cg, 1);
+	if (ret) {
+		put_misc_cg(misc_cg);
+		return ret;
+	}
+
+	realm->misc_cg = misc_cg;
+	return 0;
+}
+
+static void realm_mec_uncharge(struct realm *realm)
+{
+	if (!realm->misc_cg)
+		return;
+
+	misc_cg_uncharge(MISC_CG_RES_CCA_MEC, realm->misc_cg, 1);
+	put_misc_cg(realm->misc_cg);
+	realm->misc_cg = NULL;
+}
+
 static int realm_create_rd(struct kvm *kvm)
 {
 	struct realm *realm = &kvm->arch.realm;
@@ -579,11 +610,15 @@ static int realm_create_rd(struct kvm *kvm)
 	if (r)
 		goto out_undelegate_tables;
 
+	r = realm_mec_charge(realm);
+	if (r)
+		goto out_undelegate_tables;
+
 	params_phys = virt_to_phys(params);
 
 	if (rmi_realm_create(rd_phys, params_phys, realm->sro)) {
 		r = -ENXIO;
-		goto out_undelegate_tables;
+		goto out_uncharge_misc_cg;
 	}
 
 	realm->rd = rd;
@@ -594,6 +629,8 @@ static int realm_create_rd(struct kvm *kvm)
 
 	return 0;
 
+out_uncharge_misc_cg:
+	realm_mec_uncharge(realm);
 out_undelegate_tables:
 	if (WARN_ON(rmi_undelegate_range(kvm->arch.mmu.pgd_phys, top_delegated - kvm->arch.mmu.pgd_phys))) {
 		/* Leak the pages if they cannot be returned */
@@ -1478,10 +1515,15 @@ void kvm_destroy_realm(struct kvm *kvm)
 		if (WARN_ON(realm_destroy_rtts(kvm)))
 			return;
 
+		/*
+		 * Keep the misc cgroup charge if RMI_REALM_DESTROY fails, as
+		 * the corresponding MECID may still be allocated by the RMM.
+		 */
 		if (WARN_ON(rmi_realm_destroy(rd_phys, realm->sro)))
 			return;
 		free_delegated_page(rd_phys);
 		realm->rd = NULL;
+		realm_mec_uncharge(realm);
 	}
 
 	if (WARN_ON(rmi_undelegate_range(kvm->arch.mmu.pgd_phys,
diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
index e9632c35e7db..85a7e6686d2b 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -6,6 +6,7 @@
 #include <linux/cpufeature.h>
 #include <linux/memblock.h>
 #include <linux/arm-rmi-cmds.h>
+#include <linux/misc_cgroup.h>
 #include <linux/processor.h>
 #include <linux/slab.h>
 
@@ -714,6 +715,9 @@ static int __init arm64_init_rmi(void)
 	if (ret)
 		return ret;
 
+	WARN_ON_ONCE(misc_cg_set_capacity(MISC_CG_RES_CCA_MEC,
+					  rmi_mec_count()));
+
 	arm64_rmi_is_available = true;
 	pr_info("RMI configured");
 
diff --git a/include/linux/misc_cgroup.h b/include/linux/misc_cgroup.h
index 0cb36a3ffc47..b542502dc52a 100644
--- a/include/linux/misc_cgroup.h
+++ b/include/linux/misc_cgroup.h
@@ -21,6 +21,10 @@ enum misc_res_type {
 #ifdef CONFIG_INTEL_TDX_HOST
 	/** @MISC_CG_RES_TDX: Intel TDX HKIDs resource */
 	MISC_CG_RES_TDX,
+#endif
+#ifdef CONFIG_ARM_RMM
+	/** @MISC_CG_RES_CCA_MEC: ARM64 CCA MECIDs resource */
+	MISC_CG_RES_CCA_MEC,
 #endif
 	/** @MISC_CG_RES_TYPES: count of enum misc_res_type constants */
 	MISC_CG_RES_TYPES
diff --git a/kernel/cgroup/misc.c b/kernel/cgroup/misc.c
index 4a9e2557141c..69259085115e 100644
--- a/kernel/cgroup/misc.c
+++ b/kernel/cgroup/misc.c
@@ -28,6 +28,10 @@ static const char *const misc_res_name[] = {
 	/* Intel TDX HKIDs resource */
 	"tdx",
 #endif
+#ifdef CONFIG_ARM_RMM
+	/* ARM64 CCA MECIDs resource */
+	"cca_mec",
+#endif
 };
 
 /* Root misc cgroup */
-- 
2.43.0


