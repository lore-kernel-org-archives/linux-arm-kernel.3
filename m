Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633C2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 06:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woEWZPOZ46l0o21aA6EwtkCDGQ0uldSHEPyUOPmTxjQ=; b=d57K91Dwm8LHvajA5013ls4/OK
	8KDwUNfbSCarLtlWWnzaSZZmBV4Wu9TL+Y/U3AaB9WfKBOO+BpRnZ7AKmYBZFhawHvKi48Hr99pv8
	cSk+8PFiBXlZ6zTplWJdtet2ePQlEPfg4CxIcWo4FaLCpK80q6N1cyvfuakJ//a+thp7eAWheV+ua
	AQbchuiFT6++CSMFLGNTT0SgzDNqhfjePXxYZ+hki8norkI396ZiH4ursHzr5+8t3BvhFQbEkmnGT
	i7KOSkS66J74PNYuJ35v8hqfoaIJW843i2WIm/BGOuSt/tChfjfFw/4BEaBwu7z4OkeKZimJ8hYIe
	eWgjEqkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5exd-0000000FEUg-1BUD;
	Fri, 18 Apr 2025 06:12:25 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eqI-0000000FCjp-29uP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 06:04:53 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Zf44N48P5z27hDh;
	Fri, 18 Apr 2025 14:05:24 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D6361A016C;
	Fri, 18 Apr 2025 14:04:42 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Apr 2025 14:04:42 +0800
Received: from localhost.localdomain (10.90.30.45) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Apr 2025 14:04:41 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@arm.com>,
	<anshuman.khandual@arm.com>, <mike.leach@linaro.org>, <leo.yan@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<hejunhao3@huawei.com>
Subject: [PATCH 2/4] coresight: catu: add locking to catu enable/disable functions
Date: Fri, 18 Apr 2025 13:58:18 +0800
Message-ID: <20250418055820.3689408-3-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250418055820.3689408-1-hejunhao3@huawei.com>
References: <20250418055820.3689408-1-hejunhao3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.30.45]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_230451_425631_25BBCC2E 
X-CRM114-Status: GOOD (  10.66  )
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

In the function coresight_enable_path(), all adjacent helper components
along the path are enabled first. Without proper locking, a race
condition may occur between concurrent sysfs and perf calls to these
functions, potentially leading to incorrectly obtained settings or
misconfigured CATU control-enable flags.

Requires spinlock in catu_enable()/catu_disable() to:
- Serialize sysfs/perf concurrent accesses
- Prevent corruption of CATU control-enable flags

Signed-off-by: Junhao He <hejunhao3@huawei.com>
---
 drivers/hwtracing/coresight/coresight-catu.c | 6 ++++++
 drivers/hwtracing/coresight/coresight-catu.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 275cc0d9f505..54ce13254d7c 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -461,6 +461,8 @@ static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
 	int rc;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
 
+	guard(spinlock_irqsave)(&catu_drvdata->spinlock);
+
 	CS_UNLOCK(catu_drvdata->base);
 	rc = catu_enable_hw(catu_drvdata, mode, data);
 	CS_LOCK(catu_drvdata->base);
@@ -489,6 +491,8 @@ static int catu_disable(struct coresight_device *csdev, void *__unused)
 	int rc;
 	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
 
+	guard(spinlock_irqsave)(&catu_drvdata->spinlock);
+
 	CS_UNLOCK(catu_drvdata->base);
 	rc = catu_disable_hw(catu_drvdata);
 	CS_LOCK(catu_drvdata->base);
@@ -523,6 +527,8 @@ static int __catu_probe(struct device *dev, struct resource *res)
 		goto out;
 	}
 
+	spin_lock_init(&drvdata->spinlock);
+
 	/* Setup dma mask for the device */
 	dma_mask = readl_relaxed(base + CORESIGHT_DEVID) & 0x3f;
 	switch (dma_mask) {
diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
index 141feac1c14b..eb7c9189b066 100644
--- a/drivers/hwtracing/coresight/coresight-catu.h
+++ b/drivers/hwtracing/coresight/coresight-catu.h
@@ -64,6 +64,7 @@ struct catu_drvdata {
 	struct clk *pclk;
 	void __iomem *base;
 	struct coresight_device *csdev;
+	spinlock_t spinlock;
 	int irq;
 };
 
-- 
2.33.0


