Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4466EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j7N3xGFeC/cloI4TKXoPu3jbNWjvV08J4zc8wsh2LM8=; b=0P0917jNIkb/wsPgpUaG9Lo+m5
	51dXWd2CP+hHA+325xRjcK2y8r56ad76rqPGWQRzAogS5jHwfrAdzxEv4e62oV1U+rrdIOhkXYuUs
	LwseSHlWey2TYke6dY1hfdyIu2BNbQM7iT7FYmc5+AS8G/WCAXVaeI4leSy5+8kFwRUO5wVKohceV
	2/TxD3aqyTbEuTlYXItjMSitgxUnx1trmItSX5I3mhw9V4ZWGv88l+7yYAWYPaKKN98MgLVfsyi4W
	pkDxKLuI75r7M3RftKdXiJmSsl4jI8sf8ilOSg4x1iuM0Di7oWHxdMjrvxnha45Gs1boMxYXc+jYq
	hOqaXHGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL19X-0000000Bk6W-3MsM;
	Tue, 10 Dec 2024 14:23:55 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL12M-0000000BiHF-3KB6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:16:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Y711c65Btz1T6vj;
	Tue, 10 Dec 2024 22:13:56 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 23AB6140136;
	Tue, 10 Dec 2024 22:16:22 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 10 Dec 2024 22:16:21 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <jonathan.cameron@huawei.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<wangyushan12@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v5 00/10] Refactor the common parts to the HiSilicon Uncore PMU core and cleanups
Date: Tue, 10 Dec 2024 22:15:15 +0800
Message-ID: <20241210141525.37788-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061631_144833_3B661186 
X-CRM114-Status: GOOD (  11.04  )
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

This series mainly contains the refactor of the HiSilicon Uncore PMU by
extracting the common parts from each drivers into the core:
- the retrieving of the PMU topology ID
- the common sysfs attributes like cpumask and identifier

In order to achieve this, we need to do below preparation:
- refactor the detection of associated CPUs for PMUs locates on a SICL
- maintain the topology information in a dedicated data structure
- provides a generic implementation of cpumask/identifier attributes

Besides also include below changes/cleanups in this patchset
- add one new sysfs attributes for better describing the topology information
  of the associated CPUs of the PMU.
- define a symbol namespace for HiSilicon Uncore PMUs to avoid pollute the
  common ones
- two minor nonfunctional cleanups of DDRC PMU

Change since v4:
- rebase on 6.13-rc2 to meet the change of EXPORT_SYMBOL_NS_GPL/MODULE_IMPORT_NS
Link: https://lore.kernel.org/linux-arm-kernel/20241210113949.GE14735@willie-the-truck/T/#me0ffafc1259a39604103dee13a5607be8a96ce72

Change since v3:
- Split the associated_cpus refactor patches according to the functions, hope
  will be easier to review
- Drop the use of cpu_online_mask out of cpuhp
Link: https://lore.kernel.org/linux-arm-kernel/20241026072424.29887-1-yangyicong@huawei.com/

Change since v2:
- remove one redundant newline and add Jonathan's tag for Patch 1 and 5
Link: https://lore.kernel.org/linux-arm-kernel/20241022145305.47056-1-yangyicong@huawei.com/

Changes since v1:
Address Jonathan's comments and add tags for some patches
- Provide a generic cpumask/identifier attribute group
- refine the comments/commit as suggested
Link: https://lore.kernel.org/linux-arm-kernel/20241018095745.57057-1-yangyicong@huawei.com/

Junhao He (2):
  drivers/perf: hisi: Fix incorrect variable name "hha_pmu" in DDRC PMU
    driver
  drivers/perf: hisi: Delete redundant blank line of DDRC PMU

Yicong Yang (8):
  drivers/perf: hisi: Define a symbol namespace for HiSilicon Uncore
    PMUs
  drivers/perf: hisi: Don't update the associated_cpus on CPU offline
  drivers/perf: hisi: Migrate to one online CPU if no associated one
    online
  drivers/perf: hisi: Refactor the detection of associated CPUs
  drivers/perf: hisi: Extract topology information to a separate
    structure
  drivers/perf: hisi: Add a common function to retrieve topology from
    firmware
  drivers/perf: hisi: Provide a generic implementation of
    cpumask/identifier
  drivers/perf: hisi: Export associated CPUs of each PMU through sysfs

 Documentation/admin-guide/perf/hisi-pmu.rst   |   5 +-
 drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c  |  42 +----
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c |  61 ++-----
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  |  48 ++----
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  |  44 ++---
 drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   |  53 ++----
 drivers/perf/hisilicon/hisi_uncore_pmu.c      | 160 +++++++++++++-----
 drivers/perf/hisilicon/hisi_uncore_pmu.h      |  49 +++++-
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c |  43 +----
 drivers/perf/hisilicon/hisi_uncore_uc_pmu.c   |  45 ++---
 10 files changed, 248 insertions(+), 302 deletions(-)

-- 
2.24.0


