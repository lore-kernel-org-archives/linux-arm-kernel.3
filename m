Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E98C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMSzY7ue4eFWmMd8BYkzILVMrW6VArDgYPCn+6mjTsU=; b=OiE+HCvnt0aqXKG0lXztn9VFPA
	BDKH6eNqeKxS9oMsT9ACcgLP7zL4iS8ltlQtN/A0wa2EzwEIZwzqqOL3qmbsICfixHoZVJ6dghbjp
	6eIV2T56RWQJV6TeL9YRfLDiFpN8Mw3+0FMFQ7ws6aXxaAsGoLrCUm81MPHH/fDlEsDx4BdMALjH7
	IiQ526Sd3TaZZqHAdeCtWI0Lbxkq0MUuuqsl5yMbSSHD0zQu3/SFWSAS/GYJjgsp4s6LjyoDAL+yB
	zkcTAPWL2JBiaWFA4t2S+V30tOUwTDEemZKLbmatQFqNqqpTgk9slCvNuVwWZ0WjKFbNGBJBwL3EG
	5MFkEz/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmT7-0000000HAXX-1NnG;
	Tue, 29 Jul 2025 15:42:21 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmPS-0000000H9rA-0QFG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 15:38:35 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4brzvn2GhLz2RVvT;
	Tue, 29 Jul 2025 23:36:05 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id A21F118005F;
	Tue, 29 Jul 2025 23:38:26 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Jul 2025 23:38:26 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Jul 2025 23:38:25 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <linuxarm@huawei.com>, <yangyicong@hisilicon.com>,
	<wangyushan12@huawei.com>
Subject: [PATCH 4/8] drivers/perf: hisi: Extract the event filter check of L3C PMU
Date: Tue, 29 Jul 2025 23:38:19 +0800
Message-ID: <20250729153823.2026154-5-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250729153823.2026154-1-wangyushan12@huawei.com>
References: <20250729153823.2026154-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_083834_314120_94A23B1A 
X-CRM114-Status: GOOD (  10.99  )
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

L3C PMU has 4 filter options which are sharing perf_event_attr::config1.
Driver will check config1 to see whether a certain event has a filter
setting. It'll be incorrect if we make use of other bits in config1
for non-filter options. So check whether each filter options are set
directly in a separate function instead.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
index db683dd7375c..a372dd2c07b5 100644
--- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
@@ -204,9 +204,15 @@ static void hisi_l3c_pmu_clear_core_tracetag(struct perf_event *event)
 	}
 }
 
+static bool hisi_l3c_pmu_have_filter(struct perf_event *event)
+{
+	return hisi_get_tt_req(event) || hisi_get_tt_core(event) ||
+	       hisi_get_datasrc_cfg(event) || hisi_get_datasrc_skt(event);
+}
+
 static void hisi_l3c_pmu_enable_filter(struct perf_event *event)
 {
-	if (event->attr.config1 != 0x0) {
+	if (hisi_l3c_pmu_have_filter(event)) {
 		hisi_l3c_pmu_config_req_tracetag(event);
 		hisi_l3c_pmu_config_core_tracetag(event);
 		hisi_l3c_pmu_config_ds(event);
@@ -215,7 +221,7 @@ static void hisi_l3c_pmu_enable_filter(struct perf_event *event)
 
 static void hisi_l3c_pmu_disable_filter(struct perf_event *event)
 {
-	if (event->attr.config1 != 0x0) {
+	if (hisi_l3c_pmu_have_filter(event)) {
 		hisi_l3c_pmu_clear_ds(event);
 		hisi_l3c_pmu_clear_core_tracetag(event);
 		hisi_l3c_pmu_clear_req_tracetag(event);
-- 
2.33.0


