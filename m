Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329C4CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AN47CLJrDYmcOd4kcA9HqP9mNmMVvGZvoBg7mfHedg=; b=OA2Adi2uuMeKp+wVLsNiIS4vKP
	UfqOVHj8Zl4RtG61Fi5y3INk31DR2IqlbVtveqpaW6F7uYcR3iqP7GGewjHglYC6O+wOFct1psYAI
	C650pg7CSvaavqIIh4SBkZZQU9CnhIYSL8MUTqrgZwWRUUyBKHwPdMJWEtYIbwTTax/dlt8lwURUY
	cE2PjWRmLQYjkxWW5erahRMPW6tmtZCHSY/ofZ0bDyLzRz0sCawjWPtcKodm8zbNFqjgS59Lqh+D2
	j46x29kFjSWe5Z8QgJ+RYIGuumv/yg4RXB9sYGqwsajY8f42sLYI2yQo6G+ngAE+2m3z8dxE57O7h
	T6VrTGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLiI-0000000HJqF-259c;
	Fri, 07 Nov 2025 12:37:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLiE-0000000HJnM-2Wit
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 12:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6AN47CLJrDYmcOd4kcA9HqP9mNmMVvGZvoBg7mfHedg=; b=L3QLQ/WaizmyIw6qUTZDS3Plk9
	hlzGOAC3pltMqtjMWtWkTI49RyOGAVtDCexOZ7IBZiAfSRXD+i9uWX7182ikjXUkT4rP9WthVmc8W
	MuQ9rh7W1YG6/uB/LhrSavbPn94TGeZCpUyIzAm+E7lUcw5jQne+gDQnkN8NFnTPiXuTB3sZR0gX7
	+kjCf6v9kcxM6AGyww/U/aLYU/zTdzJ+Q/9gBoFRVO4q/C+Bf6e4Nq2IvSHjEhkeW6gxIZMuexHak
	EQmSjrr+cyFInmHmbgNCrsX/+BE61I+IlnvrwCFRfoGGXv/+f2icZHL1wrco8eF3U1EsJo6UF6ZZT
	osrtJsvg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKqV-00000006O72-019L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 11:41:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CE261BCB;
	Fri,  7 Nov 2025 04:36:54 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 491443F66E;
	Fri,  7 Nov 2025 04:36:57 -0800 (PST)
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
	Rohit Mathew <Rohit.Mathew@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH 18/33] arm_mpam: Reset MSC controls from cpuhp callbacks
Date: Fri,  7 Nov 2025 12:34:35 +0000
Message-ID: <20251107123450.664001-19-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107123450.664001-1-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_114135_393516_A0AB4C9F 
X-CRM114-Status: GOOD (  19.46  )
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

When a CPU comes online, it may bring a newly accessible MSC with
it. Only the default partid has its value reset by hardware, and
even then the MSC might not have been reset since its config was
previously dirtied. e.g. Kexec.

Any in-use partid must have its configuration restored, or reset.
In-use partids may be held in caches and evicted later.

MSC are also reset when CPUs are taken offline to cover cases where
firmware doesn't reset the MSC over reboot using UEFI, or kexec
where there is no firmware involvement.

If the configuration for a RIS has not been touched since it was
brought online, it does not need resetting again.

To reset, write the maximum values for all discovered controls.

CC: Rohit Mathew <Rohit.Mathew@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v3:
Add tags - thanks!
---
 drivers/resctrl/mpam_devices.c  | 109 ++++++++++++++++++++++++++++++++
 drivers/resctrl/mpam_internal.h |   3 +
 2 files changed, 112 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 7c02b918fa0f..6a01247317b7 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -7,6 +7,7 @@
 #include <linux/atomic.h>
 #include <linux/arm_mpam.h>
 #include <linux/bitfield.h>
+#include <linux/bitmap.h>
 #include <linux/cacheinfo.h>
 #include <linux/cpu.h>
 #include <linux/cpumask.h>
@@ -753,8 +754,104 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 	return 0;
 }
 
