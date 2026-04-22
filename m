Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B19FA1FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egKNUk+o6leNMkUH3LEOMaBF3fJ8B8TleprU4ZCwKnI=; b=tG9ugX+A2ffSzPWV1WY0bzNjhr
	zNOAyMkmj7B+PgDdvjQ3sswJtqlh9KeNJx8nRw+uPMeyk+g6CTsxpRnA3PXeCNE5EJHebGVUs25f/
	A4M4VhQrzdvn4auONlme2vH2036fcPhNFzbvY9sMHcniM3STAfeuoZ0U9b9OtuivQeb9z+8PJxp9r
	mPneP+s1/lLLx7bUtp9iHtdN10GYEIXPfiU9EXA0shyVStk+qYjvoV0tMEXqpzPZcV0TTielBq8Ef
	YVBNgb0Ym9rvzENmhEjw9i1XcoCuWwwHrW5NmlYh/QY9FsRC7CwVNfqtmDK00P6a9TJCkMzOtnhkv
	0e7tH27Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaO5-0000000AVZA-1yo6;
	Wed, 22 Apr 2026 16:25:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaO0-0000000AVVx-3qw1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 16:25:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFD451F60;
	Wed, 22 Apr 2026 09:25:05 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 013153F23F;
	Wed, 22 Apr 2026 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776875111; bh=p1P7064kmMhgtlws9zeKxghPUZ98VVQ0ak9x2NaDMiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aShFwVrmZpdGHDbrtBCooNTPHj2wzfDofoUxl3PVFgAvGLILf1AL/qfoUTgkVUS/3
	 Sa5iE0yFEkxX9Z5zOa2b92Zk0qehhexuvETMwxq/Y5j5U9wFzgxT7vC38/h6AMGphu
	 i8JcqFGf87kMebzHfHTzFKvxM2soY9SlxlxudMoE=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	zohar@linux.ibm.com,
	roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	jarkko@kernel.org,
	jgg@ziepe.ca,
	sudeep.holla@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	noodles@meta.com,
	sebastianene@google.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH v2 4/4] firmware: arm_ffa: check pkvm initailised when initailise ffa driver
Date: Wed, 22 Apr 2026 17:24:49 +0100
Message-Id: <20260422162449.1814615-5-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422162449.1814615-1-yeoreum.yun@arm.com>
References: <20260422162449.1814615-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_092513_043210_331E6E5B 
X-CRM114-Status: GOOD (  17.19  )
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

When pKVM is enabled, the FF-A driver must be initialized after pKVM.
Otherwise, pKVM cannot negotiate the FF-A version or
obtain RX/TX buffer information, leading to failures in FF-A calls.

During FF-A driver initialization, check whether pKVM has been initialized.
If pKVM isn't initailised, register notifier and do initialisation
of FF-A driver when pKVM is initialized.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/virt.h     | 11 ++++++++++
 arch/arm64/kvm/arm.c              | 21 ++++++++++++++++++
 arch/arm64/kvm/pkvm.c             |  2 ++
 drivers/firmware/arm_ffa/common.h |  4 ++--
 drivers/firmware/arm_ffa/driver.c | 36 ++++++++++++++++++++++++++++++-
 drivers/firmware/arm_ffa/smccc.c  |  2 +-
 6 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
index b51ab6840f9c..ad038a3b8727 100644
--- a/arch/arm64/include/asm/virt.h
+++ b/arch/arm64/include/asm/virt.h
@@ -68,6 +68,8 @@
 #include <asm/sysreg.h>
 #include <asm/cpufeature.h>

+struct notifier_block;
+
 /*
  * __boot_cpu_mode records what mode CPUs were booted in.
  * A correctly-implemented bootloader must start all CPUs in the same mode:
@@ -166,6 +168,15 @@ static inline bool is_hyp_nvhe(void)
 	return is_hyp_mode_available() && !is_kernel_in_hyp_mode();
 }

+enum kvm_arm_event {
+	PKVM_INITIALISED,
+	KVM_ARM_EVENT_MAX,
+};
+
+extern int kvm_arm_event_notifier_call_chain(enum kvm_arm_event event, void *data);
+extern int kvm_arm_event_notifier_register(struct notifier_block *nb);
+extern int kvm_arm_event_notifier_unregister(struct notifier_block *nb);
+
 #endif /* __ASSEMBLER__ */

 #endif /* ! __ASM__VIRT_H */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 410ffd41fd73..8da10049ab65 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -14,6 +14,7 @@
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/mman.h>
+#include <linux/notifier.h>
 #include <linux/sched.h>
 #include <linux/kvm.h>
 #include <linux/kvm_irqfd.h>
@@ -111,6 +112,8 @@ DECLARE_KVM_NVHE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);

 DECLARE_KVM_NVHE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);

