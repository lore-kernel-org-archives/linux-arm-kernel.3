Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEC7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hz9uiJYnSSt1bbEkt+/oLbxBJLAx6Dk78Skx72dbthQ=; b=SO+GSaLxMdTebavIDuPIYvNQLZ
	Fyz8BdWBHQGLrMtzzYCSLxTuyIFkCVEtu2heZD2as9Qyd2VJxaP0dyGXmZbUnwK/MAdQfk4kvCbK4
	Kt3decX9GELAw4PBhHgIxDuEILwNOYCRRFVz7+BsWmX52Z/dTdfuetbHqMdXsjDBIPhaGB77b4z+0
	L2XKfkkx/wdM9oTWqdy2f1KvSWbdAmeV69XIJpiBONDtpKiXRJCaWoGWjXXuswjbwWZZQi5fkzRWU
	HvPWjnmazX0AkLrvkMKullQgj/B5VkwzvLRYc/qpkLqxhguitoF86Izu7Rv8GCU6X6M2HRvOA3k+5
	yl5VO3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJsU-00000007VWv-33GJ;
	Tue, 18 Feb 2025 09:26:54 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJli-00000007TkG-3hg1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:19:56 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Yxv5Q411vz2JYYK;
	Tue, 18 Feb 2025 17:15:54 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 04855180214;
	Tue, 18 Feb 2025 17:19:48 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 18 Feb 2025 17:19:47 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [PATCH 1/9] drivers/perf: hisi: Extend struct hisi_pmu_dev_info
Date: Tue, 18 Feb 2025 17:19:52 +0800
Message-ID: <20250218092000.41641-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250218092000.41641-1-yangyicong@huawei.com>
References: <20250218092000.41641-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_011955_103216_98BAF521 
X-CRM114-Status: UNSURE (   9.75  )
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

From: Junhao He <hejunhao3@huawei.com>

The counter bits and event range may differ from versions of a
certain uncore PMU. Make this device specific information into
struct hisi_pmu_dev_info. This will help to simplify the
initialization process by using a list of struct hisi_pmu_dev_info
rather than checking the version.

Signed-off-by: Junhao He <hejunhao3@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_pmu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.h b/drivers/perf/hisilicon/hisi_uncore_pmu.h
index f4fed2544877..777675838b80 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
@@ -72,6 +72,8 @@ struct hisi_uncore_ops {
 struct hisi_pmu_dev_info {
 	const char *name;
 	const struct attribute_group **attr_groups;
+	u32 counter_bits;
+	u32 check_event;
 	void *private;
 };
 
-- 
2.24.0