+static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
+{
+	u32 num_words, msb;
+	u32 bm = ~0;
+	int i;
+
+	lockdep_assert_held(&msc->part_sel_lock);
+
+	if (wd == 0)
+		return;
+
+	/*
+	 * Write all ~0 to all but the last 32bit-word, which may
+	 * have fewer bits...
+	 */
+	num_words = DIV_ROUND_UP(wd, 32);
+	for (i = 0; i < num_words - 1; i++, reg += sizeof(bm))
+		__mpam_write_reg(msc, reg, bm);
+
+	/*
+	 * ....and then the last (maybe) partial 32bit word. When wd is a
+	 * multiple of 32, msb should be 31 to write a full 32bit word.
+	 */
+	msb = (wd - 1) % 32;
+	bm = GENMASK(msb, 0);
+	__mpam_write_reg(msc, reg, bm);
+}
+
+static void mpam_reset_ris_partid(struct mpam_msc_ris *ris, u16 partid)
+{
+	struct mpam_msc *msc = ris->vmsc->msc;
+	struct mpam_props *rprops = &ris->props;
+
+	WARN_ON_ONCE(!srcu_read_lock_held((&mpam_srcu)));
+
+	mutex_lock(&msc->part_sel_lock);
+	__mpam_part_sel(ris->ris_idx, partid, msc);
+
+	if (mpam_has_feature(mpam_feat_cpor_part, rprops))
+		mpam_reset_msc_bitmap(msc, MPAMCFG_CPBM, rprops->cpbm_wd);
+
+	if (mpam_has_feature(mpam_feat_mbw_part, rprops))
+		mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops->mbw_pbm_bits);
+
+	if (mpam_has_feature(mpam_feat_mbw_min, rprops))
+		mpam_write_partsel_reg(msc, MBW_MIN, 0);
+
+	if (mpam_has_feature(mpam_feat_mbw_max, rprops))
+		mpam_write_partsel_reg(msc, MBW_MAX, MPAMCFG_MBW_MAX_MAX);
+
+	mutex_unlock(&msc->part_sel_lock);
+}
+
+static void mpam_reset_ris(struct mpam_msc_ris *ris)
+{
+	u16 partid, partid_max;
+
+	WARN_ON_ONCE(!srcu_read_lock_held((&mpam_srcu)));
+
+	if (ris->in_reset_state)
+		return;
+
+	spin_lock(&partid_max_lock);
+	partid_max = mpam_partid_max;
+	spin_unlock(&partid_max_lock);
+	for (partid = 0; partid <= partid_max; partid++)
+		mpam_reset_ris_partid(ris, partid);
+}
+
+static void mpam_reset_msc(struct mpam_msc *msc, bool online)
+{
+	struct mpam_msc_ris *ris;
+
+	list_for_each_entry_srcu(ris, &msc->ris, msc_list, srcu_read_lock_held(&mpam_srcu)) {
+		mpam_reset_ris(ris);
+
+		/*
+		 * Set in_reset_state when coming online. The reset state
+		 * for non-zero partid may be lost while the CPUs are offline.
+		 */
+		ris->in_reset_state = online;
+	}
+}
+
 static int mpam_cpu_online(unsigned int cpu)
 {
+	struct mpam_msc *msc;
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		if (!cpumask_test_cpu(cpu, &msc->accessibility))
+			continue;
+
+		if (atomic_fetch_inc(&msc->online_refs) == 0)
+			mpam_reset_msc(msc, true);
+	}
+
 	return 0;
 }
 
@@ -793,6 +890,18 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
 
 static int mpam_cpu_offline(unsigned int cpu)
 {
+	struct mpam_msc *msc;
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		if (!cpumask_test_cpu(cpu, &msc->accessibility))
+			continue;
+
+		if (atomic_dec_and_test(&msc->online_refs))
+			mpam_reset_msc(msc, false);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1a95b2897ac1..1ad62f13bfb3 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -5,6 +5,7 @@
 #define MPAM_INTERNAL_H
 
 #include <linux/arm_mpam.h>
+#include <linux/atomic.h>
 #include <linux/bitmap.h>
 #include <linux/cpumask.h>
 #include <linux/io.h>
@@ -45,6 +46,7 @@ struct mpam_msc {
 	enum mpam_msc_iface	iface;
 	u32			nrdy_usec;
 	cpumask_t		accessibility;
+	atomic_t		online_refs;
 
 	/*
 	 * probe_lock is only taken during discovery. After discovery these
@@ -196,6 +198,7 @@ struct mpam_msc_ris {
 	u8			ris_idx;
 	u64			idr;
 	struct mpam_props	props;
+	bool			in_reset_state;
 
 	cpumask_t		affinity;
 
-- 
2.43.0


