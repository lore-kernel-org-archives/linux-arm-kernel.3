Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0D0606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mrmEelQx;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tEhZGALr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=K0+K6t8UvYYDmVVxcB8pVTT3JL6zkZOYzHJ2khqwGZU=; b=mrmEelQxY0N+WIyeYCJpnW/zL7
	q5TvzYVyulKQ4o5r6xr0PfpYia2grHE950yVDoD8mcMcGeWes8daQv0Yvmu1bS1k//3wT5yfRtDQW
	Ceeg8OzeSo4phcDD0wM9GC+3vE6bdMDzfXF9x3JT33S6sy4JSIOrFCWVJ7K6Cn888/cSlZHyh0IdT
	q9hksAnaNyEpDJJKRrPtQUar9qe9YUGM9nWukOsd9eCNhtfIrW1SxWyiIdHAUyyC9cY3MobBsJk/A
	hDBdrKIoO1uQ6lOF8M66n0+U7CQ2eZOhoM/eGc5nvVdTh7Eq6xtS4Vj61jXP+Y8vrkbbnycDxaKSv
	1o+kcQGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOY30-00000004yQT-2pM0;
	Wed, 04 Nov 2026 10:16:50 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOY2y-00000004yPJ-21l2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:16:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=K0+K6t8UvYYDmVVxcB8pVTT3JL6zkZOYzHJ2khqwGZU=;
	b=tEhZGALrgrwyLOLok3S2AMOxh8lV5/QceXERZl+ODI9v3m1eVL+AoUnmlB8pnhHEVHoqE1NIX
	Q7NPXlehPQ716vm13QgBCPDLpj1HlJutLX5/u+h1aYD42GsD79Ygo0nZ2GnD3Air3R8vwF9heTa
	USD0Ya/euT0h6VDmI18lMpo=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jKLvZ0VZXz12LCq;
	Wed,  4 Nov 2026 18:16:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 36B1F40561;
	Wed,  4 Nov 2026 18:16:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 18:16:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<jic23@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] arm_mpam: Round the CDP RMID count down to whole CLOSIDs
Date: Wed, 4 Nov 2026 18:16:22 +0800
Message-ID: <20261104101622.563280-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_021648_694818_7F65AB6E 
X-CRM114-Status: GOOD (  11.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

resctrl_arch_set_cdp_enabled() halves the whole RMID index space, while
the resctrl core halves the CLOSID count: schemata_list_add() divides a
CDP resource's schema by two, and closid_init() takes the smallest
across the schemata.

When the PMG count and the CLOSID count are both odd, halving the
product counts RMIDs that belong to a CLOSID resctrl never allocates.
With 3 PMGs and 5 CLOSIDs MPAM reports 7 RMIDs, but the 2 CLOSIDs that
resctrl has times 3 PMGs only allow 6. The count is visible in
/sys/fs/resctrl/info/L3_MON/num_rmids, so userspace reads a value that
includes RMIDs no CLOSID can use; RMID allocation itself is bounded by
the free list.

Derive the number of RMID groups from the index space and halve that, so
the count follows resctrl_arch_system_num_rmid_idx().

Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1.x
Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..d3f957162b68 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -217,10 +217,16 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	cdp_enabled = enable;
 	mpam_resctrl_controls[rid].cdp_enabled = enable;
 
-	if (enable)
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
-	else
+	if (enable) {
+		u32 num_group;
+
+		/* Halve the number of RMID groups, keeping whole PMG rows. */
+		num_group = resctrl_arch_system_num_rmid_idx() /
+			    (mpam_pmg_max + 1);
+		l3->mon.num_rmid = (mpam_pmg_max + 1) * (num_group / 2);
+	} else {
 		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	}
 
 	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
 	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
-- 
2.34.1


