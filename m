Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5153BC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIHv27FelkoCdY23L+zoRCxdo2m98WIDi578UXcHqno=; b=eSoq541+Nx/bdLXzTiwpLAmcAl
	GiR/p/zEx0jPxqB61qufHVF3m8N/EY/KdIZD/a06fZsvlmBg6Kxkf9Lrkd3Gg35UnPlAVVFW0lAUc
	dGWaVKtEMlgmyV7o2Ia3+GVPJbr+bA+LazlCLDtttfuOqyTuPz8oBvNB0gc1t/d1TG3ky8KLhSv+j
	lKDmAkrwUc4dVrfTJLRyFqaHxp7CWh7KgWYgpIK9Z7FPW1uDcZP0Cl7cLo4IXicq0lkJ5p6Y9pPbV
	p4pJErKUegtTyCjpq6ZwhaUE6Cd6YRBDxjhV0or4U4sEx1dTH0TFfZQNu5awJk3uTOSdNc1Jc4Krd
	W8AxCU7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1truVv-00000004vTB-11NJ;
	Tue, 11 Mar 2025 07:58:59 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1truP8-00000004uR5-3U3Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 07:52:00 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZBm7h0CXBz2RTR0;
	Tue, 11 Mar 2025 15:47:28 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 27B0F1402CD;
	Tue, 11 Mar 2025 15:51:48 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 11 Mar 2025 15:51:47 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>, <sshegde@linux.ibm.com>
Subject: [PATCH v12 2/4] arch_topology: Support SMT control for OF based system
Date: Tue, 11 Mar 2025 15:51:41 +0800
Message-ID: <20250311075143.61078-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250311075143.61078-1-yangyicong@huawei.com>
References: <20250311075143.61078-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_005159_181128_0DC68E77 
X-CRM114-Status: GOOD (  15.58  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

On building the topology from the devicetree, we've already gotten the
SMT thread number of each core. Update the largest SMT thread number
and enable the SMT control by the end of topology parsing.

The framework's SMT control provides two interface to the users [1]
through /sys/devices/system/cpu/smt/control:
1) enable SMT by writing "on" and disable by "off"
2) enable SMT by writing max_thread_number or disable by writing 1

Both method support to completely disable/enable the SMT cores so both
work correctly for symmetric SMT platform and asymmetric platform with
non-SMT and one type SMT cores like:
core A: 1 thread
core B: X (X!=1) threads

Note that for a theoretically possible multiple SMT-X (X>1) core
platform the SMT control is also supported as expected but only
by writing the "on/off" method.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
Reviewed-by: Pierre Gondois <pierre.gondois@arm.com>
Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/base/arch_topology.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 3ebe77566788..d409d323ee64 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -11,6 +11,7 @@
 #include <linux/cleanup.h>
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
+#include <linux/cpu_smt.h>
 #include <linux/device.h>
 #include <linux/of.h>
 #include <linux/slab.h>
@@ -506,6 +507,10 @@ core_initcall(free_raw_capacity);
 #endif
 
 #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
+
+/* Used to enable the SMT control */
+static unsigned int max_smt_thread_num = 1;
+
 /*
  * This function returns the logic cpu number of the node.
  * There are basically three kinds of return values:
@@ -565,6 +570,8 @@ static int __init parse_core(struct device_node *core, int package_id,
 		i++;
 	} while (1);
 
+	max_smt_thread_num = max_t(unsigned int, max_smt_thread_num, i);
+
 	cpu = get_cpu_for_node(core);
 	if (cpu >= 0) {
 		if (!leaf) {
@@ -677,6 +684,17 @@ static int __init parse_socket(struct device_node *socket)
 	if (!has_socket)
 		ret = parse_cluster(socket, 0, -1, 0);
 
+	/*
+	 * Reset the max_smt_thread_num to 1 on failure. Since on failure
+	 * we need to notify the framework the SMT is not supported, but
+	 * max_smt_thread_num can be initialized to the SMT thread number
+	 * of the cores which are successfully parsed.
+	 */
+	if (ret)
+		max_smt_thread_num = 1;
+
+	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
+
 	return ret;
 }
 
-- 
2.24.0


