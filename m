Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E34FCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMSzY7ue4eFWmMd8BYkzILVMrW6VArDgYPCn+6mjTsU=; b=zm2T0IARuByokWH0HS+oB3g3Yd
	DjRDeiCthA9tv/dGsNwv+6xz6/Ad38hrjnSc4eHhE104PtNyVows/VLr9Tdr0cPxjjYDVckdUQQw6
	CtIaBCt1mIeMkCMo52/UB5fMk4Pnnwi6CN6dDboEn00496FsP7IvsC8fq8RkZUNAG1HZVwwRjHsno
	P6iIhbmkRePPLS/DrZN6rOwfaxM9UWEdl/tX8BnIvov2g0LJ5lvl+y504Qo3mMbN8FL8gJ9+OqJzV
	usCML9D3Xmk+IRd/f++V3p64PQVtKV0dHz7VCedFhEIRm3oK+wk9++kDu+FR+VbTGDbSSFrHOu1dz
	RcW3xUxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAht-00000000EZA-2o2Y;
	Thu, 21 Aug 2025 19:12:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5hD-0000000H7VA-2We8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 13:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lMSzY7ue4eFWmMd8BYkzILVMrW6VArDgYPCn+6mjTsU=; b=A+ngIXBBXhJMBNTdPtOmBCyBJ4
	H4MYzISciaDHYHL2GfN584ytE4yqoAdnGathHpynR7W6P04D5Ud01iUif44gyq+sRwwEOu6GCZvXH
	bocmNb+3djSxsyZ3DF1MDgAYXLpD+XoVYw3Up+xeUPXQXAovg0ORoV4p/g0VAlsD5HA5QyAtFDjFR
	rQ0zDHx3WzNL57MZtXivYB6o3iaXEnx/i0d9nJa1F9gxPJM7r7vjgTO5TIC4rByO4RwgZxKg3cc/9
	OtXIQ2bP2Hg2elSOZs031cEsogFAn1OW+fPxZK2KBQ65wKYVSUELgftO8WhMYyhsIIAlyLonIQbrk
	1N9zE2HA==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5h9-00000000a4u-3mW6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 13:51:14 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c74QR2fgNz2gL3T;
	Thu, 21 Aug 2025 21:47:59 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 055C11A0188;
	Thu, 21 Aug 2025 21:50:53 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 21 Aug 2025 21:50:52 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 21 Aug 2025 21:50:52 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <robin.murphy@arm.com>, <yangyicong@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <hejunhao3@h-partners.com>
Subject: [PATCH v2 4/9] drivers/perf: hisi: Extract the event filter check of L3C PMU
Date: Thu, 21 Aug 2025 21:50:44 +0800
Message-ID: <20250821135049.2010220-5-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250821135049.2010220-1-wangyushan12@huawei.com>
References: <20250821135049.2010220-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_145112_473194_BC6A3CC6 
X-CRM114-Status: GOOD (  11.49  )
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


