Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BFBCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhrZAT/a3jfACP6nJb0gqLr9xMHfva4E+UyvZS2ThzQ=; b=e8I0nElqa9a11N82ybZqMJlfJb
	GARgY00ZAVRCSK8GXmiMR5rHndVkEeXEogGgXRDFaHjT31Kacq3LFSX6n8NszzGJcM+Ui/l54p+ih
	hU7lb+fpr61rM9LRKOZSh3tRwJeLYD654daLc9o0q2KzcYv7HhvSsxLyzFPA57bmAf8yrb3MAOd4O
	zjWDHmeIsh6Qw8vItmKg+zaP4ktQ5jCXNYmgobqXReDInCa7IhIauXJiBUjB4GmWVcCgak33cVCZV
	8z224+VqUIvryh9FLCMfWo8A1/qyDMcEntbQDgxrRXP6nuVWbUcMZtlK6k0R13mbdQQfqJ41Z7sqH
	Gdx4vzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upht3-00000004950-2dIF;
	Sat, 23 Aug 2025 06:38:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTnx-000000034Gh-011K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:35:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 440B515A1;
	Fri, 22 Aug 2025 08:35:40 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3759E3F63F;
	Fri, 22 Aug 2025 08:35:43 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: James Morse <james.morse@arm.com>,
	shameerali.kolothum.thodi@huawei.com,
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
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 16/33] arm_mpam: Add helpers for managing the locking around the mon_sel registers
Date: Fri, 22 Aug 2025 15:30:31 +0000
Message-Id: <20250822153048.2287-51-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250822153048.2287-1-james.morse@arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_083549_118740_66495E13 
X-CRM114-Status: GOOD (  20.04  )
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

The MSC MON_SEL register needs to be accessed from hardirq context by the
PMU drivers, making an irqsave spinlock the obvious lock to protect these
registers. On systems with SCMI mailboxes it must be able to sleep, meaning
a mutex must be used.

Clearly these two can't exist at the same time.

Add helpers for the MON_SEL locking. The outer lock must be taken in a
pre-emptible context before the inner lock can be taken. On systems with
SCMI mailboxes where the MON_SEL accesses must sleep - the inner lock
will fail to be 'taken' if the caller is unable to sleep. This will allow
the PMU driver to fail without having to check the interface type of
each MSC.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_internal.h | 57 ++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index a623f405ddd8..c6f087f9fa7d 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -68,10 +68,19 @@ struct mpam_msc {
 
 	/*
 	 * mon_sel_lock protects access to the MSC hardware registers that are
-	 * affeted by MPAMCFG_MON_SEL.
+	 * affected by MPAMCFG_MON_SEL, and the mbwu_state.
+	 * Both the 'inner' and 'outer' must be taken.
+	 * For real MMIO MSC, the outer lock is unnecessary - but keeps the
+	 * code common with:
+	 * Firmware backed MSC need to sleep when accessing the MSC, which
+	 * means some code-paths will always fail. For these MSC the outer
+	 * lock is providing the protection, and the inner lock fails to
+	 * be taken if the task is unable to sleep.
+	 *
 	 * If needed, take msc->probe_lock first.
 	 */
 	struct mutex		outer_mon_sel_lock;
+	bool			outer_lock_held;
 	raw_spinlock_t		inner_mon_sel_lock;
 	unsigned long		inner_mon_sel_flags;
 
@@ -81,6 +90,52 @@ struct mpam_msc {
 	struct mpam_garbage	garbage;
 };
 
+static inline bool __must_check mpam_mon_sel_inner_lock(struct mpam_msc *msc)
+{
+	/*
+	 * The outer lock may be taken by a CPU that then issues an IPI to run
+	 * a helper that takes the inner lock. lockdep can't help us here.
+	 */
+	WARN_ON_ONCE(!msc->outer_lock_held);
+
+	if (msc->iface == MPAM_IFACE_MMIO) {
+		raw_spin_lock_irqsave(&msc->inner_mon_sel_lock, msc->inner_mon_sel_flags);
+		return true;
+	}
+
+	/* Accesses must fail if we are not pre-emptible */
+	return !!preemptible();
+}
+
+static inline void mpam_mon_sel_inner_unlock(struct mpam_msc *msc)
+{
+	WARN_ON_ONCE(!msc->outer_lock_held);
+
+	if (msc->iface == MPAM_IFACE_MMIO)
+		raw_spin_unlock_irqrestore(&msc->inner_mon_sel_lock, msc->inner_mon_sel_flags);
+}
+
+static inline void mpam_mon_sel_outer_lock(struct mpam_msc *msc)
+{
+	mutex_lock(&msc->outer_mon_sel_lock);
+	msc->outer_lock_held = true;
+}
+
+static inline void mpam_mon_sel_outer_unlock(struct mpam_msc *msc)
+{
+	msc->outer_lock_held = false;
+	mutex_unlock(&msc->outer_mon_sel_lock);
+}
+
+static inline void mpam_mon_sel_lock_held(struct mpam_msc *msc)
+{
+	WARN_ON_ONCE(!msc->outer_lock_held);
+	if (msc->iface == MPAM_IFACE_MMIO)
+		lockdep_assert_held_once(&msc->inner_mon_sel_lock);
+	else
+		lockdep_assert_preemption_enabled();
+}
+
 struct mpam_class {
 	/* mpam_components in this class */
 	struct list_head	components;
-- 
2.20.1


