Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7FBCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 20:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQkEjtcB2KL2vimsqVvfMf8il9vTEdSI/Y6Ie5OxPSY=; b=LFY0qkdg3kHTdsa2/RIzcUAllD
	Do9/TGioxCGf7Fhk2ncdFrYMMVIDWDHqRGs3K9aRBJmYI2lJu0CFGCv8T2lBKbLjKtJFFwRaFI7AE
	7gyoB9YfnghLIPthsuCxkj3ckGNiNF2cCQxfPtyBFFNQzzawlijNEM581/5q11DrTjaCDUD1cD8bw
	n6hWPs2r9b7hJKW/GRuX+L6HzymndPyThxWghRrZHi4mgPydHTSG03FbaJ2i9w4VZzjN+ztGko5EK
	ENIsCm4YbQty0wIrZFGIbVOFP799iKMkzHwqqthGIZ0XVP8HSR1rHLMEMwRR22YYhUcmL+/T9+I/O
	jR9QRzsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRg8-0000000GdQc-3rcc;
	Wed, 10 Sep 2025 20:44:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRg1-0000000GdGt-350L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 20:44:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B994F153B;
	Wed, 10 Sep 2025 13:44:16 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71C0D3F63F;
	Wed, 10 Sep 2025 13:44:20 -0700 (PDT)
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
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 11/29] arm_mpam: Probe hardware to find the supported partid/pmg values
Date: Wed, 10 Sep 2025 20:42:51 +0000
Message-Id: <20250910204309.20751-12-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250910204309.20751-1-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_134425_924898_D28B4BBB 
X-CRM114-Status: GOOD (  26.94  )
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

CPUs can generate traffic with a range of PARTID and PMG values,
but each MSC may also have its own maximum size for these fields.
Before MPAM can be used, the driver needs to probe each RIS on
each MSC, to find the system-wide smallest value that can be used.
The limits from requestors (e.g. CPUs) also need taking into account.

While doing this, RIS entries that firmware didn't describe are created
under MPAM_CLASS_UNKNOWN.

While we're here, implement the mpam_register_requestor() call
for the arch code to register the CPU limits. Future callers of this
will tell us about the SMMU and ITS.

Signed-off-by: James Morse <james.morse@arm.com>
---
Changes since v1:
 * Change to lock ordering now that the list-lock mutex isn't held from
   the cpuhp call.
 * Removed irq-unmaksed assert in requestor register.
 * Changed captialisation in print message.
---
 drivers/resctrl/mpam_devices.c  | 150 +++++++++++++++++++++++++++++++-
 drivers/resctrl/mpam_internal.h |   6 ++
 include/linux/arm_mpam.h        |  14 +++
 3 files changed, 169 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c265376d936b..24dc81c15ec8 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -6,6 +6,7 @@
 #include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/arm_mpam.h>
+#include <linux/bitfield.h>
 #include <linux/cacheinfo.h>
 #include <linux/cpu.h>
 #include <linux/cpumask.h>
@@ -43,6 +44,15 @@ static atomic_t mpam_num_msc;
 static int mpam_cpuhp_state;
 static DEFINE_MUTEX(mpam_cpuhp_state_lock);
 
