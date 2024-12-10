Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD934E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rokwvd15tx22jCQeOHs72IzDSXOLszmzzO7e7L4pbHo=; b=y/Da0cesHgOKR840K9CAlTcRJ2
	qB0RGD9o7nphH0JpKevk8u6etmpH9t3G1zf7kls0AFcZtJbxovArNrbWevYx4mxRA2scgj70BOQmd
	ZvN31K721XOuhGorrGoQnlssltK3ASvvJWJi8RgKhM8FbQbCNMdGAHoEpti791M1il+1sdIna+vDc
	16HuIWFQL5CYNHlaH1GLVFOjxERugKobzcYIAyQIi63Dbm3Mi4tFPv/50hu7faSLXEKKJNcZj89cL
	N2RDJCycek61/JfItBfv5FnLd7WllVXrl/1mZDk4Es4+8tKC7YErLmhKYNuJvg3Y1qvkzRlI4UK0g
	X9MxY3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Dd-0000000Bl6t-1U56;
	Tue, 10 Dec 2024 14:28:09 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL12N-0000000BiHN-1Xhf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:16:34 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Y711j6stYzhZVb;
	Tue, 10 Dec 2024 22:14:01 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id A4D251400FD;
	Tue, 10 Dec 2024 22:16:25 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 10 Dec 2024 22:16:25 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <jonathan.cameron@huawei.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<wangyushan12@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v5 09/10] drivers/perf: hisi: Fix incorrect variable name "hha_pmu" in DDRC PMU driver
Date: Tue, 10 Dec 2024 22:15:24 +0800
Message-ID: <20241210141525.37788-10-yangyicong@huawei.com>
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
X-CRM114-CacheID: sfid-20241210_061631_597277_1F42D2EA 
X-CRM114-Status: GOOD (  11.51  )
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

From: Junhao He <hejunhao3@huawei.com>

In the callback function write_evtype(), the variable name of struct
hisi_pmu should be "ddrc_pmu" instead of "hha_pmu".

Signed-off-by: Junhao He <hejunhao3@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
index 75f251a7b30c..fb309b8d5301 100644
--- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
@@ -111,14 +111,14 @@ static void hisi_ddrc_pmu_v2_write_counter(struct hisi_pmu *ddrc_pmu,
  * so there is no need to write event type, while it is programmable counter in
  * PMU v2.
  */
-static void hisi_ddrc_pmu_write_evtype(struct hisi_pmu *hha_pmu, int idx,
+static void hisi_ddrc_pmu_write_evtype(struct hisi_pmu *ddrc_pmu, int idx,
 				       u32 type)
 {
 	u32 offset;
 
-	if (hha_pmu->identifier >= HISI_PMU_V2) {
+	if (ddrc_pmu->identifier >= HISI_PMU_V2) {
 		offset = DDRC_V2_EVENT_TYPE + 4 * idx;
-		writel(type, hha_pmu->base + offset);
+		writel(type, ddrc_pmu->base + offset);
 	}
 }
 
-- 
2.24.0


