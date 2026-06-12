Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC1ACD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bp1cifga+Z84k64jt4SpGZgPBX4W+InpVedDdVyeB1E=; b=Qc1DY/XGC89xm3o/6hYU/6ZWMJ
	1uQl8R1XznT5P77uRd4PMBWl4isdBBQiJb5qL1edpnaM3bmCN67t7z90OkkObhkt76wx9fXwwEyfS
	Zn7LTYQXEvMwSlntWXkZkkU4cwDEZA/B86xtbozZXhG15UHmCGrsOUks+hmVCOaGVeYXGggOydSxP
	JjKh0xKy43sOEwg+pBz2g0ilQvyGOeqBju8FLCp8rSqfyeqLT1mXVeSR9xl+ube34qgtj6NPrQbCS
	A4EwoWFp90tBfwxmovzT2RgHm1gK1sYcgV1trxBBoGiZcaUm3ljeE1PslKr16seGqCyiaU7IvsxVg
	mtAZ63Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyFw-0000000AfqR-2Xxd;
	Fri, 12 Jun 2026 09:32:52 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyFt-0000000AfoD-3m0o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 09:32:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Bp1cifga+Z84k64jt4SpGZgPBX4W+InpVedDdVyeB1E=;
	b=fv+LHVJ+Nzb/d1hRm1p4V/WQpD3ctTKKbK6w/iaYH9T1+SUU6WE3biQMTBzEwob6sgAR207+H
	v/cWa93c3eXnxFpAn5HA4w5/PhzHY/iwc24EGpoWrwbHSq2ClgksBaSWuH3AtBubgFU907W72Pj
	h9OGHRJU5Rvj4fahyxlfkiw=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4gcDnT4xGJz1BGMX
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:32:29 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Bp1cifga+Z84k64jt4SpGZgPBX4W+InpVedDdVyeB1E=;
	b=fv+LHVJ+Nzb/d1hRm1p4V/WQpD3ctTKKbK6w/iaYH9T1+SUU6WE3biQMTBzEwob6sgAR207+H
	v/cWa93c3eXnxFpAn5HA4w5/PhzHY/iwc24EGpoWrwbHSq2ClgksBaSWuH3AtBubgFU907W72Pj
	h9OGHRJU5Rvj4fahyxlfkiw=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gcDbR3M3Wz1T4Kc;
	Fri, 12 Jun 2026 17:23:47 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 45C434048F;
	Fri, 12 Jun 2026 17:32:11 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 12 Jun 2026 17:32:10 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>,
	<wangyushan12@huawei.com>
Subject: [PATCH v2 1/3] drivers/perf: hisi: Replace counter number with defined macro
Date: Fri, 12 Jun 2026 17:32:05 +0800
Message-ID: <20260612093207.1242000-2-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260612093207.1242000-1-wangyushan12@huawei.com>
References: <20260612093207.1242000-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo500002.china.huawei.com (7.152.185.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_023250_098099_4E37E1C9 
X-CRM114-Status: GOOD (  12.34  )
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

The inline number means counter numbers of the PMU. Replace it with
already define macro for better readability.

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
index f963e4f9e552..59e6dff4032f 100644
--- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
@@ -362,7 +362,7 @@ static int hisi_l3c_pmu_check_filter(struct perf_event *event)
  */
 static u32 hisi_l3c_pmu_get_counter_offset(int cntr_idx)
 {
-	return L3C_CNTR0_LOWER + L3C_HW_IDX(cntr_idx) * 8;
+	return L3C_CNTR0_LOWER + L3C_HW_IDX(cntr_idx) * L3C_NR_COUNTERS;
 }
 
 static u64 hisi_l3c_pmu_read_counter(struct hisi_pmu *l3c_pmu,
-- 
2.33.0