+/*
+ * The smallest common values for any CPU or MSC in the system.
+ * Generating traffic outside this range will result in screaming interrupts.
+ */
+u16 mpam_partid_max;
+u8 mpam_pmg_max;
+static bool partid_max_init, partid_max_published;
+static DEFINE_SPINLOCK(partid_max_lock);
+
 /*
  * mpam is enabled once all devices have been probed from CPU online callbacks,
  * scheduled via this work_struct. If access to an MSC depends on a CPU that
@@ -113,6 +123,72 @@ static inline u32 _mpam_read_partsel_reg(struct mpam_msc *msc, u16 reg)
 
 #define mpam_read_partsel_reg(msc, reg)        _mpam_read_partsel_reg(msc, MPAMF_##reg)
 
+static void __mpam_write_reg(struct mpam_msc *msc, u16 reg, u32 val)
+{
+	WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);
+	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
+
+	writel_relaxed(val, msc->mapped_hwpage + reg);
+}
+
+static inline void _mpam_write_partsel_reg(struct mpam_msc *msc, u16 reg, u32 val)
+{
+	lockdep_assert_held_once(&msc->part_sel_lock);
+	__mpam_write_reg(msc, reg, val);
+}
+#define mpam_write_partsel_reg(msc, reg, val)  _mpam_write_partsel_reg(msc, MPAMCFG_##reg, val)
+
+static u64 mpam_msc_read_idr(struct mpam_msc *msc)
+{
+	u64 idr_high = 0, idr_low;
+
+	lockdep_assert_held(&msc->part_sel_lock);
+
+	idr_low = mpam_read_partsel_reg(msc, IDR);
+	if (FIELD_GET(MPAMF_IDR_EXT, idr_low))
+		idr_high = mpam_read_partsel_reg(msc, IDR + 4);
+
+	return (idr_high << 32) | idr_low;
+}
+
+static void __mpam_part_sel_raw(u32 partsel, struct mpam_msc *msc)
+{
+	lockdep_assert_held(&msc->part_sel_lock);
+
+	mpam_write_partsel_reg(msc, PART_SEL, partsel);
+}
+
+static void __mpam_part_sel(u8 ris_idx, u16 partid, struct mpam_msc *msc)
+{
+	u32 partsel = FIELD_PREP(MPAMCFG_PART_SEL_RIS, ris_idx) |
+		      FIELD_PREP(MPAMCFG_PART_SEL_PARTID_SEL, partid);
+
+	__mpam_part_sel_raw(partsel, msc);
+}
+
+int mpam_register_requestor(u16 partid_max, u8 pmg_max)
+{
+	int err = 0;
+
+	spin_lock(&partid_max_lock);
+	if (!partid_max_init) {
+		mpam_partid_max = partid_max;
+		mpam_pmg_max = pmg_max;
+		partid_max_init = true;
+	} else if (!partid_max_published) {
+		mpam_partid_max = min(mpam_partid_max, partid_max);
+		mpam_pmg_max = min(mpam_pmg_max, pmg_max);
+	} else {
+		/* New requestors can't lower the values */
+		if (partid_max < mpam_partid_max || pmg_max < mpam_pmg_max)
+			err = -EBUSY;
+	}
+	spin_unlock(&partid_max_lock);
+
+	return err;
+}
+EXPORT_SYMBOL(mpam_register_requestor);
+
 #define init_garbage(x)	init_llist_node(&(x)->garbage.llist)
 
 static struct mpam_vmsc *
@@ -451,6 +527,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 	cpumask_or(&comp->affinity, &comp->affinity, &ris->affinity);
 	cpumask_or(&class->affinity, &class->affinity, &ris->affinity);
 	list_add_rcu(&ris->vmsc_list, &vmsc->ris);
+	list_add_rcu(&ris->msc_list, &msc->ris);
 
 	return 0;
 }
@@ -470,9 +547,37 @@ int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
 	return err;
 }
 
+static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
+						   u8 ris_idx)
+{
+	int err;
+	struct mpam_msc_ris *ris, *found = ERR_PTR(-ENOENT);
+
+	lockdep_assert_held(&mpam_list_lock);
+
+	if (!test_bit(ris_idx, &msc->ris_idxs)) {
+		err = mpam_ris_create_locked(msc, ris_idx, MPAM_CLASS_UNKNOWN,
+					     0, 0);
+		if (err)
+			return ERR_PTR(err);
+	}
+
+	list_for_each_entry(ris, &msc->ris, msc_list) {
+		if (ris->ris_idx == ris_idx) {
+			found = ris;
+			break;
+		}
+	}
+
+	return found;
+}
+
 static int mpam_msc_hw_probe(struct mpam_msc *msc)
 {
 	u64 idr;
+	u16 partid_max;
+	u8 ris_idx, pmg_max;
+	struct mpam_msc_ris *ris;
 	struct device *dev = &msc->pdev->dev;
 
 	lockdep_assert_held(&msc->probe_lock);
@@ -483,6 +588,39 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 		return -EIO;
 	}
 
