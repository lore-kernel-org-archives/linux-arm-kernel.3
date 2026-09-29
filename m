Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783A4CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 22:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DY4sXodOhCp9wlt2rAUIWY80nmvX1kDabrEBUPcCOM0=; b=r6zPAFVTVvSBnDLvO3sCMdSkVL
	bM9qvK0qKycgZDalxA5FudiPDTV3Nzm+YsSinXDogAu5XCU1SObO/H47R3W6fDTLZHbfnjzIwT3Pp
	afgfCIGW7zSc4EKbBiCHKhm5ydZAkXLOP1bmwt41og3h4Qayk+DGbYlVBYb7jmvLaNcRpT63PaMBP
	6OINb1816xTNR9aKPyG79/jM6uCJlTvRa7AG3Gj9YpF6S77QQcQRleJPCng77lt7eZ33FUXtdlEb8
	lskWZXpQ/nC4+rZ2FbHnfE8Y5gE0QY2Rzav3cFrJ7n9CylJfb7wFP9Sp2oSegsnQKbK3UKf2RU7mA
	9MaZ33zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgNt-00000004i6C-1rWq;
	Tue, 29 Sep 2026 22:33:13 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgNq-00000004i5U-47Xj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 22:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790721190; x=1822257190;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DY4sXodOhCp9wlt2rAUIWY80nmvX1kDabrEBUPcCOM0=;
  b=AD7uLSprk1W8ppnoWHnLi/tol+GuhFMCpnsek/LN9NxnX+KWcD9+sJxY
   Mdg1sKMTmGT8oDpd+WNB1oFGdLDWgh+MTQiw2mSvkVcIEq+hzzYpzxhdR
   A8QNym3nmsgqiAf17HzJSlOtFgIIdEE5qw55LZGGVyK0B17dxV7B47MTT
   V8TwVBS8iyPnskHerHE1uhdSigBOUQhw37BnqVno30rNT0Cv34JSxyTgj
   Zda2RW4JnTd6uESqf998zY9ijan9Y58JuRavsQQdWJjxAJaIU47She/4p
   jc2uNp1r4DwQ6wvCtC4wCzHlfIzWQjSIZmqg3wRwtin/6I2cuTv6pjC0U
   w==;
X-CSE-ConnectionGUID: QyTwzQdUQ/SqOgU+VJvd2Q==
X-CSE-MsgGUID: uvvNJ33tSx6EfHRnjh8bcg==
X-IronPort-AV: E=Sophos;i="6.27,130,1787011200"; 
   d="scan'208";a="29787665"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 22:33:06 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:21855]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.15.186:2525] with esmtp (Farcaster)
 id af25f2ba-4ab8-4712-beda-51e479165d3b; Tue, 29 Sep 2026 22:33:06 +0000 (UTC)
X-Farcaster-Flow-ID: af25f2ba-4ab8-4712-beda-51e479165d3b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 29 Sep 2026 22:33:06 +0000
Received: from u34cccd802f2d52.amazon.com (10.106.179.9) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 29 Sep 2026 22:33:05 +0000
From: Haris Okanovic <harisokn@amazon.com>
To: <robin.murphy@arm.com>, <mark.rutland@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<harisokn@amazon.com>
Subject: [PATCH] perf/arm-cmn: Allow userspace to select the PMU's CPU
Date: Tue, 29 Sep 2026 17:32:44 -0500
Message-ID: <20260929223244.2411400-1-harisokn@amazon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.179.9]
X-ClientProxiedBy: EX19D038UWB001.ant.amazon.com (10.13.139.148) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_153311_094273_60C58C30 
X-CRM114-Status: GOOD (  23.06  )
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
I made the existing 'cpumask' attribute writable rather than
adding a new one. Every other implementation of that file is read-only,
so I am happy to switch to a separate attribute if you would prefer to
keep 'cpumask' uniformly read-only across PMUs.

Tested on two platforms with CONFIG_PROVE_LOCKING=y:

  AWS m9g.metal-48xl CMN S3,  one mesh,   192 CPUs
  AWS m8g.metal-48xl CMN-700, two meshes, 192 CPUs

  - Multiplexing occurs on the configured CPU.
  - Offlining the owning CPU migrates the PMU and updates the attribute.
  - Writes racing CPU offline/online produced no lockdep reports.
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
index 5378fba916cf5..4f82d667d8828 100644
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
2.34.1


