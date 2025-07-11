Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412B3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 19:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gnlKZn2MKKSgxQn/OB9iUvsGe9B4wkwMOydAt9PZ+4=; b=TuBy/YyQnI/W96mx1ASq2IdFUD
	g3INNgJ9e7GGQ3PbjP8MwrWVW7rhwi8ApR1A9v2jPR4uSiQ22D7wTlAvDvLTE/VJFKakdhoBCutpv
	VIAFr7dfbugakY22MkqliR9lNtf2Xyr8TZ6smcMsGeg6p8Hh1jxSjxdTeSfsJHsp68yZogw+/h/Va
	jTBSCJXjxbSoKJGY5KmHrbgb0qWXzDr245nzSqZpUiGL3fsrPi0Pa4pAenD08n7cRh2M+MmG7GA4S
	GJ6bxnakKvEdInPZVCWX9kQq9ShGHy/qWUk/rz3KsmZQU7E2mzRZWec+Hzz+YVDP8ppYvJb99wCpo
	zga8SUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJiO-0000000FgmO-0QEE;
	Fri, 11 Jul 2025 19:47:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIdh-0000000FXXV-1kvS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:38:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92C0116F8;
	Fri, 11 Jul 2025 11:38:18 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A2553F694;
	Fri, 11 Jul 2025 11:38:25 -0700 (PDT)
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
Subject: [RFC PATCH 26/36] arm_mpam: Use a static key to indicate when mpam is enabled
Date: Fri, 11 Jul 2025 18:36:38 +0000
Message-Id: <20250711183648.30766-27-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250711183648.30766-1-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113829_585651_EE3CEC95 
X-CRM114-Status: GOOD (  15.82  )
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

Once all the MSC have been probed, the system wide usable number of
PARTID is known and the configuration arrays can be allocated.

After this point, checking all the MSC have been probed is pointless,
and the cpuhp callbacks should restore the configuration, instead of
just resetting the MSC.

Add a static key to enable this behaviour. This will also allow MPAM
to be disabled in repsonse to an error, and the architecture code to
enable/disable the context switch of the MPAM system registers.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/platform/arm64/mpam/mpam_devices.c  | 8 ++++++++
 drivers/platform/arm64/mpam/mpam_internal.h | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index af19cc25d16e..bb3695eb84e9 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -33,6 +33,8 @@
 
 #include "mpam_internal.h"
 
+DEFINE_STATIC_KEY_FALSE(mpam_enabled); /* TODO: move to arch code */
+
 /*
  * mpam_list_lock protects the SRCU lists when writing. Once the
  * mpam_enabled key is enabled these lists are read-only,
@@ -1037,6 +1039,9 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
 	struct mpam_msc *msc;
 	bool new_device_probed = false;
 
+	if (mpam_is_enabled())
+		return 0;
+
 	mutex_lock(&mpam_list_lock);
 	list_for_each_entry(msc, &mpam_all_msc, glbl_list) {
 		if (!cpumask_test_cpu(cpu, &msc->accessibility))
@@ -1839,6 +1844,7 @@ static void mpam_enable_once(void)
 	partid_max_published = true;
 	spin_unlock(&partid_max_lock);
 
+	static_branch_enable(&mpam_enabled);
 	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline);
 
 	printk(KERN_INFO "MPAM enabled with %u partid and %u pmg\n",
@@ -1906,6 +1912,8 @@ static irqreturn_t mpam_disable_thread(int irq, void *dev_id)
 	}
 	mutex_unlock(&mpam_cpuhp_state_lock);
 
+	static_branch_disable(&mpam_enabled);
+
 	mpam_unregister_irqs();
 
 	idx = srcu_read_lock(&mpam_srcu);
diff --git a/drivers/platform/arm64/mpam/mpam_internal.h b/drivers/platform/arm64/mpam/mpam_internal.h
index e1c6a2676b54..1a24424b48df 100644
--- a/drivers/platform/arm64/mpam/mpam_internal.h
+++ b/drivers/platform/arm64/mpam/mpam_internal.h
@@ -8,6 +8,7 @@
 #include <linux/atomic.h>
 #include <linux/cpumask.h>
 #include <linux/io.h>
+#include <linux/jump_label.h>
 #include <linux/llist.h>
 #include <linux/mailbox_client.h>
 #include <linux/mutex.h>
@@ -15,6 +16,13 @@
 #include <linux/sizes.h>
 #include <linux/srcu.h>
 
+DECLARE_STATIC_KEY_FALSE(mpam_enabled);
+
+static inline bool mpam_is_enabled(void)
+{
+	return static_branch_likely(&mpam_enabled);
+}
+
 /*
  * Structures protected by SRCU may not be freed for a surprising amount of
  * time (especially if perf is running). To ensure the MPAM error interrupt can
-- 
2.39.5


