Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDE7CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 06:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ixn7APiYz6o3f8U8AhQKbmptxV6HtRFe3efOXYNBSis=; b=vUoCYhFhOSY/y7DZhEP45nJ9Dt
	wST2eeUJgxjO1tO9fLS6bF9xYPOakRGLR5qMDy/zkoY4/mcazVgivTyPz0xX6Fxnt/6+SbQupNmlA
	X6NpZczZ6W6BwAjDRkvlxmr4QME/mjLjvKJ7i5Uj+kzt/gwD8G3Add+nksysu+UnXdCZtSpQcQVlj
	hc3H0uQx3pc8F40qEVEH8XA+X/p/kWev2K8aSTpQ5ENBZV+cUVzSiwJo4NWxwfbpZu+8WbJebnOdN
	1OMNb2VtSBMjUpx7W5PeJsuhXvvg21NqdzzabC7YEduAUTFiZgKpFMC0PTUF0+facTMegjuc4Opok
	mKf08p9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWYy-0000000AhX0-1dco;
	Fri, 02 Oct 2026 06:16:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWYv-0000000AhTU-01xL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 06:16:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09CFF497;
	Thu,  1 Oct 2026 23:16:01 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E9DEA3F763;
	Thu,  1 Oct 2026 23:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790921764; bh=CvqID979zPbJz0Utj/1q5es/dWiblgrwNhyhnsUZo6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Upr//g78tZhlt/rluBEHd2huvvjtl6FXR+YU2RpiuTo8AZioerX39/vqXyoyG46L9
	 QGMD+0D4I/jGKiT6yHmD4osj0GWD64qvqrhG56Sl2hGRvn73XEh9zzd6Ex1IPO7TpP
	 VOMfqJCFS3yOzCJmNokGQO1ffFA9Ql7DiEAylZ3c=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v22 08/10] arm64: Block hibernate and kexec while RMM is active
Date: Fri,  2 Oct 2026 07:15:04 +0100
Message-ID: <20261002061507.1600269-9-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002061507.1600269-1-suzuki.poulose@arm.com>
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_231605_130886_906941EA 
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

RMM can be deactivated only after all delegated granules have been
reclaimed. If a new kernel is entered while any granules remain in the
Realm PAS, accesses to that memory can raise a Granule Protection Fault
and be fatal to the new kernel.

Crash kexec/kdump needs separate handling. It can be supported only once
the crash kernel can tolerate delegated memory inherited from the primary
kernel. i.e., be able to read the pages safely and fixup the GPF. Until
then disable the kexec completely.

Hibernate has a similar problem. The image cannot be safely saved for
delegated pages, as the RMM doesn't support exporting the pages.
Also, on the resume path, if the RMM is active, there could be delegated
granules and overwriting them is fatal.

Disable both kexec and hiberation while the RMM is active.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v21:
 - Drop cpus_are_stuck_in_kernel() from arch_hibernation_available()
 - Split arch_hibernation_available() hook as a separate patch
Changes since v20:
 - Add arch_hibernation_available() hook for archs to have a say and drop the
   other checks.
Changes since v19:
 - New patch to disable kexec and hibernation with RMM
---
 arch/arm64/kernel/hibernate.c     | 14 ++++++++++++++
 arch/arm64/kernel/machine_kexec.c | 11 +++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 7bf1174277772..327e62a259aa7 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -10,6 +10,8 @@
  * Copyright (C) 2006 Rafael J. Wysocki <rjw@sisk.pl>
  */
 #define pr_fmt(x) "hibernate: " x
+
+#include <linux/arm-rmi-cmds.h>
 #include <linux/cpu.h>
 #include <linux/kvm_host.h>
 #include <linux/pm.h>
@@ -105,6 +107,18 @@ void notrace restore_processor_state(void)
 {
 }
 
+bool arch_hibernation_available(void)
+{
+	/*
+	 * If we have activated the RMM, there could be pages that are
+	 * delegated to the RMM. Trying to save them to the image will be fatal.
+	 * Also, we donate pages to the RMM at activation and restoring data
+	 * to those pages are going to be fatal.
+	 * Hence, disable the hibernation when the RMM is active
+	 */
+	return !is_rmm_active();
+}
+
 int arch_hibernation_header_save(void *addr, unsigned int max_size)
 {
 	struct arch_hibernate_hdr *hdr = addr;
diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index 8f9bc2327dc85..48f343704cb54 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -6,6 +6,7 @@
  * Copyright (C) Huawei Futurewei Technologies.
  */
 
+#include <linux/arm-rmi-cmds.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
@@ -59,6 +60,16 @@ int machine_kexec_prepare(struct kimage *kimage)
 		return -EBUSY;
 	}
 
+	/*
+	 * We will be able to allow kdump to proceed, once we have the support
+	 * for handling GPF from vmcore accesses to delegated pages. Until then
+	 * block kexec completely.
+	 */
+	if (is_rmm_active()) {
+		pr_err("Can't kexec: RMM is active.\n");
+		return -EBUSY;
+	}
+
 	return 0;
 }
 
-- 
2.43.0


