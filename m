Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C591BC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P0KOnasRrOuIOEP5VssO7QO2UuSAj5T35dXo6KrBp2c=; b=qttnFmMd6lZFLFM0FTAXCQpQOZ
	9YMECCw8CABXxYQRW2+Y2IOPqjDk8nSNKcsGe0yHlBsnr/rGonHgS6blufvQiUDTXnGaaviP7N1CN
	OY7YjhoNjYtxMEYmlyzS0CDoS0OFPReCrSMvo83vd3lQMD3QIw9+GbMIZASx9qnqL3Yfb3nwG6qC0
	Eo5qnJlK3a2vNLTCKnwADhhCTOPHq48nI2IaqCg9Sw13LLjqFs+opEa6jM7iNR6IcmtrJ3m4jUHLO
	qzfNYWOBPdf3fg/i0bAuyDBJw0nnjKwnA8GuASLr2NlqQ5Omi6baSOK1Rzl7xr8XK89Hm8K+DXRVZ
	gTMe2d4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pt5-0000000ABSP-1yFf;
	Thu, 10 Apr 2025 11:16:03 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ntb-00000009sdW-0sCV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 09:08:29 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZYDPQ6wWxz1j5wP;
	Thu, 10 Apr 2025 17:03:22 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 3F0921A016C;
	Thu, 10 Apr 2025 17:08:21 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Apr 2025 17:08:20 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <hejunhao3@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [PATCH v3 0/8] General updates and two new drivers for HiSilicon Uncore PMU
Date: Thu, 10 Apr 2025 17:08:17 +0800
Message-ID: <20250410090825.13214-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_020827_414715_99418F02 
X-CRM114-Status: GOOD (  12.63  )
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

Support new version of DDRC/SLLC PMU identified with updated ACPI HID and
register definition. In order to support this, we do a preliminary refactor
to initialize device of each version by using driver data of each HID
rather than checking the version. This will also make the driver easier to
maintain and extend, since only the HID specific information along
with the new HID will be added to support the new version without touching
the common logic.

Two new Uncore PMU drivers is also added to support the monitoring the
events of the system bus (by NoC PMU) and the DVM operations (by MN PMU).

Change since v2:
- Rebase on 6.15-rc1, add Jonathan's tag.
Link: https://lore.kernel.org/linux-arm-kernel/20250321073846.23507-1-yangyicong@huawei.com/

Change since v1:
- Fold patch which extending the struct hisi_pmu_dev_info into its user
- Use bit shift rather than bit mask for SLLC PMU registers configuration
- Address other comments by Jonathan, thanks
Link: https://lore.kernel.org/linux-arm-kernel/20250218092000.41641-1-yangyicong@huawei.com/

Junhao He (6):
  drivers/perf: hisi: Simplify the probe process for each DDRC version
  drivers/perf: hisi: Add support for HiSilicon DDRC v3 PMU driver
  drivers/perf: hisi: Use ACPI driver_data to retrieve SLLC PMU
    information
  drivers/perf: hisi: Add support for HiSilicon SLLC v3 PMU driver
  drivers/perf: hisi: Relax the event number check of v2 PMUs
  drivers/perf: hisi: Add support for HiSilicon MN PMU driver

Yicong Yang (2):
  drivers/perf: hisi: Support PMUs with no interrupt
  drivers/perf: hisi: Add support for HiSilicon NoC PMU

 Documentation/admin-guide/perf/hisi-pmu.rst   |  11 +
 drivers/perf/hisilicon/Makefile               |   3 +-
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 354 ++++++++--------
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c  |   6 +-
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c   | 355 ++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c  | 392 ++++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_pa_pmu.c   |   2 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.c      |  11 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.h      |   2 +
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 220 +++++++---
 10 files changed, 1098 insertions(+), 258 deletions(-)
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c

-- 
2.24.0


