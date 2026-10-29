Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC1D606B7C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FvGaF1v/;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=nKJc9w+Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XmJpCilJ0NrhUf/tBqHBeO1E7rwkKvK5lUeDCabogN4=; b=FvGaF1v/WPFWTvvgqQLv/6xvcp
	4pqblPqHwdju/py8nGg/gMjFLqbA1Mfza+pMEBk2/UdlrwqNWxM9zE9ushOcEHUQ67P6Cyx3/lznz
	eE7qo/qDxuLs0+rPs6LyIC3bxdzWHPVctBN1nbpn9WiV6jAeDIvaGvVITgZXmdZ3ha1B4MQ3uKvkG
	/GnaFavr8IAJtTnvS1YEFBkM+rqGxBMA7zwvIJNjeSiY+hazXnQe5iZaMUn0exrGTQAX/gQ+ICbiX
	eUUodjPQb88YsI/FIT50wo1zUcXheW8Qw03bRr1imLT/q7spUOUwPc7Xv4QPMWloWA0Tf/O0Qv3kU
	nMwR070Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNL-00000009Add-2vsl;
	Thu, 29 Oct 2026 12:36:59 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPN6-00000009AQH-3b4C;
	Thu, 29 Oct 2026 12:36:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XmJpCilJ0NrhUf/tBqHBeO1E7rwkKvK5lUeDCabogN4=;
	b=nKJc9w+ZL78VOOjkz6CwWvxh4dcm6an9Y6V1AmIHDvM0kCdquSFORkclnDUOrrN9v+lY8Egyn
	2JCujhqw2SIlL9Rik4LpDNNnS/qBR63xkpazH+Vzg+mUisfeMOE717EWSWWHqgutG+EaTGjAlxn
	Mqoiu/pPap2YWZiQdjWmwwc=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHZ0QJ2zcb3s;
	Thu, 29 Oct 2026 20:36:26 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id F2D38202E6;
	Thu, 29 Oct 2026 20:36:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 05/19] arm_mpam: resctrl: Use the resource-agnostic monitor event names
Date: Thu, 29 Oct 2026 20:35:57 +0800
Message-ID: <20261029123611.1108424-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_053645_247146_BC83185B 
X-CRM114-Status: GOOD (  14.01  )
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

The monitor event IDs no longer carry L3 in their names. Switch the MPAM
driver over to the new names.

No functional change.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 886f0595d364..e436c3e6d4fc 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -45,7 +45,7 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
  * to those supported by MPAM.
  * Class pointer may be NULL.
  */
-#define MPAM_MAX_EVENT QOS_L3_MBM_TOTAL_EVENT_ID
+#define MPAM_MAX_EVENT QOS_MBM_TOTAL_EVENT_ID
 static struct mpam_resctrl_mon mpam_resctrl_counters[MPAM_MAX_EVENT + 1];
 
 #define for_each_mpam_resctrl_mon(mon, eventid)					\
@@ -173,7 +173,7 @@ static void resctrl_reset_task_closids(void)
 
 static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID];
+	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[QOS_MBM_TOTAL_EVENT_ID];
 
 	if (!mon->class)
 		return;
@@ -392,11 +392,11 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid)
 		return -EINVAL;
 
 	switch (evtid) {
-	case QOS_L3_OCCUP_EVENT_ID:
+	case QOS_OCCUP_EVENT_ID:
 		/* With CDP, one monitor gets used for both code/data reads */
 		return mpam_alloc_csu_mon(mon->class);
-	case QOS_L3_MBM_LOCAL_EVENT_ID:
-	case QOS_L3_MBM_TOTAL_EVENT_ID:
+	case QOS_MBM_LOCAL_EVENT_ID:
+	case QOS_MBM_TOTAL_EVENT_ID:
 		return USE_PRE_ALLOCATED;
 	default:
 		return -EOPNOTSUPP;
@@ -436,7 +436,7 @@ static void resctrl_arch_mon_ctx_free_no_wait(enum resctrl_event_id evtid,
 	if (!mon->class)
 		return;
 
-	if (evtid == QOS_L3_OCCUP_EVENT_ID)
+	if (evtid == QOS_OCCUP_EVENT_ID)
 		mpam_free_csu_mon(mon->class, mon_idx);
 
 	wake_up(&resctrl_mon_ctx_waiters);
@@ -536,7 +536,7 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 	l3_dom = container_of(hdr, struct mpam_resctrl_dom, resctrl_mon_dom.hdr);
 	mon_comp = l3_dom->mon_comp[eventid];
 
-	if (eventid != QOS_L3_OCCUP_EVENT_ID)
+	if (eventid != QOS_OCCUP_EVENT_ID)
 		return -EINVAL;
 
 	mon_type = mpam_feat_msmon_csu;
@@ -557,7 +557,7 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 	if (!mpam_is_enabled())
 		return -EINVAL;
 
-	if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
+	if (eventid == QOS_OCCUP_EVENT_ID || !mon->class)
 		return -EINVAL;
 
 	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
@@ -614,7 +614,7 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 	if (!mpam_is_enabled())
 		return;
 
-	if (eventid == QOS_L3_OCCUP_EVENT_ID || !mon->class)
+	if (eventid == QOS_OCCUP_EVENT_ID || !mon->class)
 		return;
 
 	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
@@ -1131,7 +1131,7 @@ static void mpam_resctrl_pick_counters(void)
 				if (update_rmid_limits(class))
 					break;
 
-				counter_update_class(QOS_L3_OCCUP_EVENT_ID, class);
+				counter_update_class(QOS_OCCUP_EVENT_ID, class);
 				break;
 			default:
 				break;
@@ -1153,7 +1153,7 @@ static void mpam_resctrl_pick_counters(void)
 			 * and it's equivalent to mbm_total and so always use
 			 * mbm_total.
 			 */
-			counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
+			counter_update_class(QOS_MBM_TOTAL_EVENT_ID, class);
 		}
 	}
 }
@@ -1180,7 +1180,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 {
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
 
-	if (evtid != QOS_L3_MBM_TOTAL_EVENT_ID) {
+	if (evtid != QOS_MBM_TOTAL_EVENT_ID) {
 		pr_debug("unexpected event id\n");
 		return;
 	}
@@ -1197,7 +1197,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 		__config_cntr(mon, cntr_id, CDP_NONE, closid, rmid, assign);
 	}
 
-	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, QOS_L3_MBM_TOTAL_EVENT_ID);
+	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, QOS_MBM_TOTAL_EVENT_ID);
 }
 
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
@@ -1358,7 +1358,7 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 */
 	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
 
-	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
+	if (type == QOS_MBM_TOTAL_EVENT_ID) {
 		int err;
 
 		err = mpam_resctrl_monitor_init_abmc(mon);
-- 
2.34.1