+BLOCKING_NOTIFIER_HEAD(kvm_arm_event_notifier_head);
+
 static bool vgic_present, kvm_arm_initialised;

 static DEFINE_PER_CPU(unsigned char, kvm_hyp_initialized);
@@ -3064,4 +3067,22 @@ enum kvm_mode kvm_get_mode(void)
 	return kvm_mode;
 }

+int kvm_arm_event_notifier_call_chain(enum kvm_arm_event event, void *data)
+{
+	return blocking_notifier_call_chain(&kvm_arm_event_notifier_head,
+					    event, data);
+}
+
+int kvm_arm_event_notifier_register(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&kvm_arm_event_notifier_head, nb);
+}
+EXPORT_SYMBOL_GPL(kvm_arm_event_notifier_register);
+
+int kvm_arm_event_notifier_unregister(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&kvm_arm_event_notifier_head, nb);
+}
+EXPORT_SYMBOL_GPL(kvm_arm_event_notifier_unregister);
+
 module_init(kvm_arm_init);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index d7a0f69a9982..e76562b0a45a 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -280,6 +280,8 @@ static int __init finalize_pkvm(void)
 	ret = pkvm_drop_host_privileges();
 	if (ret)
 		pr_err("Failed to finalize Hyp protection: %d\n", ret);
+	else
+		kvm_arm_event_notifier_call_chain(PKVM_INITIALISED, NULL);

 	return ret;
 }
diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm_ffa/common.h
index 9c6425a81d0d..5cdf4bd222c6 100644
--- a/drivers/firmware/arm_ffa/common.h
+++ b/drivers/firmware/arm_ffa/common.h
@@ -18,9 +18,9 @@ bool ffa_device_is_valid(struct ffa_device *ffa_dev);
 void ffa_device_match_uuid(struct ffa_device *ffa_dev, const uuid_t *uuid);

 #ifdef CONFIG_ARM_FFA_SMCCC
-int __init ffa_transport_init(ffa_fn **invoke_ffa_fn);
+int ffa_transport_init(ffa_fn **invoke_ffa_fn);
 #else
-static inline int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
+static inline int ffa_transport_init(ffa_fn **invoke_ffa_fn)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 02c76ac1570b..67df053e65b8 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -35,6 +35,7 @@
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/notifier.h>
 #include <linux/of_irq.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
@@ -42,6 +43,8 @@
 #include <linux/uuid.h>
 #include <linux/xarray.h>

+#include <asm/virt.h>
+
 #include "common.h"

 #define FFA_DRIVER_VERSION	FFA_VERSION_1_2
@@ -2029,7 +2032,7 @@ static void ffa_notifications_setup(void)
 	ffa_notifications_cleanup();
 }

-static int __init ffa_init(void)
+static int __ffa_init(void)
 {
 	int ret;
 	u32 buf_sz;
@@ -2105,11 +2108,42 @@ static int __init ffa_init(void)
 free_drv_info:
 	kfree(drv_info);
 	return ret;
+
+}
+
+static int ffa_kvm_arm_event_handler(struct notifier_block *nb,
+				     unsigned long event, void *unused)
+{
+	if (event == PKVM_INITIALISED)
+		__ffa_init();
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block ffa_kvm_arm_event_notifier = {
+	.notifier_call = ffa_kvm_arm_event_handler,
+};
+
+static int __init ffa_init(void)
+{
+	/*
+	 * When pKVM is enabled, the FF-A driver must be initialized
+	 * after pKVM initialization. Otherwise, pKVM cannot negotiate
+	 * the FF-A version or obtain RX/TX buffer information,
+	 * which leads to failures in FF-A calls.
+	 */
+	if (IS_ENABLED(CONFIG_KVM) && is_protected_kvm_enabled() &&
+	    !is_pkvm_initialized())
+		return kvm_arm_event_notifier_register(&ffa_kvm_arm_event_notifier);
+
+	return __ffa_init();
 }
 device_initcall(ffa_init);

 static void __exit ffa_exit(void)
 {
+	if (IS_ENABLED(CONFIG_KVM))
+		kvm_arm_event_notifier_unregister(&ffa_kvm_arm_event_notifier);
 	ffa_notifications_cleanup();
 	ffa_partitions_cleanup();
 	ffa_rxtx_unmap();
diff --git a/drivers/firmware/arm_ffa/smccc.c b/drivers/firmware/arm_ffa/smccc.c
index 4d85bfff0a4e..e6125dd9f58f 100644
--- a/drivers/firmware/arm_ffa/smccc.c
+++ b/drivers/firmware/arm_ffa/smccc.c
@@ -17,7 +17,7 @@ static void __arm_ffa_fn_hvc(ffa_value_t args, ffa_value_t *res)
 	arm_smccc_1_2_hvc(&args, res);
 }

-int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
+int ffa_transport_init(ffa_fn **invoke_ffa_fn)
 {
 	enum arm_smccc_conduit conduit;

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


