Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C2BD374AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtnynvEWy5EVu5W1An2lWqoRRK06b3sMyBZcav3PZhE=; b=u2/Ld5Yrx6kI6WW7jur3GanGYG
	U6p2TJC73TXtsVXWn4hjZs5h1RNNptaICEMOlQfqY+jvhrxCnpwuGt3x8cgD6fdySSTS989kmCirB
	ITkASNbyx+vPWCKq2rMhQhwgLbcxU1XC5ZGyUJWm/Qa9ZR5ntbde3AVQof+Zr92rm3dcKmzMzAy80
	LjF2UcSnaj/6y3otIKBkHIrpE09Z5GriDGeSJzqsnIH3rasZLpU/UOrFgruJ/TZP/TiyZyGQWeRik
	tt+5RDdWeDrvRH2XhKqxOyj/QWPHo7QGO7MMLW1h3byRYEe3DCfKVxOFqLoIFbQUrFjRHcFsHrDda
	g56/QUqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqZ-0000000A5KC-2TYF;
	Fri, 05 Dec 2025 22:00:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqX-0000000A5IE-1ofr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:00:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85CE01A25;
	Fri,  5 Dec 2025 14:00:05 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DC9B3F740;
	Fri,  5 Dec 2025 14:00:08 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 11/38] arm_mpam: resctrl: Implement helpers to update configuration
Date: Fri,  5 Dec 2025 21:58:34 +0000
Message-Id: <20251205215901.17772-12-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_140013_591140_7714AAAA 
X-CRM114-Status: GOOD (  16.53  )
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

resctrl has two helpers for updating the configuration.
resctrl_arch_update_one() updates a single value, and is used by the
software-controller to apply feedback to the bandwidth controls,
it has to be called on one of the CPUs in the resctrl:domain.

resctrl_arch_update_domains() copies multiple staged configurations,
it can be called from anywhere.

Both helpers should update any changes to the underlying hardware.

Imlpement resctrl_arch_update_domains() to use
resctrl_arch_update_one(). Neither need to be called on a specific
CPU as the mpam driver will send IPIs as needed.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 71 ++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index a26eb1f3efd0..ae0d17857b78 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -211,6 +211,77 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	}
 }
 
+int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
+			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
+{
+	u32 partid;
+	struct mpam_config cfg;
+	struct mpam_props *cprops;
+	struct mpam_resctrl_res *res;
+	struct mpam_resctrl_dom *dom;
+
+	lockdep_assert_cpus_held();
+	lockdep_assert_irqs_enabled();
+
+	/*
+	 * No need to check the CPU as mpam_apply_config() doesn't care, and
+	 * resctrl_arch_update_domains() relies on this.
+	 */
+	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
+	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
+	cprops = &res->class->props;
+
+	partid = resctrl_get_config_index(closid, t);
+	if (!r->alloc_capable || partid >= resctrl_arch_get_num_closid(r)) {
+		pr_debug("Not alloc capable or computed PARTID out of range\n");
+		return -EINVAL;
+	}
+
+       /*
+	* Copy the current config to avoid clearing other resources when the
+	* same component is exposed multiple times through resctrl.
+	*/
+	cfg = dom->ctrl_comp->cfg[partid];
+
+	switch (r->rid) {
+	case RDT_RESOURCE_L2:
+	case RDT_RESOURCE_L3:
+		cfg.cpbm = cfg_val;
+		mpam_set_feature(mpam_feat_cpor_part, &cfg);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return mpam_apply_config(dom->ctrl_comp, partid, &cfg);
+}
+
+int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
+{
+	int err = 0;
+	enum resctrl_conf_type t;
+	struct rdt_ctrl_domain *d;
+	struct resctrl_staged_config *cfg;
+
+	lockdep_assert_cpus_held();
+	lockdep_assert_irqs_enabled();
+
+	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
+		for (t = 0; t < CDP_NUM_TYPES; t++) {
+			cfg = &d->staged_config[t];
+			if (!cfg->have_new_ctrl)
+				continue;
+
+			err = resctrl_arch_update_one(r, d, closid, t,
+						      cfg->new_ctrl);
+			if (err)
+				return err;
+		}
+	}
+
+	return err;
+}
+
 void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 {
 	struct mpam_resctrl_res *res;
-- 
2.39.5