+	/* Grab an IDR value to find out how many RIS there are */
+	mutex_lock(&msc->part_sel_lock);
+	idr = mpam_msc_read_idr(msc);
+	mutex_unlock(&msc->part_sel_lock);
+	msc->ris_max = FIELD_GET(MPAMF_IDR_RIS_MAX, idr);
+
+	/* Use these values so partid/pmg always starts with a valid value */
+	msc->partid_max = FIELD_GET(MPAMF_IDR_PARTID_MAX, idr);
+	msc->pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
+
+	for (ris_idx = 0; ris_idx <= msc->ris_max; ris_idx++) {
+		mutex_lock(&msc->part_sel_lock);
+		__mpam_part_sel(ris_idx, 0, msc);
+		idr = mpam_msc_read_idr(msc);
+		mutex_unlock(&msc->part_sel_lock);
+
+		partid_max = FIELD_GET(MPAMF_IDR_PARTID_MAX, idr);
+		pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
+		msc->partid_max = min(msc->partid_max, partid_max);
+		msc->pmg_max = min(msc->pmg_max, pmg_max);
+
+		mutex_lock(&mpam_list_lock);
+		ris = mpam_get_or_create_ris(msc, ris_idx);
+		mutex_unlock(&mpam_list_lock);
+		if (IS_ERR(ris))
+			return PTR_ERR(ris);
+	}
+
+	spin_lock(&partid_max_lock);
+	mpam_partid_max = min(mpam_partid_max, msc->partid_max);
+	mpam_pmg_max = min(mpam_pmg_max, msc->pmg_max);
+	spin_unlock(&partid_max_lock);
+
 	msc->probed = true;
 
 	return 0;
@@ -675,9 +813,18 @@ static struct platform_driver mpam_msc_driver = {
 
 static void mpam_enable_once(void)
 {
+	/*
+	 * Once the cpuhp callbacks have been changed, mpam_partid_max can no
+	 * longer change.
+	 */
+	spin_lock(&partid_max_lock);
+	partid_max_published = true;
+	spin_unlock(&partid_max_lock);
+
 	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline);
 
-	pr_info("MPAM enabled\n");
+	printk(KERN_INFO "MPAM enabled with %u PARTIDs and %u PMGs\n",
+	       mpam_partid_max + 1, mpam_pmg_max + 1);
 }
 
 void mpam_disable(struct work_struct *ignored)
@@ -744,4 +891,5 @@ static int __init mpam_msc_driver_init(void)
 
 	return platform_driver_register(&mpam_msc_driver);
 }
+/* Must occur after arm64_mpam_register_cpus() from arch_initcall() */
 subsys_initcall(mpam_msc_driver_init);
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index d4f3febc7a50..828ce93c95d5 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -52,6 +52,8 @@ struct mpam_msc {
 	 */
 	struct mutex		probe_lock;
 	bool			probed;
+	u16			partid_max;
+	u8			pmg_max;
 	unsigned long		ris_idxs;
 	u32			ris_max;
 
@@ -150,6 +152,10 @@ struct mpam_msc_ris {
 extern struct srcu_struct mpam_srcu;
 extern struct list_head mpam_classes;
 
+/* System wide partid/pmg values */
+extern u16 mpam_partid_max;
+extern u8 mpam_pmg_max;
+
 /* Scheduled work callback to enable mpam once all MSC have been probed */
 void mpam_enable(struct work_struct *work);
 void mpam_disable(struct work_struct *work);
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index 3206f5ddc147..cb6e6cfbea0b 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -41,4 +41,18 @@ static inline int acpi_mpam_count_msc(void) { return -EINVAL; }
 int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
 		    enum mpam_class_types type, u8 class_id, int component_id);
 
+/**
+ * mpam_register_requestor() - Register a requestor with the MPAM driver
+ * @partid_max:		The maximum PARTID value the requestor can generate.
+ * @pmg_max:		The maximum PMG value the requestor can generate.
+ *
+ * Registers a requestor with the MPAM driver to ensure the chosen system-wide
+ * minimum PARTID and PMG values will allow the requestors features to be used.
+ *
+ * Returns an error if the registration is too late, and a larger PARTID/PMG
+ * value has been advertised to user-space. In this case the requestor should
+ * not use its MPAM features. Returns 0 on success.
+ */
+int mpam_register_requestor(u16 partid_max, u8 pmg_max);
+
 #endif /* __LINUX_ARM_MPAM_H */
-- 
2.39.5


