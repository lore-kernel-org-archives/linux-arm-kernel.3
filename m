Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0821C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JVf5JX3PjAtdFLsegTRDdb8FFKYmvrNA/74ROGuaMHE=; b=ylrYRNkFX1yUsluI/oYi4MxeNH
	jKyG9gII8a2bjqKMF9duN/6oIXuO9j8gXp1qmIMMzDnzpPTX9r1LcyFbSwYwsvPVn+bk/Wuf8RymZ
	7AMlMgr8bRNO0cSiOJraQJ3QFNClZlBTLBqhvINhPcbKbsTg245neqaVuN2V2+p1YmT3D6g7ejAVA
	qg+RgPzK8Bt8UDLt+e3eJ0+DarOVlbNrXdBUQ8Cj39XC7x02n/W1DBP9BZ74ZTCpEDGpWXBpmeIYv
	fZ1A0/0oajvNpLdQC/YTRaF8i8gDFiHq8vPbmBf47CvBcLxBGJds1bV65sHWUcKxhU+EctlC6RuNj
	pH7/cG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qFx-0000000AKWI-2Prf;
	Thu, 10 Apr 2025 11:39:41 +0000
Received: from unicom145.biz-email.net ([210.51.26.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pxU-0000000AHU0-0e2q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 11:20:37 +0000
Received: from jtjnmail201601.home.langchao.com
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202504101920305716;
        Thu, 10 Apr 2025 19:20:30 +0800
Received: from locahost.localdomain.com (10.94.12.92) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server id
 15.1.2507.39; Thu, 10 Apr 2025 19:20:29 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <suzuki.poulose@arm.com>,
	<Ganapatrao.Kulkarni@cavium.com>, <gkulkarni@marvell.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Charles
 Han <hanchunchao@inspur.com>
Subject: [PATCH] drivers/perf: Add NULL check in thunderx2_pmu
Date: Thu, 10 Apr 2025 19:20:27 +0800
Message-ID: <20250410112027.80131-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.12.92]
tUid: 2025410192030a0f7fa84987e895022f81a4fc1e0c39c
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_042036_505111_9A5928EA 
X-CRM114-Status: UNSURE (   8.22  )
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

devm_kasprintf() can return a NULL pointer on failure,but this
returned value in tx2_uncore_pmu_register() and
tx2_uncore_pmu_init_dev() is not checked.
Add NULL check in tx2_uncore_pmu_register() and
tx2_uncore_pmu_init_dev(), to handle kernel NULL
pointer dereference error.

Fixes: 69c32972d593 ("drivers/perf: Add Cavium ThunderX2 SoC UNCORE PMU driver")
Fixes: 5e2c27e833bb ("drivers/perf: Add CCPI2 PMU support in ThunderX2 UNCORE driver.")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/perf/thunderx2_pmu.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
index 6ed4707bd6bb..03dd297ff326 100644
--- a/drivers/perf/thunderx2_pmu.c
+++ b/drivers/perf/thunderx2_pmu.c
@@ -738,6 +738,8 @@ static int tx2_uncore_pmu_register(
 
 	tx2_pmu->pmu.name = devm_kasprintf(dev, GFP_KERNEL,
 			"%s", name);
+	if (!tx2_pmu->pmu.name)
+		return -ENOMEM;
 
 	return perf_pmu_register(&tx2_pmu->pmu, tx2_pmu->pmu.name, -1);
 }
@@ -837,6 +839,11 @@ static struct tx2_uncore_pmu *tx2_uncore_pmu_init_dev(struct device *dev,
 		tx2_pmu->attr_groups = l3c_pmu_attr_groups;
 		tx2_pmu->name = devm_kasprintf(dev, GFP_KERNEL,
 				"uncore_l3c_%d", tx2_pmu->node);
+		if (!tx2_pmu->name) {
+			devm_kfree(dev, tx2_pmu);
+			return ERR_PTR(-ENOMEM);
+		}
+
 		tx2_pmu->init_cntr_base = init_cntr_base_l3c;
 		tx2_pmu->start_event = uncore_start_event_l3c;
 		tx2_pmu->stop_event = uncore_stop_event_l3c;
@@ -852,6 +859,11 @@ static struct tx2_uncore_pmu *tx2_uncore_pmu_init_dev(struct device *dev,
 		tx2_pmu->attr_groups = dmc_pmu_attr_groups;
 		tx2_pmu->name = devm_kasprintf(dev, GFP_KERNEL,
 				"uncore_dmc_%d", tx2_pmu->node);
+		if (!tx2_pmu->name) {
+			devm_kfree(dev, tx2_pmu);
+			return ERR_PTR(-ENOMEM);
+		}
+
 		tx2_pmu->init_cntr_base = init_cntr_base_dmc;
 		tx2_pmu->start_event = uncore_start_event_dmc;
 		tx2_pmu->stop_event = uncore_stop_event_dmc;
@@ -866,6 +878,11 @@ static struct tx2_uncore_pmu *tx2_uncore_pmu_init_dev(struct device *dev,
 		tx2_pmu->attr_groups = ccpi2_pmu_attr_groups;
 		tx2_pmu->name = devm_kasprintf(dev, GFP_KERNEL,
 				"uncore_ccpi2_%d", tx2_pmu->node);
+		if (!tx2_pmu->name) {
+			devm_kfree(dev, tx2_pmu);
+			return ERR_PTR(-ENOMEM);
+		}
+
 		tx2_pmu->init_cntr_base = init_cntr_base_ccpi2;
 		tx2_pmu->start_event = uncore_start_event_ccpi2;
 		tx2_pmu->stop_event = uncore_stop_event_ccpi2;
-- 
2.43.0


