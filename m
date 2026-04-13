Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F9BEBFD1C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKWzw0F9gxmnGXvNqVP7clmFxg02M0HiQi+0w4fA0i0=; b=KbD/4z3EqoNUPZNjFuvXqVr2WT
	nHkVHjwjnx4wZQV2Rk9CHUcAAZtV/aTkMkFfngQ5CZE3NvVzYOVt66wfqR01wtkGff+7Mvp46d3+7
	50+FOtXYsp+Z9Rf4gZsJu2+OxGhqS6ZrmCGUR/he5BcRi5GjIPR73TCUe3GvTF0ZYYQKc3a5DaFs8
	snFzhjE3pGd/R8rbA83K3R9LIUZDfO5qAb75FqaMESl3yefV6J2C4cvISwkJOoArJIerAkWbfGqQT
	HpWuShmb1ER9/Gyq7sXqkUKx+qhOQseTELe2rGN6JA+Uo4r7He40RlhMJ9A9E+0ZpAsBVYHMrAGjZ
	22f0XDgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4J-0000000FJEL-1q7z;
	Mon, 13 Apr 2026 08:54:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4H-0000000FJDg-20Kq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kKWzw0F9gxmnGXvNqVP7clmFxg02M0HiQi+0w4fA0i0=; b=BoIFc6/63vLBTGrs2e8zKcuZwy
	36/YBoq4r5nRLBNm6hOPUmM1+eekokSNSBqe81knhu14hzeA1g6dB2WAj9IDwCJmibxzBIfTGGygC
	2MiG+OGJlNAdc8ue32eMCeNkbjzwz9QENO4xSxOi0K1bnM4N7fdKKBq8JRV4Fuf9FXWm5zvpfWFhQ
	1G3mOuIzRt0G16coR0fJ2ijRgRSAtct91TqkCMG43wSbHUwtu+WZfUCHiIBMwDQPFIRHGhwvGy35t
	EKbzLZXKYxmesUq+XqfdS/KPH8lZiV9cludEEkouQFRA18r9n/xxfPOG8V0Rh7xZqQQDfvtInxnYa
	ZLzjOZ5A==;
