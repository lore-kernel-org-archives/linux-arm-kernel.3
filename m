Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBDECA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 23:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQbvrPde+OrHghCdEsygXprSEkwsxJSA8PZNB/95K18=; b=ib7UwVRy3tgRAysyEOtdP2vAqC
	FCj1IBCoCGwI0NTakEkX6Mu2Tvwr4EdBvELTg5wiWS8WudHRaKUm1C0G3SS4DazPRI8qABsvp5ggX
	FeEvrbhqRfI1zI2MOjyXleDro0MyhHHSgExKrTCWO+pvQAUduzIBgRgmnAtDLelnL+APCbiG7x1PR
	4tKDfdwGpFUUyHBjlzj85332UL9LR5SVMfPT05Wer340+P+cru7Pdl2QgqDg8U3OWLItP15F09gkj
	XfxyJ+BrMRODigt+bg7J6JBMTpWa1SzCGvcwcMQHw/lqi5a98CH1j5Dq6Z5D0R8K1o14bZVegGjdv
	eeUVPepg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC3Sz-00000007QzU-1wo6;
	Wed, 30 Sep 2026 23:12:01 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC3St-00000007QyQ-2iLE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 23:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790809915; x=1822345915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aQbvrPde+OrHghCdEsygXprSEkwsxJSA8PZNB/95K18=;
  b=qFDu3j35wraVfF1w9R2eaGKjxzyx75XIGe+EZ4JwmTh1RhzGvHk1d/ON
   4WXTZ/6JjuAqLxBFzTtLD398uC0H0JDQ3J92twX/UITwNjN6HncMeLJbp
   mkKLu9rQV1+TAxlQmVoIVqdz8Z9vZYrh39FAJaNST6+c3UBZvhCpIUs0X
   8fcmKL8OY+mHNvxGtFfFQWoVJdgprDen+Nbkq9zhuT2OpQcJTGOTEuu5B
   CN63UwGRW8CNt7+uNHC5w+VIPCu0i7ooIx2zkHj4M6LpLFGaJ6NqlL7Px
   lulrVv4H30JM1xevUxU7FKAONOocZVWliM61ZSVbFkFJ9hldzU/R6Tlf8
   g==;
X-CSE-ConnectionGUID: B03tRbnNQPGYvWESfMmWSA==
X-CSE-MsgGUID: r5hzBHL+Qy27irkFeF2Yzw==
X-IronPort-AV: E=Sophos;i="6.27,133,1787011200"; 
   d="scan'208";a="30123055"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 23:11:52 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:19945]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.131:2525] with esmtp (Farcaster)
 id 7d9e45ef-53a4-4d07-a5cb-784678d52f7d; Wed, 30 Sep 2026 23:11:52 +0000 (UTC)
X-Farcaster-Flow-ID: 7d9e45ef-53a4-4d07-a5cb-784678d52f7d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 30 Sep 2026 23:11:51 +0000
Received: from u34cccd802f2d52.amazon.com (10.106.239.10) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 30 Sep 2026 23:11:50 +0000
From: Haris Okanovic <harisokn@amazon.com>
To: <robin.murphy@arm.com>, <mark.rutland@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<harisokn@amazon.com>
Subject: [PATCH v2 2/2] perf/arm-cmn: Allow userspace to select the PMU's CPU
Date: Wed, 30 Sep 2026 18:11:27 -0500
Message-ID: <20260930231127.3094040-3-harisokn@amazon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930231127.3094040-1-harisokn@amazon.com>
References: <20260930231127.3094040-1-harisokn@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.239.10]
X-ClientProxiedBy: EX19D037UWC004.ant.amazon.com (10.13.139.254) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_161155_752353_2F51BA80 
X-CRM114-Status: GOOD (  21.69  )
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

arm_cmn_probe() picks the CPU that owns the PMU with

	cmn->cpu = cpumask_local_spread(0, dev_to_node(cmn->dev));

and arm_cmn_event_init() then binds every event to it unconditionally.
That choice is only revisited by the CPU hotplug callbacks, so in
practice the PMU stays on the first CPU local to the interconnect's NUMA
node, which is usually CPU 0.

All of the PMU's recurring work therefore lands on one CPU. This is
problematic on systems which reserve particular CPUs for latency
sensitive work or confine background activity to a chosen set of
housekeeping CPUs.

