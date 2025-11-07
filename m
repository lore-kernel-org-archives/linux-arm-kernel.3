Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370B7CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 12:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AksfXuQAiD/7IL+rq3MQEeF7b1Sx4wN0bAdYikiyPMI=; b=4zOIUZO10Ku89nDEK9n4+05ciS
	pbed9XTFXfPy4eh04sg41Nifl1qFkpPVA5p3CFXOvZvxpxv+2ESSXsjXJYfneE3Np2dFblRz3ENdx
	m6EbeMmH43QINjn+BxKePZEc2x/fHdOr8i2hFCUot1mCTrB1J7SMo3qmCbezKSXdUtQHloudClEdh
	RclyinW1zr2V5cKRw/nMUWnssj+0y9OIcoO/naGMoNgL1FAgTzmhfrDJHQjSFO3TyCd3ejfUqgrX7
	EGSO5bXR07DEIP1Z5Ui5am859tTzvzmXvVVGUGQ1WXG/en3U2YlquzgrVGePHZKP3UjGpnnw9bvqM
	dED22F9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLi0-0000000HJZ2-2Q02;
	Fri, 07 Nov 2025 12:36:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLhy-0000000HJWW-2JXD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 12:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AksfXuQAiD/7IL+rq3MQEeF7b1Sx4wN0bAdYikiyPMI=; b=o0shy0MmqT9tyd4BtK9dGJ/G0M
	/EjQpRFg3cUFIaFTf4n0Xyt7oKiltXVMxBmCrzKPLe9g/Ml/JTcd3ywZEHIm4viWP9cDiNMXzbtoG
	5P0Y4xORSPjG+x6SsP08r3Q7Hd5LHlXwt2Dh9sr/3Trk0GMkUBY4dBqUctAN/okMxzQ52Nj5U/Fs8
	tn4yycT/Cos7DYJX0aeTqEUNDjHcj1TUiBupxj0f2bRrjRl0W30WzOwI4USOXXhtpbIBKkXm/st/K
	0uT3m2xQrm75L0U7FRESzay1RG/YQGonVQ8uG7FPPEvBUV9PFllP5lnBUyQWL57F6f2OsvI7WX3u0
	DIk56WwA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKqE-00000006O3W-2Rch
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 11:41:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A683C1BC0;
	Fri,  7 Nov 2025 04:36:38 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80D8B3F66E;
	Fri,  7 Nov 2025 04:36:41 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: james.morse@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com,
	catalin.marinas@arm.com,
	dakr@kernel.org,
	dave.martin@arm.com,
	david@redhat.com,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gregkh@linuxfoundation.org,
	gshan@redhat.com,
	guohanjun@huawei.com,
	jeremy.linton@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	peternewman@google.com,
	quic_jiles@quicinc.com,
	rafael@kernel.org,
	robh@kernel.org,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com,
	will@kernel.org,
	xhao@linux.alibaba.com,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH 15/33] arm_mpam: Add helpers for managing the locking around the mon_sel registers
Date: Fri,  7 Nov 2025 12:34:32 +0000
Message-ID: <20251107123450.664001-16-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107123450.664001-1-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_114119_146839_796F7EB1 
X-CRM114-Status: GOOD (  17.26  )
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

The MSC MON_SEL register needs to be accessed from hardirq for the overflow
interrupt, and when taking an IPI to access these registers on platforms
where MSC are not accessible from every CPU. This makes an irqsave
spinlock the obvious lock to protect these registers. On systems with SCMI
or PCC mailboxes it must be able to sleep, meaning a mutex must be used.
The SCMI or PCC platforms can't support an overflow interrupt, and
can't access the registers from hardirq context.

Clearly these two can't exist for one MSC at the same time.

Add helpers for the MON_SEL locking. For now, use a irqsave spinlock and
only support 'real' MMIO platforms.

In the future this lock will be split in two allowing SCMI/PCC platforms
to take a mutex. Because there are contexts where the SCMI/PCC platforms
can't make an access, mpam_mon_sel_lock() needs to be able to fail. Do
this now, so that all the error handling on these paths is present. This
allows the relevant paths to fail if they are needed on a platform where
this isn't possible, instead of having to make explicit checks of the
interface type.

Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v3:
use devm_mutex_init()
include tiying
stray comma (Jonathan)
---
 drivers/resctrl/mpam_devices.c  |  2 ++
 drivers/resctrl/mpam_internal.h | 39 +++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index e1e26cb350f7..3556299a8605 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/srcu.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
@@ -746,6 +747,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 	err = devm_mutex_init(dev, &msc->part_sel_lock);
 	if (err)
 		return ERR_PTR(err);
+	mpam_mon_sel_lock_init(msc);
 	msc->id = pdev->id;
 	msc->pdev = pdev;
 	INIT_LIST_HEAD_RCU(&msc->all_msc_list);
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 768a58a3ab27..b62ee55e1ed5 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -10,6 +10,7 @@
 #include <linux/llist.h>
 #include <linux/mutex.h>
 #include <linux/srcu.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
 #define MPAM_MSC_MAX_NUM_RIS	16
@@ -65,12 +66,50 @@ struct mpam_msc {
 	 */
 	struct mutex		part_sel_lock;
 
+	/*
+	 * mon_sel_lock protects access to the MSC hardware registers that are
+	 * affected by MPAMCFG_MON_SEL, and the mbwu_state.
+	 * Access to mon_sel is needed from both process and interrupt contexts,
+	 * but is complicated by firmware-backed platforms that can't make any
+	 * access unless they can sleep.
+	 * Always use the mpam_mon_sel_lock() helpers.
+	 * Accesses to mon_sel need to be able to fail if they occur in the wrong
+	 * context.
+	 * If needed, take msc->probe_lock first.
+	 */
+	raw_spinlock_t		_mon_sel_lock;
+	unsigned long		_mon_sel_flags;
+
 	void __iomem		*mapped_hwpage;
 	size_t			mapped_hwpage_sz;
 
 	struct mpam_garbage	garbage;
 };
 
+/* Returning false here means accesses to mon_sel must fail and report an error. */
+static inline bool __must_check mpam_mon_sel_lock(struct mpam_msc *msc)
+{
+	WARN_ON_ONCE(msc->iface != MPAM_IFACE_MMIO);
+
+	raw_spin_lock_irqsave(&msc->_mon_sel_lock, msc->_mon_sel_flags);
+	return true;
+}
+
+static inline void mpam_mon_sel_unlock(struct mpam_msc *msc)
+{
+	raw_spin_unlock_irqrestore(&msc->_mon_sel_lock, msc->_mon_sel_flags);
+}
+
+static inline void mpam_mon_sel_lock_held(struct mpam_msc *msc)
+{
+	lockdep_assert_held_once(&msc->_mon_sel_lock);
+}
+
+static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
+{
+	raw_spin_lock_init(&msc->_mon_sel_lock);
+}
+
 struct mpam_class {
 	/* mpam_components in this class */
 	struct list_head	components;
-- 
2.43.0


