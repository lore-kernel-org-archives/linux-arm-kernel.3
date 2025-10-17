Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A892ECCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMyhmvIWDzRYuJMXrN+AqVfJ+rFZvWHn6ES4Uqyr6qs=; b=EkWAzNC5nlXgCARAzAdARo1keW
	vDtCJ2+Xwb3vFudwoNzLQoUlVICXEzTQC99MZEZIDJY6EsHNRlXXGzYcmRK00s+xm6rVc/fNwrMXA
	vWwe+ELyvNjndhlUlPs/b7EDKl5Rkz4KYPJh9RFhaGI9zkvdue3cEGjdh21sx8oGgIaPgoGfM1FGB
	UYLoYr8y9z8uAK6xAsbALZMSQLe0GAkUy5AHKQ52TtIIgNxFi9JwtmiyZorOHRBq9W4wGilIaFo0Y
	0eVfncbVC30Kw6mOdZMlE6BWsACd0Qop3drr3Xj8xrxRT1jVDerDdI6cJ/jFbMSN/soDS5szrBHfj
	BiccNK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9peh-00000008kY2-31J2;
	Fri, 17 Oct 2025 18:58:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pef-00000008kUU-2XVM
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 18:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CMyhmvIWDzRYuJMXrN+AqVfJ+rFZvWHn6ES4Uqyr6qs=; b=WwkrP4JpJQPk3zjb2MNj8NuvMf
	aBO2OolcP5HZeQd3vdh/oiWyVab7nkHpVoXSAJq/Ntu+UgIpjhsTUnVy7yy3ElNdu4hrtG8EoD2vc
	uoFMUXT8Iwhib+HnvcnyNHRnz7W7z4QgU+2M4OqE1HH9H1p+nGxIlBW4/kmyELN1kOB/oa5kLBtlG
	2m7qpkbh2worOGg1xmwRel24epF9bhqehctFY4snHOXixa3lD0CE5RnY7ID5R2Q/yfperMfVm+RC+
	Kx1M/sbR7ypD11KhNWERMC3tcjExmkylzY82Mh7qNQ4nlWPPqIYyiLQvsXcIcZHgi5apsrpYV4Llv
	fYVMgFfA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9peU-00000007sY5-2dMp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:58:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEEEE1596;
	Fri, 17 Oct 2025 11:58:01 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABA8B3F66E;
	Fri, 17 Oct 2025 11:58:04 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
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
	David Hildenbrand <david@redhat.com>,
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v3 12/29] arm_mpam: Add helpers for managing the locking around the mon_sel registers
Date: Fri, 17 Oct 2025 18:56:28 +0000
Message-Id: <20251017185645.26604-13-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251017185645.26604-1-james.morse@arm.com>
References: <20251017185645.26604-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_195813_008058_FCA5B7DB 
X-CRM114-Status: GOOD (  19.38  )
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
Signed-off-by: James Morse <james.morse@arm.com>
---
Change since v1:
 * Made accesses to outer_lock_held READ_ONCE() for torn values in the failure
   case.
---
 drivers/resctrl/mpam_devices.c  |  3 ++-
 drivers/resctrl/mpam_internal.h | 38 +++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 910bb6cd5e4f..35011d3e8f1e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -738,6 +738,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 
 	mutex_init(&msc->probe_lock);
 	mutex_init(&msc->part_sel_lock);
+	mpam_mon_sel_lock_init(msc);
 	msc->id = pdev->id;
 	msc->pdev = pdev;
 	INIT_LIST_HEAD_RCU(&msc->all_msc_list);
@@ -822,7 +823,7 @@ static void mpam_enable_once(void)
 				      "mpam:online");
 
 	/* Use printk() to avoid the pr_fmt adding the function name. */
-	printk(KERN_INFO, "MPAM enabled with %u PARTIDs and %u PMGs\n",
+	printk(KERN_INFO "MPAM enabled with %u PARTIDs and %u PMGs\n",
 	       mpam_partid_max + 1, mpam_pmg_max + 1);
 }
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 9c08502e9c76..1afc52b36328 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -67,12 +67,50 @@ struct mpam_msc {
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
2.39.5


