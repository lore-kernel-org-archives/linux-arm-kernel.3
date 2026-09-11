Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68B5C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpPyK0i2BzR6e3v/0AyIPiTP1/J/pTtMHYqMGVDQPeA=; b=boS30/VoLpwMtNyzXBmkfH8GEx
	PwxekY8y5MPM09/sifNnRtKfYqv86kW7v9gR4MzR8JxQbLpbMgkfpgPWX+XHaRlwr8zT1fqgD4TAD
	mkGSvtp1zsvtVWcrkCdQYK0pDIoJtR4d10POP1+91aboE3A8/gMCUevhmi0yHSJ1kPVPKmBlzMXuP
	QBQkF4EUPf6ioLJofSn9CyM1QAxuFz+NBYJfEdvd1TL//1CR8npsda+p4KTbKv6xpNC+VNKGHPDT/
	jwPHC6+RNm8LFpTldmDj7AwehkAxuAo6DLWLjJ6+VSt4NZPETqSPC6bR9IC6BNFeq1vHfNOkC49YB
	itOltbqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zRt-0000000GVli-19ko;
	Fri, 11 Sep 2026 11:29:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zRe-0000000GVXY-2UYj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 11:29:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E730428C7;
	Fri, 11 Sep 2026 04:29:21 -0700 (PDT)
Received: from e142021.arm.com (unknown [10.57.6.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 687663F59E;
	Fri, 11 Sep 2026 04:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789126165; bh=M4revIK+Dmf/Tsm44umCSvkCVw0u21pBsAjjkKiLm3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZtPImNRZAlp639G/Tj4zj090WtV9ynY/Ak/N8gXrz2NGAvKBp+4CpRigtQ6gToP32
	 mGemV3ilEbz0MVIAJe77y5c+KZfOAlSWbiHj5jfTcIuI0MXyAeGWoz3ZcpgF64JB97
	 F4fu5+2n62ARZIe0L5+uAd6qhW+imthRB3+I/R+g=
From: Andre Przywara <andre.przywara@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>,
	Lee Trager <lee@trager.us>,
	Ritwick Sharma <ritwick.sharma@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 09/14] arm_mpam: prepare mon_sel locking for MPAM-Fb
Date: Fri, 11 Sep 2026 13:28:30 +0200
Message-ID: <20260911112835.714162-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911112835.714162-1-andre.przywara@arm.com>
References: <20260911112835.714162-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_042927_052253_51AE7D61 
X-CRM114-Status: GOOD (  19.72  )
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

The MSC MON_SEL register needs to be accessed from hardirq for the overflow
interrupt, and when taking an IPI to access these registers on platforms
where MSCs are not accesible from every CPU. This makes an irqsave
spinlock the obvious lock to protect these registers. On systems with
MPAM-Fb mailbox MSC access it must be able to sleep, meaning a mutex must
be used. So MPAM-Fb platforms cannot support an overflow interrupt easily.
Clearly these two methods can't exist for one MSC at the same time.

Change the mon_sel locking wrapper function to only use a spinlock when
the MSC is accessed directly via MMIO. In case of MPAM-Fb, we use a
mutex, but only if we are in a sleepable context. If that's not the
case, we return an error. This should not happen, as MPAM-Fb by design
does not require an MSC access to happen from a specific CPU, so there
is no need for any IPIs or preemption disabling to satisfy CPU
constraints. And since overflow interrupts are not supported at the moment
anyway, we also wouldn't meet the other case.
Bailing out early is already happening in rare occasions today.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Gavin Shan <gshan@redhat.com> # on NVIDIA Grace Hopper
---
 drivers/resctrl/mpam_devices.c  |  6 ++++-
 drivers/resctrl/mpam_internal.h | 43 +++++++++++++++++++++++++++------
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index eb26c25b9f970..e7c239a496f7a 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2288,7 +2288,6 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 	if (err)
 		return ERR_PTR(err);
 
-	mpam_mon_sel_lock_init(msc);
 	msc->id = pdev->id;
 	msc->pdev = pdev;
 	INIT_LIST_HEAD_RCU(&msc->all_msc_list);
@@ -2309,6 +2308,11 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 	else
 		msc->iface = MPAM_IFACE_PCC;
 
+	/* Lock type depends on MSC interface used */
+	err = mpam_mon_sel_lock_init(dev, msc);
+	if (err)
+		return ERR_PTR(err);
+
 	if (msc->iface == MPAM_IFACE_MMIO) {
 		void __iomem *io;
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 68a6cf2b9cc73..2414598100140 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -126,6 +126,12 @@ struct mpam_msc {
 	 */
 	raw_spinlock_t		_mon_sel_lock;
 	unsigned long		_mon_sel_flags;
+	/*
+	 * mon_sel_mutex is the mutex version of the _mon_sel_lock above.
+	 * Always use the mpam_mon_sel_lock() helpers when taking the lock,
+	 * as this will select the correct lock type automatically.
+	 */
+	struct mutex		mon_sel_mutex;
 
 	void __iomem		*mapped_hwpage;
 	size_t			mapped_hwpage_sz;
@@ -139,27 +145,50 @@ struct mpam_msc {
 /* Returning false here means accesses to mon_sel must fail and report an error. */
 static inline bool __must_check mpam_mon_sel_lock(struct mpam_msc *msc)
 {
-	/* Locking will require updating to support a firmware backed interface */
-	if (WARN_ON_ONCE(msc->iface != MPAM_IFACE_MMIO))
+	if (msc->iface == MPAM_IFACE_MMIO) {
+		raw_spin_lock_irqsave(&msc->_mon_sel_lock, msc->_mon_sel_flags);
+
+		return true;
+	}
+
+	if (!preemptible())
 		return false;
 
-	raw_spin_lock_irqsave(&msc->_mon_sel_lock, msc->_mon_sel_flags);
+	mutex_lock(&msc->mon_sel_mutex);
+
 	return true;
 }
 
 static inline void mpam_mon_sel_unlock(struct mpam_msc *msc)
 {
-	raw_spin_unlock_irqrestore(&msc->_mon_sel_lock, msc->_mon_sel_flags);
+	if (msc->iface == MPAM_IFACE_MMIO) {
+		raw_spin_unlock_irqrestore(&msc->_mon_sel_lock,
+					   msc->_mon_sel_flags);
+
+		return;
+	}
+
+	mutex_unlock(&msc->mon_sel_mutex);
 }
 
 static inline void mpam_mon_sel_lock_held(struct mpam_msc *msc)
 {
-	lockdep_assert_held_once(&msc->_mon_sel_lock);
+	if (msc->iface == MPAM_IFACE_MMIO)
+		lockdep_assert_held_once(&msc->_mon_sel_lock);
+	else
+		lockdep_assert_held_once(&msc->mon_sel_mutex);
 }
 
-static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
+static inline int mpam_mon_sel_lock_init(struct device *dev,
+					 struct mpam_msc *msc)
 {
-	raw_spin_lock_init(&msc->_mon_sel_lock);
+	if (msc->iface == MPAM_IFACE_MMIO) {
+		raw_spin_lock_init(&msc->_mon_sel_lock);
+
+		return 0;
+	}
+
+	return devm_mutex_init(dev, &msc->mon_sel_mutex);
 }
 
 DEFINE_GUARD(mon_sel, struct mpam_msc *,
-- 
2.43.0


