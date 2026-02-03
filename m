Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DC9E8B368
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 21:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6Ma1YlzoRVZg8yK0Dhay8bZrHTYUGXUa2XDudwEeM0=; b=BfCtvMp45ceycpU/7MR4kskHsx
	2tPWDJAfPCh4UkYn4mf+BbG8kEVfBqsewwuHHkh31mTXHhTkA5TFYdyxlOhN/Eh9br5cUgWT88EBu
	pbKQF3H/y8HqXtmLp6/Ps0v6yK0kEDUiga2rW8RSNPrYS91jkMwrj9VTarYG1ndWzZ0U6oSTXFUe0
	+VnnB4oqRlPJgttFZGpy/0klqvxhCvNxC9W3Yo3xp97qXtDO/GcCWCQyk7Xc3cw6n6txEUhHGJafQ
	fQXCI4Ma5APVTpte1St8zU2nojYtx/CBacV9PUkM+PpiOF8Aodl38XzbjhOPDWEKd0LrDMeDhqZGb
	bJFO0pPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOEA-00000007Q2L-1j4F;
	Tue, 03 Feb 2026 21:46:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOE7-00000007PzR-2CjT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 21:46:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EE2E339;
	Tue,  3 Feb 2026 13:46:20 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 784AD3F778;
	Tue,  3 Feb 2026 13:46:21 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v4 25/41] arm_mpam: resctrl: Wait for cacheinfo to be ready
Date: Tue,  3 Feb 2026 21:43:26 +0000
Message-ID: <20260203214342.584712-26-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203214342.584712-1-ben.horgan@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_134627_618877_D85936C7 
X-CRM114-Status: GOOD (  10.97  )
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

In order to calculate the rmid realloc threshold the size of the cache
needs to be known. Cache domains will also be named after the cache id. So
that this information can be extracted from cacheinfo we need to wait for
it to be ready. The cacheinfo information is populated in device_initcall()
so we wait for that.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Signed-off-by: James Morse <james.morse@arm.com>
[horgan: split out from another patch]
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
This is moved into it's own patch to allow all uses of cacheinfo to be
valid when they are introduced.
---
 drivers/resctrl/mpam_resctrl.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index e3a87464f0ac..25950e667077 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -16,6 +16,7 @@
 #include <linux/resctrl.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/wait.h>
 
 #include <asm/mpam.h>
 
@@ -45,6 +46,13 @@ static bool exposed_mon_capable;
  */
 static bool cdp_enabled;
 
+/*
+ * We use cacheinfo to discover the size of the caches and their id. cacheinfo
+ * populates this from a device_initcall(). mpam_resctrl_setup() must wait.
+ */
+static bool cacheinfo_ready;
+static DECLARE_WAIT_QUEUE_HEAD(wait_cacheinfo_ready);
+
 bool resctrl_arch_alloc_capable(void)
 {
 	return exposed_alloc_capable;
@@ -770,6 +778,8 @@ int mpam_resctrl_setup(void)
 	struct mpam_resctrl_res *res;
 	enum resctrl_res_level rid;
 
+	wait_event(wait_cacheinfo_ready, cacheinfo_ready);
+
 	cpus_read_lock();
 	for_each_mpam_resctrl_control(res, rid) {
 		INIT_LIST_HEAD_RCU(&res->resctrl_res.ctrl_domains);
@@ -809,6 +819,15 @@ int mpam_resctrl_setup(void)
 	return 0;
 }
 
+static int __init __cacheinfo_ready(void)
+{
+	cacheinfo_ready = true;
+	wake_up(&wait_cacheinfo_ready);
+
+	return 0;
+}
+device_initcall_sync(__cacheinfo_ready);
+
 #ifdef CONFIG_MPAM_KUNIT_TEST
 #include "test_mpam_resctrl.c"
 #endif
-- 
2.43.0


