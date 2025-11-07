Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC64CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 06:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0JpDoPakWYsOQgf+bX/kge5ophVP6G/4GHe/HQObQU=; b=umqZlRwrOnVYBprAW6JTF8jl47
	WTCfgftpUB9cbHX9GuEDhPiZxTeGikSmzVOPojV70s9LTv794KpfChKzU8/yOzkVUkdKM1OgopZjS
	fDEZL7r/qV3NoUYCZiqcsfTUNxdJpyeGBigDFeqwQskSYE2Kh2rkcksUcfLveMEdvm//GlBQDhFQJ
	Y4seUfmzWyNzzWRUXM0DS2xEtMHG/5u1ERfK64/h/m4JsSRAjKBXjdjNrgKATeRb9RVXXIQnfhZlp
	RjAaGy7xYKQRPtYWRYsipFlt+DyB0T0XrTga7C8dt0MiNOzETx3V68OEoTynmq+AZ8QXtC5JlR5L+
	daU7wDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHG2F-0000000Gjbj-0B7D;
	Fri, 07 Nov 2025 06:33:23 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHG2B-0000000Gjb1-2SpE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 06:33:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+0JpDoPakWYsOQgf+bX/kge5ophVP6G/4GHe/HQObQU=;
	b=aGEbnJ6hoQtDmcW++2e00Ja5p5u7IEHwfBBOCjVNeIHL3EH4G70yvaky9Py75FFfOlemsOTF/
	5QrqCWbLVfKQmRi2ru48ajMV5ldktqr9jK7op01lGNXl/o03XiLnH2k2MDFjF5/S2c8Yuf764Pb
	aEdut5lSjsw2kMkBtq/vNHc=
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4d2q2n6rk8zLlV9;
	Fri,  7 Nov 2025 14:31:29 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id EE91D140230;
	Fri,  7 Nov 2025 14:33:05 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Nov
 2025 14:33:05 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <james.morse@arm.com>, <Dave.Martin@arm.com>, <ben.horgan@arm.com>
CC: <sunnanyong@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <zengheng4@huawei.com>,
	<jonathan.cameron@huawei.com>
Subject: [PATCH mpam mpam/snapshot+extras/v6.17-rc2 1/2] fs/resctrl: Fix the iommu_group parsing process
Date: Fri, 7 Nov 2025 14:32:59 +0800
Message-ID: <20251107063300.1580046-2-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251107063300.1580046-1-zengheng4@huawei.com>
References: <20251107063300.1580046-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_223320_181346_EE69E6EF 
X-CRM114-Status: GOOD (  11.67  )
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

When the tasks interface receives the iommu_group:id configuration, it
should return after completing its parsing, and continue to the next
token, rather than erroneously proceeding directly to pid parsing.
Otherwise, an EINVAL error is returned.

This fix supports processing multiple consecutive iommu_group:id and pid
configurations.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 fs/resctrl/rdtgroup.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 839d568b8798..4f4468e11dca 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -854,24 +854,33 @@ static ssize_t rdtgroup_tasks_write(struct kernfs_open_file *of,
 		pid_str = strim(strsep(&buf, ","));
 
 		is_iommu = string_is_iommu_group(pid_str, &iommu_group_id);
-		if (is_iommu)
+		if (is_iommu) {
 			ret = rdtgroup_move_iommu(iommu_group_id, rdtgrp, of);
-		else if (kstrtoint(pid_str, 0, &pid)) {
-			rdt_last_cmd_printf("Task list parsing error pid %s\n", pid_str);
-			ret = -EINVAL;
-			break;
-		}
+			if (ret) {
+				rdt_last_cmd_printf("Error while processing iommu_group %d\n",
+						     iommu_group_id);
+				break;
+			}
+		} else {
+			if (kstrtoint(pid_str, 0, &pid)) {
+				rdt_last_cmd_printf("Task list parsing error pid %s\n",
+						     pid_str);
+				ret = -EINVAL;
+				break;
+			}
 
-		if (pid < 0) {
-			rdt_last_cmd_printf("Invalid pid %d\n", pid);
-			ret = -EINVAL;
-			break;
-		}
+			if (pid < 0) {
+				rdt_last_cmd_printf("Invalid pid %d\n", pid);
+				ret = -EINVAL;
+				break;
+			}
 
-		ret = rdtgroup_move_task(pid, rdtgrp, of);
-		if (ret) {
-			rdt_last_cmd_printf("Error while processing task %d\n", pid);
-			break;
+			ret = rdtgroup_move_task(pid, rdtgrp, of);
+			if (ret) {
+				rdt_last_cmd_printf("Error while processing task %d\n",
+						     pid);
+				break;
+			}
 		}
 	}
 
-- 
2.25.1


