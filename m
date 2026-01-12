Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE12CF45AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOu7zOq7qGbgBy2XjpZIV/f03/rGkJphWLw3FsAUUF8=; b=y0Vm8EuagWLxD6yxwjBVlQpBS3
	7m/lm8tfHPOq8OOB/ZOB33AXJRXveWN6Y/zp0DryGyiJJsiNyjwuWNaWnBeZdMLZuCIP2GKvHKZtp
	PGgQ7f3RclxVDeVFJjvrCNvBrfg5LNKOfhCMo43FWzyU+KrUy/1PEKjPfOtKmLwafuuIugZVbcXVr
	plNYKg0D2iC46k8ANcZeuAiZ9r2Scdf4Ph8BitJElfU/+zQ2hO0ZURBtssIY/7gFb9rsoQvBP7eDR
	+E63ydjBNC6x9Eu+5CHYDb4jOqxukokIFx9i73ezPJAOU22IWaSwm0/lUsSvS2UnLVzWMkfof99S+
	3IBNk67g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLHO-00000005lEe-2dTp;
	Mon, 12 Jan 2026 17:00:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLHK-00000005lBi-263q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:00:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 147E01516;
	Mon, 12 Jan 2026 09:00:22 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AE1313F694;
	Mon, 12 Jan 2026 09:00:23 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev
Subject: [PATCH v3 07/47] arm64: mpam: Re-initialise MPAM regs when CPU comes online
Date: Mon, 12 Jan 2026 16:58:34 +0000
Message-ID: <20260112165914.4086692-8-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_090030_586153_210DA776 
X-CRM114-Status: GOOD (  14.43  )
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

From: James Morse <james.morse@arm.com>

Now that the MPAM system registers are expected to have values that change,
reprogram them based on the previous value when a CPU is brought online.

Previously MPAM's 'default PARTID' of 0 was always used for MPAM in
kernel-space as this is the PARTID that hardware guarantees to
reset. Because there are a limited number of PARTID, this value is exposed
to user-space, meaning resctrl changes to the resctrl default group would
also affect kernel threads.  Instead, use the task's PARTID value for
kernel work on behalf of user-space too. The default of 0 is kept for both
user-space and kernel-space when MPAM is not enabled.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
CONFIG_MPAM -> CONFIG_ARM64_MPAM
Check mpam_enabled
Comment about relying on ERET for synchronisation
Update commit message
---
 arch/arm64/kernel/cpufeature.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c840a93b9ef9..0cdfb3728f43 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -86,6 +86,7 @@
 #include <asm/kvm_host.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
+#include <asm/mpam.h>
 #include <asm/mte.h>
 #include <asm/hypervisor.h>
 #include <asm/processor.h>
@@ -2483,13 +2484,17 @@ test_has_mpam(const struct arm64_cpu_capabilities *entry, int scope)
 static void
 cpu_enable_mpam(const struct arm64_cpu_capabilities *entry)
 {
-	/*
-	 * Access by the kernel (at EL1) should use the reserved PARTID
-	 * which is configured unrestricted. This avoids priority-inversion
-	 * where latency sensitive tasks have to wait for a task that has
-	 * been throttled to release the lock.
-	 */
-	write_sysreg_s(0, SYS_MPAM1_EL1);
+	int cpu = smp_processor_id();
+	u64 regval = 0;
+
+	if (IS_ENABLED(CONFIG_ARM64_MPAM) && static_branch_likely(&mpam_enabled))
+		regval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
+
+	write_sysreg_s(regval, SYS_MPAM1_EL1);
+	isb();
+
+	/* Synchronising the EL0 write is left until the ERET to EL0 */
+	write_sysreg_s(regval, SYS_MPAM0_EL1);
 }
 
 static bool
-- 
2.43.0


