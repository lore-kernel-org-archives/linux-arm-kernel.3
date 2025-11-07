Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EFFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 12:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOASq/xRmJG4w37u8sSip9cvW9Vh15hl8kuedP4yA0s=; b=s0V5SFer4bTKJxlYOisccr2ZOO
	NmIDaGAw6ImH+YXlT95i4QlGoa3IDmYC5F+y9SnGSy0C73W5QThKFIN8VPdYdoSSG8ldLqvyyUo/t
	TOcKx0jVfjwaJYefVetQiQfWBWA2EysosOmK1yitseYJoz/cMOuYzDNWeL4jTDcXpzP4hKSsk9y4F
	Gw6P9DAGPXeojyn/qBQQJX2QgSlQCmbjrOzxhFQ5Ttjz0QmShdz473xli7ROmx1iM5O+DGmhM5zXY
	tXQ/LQ0T+6eWH3LKIIbu6wmqWYcbGCAipECc5KFJjR46pGduxy+tBsjlguWLtiL60Z8L7+e0CTm5s
	IPr3zE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLiR-0000000HK0N-3ZJG;
	Fri, 07 Nov 2025 12:37:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLiO-0000000HJwV-2iLO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 12:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wOASq/xRmJG4w37u8sSip9cvW9Vh15hl8kuedP4yA0s=; b=cBi7QDsnSiaPDbzNanokbMISaW
	7zyJmq1BWh8LzQ2DLv46tmztd4Y1c1MXytgde7iiNVH/At7Mn8dBzmGvS+ayv+8RT+JT5UsAaHC0R
	NTkYedys1L7tPwy3bpc9j3BC9bYp+Tl6WJWwHtXH40fqh+3eVC7aw6fTdhLqMqfpLbgHexfu2dZ8H
	zNSpeUrDXJC0/njraBcAjrSzmQUSrq82zlUjy+OlqIK61uN8yhrOGbQKGkwR9gtNvpVScRCyKEyIM
	jRhroNZYje4+DgM3lJeWGHzlSXeQjycu11F5spTdIbBbZEKNWJ62xAtzyu0DuNFN7JxLy5ws3lCyn
	Iq6r0CoA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKqe-00000006OAT-40dc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 11:41:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F41681A2D;
	Fri,  7 Nov 2025 04:37:04 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC7B63F66E;
	Fri,  7 Nov 2025 04:37:07 -0800 (PST)
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
	Ben Horgan <ben.horgan@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH 20/33] arm_mpam: Extend reset logic to allow devices to be reset any time
Date: Fri,  7 Nov 2025 12:34:37 +0000
Message-ID: <20251107123450.664001-21-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107123450.664001-1-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_114145_385827_557E24BF 
X-CRM114-Status: GOOD (  13.81  )
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

cpuhp callbacks aren't the only time the MSC configuration may need to
be reset. Resctrl has an API call to reset a class.
If an MPAM error interrupt arrives it indicates the driver has
misprogrammed an MSC. The safest thing to do is reset all the MSCs
and disable MPAM.

Add a helper to reset RIS via their class. Call this from mpam_disable(),
which can be scheduled from the error interrupt handler.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 57 ++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index bcdf4fbc3941..a8efd3e02c62 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -809,15 +809,13 @@ static void mpam_reset_ris_partid(struct mpam_msc_ris *ris, u16 partid)
 
 /*
  * Called via smp_call_on_cpu() to prevent migration, while still being
- * pre-emptible.
+ * pre-emptible. Caller must hold mpam_srcu.
  */
 static int mpam_reset_ris(void *arg)
 {
 	u16 partid, partid_max;
 	struct mpam_msc_ris *ris = arg;
 
-	WARN_ON_ONCE(!srcu_read_lock_held((&mpam_srcu)));
-
 	if (ris->in_reset_state)
 		return 0;
 
@@ -1341,8 +1339,55 @@ static void mpam_enable_once(void)
 	       mpam_partid_max + 1, mpam_pmg_max + 1);
 }
 
+static void mpam_reset_component_locked(struct mpam_component *comp)
+{
+	struct mpam_vmsc *vmsc;
+
+	lockdep_assert_cpus_held();
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(vmsc, &comp->vmsc, comp_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		struct mpam_msc *msc = vmsc->msc;
+		struct mpam_msc_ris *ris;
+
+		list_for_each_entry_srcu(ris, &vmsc->ris, vmsc_list,
+					 srcu_read_lock_held(&mpam_srcu)) {
+			if (!ris->in_reset_state)
+				mpam_touch_msc(msc, mpam_reset_ris, ris);
+			ris->in_reset_state = true;
+		}
+	}
+}
+
+static void mpam_reset_class_locked(struct mpam_class *class)
+{
+	struct mpam_component *comp;
+
+	lockdep_assert_cpus_held();
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(comp, &class->components, class_list,
+				 srcu_read_lock_held(&mpam_srcu))
+		mpam_reset_component_locked(comp);
+}
+
+static void mpam_reset_class(struct mpam_class *class)
+{
+	cpus_read_lock();
+	mpam_reset_class_locked(class);
+	cpus_read_unlock();
+}
+
+/*
+ * Called in response to an error IRQ.
+ * All of MPAMs errors indicate a software bug, restore any modified
+ * controls to their reset values.
+ */
 void mpam_disable(struct work_struct *ignored)
 {
+	int idx;
+	struct mpam_class *class;
 	struct mpam_msc *msc, *tmp;
 
 	mutex_lock(&mpam_cpuhp_state_lock);
@@ -1352,6 +1397,12 @@ void mpam_disable(struct work_struct *ignored)
 	}
 	mutex_unlock(&mpam_cpuhp_state_lock);
 
+	idx = srcu_read_lock(&mpam_srcu);
+	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
+				 srcu_read_lock_held(&mpam_srcu))
+		mpam_reset_class(class);
+	srcu_read_unlock(&mpam_srcu, idx);
+
 	mutex_lock(&mpam_list_lock);
 	list_for_each_entry_safe(msc, tmp, &mpam_all_msc, all_msc_list)
 		mpam_msc_destroy(msc);
-- 
2.43.0


