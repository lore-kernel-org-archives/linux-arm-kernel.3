Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF337D374A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 21:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bc/qP+C9IOeMq61mbuCogknTAL854KP7g9QOs7/EMyI=; b=PVUNnCzkYUla0CbOCwbi0ykmfB
	3hdUvb202ElYw57TWrnYv+3h2JPKo6QH9savmuI8oOYb+nGR+1kAiTDRqx+9UPGF7SRZoOIV7ziNP
	RxW8aX2qaH/by3/Qvru8dwR7aSNk7GQU8dNIJ5jig8mFGZokWAoaQ9YxPbrot3nl4FgcibZvvKeHj
	ZPraeRk+0GO8+ezuuUinRWvydVjiYVLLt1KK/rU1FJRVWT4obxnyY0Ie12RGjbqZvSJ1PA5MFrcl5
	ZPloC7JEBvA/6bb01eJQL4P2O6mX5Ziopulq9D3M7lrlJqcwEDl+2ROFTmB9ExHSfrTnabKfNcw90
	Qh4mRdYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdpz-0000000A4yD-1Agj;
	Fri, 05 Dec 2025 21:59:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdpw-0000000A4xN-3yVq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 21:59:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7D731A25;
	Fri,  5 Dec 2025 13:59:28 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 867DA3F740;
	Fri,  5 Dec 2025 13:59:32 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 02/38] arm64: mpam: Re-initialise MPAM regs when CPU comes online
Date: Fri,  5 Dec 2025 21:58:25 +0000
Message-Id: <20251205215901.17772-3-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_135937_020590_FE5C8E6D 
X-CRM114-Status: GOOD (  12.97  )
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

Now that the MPAM system registers are expected to have values that change,
reprogram them based on struct task_struct when a CPU is brought online.

Previously MPAM's 'default PARTID' of 0 was used this is the PARTID that
hardware guarantees to reset. Because there are a limited number of
PARTID, this value is exposed to user space, meaning resctrl changes
to the resctrl default group would also affect kernel threads.
Instead, use the task's PARTID value for kernel work on behalf of
user-space too.

Signed-off-by: James Morse <james.morse@arm.com>
---
 arch/arm64/kernel/cpufeature.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 5ed401ff79e3..429128a181ac 100644
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
@@ -2439,13 +2440,16 @@ test_has_mpam(const struct arm64_cpu_capabilities *entry, int scope)
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
+	if (IS_ENABLED(CONFIG_MPAM))
+		regval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
+
+	write_sysreg_s(regval, SYS_MPAM1_EL1);
+	isb();
+
+	write_sysreg_s(regval, SYS_MPAM0_EL1);
 }
 
 static bool
-- 
2.39.5


