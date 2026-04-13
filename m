Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24B9EBFD1E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvhMMZp/GsQefc49ctoJ7WGEbW2EPdmBkUqroYz7npc=; b=b5HalCCYL42DnS7P9dl3RumrFE
	Jfd50BPROwu+lCPH4hc/sRYd+aAWJ9Y+TSQWBQcqQf2K2DujcPciCCdQbA8eoEMPmsKYAnYRUaK3H
	epWY/2vqZBHOJHhWXYcNzRSZ+Dfy+Y4t34hxx2chsKPZbIZnwMHpXIWss08AQ4xgy5F0tfBwVTE52
	RAo51CKJrOK2QOZB6R8d+ketA/P+TKPSKBmJ1OaIjL2oUloHeyh1q9oG4CIvV1J3R7o6yo9XQFNlE
	9N3OHRckY3siJ2av0SVVqNL/c3wIZjCfnwLt6i8lj7HcvKWzRulczWMOZ+Ha09ONyvZgVtc2NcLvh
	lSeeqGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4h-0000000FJNY-44bj;
	Mon, 13 Apr 2026 08:55:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4f-0000000FJKQ-0hoV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KvhMMZp/GsQefc49ctoJ7WGEbW2EPdmBkUqroYz7npc=; b=FqrNYD3IoJq86ZdIgP+hwEywhq
	ohJnJX4lE5mDlKTCF4/m0jDaHcUL5x7XgJ6aj2fMEDgT/okCQAUxo1cuIhGjtZ7wlMxgB+RHblWov
	gvGYyr1LRhXhjx1+6qp+KzseYxaH/1NheYzz9SwnmrQdQAJAiKsXKkIaFsdyhS+0epsjPSilOfnxY
	4ajiUkXRCUfvQ1AfZIBFLLAxSgTuVH85r5FjFkP8INhANZUvTta/T+ywQ9VE/RBxnadRiLNUZTb5d
	pJIA+bIKWM6c9JTG5xIvxKoucwFlNL3UV9OaduOkYRKAAoYaPHrsvcXMJQeWNsaLABc37+joVCD4E
	OaVqd3ew==;
Received: from [113.46.200.216] (helo=canpmsgout01.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4D-0000000GR5Z-24NQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:54:58 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KvhMMZp/GsQefc49ctoJ7WGEbW2EPdmBkUqroYz7npc=;
	b=dSY7AHX1foqKvJYvTnxqbZunGF5MwOhCAT7WEjawOb/HZPmZGdaLo76VfQP58fBR1EfujYFuC
	hsT40wtHMevHvgog4v5vkzO9wjYiTB+gnLokc3+U1shyIIhqgN/1xe4wfnfGBYfmh/Fm/QTIYFs
	5B+JvPGbl6ypDFGcTZCUYLQ=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fvLfF4p37z1T4JS;
	Mon, 13 Apr 2026 16:48:21 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 71B664056D;
	Mon, 13 Apr 2026 16:54:19 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 13 Apr
 2026 16:54:18 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tan.shaopeng@jp.fujitsu.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tglx@kernel.org>, <will@kernel.org>, <hpa@zytor.com>,
	<bp@alien8.de>, <babu.moger@amd.com>, <dave.hansen@linux.intel.com>,
	<mingo@redhat.com>, <tony.luck@intel.com>, <gshan@redhat.com>,
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>
Subject: [PATCH v8 next 07/10] fs/resctrl: Add rmid_entry state helpers
Date: Mon, 13 Apr 2026 16:54:02 +0800
Message-ID: <20260413085405.1166412-8-zengheng4@huawei.com>
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
X-CRM114-CacheID: sfid-20260413_095455_892625_12576165 
X-CRM114-Status: GOOD (  14.40  )
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

Introduce helper functions for rmid_entry management, in preparation
for upcoming patches supporting dynamic monitoring group allocation:

* rmid_is_occupied(): Query whether a RMID entry is currently allocated
  by checking if its list node has been removed from the free list.

* rmid_entry_reassign_closid(): Update the closid associated with a RMID
  entry.

Fix list node initialization in alloc_rmid() and dom_data_init() by
using list_del_init() instead of list_del(). This ensures list_empty()
checks in rmid_is_occupied() work correctly without encountering
LIST_POISON values.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 fs/resctrl/monitor.c    | 18 ++++++++++++++++--
 include/linux/resctrl.h | 21 +++++++++++++++++++++
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 9fd901c78dc6..7473c43600cf 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -286,7 +286,7 @@ int alloc_rmid(u32 closid)
 	if (IS_ERR(entry))
 		return PTR_ERR(entry);
 
-	list_del(&entry->list);
+	list_del_init(&entry->list);
 	return entry->rmid;
 }
 
@@ -346,6 +346,20 @@ void free_rmid(u32 closid, u32 rmid)
 		list_add_tail(&entry->list, &rmid_free_lru);
 }
 
+bool rmid_is_occupied(u32 closid, u32 rmid)
+{
+	u32 idx = resctrl_arch_rmid_idx_encode(closid, rmid);
+
+	return list_empty(&rmid_ptrs[idx].list);
+}
+
+void rmid_entry_reassign_closid(u32 closid, u32 rmid)
+{
+	u32 idx = resctrl_arch_rmid_idx_encode(closid, rmid);
+
+	rmid_ptrs[idx].closid = closid;
+}
+
 static struct mbm_state *get_mbm_state(struct rdt_l3_mon_domain *d, u32 closid,
 				       u32 rmid, enum resctrl_event_id evtid)
 {
@@ -945,7 +959,7 @@ int setup_rmid_lru_list(void)
 	idx = resctrl_arch_rmid_idx_encode(RESCTRL_RESERVED_CLOSID,
 					   RESCTRL_RESERVED_RMID);
 	entry = __rmid_entry(idx);
-	list_del(&entry->list);
+	list_del_init(&entry->list);
 
 	return 0;
 }
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 006e57fd7ca5..b636e7250c20 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -702,6 +702,27 @@ bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
+/**
+ * rmid_is_occupied() - Check whether the specified rmid has been
+ *                      allocated.
+ * @closid:	Specify the closid that matches the rmid.
+ * @rmid:	Specify the rmid entry to check status.
+ *
+ * This function checks if the rmid_entry is currently allocated by testing
+ * whether its list node is empty (removed from the free list).
+ *
+ * Return:
+ * True if the specified rmid is still in use.
+ */
+bool rmid_is_occupied(u32 closid, u32 rmid);
+
+/**
+ * rmid_entry_reassign_closid() - Update the closid field of a rmid_entry.
+ * @closid:	Specify the reassigned closid.
+ * @rmid:	Specify the rmid entry to update closid.
+ */
+void rmid_entry_reassign_closid(u32 closid, u32 rmid);
+
 int resctrl_init(void);
 void resctrl_exit(void);
 
-- 
2.25.1


