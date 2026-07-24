Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79489C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 02:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YLx/DaXtFgy0ZBTEdcOf94G5Dcuh3pVwNU27nxu5Qlg=; b=ci06o7ItAJ202N/UeUp7RXXXt/
	n+3bFpaqr+q49WKsAjbkDsfYVM9Bx2yPXAcOhamlrYzjgkw//qpwIR++N2XzO7H9AjQ5xryqf9M4o
	TN0r2gInH46iE1gRa+KKQkbKfZjO9wAODz0othsImnSxjc+QJyJc0/EcwhyXD4RBnM0o5EVtjW6gR
	qvPkFV0CdIQqqwATSjwvqEecLzPffSJjXvSsDoR2jRPT2pSx5EP876F3PpbQCB2umWujI2UEM4WU7
	rTtnQezmVNMDBOnf9sTxNyQMaJQO6ZVp4kED+P3SyRPnaz/SoMID6OOZoHwwbT7vVwZ/orRwcVDB0
	OkltmMlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn62A-0000000FPWr-0QvN;
	Fri, 24 Jul 2026 02:53:10 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn61v-0000000FPSR-2vli
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 02:52:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YLx/DaXtFgy0ZBTEdcOf94G5Dcuh3pVwNU27nxu5Qlg=;
	b=dimSZeg3Nkfv9aUVGlw42h1TxxN5pHAJyzjG2iYRoeN89lmPlqBZdmh6FNvuDBfpXI4PE4uv0
	JPUxNWlzckxtU9L9E/WfzOCVevMM3mr7HnOWDgAK/Sl/vARRrDhtY1taJ4/zaLKfvli2xMtBPol
	ijulnY+uJwcbc7nSnwFiBTk=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4h5skF2fTvzpSwg;
	Fri, 24 Jul 2026 10:43:33 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 57AD940538;
	Fri, 24 Jul 2026 10:52:41 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 24 Jul 2026 10:52:40 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <u.kleine-koenig@baylibre.com>, <linuxarm@huawei.com>,
	<liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangzhou1@hisilicon.com>, <wangyushan12@huawei.com>, <wuyifan50@huawei.com>
Subject: [PATCH v4 0/3] drivers/perf: hisi: Updates for HiSilicon uncore PMUs
Date: Fri, 24 Jul 2026 10:52:35 +0800
Message-ID: <20260724025238.3411328-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo500002.china.huawei.com (7.152.185.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_195256_066999_22C94A58 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

This patchset added support of ITS PMU, and new version of MN PMU.

ITS PMU supports counting number and latency of interrupts by
category, and statistics of micro-ops of ITS.

The new version of MN PMU added cycles event, to be used for MN
metric computing.

Changes:
v4:
- Moved unnecessary cpuhp states for each PMU drivers to hisi_uncore_pmu
  framework as suggested by Robin.
- Reserve the ITS INT_ID filter slot for the lifetime of the event so
  concurrent or multiplexed events cannot clobber the global filter
  configuration.
Link to v3: https://lore.kernel.org/all/20260713125647.2958626-1-wangyushan12@huawei.com/
Link to Sashiko review report: https://sashiko.dev/#/patchset/20260713125647.2958626-1-wangyushan12%40huawei.com

v3:
- Added check_filter callback to refuse new filtered events when there
  are already filtered ones running as per Sashiko.
Link to v2: https://lore.kernel.org/all/20260612093812.1249049-1-wangyushan12@huawei.com/
Link to Sashiko review report: https://sashiko.dev/#/message/20260612093812.1249049-1-wangyushan12%40huawei.com

v2:
- Added int_en filter to tell if int_id is used, enabling filtering
  interrupt with 0 int_id per Sashiko.
- Changed event format width to align with register width per Sashiko.
Link to v1: https://lore.kernel.org/all/20260423152959.1458563-1-wangyushan12@huawei.com/
Link to Sashiko review report: https://sashiko.dev/#/patchset/20260423152959.1458563-1-wangyushan12%40huawei.com

Yifan Wu (1):
  drivers/perf: hisi: Add cycle event for HIP13 MN PMU

Yushan Wang (2):
  drivers/perf: hisi: Consolidate uncore PMU cpuhp states
  drivers/perf: hisi: Add support for uncore ITS PMU

 Documentation/admin-guide/perf/hisi-pmu.rst   |  13 +
 drivers/perf/hisilicon/Makefile               |   2 +-
 drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c  |  34 +-
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c |  34 +-
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  |  34 +-
 drivers/perf/hisilicon/hisi_uncore_its_pmu.c  | 400 ++++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c  |  21 +-
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c   |  98 +++--
 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c  |  35 +-
 drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   |  34 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.c      |  25 ++
 drivers/perf/hisilicon/hisi_uncore_pmu.h      |   2 +
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c |  34 +-
 drivers/perf/hisilicon/hisi_uncore_uc_pmu.c   |  36 +-
 include/linux/cpuhotplug.h                    |   6 -
 15 files changed, 537 insertions(+), 271 deletions(-)
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c

-- 
2.33.0

