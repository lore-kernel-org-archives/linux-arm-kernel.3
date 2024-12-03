Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F5DE64A8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c0BAXKT0Nv5QbqG9HDB4twz0iRlgr9gmDOmS9YKGEY4=; b=kW9JDRW5AI019ySyjUEMosSCDA
	7NAWqgLmCPFLDaPcTYXITxURLbbmv09KLCWfq7z+CD08Otk8QUXNxhVfCaxt5b0EWaMv19K27W9Vv
	pqLAG76cgi9nk/ipq7itpc2GCiqIV6wVgUkpjsidBQkGQR6ZzNBmk+bpJpv1KcIPA+fW1vTeDpQQb
	8Gyg4QwhI+MLUijuRAlPh7DQs1Xxn7FzUTd2yK0BoeiPNw0WzfF0goJrn+C26xjzUQpLabUNTKqqM
	D0Dy41Rmgfu3ZeEKXKns4eLeRgdFBUTB8U83zKCTBMH7YwK5wllbTGJekINHFTfl0x1n5rrnnZuCj
	uPO9QeKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIShp-00000009Z7i-0x87;
	Tue, 03 Dec 2024 13:12:45 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISNZ-00000009V9w-3B9v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:51:51 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Y2gTK0T91z11Pbp;
	Tue,  3 Dec 2024 20:49:25 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 23CF2140444;
	Tue,  3 Dec 2024 20:51:41 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 3 Dec 2024 20:51:40 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <jonathan.cameron@huawei.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<wangyushan12@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v4 00/10] Refactor the common parts to the HiSilicon Uncore PMU core and cleanups
Date: Tue, 3 Dec 2024 20:50:39 +0800
Message-ID: <20241203125049.39458-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_045150_198922_7B4E74E2 
X-CRM114-Status: GOOD (  12.20  )
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


