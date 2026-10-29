Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A263606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wXjZsXl3;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=m3S34qm3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8u3BYJaHqnf1MKubNHyfB+r6z0l4E8xIBKgFoRWzhuY=; b=wXjZsXl3pO9unhlb1BoT4ylsHL
	EUJSPxyVnInhYFCRpJrTrx1xnfprECa/X/R+hbX7rvrSUCqz8hKNKVAUU3Yu5aEM7Z4AqvnuUsI0A
	CJdAUPgAJy8xz1ESyKAko6GX+M9kUMb8rDu/ojLRFiMsJbaNP6++Z9XNwMbgkSpcAxZRU4XVWvy1x
	la4GxDsEcXH8nwTYOlxyZixAcUrq0XNt8NTlq3wejGHkfa6meDpmUuv5GStO8R9vS4J3mGqpFEOeA
	bcJlzpW/jmASM797NsSp1AxdK105tRLNIctn7+6NHLGzsA6y0uD8wq7kz1/hFHWaWvz6GMRKpiA9p
	6tQ/m2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNg-00000009Ayt-3irv;
	Thu, 29 Oct 2026 12:37:20 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPN7-00000009AQ2-16pq;
	Thu, 29 Oct 2026 12:36:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8u3BYJaHqnf1MKubNHyfB+r6z0l4E8xIBKgFoRWzhuY=;
	b=m3S34qm3A8s6Puk55buB3KMBs/HBGOQAHrmbs41kd2QmUHZOX5gLlZNIEn3XZM/E1tIjs/kJR
	G+YqlgtJ8EjKim8LG1st5lrM4Bg0WTKWe3wiSBergRux78j3Utvj0vnhOinkUHXs0gRLXfjRRFK
	pYvR9wwsEep8cnZ8ZKigReQ=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHz3vKJznTZy;
	Thu, 29 Oct 2026 20:36:47 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2CFCC40586;
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
Subject: [RFC PATCH v2 04/19] x86/resctrl: Use the resource-agnostic monitor event names
Date: Thu, 29 Oct 2026 20:35:56 +0800
Message-ID: <20261029123611.1108424-5-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261029_053645_679402_E3F90044 
X-CRM114-Status: GOOD (  12.03  )
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

The monitor event IDs no longer carry L3 in their names. Switch x86 over
to the new names. The values are unchanged, so this does not change what
is written to IA32_QM_EVTSEL.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/kernel/cpu/resctrl/core.c     | 10 +++++-----
 arch/x86/kernel/cpu/resctrl/internal.h |  2 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c |  8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 55214d6fdc49..8842e3406ca5 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -887,9 +887,9 @@ bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
 		return false;
 
 	switch (evt) {
-	case QOS_L3_MBM_TOTAL_EVENT_ID:
+	case QOS_MBM_TOTAL_EVENT_ID:
 		return rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL);
-	case QOS_L3_MBM_LOCAL_EVENT_ID:
+	case QOS_MBM_LOCAL_EVENT_ID:
 		return rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL);
 	default:
 		return false;
@@ -969,15 +969,15 @@ static __init bool get_rdt_mon_resources(void)
 	bool ret = false;
 
 	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
-		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, false, 0, NULL);
+		resctrl_enable_mon_event(QOS_OCCUP_EVENT_ID, false, 0, NULL);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL)) {
-		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID, false, 0, NULL);
+		resctrl_enable_mon_event(QOS_MBM_TOTAL_EVENT_ID, false, 0, NULL);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL)) {
-		resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID, false, 0, NULL);
+		resctrl_enable_mon_event(QOS_MBM_LOCAL_EVENT_ID, false, 0, NULL);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_ABMC))
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e3cfa0c10e92..1abb4b6d01e4 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -77,7 +77,7 @@ struct rdt_hw_ctrl_domain {
  */
 struct rdt_hw_l3_mon_domain {
 	struct rdt_l3_mon_domain	d_resctrl;
-	struct arch_mbm_state		*arch_mbm_states[QOS_NUM_L3_MBM_EVENTS];
+	struct arch_mbm_state		*arch_mbm_states[QOS_NUM_MBM_EVENTS];
 };
 
 static inline struct rdt_hw_ctrl_domain *resctrl_to_arch_ctrl_dom(struct rdt_ctrl_domain *r)
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 5ffa39fa86fa..825d71b14b4f 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -68,16 +68,16 @@ void resctrl_arch_sync_cpu_closid_rmid(void *info)
  *                              configurable event
  * @evtid: event id.
  *
- * Return: 0 for evtid == QOS_L3_MBM_TOTAL_EVENT_ID
- *         1 for evtid == QOS_L3_MBM_LOCAL_EVENT_ID
+ * Return: 0 for evtid == QOS_MBM_TOTAL_EVENT_ID
+ *         1 for evtid == QOS_MBM_LOCAL_EVENT_ID
  *         INVALID_CONFIG_INDEX for invalid evtid
  */
 static inline unsigned int mon_event_config_index_get(u32 evtid)
 {
 	switch (evtid) {
-	case QOS_L3_MBM_TOTAL_EVENT_ID:
+	case QOS_MBM_TOTAL_EVENT_ID:
 		return 0;
-	case QOS_L3_MBM_LOCAL_EVENT_ID:
+	case QOS_MBM_LOCAL_EVENT_ID:
 		return 1;
 	default:
 		/* Should never reach here */
-- 
2.34.1


