Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B62E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhYVRXSJhfqd+zHwKeXg2fh0a/erxgIe/Dtd5BzQv+w=; b=a8dDX2CKCUXDwCdV4AliGxKb4x
	paZQZcTGVRZPAOrdeNuN5u1E8+U65UQg5zVoZpF6M/pEL5M39l+M2TZukaJxXm04UepApxCfUlxlq
	kU3akk9s1UHd+JY58wj8qq9KdrJGKdCtMxd47bDmOlRqmkmDAO3fwGGRGyPInfs/zZFTJVX5p+gCJ
	YhwmmFNGD5AolBpif9GktKAmE0Bjm1BJk26TME+hqP/5u8w4/UmlnBHpvVyJuROtfgjQB1JxvgcM3
	fhIwsb9fYHHrFpd5Vs1X+bwg8WlSWNsvFTeq53wPjY9lkMNVypVx375eh43g2YUTbciXK0pxht8C7
	/nqjkIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL16T-0000000BjPz-3cXS;
	Tue, 10 Dec 2024 14:20:45 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL12M-0000000BiHI-1xln
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:16:33 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Y714C0X28z1JDw3;
	Tue, 10 Dec 2024 22:16:11 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 468451802E8;
	Tue, 10 Dec 2024 22:16:25 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 10 Dec 2024 22:16:24 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <jonathan.cameron@huawei.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<wangyushan12@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v5 08/10] drivers/perf: hisi: Export associated CPUs of each PMU through sysfs
Date: Tue, 10 Dec 2024 22:15:23 +0800
Message-ID: <20241210141525.37788-9-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241210141525.37788-1-yangyicong@huawei.com>
References: <20241210141525.37788-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061630_682784_11EE0689 
X-CRM114-Status: GOOD (  12.57  )
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

Although the event of the uncore PMU can only be opened on a single
CPU, some PMU does have the affinity on a range of CPUs. For example
the L3C PMU is associated to the CPUs sharing the L3T it monitors.
Users may infer this affinity by the PMU name which may have SCCL ID
and CCL ID encoded (for L3C etc), but it's not that straightforward.
So export this information by adding an "associated_cpus" sysfs
attribute then user can get this directly.

Reviewed-by: Jonathan Cameron <Joanthan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 Documentation/admin-guide/perf/hisi-pmu.rst |  5 ++++-
 drivers/perf/hisilicon/hisi_uncore_pmu.c    | 10 ++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
index 5cc248d18c63..48992a0b8e94 100644
--- a/Documentation/admin-guide/perf/hisi-pmu.rst
+++ b/Documentation/admin-guide/perf/hisi-pmu.rst
@@ -35,7 +35,10 @@ e.g. hisi_sccl1_hha0/rx_operations is RX_OPERATIONS event of HHA index #0 in
 SCCL ID #1.
 
 The driver also provides a "cpumask" sysfs attribute, which shows the CPU core
-ID used to count the uncore PMU event.
+ID used to count the uncore PMU event. An "associated_cpus" sysfs attribute is
+also provided to show the CPUs associated with this PMU. The "cpumask" indicates
+the CPUs to open the events, usually as a hint for userspaces tools like perf.
+It only contains one associated CPU from the "associated_cpus".
 
 Example usage of perf::
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index 075aaa8eaeaa..83bdc9c31367 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -51,8 +51,18 @@ EXPORT_SYMBOL_NS_GPL(hisi_cpumask_sysfs_show, "HISI_PMU");
 
 static DEVICE_ATTR(cpumask, 0444, hisi_cpumask_sysfs_show, NULL);
 
+static ssize_t hisi_associated_cpus_sysfs_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct hisi_pmu *hisi_pmu = to_hisi_pmu(dev_get_drvdata(dev));
+
+	return cpumap_print_to_pagebuf(true, buf, &hisi_pmu->associated_cpus);
+}
+static DEVICE_ATTR(associated_cpus, 0444, hisi_associated_cpus_sysfs_show, NULL);
+
 static struct attribute *hisi_pmu_cpumask_attrs[] = {
 	&dev_attr_cpumask.attr,
+	&dev_attr_associated_cpus.attr,
 	NULL
 };
 
-- 
2.24.0


