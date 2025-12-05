Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C966D374B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfQV1y7h+xPRmjsixlg279cacmzgd7sFuv4JMcrhQWA=; b=41UfOMJsopvmMoEcIIdlkKTH6i
	oAecf9NewSsgVWnjEhkPSk3Jh/Nr/KfKqnLkFgod/eYRHIhtOmdfKnost006MCQY3dJdJQ5EqIEct
	kNQKynZgTfd/gi8wHViKR8pbWV1TRsGtnNvc7LNlQsMhhjHsiIloYEHZ/8PjFawlRIIWpJdGSGWya
	Wib9qptE7ekHUJiwESLW1R8X/aGNCcitdhhbhxTvf7wCqQil79T6LXxw/R4A2EEVwYjVmhQHKJnmS
	BPgeVfY30mNG5YgqsMPW+LeDLxfHMgcM9cRD9/JTHlH/3spjvE/T7VMVfeasp/E5f4+CV+0SzuVQa
	sbZlS81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqq-0000000A5cN-3QYd;
	Fri, 05 Dec 2025 22:00:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqp-0000000A5a6-29su
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Dec 2025 22:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vfQV1y7h+xPRmjsixlg279cacmzgd7sFuv4JMcrhQWA=; b=obeUKH/NjHdv9F+7K1yCFGXCnD
	VIjieb3J2Ay+3WAaefro6wGohMNmy0VZxe/u4tE+KMjOObxqbO5NZ95uB7dkx2Y+39we8u9wCOzlC
	9ih+qeL54ltlTMrHmWoo6H43NHKuuyZDO7nTadgupw6iyN8Iec7R6z3gRbLCAPOA7Pc8HaDnlGIWj
	kQsmpReuPn8ZlhYxemQHitvlhuu7iqlqehOo1n17kFG3vzUfxUDwdqe05WwIshHm7wwV0vHQ0wMG2
	ryhJ0ftND1uSrx+J2ddnQn7hia7ERrspzFxW29668zUL5QMdDae3/4pFglE2rrEFNgvs2pb8Tizgu
	B4qfEWdA==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdql-00000006IZu-3xjH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:00:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFD2E1AED;
	Fri,  5 Dec 2025 14:00:17 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DB043F740;
	Fri,  5 Dec 2025 14:00:21 -0800 (PST)
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
Subject: [RFC PATCH 14/38] arm_mpam: resctrl: Add rmid index helpers
Date: Fri,  5 Dec 2025 21:58:37 +0000
Message-Id: <20251205215901.17772-15-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_220028_210871_028D8EF3 
X-CRM114-Status: GOOD (  11.31  )
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

Because MPAM's pmg aren't identical to RDT's rmid, resctrl handles
some data structures by index. This allows x86 to map indexes to
RMID, and MPAM to map them to partid-and-pmg.

Add the helpers to do this.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 28 ++++++++++++++++++++++++++++
 include/linux/arm_mpam.h       |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index d5f75ed67e46..19d70d00bbcc 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -120,6 +120,34 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
 	return mpam_partid_max + 1;
 }
 
+u32 resctrl_arch_system_num_rmid_idx(void)
+{
+	u8 closid_shift = fls(mpam_pmg_max);
+	u32 num_partid = resctrl_arch_get_num_closid(NULL);
+
+	return num_partid << closid_shift;
+}
+
+u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
+{
+	u8 closid_shift = fls(mpam_pmg_max);
+
+	WARN_ON_ONCE(closid_shift > 8);
+
+	return (closid << closid_shift) | rmid;
+}
+
+void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
+{
+	u8 closid_shift = fls(mpam_pmg_max);
+	u32 pmg_mask = ~(~0 << closid_shift);
+
+	WARN_ON_ONCE(closid_shift > 8);
+
+	*closid = idx >> closid_shift;
+	*rmid = idx & pmg_mask;
+}
+
 void resctrl_arch_sched_in(struct task_struct *tsk)
 {
 	lockdep_assert_preemption_disabled();
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index ba0312b55d9f..385554ceb452 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -59,6 +59,9 @@ void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid);
 void resctrl_arch_sched_in(struct task_struct *tsk);
 bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
 bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
+u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
+void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
+u32 resctrl_arch_system_num_rmid_idx(void);
 
 /**
  * mpam_register_requestor() - Register a requestor with the MPAM driver
-- 
2.39.5


