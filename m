Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E54C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 08:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bRzYqpaNpp4sM+9yBO0fYBvPfATdo9EsaoEIGxFBIk0=; b=JUoVxiiLbcfM0OAcRjcUILnvbX
	Cm2VL1Z9ncNPX00Qzj4joQPsqSwgnjoWuNkqbsFz5nxup4RKM7sTY+bgLdnFytsCKDvtcmeW++3tc
	0DGywMOQXcTNE7ZlYCqjebHdKcL7SwUygzvdFnEvICROlTzjAP6dElzV5fFULeIwZMKM9QBBNl86e
	g3gFE0BzhQZ+rYWqgJ5NKX8aLyq/Qx0T0YpMFOQBpmccB5hXgRWK6Or5ski9a8tOfmyxJOBCKZUp1
	3TU+zjaXmWYkoFvkzZb5c4at2slPNbcZHGQjMaBH1Fom6wMOlZ2teeD62IYIkeZ27UhxYcEkbrEg3
	0nGtDaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKPB-00000009dts-2XEz;
	Thu, 17 Jul 2025 08:55:53 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJFw-00000009UDE-1JQf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 07:42:17 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bjPsd3WzLz2Cfqj;
	Thu, 17 Jul 2025 15:37:57 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id E2AB71400D4;
	Thu, 17 Jul 2025 15:42:04 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 17 Jul 2025 15:42:04 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 17 Jul 2025 15:42:04 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <hejunhao3@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [PATCH v4 0/2] drivers/perf: hisi: Add support for HiSilicon MN PMU driver
Date: Thu, 17 Jul 2025 15:41:36 +0800
Message-ID: <20250717074138.39903-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_004216_514182_81FAE5A1 
X-CRM114-Status: UNSURE (   7.62  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Add support for two new Uncore PMUs to monitor the events of the system bus
(by NoC PMU) and the DVM operations (by MN PMU).

Change since v3:
- Use ACPI driver data to retrieve the hardware capabilities
Link: https://lore.kernel.org/linux-arm-kernel/20250619125557.57372-1-yangyicong@huawei.com/

Junhao He (1):
  drivers/perf: hisi: Add support for HiSilicon MN PMU driver

Yicong Yang (1):
  drivers/perf: hisi: Add support for HiSilicon NoC PMU

 Documentation/admin-guide/perf/hisi-pmu.rst  |  11 +
 drivers/perf/hisilicon/Makefile              |   3 +-
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c  | 411 +++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c | 443 +++++++++++++++++++
 4 files changed, 867 insertions(+), 1 deletion(-)
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c

-- 
2.24.0


