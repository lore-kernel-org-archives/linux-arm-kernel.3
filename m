Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E44AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=er/4MQhLp1s/XX6/1u00SmAi7p6++fwYiQ+bGsFQQBo=; b=OLEfTVJ2KPR53YH36gL7dTlq+g
	Q6QQ0olBQf5jG5ogFc4jlt4HQ1v1GQ5U1796eWRRIaMcFrkOo13PVq1m0s2nyBLtFekETQ9BiIwAa
	3zE0rMnOic5zkX30Wlvvyxo1C6X+DATlQpLmudUN+pDUjDfW6opCT/ZVmGuYTbcEhI2pBxASulsRr
	Ir+8AavdngttIA8Gjvh+O+Y2J7gGGwFUOltY1h5wmrZKAZSjkmMaEZWdydSZSNdnn7d/GA+SvEw9g
	qXhvOojU20PSUvb2NOff1YcrcAvAFPMTSdQ6qNPM/tnHApWs/KwbyzZWwIAgkmmiZqilCZj2DLX3J
	YWo/tmIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOPx-00000008TSC-2bIP;
	Tue, 18 Feb 2025 14:17:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOJ4-00000008RpF-0tfX
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Feb 2025 14:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=er/4MQhLp1s/XX6/1u00SmAi7p6++fwYiQ+bGsFQQBo=; b=VEF221jFTnEKRBE8+PbqzVjLoN
	oe3MTnPiJP7DLh/1jckiKns9Fhv4eKgJ1W4RT8bHt/v3PtwLGWbC7BWIKSGVp1pj+2O+8DZH5l4/6
	iFBN5m7/IZjCIRSFbIIdd6L9atqYZl/WATn3gCWzfUNbjZmqZXA0dYdCW0PheyPIZ8Y5EOryXpVF3
	z67T6Up7w4yBKnn7rURmW4ThNhcxRkZaYogynh7yEjb4fSSWQINkRitZ6eodn6pJzY4cKOtCfTDmT
	smHS3USjplD0XviZ/CsktPbtvdykG4prPG+AmkCZQ64nxdI5tIQm49W69Mgxk2K/FbasGsKznCbUg
	LzHK3nKg==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOIy-000000020EQ-3NAV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 14:10:36 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Yy1dW64SHzpkBd;
	Tue, 18 Feb 2025 22:10:39 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D0751A016C;
	Tue, 18 Feb 2025 22:10:09 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 18 Feb 2025 22:10:08 +0800
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
Subject: [PATCH v11 2/4] arch_topology: Support SMT control for OF based system
Date: Tue, 18 Feb 2025 22:10:16 +0800
Message-ID: <20250218141018.18082-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250218141018.18082-1-yangyicong@huawei.com>
References: <20250218141018.18082-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_141035_178972_D76D337B 
X-CRM114-Status: GOOD (  17.52  )
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

On building the topology from the devicetree, we've already
gotten the SMT thread number of each core. Update the largest
SMT thread number and enable the SMT control by the end of
topology parsing.

The core's SMT control provides two interface to the users [1]:
1) enable/disable SMT by writing on/off
2) enable/disable SMT by writing thread number 1/max_thread_number

If a system have more than one SMT thread number the 2) may
not handle it well, since there're multiple thread numbers in the
system and 2) only accept 1/max_thread_number. So issue a warning
to notify the users if such system detected.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/base/arch_topology.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 3ebe77566788..23f425a9d77a 100644
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
+/* Maximum SMT thread number detected used to enable the SMT control */
+static unsigned int max_smt_thread_num;
+
 /*
  * This function returns the logic cpu number of the node.
  * There are basically three kinds of return values:
@@ -565,6 +570,16 @@ static int __init parse_core(struct device_node *core, int package_id,
 		i++;
 	} while (1);
 
+	/*
+	 * If max_smt_thread_num has been initialized and doesn't match
+	 * the thread number of this entry, then the system has
+	 * heterogeneous SMT topology.
+	 */
+	if (max_smt_thread_num && max_smt_thread_num != i)
+		pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
+
+	max_smt_thread_num = max_t(unsigned int, max_smt_thread_num, i);
+
 	cpu = get_cpu_for_node(core);
 	if (cpu >= 0) {
 		if (!leaf) {
@@ -677,6 +692,18 @@ static int __init parse_socket(struct device_node *socket)
 	if (!has_socket)
 		ret = parse_cluster(socket, 0, -1, 0);
 
+	/*
+	 * Notify the CPU framework of the SMT support. Initialize the
+	 * max_smt_thread_num to 1 if no SMT support detected or failed
+	 * to parse the topology. A thread number of 1 can be handled by
+	 * the framework so we don't need to check max_smt_thread_num to
+	 * see we support SMT or not.
+	 */
+	if (!max_smt_thread_num || ret)
+		max_smt_thread_num = 1;
+
+	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
+
 	return ret;
 }
 
-- 
2.24.0


