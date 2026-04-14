Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739DBF531EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 03:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=68fF55HV376pI4LjfwblJHU6ULTAGgkYdx9eR4Q2upg=; b=iKRV+TdoBLjfWTimlDoXvOql+D
	8eoB/7udCiMuk9L/wkLy0v2KpiHEsGGbNT4Y4JkA2SGsLK4Re1mf80HcGaYELKycJW0HcbagbAKuV
	hdw7aBwo9T1wECmKTuxSnP4tfo9yOj/Iw/AEc3iDsxgUljvLssfQyPGE76ZydVrMoG7qC2gt6YS9m
	YzAYhvdn3mFWIaywOWDPeVgCde+rWh55VTrOiKkaCWjA+xUzIrKJeelW++KM0sccx7mdix68b4JBd
	LwI6QMpRWlVa4o7qKBL7+OK5d036DDyG1JRyGqM8F/fzQz30WqrdX1fycOW9LCl1DweD50S0SrwrO
	yk4wjpAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUQQ-0000000GdgO-38zA;
	Tue, 14 Apr 2026 03:26:54 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUQM-0000000Gdey-3MQa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 03:26:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=68fF55HV376pI4LjfwblJHU6ULTAGgkYdx9eR4Q2upg=;
	b=mwxOITi5uUy0Mz9HZmI9XxLLXMu268AM/euaIa+2V9KlmZkgfTKaeOdBl01/TT/wLDGGEJyQr
	ybyrqAXDVpb9quQH8h2dE8yrwVePoW13hy+VOb4U2uQiXF+O79WSU+Q6nL/uuNgpio8CJ3AOM6c
	6om/h7T2Yz0nRa+YBzi+3oI=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fvqKS1r0Gz1K9BY;
	Tue, 14 Apr 2026 11:20:28 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 8BB6A4056C;
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
Subject: [PATCH mpam mpam/snapshot+extras/v6.18-rc1 v2 0/3] fs/resctrl: IOMMU group fixes for tasks interface and cleanup
Date: Tue, 14 Apr 2026 11:26:07 +0800
Message-ID: <20260414032610.1523958-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_202651_316549_08742F39 
X-CRM114-Status: UNSURE (   6.06  )
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

This fix patch is against the mpam/snapshot+extras/v6.18-rc1 branch at
https://kernel.googlesource.com/pub/scm/linux/kernel/git/morse/linux.git .

The patch series fixes several issues with IOMMU group handling in the
resctrl filesystem.

Changes
=======

Compared with v1:
  - Split patch 2 into separate patches 2 and 3.

Previous Versions
=================

  v1: https://lore.kernel.org/all/20251107063300.1580046-1-zengheng4@huawei.com/

---

Zeng Heng (3):
  fs/resctrl: Fix incorrect PID parsing after IOMMU group token
  fs/resctrl: Remove unused 'of' parameter from rdtgroup_move_iommu()
  fs/resctrl: Migrate IOMMU groups when removing resource groups

 fs/resctrl/rdtgroup.c | 91 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 18 deletions(-)

--
2.25.1


