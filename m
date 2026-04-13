Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E5AEBFD16
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJ/Fu8UkQxan6cDqeDBa1wfhWDhaxcfUlfU7YUO4zqI=; b=HsdgaJ2dmYiF9qvagjv1FYrfTb
	8uWXCAJdACWlbeehmzyY+Nk40wMhrZvYxCHn6tRCOaDNDRCUyyOXOq15ez9y8z2Bg+LltS4dU+rhe
	/n/Uo2tFujDdylCM0OZIEHIPhQ96Dsfcyvk7u10TEVsKe8MMMF6zTOnGSLLRCHo7xW2oXWXLzWZks
	BPdMzkwIGoK+1wNUgm5eNmULiNGAnOX3HjjQAdu/jmMQcmBOIlovvG/8wNob2TSWmjlA/PAkMqCS0
	Xd5sWgsgm0TyetIKUkqvidbA6b8L+CMHC9tI6UgsKZoghUuHXPUX9TlSAegE0uJn7GEgpuzJvIbdS
	FNWjAzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4h-0000000FJMx-2gIr;
	Mon, 13 Apr 2026 08:55:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4e-0000000FJK6-2DDy
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eJ/Fu8UkQxan6cDqeDBa1wfhWDhaxcfUlfU7YUO4zqI=; b=H+IhfGNe/KqJubAaRm2WU8pQ4Q
	sgZBvzpik3TJAQ0QDxg9nBjQaFS0vdfBUFQgvuYeMTup+GhdNW/3rKu6ZVj54SojumFL9Fr5oalLp
	bfzOO1p8mW2vLjpphYoue9jzJgfMp4vO3SgY7xaDD1SkWkEhbFF/Wb+KBA5V8zhs/JxWjaYCShIWw
	blKU9Y9M4DNG1WuNPY58uNIogi5ddZSPb7HngQLAEmuplo8Ga003EMe3/xcCDOloxHvwoAny656Eq
	m28uracmCOxdDAUiy2fIQdUIGHKNXa1mvMwjAizX3jFnUOghZtAJp+aTuWFjU6HCA9OFqsYsLTYap
	ySsVP6lA==;
Received: from [113.46.200.226] (helo=canpmsgout11.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD47-0000000GR5W-26h7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:54:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=eJ/Fu8UkQxan6cDqeDBa1wfhWDhaxcfUlfU7YUO4zqI=;
	b=p10X20NxTM6rnCJL3c2Cl4mb2R6bnAxpvth0gd5Syerxzr6CTWHArByK91h0iRkeUymhWWiyh
	FGiut8GUr4L40eT51d/Al1GHOAMYTEoc3p1QOL/Y7AfBFGU3z7ctA2K/gXySHvEUFV/3qQfXKcj
	P8pwvj9/Qjy2d7VWzgIdMiI=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fvLdp4Fl9zKm9R;
	Mon, 13 Apr 2026 16:47:58 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 8691940572;
	Mon, 13 Apr 2026 16:54:17 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 13 Apr
 2026 16:54:16 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tan.shaopeng@jp.fujitsu.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tglx@kernel.org>, <will@kernel.org>, <hpa@zytor.com>,
	<bp@alien8.de>, <babu.moger@amd.com>, <dave.hansen@linux.intel.com>,
	<mingo@redhat.com>, <tony.luck@intel.com>, <gshan@redhat.com>,
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>
Subject: [PATCH v8 next 03/10] arm_mpam: Disable reqPARTID expansion when Narrow-PARTID is unavailable
Date: Mon, 13 Apr 2026 16:53:58 +0800
Message-ID: <20260413085405.1166412-4-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260413085405.1166412-1-zengheng4@huawei.com>
References: <20260413085405.1166412-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_095444_346237_1FB29ACC 
X-CRM114-Status: GOOD (  13.97  )
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

MPAM supports heterogeneous systems where some type of MSCs may implement
Narrow-PARTID while others do not. However, when an MSC uses
percentage-based throttling (non-bitmap partition control) and lacks
Narrow-PARTID support, resctrl cannot correctly apply control group
configurations across multiple PARTIDs.

To enable free assignment of multiple reqPARTIDs to resource control
groups, all MSCs used by resctrl must either: Implement Narrow-PARTID,
allowing explicit PARTID remapping, or only have stateless resource
controls (non-percentage-based), such that splitting a control group
across multiple PARTIDs does not affect behavior.

The detection occurs at initialization time on the first call to
get_num_reqpartid() from update_rmid_limits(). This call is guaranteed
to occur after mpam_resctrl_pick_{mba,caches}() have set up the
resource classes, ensuring the necessary properties are available
for the Narrow-PARTID capability check.

When an MSC with percentage-based control lacks Narrow-PARTID support,
get_num_reqpartid() falls back to returning the number of intPARTIDs,
effectively disabling the reqPARTID expansion for monitoring groups.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 43 +++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5f4364c8101a..56859f354efa 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -257,9 +257,50 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
 	return mpam_intpartid_max + 1;
 }
 
+/*
+ * Determine the effective number of PARTIDs available for resctrl.
+ *
+ * This function performs a one-time check to determine if Narrow-PARTID
+ * can be used. It must be called after mpam_resctrl_pick_{mba,caches}()
+ * have initialized the resource classes, as class properties are used
+ * to detect Narrow-PARTID support.
+ *
+ * The first call occurs in update_rmid_limits(), ensuring the
+ * prerequisite initialization is complete.
+ */
+static u32 get_num_reqpartid(void)
+{
+	struct mpam_resctrl_res *res;
+	struct mpam_props *cprops;
+	static bool first = true;
+	int rid;
+
+	if (first) {
+		for_each_mpam_resctrl_control(res, rid) {
+			if (!res->class)
+				continue;
+
+			cprops = &res->class->props;
+			if (mpam_has_feature(mpam_feat_partid_nrw, cprops))
+				continue;
+
+			if (mpam_has_feature(mpam_feat_mbw_max, cprops) ||
+			    mpam_has_feature(mpam_feat_mbw_min, cprops) ||
+			    mpam_has_feature(mpam_feat_cmax_cmax, cprops) ||
+			    mpam_has_feature(mpam_feat_cmax_cmin, cprops)) {
+				mpam_partid_max = mpam_intpartid_max;
+				break;
+			}
+		}
+	}
+
+	first = false;
+	return mpam_partid_max + 1;
+}
+
 u32 resctrl_arch_system_num_rmid_idx(void)
 {
-	return (mpam_pmg_max + 1) * (mpam_partid_max + 1);
+	return (mpam_pmg_max + 1) * get_num_reqpartid();
 }
 
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
-- 
2.25.1


