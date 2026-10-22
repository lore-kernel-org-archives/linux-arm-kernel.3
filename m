Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01BB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zX0GhKcE;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=57o66HfQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Npg9y1GXnueQN65R8UeXXt5YG0F2yx26M10/k3Llflw=; b=zX0GhKcEd0k+A2Hr6JvhqueYCB
	4BlEFVsjTo0wVSM7O8hkcY7c9mJhhgN/LYEMbw8UVDTyUnLFMqaSjZAIT86377S8FppubjVw2azDv
	cxBfXr8qlpBl7mttGuyH1ob6iT6lcR5y0w+XHaO2T66dhqyRIF1L8njx11fjvJepkGf0TpGi5w0Ii
	Q88jZa3ELB4tSKfidc+5D21mg5tJ32Cju2HBlmu3TRQNrGh66tBd0eQC3SaTcAyk4w/i1mtGxK+M7
	5YRmC03qXDaC7yULOHOUDFfasSGl+fbEuaFvW2VZjdo+hD1wRgr1VTKInPbqCY7xRCUcZVryMN370
	5MBbYy8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoTx-0000000DkmN-0cxj;
	Thu, 22 Oct 2026 08:49:05 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoTq-0000000DkjI-3qDS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:49:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Npg9y1GXnueQN65R8UeXXt5YG0F2yx26M10/k3Llflw=;
	b=57o66HfQ6jIfNh+NnSejPIp9KSbUD4EEkFVzbPIkdG3x9oj20VTiwpV88IB+O+Y/efdR0i18g
	SJzaOXHsrHVtnQ4nz1AlsCF+KGrlAnvzabBtQhvM0iIGQYQXFV3lwi5u5cQo8Vo/p0hQvSggkcg
	8+OzzYzq2hd0ezKFdo5fN9U=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ902ZRzcb3K;
	Thu, 22 Oct 2026 16:48:49 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id AB3C14057D;
	Thu, 22 Oct 2026 16:48:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:48:50 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 5/7] arm_mpam: resctrl: Describe the L2 monitor events with the L2 resource
Date: Thu, 22 Oct 2026 16:48:19 +0800
Message-ID: <20261022084821.4014873-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022084821.4014873-1-ruanjinjie@huawei.com>
References: <20261022084821.4014873-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_014859_819400_0699F7D2 
X-CRM114-Status: GOOD (  18.41  )
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

mpam_resctrl_monitor_init() forced every event onto the L3 resource.
Describe the L2 events with the L2 resource instead: the occupancy and
bandwidth events of an L2 cache belong to the L2 resource, which keeps
info/L2_MON in step with the hardware it measures.

No behaviour change yet: the events are only initialised once the caller
starts iterating over them.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 52 +++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index efb9ce76acb4..50e5035dcc9d 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1336,26 +1336,47 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 				     enum resctrl_event_id type)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	struct rdt_resource *l3 = &res->resctrl_res;
+	enum resctrl_res_level res_level;
+	struct mpam_resctrl_res *res;
+	struct rdt_resource *r;
+	int cache_level;
 
 	lockdep_assert_cpus_held();
 
+	switch (type) {
+	case QOS_L2_OCCUP_EVENT_ID:
+	case QOS_L2_MBM_CORE_EVENT_ID:
+		cache_level = 2;
+		res_level = RDT_RESOURCE_L2;
+		break;
+	case QOS_L3_OCCUP_EVENT_ID:
+	case QOS_L3_MBM_LOCAL_EVENT_ID:
+	case QOS_L3_MBM_TOTAL_EVENT_ID:
+		cache_level = 3;
+		res_level = RDT_RESOURCE_L3;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	res = &mpam_resctrl_controls[res_level];
+	r = &res->resctrl_res;
+
 	/*
-	 * There also needs to be an L3 cache present.
+	 * There also needs to be a cache at the level we're describing.
 	 * The check just requires any online CPU and it can't go offline as we
 	 * hold the cpu lock.
 	 */
-	if (get_cpu_cacheinfo_id(raw_smp_processor_id(), 3) == -1)
+	if (get_cpu_cacheinfo_id(raw_smp_processor_id(), cache_level) == -1)
 		return 0;
 
 	/*
-	 * If there are no MPAM resources on L3, force it into existence.
-	 * topology_matches_l3() already ensures this looks like the L3.
-	 * The domain-ids will be fixed up by mpam_resctrl_domain_hdr_init().
+	 * If there are no MPAM resources at this level, force it into
+	 * existence so the counters have somewhere to live. The domain-ids
+	 * will be fixed up by mpam_resctrl_domain_hdr_init().
 	 */
 	if (!res->class) {
-		pr_warn_once("Faking L3 MSC to enable counters.\n");
+		pr_warn_once("Faking L%d MSC to enable counters.\n", cache_level);
 		res->class = mpam_resctrl_counters[type].class;
 	}
 
@@ -1364,8 +1385,13 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * monitoring class.
 	 * Setting name is necessary on monitor only platforms.
 	 */
-	l3->name = "L3";
-	l3->mon_scope = RESCTRL_L3_CACHE;
+	if (cache_level == 3) {
+		r->name = "L3";
+		r->mon_scope = RESCTRL_L3_CACHE;
+	} else {
+		r->name = "L2";
+		r->mon_scope = RESCTRL_L2_CACHE;
+	}
 
 	/*
 	 * num-rmid is the upper bound for the number of monitoring groups that
@@ -1375,7 +1401,7 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * this does mean userspace needs to know the architecture to correctly
 	 * interpret this value.
 	 */
-	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	r->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
 
 	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
 		int err;
@@ -1385,13 +1411,13 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 			return err;
 
 		static_assert(MAX_EVT_CONFIG_BITS == 0x7f);
-		l3->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
+		r->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
 	}
 
 	if (!resctrl_enable_mon_event(type, false, 0, NULL))
 		return -EINVAL;
 
-	l3->mon_capable = true;
+	r->mon_capable = true;
 
 	return 0;
 }
-- 
2.43.0