There is no way to set it explicitly. perf_event_open() and 'perf stat
-C' have no effect because arm_cmn_event_init() overwrites event->cpu;
/proc/irq/*/smp_affinity is refused for the DTC interrupts, which are
requested with IRQF_NOBALANCING because their affinity has to follow the
owning CPU.

Make the existing 'cpumask' attribute writable. It already reports the
CPU which owns the PMU; writing a CPU number now migrates the PMU there
via the existing arm_cmn_migrate(), which moves the perf contexts and
the DTC interrupt affinity together. Since the PMU has a single owning
CPU, anything other than one CPU number is rejected.

The attribute expresses a preference rather than a guarantee. The
hotplug callbacks may still move the PMU, for example when the chosen
CPU is offlined.

Signed-off-by: Haris Okanovic <harisokn@amazon.com>
---
 Documentation/admin-guide/perf/arm-cmn.rst | 18 ++++++++++
 drivers/perf/arm-cmn.c                     | 40 +++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/perf/arm-cmn.rst b/Documentation/admin-guide/perf/arm-cmn.rst
index 796e25b7027b2..bf75b686cef76 100644
--- a/Documentation/admin-guide/perf/arm-cmn.rst
+++ b/Documentation/admin-guide/perf/arm-cmn.rst
@@ -44,6 +44,24 @@ given type. To target a specific node, "bynodeid" must be set to 1 and
 "nodeid" to the appropriate value derived from the CMN configuration
 (as defined in the "Node ID Mapping" section of the TRM).
 
+CPU affinity
+------------
+
+The driver also provides a "cpumask" sysfs attribute, which contains a
+single CPU ID, of the processor which will be used to handle all the CMN
+PMU events.
+
+The attribute is writable, and accepts a single CPU ID to move the PMU
+to that processor, for instance to keep counter reads, interrupt handling
+and event rotation away from CPUs reserved for latency sensitive work::
+
+  $# echo 5 > /sys/bus/event_source/devices/arm_cmn_0/cpumask
+
+This expresses a preference rather than a guarantee. In case of the
+chosen processor being offlined, or a processor local to the
+interconnect's NUMA node coming online while the chosen one is not, the
+events and interrupts are migrated and the attribute is updated.
+
 Watchpoints
 -----------
 
diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index a5593e5821925..1f114ac3f0700 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -5,6 +5,7 @@
 #include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -12,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
@@ -404,6 +406,8 @@ struct arm_cmn_nodeid {
 	u8 dev;
 };
 
+static void arm_cmn_migrate(struct arm_cmn *cmn, unsigned int cpu);
+
 static int arm_cmn_xyidbits(const struct arm_cmn *cmn)
 {
 	return fls((cmn->mesh_x - 1) | (cmn->mesh_y - 1));
@@ -1519,8 +1523,42 @@ static ssize_t arm_cmn_cpumask_show(struct device *dev,
 	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpumask_of(cmn->cpu)));
 }
 
+static ssize_t arm_cmn_cpumask_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	static DEFINE_MUTEX(cpumask_mutex);
+
+	struct arm_cmn *cmn = to_cmn(dev_get_drvdata(dev));
+	unsigned int cpu;
+	int err;
+
+	err = kstrtouint(buf, 0, &cpu);
+	if (err)
+		return err;
+
+	if (cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+	/* Serialises multiple writers against each other */
+	mutex_lock(&cpumask_mutex);
+	/* Blocks hotplug during write */
+	cpus_read_lock();
+
+	if (!cpu_online(cpu))
+		err = -EINVAL;
+	else if (cpu != cmn->cpu)
+		arm_cmn_migrate(cmn, cpu);
+
+	cpus_read_unlock();
+	mutex_unlock(&cpumask_mutex);
+
+	return err ?: count;
+}
+
 static struct device_attribute arm_cmn_cpumask_attr =
-		__ATTR(cpumask, 0444, arm_cmn_cpumask_show, NULL);
+		__ATTR(cpumask, 0644, arm_cmn_cpumask_show,
+		       arm_cmn_cpumask_store);
 
 static ssize_t arm_cmn_identifier_show(struct device *dev,
 				       struct device_attribute *attr, char *buf)
-- 
Haris Okanovic
AWS Graviton


