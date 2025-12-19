Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E814D78770
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzPdoC4Kv3093opi1Gs79rDWGwzNcp1r1ca/PltDYQA=; b=SLL+5OXWSFhMv10Q4/JHhWlBGI
	wy35yB5dP/VQR4JjntPCBoMDwfEQIDxyK2U9grhp4N8ZFmHBBTua5j+4JzUQdyPrtsA0Q8rJN95Qh
	h/IhZ1vT81GMY7rF9WKrKlAnShNvgtlcbcf0t+lGYzyEA4LqR0GWgPTxIdmztOcCO6Nq2YvU6oMbt
	P6w1tUFiHP4M6zoi1sd5KTQROyiIcQfoGz2R4aSFI2zF1FqlmJZQM20T5nYzbxDV/FZuv6QSzTJTz
	8wq6bpEkg+gNyjbmxUlUKr8CccqO4nA42LbAYjGbiJqxcKHJmDIHgsmAwMXqwIhAM5OSUS61zCOGB
	trKToWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWeyp-0000000AlyH-0jVM;
	Fri, 19 Dec 2025 18:13:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWeye-0000000Almq-3eI1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 18:13:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95A46FEC;
	Fri, 19 Dec 2025 10:13:11 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6F083F5CA;
	Fri, 19 Dec 2025 10:13:13 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev
Subject: [PATCH v2 16/45] arm_mpam: resctrl: Sort the order of the domain lists
Date: Fri, 19 Dec 2025 18:11:18 +0000
Message-ID: <20251219181147.3404071-17-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219181147.3404071-1-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_101321_048238_6AAC6F99 
X-CRM114-Status: GOOD (  13.47  )
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

From: James Morse <james.morse@arm.com>

resctrl documents that the domains appear in numeric order in the schemata
file. This means a little more work is needed when bringing a domain
online.

Add the support for this, using resctrl_find_domain() to find the point to
insert in the list.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 4beeeded00ff..5481d9cc69d9 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -117,6 +117,21 @@ static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
 	return false;
 }
 
+static void mpam_resctrl_domain_insert(struct list_head *list,
+				       struct rdt_domain_hdr *new)
+{
+	struct rdt_domain_hdr *err;
+	struct list_head *pos = NULL;
+
+	lockdep_assert_held(&domain_list_lock);
+
+	err = resctrl_find_domain(list, new->id, &pos);
+	if (WARN_ON_ONCE(err))
+		return;
+
+	list_add_tail_rcu(&new->list, pos);
+}
+
 static struct mpam_resctrl_dom *
 mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 {
@@ -154,8 +169,7 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		ctrl_d = &dom->resctrl_ctrl_dom;
 		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, &ctrl_d->hdr);
 		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
-		/* TODO: this list should be sorted */
-		list_add_tail_rcu(&ctrl_d->hdr.list, &r->ctrl_domains);
+		mpam_resctrl_domain_insert(&r->ctrl_domains, &ctrl_d->hdr);
 		err = resctrl_online_ctrl_domain(r, ctrl_d);
 		if (err) {
 			dom = ERR_PTR(err);
@@ -169,8 +183,7 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		mon_d = &dom->resctrl_mon_dom;
 		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, &mon_d->hdr);
 		mon_d->hdr.type = RESCTRL_MON_DOMAIN;
-		/* TODO: this list should be sorted */
-		list_add_tail_rcu(&mon_d->hdr.list, &r->mon_domains);
+		mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
 		err = resctrl_online_mon_domain(r, mon_d);
 		if (err) {
 			dom = ERR_PTR(err);
-- 
2.43.0


