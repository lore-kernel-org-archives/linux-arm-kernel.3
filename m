Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2961C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 11:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ou5GaBpzpum3afXoxpvGAImJ7izyNAtwjteF7zSL0Ik=; b=wwQaq2H7j7iy37g4Nir9lQEdnK
	4PU1X2CNqmmrakhphUorJjORUcgpcjl9GBlPQxrtgNr1rKvIUwOpYM7VM8t4G1R40CS2MHLtAFLt3
	qDcgQ7g1gRk/oWZnkEH3JQ0sl1rbLj6z8DqaegxouKB1GShvNqrW0dsifXVzo3eQKTFdcTa8F82uv
	zcnpomd1XAkgX4D4D7SK2H/8s4dxt5X/osPCoAKbyIvkC1GIx7FJNOgOkxzH7SZ0QzoDj24CXI3On
	4akzZccotzLQx1zI8ErS4U7ri9g8joMwKo5XDxQFnsbwG5CRH5A2VX9kNK7dT7BP5xzJ4uRhFLi3W
	JEFWf4WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnWc-00000007tsu-1wWA;
	Sat, 22 Feb 2025 11:18:26 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnTh-00000007tUF-0k68
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 11:15:27 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Z0PRw5SYnz1GCL0;
	Sat, 22 Feb 2025 19:10:36 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id B1327180103;
	Sat, 22 Feb 2025 19:15:16 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 22 Feb
 2025 19:15:16 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <Dave.Martin@arm.com>, <james.morse@arm.com>
CC: <bobo.shaobowang@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>
Subject: [PATCH mpam mpam/snapshot/v6.14-rc1 v2 2/5] arm_mpam: Add limitation for the Narrow-PARTID feature
Date: Sat, 22 Feb 2025 19:24:45 +0800
Message-ID: <20250222112448.2438586-3-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250222112448.2438586-1-zengheng4@huawei.com>
References: <20250222112448.2438586-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_031525_374156_11E36C33 
X-CRM114-Status: GOOD (  14.65  )
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

Because it needs to support mixed systems that include MSCs with and
without Narrow-PARTID support, there are the following incompatible
control issues.

If an MSC does not support Narrow-PARTID and its control method is not of
the "partition bitmap" type, then delivering the resctrl control group
configuration across multiple PARTIDs will change the user's expected
behavior.

Currently, there is no way to solve this problem by programming different
control values simply, so here decide to restrict the usage scenarios of
this feature. When we find that the MATA MSC does not support the
Narrow-PARTID feature, the driver will disable the feature, which means
get_num_reqpartid() directly returns the number of intPARTIDs.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/platform/arm64/mpam/mpam_resctrl.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index eedd308d9c88..f3f8fb0ff421 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -168,6 +168,21 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
 
 static u32 get_num_reqpartid(void)
 {
+	struct mpam_resctrl_res *res;
+	struct rdt_resource *r_mba;
+	struct mpam_props *cprops;
+
+	r_mba = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
+	res = container_of(r_mba, struct mpam_resctrl_res, resctrl_res);
+	cprops = &res->class->props;
+
+	/*
+	 * If the MBA does not support Narrow-PARTID,
+	 * then the feature should be disabled at the system level.
+	 */
+	if (!mpam_has_feature(mpam_feat_partid_nrw, cprops))
+		return resctrl_arch_get_num_closid(NULL);
+
 	return mpam_partid_max + 1;
 }
 
-- 
2.25.1


