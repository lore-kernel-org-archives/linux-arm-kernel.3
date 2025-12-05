Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA611D374A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 21:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVWXL0Ab6whtFzccNo+sAV/a4uHbkaccqFz2sXjWJ4k=; b=KVG9RJyOHW44qNHv+l6a8fg+kR
	csSWNq8hlA/zDl4LnbCeN/ylr8S1rkl7tUVeUcL1V4rmuu08qCZCSOBLC8/4vS4o0sNO4xisW2cqK
	V4CWHgYIyMnilC7KgO+mwShali82mXoDlvyRaRfvUW0F75ibyF31gbPtnjU4/ONo0rrMmtCoAp23L
	ikak9QjYMcPUxZOd1unUlTwHTjqvFPA8kOgi+/3XKvPXcz3i4W4fBcTk1YTsFN5K0A3vq0omQeggR
	t3Jw53zC/5XaNbsyzYOHmbgKQFduTbPq5kRDroLu7RrolNQt2n3MBaU+l2vEMtCTD4/El7+YEOpwp
	HK7Ndojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqD-0000000A53x-1gUX;
	Fri, 05 Dec 2025 21:59:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqB-0000000A52i-0IX7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 21:59:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25C8A1AC1;
	Fri,  5 Dec 2025 13:59:41 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 979FB3F740;
	Fri,  5 Dec 2025 13:59:44 -0800 (PST)
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
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>,
	Dave Martin <Dave.Martin@arm.com>
Subject: [RFC PATCH 05/38] arm64: mpam: Add helpers to change a task or cpu's MPAM PARTID/PMG values
Date: Fri,  5 Dec 2025 21:58:28 +0000
Message-Id: <20251205215901.17772-6-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_135951_143405_822E6CB8 
X-CRM114-Status: GOOD (  10.90  )
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

Care must be taken when modifying the PARTID and PMG of a task in any
per-task structure as writing these values may race with the task being
scheduled in, and reading the modified values.

Add helpers to set the task properties, and the CPU default value.
These use WRITE_ONCE() that pairs with the READ_ONCE() in mpam_get_regval()
to avoid causing torn values.

CC: Dave Martin <Dave.Martin@arm.com>
CC: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 arch/arm64/include/asm/mpam.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
index 86a55176f884..2960ffaf6574 100644
--- a/arch/arm64/include/asm/mpam.h
+++ b/arch/arm64/include/asm/mpam.h
@@ -5,6 +5,7 @@
 #define __ASM__MPAM_H
 
 #include <linux/bitops.h>
+#include <linux/bitfield.h>
 #include <linux/init.h>
 #include <linux/jump_label.h>
 #include <linux/percpu.h>
@@ -37,6 +38,35 @@ extern u64 arm64_mpam_global_default;
  * A value in struct thread_info is used instead of struct task_struct as the
  * cpu's u64 register format is used, but struct task_struct has two u32'.
  */
+static inline void mpam_set_cpu_defaults(int cpu, u16 partid_d, u16 partid_i,
+					 u8 pmg_d, u8 pmg_i)
+{
+	u64 default_val;
+
+	default_val = FIELD_PREP(MPAM0_EL1_PARTID_D, partid_d);
+	default_val |= FIELD_PREP(MPAM0_EL1_PARTID_I, partid_i);
+	default_val |= FIELD_PREP(MPAM0_EL1_PMG_D, pmg_d);
+	default_val |= FIELD_PREP(MPAM0_EL1_PMG_I, pmg_i);
+
+	WRITE_ONCE(per_cpu(arm64_mpam_default, cpu), default_val);
+}
+
+static inline void mpam_set_task_partid_pmg(struct task_struct *tsk,
+					    u16 partid_d, u16 partid_i,
+					    u8 pmg_d, u8 pmg_i)
+{
+#ifdef CONFIG_ARM64_MPAM
+	u64 regval;
+
+	regval = FIELD_PREP(MPAM0_EL1_PARTID_D, partid_d);
+	regval |= FIELD_PREP(MPAM0_EL1_PARTID_I, partid_i);
+	regval |= FIELD_PREP(MPAM0_EL1_PMG_D, pmg_d);
+	regval |= FIELD_PREP(MPAM0_EL1_PMG_I, pmg_i);
+
+	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
+#endif
+}
+
 static inline u64 mpam_get_regval(struct task_struct *tsk)
 {
 #ifdef CONFIG_ARM64_MPAM
-- 
2.39.5


