Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DFBCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 09:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QzMlunrqBZEqRdahohzCNCuYuFd05eVwTNzW60tqL4w=; b=PPapdjgk7x/QnqJ3EarK/E5WvK
	vQhVJlIDWEX8IB7pWD6prd3FnHD6qm4WpS+vOD/vjxwJkapAt2GWaZ3WAmchKIwhf7RJYgwZ5aCxi
	rJxeRy+dqlH04nfvhf5OVDyPe7nmb5OC/5vYt/DIoi4EyAmGCLJhfshQ3g/dTvye+J7p9ZQB8VFoZ
	YfrRQzKOePRFHXMkC17zHvd9Smqiy9/T0uBoHOkLmf0xVXmqy9T9Z9j8r4qMufTXzsZkEn1knYnMk
	3yQvFogQxX4Ognbd7H3+EIL+rhFOq0igDANxWSqpQ+85a2yN31pF8dSPlstDlq8i5m0FjSwphxJHZ
	X+d7GGcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUWv-0000000GTKG-07pj;
	Thu, 14 Aug 2025 09:45:53 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umU4a-0000000GNMj-2gV3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:16:38 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c2fcl3QfmzvWyj;
	Thu, 14 Aug 2025 17:11:35 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 53DAB140147;
	Thu, 14 Aug 2025 17:16:35 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 17:16:23 +0800
Received: from DESKTOP-VM4LOUJ.huawei.com (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 17:16:23 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>, <wangyushan12@huawei.com>,
	<hejunhao3@h-partners.com>
Subject: [PATCH v6 0/3] drivers/perf: hisi: Add support for HiSilicon NOC and MN PMU driver
Date: Thu, 14 Aug 2025 17:16:19 +0800
Message-ID: <20250814091622.23269-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_021636_828040_39AF138A 
X-CRM114-Status: GOOD (  10.61  )
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

Add support for two new Uncore PMUs to monitor the events of the system bus
(by NoC PMU) and the DVM operations (by MN PMU).

Change since v5:
- Rebase on 6.17-rc1 and update the maintainer entry
Link: https://lore.kernel.org/linux-arm-kernel/20250717121727.61057-1-yangyicong@huawei.com/

Change since v4:
- Rename ovflow_status to .overflow_status with Jonathan's Tag, thanks!
Link: https://lore.kernel.org/linux-arm-kernel/20250717074138.39903-1-yangyicong@huawei.com/

Change since v3:
- Use ACPI driver data to retrieve the hardware capabilities
Link: https://lore.kernel.org/linux-arm-kernel/20250619125557.57372-1-yangyicong@huawei.com/

Junhao He (1):
  drivers/perf: hisi: Add support for HiSilicon MN PMU driver

Yicong Yang (2):
  drivers/perf: hisi: Add support for HiSilicon NoC PMU
  MAINTAINERS: Remove myself from HiSilicon PMU maintainers

 Documentation/admin-guide/perf/hisi-pmu.rst  |  11 +
 MAINTAINERS                                  |   1 -
 drivers/perf/hisilicon/Makefile              |   3 +-
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c  | 411 +++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c | 443 +++++++++++++++++++
 5 files changed, 867 insertions(+), 2 deletions(-)
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c

-- 
2.24.0


