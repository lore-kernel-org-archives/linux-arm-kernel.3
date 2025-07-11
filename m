Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77533C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JD08TdKUINm9cuP8//zovciI+tAx5d6vRdbyV+3SITA=; b=zU0tg3j9BfQwWfh7P6AyILiZa7
	MPdecv5fG8Ki4BRkxCxskFON0UimJ53RV3LIYAmQdm9UBBPpRWzBgEdazZPH9kuC7+NiXGQFW5ECO
	4czS7u1rZ7ETIzDA3jDN9w2dM6raPBGwNpWDcFif/F/31ayC3hCs3SLyxquZjvxTAmiRA3+Tvmpa0
	TbRQ8YQ9nNENcbLMDlXi/oP3hUqEcbXWnKcgqz2Vucvlw5LDo2pkOEqN5N5PIzlbyNos3fZafi9H1
	BHVfR1PRGi2p6f9WQVkj0kFXl+I6dsZk0Xo30fgM4h4rGyNAIiLzq8XX3zd4sRuMncDEFI5cJVdib
	Z4Dp7Hvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJS8-0000000FeL1-02df;
	Fri, 11 Jul 2025 19:30:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIdK-0000000FXN2-35hk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:38:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7D592247;
	Fri, 11 Jul 2025 11:37:55 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F8273F694;
	Fri, 11 Jul 2025 11:38:03 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Lecopzer Chen <lecopzerc@nvidia.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
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
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH 19/36] arm_mpam: Add helpers for managing the locking around the mon_sel registers
Date: Fri, 11 Jul 2025 18:36:31 +0000
Message-Id: <20250711183648.30766-20-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250711183648.30766-1-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113806_903223_1DB755E5 
X-CRM114-Status: GOOD (  19.39  )
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
 drivers/platform/arm64/mpam/mpam_internal.h | 57 ++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/arm64/mpam/mpam_internal.h b/drivers/platform/arm64/mpam/mpam_internal.h
index eb5cc6775d54..42a454d5f914 100644
--- a/drivers/platform/arm64/mpam/mpam_internal.h
+++ b/drivers/platform/arm64/mpam/mpam_internal.h
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
2.39.5


