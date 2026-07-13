Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F72C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r2P2h/hlQL6bUMZLMBww/Yq/yyyXBLN/tn4yEf7e6ik=; b=cdpJlBQAQQVgFw1XtmtZyCkGGj
	cwlLX3Fv6aGmogj6AB8y5FBB9JL7HtWvTBHYEFicXsbJEGxzFJq9lmop1zUkT1VU1mLN4gbkMTKHc
	3r7duSEkeGTFUwiiiukL4FnqTiyEA9KZpjUjaeBbp6QaNezemM4qrsCQWDEkZupLw1WEjvOvMZ/o1
	2F0ZlEIOG2S7JTQGshQh3hjgIsNfxsnxGirU/pvX7EeguWYME6u2fHi+mfLRJzPIQ/mFQGDFMqH+L
	2LPJCjVJ2Lt4EyXOqTO1B0sryfxb5Eq6rDDZk8+8zX+BGSXN7dSo2+BdiNNO/8BSbzjjo/Zbbs8AT
	H9EZhvGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGDW-00000009GFT-1bQa;
	Mon, 13 Jul 2026 12:57:02 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGDS-00000009GCo-1hvK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:57:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=r2P2h/hlQL6bUMZLMBww/Yq/yyyXBLN/tn4yEf7e6ik=;
	b=dbjGrb0xGLkF7U7sSfwE49VbLhixl/4u4wiGTAr6vPthdKAwN2sb9qTPHQEga/95C3xUP4sOv
	m1V/7luCxoCUlLTysm3i81fURorpXobj4q/akEarjaV7IcAfqpWMNBfGGqJs15WmJjRlr3rx1U7
	pK3+pa2sJ7ZWf+3rNvQzs3o=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gzMdt0xRqznTc6;
	Mon, 13 Jul 2026 20:47:14 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D2B44055B;
	Mon, 13 Jul 2026 20:56:50 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Jul 2026 20:56:49 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>,
	<wangyushan12@huawei.com>
Subject: [PATCH v3 0/2] drivers/perf: hisi: Updates for HiSilicon uncore PMUs 
Date: Mon, 13 Jul 2026 20:56:45 +0800
Message-ID: <20260713125647.2958626-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo500002.china.huawei.com (7.152.185.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_055658_610846_C942242B 
X-CRM114-Status: UNSURE (   9.14  )
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
  drivers/perf: hisi: Add new function for HiSilicon MN PMU driver

Yushan Wang (1):
  drivers/perf: hisi: Support uncore ITS PMU

 Documentation/admin-guide/perf/hisi-pmu.rst  |  13 +
 drivers/perf/hisilicon/Makefile              |   2 +-
 drivers/perf/hisilicon/hisi_uncore_its_pmu.c | 393 +++++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c  |  63 ++-
 4 files changed, 463 insertions(+), 8 deletions(-)
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c

-- 
2.33.0


