Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEBAF531EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 03:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4BHO+qZLneV2dNec9dyDj/FXpVOxuLCt+7V4TDDTRQ=; b=vtZKk+aa2OlKpEIccVmK64QbrP
	xIPZle2KJ8YUjMisvpgIL5UwLEoPB+xWCqBAthqTQAKBabvgdKKU+WoT2hP/on0A+s7CXKQjXRZbw
	RqHZt0zcjRG21iJJ/1mnazhh20gNfr+O+i+elfkQZQqOhSJ+8yVOR/13dJy/3M+yajKqanIvqNhgp
	PK8GQwJCBhAYHK9+xQgRaxUVJ5f1d+/kpCxZk3EA5pn+O2F7kjBh4IUavwHhzP7wp/cSW+JKjjCJm
	OJRtyvSNF68jr8BIVEt5YRncQRk7n/GtVxtdkNWYjfVQzqYUE7u3/FtFMcRKA7FuM/IYHWtcaBzgL
	bXNc/cZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUQW-0000000Gdhr-1RnN;
	Tue, 14 Apr 2026 03:27:00 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUQN-0000000Gdez-0Dsa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 03:26:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=m4BHO+qZLneV2dNec9dyDj/FXpVOxuLCt+7V4TDDTRQ=;
	b=amITPnG0InVHyuUe+6KJ3Q1OzNYKyBwJ1IwVrP0a8+JgvQV5QSB2RfXkUH7OStWcLBhHFrF1G
	jOSHPbp8kNgyJy9pa+SyXo8F6hpqZYF4qgtaBgEmfYtjk/uzauxk7JUs+NIhXE4fJGlTSa3aRoR
	sIphI+8Efr25E+k3Z5GtOKk=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fvqKn071dz1T4Gh;
	Tue, 14 Apr 2026 11:20:45 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id DEA3C4056E;
	Tue, 14 Apr 2026 11:26:43 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 14 Apr
 2026 11:26:43 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <james.morse@arm.com>, <Dave.Martin@arm.com>,
	<fenghuay@nvidia.com>, <reinette.chatre@intel.com>
CC: <xiaqinxin@huawei.com>, <sunnanyong@huawei.com>,
	<jonathan.cameron@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH mpam mpam/snapshot+extras/v6.18-rc1 v2 1/3] fs/resctrl: Fix incorrect PID parsing after IOMMU group token
Date: Tue, 14 Apr 2026 11:26:08 +0800
Message-ID: <20260414032610.1523958-2-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260414032610.1523958-1-zengheng4@huawei.com>
References: <20260414032610.1523958-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_202651_420917_09ACD07A 
X-CRM114-Status: GOOD (  13.07  )
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

When the tasks interface receives an "iommu_group:id" configuration,
the original code fails to skip the PID parsing logic after processing
the IOMMU group. This causes the same token to be incorrectly passed
to kstrtoint() as a PID, resulting in -EINVAL.

Restructure the conditional logic to use explicit if-else branches,
ensuring that IOMMU group tokens are processed by rdtgroup_move_iommu()
and then skipped.

This fix also enables proper handling of mixed configurations with
multiple consecutive iommu_group:id and pid entries (e.g.,
echo "iommu_group:1,1234,iommu_group:2,5678" > tasks).

Fixes: 98b622c413ee ("fs/resctrl: Add support for assigning iommu_groups to resctrl groups")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 fs/resctrl/rdtgroup.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5381233adceb..1810ace9538f 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -848,24 +848,33 @@ static ssize_t rdtgroup_tasks_write(struct kernfs_open_file *of,
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


