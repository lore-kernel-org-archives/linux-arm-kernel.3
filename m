Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B38CCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9LTGTdebf2Z74TNJZlBC1hR543XUXQ/o43OKEKJZpc=; b=zL2kl6nZVOoCll1dr31d0a281Y
	s6V2OGrcXmn9QCpy+FhfRM9spKZvYwQCgvo0kFCLomgA8liGyjIk9XuK8BIZ/TOMGtimaYa8x/kBY
	7nTwmKWxd1NCKtYGXMWZ++d0OFxIGP+C86m8pgnCcVTbl8d59Ns+Jss9n029J4zm8uj0f5XcqNi8U
	51KIzXMyqc+v2/aOnutt1L6DJ9uqbuum+tFQYaiZUL46Hlo+EIE1PH6otciOEPuaTVlRK10csne15
	WEkblAIr4lHO5pZeVRKGvJ/Ouhligft8cv1046kaSaWhdsm5zYtVYB33X4L2rmtyu2S5qIv88UdWH
	scILUdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphtS-000000049af-24sv;
	Sat, 23 Aug 2025 06:38:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upToc-000000034Zy-34SJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:36:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCFA415A1;
	Fri, 22 Aug 2025 08:36:19 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEDE13F63F;
	Fri, 22 Aug 2025 08:36:22 -0700 (PDT)
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
Subject: [PATCH 23/33] arm_mpam: Use a static key to indicate when mpam is enabled
Date: Fri, 22 Aug 2025 15:30:38 +0000
Message-Id: <20250822153048.2287-58-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250822153048.2287-1-james.morse@arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_083630_857752_EFD54A54 
X-CRM114-Status: GOOD (  16.21  )
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
 drivers/resctrl/mpam_devices.c  | 8 ++++++++
 drivers/resctrl/mpam_internal.h | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 210d64fad0b1..b424af666b1e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -33,6 +33,8 @@
 
 #include "mpam_internal.h"
 
+DEFINE_STATIC_KEY_FALSE(mpam_enabled); /* TODO: move to arch code */
+
 /*
  * mpam_list_lock protects the SRCU lists when writing. Once the
  * mpam_enabled key is enabled these lists are read-only,
@@ -1039,6 +1041,9 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
 	struct mpam_msc *msc;
 	bool new_device_probed = false;
 
+	if (mpam_is_enabled())
+		return 0;
+
 	mutex_lock(&mpam_list_lock);
 	list_for_each_entry(msc, &mpam_all_msc, glbl_list) {
 		if (!cpumask_test_cpu(cpu, &msc->accessibility))
@@ -1835,6 +1840,7 @@ static void mpam_enable_once(void)
 		return;
 	}
 
+	static_branch_enable(&mpam_enabled);
 	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline);
 
 	printk(KERN_INFO "MPAM enabled with %u partid and %u pmg\n",
@@ -1902,6 +1908,8 @@ static irqreturn_t mpam_disable_thread(int irq, void *dev_id)
 	}
 	mutex_unlock(&mpam_cpuhp_state_lock);
 
+	static_branch_disable(&mpam_enabled);
+
 	mpam_unregister_irqs();
 
 	idx = srcu_read_lock(&mpam_srcu);
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index c9418c9cf9f2..3476ee97f8ac 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
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
2.20.1