Received: from [113.46.200.218] (helo=canpmsgout03.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD47-0000000GR5S-01mk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:54:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kKWzw0F9gxmnGXvNqVP7clmFxg02M0HiQi+0w4fA0i0=;
	b=DCtg40KZ+Zy2aQLVKqn2cVPslF43nPZUaEphC8UpP5Apw+g3xMSN8yzV6WZYvKnICwuAWHF4V
	faCtKrLSsJajr2uLAricj1BZflQ2KBptuDEmAmUhKGQbs4MyRd1g12MsydLMnrc3Yzt+RMkAdBT
	e5ZHKT3T8ipK0FlgkcqjAz4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fvLf3690WzpSyb;
	Mon, 13 Apr 2026 16:48:11 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id C51564048F;
	Mon, 13 Apr 2026 16:54:20 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 13 Apr
 2026 16:54:20 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tan.shaopeng@jp.fujitsu.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tglx@kernel.org>, <will@kernel.org>, <hpa@zytor.com>,
	<bp@alien8.de>, <babu.moger@amd.com>, <dave.hansen@linux.intel.com>,
	<mingo@redhat.com>, <tony.luck@intel.com>, <gshan@redhat.com>,
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>
Subject: [PATCH v8 next 10/10] arm_mpam: Add mpam_sync_config() for dynamic rmid expansion
Date: Mon, 13 Apr 2026 16:54:05 +0800
Message-ID: <20260413085405.1166412-11-zengheng4@huawei.com>
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
X-CRM114-CacheID: sfid-20260413_095443_807307_9C739B47 
X-CRM114-Status: GOOD (  16.49  )
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

Add mpam_sync_config() to synchronize configuration when dynamically
expanding rmid resources. When binding a new reqpartid to a control group,
the driver maps the reqpartid to the corresponding intpartid or applies
the control group's existing configuration to new partid if without
Narrow-PARTID feature.

Extend mpam_apply_config() with the 'sync' work mode:
  * Sync mode: mpam_sync_config() calls this to apply existing
    configuration without updating config.
  * Update (non-sync) mode: resctrl_arch_update_one() calls this to
    compare, update, and apply configuration. This mode retains the
    original behavior.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/resctrl/mpam_devices.c  | 23 ++++++++++++++++++-----
 drivers/resctrl/mpam_internal.h |  2 +-
 drivers/resctrl/mpam_resctrl.c  | 29 ++++++++++++++++++++++++++---
 3 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index cf94b45b4f9e..47345b8add3c 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1762,6 +1762,7 @@ struct mpam_write_config_arg {
 	struct mpam_msc_ris *ris;
 	struct mpam_component *comp;
 	u16 partid;
+	bool sync;
 };
 
 static int __write_config(void *arg)
@@ -1770,6 +1771,15 @@ static int __write_config(void *arg)
 	struct mpam_write_config_arg *c = arg;
 	u32 reqpartid;
 
+	if (c->sync) {
+		/* c->partid should be within the range of reqPARTIDs */
+		WARN_ON_ONCE(c->partid < closid_num);
+
+		mpam_reprogram_ris_partid(c->ris, c->partid,
+					 &c->comp->cfg[req2intpartid(c->partid)]);
+		return 0;
+	}
+
 	/* c->partid should be within the range of intPARTIDs */
 	WARN_ON_ONCE(c->partid >= closid_num);
 
@@ -2942,7 +2952,7 @@ static bool mpam_update_config(struct mpam_config *cfg,
 }
 
 int mpam_apply_config(struct mpam_component *comp, u16 partid,
-		      struct mpam_config *cfg)
+		      struct mpam_config *cfg, bool sync)
 {
 	struct mpam_write_config_arg arg;
 	struct mpam_msc_ris *ris;
@@ -2951,14 +2961,17 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
 
 	lockdep_assert_cpus_held();
 
-	/* Don't pass in the current config! */
-	WARN_ON_ONCE(&comp->cfg[partid] == cfg);
+	if (!sync) {
+		/* The partid is within the range of intPARTIDs */
+		WARN_ON_ONCE(partid >= resctrl_arch_get_num_closid(NULL));
 
-	if (!mpam_update_config(&comp->cfg[partid], cfg))
-		return 0;
+		if (!mpam_update_config(&comp->cfg[partid], cfg))
+			return 0;
+	}
 
 	arg.comp = comp;
 	arg.partid = partid;
+	arg.sync = sync;
 
 	guard(srcu)(&mpam_srcu);
 	list_for_each_entry_srcu(vmsc, &comp->vmsc, comp_list,
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 16ce968344d0..90c8f8d16c79 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -464,7 +464,7 @@ void mpam_disable(struct work_struct *work);
 void mpam_reset_class_locked(struct mpam_class *class);
 
 int mpam_apply_config(struct mpam_component *comp, u16 partid,
-		      struct mpam_config *cfg);
+		      struct mpam_config *cfg, bool sync);
 
 int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
 		    enum mpam_device_features, u64 *val);
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 2762462d80e5..5a97a7f18670 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1329,15 +1329,15 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	 */
 	if (mpam_resctrl_hide_cdp(r->rid)) {
 		partid = resctrl_get_config_index(closid, CDP_CODE);
-		err = mpam_apply_config(dom->ctrl_comp, partid, &cfg);
+		err = mpam_apply_config(dom->ctrl_comp, partid, &cfg, false);
 		if (err)
 			return err;
 
 		partid = resctrl_get_config_index(closid, CDP_DATA);
-		return mpam_apply_config(dom->ctrl_comp, partid, &cfg);
+		return mpam_apply_config(dom->ctrl_comp, partid, &cfg, false);
 	}
 
-	return mpam_apply_config(dom->ctrl_comp, partid, &cfg);
+	return mpam_apply_config(dom->ctrl_comp, partid, &cfg, false);
 }
 
 int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
@@ -1718,6 +1718,23 @@ static void update_rmid_entries_for_reqpartid(u32 reqpartid)
 		rmid_entry_reassign_closid(closid, req_pmg2rmid(reqpartid, pmg));
 }
 
+static int mpam_sync_config(u32 reqpartid)
+{
+	struct mpam_component *comp;
+	struct mpam_class *class;
+	int err;
+
+	list_for_each_entry(class, &mpam_classes, classes_list) {
+		list_for_each_entry(comp, &class->components, class_list) {
+			err = mpam_apply_config(comp, reqpartid, NULL, true);
+			if (err)
+				return err;
+		}
+	}
+
+	return 0;
+}
+
 int resctrl_arch_rmid_expand(u32 closid)
 {
 	int i;
@@ -1729,14 +1746,20 @@ int resctrl_arch_rmid_expand(u32 closid)
 		if (reqpartid_map[i] >= resctrl_arch_get_num_closid(NULL)) {
 			if (cdp_enabled) {
 				reqpartid_map[i] = resctrl_get_config_index(closid, CDP_DATA);
+				mpam_sync_config(i);
+
 				/*
 				 * Reqpartids are always allocated in
 				 * pairs, never out-of-bounds access.
 				 */
 				reqpartid_map[i + 1] = resctrl_get_config_index(closid, CDP_CODE);
+				mpam_sync_config(i + 1);
+
 			} else {
 				reqpartid_map[i] = resctrl_get_config_index(closid, CDP_NONE);
+				mpam_sync_config(i);
 			}
+
 			update_rmid_entries_for_reqpartid(i);
 			return i;
 		}
-- 
2.25.1


