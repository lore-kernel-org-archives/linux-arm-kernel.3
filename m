Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188BAEBFD16
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yw+HF7RpwhnK0fVJzlDYt8d8/CD4wE+/irYw9MBaZMo=; b=TIHK7Ifd76cjSms2EHeBv46rGq
	yicUMjyVU1lgc+Cd5nccdm0EHnTTNIwS4BYeHIdwN8VlGGL0JQbGHM+SrHxaAygj2l8fncVQFIUAB
	JwgzFUSgzPZO36twjL0pPftROOcnHqY3AxXn3gmS5CnPA7HTGY+uwcyRW+MuuArcZ2cdvRKAZe6Ag
	6n/V+O5d9v9H/WyW8N09CARUwGtqJLuPHOqtG/imyLQ9nEyLlAClwC6py/yXAXJFfCzu6SiCfTHjm
	JrJJWwh7SHJacR1gkK+IT8od41OIQjg9CtpwSO7P3iG9I6jsjw3fGrkVQpRR3obnvKQAM78+CcGvn
	tTBK8+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD3v-0000000FJ8R-3VT3;
	Mon, 13 Apr 2026 08:54:31 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD3s-0000000FJ7X-3IF7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:54:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yw+HF7RpwhnK0fVJzlDYt8d8/CD4wE+/irYw9MBaZMo=;
	b=cSgw0M84Ss+O8CGToZbwz/5wVzN23c1/ickwDFelK5Kwe9FW7vVp0D4adfGQoxXE3W7p6smt9
	H4qMnKieZgcsLU5ys3BSfGFLKP1K1aJdlPDpWivqW5lbFuan/U+GMvWdMOvnLOsCZ1iv5mACUds
	ZTyzfaY+FevczLqHOX3kKxw=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fvLdw0J6xzLlSv;
	Mon, 13 Apr 2026 16:48:04 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 5B1EF40565;
	Mon, 13 Apr 2026 16:54:20 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 13 Apr
 2026 16:54:19 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tan.shaopeng@jp.fujitsu.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tglx@kernel.org>, <will@kernel.org>, <hpa@zytor.com>,
	<bp@alien8.de>, <babu.moger@amd.com>, <dave.hansen@linux.intel.com>,
	<mingo@redhat.com>, <tony.luck@intel.com>, <gshan@redhat.com>,
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>
Subject: [PATCH v8 next 09/10] fs/resctrl: Wire up rmid expansion and reclaim functions
Date: Mon, 13 Apr 2026 16:54:04 +0800
Message-ID: <20260413085405.1166412-10-zengheng4@huawei.com>
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
X-CRM114-CacheID: sfid-20260413_015429_517328_36A56BBC 
X-CRM114-Status: GOOD (  15.58  )
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

The previous patch implemented resctrl_arch_rmid_expand() and
resctrl_arch_rmid_reclaim() for ARM MPAM. This patch integrates
these architecture-specific functions into the generic resctrl layer.

Refactor resctrl_find_free_rmid() to support dynamic rmid expansion.
If no free rmid is available for the current closid, attempt to expand
via resctrl_arch_expand_rmid(). On success, retry the rmid allocation.

As this capability is architecture-specific, x86 maintains its existing
behavior by returning -ENOSPC when rmid resources are exhausted.

Additionally, invoke resctrl_arch_rmid_reclaim() when rmids are released
to enable architecture-specific resource cleanup.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 arch/x86/include/asm/resctrl.h |  7 +++++++
 fs/resctrl/monitor.c           | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 575f8408a9e7..7f8c8d84f2a0 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -167,6 +167,13 @@ static inline void resctrl_arch_sched_in(struct task_struct *tsk)
 		__resctrl_sched_in(tsk);
 }
 
+static inline int resctrl_arch_rmid_expand(u32 closid)
+{
+	return -ENOSPC;
+}
+
+static inline void resctrl_arch_rmid_reclaim(u32 closid, u32 rmid) {}
+
 static inline void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
 {
 	*rmid = idx;
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 7473c43600cf..3ac86995278e 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -122,6 +122,8 @@ static void limbo_release_entry(struct rmid_entry *entry)
 
 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
 		closid_num_dirty_rmid[entry->closid]--;
+
+	resctrl_arch_rmid_reclaim(entry->closid, entry->rmid);
 }
 
 /*
@@ -197,7 +199,7 @@ bool has_busy_rmid(struct rdt_l3_mon_domain *d)
 	return find_first_bit(d->rmid_busy_llc, idx_limit) != idx_limit;
 }
 
-static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
+static struct rmid_entry *__resctrl_find_free_rmid(u32 closid)
 {
 	struct rmid_entry *itr;
 	u32 itr_idx, cmp_idx;
@@ -214,7 +216,12 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 		 * very first entry will be returned.
 		 */
 		itr_idx = resctrl_arch_rmid_idx_encode(itr->closid, itr->rmid);
+		if (itr_idx == U32_MAX)
+			continue;
+
 		cmp_idx = resctrl_arch_rmid_idx_encode(closid, itr->rmid);
+		if (cmp_idx == U32_MAX)
+			continue;
 
 		if (itr_idx == cmp_idx)
 			return itr;
@@ -223,6 +230,25 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 	return ERR_PTR(-ENOSPC);
 }
 
+static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
+{
+	struct rmid_entry *err;
+	int ret;
+
+	err = __resctrl_find_free_rmid(closid);
+	if (err == ERR_PTR(-ENOSPC)) {
+		ret = resctrl_arch_rmid_expand(closid);
+		if (ret < 0)
+			/* Out of rmid */
+			goto out;
+
+		/* Try it again */
+		return __resctrl_find_free_rmid(closid);
+	}
+out:
+	return err;
+}
+
 /**
  * resctrl_find_cleanest_closid() - Find a CLOSID where all the associated
  *                                  RMID are clean, or the CLOSID that has
@@ -342,8 +368,10 @@ void free_rmid(u32 closid, u32 rmid)
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
 		add_rmid_to_limbo(entry);
-	else
+	else {
 		list_add_tail(&entry->list, &rmid_free_lru);
+		resctrl_arch_rmid_reclaim(closid, rmid);
+	}
 }
 
 bool rmid_is_occupied(u32 closid, u32 rmid)
-- 
2.25.1


