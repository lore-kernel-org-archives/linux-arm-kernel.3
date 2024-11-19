Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFFAD44160
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9w6+kGak5wJ5POedvwjFpfhaNrYASYx7L0V7GieF8rc=; b=bK44A7ue3wHlDGVleiQiapDoHB
	yFUF3nPoMAlmQfX1jC35F7GW6c7P1h2vhbbEw9C6w2d9sEcbu9MmfrYipiysemFmePAHsTWqnZM/r
	je9pUIrAHSwgri0F+zKmt4n/6lNVJgjkP0eioACKCxlMk+HJrjohfduknQPNqLWmzKhyt8+PU2QeA
	gwuSFhrrwTHVc7k+GXusiZ5IYaSHoJcL2xF0Wea2bf0Jw7EgkXTZJxuTtZWFA5G4ElHkFAHBl6mxL
	C+wge+qV0GZqdmKkOG9nRS4haDeEkaa5sYo0XzA4d2+mfHNUj1niegxewBe+Dpszn4d4gpvB+dGNQ
	s0IxcuZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOT5-0000000CYAS-02wO;
	Tue, 19 Nov 2024 13:40:35 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOQz-0000000CXRT-1FvQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 13:38:28 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xt59z4z6VzqSP1;
	Tue, 19 Nov 2024 21:36:23 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 3040818010F;
	Tue, 19 Nov 2024 21:38:15 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 19 Nov
 2024 21:38:14 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <james.morse@arm.com>, <Dave.Martin@arm.com>
CC: <linux-kernel@vger.kernel.org>, <jonathan.cameron@huawei.com>,
	<xiexiuqi@huawei.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v2 2/6] arm_mpam: Create reqPARTIDs resource bitmap
Date: Tue, 19 Nov 2024 21:51:00 +0800
Message-ID: <20241119135104.595630-3-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119135104.595630-1-zengheng4@huawei.com>
References: <20241119135104.595630-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_053825_518063_CA9D378A 
X-CRM114-Status: GOOD (  14.01  )
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

The driver checks whether mpam_partid_max and mpam_intpartid_max are equal
as a basis for supporting reqPARTID. If this feature is supported, use a
bitmap to represent whether the target reqPARTID is available or not.
Create the bitmap during monitor initialization, and the destructor is
called during the monitor exit process.

It is noted that the reqpartid_free_map reserves the first reqPARTID under
each intPARTID (which is equal to the corresponding intPARTID itself). By
default, assigns it to the corresponding control group for use in
monitoring.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/platform/arm64/mpam/mpam_resctrl.c | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index ac3d228befcf..dfd4125875d7 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -1005,6 +1005,33 @@ static void mpam_resctrl_monitor_init(struct mpam_class *class,
 	return;
 }
 
+static unsigned long *reqpartid_free_map;
+static int reqpartid_free_map_len;
+
+static int reqpartid_create(void)
+{
+	u32 reqpartid_num = get_num_reqpartid();
+	int i;
+
+	reqpartid_free_map = bitmap_alloc(reqpartid_num, GFP_KERNEL);
+	if (!reqpartid_free_map)
+		return -ENOMEM;
+
+	bitmap_fill(reqpartid_free_map, reqpartid_num);
+
+	/* Reserved for the internal partIDs mapping */
+	for (i = 0; i < resctrl_arch_get_num_closid(NULL); i++)
+		__clear_bit(i, reqpartid_free_map);
+
+	reqpartid_free_map_len = reqpartid_num;
+	return 0;
+}
+
+static void reqpartid_destroy(void)
+{
+	bitmap_free(reqpartid_free_map);
+}
+
 int mpam_resctrl_setup(void)
 {
 	int err = 0;
@@ -1052,6 +1079,10 @@ int mpam_resctrl_setup(void)
 
 	cpus_read_unlock();
 
+	err = reqpartid_create();
+	if (err)
+		return err;
+
 	if (!err && !exposed_alloc_capable && !exposed_mon_capable)
 		err = -EOPNOTSUPP;
 
@@ -1080,6 +1111,8 @@ static void mpam_resctrl_exit(void)
 
 	WRITE_ONCE(resctrl_enabled, false);
 	resctrl_exit();
+
+	reqpartid_destroy();
 }
 
 
-- 
2.25.1


